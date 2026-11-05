#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_64 [[user(locn0)]];
    float4 m_66 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_70 [[user(locn4)]];
    float4 m_72 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(1)]];
    float4 m_62 [[attribute(2)]];
    float4 m_60 [[attribute(3)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_56 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1824 = false;
    bool _447 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_44.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_47.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2416 = as_type<float>(_107);
        out.gl_Position.z = _2416;
    }
    if (!_95)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _111 = in.m_49.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_121)
    {
        float _127 = float(_91);
        _101 = _127;
    }
    float _129 = _101;
    bool _131 = _125 >= _129;
    bool _133 = !_121;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_47.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _109 = as_type<int>(_141);
    }
    int _143 = _109;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2485 = as_type<float>(_143);
        out.gl_Position.z = _2485;
    }
    if (_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = in.m_51.x;
    float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _149 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _151 = as_type<float>(int(gl_VertexIndex));
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _165 = _149 * _147;
    float _167 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _169 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].x, _165);
    float _171 = _167 * _163;
    float _173 = floor(_169);
    float _175 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].y, _171);
    float _177 = _169 * 6.283185482025146484375;
    int _179 = as_type<int>(_151) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_151) & 2;
    bool _185 = _183 != 0;
    float _187 = _175 * 6.283185482025146484375;
    float _189 = _177 * 0.15915493667125701904296875;
    float _191 = in.m_49.x;
    float _193 = in.m_49.y;
    float _195 = in.m_49.z;
    float _197 = _187 * 0.15915493667125701904296875;
    float _199 = floor(_175);
    bool _201 = !_181;
    float _203 = _201 ? (-0.5) : 0.5;
    int _205 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _207 = _205 != 0;
    float _209 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _211 = -_173;
    float _213 = _169 + _211;
    float _215 = _189 * 6.283185482025146484375;
    float _217 = cos(_215);
    bool _219 = !_185;
    float _221 = _219 ? (-0.5) : 0.5;
    float _223 = _151;
    float _225 = _209;
    float _227 = _203;
    if (!_161)
    {
        float _229 = _209 * _209;
        float _231 = _229 * 0.5;
        _223 = _231;
    }
    float _233 = _223;
    float _235 = _233;
    if (!_161)
    {
        float _237 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _235 = _237;
    }
    float _239 = _235;
    float _241 = _197 * 6.283185482025146484375;
    float _243 = cos(_241);
    float _245 = -_199;
    float _247 = _175 + _245;
    bool _249 = !_161;
    float _251 = _239;
    if (!_249)
    {
        float _253 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _255 = log2(_253);
        float _257 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _259 = _257 + 1.0;
        float _261 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _263 = _209 * _255;
        float _265 = 1.0 / _259;
        float _267 = _261 * 0.693147182464599609375;
        float _269 = exp2(_263);
        float _271 = 1.0 / _267;
        float _273 = _269 + (-1.0);
        float _275 = -_273;
        float _277 = fma(_275, _271, _209);
        float _279 = _277 * _265;
        float _281 = _279 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _251 = _281;
    }
    float _283 = _251;
    bool _285 = !_161;
    if (!_285)
    {
        float _287 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _289 = log2(_287);
        float _291 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _293 = _291 + 1.0;
        float _295 = 1.0 / _293;
        float _297 = _209 * _289;
        float _299 = exp2(_297);
        float _301 = -_299;
        float _303 = _301 + 1.0;
        float _305 = _303 * _295;
        _225 = _305;
    }
    float _307 = _225;
    float _309 = fma(_217, 0.5, 0.5);
    float _311 = fma(_243, 0.5, 0.5);
    bool _313 = _213 < 0.5;
    float _315 = float(_313);
    float _317 = in.m_56.w;
    int _319 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _321 = _319 != 0;
    int _323 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _325 = _323 != 0;
    float _327 = -_309;
    float _329 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _331 = -_315;
    float _333 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _335 = _283 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _337 = -_213;
    float _339 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _341 = !_321;
    int _343 = _341 ? 0 : 1;
    float _345 = -_247;
    float _347 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _349 = _247 < 0.5;
    float _351 = float(_349);
    float _353 = in.m_44.x;
    float _355 = in.m_44.y;
    float _357 = in.m_44.z;
    float _359 = -_311;
    float _361 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _363 = _283 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _365 = fma(_307, _191, _335);
    int _367 = abs(_343);
    float _369 = -_351;
    float _371 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _373 = !_207;
    int _375 = _373 ? 0 : 1;
    float _377 = fma(_307, _193, _363);
    bool _379 = !_325;
    int _381 = _379 ? 0 : 1;
    float _383 = _283 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _385 = abs(_375);
    float _387 = fma(_307, _195, _383);
    bool _389 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _391 = abs(_381);
    float _393 = float(_367);
    float _395 = float(_385);
    float _397 = abs(_339);
    float _399 = _393 * _397;
    float _401 = abs(_347);
    float _403 = _393 * _401;
    float _405 = fma(_365, _317, _353);
    float _407 = float(_391);
    float _409 = fma(_395, _329, _399);
    float _411 = fma(_395, _361, _403);
    float _413 = fma(_377, _317, _355);
    float _415 = fma(_387, _317, _357);
    float _417 = abs(_333);
    float _419 = fma(_407, _417, _409);
    float _421 = abs(_371);
    float _423 = fma(_407, _421, _411);
    bool _425 = !_389;
    float _443;
    float _445;
    if (!_425)
    {
        float _427 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _429 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _431 = float(_91);
        float _433 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _435 = _433 * _427;
        float _437 = floor(_435);
        float _439 = -_437;
        float _441 = _435 + _439;
        _443 = _441;
        _445 = _431;
        _447 = true;
    }
    else
    {
        float _449 = float(_91);
        float _451 = 1.0 / _449;
        float _453 = _125 * _451;
        _443 = _453;
        _445 = _449;
    }
    _447 = false;
    float _455 = _443;
    float _457 = _445;
    float _459 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _461 = int(_459);
    float _463 = in.m_51.w;
    bool _465 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _467 = isnan(_455);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _479 = int(_477);
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _481;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _485;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _493 = -_475;
    float _495 = _493 + 1.0;
    float _497 = float(_461);
    float _499 = 1.0 / _457;
    float _501 = float(uint(_479));
    float _503 = 1.0 / _497;
    int _505 = ~_479;
    int _507 = _505 + 1;
    int _509 = ~_479;
    int _511 = _509 + 1;
    int _513 = ~_479;
    int _515 = _513 + 1;
    float _517 = 1.0 / _501;
    float _519 = _125 * _503;
    float _521 = 1.0 / _483;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _525 = _523 != 0;
    int _527 = as_type<int>(_517) + (-2);
    float _529 = trunc(_519);
    int _531 = int(_529);
    float _533 = 1.0 / _487;
    float _535 = float(uint(_531));
    float _537 = 1.0 / _491;
    float _539 = as_type<float>(_527) * _535;
    float _541 = trunc(_539);
    float _543 = precise::max(_541, 0.0);
    uint _546 = uint(_543);
    float _548 = float(_531);
    int _550 = _507 * int(_546);
    int _552 = _550 + _531;
    float _554 = float(_479);
    float _556 = float(uint(_552));
    bool _558 = _548 >= _554;
    bool _560 = isnan(_548);
    bool _562 = _558 || _560;
    bool _564 = isnan(_554);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = as_type<float>(_527) * _556;
    float _572 = trunc(_568);
    int _574 = int(_572);
    bool _576 = !_525;
    float _578 = _576 ? 7.345489978790283203125 : 1.0;
    float _580 = _578 * _145;
    float _582 = trunc(_570);
    float _584 = precise::max(_582, 0.0);
    uint _586 = uint(_584);
    float _588 = floor(_580);
    int _590 = int(_546) + int(_586);
    int _592 = _511 * _590;
    int _594 = _592 + _531;
    float _596 = -_588;
    float _598 = _580 + _596;
    int _600 = ~_574;
    int _602 = _600 + 1;
    int _604 = _602 + 1;
    bool _606 = uint(_594) >= uint(_479);
    bool _608 = !_606;
    int _610 = _608 ? 0 : (-1);
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _614 = _612 != 0;
    int _616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _618 = _616 != 0;
    int _620 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _622 = _620 != 0;
    int _624 = ~_590;
    int _626 = _624 + _610;
    int _628 = _626 + 1;
    float _630 = _598 * _554;
    bool _632 = _479 == 0;
    float _634 = _125 * _554;
    int _636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _638 = _636 != 0;
    int _640 = _479 * _628;
    int _642 = _640 + _531;
    int _644 = _479 + (-1);
    float _646 = _634 * _499;
    float _648 = trunc(_630);
    int _650 = int(_648);
    int _652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _654 = _652 != 0;
    bool _656 = !_632;
    int _658 = _656 ? _642 : (-1);
    bool _660 = !_638;
    int _662 = _660 ? 0 : 1;
    int _664 = _658 * _604;
    float _666 = trunc(_646);
    int _668 = int(_666);
    bool _670 = !_618;
    int _672 = _670 ? 0 : 1;
    int _674 = _574 * _644;
    int _676 = _674 + _664;
    bool _678 = !_614;
    int _680 = _678 ? 0 : 1;
    int _682 = abs(_672);
    bool _684 = !_622;
    int _686 = _684 ? 0 : 1;
    int _688 = abs(_680);
    int _690 = _676 * _682;
    bool _692 = !_654;
    int _694 = _692 ? 0 : 1;
    int _696 = abs(_686);
    int _698 = abs(_662);
    int _700 = abs(_694);
    int _702 = _650 * _698;
    int _704 = _702 + _531;
    int _706 = _668 * _688;
    int _708 = _706 + _690;
    int _710 = ~_479;
    int _712 = _710 + 1;
    int _714 = _704 * _696;
    int _716 = _714 + _708;
    int _718 = ~_479;
    int _720 = _718 + 1;
    int _722 = _650 * _700;
    int _724 = _722 + _716;
    int _726 = ~_479;
    int _728 = _726 + 1;
    float _730 = float(uint(_704));
    float _732 = float(uint(_724));
    float _734 = as_type<float>(_527) * _730;
    float _736 = as_type<float>(_527) * _732;
    float _738 = trunc(_734);
    float _740 = precise::max(_738, 0.0);
    uint _742 = uint(_740);
    float _744 = trunc(_736);
    float _746 = precise::max(_744, 0.0);
    uint _748 = uint(_746);
    int _750 = _728 * int(_748);
    int _752 = _750 + _724;
    float _754 = float(uint(_752));
    float _756 = as_type<float>(_527) * _754;
    float _758 = trunc(_756);
    float _760 = precise::max(_758, 0.0);
    uint _762 = uint(_760);
    int _764 = int(_748) + int(_762);
    int _766 = _712 * _764;
    int _768 = _766 + _724;
    int _770 = _720 * int(_742);
    int _772 = _770 + _704;
    bool _774 = uint(_768) >= uint(_479);
    float _776 = float(uint(_772));
    bool _778 = !_774;
    int _780 = _778 ? 0 : (-1);
    int _782 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _784 = _782 != 0;
    float _786 = as_type<float>(_527) * _776;
    int _788 = ~_764;
    int _790 = _788 + _780;
    int _792 = _790 + 1;
    bool _794 = !_784;
    int _796 = _794 ? 0 : 1;
    int _798 = _479 * _792;
    int _800 = _798 + _724;
    int _802 = abs(_796);
    float _804 = trunc(_786);
    float _806 = precise::max(_804, 0.0);
    uint _808 = uint(_806);
    bool _810 = !_632;
    int _812 = _810 ? _800 : (-1);
    int _814 = _812 & 3;
    bool _816 = _814 != 0;
    int _818 = _812 & 3;
    bool _820 = _818 != 0;
    float _822 = in.m_58.x;
    float _824 = in.m_58.y;
    float _826 = in.m_58.z;
    bool _828 = uint(_814) > 1u;
    int _830 = _820 ? 0 : 1;
    bool _832 = uint(_814) >= 2u;
    int _834 = int(_742) + int(_808);
    float _836 = in.m_60.x;
    float _838 = in.m_60.y;
    float _840 = in.m_60.z;
    int _842 = ~_830;
    int _844 = _842 + 1;
    int _846 = _844 + 1;
    bool _848 = _814 != 3;
    int _850 = _515 * _834;
    int _852 = _850 + _704;
    bool _854 = _814 != 3;
    int _856 = _846;
    if (!_828)
    {
        int _858 = ~_830;
        int _860 = _858 + 1;
        _856 = _860;
    }
    int _862 = _856;
    float _864 = in.m_62.x;
    float _866 = in.m_62.y;
    float _868 = in.m_62.z;
    int _870 = _832 ? 0 : 1;
    bool _872 = !_816;
    int _874 = _872 ? 0 : 1;
    int _876 = ~_870;
    int _878 = _876 + 1;
    int _880 = _878 + 1;
    int _882 = _880;
    if (_848)
    {
        int _884 = ~_870;
        int _886 = _884 + 1;
        _882 = _886;
    }
    int _888 = _882;
    bool _890 = !_854;
    int _892 = _890 ? 0 : (-1);
    int _894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _896 = _894 != 0;
    int _898 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _900 = _898 != 0;
    float _902 = _413 * _838;
    int _904 = _812 >> 31;
    int _906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _908 = _906 != 0;
    int _910 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _912 = _910 != 0;
    float _914 = _413 * _824;
    bool _916 = uint(_852) >= uint(_479);
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _920 = _918 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    int _922 = _904 & 3;
    float _924 = fma(_405, _822, _914);
    float _926 = _413 * _866;
    bool _928 = !_916;
    int _930 = _928 ? 0 : (-1);
    float _932 = 1.0 / _920;
    int _934 = _812 + _922;
    float _936 = fma(_405, _864, _926);
    bool _938 = _463 > 0.5;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _942 = _455 + _940;
    int _944 = _934 >> 2;
    float _946 = fma(_405, _836, _902);
    float _948 = _942 * _521;
    int _950 = _944 << 4;
    int _952 = _950 + 368;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _956 = _455 + _954;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _960 = _455 + _958;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _962;
    uint _966 = uint(int(uint(_952) >> uint(2)));
    uint _968 = uint(int(uint(int(_966)) >> uint(2)));
    int _970 = int(_966) & 3;
    float _972 = (*spvDescriptorSet0.vp_c9)._m0[int(_968)][_970];
    int _974 = int(_966) + 1;
    uint _976 = uint(int(uint(_974) >> uint(2)));
    int _978 = _974 & 3;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[int(_976)][_978];
    float _982 = _956 * _533;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _986 = _455 + _984;
    float _988 = _960 * _537;
    float _990 = 1.0 / _964;
    float _992 = _986 * _932;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _994;
    int _998 = _952 + 8;
    uint _1000 = uint(int(uint(_998) >> uint(2)));
    uint _1002 = uint(int(uint(int(_1000)) >> uint(2)));
    int _1004 = int(_1000) & 3;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[int(_1002)][_1004];
    int _1008 = int(_1000) + 1;
    uint _1010 = uint(int(uint(_1008) >> uint(2)));
    int _1012 = _1008 & 3;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[int(_1010)][_1012];
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1018 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1016;
    float _1020 = fma(_996, _948, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1024 = _455 + _1022;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1030 = fma(_1018, _948, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1034 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1032;
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1038 = _1036 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1040 = fma(_1028, _988, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _1042 = abs(_862);
    float _1044 = _1024 * _990;
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1046;
    bool _1050 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _1052 = isnan(_455);
    bool _1054 = _1050 || _1052;
    bool _1056 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _1058 = _1054 || _1056;
    float _1060 = float(_1058);
    float _1062 = fma(_1034, _982, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1064 = fma(_1038, _988, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1066 = fma(_1048, _982, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _1068 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _1070 = isnan(_455);
    bool _1072 = _1068 || _1070;
    bool _1074 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _1076 = _1072 || _1074;
    float _1078 = float(_1076);
    float _1080 = -_1060;
    float _1082 = _1080 + 1.0;
    bool _1084 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1086 = isnan(_455);
    bool _1088 = _1084 || _1086;
    bool _1090 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1092 = _1088 || _1090;
    float _1094 = float(_1092);
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1098 = _1096 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    int _1100 = abs(_888);
    float _1102 = _1078 * _1082;
    float _1104 = -_1078;
    float _1106 = _1104 + 1.0;
    bool _1108 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1110 = isnan(_455);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1116 = _1112 || _1114;
    float _1118 = float(_1116);
    float _1120 = fma(_1098, _992, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    int _1122 = ~_834;
    int _1124 = _1122 + _930;
    int _1126 = _1124 + 1;
    float _1128 = _475 * _1106;
    bool _1130 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1132 = isnan(_455);
    bool _1134 = _1130 || _1132;
    bool _1136 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1138 = _1134 || _1136;
    float _1140 = float(_1138);
    float _1142 = _1118 * _495;
    int _1144 = abs(_874);
    int _1146 = _479 * _1126;
    int _1148 = _1146 + _704;
    float _1150 = -_1118;
    float _1152 = _1150 + 1.0;
    int _1154 = ~_1144;
    int _1156 = _1154 + 1;
    int _1158 = _1156 + 1;
    float _1160 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1162 = int(_1160);
    int _1164 = ~_1042;
    int _1166 = _1164 + 1;
    int _1168 = _1166 + 1;
    float _1170 = _1094 * _1152;
    float _1172 = -_1094;
    float _1174 = _1172 + 1.0;
    int _1176 = abs(_892);
    int _1178 = _1168 * as_type<int>(_980);
    bool _1180 = !_632;
    int _1182 = _1180 ? _1148 : (-1);
    float _1184 = _1140 * _1174;
    float _1186 = -_1140;
    float _1188 = _1186 + 1.0;
    int _1190 = _1158 * as_type<int>(_972);
    int _1192 = _1190 + _1178;
    int _1194 = ~_1100;
    int _1196 = _1194 + 1;
    int _1198 = _1196 + 1;
    float _1200 = _1020 * _1184;
    float _1202 = _1030 * _1184;
    int _1204 = _1198 * as_type<int>(_1006);
    int _1206 = _1204 + _1192;
    float _1208 = float(uint(_1162));
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _1212 = _1210 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    int _1214 = ~_1176;
    int _1216 = _1214 + 1;
    int _1218 = _1216 + 1;
    float _1220 = fma(_415, _826, _924);
    float _1222 = fma(_1212, _992, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    int _1224 = abs(_1162);
    float _1226 = 1.0 / _1208;
    int _1228 = ~_802;
    int _1230 = _1228 + 1;
    int _1232 = _1230 + 1;
    int _1234 = _1218 * as_type<int>(_1014);
    int _1236 = _1234 + _1206;
    float _1238 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1200);
    float _1240 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1202);
    int _1242 = _1236 * _1232;
    float _1244 = float(uint(_1224));
    float _1246 = fma(_1040, _1170, _1238);
    float _1248 = fma(_1064, _1170, _1240);
    int _1250 = _1182 * _802;
    int _1252 = _1250 + _1242;
    float _1254 = fma(_415, _840, _946);
    float _1256 = 1.0 / _1244;
    float _1258 = fma(_1062, _1142, _1246);
    float _1260 = fma(_1066, _1142, _1248);
    float _1262 = float(uint(_1252));
    float _1264 = in.m_56.x;
    float _1266 = in.m_56.y;
    int _1268 = as_type<int>(_1226) + (-2);
    float _1270 = fma(_1120, _1128, _1258);
    float _1272 = fma(_1222, _1128, _1260);
    int _1274 = abs(_1252);
    float _1276 = as_type<float>(_1268) * _1262;
    float _1278 = _1220 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _1280;
    float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1286 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _1284;
    int _1288 = ~_1162;
    int _1290 = _1288 + 1;
    float _1292 = _1254 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1294 = trunc(_1276);
    float _1296 = precise::max(_1294, 0.0);
    uint _1298 = uint(_1296);
    float _1300 = fma(_1282, _1044, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    int _1302 = as_type<int>(_1256) + (-2);
    float _1304 = fma(_1286, _1044, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _1306 = float(uint(_1274));
    float _1308 = fma(_1300, _1102, _1270);
    int _1310 = ~_1224;
    int _1312 = _1310 + 1;
    float _1314 = fma(_1304, _1102, _1272);
    float _1316 = as_type<float>(_1302) * _1306;
    float _1318 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[148].x, _1308);
    float _1320 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[148].y, _1314);
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1324 = ~_1224;
    int _1326 = _1324 + 1;
    float _1328 = trunc(_1316);
    float _1330 = precise::max(_1328, 0.0);
    uint _1332 = uint(_1330);
    float _1334 = _1318 * _1264;
    int _1336 = _1290 * int(_1298);
    int _1338 = _1336 + _1252;
    float _1340 = _145 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1342 = _1320 * _1266;
    float _1344 = _419 * _1334;
    float _1346 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _203);
    float _1348 = float(uint(_1338));
    float _1350 = -_1322;
    float _1352 = fma(_1340, 2.0, _1350);
    float _1354 = _423 * _1342;
    float _1356 = _1344 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1358 = as_type<float>(_1268) * _1348;
    float _1360 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _221);
    float _1362 = _1354 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1364 = _1356 * _1346;
    int _1366 = _1326 * int(_1332);
    int _1368 = _1366 + _1274;
    float _1370 = fma(_415, _868, _936);
    float _1372 = trunc(_1358);
    float _1374 = precise::max(_1372, 0.0);
    uint _1376 = uint(_1374);
    float _1378 = _1362 * _1360;
    float _1380 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1382 = float(uint(_1368));
    float _1384 = _1370 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1386 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1388 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1390 = as_type<float>(_1302) * _1382;
    float _1392 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1386);
    float _1394 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1388);
    float _1396 = in.m_51.y;
    float _1398 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1392);
    float _1400 = trunc(_1390);
    float _1402 = precise::max(_1400, 0.0);
    uint _1404 = uint(_1402);
    float _1406 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1394);
    int _1408 = int(_1298) + int(_1376);
    float _1410 = _1398 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1412 = ~_1162;
    int _1414 = _1412 + 1;
    float _1416 = _1406 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1418 = _1278 + _1410;
    float _1420 = _1292 + _1416;
    float _1422 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1424 = _1418 + _1422;
    int _1426 = _1414 * _1408;
    int _1428 = _1426 + _1252;
    float _1430 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1432 = _1420 + _1430;
    float _1434 = _1424 * _1424;
    int _1436 = int(_1332) + int(_1404);
    float _1438 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1440 = _1432 * _1432;
    bool _1442 = uint(_1428) >= uint(_1162);
    int _1444 = _1312 * _1436;
    int _1446 = _1444 + _1274;
    float _1448 = _1434 + _1440;
    bool _1450 = !_1442;
    int _1452 = _1450 ? 0 : (-1);
    float _1454 = _1396 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1456 = sqrt(_1448);
    bool _1458 = uint(_1446) >= uint(_1224);
    float _1460 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1462 = ~_1408;
    int _1464 = _1462 + _1452;
    int _1466 = _1464 + 1;
    float _1468 = fma(_1454, -2.0, _1438);
    bool _1470 = !_1458;
    int _1472 = _1470 ? 0 : (-1);
    float _1474 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1460);
    bool _1476 = _145 > 0.5;
    int _1478 = _1162 * _1466;
    int _1480 = _1478 + _1252;
    float _1482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1484 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1474);
    float _1486 = -_203;
    int _1488 = _1476 ? as_type<int>(_1486) : as_type<int>(_203);
    float _1490 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1492 = _1162 == 0;
    float _1494 = _1484 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1496 = _1252 ^ _1162;
    bool _1498 = !_1492;
    int _1500 = _1498 ? _1480 : (-1);
    float _1502 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1504 = _1456 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1506 = _1384 + _1494;
    bool _1508 = !_896;
    float _1510 = _1508 ? _203 : as_type<float>(_1488);
    float _1512 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    uint _1514 = uint(int(uint(_1496) >> uint(31)));
    bool _1516 = _1162 == 0;
    float _1518 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1520 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1522 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1524 = ~_1472;
    int _1526 = _1436 + _1524;
    int _1528 = _1526 + 1;
    float _1530 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1518);
    int _1532 = ~int(_1514);
    int _1534 = _1532 + 1;
    float _1536 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1520);
    float _1538 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1522);
    float _1540 = _1512;
    float _1542 = _1494;
    float _1544 = _1418;
    float _1546 = _1522;
    float _1548 = _1128;
    float _1550 = _1396;
    if (!_1504)
    {
        _1540 = _1418;
    }
    float _1552 = _1540;
    float _1554 = _1552;
    if (!_1504)
    {
        _227 = _1440;
    }
    float _1556 = _227;
    float _1558 = _1556;
    if (!_1504)
    {
        _1542 = _1434;
    }
    float _1560 = _1542;
    float _1562 = _1560;
    if (!_1504)
    {
        _1544 = _1420;
    }
    float _1564 = _1544;
    int _1566 = _1528 ^ _1534;
    float _1568 = _1564;
    if (!_1504)
    {
        _1546 = _1506;
    }
    float _1570 = _1546;
    bool _1572 = !_1504;
    float _1574 = _1570;
    if (!_1572)
    {
        float _1576 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1578 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1580 = _1456 + _1578;
        float _1582 = rsqrt(_1448);
        float _1584 = _1580 * _1576;
        float _1586 = _1506 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1588 = _1584 * 0.15915493667125701904296875;
        float _1590 = _1588 * 6.283185482025146484375;
        float _1592 = sin(_1590);
        float _1594 = _1588 * 6.283185482025146484375;
        float _1596 = cos(_1594);
        float _1598 = fma(_1592, _1586, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1600 = _1582 * _1598;
        float _1602 = _1596 + (-1.0);
        float _1604 = fma(_1424, _1600, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1606 = fma(_1432, _1600, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1608 = _1602 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1610 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1612 = _1604 + _1610;
        float _1614 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1616 = _1606 + _1614;
        float _1618 = fma(_1506, _1596, _1608);
        float _1620 = _1612 * _1612;
        float _1622 = _1616 * _1616;
        _1574 = _1618;
        _1562 = _1620;
        _1558 = _1622;
        _1554 = _1604;
        _1568 = _1606;
    }
    float _1624 = _1574;
    float _1626 = _1562;
    float _1628 = _1558;
    float _1630 = _1554;
    float _1632 = _1568;
    int _1634 = ~_1534;
    int _1636 = _1634 + _1566;
    int _1638 = _1636 + 1;
    float _1640 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1642 = _1624 + _1640;
    float _1644 = float(_1500);
    float _1646 = _1502 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1648 = !_1516;
    int _1650 = _1648 ? _1638 : (-1);
    float _1652 = fma(_1642, _1642, _1626);
    float _1654 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1468);
    float _1656 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1658 = float(_1650);
    float _1660 = -_125;
    float _1662 = fma(_1660, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1352);
    float _1664 = _1652 + _1628;
    float _1666 = _1510 + 0.5;
    float _1668 = -_1654;
    float _1670 = fma(_1646, _1658, _1668);
    float _1672 = fma(_1656, _1644, _1662);
    float _1674 = sqrt(_1664);
    float _1676 = fma(_1656, _1666, _1672);
    float _1678 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1680 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1682 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1686 = _1396 > 0.5;
    float _1688 = _1678 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1690 = _1680 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1692 = _1682 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1694 = in.m_51.z;
    float _1696 = -_221;
    int _1698 = _1686 ? as_type<int>(_1696) : as_type<int>(_221);
    float _1700 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1702 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    out.m_64.x = _1688;
    out.m_64.y = _1690;
    out.m_64.z = _1692;
    out.m_64.w = _1684;
    bool _1704 = !_900;
    float _1706 = _1704 ? _221 : as_type<float>(_1698);
    float _1708 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1700);
    float _1710 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1702);
    float _1712 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1714 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1708);
    float _1716 = _1706 + (-0.5);
    float _1718 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1710);
    bool _1720 = _1674 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1722 = isnan(_1674);
    bool _1724 = _1720 || _1722;
    bool _1726 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1728 = _1724 || _1726;
    float _1730 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1736 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1738 = -_1714;
    float _1740 = _1738 + 1.0;
    float _1742 = -_1646;
    float _1744 = fma(_1742, _1716, _1670);
    float _1746 = -_1718;
    float _1748 = _1746 + 1.0;
    float _1750 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1752 = _1732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1754 = _1734 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1756 = _1736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1758 = -_1740;
    float _1760 = fma(_1510, _1758, _1676);
    float _1762 = fma(_1706, _1748, _1744);
    out.m_66.x = _1752;
    out.m_66.y = _1754;
    out.m_66.z = _1756;
    out.m_66.w = _1750;
    float _1764 = _1712 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1766 = _1730 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1768 = (*spvDescriptorSet0.vp_c9)._m0[81].z + (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1770 = (*spvDescriptorSet0.vp_c9)._m0[81].w + (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1772 = _1694 > 0.5;
    float _1774 = _1530 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1776 = _1536 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[83].x + (*spvDescriptorSet0.vp_c9)._m0[83].z;
    float _1780 = (*spvDescriptorSet0.vp_c9)._m0[83].y + (*spvDescriptorSet0.vp_c9)._m0[83].w;
    float _1782 = _1538 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1784 = _1750;
    float _1786 = _1684;
    float _1788 = _1694;
    if (!_1728)
    {
        _1784 = 1.0;
    }
    float _1790 = _1784;
    bool _1792 = !_1728;
    float _1794 = _1790;
    if (!_1792)
    {
        bool _1796 = _1674 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1798 = isnan(_1674);
        bool _1800 = _1796 || _1798;
        bool _1802 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1804 = _1800 || _1802;
        if (!_1804)
        {
            float _1806 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1808 = _1674 + _1806;
            float _1810 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1812 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1810;
            float _1814 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1816 = _1814 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1818 = 1.0 / _1812;
            float _1820 = _1808 * _1818;
            float _1822 = fma(_1820, _1816, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1794 = _1822;
            _1824 = true;
        }
        else
        {
            bool _1826 = _1674 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1828 = isnan(_1674);
            bool _1830 = _1826 || _1828;
            bool _1832 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1834 = _1830 || _1832;
            if (!_1834)
            {
                float _1836 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1838 = _1674 + _1836;
                float _1840 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1842 = _1840 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1844 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1846 = _1844 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1848 = 1.0 / _1842;
                float _1850 = _1838 * _1848;
                float _1852 = fma(_1850, _1846, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1794 = _1852;
                _1824 = true;
            }
            else
            {
                _1794 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1824 = false;
    float _1854 = _1794;
    float _1856 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1858 = _1624 + _1856;
    float _1860 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1862 = _1630 + _1860;
    float _1864 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1866 = _1632 + _1864;
    float _1868 = fma(_1858, _1854, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1870 = fma(_1862, _1854, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1872 = fma(_1866, _1854, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1874 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1876 = _1868 + _1874;
    float _1878 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1880 = _1870 + _1878;
    float _1882 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1884 = _1872 + _1882;
    float _1886 = _1876 * _1876;
    float _1888 = fma(_1880, _1880, _1886);
    float _1890 = fma(_1884, _1884, _1888);
    float _1892 = rsqrt(_1890);
    float _1894 = _1892 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1896 = _1880 * _1894;
    float _1898 = _1884 * _1894;
    float _1900 = _1896 * _1896;
    float _1902 = _1898 * _1898;
    float _1904 = _1900 + _1902;
    float _1906 = sqrt(_1904);
    bool _1908 = _1906 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1910 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1912 = _1906 + _1910;
    float _1914 = _1884;
    float _1916 = _1904;
    float _1918 = _1912;
    float _1920 = _1876;
    float _1922 = _1896;
    if (_1908)
    {
        float _1924 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1914 = _1924;
    }
    float _1926 = _1914;
    if (_1908)
    {
        float _1928 = rsqrt(_1904);
        _1916 = _1928;
    }
    float _1930 = _1916;
    if (_1908)
    {
        float _1932 = _1912 * _1926;
        _1918 = _1932;
    }
    float _1934 = _1918;
    if (_1908)
    {
        float _1936 = _1934 * 0.15915493667125701904296875;
        _1786 = _1936;
    }
    float _1938 = _1786;
    float _1940 = _1892;
    float _1942 = _1938;
    if (_1908)
    {
        float _1944 = _1938 * 6.283185482025146484375;
        float _1946 = sin(_1944);
        _1940 = _1946;
    }
    float _1948 = _1940;
    float _1950 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1952 = precise::max(0.0, _1950);
    float _1954 = _1926;
    float _1956 = _1952;
    if (_1908)
    {
        float _1958 = _1938 * 6.283185482025146484375;
        float _1960 = cos(_1958);
        _1954 = _1960;
    }
    float _1962 = _1954;
    float _1964 = -_1894;
    float _1966 = -_1952;
    float _1968 = fma(_1876, _1964, _1966);
    if (_1908)
    {
        float _1970 = _1968 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1920 = _1970;
    }
    float _1972 = _1920;
    float _1974 = _1948;
    float _1976 = _1972;
    if (_1908)
    {
        float _1978 = fma(_1948, _1972, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1974 = _1978;
    }
    float _1980 = _1974;
    float _1982 = _1980;
    if (!_1908)
    {
        _1976 = _1968;
    }
    float _1984 = _1976;
    float _1986 = _1984;
    float _1988 = _1962;
    if (_1908)
    {
        float _1990 = _1962 + (-1.0);
        _1956 = _1990;
    }
    float _1992 = _1956;
    float _1994 = _1992;
    if (_1908)
    {
        float _1996 = _1930 * _1980;
        _1548 = _1996;
    }
    float _1998 = _1548;
    if (!_1908)
    {
        _1982 = _1898;
    }
    float _2000 = _1982;
    float _2002 = sqrt(_1890);
    float _2004 = _2000;
    if (_1908)
    {
        float _2006 = _1992 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1942 = _2006;
    }
    float _2008 = _1942;
    if (_1908)
    {
        float _2010 = _1896 * _1998;
        _1922 = _2010;
    }
    float _2012 = _1922;
    if (!_1908)
    {
        _1994 = _1900;
    }
    float _2014 = _1994;
    float _2016 = _2014;
    if (_1908)
    {
        float _2018 = _1898 * _1998;
        _2004 = _2018;
    }
    float _2020 = _2004;
    if (_1908)
    {
        float _2022 = fma(_1968, _1962, _2008);
        _1986 = _2022;
    }
    float _2024 = _1986;
    if (_1908)
    {
        float _2026 = _2012 * _2012;
        _2016 = _2026;
    }
    float _2028 = _2016;
    if (!_1908)
    {
        _1988 = _1902;
    }
    float _2030 = _1988;
    float _2032 = _2030;
    if (_1908)
    {
        float _2034 = _2020 * _2020;
        _2032 = _2034;
    }
    float _2036 = _2032;
    float _2038 = fma(_2024, _2024, _2028);
    float _2040 = _1868 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2042 = _2038 + _2036;
    float _2044 = _1868 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2046 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2048 = fma(_2002, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2046);
    float _2050 = precise::clamp(_2048, 0.0, 1.0);
    float _2052 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2054 = rsqrt(_2042);
    float _2056 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2044);
    float _2058 = _1868 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2060 = -_2050;
    float _2062 = _2060 + 1.0;
    float _2064 = _1868 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2066 = fma(_1872, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2056);
    float _2068 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2058);
    float _2070 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2064);
    float _2072 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2040);
    float _2074 = fma(_1872, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2068);
    float _2076 = _2066 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2078 = fma(_1872, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2070);
    float _2080 = abs(_2062);
    float _2082 = log2(_2080);
    float _2084 = _2074 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2086 = _2076 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2088 = _2054 * _2012;
    float _2090 = _2078 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2092 = _2084 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2094 = _2054 * _2024;
    float _2096 = _2088 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2098 = fma(_1872, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2072);
    float _2100 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2092);
    float _2102 = _2054 * _2020;
    float _2104 = -_2096;
    float _2106 = fma(_2094, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2104);
    float _2108 = -_2086;
    float _2110 = fma(_2108, _2052, 1.0);
    float _2112 = _2098 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2114 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2100);
    float _2116 = -_2102;
    float _2118 = fma(_2116, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2106);
    float _2120 = _2082 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2122 = _2084 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2124 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2114);
    float _2126 = fma(_2118, -0.5, 0.5);
    float _2128 = log2(_2110);
    float _2130 = _2084 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2132 = fma(_2118, 0.5, 0.5);
    float _2134 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2122);
    float _2136 = _2094 + 1.0;
    float _2138 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2130);
    float _2140 = fma(_2132, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2142 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2134);
    float _2144 = 1.0 / _2124;
    float _2146 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2138);
    float _2148 = fma(_2132, _2140, -0.212114393711090087890625);
    float _2150 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2142);
    float _2152 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2146);
    float _2154 = fma(_2132, _2148, 1.570728778839111328125);
    float _2156 = exp2(_2120);
    float _2158 = _2128 * 0.693147182464599609375;
    float _2160 = _2158 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2162 = sqrt(_2126);
    float _2164 = _2150 * _2144;
    float _2166 = _2152 * _2144;
    float _2168 = fma(_2164, 0.5, 0.5);
    float _2170 = fma(_2166, -0.5, 0.5);
    float _2172 = -_2094;
    float _2174 = fma(_2156, _2136, _2172);
    float3 _5601 = float3(_2168, _2170, _2160);
    float _2176 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5601, float3(0.0), isnan(_5601)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5601, float3(0.0), isnan(_5601)), level(0.0)).x;
    float _2178 = fma(_2174, 0.5, 0.5);
    float _2180 = _2162 * 0.636619746685028076171875;
    float _2182 = -_2154;
    float _2184 = fma(_2180, _2182, 1.0);
    float3 _5622 = float3(_2168, _2170, _2160);
    float4 _2187 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5622, float3(0.0), isnan(_5622)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5622, float3(0.0), isnan(_5622)), level(0.0)).xyzw;
    float _2189 = _2187.x;
    float _2191 = _2187.y;
    float _2193 = _2187.z;
    float _2195 = _2187.w;
    float2 _5639 = float2(_2184, _2178);
    float3 _2199 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5639, float2(0.0), isnan(_5639)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5639, float2(0.0), isnan(_5639)), level(0.0)).xyz;
    float _2201 = _2199.x;
    float _2203 = _2199.y;
    float _2205 = _2199.z;
    float _2207 = _1776 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2209 = _1776 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2211 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2207);
    float _2213 = _1776 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2215 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2209);
    float _2217 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2211);
    float _2219 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2213);
    float _2221 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2215);
    float _2223 = _2215;
    if (!_525)
    {
        _2223 = _1694;
    }
    float _2225 = _2223;
    float _2227 = _2217 * _2217;
    float _2229 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2219);
    float _2231 = _2225;
    if (_525)
    {
        _1788 = _1396;
    }
    float _2233 = _1788;
    float _2235 = fma(_2221, _2221, _2227);
    if (_525)
    {
        _2231 = _1396;
    }
    float _2237 = _2231;
    float _2239 = fma(_2233, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1780);
    float _2241 = fma(_2229, _2229, _2235);
    if (_525)
    {
        _1550 = _145;
    }
    float _2243 = _1550;
    float _2245 = _2084 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2247 = _2237 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2249 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2239);
    float _2251 = rsqrt(_2241);
    float _2253 = _2243 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2255 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2245);
    float _2257 = fma(_2243, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1778);
    float _2259 = fma(_2247, -2.0, _1770);
    float _2261 = -_1768;
    float _2263 = fma(_2253, 2.0, _2261);
    float _2265 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2255);
    float _2267 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2257);
    float _2269 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2259);
    float _2271 = -_2249;
    float _2273 = _2271 + 1.0;
    float _2275 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2265);
    float _2277 = -_2267;
    float _2279 = _2277 + 1.0;
    float _2281 = _2221 * _2251;
    float _2283 = _2217 * _2251;
    float _2285 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2287 = fma(_2281, 0.5, 0.5);
    float _2289 = _2082 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2291 = fma(_2283, -0.5, 0.5);
    float _2293 = -_125;
    float _2295 = fma(_2293, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2263);
    float _2297 = _2275 + _2124;
    float _2299 = _2287;
    float _2301 = _2291;
    if (_908)
    {
        float _2303 = -_2287;
        float _2305 = _1772 ? _2303 : _2287;
        _2299 = _2305;
    }
    float _2307 = _2299;
    out.m_47.x = _2285;
    float _2309 = exp2(_2289);
    if (_912)
    {
        float _2311 = -_2291;
        float _2313 = _938 ? _2311 : _2291;
        _2301 = _2313;
    }
    float _2315 = _2301;
    float _2317 = _2307 + 0.5;
    float _2319 = fma(_1764, _2317, _2295);
    float _2321 = _2315 + (-0.5);
    float _2323 = -_2279;
    float _2325 = fma(_2323, _2307, _2319);
    float _2327 = -_1766;
    float _2329 = -_2269;
    float _2331 = fma(_2327, _2321, _2329);
    float _2333 = _2297 * 0.5;
    float _2335 = -_2309;
    float _2337 = _2335 + 1.0;
    float _2339 = fma(_2273, _2315, _2331);
    out.m_68.z = _2333;
    out.m_68.w = _2124;
    float _2341 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2150;
    out.gl_Position.y = _2152;
    out.gl_Position.z = _2275;
    out.gl_Position.w = _2124;
    out.m_70.x = _1760;
    out.m_70.y = _1762;
    out.m_70.z = _2325;
    out.m_70.w = _2339;
    float _2343 = _2341 * _2176;
    float _2345 = -_2341;
    float _2347 = _2345 + 1.0;
    float _2349 = _2195 * _2343;
    float _2351 = _2195 * _2347;
    float _2353 = _2205 * _2343;
    float _2355 = fma(_2201, _2349, _2189);
    float _2357 = fma(_2203, _2349, _2191);
    float _2359 = fma(_2195, _2353, _2193);
    out.m_72.x = _2355;
    out.m_72.y = _2357;
    out.m_72.z = _2359;
    out.m_72.w = _2351;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1824 = false;
    bool _447 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_44.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_47.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2416 = as_type<float>(_107);
        out.gl_Position.z = _2416;
    }
    if (!_95)
    {
        return out;
    }
    float _111 = in.m_49.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_121)
    {
        float _127 = float(_91);
        _101 = _127;
    }
    float _129 = _101;
    bool _131 = _125 >= _129;
    bool _133 = !_121;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_47.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _109 = as_type<int>(_141);
    }
    int _143 = _109;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2485 = as_type<float>(_143);
        out.gl_Position.z = _2485;
    }
    if (_135)
    {
        return out;
    }
    float _145 = in.m_51.x;
    float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _149 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _151 = as_type<float>(int(gl_VertexIndex));
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _165 = _149 * _147;
    float _167 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _169 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].x, _165);
    float _171 = _167 * _163;
    float _173 = floor(_169);
    float _175 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].y, _171);
    float _177 = _169 * 6.283185482025146484375;
    int _179 = as_type<int>(_151) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_151) & 2;
    bool _185 = _183 != 0;
    float _187 = _175 * 6.283185482025146484375;
    float _189 = _177 * 0.15915493667125701904296875;
    float _191 = in.m_49.x;
    float _193 = in.m_49.y;
    float _195 = in.m_49.z;
    float _197 = _187 * 0.15915493667125701904296875;
    float _199 = floor(_175);
    bool _201 = !_181;
    float _203 = _201 ? (-0.5) : 0.5;
    int _205 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _207 = _205 != 0;
    float _209 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _211 = -_173;
    float _213 = _169 + _211;
    float _215 = _189 * 6.283185482025146484375;
    float _217 = cos(_215);
    bool _219 = !_185;
    float _221 = _219 ? (-0.5) : 0.5;
    float _223 = _151;
    float _225 = _209;
    float _227 = _203;
    if (!_161)
    {
        float _229 = _209 * _209;
        float _231 = _229 * 0.5;
        _223 = _231;
    }
    float _233 = _223;
    float _235 = _233;
    if (!_161)
    {
        float _237 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _235 = _237;
    }
    float _239 = _235;
    float _241 = _197 * 6.283185482025146484375;
    float _243 = cos(_241);
    float _245 = -_199;
    float _247 = _175 + _245;
    bool _249 = !_161;
    float _251 = _239;
    if (!_249)
    {
        float _253 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _255 = log2(_253);
        float _257 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _259 = _257 + 1.0;
        float _261 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _263 = _209 * _255;
        float _265 = 1.0 / _259;
        float _267 = _261 * 0.693147182464599609375;
        float _269 = exp2(_263);
        float _271 = 1.0 / _267;
        float _273 = _269 + (-1.0);
        float _275 = -_273;
        float _277 = fma(_275, _271, _209);
        float _279 = _277 * _265;
        float _281 = _279 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _251 = _281;
    }
    float _283 = _251;
    bool _285 = !_161;
    if (!_285)
    {
        float _287 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _289 = log2(_287);
        float _291 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _293 = _291 + 1.0;
        float _295 = 1.0 / _293;
        float _297 = _209 * _289;
        float _299 = exp2(_297);
        float _301 = -_299;
        float _303 = _301 + 1.0;
        float _305 = _303 * _295;
        _225 = _305;
    }
    float _307 = _225;
    float _309 = fma(_217, 0.5, 0.5);
    float _311 = fma(_243, 0.5, 0.5);
    bool _313 = _213 < 0.5;
    float _315 = float(_313);
    float _317 = in.m_56.w;
    int _319 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _321 = _319 != 0;
    int _323 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _325 = _323 != 0;
    float _327 = -_309;
    float _329 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _331 = -_315;
    float _333 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _335 = _283 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _337 = -_213;
    float _339 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _341 = !_321;
    int _343 = _341 ? 0 : 1;
    float _345 = -_247;
    float _347 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _349 = _247 < 0.5;
    float _351 = float(_349);
    float _353 = in.m_44.x;
    float _355 = in.m_44.y;
    float _357 = in.m_44.z;
    float _359 = -_311;
    float _361 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _363 = _283 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _365 = fma(_307, _191, _335);
    int _367 = abs(_343);
    float _369 = -_351;
    float _371 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _373 = !_207;
    int _375 = _373 ? 0 : 1;
    float _377 = fma(_307, _193, _363);
    bool _379 = !_325;
    int _381 = _379 ? 0 : 1;
    float _383 = _283 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _385 = abs(_375);
    float _387 = fma(_307, _195, _383);
    bool _389 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _391 = abs(_381);
    float _393 = float(_367);
    float _395 = float(_385);
    float _397 = abs(_339);
    float _399 = _393 * _397;
    float _401 = abs(_347);
    float _403 = _393 * _401;
    float _405 = fma(_365, _317, _353);
    float _407 = float(_391);
    float _409 = fma(_395, _329, _399);
    float _411 = fma(_395, _361, _403);
    float _413 = fma(_377, _317, _355);
    float _415 = fma(_387, _317, _357);
    float _417 = abs(_333);
    float _419 = fma(_407, _417, _409);
    float _421 = abs(_371);
    float _423 = fma(_407, _421, _411);
    bool _425 = !_389;
    float _443;
    float _445;
    if (!_425)
    {
        float _427 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _429 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _431 = float(_91);
        float _433 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _435 = _433 * _427;
        float _437 = floor(_435);
        float _439 = -_437;
        float _441 = _435 + _439;
        _443 = _441;
        _445 = _431;
        _447 = true;
    }
    else
    {
        float _449 = float(_91);
        float _451 = 1.0 / _449;
        float _453 = _125 * _451;
        _443 = _453;
        _445 = _449;
    }
    _447 = false;
    float _455 = _443;
    float _457 = _445;
    float _459 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _461 = int(_459);
    float _463 = in.m_51.w;
    bool _465 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _467 = isnan(_455);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _479 = int(_477);
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _481;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _485;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _493 = -_475;
    float _495 = _493 + 1.0;
    float _497 = float(_461);
    float _499 = 1.0 / _457;
    float _501 = float(uint(_479));
    float _503 = 1.0 / _497;
    int _505 = ~_479;
    int _507 = _505 + 1;
    int _509 = ~_479;
    int _511 = _509 + 1;
    int _513 = ~_479;
    int _515 = _513 + 1;
    float _517 = 1.0 / _501;
    float _519 = _125 * _503;
    float _521 = 1.0 / _483;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _525 = _523 != 0;
    int _527 = as_type<int>(_517) + (-2);
    float _529 = trunc(_519);
    int _531 = int(_529);
    float _533 = 1.0 / _487;
    float _535 = float(uint(_531));
    float _537 = 1.0 / _491;
    float _539 = as_type<float>(_527) * _535;
    float _541 = trunc(_539);
    float _543 = precise::max(_541, 0.0);
    uint _546 = uint(_543);
    float _548 = float(_531);
    int _550 = _507 * int(_546);
    int _552 = _550 + _531;
    float _554 = float(_479);
    float _556 = float(uint(_552));
    bool _558 = _548 >= _554;
    bool _560 = isnan(_548);
    bool _562 = _558 || _560;
    bool _564 = isnan(_554);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = as_type<float>(_527) * _556;
    float _572 = trunc(_568);
    int _574 = int(_572);
    bool _576 = !_525;
    float _578 = _576 ? 7.345489978790283203125 : 1.0;
    float _580 = _578 * _145;
    float _582 = trunc(_570);
    float _584 = precise::max(_582, 0.0);
    uint _586 = uint(_584);
    float _588 = floor(_580);
    int _590 = int(_546) + int(_586);
    int _592 = _511 * _590;
    int _594 = _592 + _531;
    float _596 = -_588;
    float _598 = _580 + _596;
    int _600 = ~_574;
    int _602 = _600 + 1;
    int _604 = _602 + 1;
    bool _606 = uint(_594) >= uint(_479);
    bool _608 = !_606;
    int _610 = _608 ? 0 : (-1);
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _614 = _612 != 0;
    int _616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _618 = _616 != 0;
    int _620 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _622 = _620 != 0;
    int _624 = ~_590;
    int _626 = _624 + _610;
    int _628 = _626 + 1;
    float _630 = _598 * _554;
    bool _632 = _479 == 0;
    float _634 = _125 * _554;
    int _636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _638 = _636 != 0;
    int _640 = _479 * _628;
    int _642 = _640 + _531;
    int _644 = _479 + (-1);
    float _646 = _634 * _499;
    float _648 = trunc(_630);
    int _650 = int(_648);
    int _652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _654 = _652 != 0;
    bool _656 = !_632;
    int _658 = _656 ? _642 : (-1);
    bool _660 = !_638;
    int _662 = _660 ? 0 : 1;
    int _664 = _658 * _604;
    float _666 = trunc(_646);
    int _668 = int(_666);
    bool _670 = !_618;
    int _672 = _670 ? 0 : 1;
    int _674 = _574 * _644;
    int _676 = _674 + _664;
    bool _678 = !_614;
    int _680 = _678 ? 0 : 1;
    int _682 = abs(_672);
    bool _684 = !_622;
    int _686 = _684 ? 0 : 1;
    int _688 = abs(_680);
    int _690 = _676 * _682;
    bool _692 = !_654;
    int _694 = _692 ? 0 : 1;
    int _696 = abs(_686);
    int _698 = abs(_662);
    int _700 = abs(_694);
    int _702 = _650 * _698;
    int _704 = _702 + _531;
    int _706 = _668 * _688;
    int _708 = _706 + _690;
    int _710 = ~_479;
    int _712 = _710 + 1;
    int _714 = _704 * _696;
    int _716 = _714 + _708;
    int _718 = ~_479;
    int _720 = _718 + 1;
    int _722 = _650 * _700;
    int _724 = _722 + _716;
    int _726 = ~_479;
    int _728 = _726 + 1;
    float _730 = float(uint(_704));
    float _732 = float(uint(_724));
    float _734 = as_type<float>(_527) * _730;
    float _736 = as_type<float>(_527) * _732;
    float _738 = trunc(_734);
    float _740 = precise::max(_738, 0.0);
    uint _742 = uint(_740);
    float _744 = trunc(_736);
    float _746 = precise::max(_744, 0.0);
    uint _748 = uint(_746);
    int _750 = _728 * int(_748);
    int _752 = _750 + _724;
    float _754 = float(uint(_752));
    float _756 = as_type<float>(_527) * _754;
    float _758 = trunc(_756);
    float _760 = precise::max(_758, 0.0);
    uint _762 = uint(_760);
    int _764 = int(_748) + int(_762);
    int _766 = _712 * _764;
    int _768 = _766 + _724;
    int _770 = _720 * int(_742);
    int _772 = _770 + _704;
    bool _774 = uint(_768) >= uint(_479);
    float _776 = float(uint(_772));
    bool _778 = !_774;
    int _780 = _778 ? 0 : (-1);
    int _782 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _784 = _782 != 0;
    float _786 = as_type<float>(_527) * _776;
    int _788 = ~_764;
    int _790 = _788 + _780;
    int _792 = _790 + 1;
    bool _794 = !_784;
    int _796 = _794 ? 0 : 1;
    int _798 = _479 * _792;
    int _800 = _798 + _724;
    int _802 = abs(_796);
    float _804 = trunc(_786);
    float _806 = precise::max(_804, 0.0);
    uint _808 = uint(_806);
    bool _810 = !_632;
    int _812 = _810 ? _800 : (-1);
    int _814 = _812 & 3;
    bool _816 = _814 != 0;
    int _818 = _812 & 3;
    bool _820 = _818 != 0;
    float _822 = in.m_58.x;
    float _824 = in.m_58.y;
    float _826 = in.m_58.z;
    bool _828 = uint(_814) > 1u;
    int _830 = _820 ? 0 : 1;
    bool _832 = uint(_814) >= 2u;
    int _834 = int(_742) + int(_808);
    float _836 = in.m_60.x;
    float _838 = in.m_60.y;
    float _840 = in.m_60.z;
    int _842 = ~_830;
    int _844 = _842 + 1;
    int _846 = _844 + 1;
    bool _848 = _814 != 3;
    int _850 = _515 * _834;
    int _852 = _850 + _704;
    bool _854 = _814 != 3;
    int _856 = _846;
    if (!_828)
    {
        int _858 = ~_830;
        int _860 = _858 + 1;
        _856 = _860;
    }
    int _862 = _856;
    float _864 = in.m_62.x;
    float _866 = in.m_62.y;
    float _868 = in.m_62.z;
    int _870 = _832 ? 0 : 1;
    bool _872 = !_816;
    int _874 = _872 ? 0 : 1;
    int _876 = ~_870;
    int _878 = _876 + 1;
    int _880 = _878 + 1;
    int _882 = _880;
    if (_848)
    {
        int _884 = ~_870;
        int _886 = _884 + 1;
        _882 = _886;
    }
    int _888 = _882;
    bool _890 = !_854;
    int _892 = _890 ? 0 : (-1);
    int _894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _896 = _894 != 0;
    int _898 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _900 = _898 != 0;
    float _902 = _413 * _838;
    int _904 = _812 >> 31;
    int _906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _908 = _906 != 0;
    int _910 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _912 = _910 != 0;
    float _914 = _413 * _824;
    bool _916 = uint(_852) >= uint(_479);
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _920 = _918 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    int _922 = _904 & 3;
    float _924 = fma(_405, _822, _914);
    float _926 = _413 * _866;
    bool _928 = !_916;
    int _930 = _928 ? 0 : (-1);
    float _932 = 1.0 / _920;
    int _934 = _812 + _922;
    float _936 = fma(_405, _864, _926);
    bool _938 = _463 > 0.5;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _942 = _455 + _940;
    int _944 = _934 >> 2;
    float _946 = fma(_405, _836, _902);
    float _948 = _942 * _521;
    int _950 = _944 << 4;
    int _952 = _950 + 368;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _956 = _455 + _954;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _960 = _455 + _958;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _962;
    uint _966 = uint(int(uint(_952) >> uint(2)));
    uint _968 = uint(int(uint(int(_966)) >> uint(2)));
    int _970 = int(_966) & 3;
    float _972 = (*spvDescriptorSet0.vp_c9)._m0[int(_968)][_970];
    int _974 = int(_966) + 1;
    uint _976 = uint(int(uint(_974) >> uint(2)));
    int _978 = _974 & 3;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[int(_976)][_978];
    float _982 = _956 * _533;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _986 = _455 + _984;
    float _988 = _960 * _537;
    float _990 = 1.0 / _964;
    float _992 = _986 * _932;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _994;
    int _998 = _952 + 8;
    uint _1000 = uint(int(uint(_998) >> uint(2)));
    uint _1002 = uint(int(uint(int(_1000)) >> uint(2)));
    int _1004 = int(_1000) & 3;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[int(_1002)][_1004];
    int _1008 = int(_1000) + 1;
    uint _1010 = uint(int(uint(_1008) >> uint(2)));
    int _1012 = _1008 & 3;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[int(_1010)][_1012];
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1018 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1016;
    float _1020 = fma(_996, _948, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1024 = _455 + _1022;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1030 = fma(_1018, _948, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1034 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1032;
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1038 = _1036 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1040 = fma(_1028, _988, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _1042 = abs(_862);
    float _1044 = _1024 * _990;
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1046;
    bool _1050 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _1052 = isnan(_455);
    bool _1054 = _1050 || _1052;
    bool _1056 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _1058 = _1054 || _1056;
    float _1060 = float(_1058);
    float _1062 = fma(_1034, _982, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1064 = fma(_1038, _988, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1066 = fma(_1048, _982, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _1068 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _1070 = isnan(_455);
    bool _1072 = _1068 || _1070;
    bool _1074 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _1076 = _1072 || _1074;
    float _1078 = float(_1076);
    float _1080 = -_1060;
    float _1082 = _1080 + 1.0;
    bool _1084 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1086 = isnan(_455);
    bool _1088 = _1084 || _1086;
    bool _1090 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1092 = _1088 || _1090;
    float _1094 = float(_1092);
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1098 = _1096 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    int _1100 = abs(_888);
    float _1102 = _1078 * _1082;
    float _1104 = -_1078;
    float _1106 = _1104 + 1.0;
    bool _1108 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1110 = isnan(_455);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1116 = _1112 || _1114;
    float _1118 = float(_1116);
    float _1120 = fma(_1098, _992, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    int _1122 = ~_834;
    int _1124 = _1122 + _930;
    int _1126 = _1124 + 1;
    float _1128 = _475 * _1106;
    bool _1130 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1132 = isnan(_455);
    bool _1134 = _1130 || _1132;
    bool _1136 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1138 = _1134 || _1136;
    float _1140 = float(_1138);
    float _1142 = _1118 * _495;
    int _1144 = abs(_874);
    int _1146 = _479 * _1126;
    int _1148 = _1146 + _704;
    float _1150 = -_1118;
    float _1152 = _1150 + 1.0;
    int _1154 = ~_1144;
    int _1156 = _1154 + 1;
    int _1158 = _1156 + 1;
    float _1160 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1162 = int(_1160);
    int _1164 = ~_1042;
    int _1166 = _1164 + 1;
    int _1168 = _1166 + 1;
    float _1170 = _1094 * _1152;
    float _1172 = -_1094;
    float _1174 = _1172 + 1.0;
    int _1176 = abs(_892);
    int _1178 = _1168 * as_type<int>(_980);
    bool _1180 = !_632;
    int _1182 = _1180 ? _1148 : (-1);
    float _1184 = _1140 * _1174;
    float _1186 = -_1140;
    float _1188 = _1186 + 1.0;
    int _1190 = _1158 * as_type<int>(_972);
    int _1192 = _1190 + _1178;
    int _1194 = ~_1100;
    int _1196 = _1194 + 1;
    int _1198 = _1196 + 1;
    float _1200 = _1020 * _1184;
    float _1202 = _1030 * _1184;
    int _1204 = _1198 * as_type<int>(_1006);
    int _1206 = _1204 + _1192;
    float _1208 = float(uint(_1162));
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _1212 = _1210 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    int _1214 = ~_1176;
    int _1216 = _1214 + 1;
    int _1218 = _1216 + 1;
    float _1220 = fma(_415, _826, _924);
    float _1222 = fma(_1212, _992, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    int _1224 = abs(_1162);
    float _1226 = 1.0 / _1208;
    int _1228 = ~_802;
    int _1230 = _1228 + 1;
    int _1232 = _1230 + 1;
    int _1234 = _1218 * as_type<int>(_1014);
    int _1236 = _1234 + _1206;
    float _1238 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1200);
    float _1240 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1202);
    int _1242 = _1236 * _1232;
    float _1244 = float(uint(_1224));
    float _1246 = fma(_1040, _1170, _1238);
    float _1248 = fma(_1064, _1170, _1240);
    int _1250 = _1182 * _802;
    int _1252 = _1250 + _1242;
    float _1254 = fma(_415, _840, _946);
    float _1256 = 1.0 / _1244;
    float _1258 = fma(_1062, _1142, _1246);
    float _1260 = fma(_1066, _1142, _1248);
    float _1262 = float(uint(_1252));
    float _1264 = in.m_56.x;
    float _1266 = in.m_56.y;
    int _1268 = as_type<int>(_1226) + (-2);
    float _1270 = fma(_1120, _1128, _1258);
    float _1272 = fma(_1222, _1128, _1260);
    int _1274 = abs(_1252);
    float _1276 = as_type<float>(_1268) * _1262;
    float _1278 = _1220 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _1280;
    float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1286 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _1284;
    int _1288 = ~_1162;
    int _1290 = _1288 + 1;
    float _1292 = _1254 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1294 = trunc(_1276);
    float _1296 = precise::max(_1294, 0.0);
    uint _1298 = uint(_1296);
    float _1300 = fma(_1282, _1044, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    int _1302 = as_type<int>(_1256) + (-2);
    float _1304 = fma(_1286, _1044, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _1306 = float(uint(_1274));
    float _1308 = fma(_1300, _1102, _1270);
    int _1310 = ~_1224;
    int _1312 = _1310 + 1;
    float _1314 = fma(_1304, _1102, _1272);
    float _1316 = as_type<float>(_1302) * _1306;
    float _1318 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[148].x, _1308);
    float _1320 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[148].y, _1314);
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1324 = ~_1224;
    int _1326 = _1324 + 1;
    float _1328 = trunc(_1316);
    float _1330 = precise::max(_1328, 0.0);
    uint _1332 = uint(_1330);
    float _1334 = _1318 * _1264;
    int _1336 = _1290 * int(_1298);
    int _1338 = _1336 + _1252;
    float _1340 = _145 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1342 = _1320 * _1266;
    float _1344 = _419 * _1334;
    float _1346 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _203);
    float _1348 = float(uint(_1338));
    float _1350 = -_1322;
    float _1352 = fma(_1340, 2.0, _1350);
    float _1354 = _423 * _1342;
    float _1356 = _1344 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1358 = as_type<float>(_1268) * _1348;
    float _1360 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _221);
    float _1362 = _1354 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1364 = _1356 * _1346;
    int _1366 = _1326 * int(_1332);
    int _1368 = _1366 + _1274;
    float _1370 = fma(_415, _868, _936);
    float _1372 = trunc(_1358);
    float _1374 = precise::max(_1372, 0.0);
    uint _1376 = uint(_1374);
    float _1378 = _1362 * _1360;
    float _1380 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1382 = float(uint(_1368));
    float _1384 = _1370 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1386 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1388 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1390 = as_type<float>(_1302) * _1382;
    float _1392 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1386);
    float _1394 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1388);
    float _1396 = in.m_51.y;
    float _1398 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1392);
    float _1400 = trunc(_1390);
    float _1402 = precise::max(_1400, 0.0);
    uint _1404 = uint(_1402);
    float _1406 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1394);
    int _1408 = int(_1298) + int(_1376);
    float _1410 = _1398 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1412 = ~_1162;
    int _1414 = _1412 + 1;
    float _1416 = _1406 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1418 = _1278 + _1410;
    float _1420 = _1292 + _1416;
    float _1422 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1424 = _1418 + _1422;
    int _1426 = _1414 * _1408;
    int _1428 = _1426 + _1252;
    float _1430 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1432 = _1420 + _1430;
    float _1434 = _1424 * _1424;
    int _1436 = int(_1332) + int(_1404);
    float _1438 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1440 = _1432 * _1432;
    bool _1442 = uint(_1428) >= uint(_1162);
    int _1444 = _1312 * _1436;
    int _1446 = _1444 + _1274;
    float _1448 = _1434 + _1440;
    bool _1450 = !_1442;
    int _1452 = _1450 ? 0 : (-1);
    float _1454 = _1396 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1456 = sqrt(_1448);
    bool _1458 = uint(_1446) >= uint(_1224);
    float _1460 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1462 = ~_1408;
    int _1464 = _1462 + _1452;
    int _1466 = _1464 + 1;
    float _1468 = fma(_1454, -2.0, _1438);
    bool _1470 = !_1458;
    int _1472 = _1470 ? 0 : (-1);
    float _1474 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1460);
    bool _1476 = _145 > 0.5;
    int _1478 = _1162 * _1466;
    int _1480 = _1478 + _1252;
    float _1482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1484 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1474);
    float _1486 = -_203;
    int _1488 = _1476 ? as_type<int>(_1486) : as_type<int>(_203);
    float _1490 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1492 = _1162 == 0;
    float _1494 = _1484 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1496 = _1252 ^ _1162;
    bool _1498 = !_1492;
    int _1500 = _1498 ? _1480 : (-1);
    float _1502 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1504 = _1456 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1506 = _1384 + _1494;
    bool _1508 = !_896;
    float _1510 = _1508 ? _203 : as_type<float>(_1488);
    float _1512 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    uint _1514 = uint(int(uint(_1496) >> uint(31)));
    bool _1516 = _1162 == 0;
    float _1518 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1520 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1522 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1524 = ~_1472;
    int _1526 = _1436 + _1524;
    int _1528 = _1526 + 1;
    float _1530 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1518);
    int _1532 = ~int(_1514);
    int _1534 = _1532 + 1;
    float _1536 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1520);
    float _1538 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1522);
    float _1540 = _1512;
    float _1542 = _1494;
    float _1544 = _1418;
    float _1546 = _1522;
    float _1548 = _1128;
    float _1550 = _1396;
    if (!_1504)
    {
        _1540 = _1418;
    }
    float _1552 = _1540;
    float _1554 = _1552;
    if (!_1504)
    {
        _227 = _1440;
    }
    float _1556 = _227;
    float _1558 = _1556;
    if (!_1504)
    {
        _1542 = _1434;
    }
    float _1560 = _1542;
    float _1562 = _1560;
    if (!_1504)
    {
        _1544 = _1420;
    }
    float _1564 = _1544;
    int _1566 = _1528 ^ _1534;
    float _1568 = _1564;
    if (!_1504)
    {
        _1546 = _1506;
    }
    float _1570 = _1546;
    bool _1572 = !_1504;
    float _1574 = _1570;
    if (!_1572)
    {
        float _1576 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1578 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1580 = _1456 + _1578;
        float _1582 = rsqrt(_1448);
        float _1584 = _1580 * _1576;
        float _1586 = _1506 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1588 = _1584 * 0.15915493667125701904296875;
        float _1590 = _1588 * 6.283185482025146484375;
        float _1592 = sin(_1590);
        float _1594 = _1588 * 6.283185482025146484375;
        float _1596 = cos(_1594);
        float _1598 = fma(_1592, _1586, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1600 = _1582 * _1598;
        float _1602 = _1596 + (-1.0);
        float _1604 = fma(_1424, _1600, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1606 = fma(_1432, _1600, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1608 = _1602 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1610 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1612 = _1604 + _1610;
        float _1614 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1616 = _1606 + _1614;
        float _1618 = fma(_1506, _1596, _1608);
        float _1620 = _1612 * _1612;
        float _1622 = _1616 * _1616;
        _1574 = _1618;
        _1562 = _1620;
        _1558 = _1622;
        _1554 = _1604;
        _1568 = _1606;
    }
    float _1624 = _1574;
    float _1626 = _1562;
    float _1628 = _1558;
    float _1630 = _1554;
    float _1632 = _1568;
    int _1634 = ~_1534;
    int _1636 = _1634 + _1566;
    int _1638 = _1636 + 1;
    float _1640 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1642 = _1624 + _1640;
    float _1644 = float(_1500);
    float _1646 = _1502 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1648 = !_1516;
    int _1650 = _1648 ? _1638 : (-1);
    float _1652 = fma(_1642, _1642, _1626);
    float _1654 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1468);
    float _1656 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1658 = float(_1650);
    float _1660 = -_125;
    float _1662 = fma(_1660, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1352);
    float _1664 = _1652 + _1628;
    float _1666 = _1510 + 0.5;
    float _1668 = -_1654;
    float _1670 = fma(_1646, _1658, _1668);
    float _1672 = fma(_1656, _1644, _1662);
    float _1674 = sqrt(_1664);
    float _1676 = fma(_1656, _1666, _1672);
    float _1678 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1680 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1682 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1686 = _1396 > 0.5;
    float _1688 = _1678 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1690 = _1680 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1692 = _1682 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1694 = in.m_51.z;
    float _1696 = -_221;
    int _1698 = _1686 ? as_type<int>(_1696) : as_type<int>(_221);
    float _1700 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1702 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    out.m_64.x = _1688;
    out.m_64.y = _1690;
    out.m_64.z = _1692;
    out.m_64.w = _1684;
    bool _1704 = !_900;
    float _1706 = _1704 ? _221 : as_type<float>(_1698);
    float _1708 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1700);
    float _1710 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1702);
    float _1712 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1714 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1708);
    float _1716 = _1706 + (-0.5);
    float _1718 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1710);
    bool _1720 = _1674 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1722 = isnan(_1674);
    bool _1724 = _1720 || _1722;
    bool _1726 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1728 = _1724 || _1726;
    float _1730 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1736 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1738 = -_1714;
    float _1740 = _1738 + 1.0;
    float _1742 = -_1646;
    float _1744 = fma(_1742, _1716, _1670);
    float _1746 = -_1718;
    float _1748 = _1746 + 1.0;
    float _1750 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1752 = _1732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1754 = _1734 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1756 = _1736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1758 = -_1740;
    float _1760 = fma(_1510, _1758, _1676);
    float _1762 = fma(_1706, _1748, _1744);
    out.m_66.x = _1752;
    out.m_66.y = _1754;
    out.m_66.z = _1756;
    out.m_66.w = _1750;
    float _1764 = _1712 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1766 = _1730 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1768 = (*spvDescriptorSet0.vp_c9)._m0[81].z + (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1770 = (*spvDescriptorSet0.vp_c9)._m0[81].w + (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1772 = _1694 > 0.5;
    float _1774 = _1530 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1776 = _1536 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[83].x + (*spvDescriptorSet0.vp_c9)._m0[83].z;
    float _1780 = (*spvDescriptorSet0.vp_c9)._m0[83].y + (*spvDescriptorSet0.vp_c9)._m0[83].w;
    float _1782 = _1538 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1784 = _1750;
    float _1786 = _1684;
    float _1788 = _1694;
    if (!_1728)
    {
        _1784 = 1.0;
    }
    float _1790 = _1784;
    bool _1792 = !_1728;
    float _1794 = _1790;
    if (!_1792)
    {
        bool _1796 = _1674 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1798 = isnan(_1674);
        bool _1800 = _1796 || _1798;
        bool _1802 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1804 = _1800 || _1802;
        if (!_1804)
        {
            float _1806 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1808 = _1674 + _1806;
            float _1810 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1812 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1810;
            float _1814 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1816 = _1814 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1818 = 1.0 / _1812;
            float _1820 = _1808 * _1818;
            float _1822 = fma(_1820, _1816, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1794 = _1822;
            _1824 = true;
        }
        else
        {
            bool _1826 = _1674 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1828 = isnan(_1674);
            bool _1830 = _1826 || _1828;
            bool _1832 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1834 = _1830 || _1832;
            if (!_1834)
            {
                float _1836 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1838 = _1674 + _1836;
                float _1840 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1842 = _1840 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1844 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1846 = _1844 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1848 = 1.0 / _1842;
                float _1850 = _1838 * _1848;
                float _1852 = fma(_1850, _1846, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1794 = _1852;
                _1824 = true;
            }
            else
            {
                _1794 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1824 = false;
    float _1854 = _1794;
    float _1856 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1858 = _1624 + _1856;
    float _1860 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1862 = _1630 + _1860;
    float _1864 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1866 = _1632 + _1864;
    float _1868 = fma(_1858, _1854, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1870 = fma(_1862, _1854, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1872 = fma(_1866, _1854, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1874 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1876 = _1868 + _1874;
    float _1878 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1880 = _1870 + _1878;
    float _1882 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1884 = _1872 + _1882;
    float _1886 = _1876 * _1876;
    float _1888 = fma(_1880, _1880, _1886);
    float _1890 = fma(_1884, _1884, _1888);
    float _1892 = rsqrt(_1890);
    float _1894 = _1892 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1896 = _1880 * _1894;
    float _1898 = _1884 * _1894;
    float _1900 = _1896 * _1896;
    float _1902 = _1898 * _1898;
    float _1904 = _1900 + _1902;
    float _1906 = sqrt(_1904);
    bool _1908 = _1906 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1910 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1912 = _1906 + _1910;
    float _1914 = _1884;
    float _1916 = _1904;
    float _1918 = _1912;
    float _1920 = _1876;
    float _1922 = _1896;
    if (_1908)
    {
        float _1924 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1914 = _1924;
    }
    float _1926 = _1914;
    if (_1908)
    {
        float _1928 = rsqrt(_1904);
        _1916 = _1928;
    }
    float _1930 = _1916;
    if (_1908)
    {
        float _1932 = _1912 * _1926;
        _1918 = _1932;
    }
    float _1934 = _1918;
    if (_1908)
    {
        float _1936 = _1934 * 0.15915493667125701904296875;
        _1786 = _1936;
    }
    float _1938 = _1786;
    float _1940 = _1892;
    float _1942 = _1938;
    if (_1908)
    {
        float _1944 = _1938 * 6.283185482025146484375;
        float _1946 = sin(_1944);
        _1940 = _1946;
    }
    float _1948 = _1940;
    float _1950 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1952 = precise::max(0.0, _1950);
    float _1954 = _1926;
    float _1956 = _1952;
    if (_1908)
    {
        float _1958 = _1938 * 6.283185482025146484375;
        float _1960 = cos(_1958);
        _1954 = _1960;
    }
    float _1962 = _1954;
    float _1964 = -_1894;
    float _1966 = -_1952;
    float _1968 = fma(_1876, _1964, _1966);
    if (_1908)
    {
        float _1970 = _1968 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1920 = _1970;
    }
    float _1972 = _1920;
    float _1974 = _1948;
    float _1976 = _1972;
    if (_1908)
    {
        float _1978 = fma(_1948, _1972, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1974 = _1978;
    }
    float _1980 = _1974;
    float _1982 = _1980;
    if (!_1908)
    {
        _1976 = _1968;
    }
    float _1984 = _1976;
    float _1986 = _1984;
    float _1988 = _1962;
    if (_1908)
    {
        float _1990 = _1962 + (-1.0);
        _1956 = _1990;
    }
    float _1992 = _1956;
    float _1994 = _1992;
    if (_1908)
    {
        float _1996 = _1930 * _1980;
        _1548 = _1996;
    }
    float _1998 = _1548;
    if (!_1908)
    {
        _1982 = _1898;
    }
    float _2000 = _1982;
    float _2002 = sqrt(_1890);
    float _2004 = _2000;
    if (_1908)
    {
        float _2006 = _1992 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1942 = _2006;
    }
    float _2008 = _1942;
    if (_1908)
    {
        float _2010 = _1896 * _1998;
        _1922 = _2010;
    }
    float _2012 = _1922;
    if (!_1908)
    {
        _1994 = _1900;
    }
    float _2014 = _1994;
    float _2016 = _2014;
    if (_1908)
    {
        float _2018 = _1898 * _1998;
        _2004 = _2018;
    }
    float _2020 = _2004;
    if (_1908)
    {
        float _2022 = fma(_1968, _1962, _2008);
        _1986 = _2022;
    }
    float _2024 = _1986;
    if (_1908)
    {
        float _2026 = _2012 * _2012;
        _2016 = _2026;
    }
    float _2028 = _2016;
    if (!_1908)
    {
        _1988 = _1902;
    }
    float _2030 = _1988;
    float _2032 = _2030;
    if (_1908)
    {
        float _2034 = _2020 * _2020;
        _2032 = _2034;
    }
    float _2036 = _2032;
    float _2038 = fma(_2024, _2024, _2028);
    float _2040 = _1868 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2042 = _2038 + _2036;
    float _2044 = _1868 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2046 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2048 = fma(_2002, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2046);
    float _2050 = precise::clamp(_2048, 0.0, 1.0);
    float _2052 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2054 = rsqrt(_2042);
    float _2056 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2044);
    float _2058 = _1868 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2060 = -_2050;
    float _2062 = _2060 + 1.0;
    float _2064 = _1868 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2066 = fma(_1872, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2056);
    float _2068 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2058);
    float _2070 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2064);
    float _2072 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2040);
    float _2074 = fma(_1872, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2068);
    float _2076 = _2066 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2078 = fma(_1872, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2070);
    float _2080 = abs(_2062);
    float _2082 = log2(_2080);
    float _2084 = _2074 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2086 = _2076 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2088 = _2054 * _2012;
    float _2090 = _2078 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2092 = _2084 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2094 = _2054 * _2024;
    float _2096 = _2088 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2098 = fma(_1872, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2072);
    float _2100 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2092);
    float _2102 = _2054 * _2020;
    float _2104 = -_2096;
    float _2106 = fma(_2094, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2104);
    float _2108 = -_2086;
    float _2110 = fma(_2108, _2052, 1.0);
    float _2112 = _2098 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2114 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2100);
    float _2116 = -_2102;
    float _2118 = fma(_2116, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2106);
    float _2120 = _2082 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2122 = _2084 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2124 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2114);
    float _2126 = fma(_2118, -0.5, 0.5);
    float _2128 = log2(_2110);
    float _2130 = _2084 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2132 = fma(_2118, 0.5, 0.5);
    float _2134 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2122);
    float _2136 = _2094 + 1.0;
    float _2138 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2130);
    float _2140 = fma(_2132, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2142 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2134);
    float _2144 = 1.0 / _2124;
    float _2146 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2138);
    float _2148 = fma(_2132, _2140, -0.212114393711090087890625);
    float _2150 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2142);
    float _2152 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2146);
    float _2154 = fma(_2132, _2148, 1.570728778839111328125);
    float _2156 = exp2(_2120);
    float _2158 = _2128 * 0.693147182464599609375;
    float _2160 = _2158 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2162 = sqrt(_2126);
    float _2164 = _2150 * _2144;
    float _2166 = _2152 * _2144;
    float _2168 = fma(_2164, 0.5, 0.5);
    float _2170 = fma(_2166, -0.5, 0.5);
    float _2172 = -_2094;
    float _2174 = fma(_2156, _2136, _2172);
    float3 _5601 = float3(_2168, _2170, _2160);
    float _2176 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5601, float3(0.0), isnan(_5601)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5601, float3(0.0), isnan(_5601)), level(0.0)).x;
    float _2178 = fma(_2174, 0.5, 0.5);
    float _2180 = _2162 * 0.636619746685028076171875;
    float _2182 = -_2154;
    float _2184 = fma(_2180, _2182, 1.0);
    float3 _5622 = float3(_2168, _2170, _2160);
    float4 _2187 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5622, float3(0.0), isnan(_5622)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5622, float3(0.0), isnan(_5622)), level(0.0)).xyzw;
    float _2189 = _2187.x;
    float _2191 = _2187.y;
    float _2193 = _2187.z;
    float _2195 = _2187.w;
    float2 _5639 = float2(_2184, _2178);
    float3 _2199 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5639, float2(0.0), isnan(_5639)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5639, float2(0.0), isnan(_5639)), level(0.0)).xyz;
    float _2201 = _2199.x;
    float _2203 = _2199.y;
    float _2205 = _2199.z;
    float _2207 = _1776 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2209 = _1776 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2211 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2207);
    float _2213 = _1776 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2215 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2209);
    float _2217 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2211);
    float _2219 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2213);
    float _2221 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2215);
    float _2223 = _2215;
    if (!_525)
    {
        _2223 = _1694;
    }
    float _2225 = _2223;
    float _2227 = _2217 * _2217;
    float _2229 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2219);
    float _2231 = _2225;
    if (_525)
    {
        _1788 = _1396;
    }
    float _2233 = _1788;
    float _2235 = fma(_2221, _2221, _2227);
    if (_525)
    {
        _2231 = _1396;
    }
    float _2237 = _2231;
    float _2239 = fma(_2233, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1780);
    float _2241 = fma(_2229, _2229, _2235);
    if (_525)
    {
        _1550 = _145;
    }
    float _2243 = _1550;
    float _2245 = _2084 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2247 = _2237 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2249 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2239);
    float _2251 = rsqrt(_2241);
    float _2253 = _2243 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2255 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2245);
    float _2257 = fma(_2243, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1778);
    float _2259 = fma(_2247, -2.0, _1770);
    float _2261 = -_1768;
    float _2263 = fma(_2253, 2.0, _2261);
    float _2265 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2255);
    float _2267 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2257);
    float _2269 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2259);
    float _2271 = -_2249;
    float _2273 = _2271 + 1.0;
    float _2275 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2265);
    float _2277 = -_2267;
    float _2279 = _2277 + 1.0;
    float _2281 = _2221 * _2251;
    float _2283 = _2217 * _2251;
    float _2285 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2287 = fma(_2281, 0.5, 0.5);
    float _2289 = _2082 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2291 = fma(_2283, -0.5, 0.5);
    float _2293 = -_125;
    float _2295 = fma(_2293, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2263);
    float _2297 = _2275 + _2124;
    float _2299 = _2287;
    float _2301 = _2291;
    if (_908)
    {
        float _2303 = -_2287;
        float _2305 = _1772 ? _2303 : _2287;
        _2299 = _2305;
    }
    float _2307 = _2299;
    out.m_47.x = _2285;
    float _2309 = exp2(_2289);
    if (_912)
    {
        float _2311 = -_2291;
        float _2313 = _938 ? _2311 : _2291;
        _2301 = _2313;
    }
    float _2315 = _2301;
    float _2317 = _2307 + 0.5;
    float _2319 = fma(_1764, _2317, _2295);
    float _2321 = _2315 + (-0.5);
    float _2323 = -_2279;
    float _2325 = fma(_2323, _2307, _2319);
    float _2327 = -_1766;
    float _2329 = -_2269;
    float _2331 = fma(_2327, _2321, _2329);
    float _2333 = _2297 * 0.5;
    float _2335 = -_2309;
    float _2337 = _2335 + 1.0;
    float _2339 = fma(_2273, _2315, _2331);
    out.m_68.z = _2333;
    out.m_68.w = _2124;
    float _2341 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2150;
    out.gl_Position.y = _2152;
    out.gl_Position.z = _2275;
    out.gl_Position.w = _2124;
    out.m_70.x = _1760;
    out.m_70.y = _1762;
    out.m_70.z = _2325;
    out.m_70.w = _2339;
    float _2343 = _2341 * _2176;
    float _2345 = -_2341;
    float _2347 = _2345 + 1.0;
    float _2349 = _2195 * _2343;
    float _2351 = _2195 * _2347;
    float _2353 = _2205 * _2343;
    float _2355 = fma(_2201, _2349, _2189);
    float _2357 = fma(_2203, _2349, _2191);
    float _2359 = fma(_2195, _2353, _2193);
    out.m_72.x = _2355;
    out.m_72.y = _2357;
    out.m_72.z = _2359;
    out.m_72.w = _2351;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1824 = false;
    bool _447 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_44.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_47.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2416 = as_type<float>(_107);
        out.gl_Position.z = _2416;
    }
    if (!_95)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _111 = in.m_49.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_121)
    {
        float _127 = float(_91);
        _101 = _127;
    }
    float _129 = _101;
    bool _131 = _125 >= _129;
    bool _133 = !_121;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_47.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _109 = as_type<int>(_141);
    }
    int _143 = _109;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2485 = as_type<float>(_143);
        out.gl_Position.z = _2485;
    }
    if (_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = in.m_51.x;
    float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _149 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _151 = as_type<float>(int(gl_VertexIndex));
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _165 = _149 * _147;
    float _167 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _169 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].x, _165);
    float _171 = _167 * _163;
    float _173 = floor(_169);
    float _175 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].y, _171);
    float _177 = _169 * 6.283185482025146484375;
    int _179 = as_type<int>(_151) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_151) & 2;
    bool _185 = _183 != 0;
    float _187 = _175 * 6.283185482025146484375;
    float _189 = _177 * 0.15915493667125701904296875;
    float _191 = in.m_49.x;
    float _193 = in.m_49.y;
    float _195 = in.m_49.z;
    float _197 = _187 * 0.15915493667125701904296875;
    float _199 = floor(_175);
    bool _201 = !_181;
    float _203 = _201 ? (-0.5) : 0.5;
    int _205 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _207 = _205 != 0;
    float _209 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _211 = -_173;
    float _213 = _169 + _211;
    float _215 = _189 * 6.283185482025146484375;
    float _217 = cos(_215);
    bool _219 = !_185;
    float _221 = _219 ? (-0.5) : 0.5;
    float _223 = _151;
    float _225 = _209;
    float _227 = _203;
    if (!_161)
    {
        float _229 = _209 * _209;
        float _231 = _229 * 0.5;
        _223 = _231;
    }
    float _233 = _223;
    float _235 = _233;
    if (!_161)
    {
        float _237 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _235 = _237;
    }
    float _239 = _235;
    float _241 = _197 * 6.283185482025146484375;
    float _243 = cos(_241);
    float _245 = -_199;
    float _247 = _175 + _245;
    bool _249 = !_161;
    float _251 = _239;
    if (!_249)
    {
        float _253 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _255 = log2(_253);
        float _257 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _259 = _257 + 1.0;
        float _261 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _263 = _209 * _255;
        float _265 = 1.0 / _259;
        float _267 = _261 * 0.693147182464599609375;
        float _269 = exp2(_263);
        float _271 = 1.0 / _267;
        float _273 = _269 + (-1.0);
        float _275 = -_273;
        float _277 = fma(_275, _271, _209);
        float _279 = _277 * _265;
        float _281 = _279 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _251 = _281;
    }
    float _283 = _251;
    bool _285 = !_161;
    if (!_285)
    {
        float _287 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _289 = log2(_287);
        float _291 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _293 = _291 + 1.0;
        float _295 = 1.0 / _293;
        float _297 = _209 * _289;
        float _299 = exp2(_297);
        float _301 = -_299;
        float _303 = _301 + 1.0;
        float _305 = _303 * _295;
        _225 = _305;
    }
    float _307 = _225;
    float _309 = fma(_217, 0.5, 0.5);
    float _311 = fma(_243, 0.5, 0.5);
    bool _313 = _213 < 0.5;
    float _315 = float(_313);
    float _317 = in.m_56.w;
    int _319 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _321 = _319 != 0;
    int _323 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _325 = _323 != 0;
    float _327 = -_309;
    float _329 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _331 = -_315;
    float _333 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _335 = _283 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _337 = -_213;
    float _339 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _341 = !_321;
    int _343 = _341 ? 0 : 1;
    float _345 = -_247;
    float _347 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _349 = _247 < 0.5;
    float _351 = float(_349);
    float _353 = in.m_44.x;
    float _355 = in.m_44.y;
    float _357 = in.m_44.z;
    float _359 = -_311;
    float _361 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _363 = _283 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _365 = fma(_307, _191, _335);
    int _367 = abs(_343);
    float _369 = -_351;
    float _371 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _373 = !_207;
    int _375 = _373 ? 0 : 1;
    float _377 = fma(_307, _193, _363);
    bool _379 = !_325;
    int _381 = _379 ? 0 : 1;
    float _383 = _283 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _385 = abs(_375);
    float _387 = fma(_307, _195, _383);
    bool _389 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _391 = abs(_381);
    float _393 = float(_367);
    float _395 = float(_385);
    float _397 = abs(_339);
    float _399 = _393 * _397;
    float _401 = abs(_347);
    float _403 = _393 * _401;
    float _405 = fma(_365, _317, _353);
    float _407 = float(_391);
    float _409 = fma(_395, _329, _399);
    float _411 = fma(_395, _361, _403);
    float _413 = fma(_377, _317, _355);
    float _415 = fma(_387, _317, _357);
    float _417 = abs(_333);
    float _419 = fma(_407, _417, _409);
    float _421 = abs(_371);
    float _423 = fma(_407, _421, _411);
    bool _425 = !_389;
    float _443;
    float _445;
    if (!_425)
    {
        float _427 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _429 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _431 = float(_91);
        float _433 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _435 = _433 * _427;
        float _437 = floor(_435);
        float _439 = -_437;
        float _441 = _435 + _439;
        _443 = _441;
        _445 = _431;
        _447 = true;
    }
    else
    {
        float _449 = float(_91);
        float _451 = 1.0 / _449;
        float _453 = _125 * _451;
        _443 = _453;
        _445 = _449;
    }
    _447 = false;
    float _455 = _443;
    float _457 = _445;
    float _459 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _461 = int(_459);
    float _463 = in.m_51.w;
    bool _465 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _467 = isnan(_455);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _479 = int(_477);
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _481;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _485;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _493 = -_475;
    float _495 = _493 + 1.0;
    float _497 = float(_461);
    float _499 = 1.0 / _457;
    float _501 = float(uint(_479));
    float _503 = 1.0 / _497;
    int _505 = ~_479;
    int _507 = _505 + 1;
    int _509 = ~_479;
    int _511 = _509 + 1;
    int _513 = ~_479;
    int _515 = _513 + 1;
    float _517 = 1.0 / _501;
    float _519 = _125 * _503;
    float _521 = 1.0 / _483;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _525 = _523 != 0;
    int _527 = as_type<int>(_517) + (-2);
    float _529 = trunc(_519);
    int _531 = int(_529);
    float _533 = 1.0 / _487;
    float _535 = float(uint(_531));
    float _537 = 1.0 / _491;
    float _539 = as_type<float>(_527) * _535;
    float _541 = trunc(_539);
    float _543 = precise::max(_541, 0.0);
    uint _546 = uint(_543);
    float _548 = float(_531);
    int _550 = _507 * int(_546);
    int _552 = _550 + _531;
    float _554 = float(_479);
    float _556 = float(uint(_552));
    bool _558 = _548 >= _554;
    bool _560 = isnan(_548);
    bool _562 = _558 || _560;
    bool _564 = isnan(_554);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = as_type<float>(_527) * _556;
    float _572 = trunc(_568);
    int _574 = int(_572);
    bool _576 = !_525;
    float _578 = _576 ? 7.345489978790283203125 : 1.0;
    float _580 = _578 * _145;
    float _582 = trunc(_570);
    float _584 = precise::max(_582, 0.0);
    uint _586 = uint(_584);
    float _588 = floor(_580);
    int _590 = int(_546) + int(_586);
    int _592 = _511 * _590;
    int _594 = _592 + _531;
    float _596 = -_588;
    float _598 = _580 + _596;
    int _600 = ~_574;
    int _602 = _600 + 1;
    int _604 = _602 + 1;
    bool _606 = uint(_594) >= uint(_479);
    bool _608 = !_606;
    int _610 = _608 ? 0 : (-1);
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _614 = _612 != 0;
    int _616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _618 = _616 != 0;
    int _620 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _622 = _620 != 0;
    int _624 = ~_590;
    int _626 = _624 + _610;
    int _628 = _626 + 1;
    float _630 = _598 * _554;
    bool _632 = _479 == 0;
    float _634 = _125 * _554;
    int _636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _638 = _636 != 0;
    int _640 = _479 * _628;
    int _642 = _640 + _531;
    int _644 = _479 + (-1);
    float _646 = _634 * _499;
    float _648 = trunc(_630);
    int _650 = int(_648);
    int _652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _654 = _652 != 0;
    bool _656 = !_632;
    int _658 = _656 ? _642 : (-1);
    bool _660 = !_638;
    int _662 = _660 ? 0 : 1;
    int _664 = _658 * _604;
    float _666 = trunc(_646);
    int _668 = int(_666);
    bool _670 = !_618;
    int _672 = _670 ? 0 : 1;
    int _674 = _574 * _644;
    int _676 = _674 + _664;
    bool _678 = !_614;
    int _680 = _678 ? 0 : 1;
    int _682 = abs(_672);
    bool _684 = !_622;
    int _686 = _684 ? 0 : 1;
    int _688 = abs(_680);
    int _690 = _676 * _682;
    bool _692 = !_654;
    int _694 = _692 ? 0 : 1;
    int _696 = abs(_686);
    int _698 = abs(_662);
    int _700 = abs(_694);
    int _702 = _650 * _698;
    int _704 = _702 + _531;
    int _706 = _668 * _688;
    int _708 = _706 + _690;
    int _710 = ~_479;
    int _712 = _710 + 1;
    int _714 = _704 * _696;
    int _716 = _714 + _708;
    int _718 = ~_479;
    int _720 = _718 + 1;
    int _722 = _650 * _700;
    int _724 = _722 + _716;
    int _726 = ~_479;
    int _728 = _726 + 1;
    float _730 = float(uint(_704));
    float _732 = float(uint(_724));
    float _734 = as_type<float>(_527) * _730;
    float _736 = as_type<float>(_527) * _732;
    float _738 = trunc(_734);
    float _740 = precise::max(_738, 0.0);
    uint _742 = uint(_740);
    float _744 = trunc(_736);
    float _746 = precise::max(_744, 0.0);
    uint _748 = uint(_746);
    int _750 = _728 * int(_748);
    int _752 = _750 + _724;
    float _754 = float(uint(_752));
    float _756 = as_type<float>(_527) * _754;
    float _758 = trunc(_756);
    float _760 = precise::max(_758, 0.0);
    uint _762 = uint(_760);
    int _764 = int(_748) + int(_762);
    int _766 = _712 * _764;
    int _768 = _766 + _724;
    int _770 = _720 * int(_742);
    int _772 = _770 + _704;
    bool _774 = uint(_768) >= uint(_479);
    float _776 = float(uint(_772));
    bool _778 = !_774;
    int _780 = _778 ? 0 : (-1);
    int _782 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _784 = _782 != 0;
    float _786 = as_type<float>(_527) * _776;
    int _788 = ~_764;
    int _790 = _788 + _780;
    int _792 = _790 + 1;
    bool _794 = !_784;
    int _796 = _794 ? 0 : 1;
    int _798 = _479 * _792;
    int _800 = _798 + _724;
    int _802 = abs(_796);
    float _804 = trunc(_786);
    float _806 = precise::max(_804, 0.0);
    uint _808 = uint(_806);
    bool _810 = !_632;
    int _812 = _810 ? _800 : (-1);
    int _814 = _812 & 3;
    bool _816 = _814 != 0;
    int _818 = _812 & 3;
    bool _820 = _818 != 0;
    float _822 = in.m_58.x;
    float _824 = in.m_58.y;
    float _826 = in.m_58.z;
    bool _828 = uint(_814) > 1u;
    int _830 = _820 ? 0 : 1;
    bool _832 = uint(_814) >= 2u;
    int _834 = int(_742) + int(_808);
    float _836 = in.m_60.x;
    float _838 = in.m_60.y;
    float _840 = in.m_60.z;
    int _842 = ~_830;
    int _844 = _842 + 1;
    int _846 = _844 + 1;
    bool _848 = _814 != 3;
    int _850 = _515 * _834;
    int _852 = _850 + _704;
    bool _854 = _814 != 3;
    int _856 = _846;
    if (!_828)
    {
        int _858 = ~_830;
        int _860 = _858 + 1;
        _856 = _860;
    }
    int _862 = _856;
    float _864 = in.m_62.x;
    float _866 = in.m_62.y;
    float _868 = in.m_62.z;
    int _870 = _832 ? 0 : 1;
    bool _872 = !_816;
    int _874 = _872 ? 0 : 1;
    int _876 = ~_870;
    int _878 = _876 + 1;
    int _880 = _878 + 1;
    int _882 = _880;
    if (_848)
    {
        int _884 = ~_870;
        int _886 = _884 + 1;
        _882 = _886;
    }
    int _888 = _882;
    bool _890 = !_854;
    int _892 = _890 ? 0 : (-1);
    int _894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _896 = _894 != 0;
    int _898 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _900 = _898 != 0;
    float _902 = _413 * _838;
    int _904 = _812 >> 31;
    int _906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _908 = _906 != 0;
    int _910 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _912 = _910 != 0;
    float _914 = _413 * _824;
    bool _916 = uint(_852) >= uint(_479);
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _920 = _918 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    int _922 = _904 & 3;
    float _924 = fma(_405, _822, _914);
    float _926 = _413 * _866;
    bool _928 = !_916;
    int _930 = _928 ? 0 : (-1);
    float _932 = 1.0 / _920;
    int _934 = _812 + _922;
    float _936 = fma(_405, _864, _926);
    bool _938 = _463 > 0.5;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _942 = _455 + _940;
    int _944 = _934 >> 2;
    float _946 = fma(_405, _836, _902);
    float _948 = _942 * _521;
    int _950 = _944 << 4;
    int _952 = _950 + 368;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _956 = _455 + _954;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _960 = _455 + _958;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _962;
    uint _966 = uint(int(uint(_952) >> uint(2)));
    uint _968 = uint(int(uint(int(_966)) >> uint(2)));
    int _970 = int(_966) & 3;
    float _972 = (*spvDescriptorSet0.vp_c9)._m0[int(_968)][_970];
    int _974 = int(_966) + 1;
    uint _976 = uint(int(uint(_974) >> uint(2)));
    int _978 = _974 & 3;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[int(_976)][_978];
    float _982 = _956 * _533;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _986 = _455 + _984;
    float _988 = _960 * _537;
    float _990 = 1.0 / _964;
    float _992 = _986 * _932;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _994;
    int _998 = _952 + 8;
    uint _1000 = uint(int(uint(_998) >> uint(2)));
    uint _1002 = uint(int(uint(int(_1000)) >> uint(2)));
    int _1004 = int(_1000) & 3;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[int(_1002)][_1004];
    int _1008 = int(_1000) + 1;
    uint _1010 = uint(int(uint(_1008) >> uint(2)));
    int _1012 = _1008 & 3;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[int(_1010)][_1012];
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1018 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1016;
    float _1020 = fma(_996, _948, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1024 = _455 + _1022;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1030 = fma(_1018, _948, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1034 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1032;
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1038 = _1036 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1040 = fma(_1028, _988, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _1042 = abs(_862);
    float _1044 = _1024 * _990;
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1046;
    bool _1050 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _1052 = isnan(_455);
    bool _1054 = _1050 || _1052;
    bool _1056 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _1058 = _1054 || _1056;
    float _1060 = float(_1058);
    float _1062 = fma(_1034, _982, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1064 = fma(_1038, _988, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1066 = fma(_1048, _982, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _1068 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _1070 = isnan(_455);
    bool _1072 = _1068 || _1070;
    bool _1074 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _1076 = _1072 || _1074;
    float _1078 = float(_1076);
    float _1080 = -_1060;
    float _1082 = _1080 + 1.0;
    bool _1084 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1086 = isnan(_455);
    bool _1088 = _1084 || _1086;
    bool _1090 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1092 = _1088 || _1090;
    float _1094 = float(_1092);
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1098 = _1096 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    int _1100 = abs(_888);
    float _1102 = _1078 * _1082;
    float _1104 = -_1078;
    float _1106 = _1104 + 1.0;
    bool _1108 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1110 = isnan(_455);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1116 = _1112 || _1114;
    float _1118 = float(_1116);
    float _1120 = fma(_1098, _992, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    int _1122 = ~_834;
    int _1124 = _1122 + _930;
    int _1126 = _1124 + 1;
    float _1128 = _475 * _1106;
    bool _1130 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1132 = isnan(_455);
    bool _1134 = _1130 || _1132;
    bool _1136 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1138 = _1134 || _1136;
    float _1140 = float(_1138);
    float _1142 = _1118 * _495;
    int _1144 = abs(_874);
    int _1146 = _479 * _1126;
    int _1148 = _1146 + _704;
    float _1150 = -_1118;
    float _1152 = _1150 + 1.0;
    int _1154 = ~_1144;
    int _1156 = _1154 + 1;
    int _1158 = _1156 + 1;
    float _1160 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1162 = int(_1160);
    int _1164 = ~_1042;
    int _1166 = _1164 + 1;
    int _1168 = _1166 + 1;
    float _1170 = _1094 * _1152;
    float _1172 = -_1094;
    float _1174 = _1172 + 1.0;
    int _1176 = abs(_892);
    int _1178 = _1168 * as_type<int>(_980);
    bool _1180 = !_632;
    int _1182 = _1180 ? _1148 : (-1);
    float _1184 = _1140 * _1174;
    float _1186 = -_1140;
    float _1188 = _1186 + 1.0;
    int _1190 = _1158 * as_type<int>(_972);
    int _1192 = _1190 + _1178;
    int _1194 = ~_1100;
    int _1196 = _1194 + 1;
    int _1198 = _1196 + 1;
    float _1200 = _1020 * _1184;
    float _1202 = _1030 * _1184;
    int _1204 = _1198 * as_type<int>(_1006);
    int _1206 = _1204 + _1192;
    float _1208 = float(uint(_1162));
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _1212 = _1210 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    int _1214 = ~_1176;
    int _1216 = _1214 + 1;
    int _1218 = _1216 + 1;
    float _1220 = fma(_415, _826, _924);
    float _1222 = fma(_1212, _992, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    int _1224 = abs(_1162);
    float _1226 = 1.0 / _1208;
    int _1228 = ~_802;
    int _1230 = _1228 + 1;
    int _1232 = _1230 + 1;
    int _1234 = _1218 * as_type<int>(_1014);
    int _1236 = _1234 + _1206;
    float _1238 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1200);
    float _1240 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1202);
    int _1242 = _1236 * _1232;
    float _1244 = float(uint(_1224));
    float _1246 = fma(_1040, _1170, _1238);
    float _1248 = fma(_1064, _1170, _1240);
    int _1250 = _1182 * _802;
    int _1252 = _1250 + _1242;
    float _1254 = fma(_415, _840, _946);
    float _1256 = 1.0 / _1244;
    float _1258 = fma(_1062, _1142, _1246);
    float _1260 = fma(_1066, _1142, _1248);
    float _1262 = float(uint(_1252));
    float _1264 = in.m_56.x;
    float _1266 = in.m_56.y;
    int _1268 = as_type<int>(_1226) + (-2);
    float _1270 = fma(_1120, _1128, _1258);
    float _1272 = fma(_1222, _1128, _1260);
    int _1274 = abs(_1252);
    float _1276 = as_type<float>(_1268) * _1262;
    float _1278 = _1220 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _1280;
    float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1286 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _1284;
    int _1288 = ~_1162;
    int _1290 = _1288 + 1;
    float _1292 = _1254 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1294 = trunc(_1276);
    float _1296 = precise::max(_1294, 0.0);
    uint _1298 = uint(_1296);
    float _1300 = fma(_1282, _1044, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    int _1302 = as_type<int>(_1256) + (-2);
    float _1304 = fma(_1286, _1044, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _1306 = float(uint(_1274));
    float _1308 = fma(_1300, _1102, _1270);
    int _1310 = ~_1224;
    int _1312 = _1310 + 1;
    float _1314 = fma(_1304, _1102, _1272);
    float _1316 = as_type<float>(_1302) * _1306;
    float _1318 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[148].x, _1308);
    float _1320 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[148].y, _1314);
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1324 = ~_1224;
    int _1326 = _1324 + 1;
    float _1328 = trunc(_1316);
    float _1330 = precise::max(_1328, 0.0);
    uint _1332 = uint(_1330);
    float _1334 = _1318 * _1264;
    int _1336 = _1290 * int(_1298);
    int _1338 = _1336 + _1252;
    float _1340 = _145 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1342 = _1320 * _1266;
    float _1344 = _419 * _1334;
    float _1346 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _203);
    float _1348 = float(uint(_1338));
    float _1350 = -_1322;
    float _1352 = fma(_1340, 2.0, _1350);
    float _1354 = _423 * _1342;
    float _1356 = _1344 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1358 = as_type<float>(_1268) * _1348;
    float _1360 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _221);
    float _1362 = _1354 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1364 = _1356 * _1346;
    int _1366 = _1326 * int(_1332);
    int _1368 = _1366 + _1274;
    float _1370 = fma(_415, _868, _936);
    float _1372 = trunc(_1358);
    float _1374 = precise::max(_1372, 0.0);
    uint _1376 = uint(_1374);
    float _1378 = _1362 * _1360;
    float _1380 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1382 = float(uint(_1368));
    float _1384 = _1370 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1386 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1388 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1390 = as_type<float>(_1302) * _1382;
    float _1392 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1386);
    float _1394 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1388);
    float _1396 = in.m_51.y;
    float _1398 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1392);
    float _1400 = trunc(_1390);
    float _1402 = precise::max(_1400, 0.0);
    uint _1404 = uint(_1402);
    float _1406 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1394);
    int _1408 = int(_1298) + int(_1376);
    float _1410 = _1398 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1412 = ~_1162;
    int _1414 = _1412 + 1;
    float _1416 = _1406 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1418 = _1278 + _1410;
    float _1420 = _1292 + _1416;
    float _1422 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1424 = _1418 + _1422;
    int _1426 = _1414 * _1408;
    int _1428 = _1426 + _1252;
    float _1430 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1432 = _1420 + _1430;
    float _1434 = _1424 * _1424;
    int _1436 = int(_1332) + int(_1404);
    float _1438 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1440 = _1432 * _1432;
    bool _1442 = uint(_1428) >= uint(_1162);
    int _1444 = _1312 * _1436;
    int _1446 = _1444 + _1274;
    float _1448 = _1434 + _1440;
    bool _1450 = !_1442;
    int _1452 = _1450 ? 0 : (-1);
    float _1454 = _1396 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1456 = sqrt(_1448);
    bool _1458 = uint(_1446) >= uint(_1224);
    float _1460 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1462 = ~_1408;
    int _1464 = _1462 + _1452;
    int _1466 = _1464 + 1;
    float _1468 = fma(_1454, -2.0, _1438);
    bool _1470 = !_1458;
    int _1472 = _1470 ? 0 : (-1);
    float _1474 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1460);
    bool _1476 = _145 > 0.5;
    int _1478 = _1162 * _1466;
    int _1480 = _1478 + _1252;
    float _1482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1484 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1474);
    float _1486 = -_203;
    int _1488 = _1476 ? as_type<int>(_1486) : as_type<int>(_203);
    float _1490 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1492 = _1162 == 0;
    float _1494 = _1484 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1496 = _1252 ^ _1162;
    bool _1498 = !_1492;
    int _1500 = _1498 ? _1480 : (-1);
    float _1502 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1504 = _1456 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1506 = _1384 + _1494;
    bool _1508 = !_896;
    float _1510 = _1508 ? _203 : as_type<float>(_1488);
    float _1512 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    uint _1514 = uint(int(uint(_1496) >> uint(31)));
    bool _1516 = _1162 == 0;
    float _1518 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1520 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1522 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1524 = ~_1472;
    int _1526 = _1436 + _1524;
    int _1528 = _1526 + 1;
    float _1530 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1518);
    int _1532 = ~int(_1514);
    int _1534 = _1532 + 1;
    float _1536 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1520);
    float _1538 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1522);
    float _1540 = _1512;
    float _1542 = _1494;
    float _1544 = _1418;
    float _1546 = _1522;
    float _1548 = _1128;
    float _1550 = _1396;
    if (!_1504)
    {
        _1540 = _1418;
    }
    float _1552 = _1540;
    float _1554 = _1552;
    if (!_1504)
    {
        _227 = _1440;
    }
    float _1556 = _227;
    float _1558 = _1556;
    if (!_1504)
    {
        _1542 = _1434;
    }
    float _1560 = _1542;
    float _1562 = _1560;
    if (!_1504)
    {
        _1544 = _1420;
    }
    float _1564 = _1544;
    int _1566 = _1528 ^ _1534;
    float _1568 = _1564;
    if (!_1504)
    {
        _1546 = _1506;
    }
    float _1570 = _1546;
    bool _1572 = !_1504;
    float _1574 = _1570;
    if (!_1572)
    {
        float _1576 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1578 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1580 = _1456 + _1578;
        float _1582 = rsqrt(_1448);
        float _1584 = _1580 * _1576;
        float _1586 = _1506 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1588 = _1584 * 0.15915493667125701904296875;
        float _1590 = _1588 * 6.283185482025146484375;
        float _1592 = sin(_1590);
        float _1594 = _1588 * 6.283185482025146484375;
        float _1596 = cos(_1594);
        float _1598 = fma(_1592, _1586, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1600 = _1582 * _1598;
        float _1602 = _1596 + (-1.0);
        float _1604 = fma(_1424, _1600, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1606 = fma(_1432, _1600, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1608 = _1602 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1610 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1612 = _1604 + _1610;
        float _1614 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1616 = _1606 + _1614;
        float _1618 = fma(_1506, _1596, _1608);
        float _1620 = _1612 * _1612;
        float _1622 = _1616 * _1616;
        _1574 = _1618;
        _1562 = _1620;
        _1558 = _1622;
        _1554 = _1604;
        _1568 = _1606;
    }
    float _1624 = _1574;
    float _1626 = _1562;
    float _1628 = _1558;
    float _1630 = _1554;
    float _1632 = _1568;
    int _1634 = ~_1534;
    int _1636 = _1634 + _1566;
    int _1638 = _1636 + 1;
    float _1640 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1642 = _1624 + _1640;
    float _1644 = float(_1500);
    float _1646 = _1502 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1648 = !_1516;
    int _1650 = _1648 ? _1638 : (-1);
    float _1652 = fma(_1642, _1642, _1626);
    float _1654 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1468);
    float _1656 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1658 = float(_1650);
    float _1660 = -_125;
    float _1662 = fma(_1660, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1352);
    float _1664 = _1652 + _1628;
    float _1666 = _1510 + 0.5;
    float _1668 = -_1654;
    float _1670 = fma(_1646, _1658, _1668);
    float _1672 = fma(_1656, _1644, _1662);
    float _1674 = sqrt(_1664);
    float _1676 = fma(_1656, _1666, _1672);
    float _1678 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1680 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1682 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1686 = _1396 > 0.5;
    float _1688 = _1678 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1690 = _1680 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1692 = _1682 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1694 = in.m_51.z;
    float _1696 = -_221;
    int _1698 = _1686 ? as_type<int>(_1696) : as_type<int>(_221);
    float _1700 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1702 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    out.m_64.x = _1688;
    out.m_64.y = _1690;
    out.m_64.z = _1692;
    out.m_64.w = _1684;
    bool _1704 = !_900;
    float _1706 = _1704 ? _221 : as_type<float>(_1698);
    float _1708 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1700);
    float _1710 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1702);
    float _1712 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1714 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1708);
    float _1716 = _1706 + (-0.5);
    float _1718 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1710);
    bool _1720 = _1674 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1722 = isnan(_1674);
    bool _1724 = _1720 || _1722;
    bool _1726 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1728 = _1724 || _1726;
    float _1730 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1736 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1738 = -_1714;
    float _1740 = _1738 + 1.0;
    float _1742 = -_1646;
    float _1744 = fma(_1742, _1716, _1670);
    float _1746 = -_1718;
    float _1748 = _1746 + 1.0;
    float _1750 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1752 = _1732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1754 = _1734 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1756 = _1736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1758 = -_1740;
    float _1760 = fma(_1510, _1758, _1676);
    float _1762 = fma(_1706, _1748, _1744);
    out.m_66.x = _1752;
    out.m_66.y = _1754;
    out.m_66.z = _1756;
    out.m_66.w = _1750;
    float _1764 = _1712 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1766 = _1730 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1768 = (*spvDescriptorSet0.vp_c9)._m0[81].z + (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1770 = (*spvDescriptorSet0.vp_c9)._m0[81].w + (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1772 = _1694 > 0.5;
    float _1774 = _1530 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1776 = _1536 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[83].x + (*spvDescriptorSet0.vp_c9)._m0[83].z;
    float _1780 = (*spvDescriptorSet0.vp_c9)._m0[83].y + (*spvDescriptorSet0.vp_c9)._m0[83].w;
    float _1782 = _1538 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1784 = _1750;
    float _1786 = _1684;
    float _1788 = _1694;
    if (!_1728)
    {
        _1784 = 1.0;
    }
    float _1790 = _1784;
    bool _1792 = !_1728;
    float _1794 = _1790;
    if (!_1792)
    {
        bool _1796 = _1674 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1798 = isnan(_1674);
        bool _1800 = _1796 || _1798;
        bool _1802 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1804 = _1800 || _1802;
        if (!_1804)
        {
            float _1806 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1808 = _1674 + _1806;
            float _1810 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1812 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1810;
            float _1814 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1816 = _1814 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1818 = 1.0 / _1812;
            float _1820 = _1808 * _1818;
            float _1822 = fma(_1820, _1816, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1794 = _1822;
            _1824 = true;
        }
        else
        {
            bool _1826 = _1674 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1828 = isnan(_1674);
            bool _1830 = _1826 || _1828;
            bool _1832 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1834 = _1830 || _1832;
            if (!_1834)
            {
                float _1836 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1838 = _1674 + _1836;
                float _1840 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1842 = _1840 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1844 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1846 = _1844 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1848 = 1.0 / _1842;
                float _1850 = _1838 * _1848;
                float _1852 = fma(_1850, _1846, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1794 = _1852;
                _1824 = true;
            }
            else
            {
                _1794 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1824 = false;
    float _1854 = _1794;
    float _1856 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1858 = _1624 + _1856;
    float _1860 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1862 = _1630 + _1860;
    float _1864 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1866 = _1632 + _1864;
    float _1868 = fma(_1858, _1854, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1870 = fma(_1862, _1854, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1872 = fma(_1866, _1854, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1874 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1876 = _1868 + _1874;
    float _1878 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1880 = _1870 + _1878;
    float _1882 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1884 = _1872 + _1882;
    float _1886 = _1876 * _1876;
    float _1888 = fma(_1880, _1880, _1886);
    float _1890 = fma(_1884, _1884, _1888);
    float _1892 = rsqrt(_1890);
    float _1894 = _1892 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1896 = _1880 * _1894;
    float _1898 = _1884 * _1894;
    float _1900 = _1896 * _1896;
    float _1902 = _1898 * _1898;
    float _1904 = _1900 + _1902;
    float _1906 = sqrt(_1904);
    bool _1908 = _1906 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1910 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1912 = _1906 + _1910;
    float _1914 = _1884;
    float _1916 = _1904;
    float _1918 = _1912;
    float _1920 = _1876;
    float _1922 = _1896;
    if (_1908)
    {
        float _1924 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1914 = _1924;
    }
    float _1926 = _1914;
    if (_1908)
    {
        float _1928 = rsqrt(_1904);
        _1916 = _1928;
    }
    float _1930 = _1916;
    if (_1908)
    {
        float _1932 = _1912 * _1926;
        _1918 = _1932;
    }
    float _1934 = _1918;
    if (_1908)
    {
        float _1936 = _1934 * 0.15915493667125701904296875;
        _1786 = _1936;
    }
    float _1938 = _1786;
    float _1940 = _1892;
    float _1942 = _1938;
    if (_1908)
    {
        float _1944 = _1938 * 6.283185482025146484375;
        float _1946 = sin(_1944);
        _1940 = _1946;
    }
    float _1948 = _1940;
    float _1950 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1952 = precise::max(0.0, _1950);
    float _1954 = _1926;
    float _1956 = _1952;
    if (_1908)
    {
        float _1958 = _1938 * 6.283185482025146484375;
        float _1960 = cos(_1958);
        _1954 = _1960;
    }
    float _1962 = _1954;
    float _1964 = -_1894;
    float _1966 = -_1952;
    float _1968 = fma(_1876, _1964, _1966);
    if (_1908)
    {
        float _1970 = _1968 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1920 = _1970;
    }
    float _1972 = _1920;
    float _1974 = _1948;
    float _1976 = _1972;
    if (_1908)
    {
        float _1978 = fma(_1948, _1972, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1974 = _1978;
    }
    float _1980 = _1974;
    float _1982 = _1980;
    if (!_1908)
    {
        _1976 = _1968;
    }
    float _1984 = _1976;
    float _1986 = _1984;
    float _1988 = _1962;
    if (_1908)
    {
        float _1990 = _1962 + (-1.0);
        _1956 = _1990;
    }
    float _1992 = _1956;
    float _1994 = _1992;
    if (_1908)
    {
        float _1996 = _1930 * _1980;
        _1548 = _1996;
    }
    float _1998 = _1548;
    if (!_1908)
    {
        _1982 = _1898;
    }
    float _2000 = _1982;
    float _2002 = sqrt(_1890);
    float _2004 = _2000;
    if (_1908)
    {
        float _2006 = _1992 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1942 = _2006;
    }
    float _2008 = _1942;
    if (_1908)
    {
        float _2010 = _1896 * _1998;
        _1922 = _2010;
    }
    float _2012 = _1922;
    if (!_1908)
    {
        _1994 = _1900;
    }
    float _2014 = _1994;
    float _2016 = _2014;
    if (_1908)
    {
        float _2018 = _1898 * _1998;
        _2004 = _2018;
    }
    float _2020 = _2004;
    if (_1908)
    {
        float _2022 = fma(_1968, _1962, _2008);
        _1986 = _2022;
    }
    float _2024 = _1986;
    if (_1908)
    {
        float _2026 = _2012 * _2012;
        _2016 = _2026;
    }
    float _2028 = _2016;
    if (!_1908)
    {
        _1988 = _1902;
    }
    float _2030 = _1988;
    float _2032 = _2030;
    if (_1908)
    {
        float _2034 = _2020 * _2020;
        _2032 = _2034;
    }
    float _2036 = _2032;
    float _2038 = fma(_2024, _2024, _2028);
    float _2040 = _1868 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2042 = _2038 + _2036;
    float _2044 = _1868 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2046 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2048 = fma(_2002, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2046);
    float _2050 = precise::clamp(_2048, 0.0, 1.0);
    float _2052 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2054 = rsqrt(_2042);
    float _2056 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2044);
    float _2058 = _1868 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2060 = -_2050;
    float _2062 = _2060 + 1.0;
    float _2064 = _1868 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2066 = fma(_1872, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2056);
    float _2068 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2058);
    float _2070 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2064);
    float _2072 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2040);
    float _2074 = fma(_1872, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2068);
    float _2076 = _2066 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2078 = fma(_1872, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2070);
    float _2080 = abs(_2062);
    float _2082 = log2(_2080);
    float _2084 = _2074 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2086 = _2076 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2088 = _2054 * _2012;
    float _2090 = _2078 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2092 = _2084 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2094 = _2054 * _2024;
    float _2096 = _2088 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2098 = fma(_1872, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2072);
    float _2100 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2092);
    float _2102 = _2054 * _2020;
    float _2104 = -_2096;
    float _2106 = fma(_2094, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2104);
    float _2108 = -_2086;
    float _2110 = fma(_2108, _2052, 1.0);
    float _2112 = _2098 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2114 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2100);
    float _2116 = -_2102;
    float _2118 = fma(_2116, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2106);
    float _2120 = _2082 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2122 = _2084 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2124 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2114);
    float _2126 = fma(_2118, -0.5, 0.5);
    float _2128 = log2(_2110);
    float _2130 = _2084 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2132 = fma(_2118, 0.5, 0.5);
    float _2134 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2122);
    float _2136 = _2094 + 1.0;
    float _2138 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2130);
    float _2140 = fma(_2132, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2142 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2134);
    float _2144 = 1.0 / _2124;
    float _2146 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2138);
    float _2148 = fma(_2132, _2140, -0.212114393711090087890625);
    float _2150 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2142);
    float _2152 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2146);
    float _2154 = fma(_2132, _2148, 1.570728778839111328125);
    float _2156 = exp2(_2120);
    float _2158 = _2128 * 0.693147182464599609375;
    float _2160 = _2158 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2162 = sqrt(_2126);
    float _2164 = _2150 * _2144;
    float _2166 = _2152 * _2144;
    float _2168 = fma(_2164, 0.5, 0.5);
    float _2170 = fma(_2166, -0.5, 0.5);
    float _2172 = -_2094;
    float _2174 = fma(_2156, _2136, _2172);
    float3 _5601 = float3(_2168, _2170, _2160);
    float _2176 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5601, float3(0.0), isnan(_5601)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5601, float3(0.0), isnan(_5601)), level(0.0)).x;
    float _2178 = fma(_2174, 0.5, 0.5);
    float _2180 = _2162 * 0.636619746685028076171875;
    float _2182 = -_2154;
    float _2184 = fma(_2180, _2182, 1.0);
    float3 _5622 = float3(_2168, _2170, _2160);
    float4 _2187 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5622, float3(0.0), isnan(_5622)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5622, float3(0.0), isnan(_5622)), level(0.0)).xyzw;
    float _2189 = _2187.x;
    float _2191 = _2187.y;
    float _2193 = _2187.z;
    float _2195 = _2187.w;
    float2 _5639 = float2(_2184, _2178);
    float3 _2199 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5639, float2(0.0), isnan(_5639)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5639, float2(0.0), isnan(_5639)), level(0.0)).xyz;
    float _2201 = _2199.x;
    float _2203 = _2199.y;
    float _2205 = _2199.z;
    float _2207 = _1776 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2209 = _1776 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2211 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2207);
    float _2213 = _1776 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2215 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2209);
    float _2217 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2211);
    float _2219 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2213);
    float _2221 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2215);
    float _2223 = _2215;
    if (!_525)
    {
        _2223 = _1694;
    }
    float _2225 = _2223;
    float _2227 = _2217 * _2217;
    float _2229 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2219);
    float _2231 = _2225;
    if (_525)
    {
        _1788 = _1396;
    }
    float _2233 = _1788;
    float _2235 = fma(_2221, _2221, _2227);
    if (_525)
    {
        _2231 = _1396;
    }
    float _2237 = _2231;
    float _2239 = fma(_2233, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1780);
    float _2241 = fma(_2229, _2229, _2235);
    if (_525)
    {
        _1550 = _145;
    }
    float _2243 = _1550;
    float _2245 = _2084 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2247 = _2237 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2249 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2239);
    float _2251 = rsqrt(_2241);
    float _2253 = _2243 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2255 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2245);
    float _2257 = fma(_2243, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1778);
    float _2259 = fma(_2247, -2.0, _1770);
    float _2261 = -_1768;
    float _2263 = fma(_2253, 2.0, _2261);
    float _2265 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2255);
    float _2267 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2257);
    float _2269 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2259);
    float _2271 = -_2249;
    float _2273 = _2271 + 1.0;
    float _2275 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2265);
    float _2277 = -_2267;
    float _2279 = _2277 + 1.0;
    float _2281 = _2221 * _2251;
    float _2283 = _2217 * _2251;
    float _2285 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2287 = fma(_2281, 0.5, 0.5);
    float _2289 = _2082 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2291 = fma(_2283, -0.5, 0.5);
    float _2293 = -_125;
    float _2295 = fma(_2293, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2263);
    float _2297 = _2275 + _2124;
    float _2299 = _2287;
    float _2301 = _2291;
    if (_908)
    {
        float _2303 = -_2287;
        float _2305 = _1772 ? _2303 : _2287;
        _2299 = _2305;
    }
    float _2307 = _2299;
    out.m_47.x = _2285;
    float _2309 = exp2(_2289);
    if (_912)
    {
        float _2311 = -_2291;
        float _2313 = _938 ? _2311 : _2291;
        _2301 = _2313;
    }
    float _2315 = _2301;
    float _2317 = _2307 + 0.5;
    float _2319 = fma(_1764, _2317, _2295);
    float _2321 = _2315 + (-0.5);
    float _2323 = -_2279;
    float _2325 = fma(_2323, _2307, _2319);
    float _2327 = -_1766;
    float _2329 = -_2269;
    float _2331 = fma(_2327, _2321, _2329);
    float _2333 = _2297 * 0.5;
    float _2335 = -_2309;
    float _2337 = _2335 + 1.0;
    float _2339 = fma(_2273, _2315, _2331);
    out.m_68.z = _2333;
    out.m_68.w = _2124;
    float _2341 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2150;
    out.gl_Position.y = _2152;
    out.gl_Position.z = _2275;
    out.gl_Position.w = _2124;
    out.m_70.x = _1760;
    out.m_70.y = _1762;
    out.m_70.z = _2325;
    out.m_70.w = _2339;
    float _2343 = _2341 * _2176;
    float _2345 = -_2341;
    float _2347 = _2345 + 1.0;
    float _2349 = _2195 * _2343;
    float _2351 = _2195 * _2347;
    float _2353 = _2205 * _2343;
    float _2355 = fma(_2201, _2349, _2189);
    float _2357 = fma(_2203, _2349, _2191);
    float _2359 = fma(_2195, _2353, _2193);
    out.m_72.x = _2355;
    out.m_72.y = _2357;
    out.m_72.z = _2359;
    out.m_72.w = _2351;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

