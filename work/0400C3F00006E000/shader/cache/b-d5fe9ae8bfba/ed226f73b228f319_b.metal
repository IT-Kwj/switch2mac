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
    float4 m_60 [[attribute(1)]];
    float4 m_62 [[attribute(2)]];
    float4 m_58 [[attribute(3)]];
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
    bool _1778 = false;
    bool _445 = false;
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
        float _2370 = as_type<float>(_107);
        out.gl_Position.z = _2370;
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
        float _2439 = as_type<float>(_143);
        out.gl_Position.z = _2439;
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
    if (!_161)
    {
        float _227 = _209 * _209;
        float _229 = _227 * 0.5;
        _223 = _229;
    }
    float _231 = _223;
    float _233 = _231;
    if (!_161)
    {
        float _235 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _233 = _235;
    }
    float _237 = _233;
    float _239 = _197 * 6.283185482025146484375;
    float _241 = cos(_239);
    float _243 = -_199;
    float _245 = _175 + _243;
    bool _247 = !_161;
    float _249 = _237;
    if (!_247)
    {
        float _251 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _253 = log2(_251);
        float _255 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _257 = _255 + 1.0;
        float _259 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = _209 * _253;
        float _263 = 1.0 / _257;
        float _265 = _259 * 0.693147182464599609375;
        float _267 = exp2(_261);
        float _269 = 1.0 / _265;
        float _271 = _267 + (-1.0);
        float _273 = -_271;
        float _275 = fma(_273, _269, _209);
        float _277 = _275 * _263;
        float _279 = _277 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _249 = _279;
    }
    float _281 = _249;
    bool _283 = !_161;
    if (!_283)
    {
        float _285 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = log2(_285);
        float _289 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _291 = _289 + 1.0;
        float _293 = 1.0 / _291;
        float _295 = _209 * _287;
        float _297 = exp2(_295);
        float _299 = -_297;
        float _301 = _299 + 1.0;
        float _303 = _301 * _293;
        _225 = _303;
    }
    float _305 = _225;
    float _307 = fma(_241, 0.5, 0.5);
    float _309 = in.m_56.w;
    bool _311 = _213 < 0.5;
    float _313 = float(_311);
    float _315 = fma(_217, 0.5, 0.5);
    int _317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _319 = _317 != 0;
    int _321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _323 = _321 != 0;
    float _325 = in.m_44.x;
    float _327 = in.m_44.y;
    float _329 = in.m_44.z;
    float _331 = -_313;
    float _333 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _335 = -_213;
    float _337 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _339 = !_319;
    int _341 = _339 ? 0 : 1;
    float _343 = -_315;
    float _345 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _347 = _245 < 0.5;
    float _349 = float(_347);
    float _351 = -_307;
    float _353 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _355 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _357 = abs(_341);
    float _359 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _361 = -_349;
    float _363 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _365 = fma(_305, _193, _355);
    bool _367 = !_207;
    int _369 = _367 ? 0 : 1;
    float _371 = fma(_305, _191, _359);
    float _373 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _375 = !_323;
    int _377 = _375 ? 0 : 1;
    float _379 = -_245;
    float _381 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _383 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _385 = fma(_305, _195, _373);
    int _387 = abs(_369);
    float _389 = float(_357);
    float _391 = fma(_371, _309, _325);
    int _393 = abs(_377);
    float _395 = fma(_385, _309, _329);
    float _397 = float(_387);
    float _399 = abs(_337);
    float _401 = _389 * _399;
    float _403 = abs(_381);
    float _405 = _389 * _403;
    float _407 = float(_393);
    float _409 = fma(_365, _309, _327);
    float _411 = fma(_397, _345, _401);
    float _413 = fma(_397, _353, _405);
    float _415 = abs(_333);
    float _417 = fma(_407, _415, _411);
    float _419 = abs(_363);
    float _421 = fma(_407, _419, _413);
    bool _423 = !_383;
    float _441;
    float _443;
    if (!_423)
    {
        float _425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _427 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _429 = float(_91);
        float _431 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _433 = _431 * _425;
        float _435 = floor(_433);
        float _437 = -_435;
        float _439 = _433 + _437;
        _441 = _429;
        _443 = _439;
        _445 = true;
    }
    else
    {
        float _447 = float(_91);
        float _449 = 1.0 / _447;
        float _451 = _125 * _449;
        _441 = _447;
        _443 = _451;
    }
    _445 = false;
    float _453 = _441;
    float _455 = _443;
    float _457 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _459 = int(_457);
    float _461 = in.m_51.w;
    float _463 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _465 = int(_463);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _467;
    float _471 = float(_459);
    float _473 = 1.0 / _453;
    float _475 = float(uint(_465));
    float _477 = 1.0 / _471;
    int _479 = ~_465;
    int _481 = _479 + 1;
    int _483 = ~_465;
    int _485 = _483 + 1;
    int _487 = ~_465;
    int _489 = _487 + 1;
    float _491 = 1.0 / _475;
    float _493 = _125 * _477;
    float _495 = 1.0 / _469;
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _499 = _497 != 0;
    int _501 = as_type<int>(_491) + (-2);
    float _503 = trunc(_493);
    int _505 = int(_503);
    float _507 = float(uint(_505));
    float _509 = as_type<float>(_501) * _507;
    float _511 = trunc(_509);
    float _513 = precise::max(_511, 0.0);
    uint _516 = uint(_513);
    float _518 = float(_505);
    int _520 = _481 * int(_516);
    int _522 = _520 + _505;
    float _524 = float(_465);
    float _526 = float(uint(_522));
    bool _528 = _518 >= _524;
    bool _530 = isnan(_518);
    bool _532 = _528 || _530;
    bool _534 = isnan(_524);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = as_type<float>(_501) * _526;
    float _542 = trunc(_538);
    int _544 = int(_542);
    bool _546 = !_499;
    float _548 = _546 ? 7.345489978790283203125 : 1.0;
    float _550 = _548 * _145;
    float _552 = trunc(_540);
    float _554 = precise::max(_552, 0.0);
    uint _556 = uint(_554);
    float _558 = floor(_550);
    int _560 = int(_516) + int(_556);
    int _562 = _485 * _560;
    int _564 = _562 + _505;
    float _566 = -_558;
    float _568 = _550 + _566;
    int _570 = ~_544;
    int _572 = _570 + 1;
    int _574 = _572 + 1;
    bool _576 = uint(_564) >= uint(_465);
    bool _578 = !_576;
    int _580 = _578 ? 0 : (-1);
    int _582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _584 = _582 != 0;
    int _586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _588 = _586 != 0;
    int _590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _592 = _590 != 0;
    int _594 = ~_560;
    int _596 = _594 + _580;
    int _598 = _596 + 1;
    float _600 = _568 * _524;
    bool _602 = _465 == 0;
    float _604 = _125 * _524;
    int _606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _608 = _606 != 0;
    int _610 = _465 * _598;
    int _612 = _610 + _505;
    int _614 = _465 + (-1);
    float _616 = _604 * _473;
    float _618 = trunc(_600);
    int _620 = int(_618);
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _624 = _622 != 0;
    bool _626 = !_602;
    int _628 = _626 ? _612 : (-1);
    bool _630 = !_608;
    int _632 = _630 ? 0 : 1;
    int _634 = _628 * _574;
    float _636 = trunc(_616);
    int _638 = int(_636);
    bool _640 = !_588;
    int _642 = _640 ? 0 : 1;
    int _644 = _544 * _614;
    int _646 = _644 + _634;
    bool _648 = !_584;
    int _650 = _648 ? 0 : 1;
    int _652 = abs(_642);
    bool _654 = !_592;
    int _656 = _654 ? 0 : 1;
    int _658 = abs(_650);
    int _660 = _646 * _652;
    bool _662 = !_624;
    int _664 = _662 ? 0 : 1;
    int _666 = abs(_656);
    int _668 = abs(_632);
    int _670 = abs(_664);
    int _672 = _620 * _668;
    int _674 = _672 + _505;
    int _676 = _638 * _658;
    int _678 = _676 + _660;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _680;
    int _684 = ~_465;
    int _686 = _684 + 1;
    int _688 = _674 * _666;
    int _690 = _688 + _678;
    int _692 = ~_465;
    int _694 = _692 + 1;
    float _696 = 1.0 / _682;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _700 = _698 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _702 = _620 * _670;
    int _704 = _702 + _690;
    int _706 = ~_465;
    int _708 = _706 + 1;
    float _710 = float(uint(_674));
    float _712 = float(uint(_704));
    float _714 = 1.0 / _700;
    float _716 = as_type<float>(_501) * _710;
    float _718 = as_type<float>(_501) * _712;
    float _720 = trunc(_716);
    float _722 = precise::max(_720, 0.0);
    uint _724 = uint(_722);
    float _726 = trunc(_718);
    float _728 = precise::max(_726, 0.0);
    uint _730 = uint(_728);
    int _732 = _708 * int(_730);
    int _734 = _732 + _704;
    float _736 = float(uint(_734));
    float _738 = as_type<float>(_501) * _736;
    float _740 = trunc(_738);
    float _742 = precise::max(_740, 0.0);
    uint _744 = uint(_742);
    int _746 = int(_730) + int(_744);
    int _748 = _686 * _746;
    int _750 = _748 + _704;
    int _752 = _694 * int(_724);
    int _754 = _752 + _674;
    bool _756 = uint(_750) >= uint(_465);
    float _758 = float(uint(_754));
    bool _760 = !_756;
    int _762 = _760 ? 0 : (-1);
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _766 = _764 != 0;
    float _768 = as_type<float>(_501) * _758;
    int _770 = ~_746;
    int _772 = _770 + _762;
    int _774 = _772 + 1;
    bool _776 = !_766;
    int _778 = _776 ? 0 : 1;
    float _780 = trunc(_768);
    float _782 = precise::max(_780, 0.0);
    uint _784 = uint(_782);
    int _786 = _465 * _774;
    int _788 = _786 + _704;
    int _790 = abs(_778);
    bool _792 = !_602;
    int _794 = _792 ? _788 : (-1);
    int _796 = _794 & 3;
    bool _798 = _796 != 0;
    int _800 = _794 >> 31;
    bool _802 = uint(_796) > 1u;
    int _804 = _794 & 3;
    bool _806 = _804 != 0;
    int _808 = _800 & 3;
    int _810 = _806 ? 0 : 1;
    int _812 = int(_724) + int(_784);
    int _814 = ~_810;
    int _816 = _814 + 1;
    int _818 = _816 + 1;
    float _820 = in.m_58.x;
    float _822 = in.m_58.y;
    float _824 = in.m_58.z;
    int _826 = _794 + _808;
    int _828 = _489 * _812;
    int _830 = _828 + _674;
    bool _832 = uint(_796) >= 2u;
    float _834 = in.m_60.x;
    float _836 = in.m_60.y;
    float _838 = in.m_60.z;
    bool _840 = _796 != 3;
    bool _842 = _796 != 3;
    int _844 = _818;
    if (!_802)
    {
        int _846 = ~_810;
        int _848 = _846 + 1;
        _844 = _848;
    }
    int _850 = _844;
    float _852 = in.m_62.x;
    float _854 = in.m_62.y;
    float _856 = in.m_62.z;
    bool _858 = !_798;
    int _860 = _858 ? 0 : 1;
    int _862 = _832 ? 0 : 1;
    bool _864 = !_842;
    int _866 = _864 ? 0 : (-1);
    int _868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _870 = _868 != 0;
    int _872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _874 = _872 != 0;
    int _876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _878 = _876 != 0;
    int _880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _882 = _880 != 0;
    float _884 = _409 * _822;
    int _886 = _826 >> 2;
    float _888 = _409 * _836;
    int _890 = ~_862;
    int _892 = _890 + 1;
    int _894 = _892 + 1;
    int _896 = _886 << 4;
    int _898 = _896 + 368;
    float _900 = fma(_391, _834, _888);
    int _902 = _894;
    if (_840)
    {
        int _904 = ~_862;
        int _906 = _904 + 1;
        _902 = _906;
    }
    int _908 = _902;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _912 = _910 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    uint _914 = uint(int(uint(_898) >> uint(2)));
    uint _916 = uint(int(uint(int(_914)) >> uint(2)));
    int _918 = int(_914) & 3;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[int(_916)][_918];
    int _922 = int(_914) + 1;
    uint _924 = uint(int(uint(_922) >> uint(2)));
    int _926 = _922 & 3;
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[int(_924)][_926];
    float _930 = _409 * _854;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _934 = _455 + _932;
    bool _936 = uint(_830) >= uint(_465);
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _940 = _455 + _938;
    float _942 = fma(_391, _852, _930);
    float _944 = _934 * _696;
    float _946 = 1.0 / _912;
    int _948 = _898 + 8;
    uint _950 = uint(int(uint(_948) >> uint(2)));
    uint _952 = uint(int(uint(int(_950)) >> uint(2)));
    int _954 = int(_950) & 3;
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[int(_952)][_954];
    int _958 = int(_950) + 1;
    uint _960 = uint(int(uint(_958) >> uint(2)));
    int _962 = _958 & 3;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[int(_960)][_962];
    bool _966 = !_936;
    int _968 = _966 ? 0 : (-1);
    float _970 = fma(_391, _820, _884);
    bool _972 = _461 > 0.5;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _976 = _455 + _974;
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _980 = _455 + _978;
    float _982 = _940 * _495;
    bool _984 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _986 = isnan(_455);
    bool _988 = _984 || _986;
    bool _990 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _992 = _988 || _990;
    float _994 = float(_992);
    float _996 = _980 * _714;
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1000 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _998;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1004 = _1002 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1006;
    float _1010 = -_994;
    float _1012 = _1010 + 1.0;
    float _1014 = _976 * _946;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1018 = _1016 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _1020 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1022 = isnan(_455);
    bool _1024 = _1020 || _1022;
    bool _1026 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1028 = _1024 || _1026;
    float _1030 = float(_1028);
    float _1032 = fma(_1004, _996, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _1034 = ~_812;
    int _1036 = _1034 + _968;
    int _1038 = _1036 + 1;
    float _1040 = fma(_1018, _996, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _1042 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1044 = isnan(_455);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1050 = _1046 || _1048;
    float _1052 = float(_1050);
    float _1054 = fma(_1000, _944, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1056 = fma(_1008, _944, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1058 = _1030 * _1012;
    float _1060 = -_1030;
    float _1062 = _1060 + 1.0;
    int _1064 = abs(_850);
    int _1066 = _465 * _1038;
    int _1068 = _1066 + _674;
    bool _1070 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1072 = isnan(_455);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1078 = _1074 || _1076;
    float _1080 = float(_1078);
    float _1082 = fma(_395, _824, _970);
    int _1084 = abs(_860);
    float _1086 = -_1052;
    float _1088 = _1086 + 1.0;
    bool _1090 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1092 = isnan(_455);
    bool _1094 = _1090 || _1092;
    bool _1096 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1098 = _1094 || _1096;
    float _1100 = float(_1098);
    float _1102 = _1052 * _1062;
    int _1104 = ~_1064;
    int _1106 = _1104 + 1;
    int _1108 = _1106 + 1;
    float _1110 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1112 = int(_1110);
    float _1114 = _1080 * _1088;
    float _1116 = -_1080;
    float _1118 = _1116 + 1.0;
    int _1120 = abs(_908);
    float _1122 = fma(_395, _838, _900);
    int _1124 = ~_1084;
    int _1126 = _1124 + 1;
    int _1128 = _1126 + 1;
    int _1130 = _1108 * as_type<int>(_928);
    int _1132 = abs(_866);
    float _1134 = _1100 * _1118;
    int _1136 = _1128 * as_type<int>(_920);
    int _1138 = _1136 + _1130;
    float _1140 = _1054 * _1134;
    int _1142 = ~_1120;
    int _1144 = _1142 + 1;
    int _1146 = _1144 + 1;
    float _1148 = -_1100;
    float _1150 = _1148 + 1.0;
    int _1152 = ~_1132;
    int _1154 = _1152 + 1;
    int _1156 = _1154 + 1;
    float _1158 = _1056 * _1134;
    float _1160 = float(uint(_1112));
    int _1162 = _1146 * as_type<int>(_956);
    int _1164 = _1162 + _1138;
    int _1166 = abs(_1112);
    float _1168 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1158);
    int _1170 = _1156 * as_type<int>(_964);
    int _1172 = _1170 + _1164;
    float _1174 = 1.0 / _1160;
    float _1176 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1140);
    float _1178 = fma(_1032, _1114, _1168);
    int _1180 = ~_790;
    int _1182 = _1180 + 1;
    int _1184 = _1182 + 1;
    float _1186 = fma(_1040, _1114, _1176);
    float _1188 = float(uint(_1166));
    float _1190 = in.m_51.y;
    bool _1192 = !_602;
    int _1194 = _1192 ? _1068 : (-1);
    int _1196 = _1172 * _1184;
    float _1198 = in.m_56.x;
    float _1200 = in.m_56.y;
    int _1202 = _1194 * _790;
    int _1204 = _1202 + _1196;
    float _1206 = 1.0 / _1188;
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1210 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1208;
    int _1212 = as_type<int>(_1174) + (-2);
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1214;
    float _1218 = float(uint(_1204));
    float _1220 = fma(_1210, _982, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1222 = _1122 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1224 = fma(_1216, _982, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _1228 = _1226 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1230 = as_type<float>(_1212) * _1218;
    float _1232 = fma(_1220, _1102, _1186);
    int _1234 = abs(_1204);
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1238 = _1236 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1240 = fma(_1228, _1014, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _1242 = fma(_1224, _1102, _1178);
    float _1244 = trunc(_1230);
    float _1246 = precise::max(_1244, 0.0);
    uint _1248 = uint(_1246);
    float _1250 = fma(_1238, _1014, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    int _1252 = as_type<int>(_1206) + (-2);
    float _1254 = fma(_1240, _1058, _1242);
    float _1256 = float(uint(_1234));
    float _1258 = fma(_1250, _1058, _1232);
    int _1260 = ~_1112;
    int _1262 = _1260 + 1;
    float _1264 = fma(_395, _856, _942);
    float _1266 = as_type<float>(_1252) * _1256;
    float _1268 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1258);
    float _1270 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1254);
    int _1272 = ~_1166;
    int _1274 = _1272 + 1;
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1278 = _1268 * _1198;
    float _1280 = trunc(_1266);
    float _1282 = precise::max(_1280, 0.0);
    uint _1284 = uint(_1282);
    int _1286 = _1262 * int(_1248);
    int _1288 = _1286 + _1204;
    float _1290 = _145 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1292 = _1270 * _1200;
    float _1294 = _417 * _1278;
    float _1296 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _203);
    float _1298 = float(uint(_1288));
    float _1300 = -_1276;
    float _1302 = fma(_1290, 2.0, _1300);
    float _1304 = _421 * _1292;
    float _1306 = _1294 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1308 = as_type<float>(_1212) * _1298;
    float _1310 = _1264 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1312 = _1304 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1314 = _1306 * _1296;
    float _1316 = trunc(_1308);
    float _1318 = precise::max(_1316, 0.0);
    uint _1320 = uint(_1318);
    int _1322 = _1274 * int(_1284);
    int _1324 = _1322 + _1234;
    float _1326 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _221);
    float _1328 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1330 = float(uint(_1324));
    float _1332 = _1312 * _1326;
    float _1334 = as_type<float>(_1252) * _1330;
    float _1336 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1338 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1340 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1336);
    float _1342 = trunc(_1334);
    float _1344 = precise::max(_1342, 0.0);
    uint _1346 = uint(_1344);
    float _1348 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1338);
    float _1350 = _1082 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1352 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1340);
    int _1354 = int(_1248) + int(_1320);
    float _1356 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1348);
    int _1358 = ~_1112;
    int _1360 = _1358 + 1;
    float _1362 = _1352 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1364 = ~_1166;
    int _1366 = _1364 + 1;
    float _1368 = _1356 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1370 = _1222 + _1362;
    int _1372 = _1360 * _1354;
    int _1374 = _1372 + _1204;
    float _1376 = _1350 + _1368;
    float _1378 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1380 = _1370 + _1378;
    int _1382 = int(_1284) + int(_1346);
    float _1384 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1386 = _1376 + _1384;
    bool _1388 = uint(_1374) >= uint(_1112);
    float _1390 = _1380 * _1380;
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1394 = _1386 * _1386;
    int _1396 = _1366 * _1382;
    int _1398 = _1396 + _1234;
    bool _1400 = !_1388;
    int _1402 = _1400 ? 0 : (-1);
    float _1404 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1406 = _1390 + _1394;
    bool _1408 = uint(_1398) >= uint(_1166);
    float _1410 = fma(_1404, -2.0, _1392);
    float _1412 = sqrt(_1406);
    int _1414 = ~_1354;
    int _1416 = _1414 + _1402;
    int _1418 = _1416 + 1;
    float _1420 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1422 = !_1408;
    int _1424 = _1422 ? 0 : (-1);
    bool _1426 = _145 > 0.5;
    int _1428 = _1112 * _1418;
    int _1430 = _1428 + _1204;
    float _1432 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1420);
    float _1434 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1436 = -_203;
    int _1438 = _1426 ? as_type<int>(_1436) : as_type<int>(_203);
    float _1440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1442 = _1112 == 0;
    float _1444 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1432);
    bool _1446 = !_870;
    float _1448 = _1446 ? _203 : as_type<float>(_1438);
    float _1450 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1452 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1454 = !_1442;
    int _1456 = _1454 ? _1430 : (-1);
    float _1458 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1460 = _1412 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1462 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1464 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1452);
    bool _1466 = _1112 == 0;
    float _1468 = _1444 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1470 = _1204 ^ _1112;
    float _1472 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1474 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1458);
    float _1476 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1462);
    uint _1478 = uint(int(uint(_1470) >> uint(31)));
    float _1480 = _1310 + _1468;
    int _1482 = ~_1424;
    int _1484 = _1382 + _1482;
    int _1486 = _1484 + 1;
    int _1488 = ~int(_1478);
    int _1490 = _1488 + 1;
    float _1492 = as_type<float>(_1478);
    float _1494 = _1370;
    float _1496 = _1468;
    float _1498 = _1310;
    float _1500 = _1376;
    float _1502 = _1186;
    float _1504 = _1190;
    if (!_1460)
    {
        _1492 = _1370;
    }
    float _1506 = _1492;
    float _1508 = _1506;
    if (!_1460)
    {
        _1494 = _1376;
    }
    float _1510 = _1494;
    float _1512 = _1510;
    if (!_1460)
    {
        _1496 = _1394;
    }
    float _1514 = _1496;
    float _1516 = _1514;
    if (!_1460)
    {
        _1498 = _1390;
    }
    float _1518 = _1498;
    int _1520 = _1486 ^ _1490;
    float _1522 = _1518;
    if (!_1460)
    {
        _1500 = _1480;
    }
    float _1524 = _1500;
    bool _1526 = !_1460;
    float _1528 = _1524;
    if (!_1526)
    {
        float _1530 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1532 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1534 = _1412 + _1532;
        float _1536 = rsqrt(_1406);
        float _1538 = _1534 * _1530;
        float _1540 = _1480 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1542 = _1538 * 0.15915493667125701904296875;
        float _1544 = _1542 * 6.283185482025146484375;
        float _1546 = sin(_1544);
        float _1548 = _1542 * 6.283185482025146484375;
        float _1550 = cos(_1548);
        float _1552 = fma(_1546, _1540, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1554 = _1536 * _1552;
        float _1556 = _1550 + (-1.0);
        float _1558 = fma(_1380, _1554, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1560 = fma(_1386, _1554, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1562 = _1556 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1564 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1566 = _1558 + _1564;
        float _1568 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1570 = _1560 + _1568;
        float _1572 = fma(_1480, _1550, _1562);
        float _1574 = _1566 * _1566;
        float _1576 = _1570 * _1570;
        _1528 = _1572;
        _1522 = _1574;
        _1516 = _1576;
        _1508 = _1558;
        _1512 = _1560;
    }
    float _1578 = _1528;
    float _1580 = _1522;
    float _1582 = _1516;
    float _1584 = _1508;
    float _1586 = _1512;
    int _1588 = ~_1490;
    int _1590 = _1588 + _1520;
    int _1592 = _1590 + 1;
    float _1594 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1596 = _1578 + _1594;
    float _1598 = float(_1456);
    float _1600 = _1472 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1602 = !_1466;
    int _1604 = _1602 ? _1592 : (-1);
    float _1606 = fma(_1596, _1596, _1580);
    float _1608 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1410);
    float _1610 = float(_1604);
    float _1612 = _1606 + _1582;
    float _1614 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1616 = _1440 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1618 = sqrt(_1612);
    float _1620 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1622 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1624 = -_125;
    float _1626 = fma(_1624, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1302);
    float _1628 = -_1608;
    float _1630 = fma(_1600, _1610, _1628);
    bool _1632 = _1190 > 0.5;
    float _1634 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1636 = _1620 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1638 = _1622 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1640 = _1614 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1642 = fma(_1616, _1598, _1626);
    float _1644 = in.m_51.z;
    float _1646 = -_221;
    int _1648 = _1632 ? as_type<int>(_1646) : as_type<int>(_221);
    float _1650 = _1448 + 0.5;
    float _1652 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1654 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    out.m_64.x = _1636;
    out.m_64.y = _1638;
    out.m_64.z = _1640;
    out.m_64.w = _1634;
    bool _1656 = !_874;
    float _1658 = _1656 ? _221 : as_type<float>(_1648);
    float _1660 = fma(_1616, _1650, _1642);
    float _1662 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1652);
    float _1664 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1654);
    float _1666 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1668 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1662);
    float _1670 = _1658 + (-0.5);
    float _1672 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1664);
    bool _1674 = _1618 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1676 = isnan(_1618);
    bool _1678 = _1674 || _1676;
    bool _1680 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1682 = _1678 || _1680;
    float _1684 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1686 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1688 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1690 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1692 = -_1668;
    float _1694 = _1692 + 1.0;
    float _1696 = -_1600;
    float _1698 = fma(_1696, _1670, _1630);
    float _1700 = -_1672;
    float _1702 = _1700 + 1.0;
    float _1704 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1706 = _1686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1708 = _1688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1710 = _1690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1712 = -_1694;
    float _1714 = fma(_1448, _1712, _1660);
    float _1716 = fma(_1658, _1702, _1698);
    out.m_66.x = _1706;
    out.m_66.y = _1708;
    out.m_66.z = _1710;
    out.m_66.w = _1704;
    float _1718 = _1666 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1720 = _1684 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1722 = (*spvDescriptorSet0.vp_c9)._m0[81].z + (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1724 = (*spvDescriptorSet0.vp_c9)._m0[81].w + (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1726 = _1644 > 0.5;
    float _1728 = _1474 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1730 = _1464 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[83].x + (*spvDescriptorSet0.vp_c9)._m0[83].z;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[83].y + (*spvDescriptorSet0.vp_c9)._m0[83].w;
    float _1736 = _1476 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1738 = _1704;
    float _1740 = _1634;
    float _1742 = _1644;
    if (!_1682)
    {
        _1738 = 1.0;
    }
    float _1744 = _1738;
    bool _1746 = !_1682;
    float _1748 = _1744;
    if (!_1746)
    {
        bool _1750 = _1618 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1752 = isnan(_1618);
        bool _1754 = _1750 || _1752;
        bool _1756 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1758 = _1754 || _1756;
        if (!_1758)
        {
            float _1760 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1762 = _1618 + _1760;
            float _1764 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1766 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1764;
            float _1768 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1770 = _1768 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1772 = 1.0 / _1766;
            float _1774 = _1762 * _1772;
            float _1776 = fma(_1774, _1770, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1748 = _1776;
            _1778 = true;
        }
        else
        {
            bool _1780 = _1618 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1782 = isnan(_1618);
            bool _1784 = _1780 || _1782;
            bool _1786 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1788 = _1784 || _1786;
            if (!_1788)
            {
                float _1790 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1792 = _1618 + _1790;
                float _1794 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1796 = _1794 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1798 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1800 = _1798 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1802 = 1.0 / _1796;
                float _1804 = _1792 * _1802;
                float _1806 = fma(_1804, _1800, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1748 = _1806;
                _1778 = true;
            }
            else
            {
                _1748 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1778 = false;
    float _1808 = _1748;
    float _1810 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1812 = _1578 + _1810;
    float _1814 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1816 = _1584 + _1814;
    float _1818 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1820 = _1586 + _1818;
    float _1822 = fma(_1812, _1808, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1824 = fma(_1816, _1808, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1826 = fma(_1820, _1808, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1828 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1830 = _1822 + _1828;
    float _1832 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1834 = _1824 + _1832;
    float _1836 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1838 = _1826 + _1836;
    float _1840 = _1830 * _1830;
    float _1842 = fma(_1834, _1834, _1840);
    float _1844 = fma(_1838, _1838, _1842);
    float _1846 = rsqrt(_1844);
    float _1848 = _1846 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1850 = _1834 * _1848;
    float _1852 = _1838 * _1848;
    float _1854 = _1850 * _1850;
    float _1856 = _1852 * _1852;
    float _1858 = _1854 + _1856;
    float _1860 = sqrt(_1858);
    bool _1862 = _1860 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1864 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1866 = _1860 + _1864;
    float _1868 = _1838;
    float _1870 = _1858;
    float _1872 = _1866;
    float _1874 = _1830;
    float _1876 = _1850;
    if (_1862)
    {
        float _1878 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1868 = _1878;
    }
    float _1880 = _1868;
    if (_1862)
    {
        float _1882 = rsqrt(_1858);
        _1870 = _1882;
    }
    float _1884 = _1870;
    if (_1862)
    {
        float _1886 = _1866 * _1880;
        _1872 = _1886;
    }
    float _1888 = _1872;
    if (_1862)
    {
        float _1890 = _1888 * 0.15915493667125701904296875;
        _1740 = _1890;
    }
    float _1892 = _1740;
    float _1894 = _1846;
    float _1896 = _1892;
    if (_1862)
    {
        float _1898 = _1892 * 6.283185482025146484375;
        float _1900 = sin(_1898);
        _1894 = _1900;
    }
    float _1902 = _1894;
    float _1904 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1906 = precise::max(0.0, _1904);
    float _1908 = _1880;
    float _1910 = _1906;
    if (_1862)
    {
        float _1912 = _1892 * 6.283185482025146484375;
        float _1914 = cos(_1912);
        _1908 = _1914;
    }
    float _1916 = _1908;
    float _1918 = -_1848;
    float _1920 = -_1906;
    float _1922 = fma(_1830, _1918, _1920);
    if (_1862)
    {
        float _1924 = _1922 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1874 = _1924;
    }
    float _1926 = _1874;
    float _1928 = _1902;
    float _1930 = _1926;
    if (_1862)
    {
        float _1932 = fma(_1902, _1926, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1928 = _1932;
    }
    float _1934 = _1928;
    float _1936 = _1934;
    if (!_1862)
    {
        _1930 = _1922;
    }
    float _1938 = _1930;
    float _1940 = _1938;
    float _1942 = _1916;
    if (_1862)
    {
        float _1944 = _1916 + (-1.0);
        _1910 = _1944;
    }
    float _1946 = _1910;
    float _1948 = _1946;
    if (_1862)
    {
        float _1950 = _1884 * _1934;
        _1502 = _1950;
    }
    float _1952 = _1502;
    if (!_1862)
    {
        _1936 = _1852;
    }
    float _1954 = _1936;
    float _1956 = sqrt(_1844);
    float _1958 = _1954;
    if (_1862)
    {
        float _1960 = _1946 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1896 = _1960;
    }
    float _1962 = _1896;
    if (_1862)
    {
        float _1964 = _1850 * _1952;
        _1876 = _1964;
    }
    float _1966 = _1876;
    if (!_1862)
    {
        _1948 = _1854;
    }
    float _1968 = _1948;
    float _1970 = _1968;
    if (_1862)
    {
        float _1972 = _1852 * _1952;
        _1958 = _1972;
    }
    float _1974 = _1958;
    if (_1862)
    {
        float _1976 = fma(_1922, _1916, _1962);
        _1940 = _1976;
    }
    float _1978 = _1940;
    if (_1862)
    {
        float _1980 = _1966 * _1966;
        _1970 = _1980;
    }
    float _1982 = _1970;
    if (!_1862)
    {
        _1942 = _1856;
    }
    float _1984 = _1942;
    float _1986 = _1984;
    if (_1862)
    {
        float _1988 = _1974 * _1974;
        _1986 = _1988;
    }
    float _1990 = _1986;
    float _1992 = fma(_1978, _1978, _1982);
    float _1994 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1996 = _1992 + _1990;
    float _1998 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2000 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2002 = fma(_1956, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2000);
    float _2004 = precise::clamp(_2002, 0.0, 1.0);
    float _2006 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2008 = rsqrt(_1996);
    float _2010 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1998);
    float _2012 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2014 = -_2004;
    float _2016 = _2014 + 1.0;
    float _2018 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2020 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2010);
    float _2022 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2012);
    float _2024 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2018);
    float _2026 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1994);
    float _2028 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2022);
    float _2030 = _2020 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2032 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2024);
    float _2034 = abs(_2016);
    float _2036 = log2(_2034);
    float _2038 = _2028 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2040 = _2030 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2042 = _2008 * _1966;
    float _2044 = _2032 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2046 = _2038 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2048 = _2008 * _1978;
    float _2050 = _2042 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2052 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2026);
    float _2054 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2046);
    float _2056 = _2008 * _1974;
    float _2058 = -_2050;
    float _2060 = fma(_2048, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2058);
    float _2062 = -_2040;
    float _2064 = fma(_2062, _2006, 1.0);
    float _2066 = _2052 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2068 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2054);
    float _2070 = -_2056;
    float _2072 = fma(_2070, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2060);
    float _2074 = _2036 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2076 = _2038 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2078 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2068);
    float _2080 = fma(_2072, -0.5, 0.5);
    float _2082 = log2(_2064);
    float _2084 = _2038 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2086 = fma(_2072, 0.5, 0.5);
    float _2088 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2076);
    float _2090 = _2048 + 1.0;
    float _2092 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2084);
    float _2094 = fma(_2086, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2096 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2088);
    float _2098 = 1.0 / _2078;
    float _2100 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2092);
    float _2102 = fma(_2086, _2094, -0.212114393711090087890625);
    float _2104 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2096);
    float _2106 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2100);
    float _2108 = fma(_2086, _2102, 1.570728778839111328125);
    float _2110 = exp2(_2074);
    float _2112 = _2082 * 0.693147182464599609375;
    float _2114 = _2112 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2116 = sqrt(_2080);
    float _2118 = _2104 * _2098;
    float _2120 = _2106 * _2098;
    float _2122 = fma(_2118, 0.5, 0.5);
    float _2124 = fma(_2120, -0.5, 0.5);
    float _2126 = -_2048;
    float _2128 = fma(_2110, _2090, _2126);
    float3 _5481 = float3(_2122, _2124, _2114);
    float _2130 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5481, float3(0.0), isnan(_5481)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5481, float3(0.0), isnan(_5481)), level(0.0)).x;
    float _2132 = fma(_2128, 0.5, 0.5);
    float _2134 = _2116 * 0.636619746685028076171875;
    float _2136 = -_2108;
    float _2138 = fma(_2134, _2136, 1.0);
    float3 _5502 = float3(_2122, _2124, _2114);
    float4 _2141 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5502, float3(0.0), isnan(_5502)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5502, float3(0.0), isnan(_5502)), level(0.0)).xyzw;
    float _2143 = _2141.x;
    float _2145 = _2141.y;
    float _2147 = _2141.z;
    float _2149 = _2141.w;
    float2 _5519 = float2(_2138, _2132);
    float3 _2153 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5519, float2(0.0), isnan(_5519)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5519, float2(0.0), isnan(_5519)), level(0.0)).xyz;
    float _2155 = _2153.x;
    float _2157 = _2153.y;
    float _2159 = _2153.z;
    float _2161 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2163 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2165 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2161);
    float _2167 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2169 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2163);
    float _2171 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2165);
    float _2173 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2167);
    float _2175 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2169);
    float _2177 = _2169;
    if (!_499)
    {
        _2177 = _1644;
    }
    float _2179 = _2177;
    float _2181 = _2171 * _2171;
    float _2183 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2173);
    float _2185 = _2179;
    if (_499)
    {
        _1742 = _1190;
    }
    float _2187 = _1742;
    float _2189 = fma(_2175, _2175, _2181);
    if (_499)
    {
        _2185 = _1190;
    }
    float _2191 = _2185;
    float _2193 = fma(_2187, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1734);
    float _2195 = fma(_2183, _2183, _2189);
    if (_499)
    {
        _1504 = _145;
    }
    float _2197 = _1504;
    float _2199 = _2038 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2201 = _2191 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2203 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2193);
    float _2205 = rsqrt(_2195);
    float _2207 = _2197 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2209 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2199);
    float _2211 = fma(_2197, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1732);
    float _2213 = fma(_2201, -2.0, _1724);
    float _2215 = -_1722;
    float _2217 = fma(_2207, 2.0, _2215);
    float _2219 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2209);
    float _2221 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2211);
    float _2223 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2213);
    float _2225 = -_2203;
    float _2227 = _2225 + 1.0;
    float _2229 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2219);
    float _2231 = -_2221;
    float _2233 = _2231 + 1.0;
    float _2235 = _2175 * _2205;
    float _2237 = _2171 * _2205;
    float _2239 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2241 = fma(_2235, 0.5, 0.5);
    float _2243 = _2036 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2245 = fma(_2237, -0.5, 0.5);
    float _2247 = -_125;
    float _2249 = fma(_2247, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2217);
    float _2251 = _2229 + _2078;
    float _2253 = _2241;
    float _2255 = _2245;
    if (_878)
    {
        float _2257 = -_2241;
        float _2259 = _1726 ? _2257 : _2241;
        _2253 = _2259;
    }
    float _2261 = _2253;
    out.m_47.x = _2239;
    float _2263 = exp2(_2243);
    if (_882)
    {
        float _2265 = -_2245;
        float _2267 = _972 ? _2265 : _2245;
        _2255 = _2267;
    }
    float _2269 = _2255;
    float _2271 = _2261 + 0.5;
    float _2273 = fma(_1718, _2271, _2249);
    float _2275 = _2269 + (-0.5);
    float _2277 = -_2233;
    float _2279 = fma(_2277, _2261, _2273);
    float _2281 = -_1720;
    float _2283 = -_2223;
    float _2285 = fma(_2281, _2275, _2283);
    float _2287 = _2251 * 0.5;
    float _2289 = -_2263;
    float _2291 = _2289 + 1.0;
    float _2293 = fma(_2227, _2269, _2285);
    out.m_68.z = _2287;
    out.m_68.w = _2078;
    float _2295 = _2291 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2104;
    out.gl_Position.y = _2106;
    out.gl_Position.z = _2229;
    out.gl_Position.w = _2078;
    out.m_70.x = _1714;
    out.m_70.y = _1716;
    out.m_70.z = _2279;
    out.m_70.w = _2293;
    float _2297 = _2295 * _2130;
    float _2299 = -_2295;
    float _2301 = _2299 + 1.0;
    float _2303 = _2149 * _2297;
    float _2305 = _2149 * _2301;
    float _2307 = _2159 * _2297;
    float _2309 = fma(_2155, _2303, _2143);
    float _2311 = fma(_2157, _2303, _2145);
    float _2313 = fma(_2149, _2307, _2147);
    out.m_72.x = _2309;
    out.m_72.y = _2311;
    out.m_72.z = _2313;
    out.m_72.w = _2305;
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
    bool _1778 = false;
    bool _445 = false;
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
        float _2370 = as_type<float>(_107);
        out.gl_Position.z = _2370;
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
        float _2439 = as_type<float>(_143);
        out.gl_Position.z = _2439;
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
    if (!_161)
    {
        float _227 = _209 * _209;
        float _229 = _227 * 0.5;
        _223 = _229;
    }
    float _231 = _223;
    float _233 = _231;
    if (!_161)
    {
        float _235 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _233 = _235;
    }
    float _237 = _233;
    float _239 = _197 * 6.283185482025146484375;
    float _241 = cos(_239);
    float _243 = -_199;
    float _245 = _175 + _243;
    bool _247 = !_161;
    float _249 = _237;
    if (!_247)
    {
        float _251 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _253 = log2(_251);
        float _255 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _257 = _255 + 1.0;
        float _259 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = _209 * _253;
        float _263 = 1.0 / _257;
        float _265 = _259 * 0.693147182464599609375;
        float _267 = exp2(_261);
        float _269 = 1.0 / _265;
        float _271 = _267 + (-1.0);
        float _273 = -_271;
        float _275 = fma(_273, _269, _209);
        float _277 = _275 * _263;
        float _279 = _277 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _249 = _279;
    }
    float _281 = _249;
    bool _283 = !_161;
    if (!_283)
    {
        float _285 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = log2(_285);
        float _289 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _291 = _289 + 1.0;
        float _293 = 1.0 / _291;
        float _295 = _209 * _287;
        float _297 = exp2(_295);
        float _299 = -_297;
        float _301 = _299 + 1.0;
        float _303 = _301 * _293;
        _225 = _303;
    }
    float _305 = _225;
    float _307 = fma(_241, 0.5, 0.5);
    float _309 = in.m_56.w;
    bool _311 = _213 < 0.5;
    float _313 = float(_311);
    float _315 = fma(_217, 0.5, 0.5);
    int _317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _319 = _317 != 0;
    int _321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _323 = _321 != 0;
    float _325 = in.m_44.x;
    float _327 = in.m_44.y;
    float _329 = in.m_44.z;
    float _331 = -_313;
    float _333 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _335 = -_213;
    float _337 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _339 = !_319;
    int _341 = _339 ? 0 : 1;
    float _343 = -_315;
    float _345 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _347 = _245 < 0.5;
    float _349 = float(_347);
    float _351 = -_307;
    float _353 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _355 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _357 = abs(_341);
    float _359 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _361 = -_349;
    float _363 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _365 = fma(_305, _193, _355);
    bool _367 = !_207;
    int _369 = _367 ? 0 : 1;
    float _371 = fma(_305, _191, _359);
    float _373 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _375 = !_323;
    int _377 = _375 ? 0 : 1;
    float _379 = -_245;
    float _381 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _383 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _385 = fma(_305, _195, _373);
    int _387 = abs(_369);
    float _389 = float(_357);
    float _391 = fma(_371, _309, _325);
    int _393 = abs(_377);
    float _395 = fma(_385, _309, _329);
    float _397 = float(_387);
    float _399 = abs(_337);
    float _401 = _389 * _399;
    float _403 = abs(_381);
    float _405 = _389 * _403;
    float _407 = float(_393);
    float _409 = fma(_365, _309, _327);
    float _411 = fma(_397, _345, _401);
    float _413 = fma(_397, _353, _405);
    float _415 = abs(_333);
    float _417 = fma(_407, _415, _411);
    float _419 = abs(_363);
    float _421 = fma(_407, _419, _413);
    bool _423 = !_383;
    float _441;
    float _443;
    if (!_423)
    {
        float _425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _427 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _429 = float(_91);
        float _431 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _433 = _431 * _425;
        float _435 = floor(_433);
        float _437 = -_435;
        float _439 = _433 + _437;
        _441 = _429;
        _443 = _439;
        _445 = true;
    }
    else
    {
        float _447 = float(_91);
        float _449 = 1.0 / _447;
        float _451 = _125 * _449;
        _441 = _447;
        _443 = _451;
    }
    _445 = false;
    float _453 = _441;
    float _455 = _443;
    float _457 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _459 = int(_457);
    float _461 = in.m_51.w;
    float _463 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _465 = int(_463);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _467;
    float _471 = float(_459);
    float _473 = 1.0 / _453;
    float _475 = float(uint(_465));
    float _477 = 1.0 / _471;
    int _479 = ~_465;
    int _481 = _479 + 1;
    int _483 = ~_465;
    int _485 = _483 + 1;
    int _487 = ~_465;
    int _489 = _487 + 1;
    float _491 = 1.0 / _475;
    float _493 = _125 * _477;
    float _495 = 1.0 / _469;
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _499 = _497 != 0;
    int _501 = as_type<int>(_491) + (-2);
    float _503 = trunc(_493);
    int _505 = int(_503);
    float _507 = float(uint(_505));
    float _509 = as_type<float>(_501) * _507;
    float _511 = trunc(_509);
    float _513 = precise::max(_511, 0.0);
    uint _516 = uint(_513);
    float _518 = float(_505);
    int _520 = _481 * int(_516);
    int _522 = _520 + _505;
    float _524 = float(_465);
    float _526 = float(uint(_522));
    bool _528 = _518 >= _524;
    bool _530 = isnan(_518);
    bool _532 = _528 || _530;
    bool _534 = isnan(_524);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = as_type<float>(_501) * _526;
    float _542 = trunc(_538);
    int _544 = int(_542);
    bool _546 = !_499;
    float _548 = _546 ? 7.345489978790283203125 : 1.0;
    float _550 = _548 * _145;
    float _552 = trunc(_540);
    float _554 = precise::max(_552, 0.0);
    uint _556 = uint(_554);
    float _558 = floor(_550);
    int _560 = int(_516) + int(_556);
    int _562 = _485 * _560;
    int _564 = _562 + _505;
    float _566 = -_558;
    float _568 = _550 + _566;
    int _570 = ~_544;
    int _572 = _570 + 1;
    int _574 = _572 + 1;
    bool _576 = uint(_564) >= uint(_465);
    bool _578 = !_576;
    int _580 = _578 ? 0 : (-1);
    int _582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _584 = _582 != 0;
    int _586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _588 = _586 != 0;
    int _590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _592 = _590 != 0;
    int _594 = ~_560;
    int _596 = _594 + _580;
    int _598 = _596 + 1;
    float _600 = _568 * _524;
    bool _602 = _465 == 0;
    float _604 = _125 * _524;
    int _606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _608 = _606 != 0;
    int _610 = _465 * _598;
    int _612 = _610 + _505;
    int _614 = _465 + (-1);
    float _616 = _604 * _473;
    float _618 = trunc(_600);
    int _620 = int(_618);
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _624 = _622 != 0;
    bool _626 = !_602;
    int _628 = _626 ? _612 : (-1);
    bool _630 = !_608;
    int _632 = _630 ? 0 : 1;
    int _634 = _628 * _574;
    float _636 = trunc(_616);
    int _638 = int(_636);
    bool _640 = !_588;
    int _642 = _640 ? 0 : 1;
    int _644 = _544 * _614;
    int _646 = _644 + _634;
    bool _648 = !_584;
    int _650 = _648 ? 0 : 1;
    int _652 = abs(_642);
    bool _654 = !_592;
    int _656 = _654 ? 0 : 1;
    int _658 = abs(_650);
    int _660 = _646 * _652;
    bool _662 = !_624;
    int _664 = _662 ? 0 : 1;
    int _666 = abs(_656);
    int _668 = abs(_632);
    int _670 = abs(_664);
    int _672 = _620 * _668;
    int _674 = _672 + _505;
    int _676 = _638 * _658;
    int _678 = _676 + _660;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _680;
    int _684 = ~_465;
    int _686 = _684 + 1;
    int _688 = _674 * _666;
    int _690 = _688 + _678;
    int _692 = ~_465;
    int _694 = _692 + 1;
    float _696 = 1.0 / _682;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _700 = _698 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _702 = _620 * _670;
    int _704 = _702 + _690;
    int _706 = ~_465;
    int _708 = _706 + 1;
    float _710 = float(uint(_674));
    float _712 = float(uint(_704));
    float _714 = 1.0 / _700;
    float _716 = as_type<float>(_501) * _710;
    float _718 = as_type<float>(_501) * _712;
    float _720 = trunc(_716);
    float _722 = precise::max(_720, 0.0);
    uint _724 = uint(_722);
    float _726 = trunc(_718);
    float _728 = precise::max(_726, 0.0);
    uint _730 = uint(_728);
    int _732 = _708 * int(_730);
    int _734 = _732 + _704;
    float _736 = float(uint(_734));
    float _738 = as_type<float>(_501) * _736;
    float _740 = trunc(_738);
    float _742 = precise::max(_740, 0.0);
    uint _744 = uint(_742);
    int _746 = int(_730) + int(_744);
    int _748 = _686 * _746;
    int _750 = _748 + _704;
    int _752 = _694 * int(_724);
    int _754 = _752 + _674;
    bool _756 = uint(_750) >= uint(_465);
    float _758 = float(uint(_754));
    bool _760 = !_756;
    int _762 = _760 ? 0 : (-1);
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _766 = _764 != 0;
    float _768 = as_type<float>(_501) * _758;
    int _770 = ~_746;
    int _772 = _770 + _762;
    int _774 = _772 + 1;
    bool _776 = !_766;
    int _778 = _776 ? 0 : 1;
    float _780 = trunc(_768);
    float _782 = precise::max(_780, 0.0);
    uint _784 = uint(_782);
    int _786 = _465 * _774;
    int _788 = _786 + _704;
    int _790 = abs(_778);
    bool _792 = !_602;
    int _794 = _792 ? _788 : (-1);
    int _796 = _794 & 3;
    bool _798 = _796 != 0;
    int _800 = _794 >> 31;
    bool _802 = uint(_796) > 1u;
    int _804 = _794 & 3;
    bool _806 = _804 != 0;
    int _808 = _800 & 3;
    int _810 = _806 ? 0 : 1;
    int _812 = int(_724) + int(_784);
    int _814 = ~_810;
    int _816 = _814 + 1;
    int _818 = _816 + 1;
    float _820 = in.m_58.x;
    float _822 = in.m_58.y;
    float _824 = in.m_58.z;
    int _826 = _794 + _808;
    int _828 = _489 * _812;
    int _830 = _828 + _674;
    bool _832 = uint(_796) >= 2u;
    float _834 = in.m_60.x;
    float _836 = in.m_60.y;
    float _838 = in.m_60.z;
    bool _840 = _796 != 3;
    bool _842 = _796 != 3;
    int _844 = _818;
    if (!_802)
    {
        int _846 = ~_810;
        int _848 = _846 + 1;
        _844 = _848;
    }
    int _850 = _844;
    float _852 = in.m_62.x;
    float _854 = in.m_62.y;
    float _856 = in.m_62.z;
    bool _858 = !_798;
    int _860 = _858 ? 0 : 1;
    int _862 = _832 ? 0 : 1;
    bool _864 = !_842;
    int _866 = _864 ? 0 : (-1);
    int _868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _870 = _868 != 0;
    int _872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _874 = _872 != 0;
    int _876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _878 = _876 != 0;
    int _880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _882 = _880 != 0;
    float _884 = _409 * _822;
    int _886 = _826 >> 2;
    float _888 = _409 * _836;
    int _890 = ~_862;
    int _892 = _890 + 1;
    int _894 = _892 + 1;
    int _896 = _886 << 4;
    int _898 = _896 + 368;
    float _900 = fma(_391, _834, _888);
    int _902 = _894;
    if (_840)
    {
        int _904 = ~_862;
        int _906 = _904 + 1;
        _902 = _906;
    }
    int _908 = _902;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _912 = _910 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    uint _914 = uint(int(uint(_898) >> uint(2)));
    uint _916 = uint(int(uint(int(_914)) >> uint(2)));
    int _918 = int(_914) & 3;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[int(_916)][_918];
    int _922 = int(_914) + 1;
    uint _924 = uint(int(uint(_922) >> uint(2)));
    int _926 = _922 & 3;
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[int(_924)][_926];
    float _930 = _409 * _854;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _934 = _455 + _932;
    bool _936 = uint(_830) >= uint(_465);
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _940 = _455 + _938;
    float _942 = fma(_391, _852, _930);
    float _944 = _934 * _696;
    float _946 = 1.0 / _912;
    int _948 = _898 + 8;
    uint _950 = uint(int(uint(_948) >> uint(2)));
    uint _952 = uint(int(uint(int(_950)) >> uint(2)));
    int _954 = int(_950) & 3;
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[int(_952)][_954];
    int _958 = int(_950) + 1;
    uint _960 = uint(int(uint(_958) >> uint(2)));
    int _962 = _958 & 3;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[int(_960)][_962];
    bool _966 = !_936;
    int _968 = _966 ? 0 : (-1);
    float _970 = fma(_391, _820, _884);
    bool _972 = _461 > 0.5;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _976 = _455 + _974;
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _980 = _455 + _978;
    float _982 = _940 * _495;
    bool _984 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _986 = isnan(_455);
    bool _988 = _984 || _986;
    bool _990 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _992 = _988 || _990;
    float _994 = float(_992);
    float _996 = _980 * _714;
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1000 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _998;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1004 = _1002 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1006;
    float _1010 = -_994;
    float _1012 = _1010 + 1.0;
    float _1014 = _976 * _946;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1018 = _1016 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _1020 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1022 = isnan(_455);
    bool _1024 = _1020 || _1022;
    bool _1026 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1028 = _1024 || _1026;
    float _1030 = float(_1028);
    float _1032 = fma(_1004, _996, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _1034 = ~_812;
    int _1036 = _1034 + _968;
    int _1038 = _1036 + 1;
    float _1040 = fma(_1018, _996, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _1042 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1044 = isnan(_455);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1050 = _1046 || _1048;
    float _1052 = float(_1050);
    float _1054 = fma(_1000, _944, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1056 = fma(_1008, _944, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1058 = _1030 * _1012;
    float _1060 = -_1030;
    float _1062 = _1060 + 1.0;
    int _1064 = abs(_850);
    int _1066 = _465 * _1038;
    int _1068 = _1066 + _674;
    bool _1070 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1072 = isnan(_455);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1078 = _1074 || _1076;
    float _1080 = float(_1078);
    float _1082 = fma(_395, _824, _970);
    int _1084 = abs(_860);
    float _1086 = -_1052;
    float _1088 = _1086 + 1.0;
    bool _1090 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1092 = isnan(_455);
    bool _1094 = _1090 || _1092;
    bool _1096 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1098 = _1094 || _1096;
    float _1100 = float(_1098);
    float _1102 = _1052 * _1062;
    int _1104 = ~_1064;
    int _1106 = _1104 + 1;
    int _1108 = _1106 + 1;
    float _1110 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1112 = int(_1110);
    float _1114 = _1080 * _1088;
    float _1116 = -_1080;
    float _1118 = _1116 + 1.0;
    int _1120 = abs(_908);
    float _1122 = fma(_395, _838, _900);
    int _1124 = ~_1084;
    int _1126 = _1124 + 1;
    int _1128 = _1126 + 1;
    int _1130 = _1108 * as_type<int>(_928);
    int _1132 = abs(_866);
    float _1134 = _1100 * _1118;
    int _1136 = _1128 * as_type<int>(_920);
    int _1138 = _1136 + _1130;
    float _1140 = _1054 * _1134;
    int _1142 = ~_1120;
    int _1144 = _1142 + 1;
    int _1146 = _1144 + 1;
    float _1148 = -_1100;
    float _1150 = _1148 + 1.0;
    int _1152 = ~_1132;
    int _1154 = _1152 + 1;
    int _1156 = _1154 + 1;
    float _1158 = _1056 * _1134;
    float _1160 = float(uint(_1112));
    int _1162 = _1146 * as_type<int>(_956);
    int _1164 = _1162 + _1138;
    int _1166 = abs(_1112);
    float _1168 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1158);
    int _1170 = _1156 * as_type<int>(_964);
    int _1172 = _1170 + _1164;
    float _1174 = 1.0 / _1160;
    float _1176 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1140);
    float _1178 = fma(_1032, _1114, _1168);
    int _1180 = ~_790;
    int _1182 = _1180 + 1;
    int _1184 = _1182 + 1;
    float _1186 = fma(_1040, _1114, _1176);
    float _1188 = float(uint(_1166));
    float _1190 = in.m_51.y;
    bool _1192 = !_602;
    int _1194 = _1192 ? _1068 : (-1);
    int _1196 = _1172 * _1184;
    float _1198 = in.m_56.x;
    float _1200 = in.m_56.y;
    int _1202 = _1194 * _790;
    int _1204 = _1202 + _1196;
    float _1206 = 1.0 / _1188;
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1210 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1208;
    int _1212 = as_type<int>(_1174) + (-2);
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1214;
    float _1218 = float(uint(_1204));
    float _1220 = fma(_1210, _982, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1222 = _1122 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1224 = fma(_1216, _982, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _1228 = _1226 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1230 = as_type<float>(_1212) * _1218;
    float _1232 = fma(_1220, _1102, _1186);
    int _1234 = abs(_1204);
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1238 = _1236 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1240 = fma(_1228, _1014, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _1242 = fma(_1224, _1102, _1178);
    float _1244 = trunc(_1230);
    float _1246 = precise::max(_1244, 0.0);
    uint _1248 = uint(_1246);
    float _1250 = fma(_1238, _1014, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    int _1252 = as_type<int>(_1206) + (-2);
    float _1254 = fma(_1240, _1058, _1242);
    float _1256 = float(uint(_1234));
    float _1258 = fma(_1250, _1058, _1232);
    int _1260 = ~_1112;
    int _1262 = _1260 + 1;
    float _1264 = fma(_395, _856, _942);
    float _1266 = as_type<float>(_1252) * _1256;
    float _1268 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1258);
    float _1270 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1254);
    int _1272 = ~_1166;
    int _1274 = _1272 + 1;
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1278 = _1268 * _1198;
    float _1280 = trunc(_1266);
    float _1282 = precise::max(_1280, 0.0);
    uint _1284 = uint(_1282);
    int _1286 = _1262 * int(_1248);
    int _1288 = _1286 + _1204;
    float _1290 = _145 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1292 = _1270 * _1200;
    float _1294 = _417 * _1278;
    float _1296 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _203);
    float _1298 = float(uint(_1288));
    float _1300 = -_1276;
    float _1302 = fma(_1290, 2.0, _1300);
    float _1304 = _421 * _1292;
    float _1306 = _1294 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1308 = as_type<float>(_1212) * _1298;
    float _1310 = _1264 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1312 = _1304 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1314 = _1306 * _1296;
    float _1316 = trunc(_1308);
    float _1318 = precise::max(_1316, 0.0);
    uint _1320 = uint(_1318);
    int _1322 = _1274 * int(_1284);
    int _1324 = _1322 + _1234;
    float _1326 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _221);
    float _1328 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1330 = float(uint(_1324));
    float _1332 = _1312 * _1326;
    float _1334 = as_type<float>(_1252) * _1330;
    float _1336 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1338 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1340 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1336);
    float _1342 = trunc(_1334);
    float _1344 = precise::max(_1342, 0.0);
    uint _1346 = uint(_1344);
    float _1348 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1338);
    float _1350 = _1082 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1352 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1340);
    int _1354 = int(_1248) + int(_1320);
    float _1356 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1348);
    int _1358 = ~_1112;
    int _1360 = _1358 + 1;
    float _1362 = _1352 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1364 = ~_1166;
    int _1366 = _1364 + 1;
    float _1368 = _1356 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1370 = _1222 + _1362;
    int _1372 = _1360 * _1354;
    int _1374 = _1372 + _1204;
    float _1376 = _1350 + _1368;
    float _1378 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1380 = _1370 + _1378;
    int _1382 = int(_1284) + int(_1346);
    float _1384 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1386 = _1376 + _1384;
    bool _1388 = uint(_1374) >= uint(_1112);
    float _1390 = _1380 * _1380;
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1394 = _1386 * _1386;
    int _1396 = _1366 * _1382;
    int _1398 = _1396 + _1234;
    bool _1400 = !_1388;
    int _1402 = _1400 ? 0 : (-1);
    float _1404 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1406 = _1390 + _1394;
    bool _1408 = uint(_1398) >= uint(_1166);
    float _1410 = fma(_1404, -2.0, _1392);
    float _1412 = sqrt(_1406);
    int _1414 = ~_1354;
    int _1416 = _1414 + _1402;
    int _1418 = _1416 + 1;
    float _1420 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1422 = !_1408;
    int _1424 = _1422 ? 0 : (-1);
    bool _1426 = _145 > 0.5;
    int _1428 = _1112 * _1418;
    int _1430 = _1428 + _1204;
    float _1432 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1420);
    float _1434 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1436 = -_203;
    int _1438 = _1426 ? as_type<int>(_1436) : as_type<int>(_203);
    float _1440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1442 = _1112 == 0;
    float _1444 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1432);
    bool _1446 = !_870;
    float _1448 = _1446 ? _203 : as_type<float>(_1438);
    float _1450 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1452 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1454 = !_1442;
    int _1456 = _1454 ? _1430 : (-1);
    float _1458 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1460 = _1412 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1462 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1464 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1452);
    bool _1466 = _1112 == 0;
    float _1468 = _1444 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1470 = _1204 ^ _1112;
    float _1472 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1474 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1458);
    float _1476 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1462);
    uint _1478 = uint(int(uint(_1470) >> uint(31)));
    float _1480 = _1310 + _1468;
    int _1482 = ~_1424;
    int _1484 = _1382 + _1482;
    int _1486 = _1484 + 1;
    int _1488 = ~int(_1478);
    int _1490 = _1488 + 1;
    float _1492 = as_type<float>(_1478);
    float _1494 = _1370;
    float _1496 = _1468;
    float _1498 = _1310;
    float _1500 = _1376;
    float _1502 = _1186;
    float _1504 = _1190;
    if (!_1460)
    {
        _1492 = _1370;
    }
    float _1506 = _1492;
    float _1508 = _1506;
    if (!_1460)
    {
        _1494 = _1376;
    }
    float _1510 = _1494;
    float _1512 = _1510;
    if (!_1460)
    {
        _1496 = _1394;
    }
    float _1514 = _1496;
    float _1516 = _1514;
    if (!_1460)
    {
        _1498 = _1390;
    }
    float _1518 = _1498;
    int _1520 = _1486 ^ _1490;
    float _1522 = _1518;
    if (!_1460)
    {
        _1500 = _1480;
    }
    float _1524 = _1500;
    bool _1526 = !_1460;
    float _1528 = _1524;
    if (!_1526)
    {
        float _1530 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1532 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1534 = _1412 + _1532;
        float _1536 = rsqrt(_1406);
        float _1538 = _1534 * _1530;
        float _1540 = _1480 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1542 = _1538 * 0.15915493667125701904296875;
        float _1544 = _1542 * 6.283185482025146484375;
        float _1546 = sin(_1544);
        float _1548 = _1542 * 6.283185482025146484375;
        float _1550 = cos(_1548);
        float _1552 = fma(_1546, _1540, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1554 = _1536 * _1552;
        float _1556 = _1550 + (-1.0);
        float _1558 = fma(_1380, _1554, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1560 = fma(_1386, _1554, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1562 = _1556 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1564 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1566 = _1558 + _1564;
        float _1568 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1570 = _1560 + _1568;
        float _1572 = fma(_1480, _1550, _1562);
        float _1574 = _1566 * _1566;
        float _1576 = _1570 * _1570;
        _1528 = _1572;
        _1522 = _1574;
        _1516 = _1576;
        _1508 = _1558;
        _1512 = _1560;
    }
    float _1578 = _1528;
    float _1580 = _1522;
    float _1582 = _1516;
    float _1584 = _1508;
    float _1586 = _1512;
    int _1588 = ~_1490;
    int _1590 = _1588 + _1520;
    int _1592 = _1590 + 1;
    float _1594 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1596 = _1578 + _1594;
    float _1598 = float(_1456);
    float _1600 = _1472 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1602 = !_1466;
    int _1604 = _1602 ? _1592 : (-1);
    float _1606 = fma(_1596, _1596, _1580);
    float _1608 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1410);
    float _1610 = float(_1604);
    float _1612 = _1606 + _1582;
    float _1614 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1616 = _1440 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1618 = sqrt(_1612);
    float _1620 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1622 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1624 = -_125;
    float _1626 = fma(_1624, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1302);
    float _1628 = -_1608;
    float _1630 = fma(_1600, _1610, _1628);
    bool _1632 = _1190 > 0.5;
    float _1634 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1636 = _1620 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1638 = _1622 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1640 = _1614 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1642 = fma(_1616, _1598, _1626);
    float _1644 = in.m_51.z;
    float _1646 = -_221;
    int _1648 = _1632 ? as_type<int>(_1646) : as_type<int>(_221);
    float _1650 = _1448 + 0.5;
    float _1652 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1654 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    out.m_64.x = _1636;
    out.m_64.y = _1638;
    out.m_64.z = _1640;
    out.m_64.w = _1634;
    bool _1656 = !_874;
    float _1658 = _1656 ? _221 : as_type<float>(_1648);
    float _1660 = fma(_1616, _1650, _1642);
    float _1662 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1652);
    float _1664 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1654);
    float _1666 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1668 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1662);
    float _1670 = _1658 + (-0.5);
    float _1672 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1664);
    bool _1674 = _1618 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1676 = isnan(_1618);
    bool _1678 = _1674 || _1676;
    bool _1680 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1682 = _1678 || _1680;
    float _1684 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1686 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1688 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1690 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1692 = -_1668;
    float _1694 = _1692 + 1.0;
    float _1696 = -_1600;
    float _1698 = fma(_1696, _1670, _1630);
    float _1700 = -_1672;
    float _1702 = _1700 + 1.0;
    float _1704 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1706 = _1686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1708 = _1688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1710 = _1690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1712 = -_1694;
    float _1714 = fma(_1448, _1712, _1660);
    float _1716 = fma(_1658, _1702, _1698);
    out.m_66.x = _1706;
    out.m_66.y = _1708;
    out.m_66.z = _1710;
    out.m_66.w = _1704;
    float _1718 = _1666 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1720 = _1684 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1722 = (*spvDescriptorSet0.vp_c9)._m0[81].z + (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1724 = (*spvDescriptorSet0.vp_c9)._m0[81].w + (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1726 = _1644 > 0.5;
    float _1728 = _1474 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1730 = _1464 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[83].x + (*spvDescriptorSet0.vp_c9)._m0[83].z;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[83].y + (*spvDescriptorSet0.vp_c9)._m0[83].w;
    float _1736 = _1476 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1738 = _1704;
    float _1740 = _1634;
    float _1742 = _1644;
    if (!_1682)
    {
        _1738 = 1.0;
    }
    float _1744 = _1738;
    bool _1746 = !_1682;
    float _1748 = _1744;
    if (!_1746)
    {
        bool _1750 = _1618 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1752 = isnan(_1618);
        bool _1754 = _1750 || _1752;
        bool _1756 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1758 = _1754 || _1756;
        if (!_1758)
        {
            float _1760 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1762 = _1618 + _1760;
            float _1764 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1766 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1764;
            float _1768 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1770 = _1768 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1772 = 1.0 / _1766;
            float _1774 = _1762 * _1772;
            float _1776 = fma(_1774, _1770, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1748 = _1776;
            _1778 = true;
        }
        else
        {
            bool _1780 = _1618 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1782 = isnan(_1618);
            bool _1784 = _1780 || _1782;
            bool _1786 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1788 = _1784 || _1786;
            if (!_1788)
            {
                float _1790 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1792 = _1618 + _1790;
                float _1794 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1796 = _1794 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1798 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1800 = _1798 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1802 = 1.0 / _1796;
                float _1804 = _1792 * _1802;
                float _1806 = fma(_1804, _1800, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1748 = _1806;
                _1778 = true;
            }
            else
            {
                _1748 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1778 = false;
    float _1808 = _1748;
    float _1810 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1812 = _1578 + _1810;
    float _1814 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1816 = _1584 + _1814;
    float _1818 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1820 = _1586 + _1818;
    float _1822 = fma(_1812, _1808, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1824 = fma(_1816, _1808, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1826 = fma(_1820, _1808, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1828 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1830 = _1822 + _1828;
    float _1832 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1834 = _1824 + _1832;
    float _1836 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1838 = _1826 + _1836;
    float _1840 = _1830 * _1830;
    float _1842 = fma(_1834, _1834, _1840);
    float _1844 = fma(_1838, _1838, _1842);
    float _1846 = rsqrt(_1844);
    float _1848 = _1846 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1850 = _1834 * _1848;
    float _1852 = _1838 * _1848;
    float _1854 = _1850 * _1850;
    float _1856 = _1852 * _1852;
    float _1858 = _1854 + _1856;
    float _1860 = sqrt(_1858);
    bool _1862 = _1860 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1864 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1866 = _1860 + _1864;
    float _1868 = _1838;
    float _1870 = _1858;
    float _1872 = _1866;
    float _1874 = _1830;
    float _1876 = _1850;
    if (_1862)
    {
        float _1878 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1868 = _1878;
    }
    float _1880 = _1868;
    if (_1862)
    {
        float _1882 = rsqrt(_1858);
        _1870 = _1882;
    }
    float _1884 = _1870;
    if (_1862)
    {
        float _1886 = _1866 * _1880;
        _1872 = _1886;
    }
    float _1888 = _1872;
    if (_1862)
    {
        float _1890 = _1888 * 0.15915493667125701904296875;
        _1740 = _1890;
    }
    float _1892 = _1740;
    float _1894 = _1846;
    float _1896 = _1892;
    if (_1862)
    {
        float _1898 = _1892 * 6.283185482025146484375;
        float _1900 = sin(_1898);
        _1894 = _1900;
    }
    float _1902 = _1894;
    float _1904 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1906 = precise::max(0.0, _1904);
    float _1908 = _1880;
    float _1910 = _1906;
    if (_1862)
    {
        float _1912 = _1892 * 6.283185482025146484375;
        float _1914 = cos(_1912);
        _1908 = _1914;
    }
    float _1916 = _1908;
    float _1918 = -_1848;
    float _1920 = -_1906;
    float _1922 = fma(_1830, _1918, _1920);
    if (_1862)
    {
        float _1924 = _1922 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1874 = _1924;
    }
    float _1926 = _1874;
    float _1928 = _1902;
    float _1930 = _1926;
    if (_1862)
    {
        float _1932 = fma(_1902, _1926, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1928 = _1932;
    }
    float _1934 = _1928;
    float _1936 = _1934;
    if (!_1862)
    {
        _1930 = _1922;
    }
    float _1938 = _1930;
    float _1940 = _1938;
    float _1942 = _1916;
    if (_1862)
    {
        float _1944 = _1916 + (-1.0);
        _1910 = _1944;
    }
    float _1946 = _1910;
    float _1948 = _1946;
    if (_1862)
    {
        float _1950 = _1884 * _1934;
        _1502 = _1950;
    }
    float _1952 = _1502;
    if (!_1862)
    {
        _1936 = _1852;
    }
    float _1954 = _1936;
    float _1956 = sqrt(_1844);
    float _1958 = _1954;
    if (_1862)
    {
        float _1960 = _1946 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1896 = _1960;
    }
    float _1962 = _1896;
    if (_1862)
    {
        float _1964 = _1850 * _1952;
        _1876 = _1964;
    }
    float _1966 = _1876;
    if (!_1862)
    {
        _1948 = _1854;
    }
    float _1968 = _1948;
    float _1970 = _1968;
    if (_1862)
    {
        float _1972 = _1852 * _1952;
        _1958 = _1972;
    }
    float _1974 = _1958;
    if (_1862)
    {
        float _1976 = fma(_1922, _1916, _1962);
        _1940 = _1976;
    }
    float _1978 = _1940;
    if (_1862)
    {
        float _1980 = _1966 * _1966;
        _1970 = _1980;
    }
    float _1982 = _1970;
    if (!_1862)
    {
        _1942 = _1856;
    }
    float _1984 = _1942;
    float _1986 = _1984;
    if (_1862)
    {
        float _1988 = _1974 * _1974;
        _1986 = _1988;
    }
    float _1990 = _1986;
    float _1992 = fma(_1978, _1978, _1982);
    float _1994 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1996 = _1992 + _1990;
    float _1998 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2000 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2002 = fma(_1956, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2000);
    float _2004 = precise::clamp(_2002, 0.0, 1.0);
    float _2006 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2008 = rsqrt(_1996);
    float _2010 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1998);
    float _2012 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2014 = -_2004;
    float _2016 = _2014 + 1.0;
    float _2018 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2020 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2010);
    float _2022 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2012);
    float _2024 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2018);
    float _2026 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1994);
    float _2028 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2022);
    float _2030 = _2020 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2032 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2024);
    float _2034 = abs(_2016);
    float _2036 = log2(_2034);
    float _2038 = _2028 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2040 = _2030 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2042 = _2008 * _1966;
    float _2044 = _2032 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2046 = _2038 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2048 = _2008 * _1978;
    float _2050 = _2042 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2052 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2026);
    float _2054 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2046);
    float _2056 = _2008 * _1974;
    float _2058 = -_2050;
    float _2060 = fma(_2048, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2058);
    float _2062 = -_2040;
    float _2064 = fma(_2062, _2006, 1.0);
    float _2066 = _2052 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2068 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2054);
    float _2070 = -_2056;
    float _2072 = fma(_2070, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2060);
    float _2074 = _2036 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2076 = _2038 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2078 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2068);
    float _2080 = fma(_2072, -0.5, 0.5);
    float _2082 = log2(_2064);
    float _2084 = _2038 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2086 = fma(_2072, 0.5, 0.5);
    float _2088 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2076);
    float _2090 = _2048 + 1.0;
    float _2092 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2084);
    float _2094 = fma(_2086, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2096 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2088);
    float _2098 = 1.0 / _2078;
    float _2100 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2092);
    float _2102 = fma(_2086, _2094, -0.212114393711090087890625);
    float _2104 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2096);
    float _2106 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2100);
    float _2108 = fma(_2086, _2102, 1.570728778839111328125);
    float _2110 = exp2(_2074);
    float _2112 = _2082 * 0.693147182464599609375;
    float _2114 = _2112 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2116 = sqrt(_2080);
    float _2118 = _2104 * _2098;
    float _2120 = _2106 * _2098;
    float _2122 = fma(_2118, 0.5, 0.5);
    float _2124 = fma(_2120, -0.5, 0.5);
    float _2126 = -_2048;
    float _2128 = fma(_2110, _2090, _2126);
    float3 _5481 = float3(_2122, _2124, _2114);
    float _2130 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5481, float3(0.0), isnan(_5481)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5481, float3(0.0), isnan(_5481)), level(0.0)).x;
    float _2132 = fma(_2128, 0.5, 0.5);
    float _2134 = _2116 * 0.636619746685028076171875;
    float _2136 = -_2108;
    float _2138 = fma(_2134, _2136, 1.0);
    float3 _5502 = float3(_2122, _2124, _2114);
    float4 _2141 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5502, float3(0.0), isnan(_5502)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5502, float3(0.0), isnan(_5502)), level(0.0)).xyzw;
    float _2143 = _2141.x;
    float _2145 = _2141.y;
    float _2147 = _2141.z;
    float _2149 = _2141.w;
    float2 _5519 = float2(_2138, _2132);
    float3 _2153 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5519, float2(0.0), isnan(_5519)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5519, float2(0.0), isnan(_5519)), level(0.0)).xyz;
    float _2155 = _2153.x;
    float _2157 = _2153.y;
    float _2159 = _2153.z;
    float _2161 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2163 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2165 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2161);
    float _2167 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2169 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2163);
    float _2171 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2165);
    float _2173 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2167);
    float _2175 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2169);
    float _2177 = _2169;
    if (!_499)
    {
        _2177 = _1644;
    }
    float _2179 = _2177;
    float _2181 = _2171 * _2171;
    float _2183 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2173);
    float _2185 = _2179;
    if (_499)
    {
        _1742 = _1190;
    }
    float _2187 = _1742;
    float _2189 = fma(_2175, _2175, _2181);
    if (_499)
    {
        _2185 = _1190;
    }
    float _2191 = _2185;
    float _2193 = fma(_2187, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1734);
    float _2195 = fma(_2183, _2183, _2189);
    if (_499)
    {
        _1504 = _145;
    }
    float _2197 = _1504;
    float _2199 = _2038 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2201 = _2191 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2203 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2193);
    float _2205 = rsqrt(_2195);
    float _2207 = _2197 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2209 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2199);
    float _2211 = fma(_2197, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1732);
    float _2213 = fma(_2201, -2.0, _1724);
    float _2215 = -_1722;
    float _2217 = fma(_2207, 2.0, _2215);
    float _2219 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2209);
    float _2221 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2211);
    float _2223 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2213);
    float _2225 = -_2203;
    float _2227 = _2225 + 1.0;
    float _2229 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2219);
    float _2231 = -_2221;
    float _2233 = _2231 + 1.0;
    float _2235 = _2175 * _2205;
    float _2237 = _2171 * _2205;
    float _2239 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2241 = fma(_2235, 0.5, 0.5);
    float _2243 = _2036 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2245 = fma(_2237, -0.5, 0.5);
    float _2247 = -_125;
    float _2249 = fma(_2247, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2217);
    float _2251 = _2229 + _2078;
    float _2253 = _2241;
    float _2255 = _2245;
    if (_878)
    {
        float _2257 = -_2241;
        float _2259 = _1726 ? _2257 : _2241;
        _2253 = _2259;
    }
    float _2261 = _2253;
    out.m_47.x = _2239;
    float _2263 = exp2(_2243);
    if (_882)
    {
        float _2265 = -_2245;
        float _2267 = _972 ? _2265 : _2245;
        _2255 = _2267;
    }
    float _2269 = _2255;
    float _2271 = _2261 + 0.5;
    float _2273 = fma(_1718, _2271, _2249);
    float _2275 = _2269 + (-0.5);
    float _2277 = -_2233;
    float _2279 = fma(_2277, _2261, _2273);
    float _2281 = -_1720;
    float _2283 = -_2223;
    float _2285 = fma(_2281, _2275, _2283);
    float _2287 = _2251 * 0.5;
    float _2289 = -_2263;
    float _2291 = _2289 + 1.0;
    float _2293 = fma(_2227, _2269, _2285);
    out.m_68.z = _2287;
    out.m_68.w = _2078;
    float _2295 = _2291 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2104;
    out.gl_Position.y = _2106;
    out.gl_Position.z = _2229;
    out.gl_Position.w = _2078;
    out.m_70.x = _1714;
    out.m_70.y = _1716;
    out.m_70.z = _2279;
    out.m_70.w = _2293;
    float _2297 = _2295 * _2130;
    float _2299 = -_2295;
    float _2301 = _2299 + 1.0;
    float _2303 = _2149 * _2297;
    float _2305 = _2149 * _2301;
    float _2307 = _2159 * _2297;
    float _2309 = fma(_2155, _2303, _2143);
    float _2311 = fma(_2157, _2303, _2145);
    float _2313 = fma(_2149, _2307, _2147);
    out.m_72.x = _2309;
    out.m_72.y = _2311;
    out.m_72.z = _2313;
    out.m_72.w = _2305;
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
    bool _1778 = false;
    bool _445 = false;
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
        float _2370 = as_type<float>(_107);
        out.gl_Position.z = _2370;
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
        float _2439 = as_type<float>(_143);
        out.gl_Position.z = _2439;
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
    if (!_161)
    {
        float _227 = _209 * _209;
        float _229 = _227 * 0.5;
        _223 = _229;
    }
    float _231 = _223;
    float _233 = _231;
    if (!_161)
    {
        float _235 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _233 = _235;
    }
    float _237 = _233;
    float _239 = _197 * 6.283185482025146484375;
    float _241 = cos(_239);
    float _243 = -_199;
    float _245 = _175 + _243;
    bool _247 = !_161;
    float _249 = _237;
    if (!_247)
    {
        float _251 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _253 = log2(_251);
        float _255 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _257 = _255 + 1.0;
        float _259 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = _209 * _253;
        float _263 = 1.0 / _257;
        float _265 = _259 * 0.693147182464599609375;
        float _267 = exp2(_261);
        float _269 = 1.0 / _265;
        float _271 = _267 + (-1.0);
        float _273 = -_271;
        float _275 = fma(_273, _269, _209);
        float _277 = _275 * _263;
        float _279 = _277 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _249 = _279;
    }
    float _281 = _249;
    bool _283 = !_161;
    if (!_283)
    {
        float _285 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = log2(_285);
        float _289 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _291 = _289 + 1.0;
        float _293 = 1.0 / _291;
        float _295 = _209 * _287;
        float _297 = exp2(_295);
        float _299 = -_297;
        float _301 = _299 + 1.0;
        float _303 = _301 * _293;
        _225 = _303;
    }
    float _305 = _225;
    float _307 = fma(_241, 0.5, 0.5);
    float _309 = in.m_56.w;
    bool _311 = _213 < 0.5;
    float _313 = float(_311);
    float _315 = fma(_217, 0.5, 0.5);
    int _317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _319 = _317 != 0;
    int _321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _323 = _321 != 0;
    float _325 = in.m_44.x;
    float _327 = in.m_44.y;
    float _329 = in.m_44.z;
    float _331 = -_313;
    float _333 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _335 = -_213;
    float _337 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _339 = !_319;
    int _341 = _339 ? 0 : 1;
    float _343 = -_315;
    float _345 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _347 = _245 < 0.5;
    float _349 = float(_347);
    float _351 = -_307;
    float _353 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _355 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _357 = abs(_341);
    float _359 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _361 = -_349;
    float _363 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _365 = fma(_305, _193, _355);
    bool _367 = !_207;
    int _369 = _367 ? 0 : 1;
    float _371 = fma(_305, _191, _359);
    float _373 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _375 = !_323;
    int _377 = _375 ? 0 : 1;
    float _379 = -_245;
    float _381 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _383 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _385 = fma(_305, _195, _373);
    int _387 = abs(_369);
    float _389 = float(_357);
    float _391 = fma(_371, _309, _325);
    int _393 = abs(_377);
    float _395 = fma(_385, _309, _329);
    float _397 = float(_387);
    float _399 = abs(_337);
    float _401 = _389 * _399;
    float _403 = abs(_381);
    float _405 = _389 * _403;
    float _407 = float(_393);
    float _409 = fma(_365, _309, _327);
    float _411 = fma(_397, _345, _401);
    float _413 = fma(_397, _353, _405);
    float _415 = abs(_333);
    float _417 = fma(_407, _415, _411);
    float _419 = abs(_363);
    float _421 = fma(_407, _419, _413);
    bool _423 = !_383;
    float _441;
    float _443;
    if (!_423)
    {
        float _425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _427 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _429 = float(_91);
        float _431 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _433 = _431 * _425;
        float _435 = floor(_433);
        float _437 = -_435;
        float _439 = _433 + _437;
        _441 = _429;
        _443 = _439;
        _445 = true;
    }
    else
    {
        float _447 = float(_91);
        float _449 = 1.0 / _447;
        float _451 = _125 * _449;
        _441 = _447;
        _443 = _451;
    }
    _445 = false;
    float _453 = _441;
    float _455 = _443;
    float _457 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _459 = int(_457);
    float _461 = in.m_51.w;
    float _463 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _465 = int(_463);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _467;
    float _471 = float(_459);
    float _473 = 1.0 / _453;
    float _475 = float(uint(_465));
    float _477 = 1.0 / _471;
    int _479 = ~_465;
    int _481 = _479 + 1;
    int _483 = ~_465;
    int _485 = _483 + 1;
    int _487 = ~_465;
    int _489 = _487 + 1;
    float _491 = 1.0 / _475;
    float _493 = _125 * _477;
    float _495 = 1.0 / _469;
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _499 = _497 != 0;
    int _501 = as_type<int>(_491) + (-2);
    float _503 = trunc(_493);
    int _505 = int(_503);
    float _507 = float(uint(_505));
    float _509 = as_type<float>(_501) * _507;
    float _511 = trunc(_509);
    float _513 = precise::max(_511, 0.0);
    uint _516 = uint(_513);
    float _518 = float(_505);
    int _520 = _481 * int(_516);
    int _522 = _520 + _505;
    float _524 = float(_465);
    float _526 = float(uint(_522));
    bool _528 = _518 >= _524;
    bool _530 = isnan(_518);
    bool _532 = _528 || _530;
    bool _534 = isnan(_524);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = as_type<float>(_501) * _526;
    float _542 = trunc(_538);
    int _544 = int(_542);
    bool _546 = !_499;
    float _548 = _546 ? 7.345489978790283203125 : 1.0;
    float _550 = _548 * _145;
    float _552 = trunc(_540);
    float _554 = precise::max(_552, 0.0);
    uint _556 = uint(_554);
    float _558 = floor(_550);
    int _560 = int(_516) + int(_556);
    int _562 = _485 * _560;
    int _564 = _562 + _505;
    float _566 = -_558;
    float _568 = _550 + _566;
    int _570 = ~_544;
    int _572 = _570 + 1;
    int _574 = _572 + 1;
    bool _576 = uint(_564) >= uint(_465);
    bool _578 = !_576;
    int _580 = _578 ? 0 : (-1);
    int _582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _584 = _582 != 0;
    int _586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _588 = _586 != 0;
    int _590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _592 = _590 != 0;
    int _594 = ~_560;
    int _596 = _594 + _580;
    int _598 = _596 + 1;
    float _600 = _568 * _524;
    bool _602 = _465 == 0;
    float _604 = _125 * _524;
    int _606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _608 = _606 != 0;
    int _610 = _465 * _598;
    int _612 = _610 + _505;
    int _614 = _465 + (-1);
    float _616 = _604 * _473;
    float _618 = trunc(_600);
    int _620 = int(_618);
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _624 = _622 != 0;
    bool _626 = !_602;
    int _628 = _626 ? _612 : (-1);
    bool _630 = !_608;
    int _632 = _630 ? 0 : 1;
    int _634 = _628 * _574;
    float _636 = trunc(_616);
    int _638 = int(_636);
    bool _640 = !_588;
    int _642 = _640 ? 0 : 1;
    int _644 = _544 * _614;
    int _646 = _644 + _634;
    bool _648 = !_584;
    int _650 = _648 ? 0 : 1;
    int _652 = abs(_642);
    bool _654 = !_592;
    int _656 = _654 ? 0 : 1;
    int _658 = abs(_650);
    int _660 = _646 * _652;
    bool _662 = !_624;
    int _664 = _662 ? 0 : 1;
    int _666 = abs(_656);
    int _668 = abs(_632);
    int _670 = abs(_664);
    int _672 = _620 * _668;
    int _674 = _672 + _505;
    int _676 = _638 * _658;
    int _678 = _676 + _660;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _680;
    int _684 = ~_465;
    int _686 = _684 + 1;
    int _688 = _674 * _666;
    int _690 = _688 + _678;
    int _692 = ~_465;
    int _694 = _692 + 1;
    float _696 = 1.0 / _682;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _700 = _698 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _702 = _620 * _670;
    int _704 = _702 + _690;
    int _706 = ~_465;
    int _708 = _706 + 1;
    float _710 = float(uint(_674));
    float _712 = float(uint(_704));
    float _714 = 1.0 / _700;
    float _716 = as_type<float>(_501) * _710;
    float _718 = as_type<float>(_501) * _712;
    float _720 = trunc(_716);
    float _722 = precise::max(_720, 0.0);
    uint _724 = uint(_722);
    float _726 = trunc(_718);
    float _728 = precise::max(_726, 0.0);
    uint _730 = uint(_728);
    int _732 = _708 * int(_730);
    int _734 = _732 + _704;
    float _736 = float(uint(_734));
    float _738 = as_type<float>(_501) * _736;
    float _740 = trunc(_738);
    float _742 = precise::max(_740, 0.0);
    uint _744 = uint(_742);
    int _746 = int(_730) + int(_744);
    int _748 = _686 * _746;
    int _750 = _748 + _704;
    int _752 = _694 * int(_724);
    int _754 = _752 + _674;
    bool _756 = uint(_750) >= uint(_465);
    float _758 = float(uint(_754));
    bool _760 = !_756;
    int _762 = _760 ? 0 : (-1);
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _766 = _764 != 0;
    float _768 = as_type<float>(_501) * _758;
    int _770 = ~_746;
    int _772 = _770 + _762;
    int _774 = _772 + 1;
    bool _776 = !_766;
    int _778 = _776 ? 0 : 1;
    float _780 = trunc(_768);
    float _782 = precise::max(_780, 0.0);
    uint _784 = uint(_782);
    int _786 = _465 * _774;
    int _788 = _786 + _704;
    int _790 = abs(_778);
    bool _792 = !_602;
    int _794 = _792 ? _788 : (-1);
    int _796 = _794 & 3;
    bool _798 = _796 != 0;
    int _800 = _794 >> 31;
    bool _802 = uint(_796) > 1u;
    int _804 = _794 & 3;
    bool _806 = _804 != 0;
    int _808 = _800 & 3;
    int _810 = _806 ? 0 : 1;
    int _812 = int(_724) + int(_784);
    int _814 = ~_810;
    int _816 = _814 + 1;
    int _818 = _816 + 1;
    float _820 = in.m_58.x;
    float _822 = in.m_58.y;
    float _824 = in.m_58.z;
    int _826 = _794 + _808;
    int _828 = _489 * _812;
    int _830 = _828 + _674;
    bool _832 = uint(_796) >= 2u;
    float _834 = in.m_60.x;
    float _836 = in.m_60.y;
    float _838 = in.m_60.z;
    bool _840 = _796 != 3;
    bool _842 = _796 != 3;
    int _844 = _818;
    if (!_802)
    {
        int _846 = ~_810;
        int _848 = _846 + 1;
        _844 = _848;
    }
    int _850 = _844;
    float _852 = in.m_62.x;
    float _854 = in.m_62.y;
    float _856 = in.m_62.z;
    bool _858 = !_798;
    int _860 = _858 ? 0 : 1;
    int _862 = _832 ? 0 : 1;
    bool _864 = !_842;
    int _866 = _864 ? 0 : (-1);
    int _868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _870 = _868 != 0;
    int _872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _874 = _872 != 0;
    int _876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _878 = _876 != 0;
    int _880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _882 = _880 != 0;
    float _884 = _409 * _822;
    int _886 = _826 >> 2;
    float _888 = _409 * _836;
    int _890 = ~_862;
    int _892 = _890 + 1;
    int _894 = _892 + 1;
    int _896 = _886 << 4;
    int _898 = _896 + 368;
    float _900 = fma(_391, _834, _888);
    int _902 = _894;
    if (_840)
    {
        int _904 = ~_862;
        int _906 = _904 + 1;
        _902 = _906;
    }
    int _908 = _902;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _912 = _910 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    uint _914 = uint(int(uint(_898) >> uint(2)));
    uint _916 = uint(int(uint(int(_914)) >> uint(2)));
    int _918 = int(_914) & 3;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[int(_916)][_918];
    int _922 = int(_914) + 1;
    uint _924 = uint(int(uint(_922) >> uint(2)));
    int _926 = _922 & 3;
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[int(_924)][_926];
    float _930 = _409 * _854;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _934 = _455 + _932;
    bool _936 = uint(_830) >= uint(_465);
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _940 = _455 + _938;
    float _942 = fma(_391, _852, _930);
    float _944 = _934 * _696;
    float _946 = 1.0 / _912;
    int _948 = _898 + 8;
    uint _950 = uint(int(uint(_948) >> uint(2)));
    uint _952 = uint(int(uint(int(_950)) >> uint(2)));
    int _954 = int(_950) & 3;
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[int(_952)][_954];
    int _958 = int(_950) + 1;
    uint _960 = uint(int(uint(_958) >> uint(2)));
    int _962 = _958 & 3;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[int(_960)][_962];
    bool _966 = !_936;
    int _968 = _966 ? 0 : (-1);
    float _970 = fma(_391, _820, _884);
    bool _972 = _461 > 0.5;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _976 = _455 + _974;
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _980 = _455 + _978;
    float _982 = _940 * _495;
    bool _984 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _986 = isnan(_455);
    bool _988 = _984 || _986;
    bool _990 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _992 = _988 || _990;
    float _994 = float(_992);
    float _996 = _980 * _714;
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1000 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _998;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1004 = _1002 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1006;
    float _1010 = -_994;
    float _1012 = _1010 + 1.0;
    float _1014 = _976 * _946;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1018 = _1016 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _1020 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1022 = isnan(_455);
    bool _1024 = _1020 || _1022;
    bool _1026 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1028 = _1024 || _1026;
    float _1030 = float(_1028);
    float _1032 = fma(_1004, _996, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _1034 = ~_812;
    int _1036 = _1034 + _968;
    int _1038 = _1036 + 1;
    float _1040 = fma(_1018, _996, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _1042 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1044 = isnan(_455);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1050 = _1046 || _1048;
    float _1052 = float(_1050);
    float _1054 = fma(_1000, _944, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1056 = fma(_1008, _944, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1058 = _1030 * _1012;
    float _1060 = -_1030;
    float _1062 = _1060 + 1.0;
    int _1064 = abs(_850);
    int _1066 = _465 * _1038;
    int _1068 = _1066 + _674;
    bool _1070 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1072 = isnan(_455);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1078 = _1074 || _1076;
    float _1080 = float(_1078);
    float _1082 = fma(_395, _824, _970);
    int _1084 = abs(_860);
    float _1086 = -_1052;
    float _1088 = _1086 + 1.0;
    bool _1090 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1092 = isnan(_455);
    bool _1094 = _1090 || _1092;
    bool _1096 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1098 = _1094 || _1096;
    float _1100 = float(_1098);
    float _1102 = _1052 * _1062;
    int _1104 = ~_1064;
    int _1106 = _1104 + 1;
    int _1108 = _1106 + 1;
    float _1110 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1112 = int(_1110);
    float _1114 = _1080 * _1088;
    float _1116 = -_1080;
    float _1118 = _1116 + 1.0;
    int _1120 = abs(_908);
    float _1122 = fma(_395, _838, _900);
    int _1124 = ~_1084;
    int _1126 = _1124 + 1;
    int _1128 = _1126 + 1;
    int _1130 = _1108 * as_type<int>(_928);
    int _1132 = abs(_866);
    float _1134 = _1100 * _1118;
    int _1136 = _1128 * as_type<int>(_920);
    int _1138 = _1136 + _1130;
    float _1140 = _1054 * _1134;
    int _1142 = ~_1120;
    int _1144 = _1142 + 1;
    int _1146 = _1144 + 1;
    float _1148 = -_1100;
    float _1150 = _1148 + 1.0;
    int _1152 = ~_1132;
    int _1154 = _1152 + 1;
    int _1156 = _1154 + 1;
    float _1158 = _1056 * _1134;
    float _1160 = float(uint(_1112));
    int _1162 = _1146 * as_type<int>(_956);
    int _1164 = _1162 + _1138;
    int _1166 = abs(_1112);
    float _1168 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1158);
    int _1170 = _1156 * as_type<int>(_964);
    int _1172 = _1170 + _1164;
    float _1174 = 1.0 / _1160;
    float _1176 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1140);
    float _1178 = fma(_1032, _1114, _1168);
    int _1180 = ~_790;
    int _1182 = _1180 + 1;
    int _1184 = _1182 + 1;
    float _1186 = fma(_1040, _1114, _1176);
    float _1188 = float(uint(_1166));
    float _1190 = in.m_51.y;
    bool _1192 = !_602;
    int _1194 = _1192 ? _1068 : (-1);
    int _1196 = _1172 * _1184;
    float _1198 = in.m_56.x;
    float _1200 = in.m_56.y;
    int _1202 = _1194 * _790;
    int _1204 = _1202 + _1196;
    float _1206 = 1.0 / _1188;
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1210 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1208;
    int _1212 = as_type<int>(_1174) + (-2);
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1214;
    float _1218 = float(uint(_1204));
    float _1220 = fma(_1210, _982, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1222 = _1122 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1224 = fma(_1216, _982, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _1228 = _1226 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1230 = as_type<float>(_1212) * _1218;
    float _1232 = fma(_1220, _1102, _1186);
    int _1234 = abs(_1204);
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1238 = _1236 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1240 = fma(_1228, _1014, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _1242 = fma(_1224, _1102, _1178);
    float _1244 = trunc(_1230);
    float _1246 = precise::max(_1244, 0.0);
    uint _1248 = uint(_1246);
    float _1250 = fma(_1238, _1014, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    int _1252 = as_type<int>(_1206) + (-2);
    float _1254 = fma(_1240, _1058, _1242);
    float _1256 = float(uint(_1234));
    float _1258 = fma(_1250, _1058, _1232);
    int _1260 = ~_1112;
    int _1262 = _1260 + 1;
    float _1264 = fma(_395, _856, _942);
    float _1266 = as_type<float>(_1252) * _1256;
    float _1268 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1258);
    float _1270 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1254);
    int _1272 = ~_1166;
    int _1274 = _1272 + 1;
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1278 = _1268 * _1198;
    float _1280 = trunc(_1266);
    float _1282 = precise::max(_1280, 0.0);
    uint _1284 = uint(_1282);
    int _1286 = _1262 * int(_1248);
    int _1288 = _1286 + _1204;
    float _1290 = _145 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1292 = _1270 * _1200;
    float _1294 = _417 * _1278;
    float _1296 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _203);
    float _1298 = float(uint(_1288));
    float _1300 = -_1276;
    float _1302 = fma(_1290, 2.0, _1300);
    float _1304 = _421 * _1292;
    float _1306 = _1294 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1308 = as_type<float>(_1212) * _1298;
    float _1310 = _1264 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1312 = _1304 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1314 = _1306 * _1296;
    float _1316 = trunc(_1308);
    float _1318 = precise::max(_1316, 0.0);
    uint _1320 = uint(_1318);
    int _1322 = _1274 * int(_1284);
    int _1324 = _1322 + _1234;
    float _1326 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _221);
    float _1328 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1330 = float(uint(_1324));
    float _1332 = _1312 * _1326;
    float _1334 = as_type<float>(_1252) * _1330;
    float _1336 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1338 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1340 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1336);
    float _1342 = trunc(_1334);
    float _1344 = precise::max(_1342, 0.0);
    uint _1346 = uint(_1344);
    float _1348 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1338);
    float _1350 = _1082 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1352 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1340);
    int _1354 = int(_1248) + int(_1320);
    float _1356 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1348);
    int _1358 = ~_1112;
    int _1360 = _1358 + 1;
    float _1362 = _1352 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1364 = ~_1166;
    int _1366 = _1364 + 1;
    float _1368 = _1356 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1370 = _1222 + _1362;
    int _1372 = _1360 * _1354;
    int _1374 = _1372 + _1204;
    float _1376 = _1350 + _1368;
    float _1378 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1380 = _1370 + _1378;
    int _1382 = int(_1284) + int(_1346);
    float _1384 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1386 = _1376 + _1384;
    bool _1388 = uint(_1374) >= uint(_1112);
    float _1390 = _1380 * _1380;
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1394 = _1386 * _1386;
    int _1396 = _1366 * _1382;
    int _1398 = _1396 + _1234;
    bool _1400 = !_1388;
    int _1402 = _1400 ? 0 : (-1);
    float _1404 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1406 = _1390 + _1394;
    bool _1408 = uint(_1398) >= uint(_1166);
    float _1410 = fma(_1404, -2.0, _1392);
    float _1412 = sqrt(_1406);
    int _1414 = ~_1354;
    int _1416 = _1414 + _1402;
    int _1418 = _1416 + 1;
    float _1420 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1422 = !_1408;
    int _1424 = _1422 ? 0 : (-1);
    bool _1426 = _145 > 0.5;
    int _1428 = _1112 * _1418;
    int _1430 = _1428 + _1204;
    float _1432 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1420);
    float _1434 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1436 = -_203;
    int _1438 = _1426 ? as_type<int>(_1436) : as_type<int>(_203);
    float _1440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1442 = _1112 == 0;
    float _1444 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1432);
    bool _1446 = !_870;
    float _1448 = _1446 ? _203 : as_type<float>(_1438);
    float _1450 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1452 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1454 = !_1442;
    int _1456 = _1454 ? _1430 : (-1);
    float _1458 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1460 = _1412 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1462 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1464 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1452);
    bool _1466 = _1112 == 0;
    float _1468 = _1444 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1470 = _1204 ^ _1112;
    float _1472 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1474 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1458);
    float _1476 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1462);
    uint _1478 = uint(int(uint(_1470) >> uint(31)));
    float _1480 = _1310 + _1468;
    int _1482 = ~_1424;
    int _1484 = _1382 + _1482;
    int _1486 = _1484 + 1;
    int _1488 = ~int(_1478);
    int _1490 = _1488 + 1;
    float _1492 = as_type<float>(_1478);
    float _1494 = _1370;
    float _1496 = _1468;
    float _1498 = _1310;
    float _1500 = _1376;
    float _1502 = _1186;
    float _1504 = _1190;
    if (!_1460)
    {
        _1492 = _1370;
    }
    float _1506 = _1492;
    float _1508 = _1506;
    if (!_1460)
    {
        _1494 = _1376;
    }
    float _1510 = _1494;
    float _1512 = _1510;
    if (!_1460)
    {
        _1496 = _1394;
    }
    float _1514 = _1496;
    float _1516 = _1514;
    if (!_1460)
    {
        _1498 = _1390;
    }
    float _1518 = _1498;
    int _1520 = _1486 ^ _1490;
    float _1522 = _1518;
    if (!_1460)
    {
        _1500 = _1480;
    }
    float _1524 = _1500;
    bool _1526 = !_1460;
    float _1528 = _1524;
    if (!_1526)
    {
        float _1530 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1532 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1534 = _1412 + _1532;
        float _1536 = rsqrt(_1406);
        float _1538 = _1534 * _1530;
        float _1540 = _1480 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1542 = _1538 * 0.15915493667125701904296875;
        float _1544 = _1542 * 6.283185482025146484375;
        float _1546 = sin(_1544);
        float _1548 = _1542 * 6.283185482025146484375;
        float _1550 = cos(_1548);
        float _1552 = fma(_1546, _1540, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1554 = _1536 * _1552;
        float _1556 = _1550 + (-1.0);
        float _1558 = fma(_1380, _1554, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1560 = fma(_1386, _1554, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1562 = _1556 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1564 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1566 = _1558 + _1564;
        float _1568 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1570 = _1560 + _1568;
        float _1572 = fma(_1480, _1550, _1562);
        float _1574 = _1566 * _1566;
        float _1576 = _1570 * _1570;
        _1528 = _1572;
        _1522 = _1574;
        _1516 = _1576;
        _1508 = _1558;
        _1512 = _1560;
    }
    float _1578 = _1528;
    float _1580 = _1522;
    float _1582 = _1516;
    float _1584 = _1508;
    float _1586 = _1512;
    int _1588 = ~_1490;
    int _1590 = _1588 + _1520;
    int _1592 = _1590 + 1;
    float _1594 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1596 = _1578 + _1594;
    float _1598 = float(_1456);
    float _1600 = _1472 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1602 = !_1466;
    int _1604 = _1602 ? _1592 : (-1);
    float _1606 = fma(_1596, _1596, _1580);
    float _1608 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1410);
    float _1610 = float(_1604);
    float _1612 = _1606 + _1582;
    float _1614 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1616 = _1440 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1618 = sqrt(_1612);
    float _1620 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1622 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1624 = -_125;
    float _1626 = fma(_1624, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1302);
    float _1628 = -_1608;
    float _1630 = fma(_1600, _1610, _1628);
    bool _1632 = _1190 > 0.5;
    float _1634 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1636 = _1620 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1638 = _1622 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1640 = _1614 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1642 = fma(_1616, _1598, _1626);
    float _1644 = in.m_51.z;
    float _1646 = -_221;
    int _1648 = _1632 ? as_type<int>(_1646) : as_type<int>(_221);
    float _1650 = _1448 + 0.5;
    float _1652 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1654 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    out.m_64.x = _1636;
    out.m_64.y = _1638;
    out.m_64.z = _1640;
    out.m_64.w = _1634;
    bool _1656 = !_874;
    float _1658 = _1656 ? _221 : as_type<float>(_1648);
    float _1660 = fma(_1616, _1650, _1642);
    float _1662 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1652);
    float _1664 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1654);
    float _1666 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1668 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1662);
    float _1670 = _1658 + (-0.5);
    float _1672 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1664);
    bool _1674 = _1618 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1676 = isnan(_1618);
    bool _1678 = _1674 || _1676;
    bool _1680 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1682 = _1678 || _1680;
    float _1684 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1686 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1688 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1690 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1692 = -_1668;
    float _1694 = _1692 + 1.0;
    float _1696 = -_1600;
    float _1698 = fma(_1696, _1670, _1630);
    float _1700 = -_1672;
    float _1702 = _1700 + 1.0;
    float _1704 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1706 = _1686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1708 = _1688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1710 = _1690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1712 = -_1694;
    float _1714 = fma(_1448, _1712, _1660);
    float _1716 = fma(_1658, _1702, _1698);
    out.m_66.x = _1706;
    out.m_66.y = _1708;
    out.m_66.z = _1710;
    out.m_66.w = _1704;
    float _1718 = _1666 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1720 = _1684 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1722 = (*spvDescriptorSet0.vp_c9)._m0[81].z + (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1724 = (*spvDescriptorSet0.vp_c9)._m0[81].w + (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1726 = _1644 > 0.5;
    float _1728 = _1474 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1730 = _1464 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[83].x + (*spvDescriptorSet0.vp_c9)._m0[83].z;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[83].y + (*spvDescriptorSet0.vp_c9)._m0[83].w;
    float _1736 = _1476 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1738 = _1704;
    float _1740 = _1634;
    float _1742 = _1644;
    if (!_1682)
    {
        _1738 = 1.0;
    }
    float _1744 = _1738;
    bool _1746 = !_1682;
    float _1748 = _1744;
    if (!_1746)
    {
        bool _1750 = _1618 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1752 = isnan(_1618);
        bool _1754 = _1750 || _1752;
        bool _1756 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1758 = _1754 || _1756;
        if (!_1758)
        {
            float _1760 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1762 = _1618 + _1760;
            float _1764 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1766 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1764;
            float _1768 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1770 = _1768 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1772 = 1.0 / _1766;
            float _1774 = _1762 * _1772;
            float _1776 = fma(_1774, _1770, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1748 = _1776;
            _1778 = true;
        }
        else
        {
            bool _1780 = _1618 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1782 = isnan(_1618);
            bool _1784 = _1780 || _1782;
            bool _1786 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1788 = _1784 || _1786;
            if (!_1788)
            {
                float _1790 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1792 = _1618 + _1790;
                float _1794 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1796 = _1794 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1798 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1800 = _1798 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1802 = 1.0 / _1796;
                float _1804 = _1792 * _1802;
                float _1806 = fma(_1804, _1800, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1748 = _1806;
                _1778 = true;
            }
            else
            {
                _1748 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1778 = false;
    float _1808 = _1748;
    float _1810 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1812 = _1578 + _1810;
    float _1814 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1816 = _1584 + _1814;
    float _1818 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1820 = _1586 + _1818;
    float _1822 = fma(_1812, _1808, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1824 = fma(_1816, _1808, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1826 = fma(_1820, _1808, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1828 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1830 = _1822 + _1828;
    float _1832 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1834 = _1824 + _1832;
    float _1836 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1838 = _1826 + _1836;
    float _1840 = _1830 * _1830;
    float _1842 = fma(_1834, _1834, _1840);
    float _1844 = fma(_1838, _1838, _1842);
    float _1846 = rsqrt(_1844);
    float _1848 = _1846 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1850 = _1834 * _1848;
    float _1852 = _1838 * _1848;
    float _1854 = _1850 * _1850;
    float _1856 = _1852 * _1852;
    float _1858 = _1854 + _1856;
    float _1860 = sqrt(_1858);
    bool _1862 = _1860 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1864 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1866 = _1860 + _1864;
    float _1868 = _1838;
    float _1870 = _1858;
    float _1872 = _1866;
    float _1874 = _1830;
    float _1876 = _1850;
    if (_1862)
    {
        float _1878 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1868 = _1878;
    }
    float _1880 = _1868;
    if (_1862)
    {
        float _1882 = rsqrt(_1858);
        _1870 = _1882;
    }
    float _1884 = _1870;
    if (_1862)
    {
        float _1886 = _1866 * _1880;
        _1872 = _1886;
    }
    float _1888 = _1872;
    if (_1862)
    {
        float _1890 = _1888 * 0.15915493667125701904296875;
        _1740 = _1890;
    }
    float _1892 = _1740;
    float _1894 = _1846;
    float _1896 = _1892;
    if (_1862)
    {
        float _1898 = _1892 * 6.283185482025146484375;
        float _1900 = sin(_1898);
        _1894 = _1900;
    }
    float _1902 = _1894;
    float _1904 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1906 = precise::max(0.0, _1904);
    float _1908 = _1880;
    float _1910 = _1906;
    if (_1862)
    {
        float _1912 = _1892 * 6.283185482025146484375;
        float _1914 = cos(_1912);
        _1908 = _1914;
    }
    float _1916 = _1908;
    float _1918 = -_1848;
    float _1920 = -_1906;
    float _1922 = fma(_1830, _1918, _1920);
    if (_1862)
    {
        float _1924 = _1922 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1874 = _1924;
    }
    float _1926 = _1874;
    float _1928 = _1902;
    float _1930 = _1926;
    if (_1862)
    {
        float _1932 = fma(_1902, _1926, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1928 = _1932;
    }
    float _1934 = _1928;
    float _1936 = _1934;
    if (!_1862)
    {
        _1930 = _1922;
    }
    float _1938 = _1930;
    float _1940 = _1938;
    float _1942 = _1916;
    if (_1862)
    {
        float _1944 = _1916 + (-1.0);
        _1910 = _1944;
    }
    float _1946 = _1910;
    float _1948 = _1946;
    if (_1862)
    {
        float _1950 = _1884 * _1934;
        _1502 = _1950;
    }
    float _1952 = _1502;
    if (!_1862)
    {
        _1936 = _1852;
    }
    float _1954 = _1936;
    float _1956 = sqrt(_1844);
    float _1958 = _1954;
    if (_1862)
    {
        float _1960 = _1946 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1896 = _1960;
    }
    float _1962 = _1896;
    if (_1862)
    {
        float _1964 = _1850 * _1952;
        _1876 = _1964;
    }
    float _1966 = _1876;
    if (!_1862)
    {
        _1948 = _1854;
    }
    float _1968 = _1948;
    float _1970 = _1968;
    if (_1862)
    {
        float _1972 = _1852 * _1952;
        _1958 = _1972;
    }
    float _1974 = _1958;
    if (_1862)
    {
        float _1976 = fma(_1922, _1916, _1962);
        _1940 = _1976;
    }
    float _1978 = _1940;
    if (_1862)
    {
        float _1980 = _1966 * _1966;
        _1970 = _1980;
    }
    float _1982 = _1970;
    if (!_1862)
    {
        _1942 = _1856;
    }
    float _1984 = _1942;
    float _1986 = _1984;
    if (_1862)
    {
        float _1988 = _1974 * _1974;
        _1986 = _1988;
    }
    float _1990 = _1986;
    float _1992 = fma(_1978, _1978, _1982);
    float _1994 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1996 = _1992 + _1990;
    float _1998 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2000 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2002 = fma(_1956, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2000);
    float _2004 = precise::clamp(_2002, 0.0, 1.0);
    float _2006 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2008 = rsqrt(_1996);
    float _2010 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1998);
    float _2012 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2014 = -_2004;
    float _2016 = _2014 + 1.0;
    float _2018 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2020 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2010);
    float _2022 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2012);
    float _2024 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2018);
    float _2026 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1994);
    float _2028 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2022);
    float _2030 = _2020 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2032 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2024);
    float _2034 = abs(_2016);
    float _2036 = log2(_2034);
    float _2038 = _2028 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2040 = _2030 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2042 = _2008 * _1966;
    float _2044 = _2032 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2046 = _2038 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2048 = _2008 * _1978;
    float _2050 = _2042 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2052 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2026);
    float _2054 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2046);
    float _2056 = _2008 * _1974;
    float _2058 = -_2050;
    float _2060 = fma(_2048, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2058);
    float _2062 = -_2040;
    float _2064 = fma(_2062, _2006, 1.0);
    float _2066 = _2052 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2068 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2054);
    float _2070 = -_2056;
    float _2072 = fma(_2070, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2060);
    float _2074 = _2036 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2076 = _2038 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2078 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2068);
    float _2080 = fma(_2072, -0.5, 0.5);
    float _2082 = log2(_2064);
    float _2084 = _2038 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2086 = fma(_2072, 0.5, 0.5);
    float _2088 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2076);
    float _2090 = _2048 + 1.0;
    float _2092 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2084);
    float _2094 = fma(_2086, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2096 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2088);
    float _2098 = 1.0 / _2078;
    float _2100 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2092);
    float _2102 = fma(_2086, _2094, -0.212114393711090087890625);
    float _2104 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2096);
    float _2106 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2100);
    float _2108 = fma(_2086, _2102, 1.570728778839111328125);
    float _2110 = exp2(_2074);
    float _2112 = _2082 * 0.693147182464599609375;
    float _2114 = _2112 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2116 = sqrt(_2080);
    float _2118 = _2104 * _2098;
    float _2120 = _2106 * _2098;
    float _2122 = fma(_2118, 0.5, 0.5);
    float _2124 = fma(_2120, -0.5, 0.5);
    float _2126 = -_2048;
    float _2128 = fma(_2110, _2090, _2126);
    float3 _5481 = float3(_2122, _2124, _2114);
    float _2130 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5481, float3(0.0), isnan(_5481)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5481, float3(0.0), isnan(_5481)), level(0.0)).x;
    float _2132 = fma(_2128, 0.5, 0.5);
    float _2134 = _2116 * 0.636619746685028076171875;
    float _2136 = -_2108;
    float _2138 = fma(_2134, _2136, 1.0);
    float3 _5502 = float3(_2122, _2124, _2114);
    float4 _2141 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5502, float3(0.0), isnan(_5502)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5502, float3(0.0), isnan(_5502)), level(0.0)).xyzw;
    float _2143 = _2141.x;
    float _2145 = _2141.y;
    float _2147 = _2141.z;
    float _2149 = _2141.w;
    float2 _5519 = float2(_2138, _2132);
    float3 _2153 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5519, float2(0.0), isnan(_5519)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5519, float2(0.0), isnan(_5519)), level(0.0)).xyz;
    float _2155 = _2153.x;
    float _2157 = _2153.y;
    float _2159 = _2153.z;
    float _2161 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2163 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2165 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2161);
    float _2167 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2169 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2163);
    float _2171 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2165);
    float _2173 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2167);
    float _2175 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2169);
    float _2177 = _2169;
    if (!_499)
    {
        _2177 = _1644;
    }
    float _2179 = _2177;
    float _2181 = _2171 * _2171;
    float _2183 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2173);
    float _2185 = _2179;
    if (_499)
    {
        _1742 = _1190;
    }
    float _2187 = _1742;
    float _2189 = fma(_2175, _2175, _2181);
    if (_499)
    {
        _2185 = _1190;
    }
    float _2191 = _2185;
    float _2193 = fma(_2187, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1734);
    float _2195 = fma(_2183, _2183, _2189);
    if (_499)
    {
        _1504 = _145;
    }
    float _2197 = _1504;
    float _2199 = _2038 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2201 = _2191 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2203 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2193);
    float _2205 = rsqrt(_2195);
    float _2207 = _2197 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2209 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2199);
    float _2211 = fma(_2197, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1732);
    float _2213 = fma(_2201, -2.0, _1724);
    float _2215 = -_1722;
    float _2217 = fma(_2207, 2.0, _2215);
    float _2219 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2209);
    float _2221 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2211);
    float _2223 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2213);
    float _2225 = -_2203;
    float _2227 = _2225 + 1.0;
    float _2229 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2219);
    float _2231 = -_2221;
    float _2233 = _2231 + 1.0;
    float _2235 = _2175 * _2205;
    float _2237 = _2171 * _2205;
    float _2239 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2241 = fma(_2235, 0.5, 0.5);
    float _2243 = _2036 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2245 = fma(_2237, -0.5, 0.5);
    float _2247 = -_125;
    float _2249 = fma(_2247, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2217);
    float _2251 = _2229 + _2078;
    float _2253 = _2241;
    float _2255 = _2245;
    if (_878)
    {
        float _2257 = -_2241;
        float _2259 = _1726 ? _2257 : _2241;
        _2253 = _2259;
    }
    float _2261 = _2253;
    out.m_47.x = _2239;
    float _2263 = exp2(_2243);
    if (_882)
    {
        float _2265 = -_2245;
        float _2267 = _972 ? _2265 : _2245;
        _2255 = _2267;
    }
    float _2269 = _2255;
    float _2271 = _2261 + 0.5;
    float _2273 = fma(_1718, _2271, _2249);
    float _2275 = _2269 + (-0.5);
    float _2277 = -_2233;
    float _2279 = fma(_2277, _2261, _2273);
    float _2281 = -_1720;
    float _2283 = -_2223;
    float _2285 = fma(_2281, _2275, _2283);
    float _2287 = _2251 * 0.5;
    float _2289 = -_2263;
    float _2291 = _2289 + 1.0;
    float _2293 = fma(_2227, _2269, _2285);
    out.m_68.z = _2287;
    out.m_68.w = _2078;
    float _2295 = _2291 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2104;
    out.gl_Position.y = _2106;
    out.gl_Position.z = _2229;
    out.gl_Position.w = _2078;
    out.m_70.x = _1714;
    out.m_70.y = _1716;
    out.m_70.z = _2279;
    out.m_70.w = _2293;
    float _2297 = _2295 * _2130;
    float _2299 = -_2295;
    float _2301 = _2299 + 1.0;
    float _2303 = _2149 * _2297;
    float _2305 = _2149 * _2301;
    float _2307 = _2159 * _2297;
    float _2309 = fma(_2155, _2303, _2143);
    float _2311 = fma(_2157, _2303, _2145);
    float _2313 = fma(_2149, _2307, _2147);
    out.m_72.x = _2309;
    out.m_72.y = _2311;
    out.m_72.z = _2313;
    out.m_72.w = _2305;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

