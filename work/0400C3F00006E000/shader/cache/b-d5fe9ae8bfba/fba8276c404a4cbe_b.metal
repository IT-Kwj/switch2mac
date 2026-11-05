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
    constant _16* vp_c7 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
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
    float4 m_66 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_76 [[user(locn3)]];
    float4 m_86 [[user(locn4)]];
    float4 m_74 [[user(locn5)]];
    float4 m_78 [[user(locn6)]];
    float4 m_72 [[user(locn7)]];
    float4 m_70 [[user(locn8)]];
    float4 m_84 [[user(locn9)]];
    float4 m_82 [[user(locn10)]];
    float4 m_80 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_56 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_60 [[attribute(3)]];
    float4 m_62 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_54 [[attribute(7)]];
    float4 m_68 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3533 = false;
    bool _395 = false;
    bool _201 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_44.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_47.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3818 = as_type<float>(_121);
        out.gl_Position.z = _3818;
    }
    if (!_109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_49.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = 0.0;
    float _143 = _139;
    if (_135)
    {
        float _145 = float(_105);
        _141 = _145;
    }
    float _147 = _141;
    bool _149 = _139 >= _147;
    bool _151 = !_135;
    bool _153 = _149 || _151;
    if (_153)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _115;
    if (_153)
    {
        out.m_47.x = 0.0;
    }
    if (_153)
    {
        float _157 = _155 * 5.0;
        _123 = as_type<int>(_157);
    }
    int _159 = _123;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3887 = as_type<float>(_159);
        out.gl_Position.z = _3887;
    }
    if (_153)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    bool _163 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _165 = as_type<int>(_161) & 1;
    bool _167 = _165 != 0;
    int _169 = as_type<int>(_161) & 2;
    bool _171 = _169 != 0;
    bool _173 = !_167;
    float _175 = _173 ? (-0.5) : 0.5;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_163;
    float _199;
    if (!_181)
    {
        float _183 = in.m_54.x;
        float _185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _187 = _183 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _189 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _191 = _189 * _185;
        float _193 = floor(_191);
        float _195 = -_193;
        float _197 = _191 + _195;
        _199 = _197;
        _201 = true;
    }
    else
    {
        float _203 = float(_105);
        float _205 = 1.0 / _203;
        float _207 = _139 * _205;
        _199 = _207;
    }
    _201 = false;
    float _209 = _199;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = _209 + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _217 = _209 + _215;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _221 = _209 + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _225 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _223;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _229 = _227 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _231;
    bool _235 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _237 = isnan(_209);
    bool _239 = _235 || _237;
    bool _241 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _243 = _239 || _241;
    float _245 = float(_243);
    float _247 = 1.0 / _229;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _251 = 1.0 / _225;
    float _253 = 1.0 / _233;
    float _255 = _221 * _247;
    bool _257 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _259 = isnan(_209);
    bool _261 = _257 || _259;
    bool _263 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _265 = _261 || _263;
    float _267 = float(_265);
    float _269 = _213 * _251;
    bool _271 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _273 = isnan(_209);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = -_245;
    float _285 = _283 + 1.0;
    float _287 = _281 * _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _293 = _217 * _253;
    bool _295 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _297 = isnan(_209);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = -_281;
    float _309 = _307 + 1.0;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _323 = _305 * _309;
    float _325 = -_305;
    float _327 = _325 + 1.0;
    float _329 = fma(_313, _269, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _331 = fma(_317, _269, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _333 = _267 * _327;
    float _335 = -_267;
    float _337 = _335 + 1.0;
    float _339 = fma(_291, _255, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _341 = _329 * _333;
    float _343 = _331 * _333;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _345;
    float _349 = fma(_321, _255, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _351 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[143].x, _341);
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _353;
    float _357 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[143].y, _343);
    float _359 = fma(_347, _293, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _361 = fma(_339, _323, _351);
    float _363 = fma(_355, _293, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _365 = fma(_349, _323, _357);
    float _367 = fma(_359, _287, _361);
    float _369 = fma(_363, _287, _365);
    float _371 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[146].x, _367);
    float _373 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[146].y, _369);
    bool _375 = !_249;
    float _393;
    if (!_375)
    {
        float _377 = in.m_54.x;
        float _379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _381 = _377 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _383 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[11].x, _139);
        float _385 = _383 * _379;
        float _387 = floor(_385);
        float _389 = -_387;
        float _391 = _385 + _389;
        _393 = _391;
        _395 = true;
    }
    else
    {
        float _397 = float(_105);
        float _399 = 1.0 / _397;
        float _401 = _139 * _399;
        _393 = _401;
    }
    _395 = false;
    float _403 = _393;
    float _405 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _407 = int(_405);
    int _409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _411 = _409 != 0;
    float _413 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _415 = int(_413);
    float _417 = float(_407);
    float _419 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _421 = int(_419);
    float _423 = float(_415);
    float _425 = 1.0 / _417;
    float _427 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _429 = int(_427);
    float _431 = float(uint(_421));
    float _433 = 1.0 / _423;
    float _435 = _425 * _139;
    float _437 = 1.0 / _431;
    float _439 = float(uint(_429));
    int _441 = ~_429;
    int _443 = _441 + 1;
    float _445 = float(_429);
    float _447 = trunc(_435);
    int _449 = int(_447);
    float _451 = _433 * _139;
    float _453 = 1.0 / _439;
    int _455 = as_type<int>(_437) + (-2);
    float _457 = trunc(_451);
    int _459 = int(_457);
    float _461 = float(uint(_449));
    float _463 = as_type<float>(_455) * _461;
    int _465 = as_type<int>(_453) + (-2);
    float _467 = trunc(_463);
    float _469 = precise::max(_467, 0.0);
    uint _472 = uint(_469);
    float _474 = _453;
    if (_411)
    {
        float _476 = in.m_54.x;
        _474 = _476;
    }
    float _478 = _474;
    float _480 = _478;
    if (!_411)
    {
        float _482 = in.m_54.y;
        _480 = _482;
    }
    float _484 = _480;
    float _486 = float(uint(_459));
    float _488 = as_type<float>(_465) * _486;
    int _490 = ~_421;
    int _492 = _490 + 1;
    float _494 = trunc(_488);
    float _496 = precise::max(_494, 0.0);
    uint _498 = uint(_496);
    int _500 = _492 * int(_472);
    int _502 = _500 + _449;
    float _504 = float(uint(_502));
    float _506 = in.m_54.x;
    float _508 = in.m_54.y;
    float _510 = in.m_54.z;
    float _512 = in.m_54.w;
    float _514 = as_type<float>(_455) * _504;
    float _516 = _504;
    if (_411)
    {
        _516 = 1.0;
    }
    float _518 = _516;
    float _520 = _518;
    if (!_411)
    {
        _520 = 7.345489978790283203125;
    }
    float _522 = _520;
    int _524 = _443 * int(_498);
    int _526 = _524 + _459;
    float _528 = trunc(_514);
    float _530 = precise::max(_528, 0.0);
    uint _532 = uint(_530);
    float _534 = float(uint(_526));
    float _536 = float(_105);
    float _538 = float(_421);
    float _540 = as_type<float>(_465) * _534;
    float _542 = 1.0 / _536;
    float _544 = _522 * _506;
    int _546 = int(_472) + int(_532);
    float _548 = as_type<float>(_532);
    if (_411)
    {
        _548 = 1.0;
    }
    float _550 = _548;
    float _552 = trunc(_540);
    float _554 = precise::max(_552, 0.0);
    uint _556 = uint(_554);
    float _558 = float(_449);
    float _560 = _550;
    if (!_411)
    {
        _560 = 1.2345600128173828125;
    }
    float _562 = _560;
    float _564 = floor(_544);
    int _566 = ~_421;
    int _568 = _566 + 1;
    float _570 = _562 * _484;
    int _572 = _568 * _546;
    int _574 = _572 + _449;
    int _576 = int(_498) + int(_556);
    float _578 = floor(_570);
    int _580 = ~_429;
    int _582 = _580 + 1;
    bool _584 = _558 >= _538;
    bool _586 = isnan(_558);
    bool _588 = _584 || _586;
    bool _590 = isnan(_538);
    bool _592 = _588 || _590;
    float _594 = float(_592);
    bool _596 = uint(_574) >= uint(_421);
    int _598 = _582 * _576;
    int _600 = _598 + _459;
    float _602 = -_564;
    float _604 = _544 + _602;
    float _606 = float(_459);
    float _608 = trunc(_594);
    int _610 = int(_608);
    bool _612 = !_596;
    int _614 = _612 ? 0 : (-1);
    float _616 = _604 * _538;
    bool _618 = uint(_600) >= uint(_429);
    int _620 = ~_546;
    int _622 = _620 + _614;
    int _624 = _622 + 1;
    float _626 = trunc(_616);
    int _628 = int(_626);
    int _630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _632 = _630 != 0;
    int _634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _636 = _634 != 0;
    int _638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _640 = _638 != 0;
    float _642 = -_578;
    float _644 = _570 + _642;
    bool _646 = _606 >= _445;
    bool _648 = isnan(_606);
    bool _650 = _646 || _648;
    bool _652 = isnan(_445);
    bool _654 = _650 || _652;
    float _656 = float(_654);
    int _658 = _421 * _624;
    int _660 = _658 + _449;
    int _662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _664 = _662 != 0;
    bool _666 = !_618;
    int _668 = _666 ? 0 : (-1);
    bool _670 = !_636;
    int _672 = _670 ? 0 : 1;
    float _674 = trunc(_656);
    int _676 = int(_674);
    bool _678 = !_664;
    int _680 = _678 ? 0 : 1;
    bool _682 = _421 == 0;
    int _684 = ~_576;
    int _686 = _684 + _668;
    int _688 = _686 + 1;
    int _690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _692 = _690 != 0;
    int _694 = ~_610;
    int _696 = _694 + 1;
    int _698 = _696 + 1;
    bool _700 = !_682;
    int _702 = _700 ? _660 : (-1);
    int _704 = abs(_680);
    int _706 = _429 * _688;
    int _708 = _706 + _459;
    bool _710 = !_692;
    int _712 = _710 ? 0 : 1;
    float _714 = _542 * _139;
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _718 = _716 != 0;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _722 = _720 != 0;
    int _724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _726 = _724 != 0;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _730 = _728 != 0;
    int _732 = _702 * _698;
    int _734 = _421 + (-1);
    float _736 = _644 * _445;
    float _738 = _538 * _714;
    bool _740 = !_722;
    int _742 = _740 ? 0 : 1;
    float _744 = _445 * _714;
    int _746 = _610 * _734;
    int _748 = _746 + _732;
    bool _750 = _429 == 0;
    float _752 = trunc(_738);
    int _754 = int(_752);
    int _756 = ~_676;
    int _758 = _756 + 1;
    int _760 = _758 + 1;
    int _762 = _628 * _704;
    int _764 = _762 + _449;
    bool _766 = !_750;
    int _768 = _766 ? _708 : (-1);
    int _770 = abs(_672);
    int _772 = abs(_712);
    float _774 = trunc(_736);
    int _776 = int(_774);
    int _778 = _429 + (-1);
    int _780 = _768 * _760;
    int _782 = abs(_742);
    bool _784 = !_632;
    int _786 = _784 ? 0 : 1;
    int _788 = _676 * _778;
    int _790 = _788 + _780;
    float _792 = trunc(_744);
    int _794 = int(_792);
    int _796 = abs(_786);
    int _798 = _748 * _770;
    bool _800 = !_640;
    int _802 = _800 ? 0 : 1;
    int _804 = _790 * _782;
    int _806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _808 = _806 != 0;
    int _810 = _754 * _796;
    int _812 = _810 + _798;
    int _814 = abs(_802);
    int _816 = _776 * _772;
    int _818 = _816 + _459;
    bool _820 = !_718;
    int _822 = _820 ? 0 : 1;
    bool _824 = !_808;
    int _826 = _824 ? 0 : 1;
    bool _828 = !_726;
    int _830 = _828 ? 0 : 1;
    int _832 = abs(_822);
    int _834 = abs(_826);
    int _836 = _764 * _814;
    int _838 = _836 + _812;
    bool _840 = !_730;
    int _842 = _840 ? 0 : 1;
    int _844 = abs(_830);
    int _846 = abs(_842);
    int _848 = _794 * _832;
    int _850 = _848 + _804;
    int _852 = _628 * _834;
    int _854 = _852 + _838;
    float _856 = float(uint(_764));
    int _858 = _818 * _844;
    int _860 = _858 + _850;
    float _862 = float(uint(_854));
    int _864 = ~_421;
    int _866 = _864 + 1;
    int _868 = _776 * _846;
    int _870 = _868 + _860;
    float _872 = as_type<float>(_455) * _856;
    float _874 = as_type<float>(_455) * _862;
    float _876 = float(uint(_818));
    float _878 = float(uint(_870));
    float _880 = trunc(_874);
    float _882 = precise::max(_880, 0.0);
    uint _884 = uint(_882);
    float _886 = as_type<float>(_465) * _876;
    float _888 = as_type<float>(_465) * _878;
    int _890 = ~_429;
    int _892 = _890 + 1;
    int _894 = ~_421;
    int _896 = _894 + 1;
    int _898 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _900 = _898 != 0;
    float _902 = trunc(_888);
    float _904 = precise::max(_902, 0.0);
    uint _906 = uint(_904);
    int _908 = _866 * int(_884);
    int _910 = _908 + _854;
    float _912 = trunc(_872);
    float _914 = precise::max(_912, 0.0);
    uint _916 = uint(_914);
    float _918 = float(uint(_910));
    int _920 = _892 * int(_906);
    int _922 = _920 + _870;
    float _924 = trunc(_886);
    float _926 = precise::max(_924, 0.0);
    uint _928 = uint(_926);
    float _930 = as_type<float>(_455) * _918;
    float _932 = float(uint(_922));
    int _934 = _896 * int(_916);
    int _936 = _934 + _764;
    float _938 = as_type<float>(_465) * _932;
    float _940 = trunc(_930);
    float _942 = precise::max(_940, 0.0);
    uint _944 = uint(_942);
    float _946 = float(uint(_936));
    int _948 = ~_429;
    int _950 = _948 + 1;
    float _952 = trunc(_938);
    float _954 = precise::max(_952, 0.0);
    uint _956 = uint(_954);
    float _958 = as_type<float>(_455) * _946;
    int _960 = ~_421;
    int _962 = _960 + 1;
    int _964 = _950 * int(_928);
    int _966 = _964 + _818;
    float _968 = trunc(_958);
    float _970 = precise::max(_968, 0.0);
    uint _972 = uint(_970);
    int _974 = int(_884) + int(_944);
    int _976 = ~_429;
    int _978 = _976 + 1;
    float _980 = float(uint(_966));
    int _982 = _962 * _974;
    int _984 = _982 + _854;
    int _986 = int(_906) + int(_956);
    float _988 = as_type<float>(_465) * _980;
    bool _990 = uint(_984) >= uint(_421);
    int _992 = _978 * _986;
    int _994 = _992 + _870;
    int _996 = ~_421;
    int _998 = _996 + 1;
    int _1000 = int(_916) + int(_972);
    float _1002 = trunc(_988);
    float _1004 = precise::max(_1002, 0.0);
    uint _1006 = uint(_1004);
    bool _1008 = uint(_994) >= uint(_429);
    bool _1010 = !_990;
    int _1012 = _1010 ? 0 : (-1);
    int _1014 = _998 * _1000;
    int _1016 = _1014 + _764;
    bool _1018 = !_1008;
    int _1020 = _1018 ? 0 : (-1);
    int _1022 = ~_974;
    int _1024 = _1022 + _1012;
    int _1026 = _1024 + 1;
    int _1028 = ~_986;
    int _1030 = _1028 + _1020;
    int _1032 = _1030 + 1;
    bool _1034 = uint(_1016) >= uint(_421);
    int _1036 = _421 * _1026;
    int _1038 = _1036 + _854;
    int _1040 = _429 * _1032;
    int _1042 = _1040 + _870;
    bool _1044 = !_1034;
    int _1046 = _1044 ? 0 : (-1);
    bool _1048 = !_682;
    int _1050 = _1048 ? _1038 : (-1);
    bool _1052 = !_750;
    int _1054 = _1052 ? _1042 : (-1);
    int _1056 = ~_1000;
    int _1058 = _1056 + _1046;
    int _1060 = _1058 + 1;
    int _1062 = _1050 >> 31;
    int _1064 = _1054 >> 31;
    int _1066 = _421 * _1060;
    int _1068 = _1066 + _764;
    int _1070 = _1050 & 3;
    bool _1072 = _1070 != 0;
    int _1074 = _1062 & 3;
    int _1076 = _1064 & 3;
    int _1078 = _1050 & 3;
    bool _1080 = _1078 != 0;
    bool _1082 = _1070 != 3;
    int _1084 = _1054 + _1076;
    int _1086 = _1080 ? 0 : 1;
    int _1088 = _1050 + _1074;
    bool _1090 = uint(_1070) >= 2u;
    int _1092 = _1084 >> 2;
    int _1094 = _1088 >> 2;
    int _1096 = _1090 ? 0 : 1;
    int _1098 = _1092 << 4;
    int _1100 = _1098 + 512;
    int _1102 = _1094 << 4;
    int _1104 = _1102 + 368;
    bool _1106 = uint(_1070) > 1u;
    int _1108 = ~_1096;
    int _1110 = _1108 + 1;
    int _1112 = _1110 + 1;
    uint _1114 = uint(int(uint(_1104) >> uint(2)));
    uint _1116 = uint(int(uint(int(_1114)) >> uint(2)));
    int _1118 = int(_1114) & 3;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[int(_1116)][_1118];
    int _1122 = int(_1114) + 1;
    uint _1124 = uint(int(uint(_1122) >> uint(2)));
    int _1126 = _1122 & 3;
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[int(_1124)][_1126];
    int _1130 = _1112;
    if (_1082)
    {
        int _1132 = ~_1096;
        int _1134 = _1132 + 1;
        _1130 = _1134;
    }
    int _1136 = _1130;
    int _1138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1140 = _1138 != 0;
    int _1142 = int(_928) + int(_1006);
    int _1144 = ~_429;
    int _1146 = _1144 + 1;
    uint _1148 = uint(int(uint(_1100) >> uint(2)));
    uint _1150 = uint(int(uint(int(_1148)) >> uint(2)));
    int _1152 = int(_1148) & 3;
    float _1154 = (*spvDescriptorSet0.vp_c9)._m0[int(_1150)][_1152];
    int _1156 = int(_1148) + 1;
    uint _1158 = uint(int(uint(_1156) >> uint(2)));
    int _1160 = _1156 & 3;
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[int(_1158)][_1160];
    bool _1164 = !_1140;
    int _1166 = _1164 ? 0 : 1;
    int _1168 = _1054 & 3;
    bool _1170 = _1168 != 0;
    int _1172 = _1146 * _1142;
    int _1174 = _1172 + _818;
    int _1176 = ~_1086;
    int _1178 = _1176 + 1;
    int _1180 = _1178 + 1;
    int _1182 = _1180;
    if (!_1106)
    {
        int _1184 = ~_1086;
        int _1186 = _1184 + 1;
        _1182 = _1186;
    }
    int _1188 = _1182;
    int _1190 = _1100 + 8;
    uint _1192 = uint(int(uint(_1190) >> uint(2)));
    uint _1194 = uint(int(uint(int(_1192)) >> uint(2)));
    int _1196 = int(_1192) & 3;
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[int(_1194)][_1196];
    int _1200 = int(_1192) + 1;
    uint _1202 = uint(int(uint(_1200) >> uint(2)));
    int _1204 = _1200 & 3;
    float _1206 = (*spvDescriptorSet0.vp_c9)._m0[int(_1202)][_1204];
    int _1208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1210 = _1208 != 0;
    bool _1212 = !_682;
    int _1214 = _1212 ? _1068 : (-1);
    bool _1216 = uint(_1168) >= 2u;
    bool _1218 = !_1210;
    int _1220 = _1218 ? 0 : 1;
    bool _1222 = uint(_1168) > 1u;
    int _1224 = _1216 ? 0 : 1;
    bool _1226 = uint(_1174) >= uint(_429);
    bool _1228 = !_1072;
    int _1230 = _1228 ? 0 : 1;
    int _1232 = _1104 + 8;
    uint _1234 = uint(int(uint(_1232) >> uint(2)));
    uint _1236 = uint(int(uint(int(_1234)) >> uint(2)));
    int _1238 = int(_1234) & 3;
    float _1240 = (*spvDescriptorSet0.vp_c9)._m0[int(_1236)][_1238];
    int _1242 = int(_1234) + 1;
    uint _1244 = uint(int(uint(_1242) >> uint(2)));
    int _1246 = _1242 & 3;
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[int(_1244)][_1246];
    bool _1250 = _1168 != 3;
    int _1252 = _1054 & 3;
    bool _1254 = _1252 != 0;
    bool _1256 = !_1170;
    int _1258 = _1256 ? 0 : 1;
    bool _1260 = _512 > 0.5;
    int _1262 = _1254 ? 0 : 1;
    bool _1264 = _1070 != 3;
    int _1266 = ~_1262;
    int _1268 = _1266 + 1;
    int _1270 = _1268 + 1;
    int _1272 = _1270;
    if (!_1222)
    {
        int _1274 = ~_1262;
        int _1276 = _1274 + 1;
        _1272 = _1276;
    }
    int _1278 = _1272;
    bool _1280 = _1168 != 3;
    int _1282 = ~_1224;
    int _1284 = _1282 + 1;
    int _1286 = _1284 + 1;
    int _1288 = _1286;
    if (_1250)
    {
        int _1290 = ~_1224;
        int _1292 = _1290 + 1;
        _1288 = _1292;
    }
    int _1294 = _1288;
    bool _1296 = !_1264;
    int _1298 = _1296 ? 0 : (-1);
    bool _1300 = !_1280;
    int _1302 = _1300 ? 0 : (-1);
    int _1304 = abs(_1278);
    int _1306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1308 = _1306 != 0;
    int _1310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1312 = _1310 != 0;
    int _1314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1316 = _1314 != 0;
    int _1318 = abs(_1188);
    bool _1320 = !_1226;
    int _1322 = _1320 ? 0 : (-1);
    int _1324 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1326 = _1324 != 0;
    int _1328 = abs(_1230);
    float _1330 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1332 = int(_1330);
    int _1334 = ~_1142;
    int _1336 = _1334 + _1322;
    int _1338 = _1336 + 1;
    int _1340 = ~_1304;
    int _1342 = _1340 + 1;
    int _1344 = _1342 + 1;
    int _1346 = ~_1318;
    int _1348 = _1346 + 1;
    int _1350 = _1348 + 1;
    int _1352 = _429 * _1338;
    int _1354 = _1352 + _818;
    int _1356 = abs(_1258);
    int _1358 = _1344 * as_type<int>(_1162);
    int _1360 = ~_1328;
    int _1362 = _1360 + 1;
    int _1364 = _1362 + 1;
    int _1366 = _1350 * as_type<int>(_1128);
    float _1368 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1370 = int(_1368);
    int _1372 = abs(_1166);
    int _1374 = _1364 * as_type<int>(_1120);
    int _1376 = _1374 + _1366;
    int _1378 = ~_1356;
    int _1380 = _1378 + 1;
    int _1382 = _1380 + 1;
    int _1384 = abs(_1136);
    int _1386 = abs(_1294);
    int _1388 = _1382 * as_type<int>(_1154);
    int _1390 = _1388 + _1358;
    int _1392 = abs(_1332);
    int _1394 = ~_1386;
    int _1396 = _1394 + 1;
    int _1398 = _1396 + 1;
    int _1400 = abs(_1298);
    int _1402 = ~_1384;
    int _1404 = _1402 + 1;
    int _1406 = _1404 + 1;
    int _1408 = _1398 * as_type<int>(_1198);
    int _1410 = _1408 + _1390;
    float _1412 = float(uint(_1332));
    float _1414 = in.m_44.x;
    float _1416 = in.m_44.y;
    float _1418 = in.m_44.z;
    int _1420 = _1406 * as_type<int>(_1240);
    int _1422 = _1420 + _1376;
    int _1424 = abs(_1302);
    float _1426 = in.m_56.x;
    float _1428 = in.m_56.y;
    float _1430 = in.m_56.z;
    float _1432 = in.m_56.w;
    int _1434 = ~_1400;
    int _1436 = _1434 + 1;
    int _1438 = _1436 + 1;
    float _1440 = 1.0 / _1412;
    float _1442 = float(uint(_1370));
    int _1444 = abs(_1220);
    int _1446 = _1438 * as_type<int>(_1248);
    int _1448 = _1446 + _1422;
    float _1450 = in.m_58.x;
    float _1452 = in.m_58.y;
    float _1454 = in.m_58.z;
    float _1456 = in.m_58.w;
    int _1458 = ~_1372;
    int _1460 = _1458 + 1;
    int _1462 = _1460 + 1;
    float _1464 = 1.0 / _1442;
    int _1466 = abs(_1370);
    float _1468 = in.m_60.x;
    float _1470 = in.m_60.y;
    float _1472 = in.m_60.z;
    float _1474 = in.m_60.w;
    int _1476 = ~_1424;
    int _1478 = _1476 + 1;
    int _1480 = _1478 + 1;
    int _1482 = _1448 * _1462;
    int _1484 = ~_1444;
    int _1486 = _1484 + 1;
    int _1488 = _1486 + 1;
    int _1490 = _1480 * as_type<int>(_1206);
    int _1492 = _1490 + _1410;
    bool _1494 = !_750;
    int _1496 = _1494 ? _1354 : (-1);
    int _1498 = _1214 * _1372;
    int _1500 = _1498 + _1482;
    float _1502 = float(uint(_1392));
    int _1504 = _1492 * _1488;
    int _1506 = as_type<int>(_1440) + (-2);
    float _1508 = _1416 * _1428;
    float _1510 = float(uint(_1500));
    int _1512 = _1496 * _1444;
    int _1514 = _1512 + _1504;
    float _1516 = 1.0 / _1502;
    float _1518 = float(uint(_1466));
    float _1520 = fma(_1414, _1426, _1508);
    float _1522 = as_type<float>(_1506) * _1510;
    int _1524 = as_type<int>(_1464) + (-2);
    float _1526 = _1416 * _1452;
    float _1528 = float(uint(_1514));
    float _1530 = fma(_1418, _1430, _1520);
    float _1532 = 1.0 / _1518;
    int _1534 = abs(_1500);
    float _1536 = _1416 * _1470;
    float _1538 = as_type<float>(_1524) * _1528;
    float _1540 = _1530 + _1432;
    float _1542 = fma(_1414, _1468, _1536);
    float _1544 = trunc(_1522);
    float _1546 = precise::max(_1544, 0.0);
    uint _1548 = uint(_1546);
    int _1550 = as_type<int>(_1516) + (-2);
    float _1552 = fma(_1414, _1450, _1526);
    float _1554 = float(uint(_1534));
    float _1556 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1558 = abs(_1514);
    float _1560 = _506 * 2.0;
    float _1562 = trunc(_1538);
    float _1564 = precise::max(_1562, 0.0);
    uint _1566 = uint(_1564);
    int _1568 = ~_1332;
    int _1570 = _1568 + 1;
    float _1572 = as_type<float>(_1550) * _1554;
    int _1574 = as_type<int>(_1532) + (-2);
    float _1576 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1578 = float(uint(_1558));
    float _1580 = _508 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1582 = ~_1370;
    int _1584 = _1582 + 1;
    int _1586 = _1570 * int(_1548);
    int _1588 = _1586 + _1500;
    float _1590 = trunc(_1572);
    float _1592 = precise::max(_1590, 0.0);
    uint _1594 = uint(_1592);
    float _1596 = as_type<float>(_1574) * _1578;
    float _1598 = fma(_1580, -2.0, _1576);
    float _1600 = float(uint(_1588));
    float _1602 = _506 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1604 = ~_1466;
    int _1606 = _1604 + 1;
    int _1608 = _1584 * int(_1566);
    int _1610 = _1608 + _1514;
    float _1612 = trunc(_1596);
    float _1614 = precise::max(_1612, 0.0);
    uint _1616 = uint(_1614);
    float _1618 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1620 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1618;
    float _1622 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1624 = _1622 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    int _1626 = ~_1392;
    int _1628 = _1626 + 1;
    float _1630 = -_1556;
    float _1632 = fma(_1602, 2.0, _1630);
    float _1634 = float(uint(_1610));
    float _1636 = as_type<float>(_1506) * _1600;
    float _1638 = fma(_1418, _1472, _1542);
    float _1640 = 1.0 / _1624;
    int _1642 = _1628 * int(_1594);
    int _1644 = _1642 + _1534;
    float _1646 = as_type<float>(_1524) * _1634;
    float _1648 = fma(_1418, _1454, _1552);
    float _1650 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1652 = _403 + _1650;
    float _1654 = float(uint(_1644));
    float _1656 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1658 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1656;
    int _1660 = _1606 * int(_1616);
    int _1662 = _1660 + _1558;
    float _1664 = 1.0 / _1620;
    float _1666 = as_type<float>(_1550) * _1654;
    float _1668 = _506 + _508;
    float _1670 = float(uint(_1662));
    float _1672 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1674 = _403 + _1672;
    float _1676 = _1668 + (-1.0);
    float _1678 = trunc(_1636);
    float _1680 = precise::max(_1678, 0.0);
    uint _1682 = uint(_1680);
    float _1684 = as_type<float>(_1574) * _1670;
    float _1686 = _1674 * _1640;
    float _1688 = _510 + _508;
    float _1690 = _1648 + _1456;
    float _1692 = -_139;
    float _1694 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1632);
    float _1696 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1598);
    float _1698 = floor(_1560);
    float _1700 = _1652 * _1664;
    float _1702 = fma(_1676, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1704 = ~_1332;
    int _1706 = _1704 + 1;
    float _1708 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1710 = as_type<int>(_1652);
    if (_900)
    {
        _1710 = 0;
    }
    int _1712 = _1710;
    int _1714 = _1712;
    if (!_900)
    {
        _1714 = 1;
    }
    int _1716 = _1714;
    float _1718 = trunc(_1684);
    float _1720 = precise::max(_1718, 0.0);
    uint _1722 = uint(_1720);
    int _1724 = int(_1548) + int(_1682);
    float _1726 = _1688 + (-1.0);
    float _1728 = -_179;
    int _1730 = _1260 ? as_type<int>(_1728) : as_type<int>(_179);
    bool _1732 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1734 = isnan(_403);
    bool _1736 = _1732 || _1734;
    bool _1738 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1740 = _1736 || _1738;
    float _1742 = float(_1740);
    float _1744 = trunc(_1666);
    float _1746 = precise::max(_1744, 0.0);
    uint _1748 = uint(_1746);
    bool _1750 = _1698 > 0.0;
    float _1752 = fma(_1726, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1754 = _1698 >= 0.0;
    bool _1756 = isnan(_1698);
    bool _1758 = _1754 || _1756;
    bool _1760 = isnan(0.0);
    bool _1762 = _1758 || _1760;
    int _1764 = _1706 * _1724;
    int _1766 = _1764 + _1500;
    int _1768 = ~_1392;
    int _1770 = _1768 + 1;
    float _1772 = fma(_1658, _1700, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _1774 = !_1308;
    float _1776 = _1774 ? _179 : as_type<float>(_1730);
    float _1778 = trunc(_1646);
    float _1780 = precise::max(_1778, 0.0);
    uint _1782 = uint(_1780);
    int _1784 = int(_1616) + int(_1722);
    float _1786 = _508 * 2.0;
    bool _1788 = uint(_1766) >= uint(_1332);
    bool _1790 = _506 > 0.5;
    float _1792 = floor(_1786);
    int _1794 = int(_1594) + int(_1748);
    float _1796 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1796;
    int _1800 = ~_1370;
    int _1802 = _1800 + 1;
    bool _1804 = !_1788;
    int _1806 = _1804 ? 0 : (-1);
    int _1808 = _1770 * _1794;
    int _1810 = _1808 + _1534;
    float _1812 = -_175;
    int _1814 = _1790 ? as_type<int>(_1812) : as_type<int>(_175);
    float _1816 = fma(_1798, _1700, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    int _1818 = int(_1566) + int(_1782);
    bool _1820 = uint(_1810) >= uint(_1392);
    bool _1822 = _508 > 0.5;
    int _1824 = _1802 * _1818;
    int _1826 = _1824 + _1514;
    int _1828 = ~_1466;
    int _1830 = _1828 + 1;
    bool _1832 = !_1820;
    int _1834 = _1832 ? 0 : (-1);
    float _1836 = -_179;
    int _1838 = _1822 ? as_type<int>(_1836) : as_type<int>(_179);
    bool _1840 = uint(_1826) >= uint(_1370);
    bool _1842 = !_1326;
    float _1844 = _1842 ? _175 : as_type<float>(_1814);
    bool _1846 = _1716 != 1;
    int _1848 = _1830 * _1784;
    int _1850 = _1848 + _1558;
    bool _1852 = _510 > 0.5;
    bool _1854 = !_1312;
    float _1856 = _1854 ? _179 : as_type<float>(_1838);
    bool _1858 = !_1840;
    int _1860 = _1858 ? 0 : (-1);
    bool _1862 = _1792 > 0.0;
    bool _1864 = _1792 >= 0.0;
    bool _1866 = isnan(_1792);
    bool _1868 = _1864 || _1866;
    bool _1870 = isnan(0.0);
    bool _1872 = _1868 || _1870;
    float _1874 = _510 * 2.0;
    float _1876 = -_175;
    int _1878 = _1852 ? as_type<int>(_1876) : as_type<int>(_175);
    bool _1880 = uint(_1850) >= uint(_1466);
    int _1882 = ~_1724;
    int _1884 = _1882 + _1806;
    int _1886 = _1884 + 1;
    float _1888 = floor(_1874);
    bool _1890 = !_1316;
    float _1892 = _1890 ? _175 : as_type<float>(_1878);
    bool _1894 = _1332 == 0;
    int _1896 = _1332 * _1886;
    int _1898 = _1896 + _1500;
    float _1900 = as_type<float>(_1826);
    float _1902 = as_type<float>(_1830);
    float _1904 = as_type<float>(_1850);
    float _1906 = as_type<float>(_1724);
    if (!_1846)
    {
        _1900 = _508;
    }
    float _1908 = _1900;
    float _1910 = _1908;
    if (!_1846)
    {
        _1902 = _508;
    }
    float _1912 = _1902;
    float _1914 = _1912;
    if (!_1846)
    {
        _1904 = _510;
    }
    float _1916 = _1904;
    float _1918 = _1916;
    if (!_1846)
    {
        _1906 = _510;
    }
    float _1920 = _1906;
    float _1922 = _1920;
    if (_1846)
    {
        _1910 = _506;
    }
    float _1924 = _1910;
    if (_1846)
    {
        _1914 = _506;
    }
    float _1926 = _1914;
    if (_1846)
    {
        _1918 = _508;
    }
    float _1928 = _1918;
    if (_1846)
    {
        _1922 = _508;
    }
    float _1930 = _1922;
    bool _1932 = !_1880;
    int _1934 = _1932 ? 0 : (-1);
    float _1936 = _1928 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1938 = !_1894;
    int _1940 = _1938 ? _1898 : (-1);
    float _1942 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1942;
    int _1946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1948 = _1946 != 0;
    int _1950 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1952 = _1950 != 0;
    int _1954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1956 = _1954 != 0;
    bool _1958 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1960 = isnan(_403);
    bool _1962 = _1958 || _1960;
    bool _1964 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1966 = _1962 || _1964;
    float _1968 = float(_1966);
    float _1970 = fma(_1944, _1700, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _1972 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1974 = isnan(_403);
    bool _1976 = _1972 || _1974;
    bool _1978 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1980 = _1976 || _1978;
    float _1982 = float(_1980);
    float _1984 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1986 = _1984 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    int _1988 = _1762 ? 0 : 1;
    float _1990 = -_1968;
    float _1992 = _1990 + 1.0;
    bool _1994 = _1888 >= 0.0;
    bool _1996 = isnan(_1888);
    bool _1998 = _1994 || _1996;
    bool _2000 = isnan(0.0);
    bool _2002 = _1998 || _2000;
    float _2004 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _2006 = _2004 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _2008 = -_1982;
    float _2010 = _2008 + 1.0;
    float _2012 = _1982 * _1992;
    int _2014 = _2002 ? 0 : 1;
    float _2016 = fma(_1986, _1686, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    bool _2018 = _1888 > 0.0;
    float _2020 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _2022 = _2020 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _2024 = _1742 * _2010;
    float _2026 = -_1742;
    float _2028 = _2026 + 1.0;
    int _2030 = ~_1818;
    int _2032 = _2030 + _1860;
    int _2034 = _2032 + 1;
    float _2036 = fma(_2022, _1686, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _2038 = _1638 + _1474;
    float _2040 = _1970 * _2024;
    float _2042 = _1816 * _2024;
    float _2044 = _1772 * _2024;
    int _2046 = ~_1988;
    int _2048 = _2046 + 1;
    int _2050 = _2048 + 1;
    float _2052 = fma(_2028, (*spvDescriptorSet0.vp_c9)._m0[107].x, _2040);
    float _2054 = fma(_2028, (*spvDescriptorSet0.vp_c9)._m0[107].y, _2042);
    float _2056 = fma(_2028, (*spvDescriptorSet0.vp_c9)._m0[107].z, _2044);
    int _2058 = _2050;
    if (!_1750)
    {
        int _2060 = ~_1988;
        int _2062 = _2060 + 1;
        _2058 = _2062;
    }
    int _2064 = _2058;
    int _2066 = _1370 * _2034;
    int _2068 = _2066 + _1514;
    bool _2070 = _1370 == 0;
    float _2072 = fma(_2036, _2012, _2052);
    int _2074 = ~_1834;
    int _2076 = _1794 + _2074;
    int _2078 = _2076 + 1;
    float _2080 = fma(_1926, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1708);
    bool _2082 = !_2070;
    int _2084 = _2082 ? _2068 : (-1);
    float _2086 = fma(_2006, _1686, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _2088 = _1332 == 0;
    float _2090 = fma(_2016, _2012, _2054);
    int _2092 = _1500 ^ _1332;
    float _2094 = fma(_2086, _2012, _2056);
    float _2096 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    uint _2098 = uint(int(uint(_2092) >> uint(31)));
    float _2100 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2080);
    float _2102 = float(_1940);
    float _2104 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2106 = ~int(_2098);
    int _2108 = _2106 + 1;
    float _2110 = fma(_1968, (*spvDescriptorSet0.vp_c9)._m0[109].x, _2072);
    float _2112 = fma(_1930, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2104);
    int _2114 = _2078 ^ _2108;
    float _2116 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2118 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2112);
    int _2120 = ~_2108;
    int _2122 = _2120 + _2114;
    int _2124 = _2122 + 1;
    float _2126 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2128 = _1924 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2130 = _2096 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2132 = !_2088;
    int _2134 = _2132 ? _2124 : (-1);
    float _2136 = fma(_1968, (*spvDescriptorSet0.vp_c9)._m0[109].y, _2090);
    bool _2138 = _1370 == 0;
    float _2140 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2142 = _1514 ^ _1370;
    float _2144 = -_2126;
    float _2146 = fma(_2128, 2.0, _2144);
    int _2148 = ~_1934;
    int _2150 = _1784 + _2148;
    int _2152 = _2150 + 1;
    float _2154 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    uint _2156 = uint(int(uint(_2142) >> uint(31)));
    float _2158 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2160 = _1690 + _2158;
    float _2162 = fma(_2130, _2102, _1694);
    float _2164 = fma(_1936, -2.0, _2154);
    int _2166 = ~int(_2156);
    int _2168 = _2166 + 1;
    float _2170 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2172 = _1540 + _2170;
    float _2174 = _2160 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2176 = _1844 + 0.5;
    int _2178 = _2152 ^ _2168;
    float _2180 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2182 = _2038 + _2180;
    float _2184 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2174);
    float _2186 = _2140 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2188 = ~_2168;
    int _2190 = _2188 + _2178;
    int _2192 = _2190 + 1;
    float _2194 = _2116 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2198 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2184);
    float _2200 = float(_2134);
    float _2202 = fma(_2130, _2176, _2162);
    float _2204 = float(_2084);
    float _2206 = -_139;
    float _2208 = fma(_2206, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2146);
    bool _2210 = !_2138;
    int _2212 = _2210 ? _2192 : (-1);
    float _2214 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2216 = -_1696;
    float _2218 = fma(_2194, _2200, _2216);
    bool _2220 = _2198 >= 0.0;
    float _2222 = _1856 + (-0.5);
    float _2224 = fma(_2186, _2204, _2208);
    float _2226 = _1892 + 0.5;
    float _2228 = float(_2212);
    float _2230 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2214);
    float _2232 = _2196 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2234 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2164);
    float _2236 = -_2194;
    float _2238 = fma(_2236, _2222, _2218);
    float _2240 = fma(_2186, _2226, _2224);
    float _2242 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2230);
    float _2244 = -_2234;
    float _2246 = fma(_2232, _2228, _2244);
    float _2248 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2250 = log2(_2248);
    float _2252 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2254 = _1776 + (-0.5);
    float _2256 = -_2242;
    float _2258 = _2256 + 1.0;
    int _2260 = ~_2014;
    int _2262 = _2260 + 1;
    int _2264 = _2262 + 1;
    float _2266 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2252);
    float _2268 = -_2100;
    float _2270 = _2268 + 1.0;
    float _2272 = -_2232;
    float _2274 = fma(_2272, _2254, _2246);
    float _2276 = -_2258;
    float _2278 = fma(_1844, _2276, _2202);
    float _2280 = -_2118;
    float _2282 = _2280 + 1.0;
    bool _2284 = !_1948;
    int _2286 = _2284 ? 0 : 1;
    float _2288 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2266);
    int _2290 = _2264;
    float _2292 = _2136;
    if (!_2018)
    {
        int _2294 = ~_2014;
        int _2296 = _2294 + 1;
        _2290 = _2296;
    }
    int _2298 = _2290;
    float _2300 = fma(_1776, _2282, _2274);
    int _2302 = abs(_2286);
    float _2304 = _2160 * _2160;
    float _2306 = -_2270;
    float _2308 = fma(_1892, _2306, _2240);
    float _2310 = -_2288;
    float _2312 = _2310 + 1.0;
    float _2314 = _2250 * _139;
    float _2316 = float(_2302);
    float _2318 = fma(_2172, _2172, _2304);
    float _2320 = float(_2298);
    float _2322 = _2110 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2324 = fma(_1856, _2312, _2238);
    float _2326 = fma(_2182, _2182, _2318);
    float _2328 = fma(_1968, (*spvDescriptorSet0.vp_c9)._m0[109].z, _2094);
    float _2330 = exp2(_2314);
    float _2332 = _2316 * _2320;
    float _2334 = _2328 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2336 = _2136 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    if (_2220)
    {
        _2292 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2338 = _2292;
    float _2340 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2342 = 1.0 + _2340;
    float _2344 = rsqrt(_2326);
    float _2346 = in.m_62.x;
    float _2348 = in.m_62.y;
    float _2350 = in.m_62.z;
    float _2352 = _2322 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2354 = _2336 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2356 = _2334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2358 = as_type<int>(_2338);
    if (_2220)
    {
        float _2360 = _2338 * 5.0;
        _2358 = as_type<int>(_2360);
    }
    int _2362 = _2358;
    bool _2364 = !_1952;
    int _2366 = _2364 ? 0 : 1;
    out.m_64.x = _2278;
    out.m_64.y = _2324;
    out.m_64.z = _2308;
    out.m_64.w = _2300;
    float _2368 = 1.0 / _2342;
    float _2370 = -_2330;
    float _2372 = _2370 + 1.0;
    bool _2374 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2376 = isnan(0.0);
    bool _2378 = _2374 || _2376;
    bool _2380 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2382 = _2378 || _2380;
    out.m_66.x = _2352;
    out.m_66.y = _2354;
    out.m_66.z = _2356;
    bool _2384 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2386 = isnan(1.0);
    bool _2388 = _2384 || _2386;
    bool _2390 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2392 = _2388 || _2390;
    int _2394 = _1872 ? 0 : 1;
    if (_2220)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7089 = as_type<float>(_2362);
        out.gl_Position.z = _7089;
    }
    bool _2396 = !_1956;
    int _2398 = _2396 ? 0 : 1;
    float _2400 = _2160 * _2344;
    if (_2220)
    {
        out.m_47.x = 0.0;
    }
    int _2402 = abs(_2366);
    float _2404 = _2172 * _2344;
    if (_2220)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2406 = -_2400;
    float _2408 = fma(_2406, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1690);
    float _2410 = _2182 * _2344;
    float _2412 = -_2404;
    float _2414 = fma(_2412, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1540);
    float _2416 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2418 = _2408 + _2416;
    float _2420 = -_2410;
    float _2422 = fma(_2420, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2038);
    float _2424 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2426 = _2414 + _2424;
    int _2428 = ~_2394;
    int _2430 = _2428 + 1;
    int _2432 = _2430 + 1;
    float _2434 = _2418 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2436 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2438 = _2422 + _2436;
    float _2440 = float(_2064);
    float _2442 = _508 + (-0.5);
    float _2444 = fma(_2426, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2434);
    float _2446 = float(_2402);
    int _2448 = _2432;
    float _2450 = _2426;
    float _2452 = _2418;
    float _2454 = _2438;
    if (!_1862)
    {
        int _2456 = ~_2394;
        int _2458 = _2456 + 1;
        _2448 = _2458;
    }
    int _2460 = _2448;
    float _2462 = _2332 * (-2.0);
    float _2464 = fma(_2438, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2444);
    float _2466 = _2382 ? _2372 : 0.0;
    float _2468 = _2446 * _2440;
    float _2470 = _506 + (-0.5);
    float _2472 = fma(_2462, _2346, _2346);
    bool _2474 = _2464 >= 0.0;
    if (_2392)
    {
        float _2476 = _2466 * _2368;
        _143 = _2476;
    }
    float _2478 = _143;
    float _2480 = fma(_1702, _2462, _1702);
    float _2482 = fma(_2470, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2472);
    float _2484 = _2468 * (-2.0);
    int _2486 = abs(_2398);
    float _2488 = fma(_2480, _2478, _2482);
    float _2490 = fma(_2484, _2348, _2348);
    float _2492 = fma(_1752, _2484, _1752);
    float _2494 = _2488 * 0.15915493667125701904296875;
    float _2496 = fma(_2442, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2490);
    float _2498 = _2484;
    if (_2474)
    {
        _2498 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2500 = _2498;
    int _2502 = as_type<int>(_2500);
    if (_2474)
    {
        out.m_47.x = 0.0;
    }
    float _2504 = _2494 * 6.283185482025146484375;
    float _2506 = sin(_2504);
    float _2508 = fma(_2492, _2478, _2496);
    float _2510 = float(_2460);
    if (_2474)
    {
        float _2512 = _2500 * 5.0;
        _2502 = as_type<int>(_2512);
    }
    int _2514 = _2502;
    float _2516 = float(_2486);
    float _2518 = _2494 * 6.283185482025146484375;
    float _2520 = cos(_2518);
    if (_2474)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7295 = as_type<float>(_2514);
        out.gl_Position.z = _7295;
    }
    float _2522 = _2516 * _2510;
    if (_2474)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2524 = -_1690;
    float _2526 = _2524 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2528 = _510 + _506;
    float _2530 = _2508 * 0.15915493667125701904296875;
    float _2532 = -_1540;
    float _2534 = _2532 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2536 = _2526 * _2526;
    float _2538 = _2528 + (-1.0);
    float _2540 = -_2038;
    float _2542 = _2540 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2544 = -_2400;
    float _2546 = fma(_2544, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2160);
    float _2548 = fma(_2534, _2534, _2536);
    float _2550 = fma(_2538, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2552 = _2522 * (-2.0);
    float _2554 = _510 + (-0.5);
    float _2556 = fma(_2542, _2542, _2548);
    float _2558 = in.m_68.x;
    float _2560 = in.m_68.y;
    float _2562 = fma(_2552, _2350, _2350);
    float _2564 = -_2404;
    float _2566 = fma(_2564, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2172);
    float _2568 = _2546 * _2546;
    float _2570 = fma(_2550, _2552, _2550);
    float _2572 = rsqrt(_2556);
    float _2574 = fma(_2554, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2562);
    float _2576 = fma(_2566, _2566, _2568);
    float _2578 = -_2410;
    float _2580 = fma(_2578, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2182);
    float _2582 = fma(_2570, _2478, _2574);
    bool _2584 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2586 = isnan(0.5);
    bool _2588 = _2584 || _2586;
    bool _2590 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2592 = _2588 || _2590;
    float _2594 = fma(_2580, _2580, _2576);
    float _2596 = _2530 * 6.283185482025146484375;
    float _2598 = sin(_2596);
    float _2600 = _2582 * 0.15915493667125701904296875;
    float _2602 = _2534 * _2572;
    float _2604 = sqrt(_2594);
    float _2606 = _2542 * _2572;
    float _2608 = _373 * _2560;
    float _2610 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2612 = _2602 * _2610;
    float _2614 = _2526 * _2572;
    float _2616 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2618 = _2606 * _2616;
    float _2620 = _371 * _2558;
    float _2622 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2624 = -_2612;
    float _2626 = fma(_2606, _2622, _2624);
    float _2628 = _2530 * 6.283185482025146484375;
    float _2630 = cos(_2628);
    float _2632 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2634 = _2614 * _2632;
    float _2636 = _2506 * _2598;
    float _2638 = _2620 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2640 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _179);
    float _2642 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2644 = -_2634;
    float _2646 = fma(_2602, _2642, _2644);
    float _2648 = _2608 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2650 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _175);
    float _2652 = _2600 * 6.283185482025146484375;
    float _2654 = sin(_2652);
    float _2656 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2658 = -_2618;
    float _2660 = fma(_2614, _2656, _2658);
    float _2662 = _2626 * _2626;
    float _2664 = _2344 * _2604;
    float _2666 = fma(_2660, _2660, _2662);
    float _2668 = _2664 * _2648;
    float _2670 = _2600 * 6.283185482025146484375;
    float _2672 = cos(_2670);
    float _2674 = _2520 * _2630;
    float _2676 = fma(_2646, _2646, _2666);
    float _2678 = _2520 * _2598;
    float _2680 = _2506 * _2630;
    float _2682 = _2640 * _2668;
    float _2684 = rsqrt(_2676);
    float _2686 = fma(_2654, _2674, _2636);
    float _2688 = fma(_2654, _2636, _2674);
    float _2690 = _2520 * _2672;
    float _2692 = _2630 * _2672;
    float _2694 = _2506 * _2672;
    float _2696 = _2598 * _2672;
    float _2698 = _2664 * _2638;
    float _2700 = _2690 * _2682;
    float _2702 = -_2678;
    float _2704 = fma(_2654, _2680, _2702);
    float _2706 = -_2680;
    float _2708 = fma(_2654, _2678, _2706);
    float _2710 = _2650 * _2698;
    float _2712 = _2660 * _2684;
    float _2714 = _2646 * _2684;
    float _2716 = -_2682;
    float _2718 = _2654 * _2716;
    float _2720 = fma(_2686, _2710, _2700);
    float _2722 = _2626 * _2684;
    float _2724 = _2664 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2726 = _2724 * 0.5;
    float _2728 = _2614 * _2712;
    float _2730 = _2694 * _2682;
    float _2732 = fma(_2692, _2710, _2718);
    float _2734 = fma(_2708, _2726, _2720);
    float _2736 = _2606 * _2722;
    float _2738 = -_2728;
    float _2740 = fma(_2602, _2722, _2738);
    float _2742 = fma(_2704, _2710, _2730);
    float _2744 = fma(_2696, _2726, _2732);
    float _2746 = -_2736;
    float _2748 = fma(_2614, _2714, _2746);
    float _2750 = _2740 * _2734;
    float _2752 = fma(_2688, _2726, _2742);
    float _2754 = _2602 * _2714;
    float _2756 = _2748 * _2734;
    float _2758 = fma(_2714, _2744, _2750);
    float _2760 = -_2754;
    float _2762 = fma(_2606, _2712, _2760);
    float _2764 = fma(_2712, _2744, _2756);
    float _2766 = fma(_2606, _2752, _2758);
    float _2768 = _2762 * _2734;
    float _2770 = fma(_2602, _2752, _2764);
    float _2772 = _2038 + _2766;
    float _2774 = _1540 + _2770;
    float _2776 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2778 = _2772 + _2776;
    float _2780 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2782 = _2774 + _2780;
    float _2784 = _2778 * _2778;
    float _2786 = fma(_2782, _2782, _2784);
    float _2788 = fma(_2722, _2744, _2768);
    float _2790 = sqrt(_2786);
    float _2792 = fma(_2614, _2752, _2788);
    float _2794 = _1690 + _2792;
    bool _2796 = _2790 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2798 = _2788;
    float _2800 = _2752;
    float _2802 = _2768;
    if (!_2796)
    {
        _2798 = _2774;
    }
    float _2804 = _2798;
    float _2806 = _2804;
    if (!_2796)
    {
        _2800 = _2772;
    }
    float _2808 = _2800;
    float _2810 = _2808;
    if (!_2796)
    {
        _2802 = _2794;
    }
    float _2812 = _2802;
    bool _2814 = !_2796;
    float _2816 = _2812;
    if (!_2814)
    {
        float _2818 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2820 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2822 = _2790 + _2820;
        float _2824 = rsqrt(_2786);
        float _2826 = _2822 * _2818;
        float _2828 = _2794 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2830 = _2826 * 0.15915493667125701904296875;
        float _2832 = _2830 * 6.283185482025146484375;
        float _2834 = cos(_2832);
        float _2836 = _2830 * 6.283185482025146484375;
        float _2838 = sin(_2836);
        float _2840 = _2834 + (-1.0);
        float _2842 = _2840 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2844 = fma(_2838, _2828, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2846 = fma(_2794, _2834, _2842);
        float _2848 = _2824 * _2844;
        float _2850 = fma(_2782, _2848, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2852 = fma(_2778, _2848, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2806 = _2850;
        _2816 = _2846;
        _2810 = _2852;
    }
    float _2854 = _2806;
    float _2856 = _2816;
    float _2858 = _2810;
    float _2860 = -_2404;
    float _2862 = fma(_2860, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2854);
    float _2864 = -_2400;
    float _2866 = fma(_2864, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2856);
    float _2868 = -_2410;
    float _2870 = fma(_2868, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2858);
    float _2872 = _2866;
    float _2874 = _2862;
    float _2876 = _2870;
    float _2878 = _2856;
    if (!_2592)
    {
        float _2880 = _2418 * _2418;
        float _2882 = 1.0 / _2664;
        float _2884 = -_1540;
        float _2886 = _2884 + _2854;
        float _2888 = -_1690;
        float _2890 = _2888 + _2856;
        float _2892 = fma(_2426, _2426, _2880);
        float _2894 = -_2038;
        float _2896 = _2894 + _2858;
        float _2898 = fma(_2438, _2438, _2892);
        float _2900 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2902 = sqrt(_2898);
        float _2904 = precise::min(_2902, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2906 = _2904 * _2900;
        float _2908 = _2906 * _2882;
        float _2910 = fma(_2886, _2908, _2414);
        float _2912 = fma(_2890, _2908, _2408);
        float _2914 = fma(_2896, _2908, _2422);
        _2872 = _2912;
        _2874 = _2910;
        _2876 = _2914;
        _2450 = _2902;
        _2452 = _2900;
        _2878 = _2890;
    }
    float _2916 = _2872;
    float _2918 = _2874;
    float _2920 = _2876;
    float _2922 = _2450;
    float _2924 = _2452;
    float _2926 = _2878;
    float _2928 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2930 = _2916 + _2928;
    float _2932 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2934 = _2918 + _2932;
    float _2936 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2938 = _2920 + _2936;
    float _2940 = _2930 * _2930;
    float _2942 = fma(_2934, _2934, _2940);
    float _2944 = fma(_2938, _2938, _2942);
    float _2946 = rsqrt(_2944);
    float _2948 = _2946 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2950 = _2934 * _2948;
    float _2952 = _2938 * _2948;
    float _2954 = _2950 * _2950;
    float _2956 = _2952 * _2952;
    float _2958 = _2954 + _2956;
    float _2960 = sqrt(_2958);
    bool _2962 = _2960 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2964 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2966 = _2960 + _2964;
    float _2968 = _2946;
    float _2970 = _2924;
    float _2972 = _2966;
    float _2974 = _2922;
    float _2976 = _2930;
    float _2978 = _2926;
    if (_2962)
    {
        float _2980 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2968 = _2980;
    }
    float _2982 = _2968;
    if (_2962)
    {
        float _2984 = rsqrt(_2958);
        _2970 = _2984;
    }
    float _2986 = _2970;
    float _2988 = _2986;
    if (_2962)
    {
        float _2990 = _2966 * _2982;
        _2972 = _2990;
    }
    float _2992 = _2972;
    if (_2962)
    {
        float _2994 = _2992 * 0.15915493667125701904296875;
        _2974 = _2994;
    }
    float _2996 = _2974;
    float _2998 = _2938;
    if (_2962)
    {
        float _3000 = _2996 * 6.283185482025146484375;
        float _3002 = sin(_3000);
        _2998 = _3002;
    }
    float _3004 = _2998;
    float _3006 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3008 = precise::max(0.0, _3006);
    float _3010 = _2422;
    float _3012 = _3008;
    if (_2962)
    {
        float _3014 = _2996 * 6.283185482025146484375;
        float _3016 = cos(_3014);
        _3010 = _3016;
    }
    float _3018 = _3010;
    float _3020 = -_2948;
    float _3022 = -_3008;
    float _3024 = fma(_2930, _3020, _3022);
    if (_2962)
    {
        float _3026 = _3024 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3012 = _3026;
    }
    float _3028 = _3012;
    float _3030 = sqrt(_2944);
    float _3032 = _3028;
    float _3034 = _3004;
    if (_2962)
    {
        float _3036 = fma(_3004, _3028, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3032 = _3036;
    }
    float _3038 = _3032;
    float _3040 = _3038;
    if (!_2962)
    {
        _3034 = _3024;
    }
    float _3042 = _3034;
    float _3044 = _3042;
    float _3046 = _3018;
    if (_2962)
    {
        float _3048 = _3018 + (-1.0);
        _2976 = _3048;
    }
    float _3050 = _2976;
    float _3052 = _3050;
    if (_2962)
    {
        float _3054 = _2986 * _3038;
        _2978 = _3054;
    }
    float _3056 = _2978;
    if (!_2962)
    {
        _2988 = _2950;
    }
    float _3058 = _2988;
    float _3060 = _2916 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3062 = _3058;
    if (_2962)
    {
        float _3064 = _3050 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2454 = _3064;
    }
    float _3066 = _2454;
    if (_2962)
    {
        float _3068 = _2950 * _3056;
        _3062 = _3068;
    }
    float _3070 = _3062;
    if (!_2962)
    {
        _3052 = _2952;
    }
    float _3072 = _3052;
    float _3074 = _3072;
    if (_2962)
    {
        float _3076 = _2952 * _3056;
        _3074 = _3076;
    }
    float _3078 = _3074;
    if (!_2962)
    {
        _3040 = _2954;
    }
    float _3080 = _3040;
    float _3082 = _3080;
    if (_2962)
    {
        float _3084 = fma(_3024, _3018, _3066);
        _3044 = _3084;
    }
    float _3086 = _3044;
    if (_2962)
    {
        float _3088 = _3070 * _3070;
        _3082 = _3088;
    }
    float _3090 = _3082;
    if (!_2962)
    {
        _3046 = _2956;
    }
    float _3092 = _3046;
    float _3094 = _3092;
    if (_2962)
    {
        float _3096 = _3078 * _3078;
        _3094 = _3096;
    }
    float _3098 = _3094;
    float _3100 = fma(_2918, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3060);
    float _3102 = fma(_3086, _3086, _3090);
    float _3104 = _2916 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3106 = fma(_2920, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3100);
    float _3108 = _3102 + _3098;
    float _3110 = _2916 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3112 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3114 = fma(_3030, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3112);
    float _3116 = precise::clamp(_3114, 0.0, 1.0);
    float _3118 = _2916 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3120 = fma(_2918, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3104);
    float _3122 = fma(_2918, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3110);
    float _3124 = rsqrt(_3108);
    float _3126 = -_3116;
    float _3128 = _3126 + 1.0;
    float _3130 = fma(_2918, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3118);
    float _3132 = fma(_2920, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3122);
    float _3134 = _3106 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3136 = fma(_2920, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3120);
    float _3138 = fma(_2920, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3130);
    float _3140 = _3132 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3142 = abs(_3128);
    float _3144 = log2(_3142);
    float _3146 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3148 = _3138 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3150 = _3140 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3152 = _3134 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3154 = _3136 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3156 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3150);
    float _3158 = _3124 * _3070;
    float _3160 = _3124 * _3086;
    float _3162 = _3124 * _3078;
    float _3164 = fma(_3134, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3156);
    float _3166 = _3158 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3168 = -_3152;
    float _3170 = fma(_3168, _3146, 1.0);
    float _3172 = fma(_3154, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3164);
    float _3174 = -_3166;
    float _3176 = fma(_3160, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3174);
    float _3178 = _3144 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3180 = _3140 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3182 = log2(_3170);
    float _3184 = -_3162;
    float _3186 = fma(_3184, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3176);
    float _3188 = _3140 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3190 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3180);
    float _3192 = _3160 + 1.0;
    float _3194 = fma(_3186, -0.5, 0.5);
    float _3196 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3188);
    float _3198 = fma(_3186, 0.5, 0.5);
    float _3200 = 1.0 / _3172;
    float _3202 = fma(_3134, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3190);
    float _3204 = fma(_3134, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3196);
    float _3206 = fma(_3198, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3208 = fma(_3154, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3204);
    float _3210 = fma(_3154, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3202);
    float _3212 = exp2(_3178);
    float _3214 = fma(_3198, _3206, -0.212114393711090087890625);
    float _3216 = _3182 * 0.693147182464599609375;
    float _3218 = _3216 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3220 = sqrt(_3194);
    float _3222 = _3208 * _3200;
    float _3224 = _3210 * _3200;
    float _3226 = fma(_3224, -0.5, 0.5);
    float _3228 = -_3160;
    float _3230 = fma(_3212, _3192, _3228);
    float _3232 = fma(_3198, _3214, 1.570728778839111328125);
    float _3234 = fma(_3222, 0.5, 0.5);
    float _3236 = fma(_3230, 0.5, 0.5);
    float _3238 = _3220 * 0.636619746685028076171875;
    float _3240 = -_3232;
    float _3242 = fma(_3238, _3240, 1.0);
    float3 _8447 = float3(_3234, _3226, _3218);
    float _3244 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8447, float3(0.0), isnan(_8447)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8447, float3(0.0), isnan(_8447)), level(0.0)).x;
    float3 _8458 = float3(_3234, _3226, _3218);
    float4 _3247 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8458, float3(0.0), isnan(_8458)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8458, float3(0.0), isnan(_8458)), level(0.0)).xyzw;
    float _3249 = _3247.x;
    float _3251 = _3247.y;
    float _3253 = _3247.z;
    float _3255 = _3247.w;
    float2 _8475 = float2(_3242, _3236);
    float3 _3259 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8475, float2(0.0), isnan(_8475)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8475, float2(0.0), isnan(_8475)), level(0.0)).xyz;
    float _3261 = _3259.x;
    float _3263 = _3259.y;
    float _3265 = _3259.z;
    float _3267 = _2686 * _2748;
    float _3269 = _2686 * _2762;
    float _3271 = _2686 * _2740;
    float _3273 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3275 = _2690 * _2748;
    float _3277 = _2690 * _2762;
    float _3279 = _2708 * _2748;
    float _3281 = _2708 * _2762;
    float _3283 = _2690 * _2740;
    float _3285 = _2708 * _2740;
    float _3287 = fma(_2692, _2712, _3267);
    float _3289 = fma(_2692, _2722, _3269);
    float _3291 = fma(_2692, _2714, _3271);
    float _3293 = fma(_3273, _3273, 1.0);
    float _3295 = _3144 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3297 = -_2654;
    float _3299 = fma(_3297, _2712, _3275);
    float _3301 = -_2654;
    float _3303 = fma(_3301, _2722, _3277);
    float _3305 = -_2654;
    float _3307 = fma(_3305, _2714, _3283);
    float _3309 = fma(_2696, _2712, _3279);
    float _3311 = rsqrt(_3293);
    float _3313 = fma(_2696, _2722, _3281);
    float _3315 = fma(_2696, _2714, _3285);
    float _3317 = fma(_2694, _2602, _3299);
    float _3319 = fma(_2688, _2602, _3309);
    float _3321 = fma(_2694, _2614, _3303);
    float _3323 = fma(_2694, _2606, _3307);
    float _3325 = fma(_2704, _2602, _3287);
    float _3327 = exp2(_3295);
    float _3329 = fma(_2704, _2614, _3289);
    float _3331 = fma(_2704, _2606, _3291);
    float _3333 = fma(_2688, _2614, _3313);
    float _3335 = fma(_2688, _2606, _3315);
    float _3337 = _3140 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3339 = _175 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3341 = _3273 * _3317;
    float _3343 = _3273 * _3311;
    float _3345 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3337);
    out.m_70.x = _3325;
    out.m_70.y = _3329;
    out.m_70.z = _3331;
    float _3347 = fma(_3339, _3325, _3341);
    float _3349 = -_3319;
    float _3351 = _3343 * _3349;
    float _3353 = _3273 * _3321;
    float _3355 = fma(_3134, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3345);
    out.m_72.x = _2918;
    out.m_72.y = _2916;
    out.m_72.z = _2920;
    float _3357 = -_3327;
    float _3359 = _3357 + 1.0;
    float _3361 = fma(_3311, _3317, _3351);
    float _3363 = fma(_3339, _3329, _3353);
    float _3365 = fma(_3154, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3355);
    float _3367 = _3359 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3369 = -_3333;
    float _3371 = _3343 * _3369;
    float _3373 = -_3335;
    float _3375 = _3343 * _3373;
    bool _3377 = _3030 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3379 = isnan(_3030);
    bool _3381 = _3377 || _3379;
    bool _3383 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3385 = _3381 || _3383;
    float _3387 = fma(_3311, _3321, _3371);
    float _3389 = _3273 * _3323;
    float _3391 = _3365 + _3172;
    float _3393 = fma(_3311, _3323, _3375);
    float _3395 = _3333 + _3363;
    float _3397 = fma(_3339, _3331, _3389);
    float _3399 = _3319 + _3347;
    float _3401 = _3391 * 0.5;
    out.m_74.x = _3361;
    out.m_74.y = _3387;
    out.m_74.z = _3393;
    float _3403 = _3335 + _3397;
    out.m_76.z = _3401;
    out.m_76.w = _3172;
    out.m_78.x = _3399;
    out.m_78.y = _3395;
    out.m_78.z = _3403;
    out.gl_Position.x = _3208;
    out.gl_Position.y = _3210;
    out.gl_Position.z = _3365;
    out.gl_Position.w = _3172;
    float _3405 = _3172;
    float _3407 = _3365;
    float _3409 = _3210;
    float _3411 = _3208;
    if (!_3385)
    {
        _3405 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3413 = _3405;
    float _3415 = _3413;
    float _3417 = _3413;
    if (!_3385)
    {
        _3407 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3419 = _3407;
    float _3421 = _3419;
    float _3423 = _3419;
    if (!_3385)
    {
        _3409 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3425 = _3409;
    float _3427 = _3425;
    float _3429 = _3425;
    if (!_3385)
    {
        _3411 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3431 = _3411;
    float _3433 = _3367 * _3244;
    float _3435 = -_3367;
    float _3437 = _3435 + 1.0;
    float _3439 = _3255 * _3433;
    float _3441 = _3265 * _3433;
    float _3443 = _3255 * _3437;
    float _3445 = fma(_3261, _3439, _3249);
    float _3447 = fma(_3263, _3439, _3251);
    float _3449 = fma(_3255, _3441, _3253);
    float _3451 = _3251;
    float _3453 = _3249;
    float _3455 = _3431;
    float _3457 = _3431;
    if (!_3385)
    {
        _3451 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3459 = _3451;
    float _3461 = _3459;
    float _3463 = _3459;
    if (!_3385)
    {
        _3453 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3465 = _3453;
    out.m_80.x = _3445;
    out.m_80.y = _3447;
    out.m_80.z = _3449;
    out.m_80.w = _3443;
    bool _3467 = !_3385;
    float _3469 = _3465;
    float _3471 = _3465;
    if (!_3467)
    {
        bool _3473 = _3030 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3475 = isnan(_3030);
        bool _3477 = _3473 || _3475;
        bool _3479 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3481 = _3477 || _3479;
        if (!_3481)
        {
            float _3483 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3485 = _3030 + _3483;
            float _3487 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3489 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3487;
            float _3491 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3493 = _3491 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3495 = 1.0 / _3489;
            float _3497 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3499 = _3497 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3501 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3503 = _3501 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3505 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3507 = _3505 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3509 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3511 = _3509 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3513 = _3485 * _3495;
            float _3515 = precise::clamp(_3513, 0.0, 1.0);
            float _3517 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3519 = _3517 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3521 = fma(_3515, _3493, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3523 = fma(_3515, _3519, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3525 = fma(_3515, _3499, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3527 = fma(_3515, _3503, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3529 = fma(_3515, _3507, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3531 = fma(_3515, _3511, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3471 = _3525;
            _3429 = _3529;
            _3463 = _3521;
            _3423 = _3527;
            _3417 = _3523;
            _3457 = _3531;
            _3533 = true;
        }
        else
        {
            bool _3535 = _3030 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3537 = isnan(_3030);
            bool _3539 = _3535 || _3537;
            bool _3541 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3543 = _3539 || _3541;
            if (!_3543)
            {
                _3461 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3545 = _3461;
            _3463 = _3545;
            if (!_3543)
            {
                _3469 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3547 = _3469;
            _3471 = _3547;
            if (!_3543)
            {
                _3415 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3549 = _3415;
            _3417 = _3549;
            if (!_3543)
            {
                _3421 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3551 = _3421;
            _3423 = _3551;
            if (!_3543)
            {
                _3427 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3553 = _3427;
            _3429 = _3553;
            if (!_3543)
            {
                _3455 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3555 = _3455;
            bool _3557 = !_3543;
            _3457 = _3555;
            if (!_3557)
            {
                bool _3559 = _3030 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3561 = isnan(_3030);
                bool _3563 = _3559 || _3561;
                bool _3565 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3567 = _3563 || _3565;
                if (!_3567)
                {
                    float _3569 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3571 = _3030 + _3569;
                    float _3573 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3575 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3573;
                    float _3577 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3579 = _3577 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3581 = 1.0 / _3575;
                    float _3583 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3585 = _3583 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3587 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3589 = _3587 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3591 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3593 = _3591 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3595 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3597 = _3595 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3599 = _3571 * _3581;
                    float _3601 = precise::clamp(_3599, 0.0, 1.0);
                    float _3603 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3605 = _3603 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3607 = fma(_3601, _3579, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3609 = fma(_3601, _3605, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3611 = fma(_3601, _3585, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3613 = fma(_3601, _3589, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3615 = fma(_3601, _3593, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3617 = fma(_3601, _3597, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3471 = _3611;
                    _3429 = _3615;
                    _3463 = _3607;
                    _3423 = _3613;
                    _3417 = _3609;
                    _3457 = _3617;
                    _3533 = true;
                }
                else
                {
                    _3471 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3429 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3463 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3423 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3417 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3457 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3533 = false;
    float _3619 = _3471;
    float _3621 = _3429;
    float _3623 = _3463;
    float _3625 = _3423;
    float _3627 = _3417;
    float _3629 = _3457;
    float _3631 = fma(_3395, -0.5, 0.5);
    float _3633 = precise::clamp(_3631, 0.0, 1.0);
    float _3635 = -_3619;
    float _3637 = _3635 + _3621;
    float _3639 = -_3623;
    float _3641 = _3639 + _3625;
    float _3643 = -_3627;
    float _3645 = _3643 + _3629;
    bool _3647 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3649 = fma(_3633, _3637, _3619);
    float _3651 = fma(_3633, _3641, _3623);
    float _3653 = fma(_3633, _3645, _3627);
    float _3655 = _3649 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3657 = fma(_3651, 0.298911988735198974609375, _3655);
    float _3659 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3661 = fma(_3653, 0.114477999508380889892578125, _3657);
    out.m_82.w = _3659;
    float _3663 = -_3661;
    float _3665 = _3651 + _3663;
    float _3667 = -_3661;
    float _3669 = _3649 + _3667;
    float _3671 = -_3661;
    float _3673 = _3653 + _3671;
    out.m_84.x = 0.0;
    float _3675 = fma(_3665, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3661);
    float _3677 = fma(_3669, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3661);
    float _3679 = fma(_3673, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3661);
    out.m_86.x = _3675;
    out.m_86.y = _3677;
    out.m_86.z = _3679;
    if (!_3647)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3681 = -_2916;
    float _3683 = _3681 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3685 = -_2918;
    float _3687 = _3685 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3689 = -_2920;
    float _3691 = _3689 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3693 = _3683 * _3683;
    float _3695 = fma(_3687, _3687, _3693);
    float _3697 = fma(_3691, _3691, _3695);
    float _3699 = sqrt(_3697);
    float _3701 = rsqrt(_3697);
    float _3703 = -_3699;
    float _3705 = _3703 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3707 = _3705 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3709 = precise::clamp(_3707, 0.0, 1.0);
    float _3711 = _3687 * _3701;
    float _3713 = _3683 * _3701;
    float _3715 = abs(_3709);
    float _3717 = log2(_3715);
    float _3719 = _3691 * _3701;
    float _3721 = _3711 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3723 = _3395 * _3713;
    float _3725 = -_3713;
    float _3727 = -_3721;
    float _3729 = fma(_3725, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3727);
    float _3731 = fma(_3399, _3711, _3723);
    float _3733 = -_3719;
    float _3735 = fma(_3733, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3729);
    float _3737 = fma(_3403, _3719, _3731);
    float _3739 = precise::clamp(_3737, 0.0, 1.0);
    float _3741 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3743 = _3735 + _3741;
    float _3745 = _3717 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3747 = _3743 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3749 = precise::clamp(_3747, 0.0, 1.0);
    float _3751 = exp2(_3745);
    float _3753 = _3751 * _3749;
    float _3755 = _3739 * _3753;
    float _3757 = _3755 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3759 = _3755 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3761 = _3755 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_84.x = _3757;
    out.m_84.y = _3759;
    out.m_84.z = _3761;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3533 = false;
    bool _395 = false;
    bool _201 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_44.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_47.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3818 = as_type<float>(_121);
        out.gl_Position.z = _3818;
    }
    if (!_109)
    {
        return out;
    }
    float _125 = in.m_49.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = 0.0;
    float _143 = _139;
    if (_135)
    {
        float _145 = float(_105);
        _141 = _145;
    }
    float _147 = _141;
    bool _149 = _139 >= _147;
    bool _151 = !_135;
    bool _153 = _149 || _151;
    if (_153)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _115;
    if (_153)
    {
        out.m_47.x = 0.0;
    }
    if (_153)
    {
        float _157 = _155 * 5.0;
        _123 = as_type<int>(_157);
    }
    int _159 = _123;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3887 = as_type<float>(_159);
        out.gl_Position.z = _3887;
    }
    if (_153)
    {
        return out;
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    bool _163 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _165 = as_type<int>(_161) & 1;
    bool _167 = _165 != 0;
    int _169 = as_type<int>(_161) & 2;
    bool _171 = _169 != 0;
    bool _173 = !_167;
    float _175 = _173 ? (-0.5) : 0.5;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_163;
    float _199;
    if (!_181)
    {
        float _183 = in.m_54.x;
        float _185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _187 = _183 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _189 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _191 = _189 * _185;
        float _193 = floor(_191);
        float _195 = -_193;
        float _197 = _191 + _195;
        _199 = _197;
        _201 = true;
    }
    else
    {
        float _203 = float(_105);
        float _205 = 1.0 / _203;
        float _207 = _139 * _205;
        _199 = _207;
    }
    _201 = false;
    float _209 = _199;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = _209 + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _217 = _209 + _215;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _221 = _209 + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _225 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _223;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _229 = _227 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _231;
    bool _235 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _237 = isnan(_209);
    bool _239 = _235 || _237;
    bool _241 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _243 = _239 || _241;
    float _245 = float(_243);
    float _247 = 1.0 / _229;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _251 = 1.0 / _225;
    float _253 = 1.0 / _233;
    float _255 = _221 * _247;
    bool _257 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _259 = isnan(_209);
    bool _261 = _257 || _259;
    bool _263 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _265 = _261 || _263;
    float _267 = float(_265);
    float _269 = _213 * _251;
    bool _271 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _273 = isnan(_209);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = -_245;
    float _285 = _283 + 1.0;
    float _287 = _281 * _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _293 = _217 * _253;
    bool _295 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _297 = isnan(_209);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = -_281;
    float _309 = _307 + 1.0;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _323 = _305 * _309;
    float _325 = -_305;
    float _327 = _325 + 1.0;
    float _329 = fma(_313, _269, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _331 = fma(_317, _269, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _333 = _267 * _327;
    float _335 = -_267;
    float _337 = _335 + 1.0;
    float _339 = fma(_291, _255, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _341 = _329 * _333;
    float _343 = _331 * _333;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _345;
    float _349 = fma(_321, _255, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _351 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[143].x, _341);
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _353;
    float _357 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[143].y, _343);
    float _359 = fma(_347, _293, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _361 = fma(_339, _323, _351);
    float _363 = fma(_355, _293, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _365 = fma(_349, _323, _357);
    float _367 = fma(_359, _287, _361);
    float _369 = fma(_363, _287, _365);
    float _371 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[146].x, _367);
    float _373 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[146].y, _369);
    bool _375 = !_249;
    float _393;
    if (!_375)
    {
        float _377 = in.m_54.x;
        float _379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _381 = _377 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _383 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[11].x, _139);
        float _385 = _383 * _379;
        float _387 = floor(_385);
        float _389 = -_387;
        float _391 = _385 + _389;
        _393 = _391;
        _395 = true;
    }
    else
    {
        float _397 = float(_105);
        float _399 = 1.0 / _397;
        float _401 = _139 * _399;
        _393 = _401;
    }
    _395 = false;
    float _403 = _393;
    float _405 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _407 = int(_405);
    int _409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _411 = _409 != 0;
    float _413 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _415 = int(_413);
    float _417 = float(_407);
    float _419 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _421 = int(_419);
    float _423 = float(_415);
    float _425 = 1.0 / _417;
    float _427 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _429 = int(_427);
    float _431 = float(uint(_421));
    float _433 = 1.0 / _423;
    float _435 = _425 * _139;
    float _437 = 1.0 / _431;
    float _439 = float(uint(_429));
    int _441 = ~_429;
    int _443 = _441 + 1;
    float _445 = float(_429);
    float _447 = trunc(_435);
    int _449 = int(_447);
    float _451 = _433 * _139;
    float _453 = 1.0 / _439;
    int _455 = as_type<int>(_437) + (-2);
    float _457 = trunc(_451);
    int _459 = int(_457);
    float _461 = float(uint(_449));
    float _463 = as_type<float>(_455) * _461;
    int _465 = as_type<int>(_453) + (-2);
    float _467 = trunc(_463);
    float _469 = precise::max(_467, 0.0);
    uint _472 = uint(_469);
    float _474 = _453;
    if (_411)
    {
        float _476 = in.m_54.x;
        _474 = _476;
    }
    float _478 = _474;
    float _480 = _478;
    if (!_411)
    {
        float _482 = in.m_54.y;
        _480 = _482;
    }
    float _484 = _480;
    float _486 = float(uint(_459));
    float _488 = as_type<float>(_465) * _486;
    int _490 = ~_421;
    int _492 = _490 + 1;
    float _494 = trunc(_488);
    float _496 = precise::max(_494, 0.0);
    uint _498 = uint(_496);
    int _500 = _492 * int(_472);
    int _502 = _500 + _449;
    float _504 = float(uint(_502));
    float _506 = in.m_54.x;
    float _508 = in.m_54.y;
    float _510 = in.m_54.z;
    float _512 = in.m_54.w;
    float _514 = as_type<float>(_455) * _504;
    float _516 = _504;
    if (_411)
    {
        _516 = 1.0;
    }
    float _518 = _516;
    float _520 = _518;
    if (!_411)
    {
        _520 = 7.345489978790283203125;
    }
    float _522 = _520;
    int _524 = _443 * int(_498);
    int _526 = _524 + _459;
    float _528 = trunc(_514);
    float _530 = precise::max(_528, 0.0);
    uint _532 = uint(_530);
    float _534 = float(uint(_526));
    float _536 = float(_105);
    float _538 = float(_421);
    float _540 = as_type<float>(_465) * _534;
    float _542 = 1.0 / _536;
    float _544 = _522 * _506;
    int _546 = int(_472) + int(_532);
    float _548 = as_type<float>(_532);
    if (_411)
    {
        _548 = 1.0;
    }
    float _550 = _548;
    float _552 = trunc(_540);
    float _554 = precise::max(_552, 0.0);
    uint _556 = uint(_554);
    float _558 = float(_449);
    float _560 = _550;
    if (!_411)
    {
        _560 = 1.2345600128173828125;
    }
    float _562 = _560;
    float _564 = floor(_544);
    int _566 = ~_421;
    int _568 = _566 + 1;
    float _570 = _562 * _484;
    int _572 = _568 * _546;
    int _574 = _572 + _449;
    int _576 = int(_498) + int(_556);
    float _578 = floor(_570);
    int _580 = ~_429;
    int _582 = _580 + 1;
    bool _584 = _558 >= _538;
    bool _586 = isnan(_558);
    bool _588 = _584 || _586;
    bool _590 = isnan(_538);
    bool _592 = _588 || _590;
    float _594 = float(_592);
    bool _596 = uint(_574) >= uint(_421);
    int _598 = _582 * _576;
    int _600 = _598 + _459;
    float _602 = -_564;
    float _604 = _544 + _602;
    float _606 = float(_459);
    float _608 = trunc(_594);
    int _610 = int(_608);
    bool _612 = !_596;
    int _614 = _612 ? 0 : (-1);
    float _616 = _604 * _538;
    bool _618 = uint(_600) >= uint(_429);
    int _620 = ~_546;
    int _622 = _620 + _614;
    int _624 = _622 + 1;
    float _626 = trunc(_616);
    int _628 = int(_626);
    int _630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _632 = _630 != 0;
    int _634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _636 = _634 != 0;
    int _638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _640 = _638 != 0;
    float _642 = -_578;
    float _644 = _570 + _642;
    bool _646 = _606 >= _445;
    bool _648 = isnan(_606);
    bool _650 = _646 || _648;
    bool _652 = isnan(_445);
    bool _654 = _650 || _652;
    float _656 = float(_654);
    int _658 = _421 * _624;
    int _660 = _658 + _449;
    int _662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _664 = _662 != 0;
    bool _666 = !_618;
    int _668 = _666 ? 0 : (-1);
    bool _670 = !_636;
    int _672 = _670 ? 0 : 1;
    float _674 = trunc(_656);
    int _676 = int(_674);
    bool _678 = !_664;
    int _680 = _678 ? 0 : 1;
    bool _682 = _421 == 0;
    int _684 = ~_576;
    int _686 = _684 + _668;
    int _688 = _686 + 1;
    int _690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _692 = _690 != 0;
    int _694 = ~_610;
    int _696 = _694 + 1;
    int _698 = _696 + 1;
    bool _700 = !_682;
    int _702 = _700 ? _660 : (-1);
    int _704 = abs(_680);
    int _706 = _429 * _688;
    int _708 = _706 + _459;
    bool _710 = !_692;
    int _712 = _710 ? 0 : 1;
    float _714 = _542 * _139;
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _718 = _716 != 0;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _722 = _720 != 0;
    int _724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _726 = _724 != 0;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _730 = _728 != 0;
    int _732 = _702 * _698;
    int _734 = _421 + (-1);
    float _736 = _644 * _445;
    float _738 = _538 * _714;
    bool _740 = !_722;
    int _742 = _740 ? 0 : 1;
    float _744 = _445 * _714;
    int _746 = _610 * _734;
    int _748 = _746 + _732;
    bool _750 = _429 == 0;
    float _752 = trunc(_738);
    int _754 = int(_752);
    int _756 = ~_676;
    int _758 = _756 + 1;
    int _760 = _758 + 1;
    int _762 = _628 * _704;
    int _764 = _762 + _449;
    bool _766 = !_750;
    int _768 = _766 ? _708 : (-1);
    int _770 = abs(_672);
    int _772 = abs(_712);
    float _774 = trunc(_736);
    int _776 = int(_774);
    int _778 = _429 + (-1);
    int _780 = _768 * _760;
    int _782 = abs(_742);
    bool _784 = !_632;
    int _786 = _784 ? 0 : 1;
    int _788 = _676 * _778;
    int _790 = _788 + _780;
    float _792 = trunc(_744);
    int _794 = int(_792);
    int _796 = abs(_786);
    int _798 = _748 * _770;
    bool _800 = !_640;
    int _802 = _800 ? 0 : 1;
    int _804 = _790 * _782;
    int _806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _808 = _806 != 0;
    int _810 = _754 * _796;
    int _812 = _810 + _798;
    int _814 = abs(_802);
    int _816 = _776 * _772;
    int _818 = _816 + _459;
    bool _820 = !_718;
    int _822 = _820 ? 0 : 1;
    bool _824 = !_808;
    int _826 = _824 ? 0 : 1;
    bool _828 = !_726;
    int _830 = _828 ? 0 : 1;
    int _832 = abs(_822);
    int _834 = abs(_826);
    int _836 = _764 * _814;
    int _838 = _836 + _812;
    bool _840 = !_730;
    int _842 = _840 ? 0 : 1;
    int _844 = abs(_830);
    int _846 = abs(_842);
    int _848 = _794 * _832;
    int _850 = _848 + _804;
    int _852 = _628 * _834;
    int _854 = _852 + _838;
    float _856 = float(uint(_764));
    int _858 = _818 * _844;
    int _860 = _858 + _850;
    float _862 = float(uint(_854));
    int _864 = ~_421;
    int _866 = _864 + 1;
    int _868 = _776 * _846;
    int _870 = _868 + _860;
    float _872 = as_type<float>(_455) * _856;
    float _874 = as_type<float>(_455) * _862;
    float _876 = float(uint(_818));
    float _878 = float(uint(_870));
    float _880 = trunc(_874);
    float _882 = precise::max(_880, 0.0);
    uint _884 = uint(_882);
    float _886 = as_type<float>(_465) * _876;
    float _888 = as_type<float>(_465) * _878;
    int _890 = ~_429;
    int _892 = _890 + 1;
    int _894 = ~_421;
    int _896 = _894 + 1;
    int _898 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _900 = _898 != 0;
    float _902 = trunc(_888);
    float _904 = precise::max(_902, 0.0);
    uint _906 = uint(_904);
    int _908 = _866 * int(_884);
    int _910 = _908 + _854;
    float _912 = trunc(_872);
    float _914 = precise::max(_912, 0.0);
    uint _916 = uint(_914);
    float _918 = float(uint(_910));
    int _920 = _892 * int(_906);
    int _922 = _920 + _870;
    float _924 = trunc(_886);
    float _926 = precise::max(_924, 0.0);
    uint _928 = uint(_926);
    float _930 = as_type<float>(_455) * _918;
    float _932 = float(uint(_922));
    int _934 = _896 * int(_916);
    int _936 = _934 + _764;
    float _938 = as_type<float>(_465) * _932;
    float _940 = trunc(_930);
    float _942 = precise::max(_940, 0.0);
    uint _944 = uint(_942);
    float _946 = float(uint(_936));
    int _948 = ~_429;
    int _950 = _948 + 1;
    float _952 = trunc(_938);
    float _954 = precise::max(_952, 0.0);
    uint _956 = uint(_954);
    float _958 = as_type<float>(_455) * _946;
    int _960 = ~_421;
    int _962 = _960 + 1;
    int _964 = _950 * int(_928);
    int _966 = _964 + _818;
    float _968 = trunc(_958);
    float _970 = precise::max(_968, 0.0);
    uint _972 = uint(_970);
    int _974 = int(_884) + int(_944);
    int _976 = ~_429;
    int _978 = _976 + 1;
    float _980 = float(uint(_966));
    int _982 = _962 * _974;
    int _984 = _982 + _854;
    int _986 = int(_906) + int(_956);
    float _988 = as_type<float>(_465) * _980;
    bool _990 = uint(_984) >= uint(_421);
    int _992 = _978 * _986;
    int _994 = _992 + _870;
    int _996 = ~_421;
    int _998 = _996 + 1;
    int _1000 = int(_916) + int(_972);
    float _1002 = trunc(_988);
    float _1004 = precise::max(_1002, 0.0);
    uint _1006 = uint(_1004);
    bool _1008 = uint(_994) >= uint(_429);
    bool _1010 = !_990;
    int _1012 = _1010 ? 0 : (-1);
    int _1014 = _998 * _1000;
    int _1016 = _1014 + _764;
    bool _1018 = !_1008;
    int _1020 = _1018 ? 0 : (-1);
    int _1022 = ~_974;
    int _1024 = _1022 + _1012;
    int _1026 = _1024 + 1;
    int _1028 = ~_986;
    int _1030 = _1028 + _1020;
    int _1032 = _1030 + 1;
    bool _1034 = uint(_1016) >= uint(_421);
    int _1036 = _421 * _1026;
    int _1038 = _1036 + _854;
    int _1040 = _429 * _1032;
    int _1042 = _1040 + _870;
    bool _1044 = !_1034;
    int _1046 = _1044 ? 0 : (-1);
    bool _1048 = !_682;
    int _1050 = _1048 ? _1038 : (-1);
    bool _1052 = !_750;
    int _1054 = _1052 ? _1042 : (-1);
    int _1056 = ~_1000;
    int _1058 = _1056 + _1046;
    int _1060 = _1058 + 1;
    int _1062 = _1050 >> 31;
    int _1064 = _1054 >> 31;
    int _1066 = _421 * _1060;
    int _1068 = _1066 + _764;
    int _1070 = _1050 & 3;
    bool _1072 = _1070 != 0;
    int _1074 = _1062 & 3;
    int _1076 = _1064 & 3;
    int _1078 = _1050 & 3;
    bool _1080 = _1078 != 0;
    bool _1082 = _1070 != 3;
    int _1084 = _1054 + _1076;
    int _1086 = _1080 ? 0 : 1;
    int _1088 = _1050 + _1074;
    bool _1090 = uint(_1070) >= 2u;
    int _1092 = _1084 >> 2;
    int _1094 = _1088 >> 2;
    int _1096 = _1090 ? 0 : 1;
    int _1098 = _1092 << 4;
    int _1100 = _1098 + 512;
    int _1102 = _1094 << 4;
    int _1104 = _1102 + 368;
    bool _1106 = uint(_1070) > 1u;
    int _1108 = ~_1096;
    int _1110 = _1108 + 1;
    int _1112 = _1110 + 1;
    uint _1114 = uint(int(uint(_1104) >> uint(2)));
    uint _1116 = uint(int(uint(int(_1114)) >> uint(2)));
    int _1118 = int(_1114) & 3;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[int(_1116)][_1118];
    int _1122 = int(_1114) + 1;
    uint _1124 = uint(int(uint(_1122) >> uint(2)));
    int _1126 = _1122 & 3;
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[int(_1124)][_1126];
    int _1130 = _1112;
    if (_1082)
    {
        int _1132 = ~_1096;
        int _1134 = _1132 + 1;
        _1130 = _1134;
    }
    int _1136 = _1130;
    int _1138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1140 = _1138 != 0;
    int _1142 = int(_928) + int(_1006);
    int _1144 = ~_429;
    int _1146 = _1144 + 1;
    uint _1148 = uint(int(uint(_1100) >> uint(2)));
    uint _1150 = uint(int(uint(int(_1148)) >> uint(2)));
    int _1152 = int(_1148) & 3;
    float _1154 = (*spvDescriptorSet0.vp_c9)._m0[int(_1150)][_1152];
    int _1156 = int(_1148) + 1;
    uint _1158 = uint(int(uint(_1156) >> uint(2)));
    int _1160 = _1156 & 3;
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[int(_1158)][_1160];
    bool _1164 = !_1140;
    int _1166 = _1164 ? 0 : 1;
    int _1168 = _1054 & 3;
    bool _1170 = _1168 != 0;
    int _1172 = _1146 * _1142;
    int _1174 = _1172 + _818;
    int _1176 = ~_1086;
    int _1178 = _1176 + 1;
    int _1180 = _1178 + 1;
    int _1182 = _1180;
    if (!_1106)
    {
        int _1184 = ~_1086;
        int _1186 = _1184 + 1;
        _1182 = _1186;
    }
    int _1188 = _1182;
    int _1190 = _1100 + 8;
    uint _1192 = uint(int(uint(_1190) >> uint(2)));
    uint _1194 = uint(int(uint(int(_1192)) >> uint(2)));
    int _1196 = int(_1192) & 3;
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[int(_1194)][_1196];
    int _1200 = int(_1192) + 1;
    uint _1202 = uint(int(uint(_1200) >> uint(2)));
    int _1204 = _1200 & 3;
    float _1206 = (*spvDescriptorSet0.vp_c9)._m0[int(_1202)][_1204];
    int _1208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1210 = _1208 != 0;
    bool _1212 = !_682;
    int _1214 = _1212 ? _1068 : (-1);
    bool _1216 = uint(_1168) >= 2u;
    bool _1218 = !_1210;
    int _1220 = _1218 ? 0 : 1;
    bool _1222 = uint(_1168) > 1u;
    int _1224 = _1216 ? 0 : 1;
    bool _1226 = uint(_1174) >= uint(_429);
    bool _1228 = !_1072;
    int _1230 = _1228 ? 0 : 1;
    int _1232 = _1104 + 8;
    uint _1234 = uint(int(uint(_1232) >> uint(2)));
    uint _1236 = uint(int(uint(int(_1234)) >> uint(2)));
    int _1238 = int(_1234) & 3;
    float _1240 = (*spvDescriptorSet0.vp_c9)._m0[int(_1236)][_1238];
    int _1242 = int(_1234) + 1;
    uint _1244 = uint(int(uint(_1242) >> uint(2)));
    int _1246 = _1242 & 3;
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[int(_1244)][_1246];
    bool _1250 = _1168 != 3;
    int _1252 = _1054 & 3;
    bool _1254 = _1252 != 0;
    bool _1256 = !_1170;
    int _1258 = _1256 ? 0 : 1;
    bool _1260 = _512 > 0.5;
    int _1262 = _1254 ? 0 : 1;
    bool _1264 = _1070 != 3;
    int _1266 = ~_1262;
    int _1268 = _1266 + 1;
    int _1270 = _1268 + 1;
    int _1272 = _1270;
    if (!_1222)
    {
        int _1274 = ~_1262;
        int _1276 = _1274 + 1;
        _1272 = _1276;
    }
    int _1278 = _1272;
    bool _1280 = _1168 != 3;
    int _1282 = ~_1224;
    int _1284 = _1282 + 1;
    int _1286 = _1284 + 1;
    int _1288 = _1286;
    if (_1250)
    {
        int _1290 = ~_1224;
        int _1292 = _1290 + 1;
        _1288 = _1292;
    }
    int _1294 = _1288;
    bool _1296 = !_1264;
    int _1298 = _1296 ? 0 : (-1);
    bool _1300 = !_1280;
    int _1302 = _1300 ? 0 : (-1);
    int _1304 = abs(_1278);
    int _1306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1308 = _1306 != 0;
    int _1310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1312 = _1310 != 0;
    int _1314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1316 = _1314 != 0;
    int _1318 = abs(_1188);
    bool _1320 = !_1226;
    int _1322 = _1320 ? 0 : (-1);
    int _1324 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1326 = _1324 != 0;
    int _1328 = abs(_1230);
    float _1330 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1332 = int(_1330);
    int _1334 = ~_1142;
    int _1336 = _1334 + _1322;
    int _1338 = _1336 + 1;
    int _1340 = ~_1304;
    int _1342 = _1340 + 1;
    int _1344 = _1342 + 1;
    int _1346 = ~_1318;
    int _1348 = _1346 + 1;
    int _1350 = _1348 + 1;
    int _1352 = _429 * _1338;
    int _1354 = _1352 + _818;
    int _1356 = abs(_1258);
    int _1358 = _1344 * as_type<int>(_1162);
    int _1360 = ~_1328;
    int _1362 = _1360 + 1;
    int _1364 = _1362 + 1;
    int _1366 = _1350 * as_type<int>(_1128);
    float _1368 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1370 = int(_1368);
    int _1372 = abs(_1166);
    int _1374 = _1364 * as_type<int>(_1120);
    int _1376 = _1374 + _1366;
    int _1378 = ~_1356;
    int _1380 = _1378 + 1;
    int _1382 = _1380 + 1;
    int _1384 = abs(_1136);
    int _1386 = abs(_1294);
    int _1388 = _1382 * as_type<int>(_1154);
    int _1390 = _1388 + _1358;
    int _1392 = abs(_1332);
    int _1394 = ~_1386;
    int _1396 = _1394 + 1;
    int _1398 = _1396 + 1;
    int _1400 = abs(_1298);
    int _1402 = ~_1384;
    int _1404 = _1402 + 1;
    int _1406 = _1404 + 1;
    int _1408 = _1398 * as_type<int>(_1198);
    int _1410 = _1408 + _1390;
    float _1412 = float(uint(_1332));
    float _1414 = in.m_44.x;
    float _1416 = in.m_44.y;
    float _1418 = in.m_44.z;
    int _1420 = _1406 * as_type<int>(_1240);
    int _1422 = _1420 + _1376;
    int _1424 = abs(_1302);
    float _1426 = in.m_56.x;
    float _1428 = in.m_56.y;
    float _1430 = in.m_56.z;
    float _1432 = in.m_56.w;
    int _1434 = ~_1400;
    int _1436 = _1434 + 1;
    int _1438 = _1436 + 1;
    float _1440 = 1.0 / _1412;
    float _1442 = float(uint(_1370));
    int _1444 = abs(_1220);
    int _1446 = _1438 * as_type<int>(_1248);
    int _1448 = _1446 + _1422;
    float _1450 = in.m_58.x;
    float _1452 = in.m_58.y;
    float _1454 = in.m_58.z;
    float _1456 = in.m_58.w;
    int _1458 = ~_1372;
    int _1460 = _1458 + 1;
    int _1462 = _1460 + 1;
    float _1464 = 1.0 / _1442;
    int _1466 = abs(_1370);
    float _1468 = in.m_60.x;
    float _1470 = in.m_60.y;
    float _1472 = in.m_60.z;
    float _1474 = in.m_60.w;
    int _1476 = ~_1424;
    int _1478 = _1476 + 1;
    int _1480 = _1478 + 1;
    int _1482 = _1448 * _1462;
    int _1484 = ~_1444;
    int _1486 = _1484 + 1;
    int _1488 = _1486 + 1;
    int _1490 = _1480 * as_type<int>(_1206);
    int _1492 = _1490 + _1410;
    bool _1494 = !_750;
    int _1496 = _1494 ? _1354 : (-1);
    int _1498 = _1214 * _1372;
    int _1500 = _1498 + _1482;
    float _1502 = float(uint(_1392));
    int _1504 = _1492 * _1488;
    int _1506 = as_type<int>(_1440) + (-2);
    float _1508 = _1416 * _1428;
    float _1510 = float(uint(_1500));
    int _1512 = _1496 * _1444;
    int _1514 = _1512 + _1504;
    float _1516 = 1.0 / _1502;
    float _1518 = float(uint(_1466));
    float _1520 = fma(_1414, _1426, _1508);
    float _1522 = as_type<float>(_1506) * _1510;
    int _1524 = as_type<int>(_1464) + (-2);
    float _1526 = _1416 * _1452;
    float _1528 = float(uint(_1514));
    float _1530 = fma(_1418, _1430, _1520);
    float _1532 = 1.0 / _1518;
    int _1534 = abs(_1500);
    float _1536 = _1416 * _1470;
    float _1538 = as_type<float>(_1524) * _1528;
    float _1540 = _1530 + _1432;
    float _1542 = fma(_1414, _1468, _1536);
    float _1544 = trunc(_1522);
    float _1546 = precise::max(_1544, 0.0);
    uint _1548 = uint(_1546);
    int _1550 = as_type<int>(_1516) + (-2);
    float _1552 = fma(_1414, _1450, _1526);
    float _1554 = float(uint(_1534));
    float _1556 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1558 = abs(_1514);
    float _1560 = _506 * 2.0;
    float _1562 = trunc(_1538);
    float _1564 = precise::max(_1562, 0.0);
    uint _1566 = uint(_1564);
    int _1568 = ~_1332;
    int _1570 = _1568 + 1;
    float _1572 = as_type<float>(_1550) * _1554;
    int _1574 = as_type<int>(_1532) + (-2);
    float _1576 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1578 = float(uint(_1558));
    float _1580 = _508 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1582 = ~_1370;
    int _1584 = _1582 + 1;
    int _1586 = _1570 * int(_1548);
    int _1588 = _1586 + _1500;
    float _1590 = trunc(_1572);
    float _1592 = precise::max(_1590, 0.0);
    uint _1594 = uint(_1592);
    float _1596 = as_type<float>(_1574) * _1578;
    float _1598 = fma(_1580, -2.0, _1576);
    float _1600 = float(uint(_1588));
    float _1602 = _506 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1604 = ~_1466;
    int _1606 = _1604 + 1;
    int _1608 = _1584 * int(_1566);
    int _1610 = _1608 + _1514;
    float _1612 = trunc(_1596);
    float _1614 = precise::max(_1612, 0.0);
    uint _1616 = uint(_1614);
    float _1618 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1620 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1618;
    float _1622 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1624 = _1622 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    int _1626 = ~_1392;
    int _1628 = _1626 + 1;
    float _1630 = -_1556;
    float _1632 = fma(_1602, 2.0, _1630);
    float _1634 = float(uint(_1610));
    float _1636 = as_type<float>(_1506) * _1600;
    float _1638 = fma(_1418, _1472, _1542);
    float _1640 = 1.0 / _1624;
    int _1642 = _1628 * int(_1594);
    int _1644 = _1642 + _1534;
    float _1646 = as_type<float>(_1524) * _1634;
    float _1648 = fma(_1418, _1454, _1552);
    float _1650 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1652 = _403 + _1650;
    float _1654 = float(uint(_1644));
    float _1656 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1658 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1656;
    int _1660 = _1606 * int(_1616);
    int _1662 = _1660 + _1558;
    float _1664 = 1.0 / _1620;
    float _1666 = as_type<float>(_1550) * _1654;
    float _1668 = _506 + _508;
    float _1670 = float(uint(_1662));
    float _1672 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1674 = _403 + _1672;
    float _1676 = _1668 + (-1.0);
    float _1678 = trunc(_1636);
    float _1680 = precise::max(_1678, 0.0);
    uint _1682 = uint(_1680);
    float _1684 = as_type<float>(_1574) * _1670;
    float _1686 = _1674 * _1640;
    float _1688 = _510 + _508;
    float _1690 = _1648 + _1456;
    float _1692 = -_139;
    float _1694 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1632);
    float _1696 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1598);
    float _1698 = floor(_1560);
    float _1700 = _1652 * _1664;
    float _1702 = fma(_1676, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1704 = ~_1332;
    int _1706 = _1704 + 1;
    float _1708 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1710 = as_type<int>(_1652);
    if (_900)
    {
        _1710 = 0;
    }
    int _1712 = _1710;
    int _1714 = _1712;
    if (!_900)
    {
        _1714 = 1;
    }
    int _1716 = _1714;
    float _1718 = trunc(_1684);
    float _1720 = precise::max(_1718, 0.0);
    uint _1722 = uint(_1720);
    int _1724 = int(_1548) + int(_1682);
    float _1726 = _1688 + (-1.0);
    float _1728 = -_179;
    int _1730 = _1260 ? as_type<int>(_1728) : as_type<int>(_179);
    bool _1732 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1734 = isnan(_403);
    bool _1736 = _1732 || _1734;
    bool _1738 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1740 = _1736 || _1738;
    float _1742 = float(_1740);
    float _1744 = trunc(_1666);
    float _1746 = precise::max(_1744, 0.0);
    uint _1748 = uint(_1746);
    bool _1750 = _1698 > 0.0;
    float _1752 = fma(_1726, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1754 = _1698 >= 0.0;
    bool _1756 = isnan(_1698);
    bool _1758 = _1754 || _1756;
    bool _1760 = isnan(0.0);
    bool _1762 = _1758 || _1760;
    int _1764 = _1706 * _1724;
    int _1766 = _1764 + _1500;
    int _1768 = ~_1392;
    int _1770 = _1768 + 1;
    float _1772 = fma(_1658, _1700, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _1774 = !_1308;
    float _1776 = _1774 ? _179 : as_type<float>(_1730);
    float _1778 = trunc(_1646);
    float _1780 = precise::max(_1778, 0.0);
    uint _1782 = uint(_1780);
    int _1784 = int(_1616) + int(_1722);
    float _1786 = _508 * 2.0;
    bool _1788 = uint(_1766) >= uint(_1332);
    bool _1790 = _506 > 0.5;
    float _1792 = floor(_1786);
    int _1794 = int(_1594) + int(_1748);
    float _1796 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1796;
    int _1800 = ~_1370;
    int _1802 = _1800 + 1;
    bool _1804 = !_1788;
    int _1806 = _1804 ? 0 : (-1);
    int _1808 = _1770 * _1794;
    int _1810 = _1808 + _1534;
    float _1812 = -_175;
    int _1814 = _1790 ? as_type<int>(_1812) : as_type<int>(_175);
    float _1816 = fma(_1798, _1700, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    int _1818 = int(_1566) + int(_1782);
    bool _1820 = uint(_1810) >= uint(_1392);
    bool _1822 = _508 > 0.5;
    int _1824 = _1802 * _1818;
    int _1826 = _1824 + _1514;
    int _1828 = ~_1466;
    int _1830 = _1828 + 1;
    bool _1832 = !_1820;
    int _1834 = _1832 ? 0 : (-1);
    float _1836 = -_179;
    int _1838 = _1822 ? as_type<int>(_1836) : as_type<int>(_179);
    bool _1840 = uint(_1826) >= uint(_1370);
    bool _1842 = !_1326;
    float _1844 = _1842 ? _175 : as_type<float>(_1814);
    bool _1846 = _1716 != 1;
    int _1848 = _1830 * _1784;
    int _1850 = _1848 + _1558;
    bool _1852 = _510 > 0.5;
    bool _1854 = !_1312;
    float _1856 = _1854 ? _179 : as_type<float>(_1838);
    bool _1858 = !_1840;
    int _1860 = _1858 ? 0 : (-1);
    bool _1862 = _1792 > 0.0;
    bool _1864 = _1792 >= 0.0;
    bool _1866 = isnan(_1792);
    bool _1868 = _1864 || _1866;
    bool _1870 = isnan(0.0);
    bool _1872 = _1868 || _1870;
    float _1874 = _510 * 2.0;
    float _1876 = -_175;
    int _1878 = _1852 ? as_type<int>(_1876) : as_type<int>(_175);
    bool _1880 = uint(_1850) >= uint(_1466);
    int _1882 = ~_1724;
    int _1884 = _1882 + _1806;
    int _1886 = _1884 + 1;
    float _1888 = floor(_1874);
    bool _1890 = !_1316;
    float _1892 = _1890 ? _175 : as_type<float>(_1878);
    bool _1894 = _1332 == 0;
    int _1896 = _1332 * _1886;
    int _1898 = _1896 + _1500;
    float _1900 = as_type<float>(_1826);
    float _1902 = as_type<float>(_1830);
    float _1904 = as_type<float>(_1850);
    float _1906 = as_type<float>(_1724);
    if (!_1846)
    {
        _1900 = _508;
    }
    float _1908 = _1900;
    float _1910 = _1908;
    if (!_1846)
    {
        _1902 = _508;
    }
    float _1912 = _1902;
    float _1914 = _1912;
    if (!_1846)
    {
        _1904 = _510;
    }
    float _1916 = _1904;
    float _1918 = _1916;
    if (!_1846)
    {
        _1906 = _510;
    }
    float _1920 = _1906;
    float _1922 = _1920;
    if (_1846)
    {
        _1910 = _506;
    }
    float _1924 = _1910;
    if (_1846)
    {
        _1914 = _506;
    }
    float _1926 = _1914;
    if (_1846)
    {
        _1918 = _508;
    }
    float _1928 = _1918;
    if (_1846)
    {
        _1922 = _508;
    }
    float _1930 = _1922;
    bool _1932 = !_1880;
    int _1934 = _1932 ? 0 : (-1);
    float _1936 = _1928 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1938 = !_1894;
    int _1940 = _1938 ? _1898 : (-1);
    float _1942 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1942;
    int _1946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1948 = _1946 != 0;
    int _1950 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1952 = _1950 != 0;
    int _1954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1956 = _1954 != 0;
    bool _1958 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1960 = isnan(_403);
    bool _1962 = _1958 || _1960;
    bool _1964 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1966 = _1962 || _1964;
    float _1968 = float(_1966);
    float _1970 = fma(_1944, _1700, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _1972 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1974 = isnan(_403);
    bool _1976 = _1972 || _1974;
    bool _1978 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1980 = _1976 || _1978;
    float _1982 = float(_1980);
    float _1984 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1986 = _1984 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    int _1988 = _1762 ? 0 : 1;
    float _1990 = -_1968;
    float _1992 = _1990 + 1.0;
    bool _1994 = _1888 >= 0.0;
    bool _1996 = isnan(_1888);
    bool _1998 = _1994 || _1996;
    bool _2000 = isnan(0.0);
    bool _2002 = _1998 || _2000;
    float _2004 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _2006 = _2004 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _2008 = -_1982;
    float _2010 = _2008 + 1.0;
    float _2012 = _1982 * _1992;
    int _2014 = _2002 ? 0 : 1;
    float _2016 = fma(_1986, _1686, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    bool _2018 = _1888 > 0.0;
    float _2020 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _2022 = _2020 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _2024 = _1742 * _2010;
    float _2026 = -_1742;
    float _2028 = _2026 + 1.0;
    int _2030 = ~_1818;
    int _2032 = _2030 + _1860;
    int _2034 = _2032 + 1;
    float _2036 = fma(_2022, _1686, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _2038 = _1638 + _1474;
    float _2040 = _1970 * _2024;
    float _2042 = _1816 * _2024;
    float _2044 = _1772 * _2024;
    int _2046 = ~_1988;
    int _2048 = _2046 + 1;
    int _2050 = _2048 + 1;
    float _2052 = fma(_2028, (*spvDescriptorSet0.vp_c9)._m0[107].x, _2040);
    float _2054 = fma(_2028, (*spvDescriptorSet0.vp_c9)._m0[107].y, _2042);
    float _2056 = fma(_2028, (*spvDescriptorSet0.vp_c9)._m0[107].z, _2044);
    int _2058 = _2050;
    if (!_1750)
    {
        int _2060 = ~_1988;
        int _2062 = _2060 + 1;
        _2058 = _2062;
    }
    int _2064 = _2058;
    int _2066 = _1370 * _2034;
    int _2068 = _2066 + _1514;
    bool _2070 = _1370 == 0;
    float _2072 = fma(_2036, _2012, _2052);
    int _2074 = ~_1834;
    int _2076 = _1794 + _2074;
    int _2078 = _2076 + 1;
    float _2080 = fma(_1926, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1708);
    bool _2082 = !_2070;
    int _2084 = _2082 ? _2068 : (-1);
    float _2086 = fma(_2006, _1686, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _2088 = _1332 == 0;
    float _2090 = fma(_2016, _2012, _2054);
    int _2092 = _1500 ^ _1332;
    float _2094 = fma(_2086, _2012, _2056);
    float _2096 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    uint _2098 = uint(int(uint(_2092) >> uint(31)));
    float _2100 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2080);
    float _2102 = float(_1940);
    float _2104 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2106 = ~int(_2098);
    int _2108 = _2106 + 1;
    float _2110 = fma(_1968, (*spvDescriptorSet0.vp_c9)._m0[109].x, _2072);
    float _2112 = fma(_1930, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2104);
    int _2114 = _2078 ^ _2108;
    float _2116 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2118 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2112);
    int _2120 = ~_2108;
    int _2122 = _2120 + _2114;
    int _2124 = _2122 + 1;
    float _2126 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2128 = _1924 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2130 = _2096 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2132 = !_2088;
    int _2134 = _2132 ? _2124 : (-1);
    float _2136 = fma(_1968, (*spvDescriptorSet0.vp_c9)._m0[109].y, _2090);
    bool _2138 = _1370 == 0;
    float _2140 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2142 = _1514 ^ _1370;
    float _2144 = -_2126;
    float _2146 = fma(_2128, 2.0, _2144);
    int _2148 = ~_1934;
    int _2150 = _1784 + _2148;
    int _2152 = _2150 + 1;
    float _2154 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    uint _2156 = uint(int(uint(_2142) >> uint(31)));
    float _2158 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2160 = _1690 + _2158;
    float _2162 = fma(_2130, _2102, _1694);
    float _2164 = fma(_1936, -2.0, _2154);
    int _2166 = ~int(_2156);
    int _2168 = _2166 + 1;
    float _2170 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2172 = _1540 + _2170;
    float _2174 = _2160 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2176 = _1844 + 0.5;
    int _2178 = _2152 ^ _2168;
    float _2180 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2182 = _2038 + _2180;
    float _2184 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2174);
    float _2186 = _2140 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2188 = ~_2168;
    int _2190 = _2188 + _2178;
    int _2192 = _2190 + 1;
    float _2194 = _2116 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2198 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2184);
    float _2200 = float(_2134);
    float _2202 = fma(_2130, _2176, _2162);
    float _2204 = float(_2084);
    float _2206 = -_139;
    float _2208 = fma(_2206, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2146);
    bool _2210 = !_2138;
    int _2212 = _2210 ? _2192 : (-1);
    float _2214 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2216 = -_1696;
    float _2218 = fma(_2194, _2200, _2216);
    bool _2220 = _2198 >= 0.0;
    float _2222 = _1856 + (-0.5);
    float _2224 = fma(_2186, _2204, _2208);
    float _2226 = _1892 + 0.5;
    float _2228 = float(_2212);
    float _2230 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2214);
    float _2232 = _2196 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2234 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2164);
    float _2236 = -_2194;
    float _2238 = fma(_2236, _2222, _2218);
    float _2240 = fma(_2186, _2226, _2224);
    float _2242 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2230);
    float _2244 = -_2234;
    float _2246 = fma(_2232, _2228, _2244);
    float _2248 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2250 = log2(_2248);
    float _2252 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2254 = _1776 + (-0.5);
    float _2256 = -_2242;
    float _2258 = _2256 + 1.0;
    int _2260 = ~_2014;
    int _2262 = _2260 + 1;
    int _2264 = _2262 + 1;
    float _2266 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2252);
    float _2268 = -_2100;
    float _2270 = _2268 + 1.0;
    float _2272 = -_2232;
    float _2274 = fma(_2272, _2254, _2246);
    float _2276 = -_2258;
    float _2278 = fma(_1844, _2276, _2202);
    float _2280 = -_2118;
    float _2282 = _2280 + 1.0;
    bool _2284 = !_1948;
    int _2286 = _2284 ? 0 : 1;
    float _2288 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2266);
    int _2290 = _2264;
    float _2292 = _2136;
    if (!_2018)
    {
        int _2294 = ~_2014;
        int _2296 = _2294 + 1;
        _2290 = _2296;
    }
    int _2298 = _2290;
    float _2300 = fma(_1776, _2282, _2274);
    int _2302 = abs(_2286);
    float _2304 = _2160 * _2160;
    float _2306 = -_2270;
    float _2308 = fma(_1892, _2306, _2240);
    float _2310 = -_2288;
    float _2312 = _2310 + 1.0;
    float _2314 = _2250 * _139;
    float _2316 = float(_2302);
    float _2318 = fma(_2172, _2172, _2304);
    float _2320 = float(_2298);
    float _2322 = _2110 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2324 = fma(_1856, _2312, _2238);
    float _2326 = fma(_2182, _2182, _2318);
    float _2328 = fma(_1968, (*spvDescriptorSet0.vp_c9)._m0[109].z, _2094);
    float _2330 = exp2(_2314);
    float _2332 = _2316 * _2320;
    float _2334 = _2328 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2336 = _2136 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    if (_2220)
    {
        _2292 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2338 = _2292;
    float _2340 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2342 = 1.0 + _2340;
    float _2344 = rsqrt(_2326);
    float _2346 = in.m_62.x;
    float _2348 = in.m_62.y;
    float _2350 = in.m_62.z;
    float _2352 = _2322 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2354 = _2336 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2356 = _2334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2358 = as_type<int>(_2338);
    if (_2220)
    {
        float _2360 = _2338 * 5.0;
        _2358 = as_type<int>(_2360);
    }
    int _2362 = _2358;
    bool _2364 = !_1952;
    int _2366 = _2364 ? 0 : 1;
    out.m_64.x = _2278;
    out.m_64.y = _2324;
    out.m_64.z = _2308;
    out.m_64.w = _2300;
    float _2368 = 1.0 / _2342;
    float _2370 = -_2330;
    float _2372 = _2370 + 1.0;
    bool _2374 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2376 = isnan(0.0);
    bool _2378 = _2374 || _2376;
    bool _2380 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2382 = _2378 || _2380;
    out.m_66.x = _2352;
    out.m_66.y = _2354;
    out.m_66.z = _2356;
    bool _2384 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2386 = isnan(1.0);
    bool _2388 = _2384 || _2386;
    bool _2390 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2392 = _2388 || _2390;
    int _2394 = _1872 ? 0 : 1;
    if (_2220)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7089 = as_type<float>(_2362);
        out.gl_Position.z = _7089;
    }
    bool _2396 = !_1956;
    int _2398 = _2396 ? 0 : 1;
    float _2400 = _2160 * _2344;
    if (_2220)
    {
        out.m_47.x = 0.0;
    }
    int _2402 = abs(_2366);
    float _2404 = _2172 * _2344;
    if (_2220)
    {
        return out;
    }
    float _2406 = -_2400;
    float _2408 = fma(_2406, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1690);
    float _2410 = _2182 * _2344;
    float _2412 = -_2404;
    float _2414 = fma(_2412, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1540);
    float _2416 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2418 = _2408 + _2416;
    float _2420 = -_2410;
    float _2422 = fma(_2420, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2038);
    float _2424 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2426 = _2414 + _2424;
    int _2428 = ~_2394;
    int _2430 = _2428 + 1;
    int _2432 = _2430 + 1;
    float _2434 = _2418 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2436 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2438 = _2422 + _2436;
    float _2440 = float(_2064);
    float _2442 = _508 + (-0.5);
    float _2444 = fma(_2426, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2434);
    float _2446 = float(_2402);
    int _2448 = _2432;
    float _2450 = _2426;
    float _2452 = _2418;
    float _2454 = _2438;
    if (!_1862)
    {
        int _2456 = ~_2394;
        int _2458 = _2456 + 1;
        _2448 = _2458;
    }
    int _2460 = _2448;
    float _2462 = _2332 * (-2.0);
    float _2464 = fma(_2438, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2444);
    float _2466 = _2382 ? _2372 : 0.0;
    float _2468 = _2446 * _2440;
    float _2470 = _506 + (-0.5);
    float _2472 = fma(_2462, _2346, _2346);
    bool _2474 = _2464 >= 0.0;
    if (_2392)
    {
        float _2476 = _2466 * _2368;
        _143 = _2476;
    }
    float _2478 = _143;
    float _2480 = fma(_1702, _2462, _1702);
    float _2482 = fma(_2470, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2472);
    float _2484 = _2468 * (-2.0);
    int _2486 = abs(_2398);
    float _2488 = fma(_2480, _2478, _2482);
    float _2490 = fma(_2484, _2348, _2348);
    float _2492 = fma(_1752, _2484, _1752);
    float _2494 = _2488 * 0.15915493667125701904296875;
    float _2496 = fma(_2442, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2490);
    float _2498 = _2484;
    if (_2474)
    {
        _2498 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2500 = _2498;
    int _2502 = as_type<int>(_2500);
    if (_2474)
    {
        out.m_47.x = 0.0;
    }
    float _2504 = _2494 * 6.283185482025146484375;
    float _2506 = sin(_2504);
    float _2508 = fma(_2492, _2478, _2496);
    float _2510 = float(_2460);
    if (_2474)
    {
        float _2512 = _2500 * 5.0;
        _2502 = as_type<int>(_2512);
    }
    int _2514 = _2502;
    float _2516 = float(_2486);
    float _2518 = _2494 * 6.283185482025146484375;
    float _2520 = cos(_2518);
    if (_2474)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7295 = as_type<float>(_2514);
        out.gl_Position.z = _7295;
    }
    float _2522 = _2516 * _2510;
    if (_2474)
    {
        return out;
    }
    float _2524 = -_1690;
    float _2526 = _2524 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2528 = _510 + _506;
    float _2530 = _2508 * 0.15915493667125701904296875;
    float _2532 = -_1540;
    float _2534 = _2532 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2536 = _2526 * _2526;
    float _2538 = _2528 + (-1.0);
    float _2540 = -_2038;
    float _2542 = _2540 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2544 = -_2400;
    float _2546 = fma(_2544, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2160);
    float _2548 = fma(_2534, _2534, _2536);
    float _2550 = fma(_2538, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2552 = _2522 * (-2.0);
    float _2554 = _510 + (-0.5);
    float _2556 = fma(_2542, _2542, _2548);
    float _2558 = in.m_68.x;
    float _2560 = in.m_68.y;
    float _2562 = fma(_2552, _2350, _2350);
    float _2564 = -_2404;
    float _2566 = fma(_2564, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2172);
    float _2568 = _2546 * _2546;
    float _2570 = fma(_2550, _2552, _2550);
    float _2572 = rsqrt(_2556);
    float _2574 = fma(_2554, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2562);
    float _2576 = fma(_2566, _2566, _2568);
    float _2578 = -_2410;
    float _2580 = fma(_2578, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2182);
    float _2582 = fma(_2570, _2478, _2574);
    bool _2584 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2586 = isnan(0.5);
    bool _2588 = _2584 || _2586;
    bool _2590 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2592 = _2588 || _2590;
    float _2594 = fma(_2580, _2580, _2576);
    float _2596 = _2530 * 6.283185482025146484375;
    float _2598 = sin(_2596);
    float _2600 = _2582 * 0.15915493667125701904296875;
    float _2602 = _2534 * _2572;
    float _2604 = sqrt(_2594);
    float _2606 = _2542 * _2572;
    float _2608 = _373 * _2560;
    float _2610 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2612 = _2602 * _2610;
    float _2614 = _2526 * _2572;
    float _2616 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2618 = _2606 * _2616;
    float _2620 = _371 * _2558;
    float _2622 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2624 = -_2612;
    float _2626 = fma(_2606, _2622, _2624);
    float _2628 = _2530 * 6.283185482025146484375;
    float _2630 = cos(_2628);
    float _2632 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2634 = _2614 * _2632;
    float _2636 = _2506 * _2598;
    float _2638 = _2620 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2640 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _179);
    float _2642 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2644 = -_2634;
    float _2646 = fma(_2602, _2642, _2644);
    float _2648 = _2608 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2650 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _175);
    float _2652 = _2600 * 6.283185482025146484375;
    float _2654 = sin(_2652);
    float _2656 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2658 = -_2618;
    float _2660 = fma(_2614, _2656, _2658);
    float _2662 = _2626 * _2626;
    float _2664 = _2344 * _2604;
    float _2666 = fma(_2660, _2660, _2662);
    float _2668 = _2664 * _2648;
    float _2670 = _2600 * 6.283185482025146484375;
    float _2672 = cos(_2670);
    float _2674 = _2520 * _2630;
    float _2676 = fma(_2646, _2646, _2666);
    float _2678 = _2520 * _2598;
    float _2680 = _2506 * _2630;
    float _2682 = _2640 * _2668;
    float _2684 = rsqrt(_2676);
    float _2686 = fma(_2654, _2674, _2636);
    float _2688 = fma(_2654, _2636, _2674);
    float _2690 = _2520 * _2672;
    float _2692 = _2630 * _2672;
    float _2694 = _2506 * _2672;
    float _2696 = _2598 * _2672;
    float _2698 = _2664 * _2638;
    float _2700 = _2690 * _2682;
    float _2702 = -_2678;
    float _2704 = fma(_2654, _2680, _2702);
    float _2706 = -_2680;
    float _2708 = fma(_2654, _2678, _2706);
    float _2710 = _2650 * _2698;
    float _2712 = _2660 * _2684;
    float _2714 = _2646 * _2684;
    float _2716 = -_2682;
    float _2718 = _2654 * _2716;
    float _2720 = fma(_2686, _2710, _2700);
    float _2722 = _2626 * _2684;
    float _2724 = _2664 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2726 = _2724 * 0.5;
    float _2728 = _2614 * _2712;
    float _2730 = _2694 * _2682;
    float _2732 = fma(_2692, _2710, _2718);
    float _2734 = fma(_2708, _2726, _2720);
    float _2736 = _2606 * _2722;
    float _2738 = -_2728;
    float _2740 = fma(_2602, _2722, _2738);
    float _2742 = fma(_2704, _2710, _2730);
    float _2744 = fma(_2696, _2726, _2732);
    float _2746 = -_2736;
    float _2748 = fma(_2614, _2714, _2746);
    float _2750 = _2740 * _2734;
    float _2752 = fma(_2688, _2726, _2742);
    float _2754 = _2602 * _2714;
    float _2756 = _2748 * _2734;
    float _2758 = fma(_2714, _2744, _2750);
    float _2760 = -_2754;
    float _2762 = fma(_2606, _2712, _2760);
    float _2764 = fma(_2712, _2744, _2756);
    float _2766 = fma(_2606, _2752, _2758);
    float _2768 = _2762 * _2734;
    float _2770 = fma(_2602, _2752, _2764);
    float _2772 = _2038 + _2766;
    float _2774 = _1540 + _2770;
    float _2776 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2778 = _2772 + _2776;
    float _2780 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2782 = _2774 + _2780;
    float _2784 = _2778 * _2778;
    float _2786 = fma(_2782, _2782, _2784);
    float _2788 = fma(_2722, _2744, _2768);
    float _2790 = sqrt(_2786);
    float _2792 = fma(_2614, _2752, _2788);
    float _2794 = _1690 + _2792;
    bool _2796 = _2790 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2798 = _2788;
    float _2800 = _2752;
    float _2802 = _2768;
    if (!_2796)
    {
        _2798 = _2774;
    }
    float _2804 = _2798;
    float _2806 = _2804;
    if (!_2796)
    {
        _2800 = _2772;
    }
    float _2808 = _2800;
    float _2810 = _2808;
    if (!_2796)
    {
        _2802 = _2794;
    }
    float _2812 = _2802;
    bool _2814 = !_2796;
    float _2816 = _2812;
    if (!_2814)
    {
        float _2818 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2820 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2822 = _2790 + _2820;
        float _2824 = rsqrt(_2786);
        float _2826 = _2822 * _2818;
        float _2828 = _2794 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2830 = _2826 * 0.15915493667125701904296875;
        float _2832 = _2830 * 6.283185482025146484375;
        float _2834 = cos(_2832);
        float _2836 = _2830 * 6.283185482025146484375;
        float _2838 = sin(_2836);
        float _2840 = _2834 + (-1.0);
        float _2842 = _2840 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2844 = fma(_2838, _2828, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2846 = fma(_2794, _2834, _2842);
        float _2848 = _2824 * _2844;
        float _2850 = fma(_2782, _2848, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2852 = fma(_2778, _2848, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2806 = _2850;
        _2816 = _2846;
        _2810 = _2852;
    }
    float _2854 = _2806;
    float _2856 = _2816;
    float _2858 = _2810;
    float _2860 = -_2404;
    float _2862 = fma(_2860, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2854);
    float _2864 = -_2400;
    float _2866 = fma(_2864, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2856);
    float _2868 = -_2410;
    float _2870 = fma(_2868, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2858);
    float _2872 = _2866;
    float _2874 = _2862;
    float _2876 = _2870;
    float _2878 = _2856;
    if (!_2592)
    {
        float _2880 = _2418 * _2418;
        float _2882 = 1.0 / _2664;
        float _2884 = -_1540;
        float _2886 = _2884 + _2854;
        float _2888 = -_1690;
        float _2890 = _2888 + _2856;
        float _2892 = fma(_2426, _2426, _2880);
        float _2894 = -_2038;
        float _2896 = _2894 + _2858;
        float _2898 = fma(_2438, _2438, _2892);
        float _2900 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2902 = sqrt(_2898);
        float _2904 = precise::min(_2902, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2906 = _2904 * _2900;
        float _2908 = _2906 * _2882;
        float _2910 = fma(_2886, _2908, _2414);
        float _2912 = fma(_2890, _2908, _2408);
        float _2914 = fma(_2896, _2908, _2422);
        _2872 = _2912;
        _2874 = _2910;
        _2876 = _2914;
        _2450 = _2902;
        _2452 = _2900;
        _2878 = _2890;
    }
    float _2916 = _2872;
    float _2918 = _2874;
    float _2920 = _2876;
    float _2922 = _2450;
    float _2924 = _2452;
    float _2926 = _2878;
    float _2928 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2930 = _2916 + _2928;
    float _2932 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2934 = _2918 + _2932;
    float _2936 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2938 = _2920 + _2936;
    float _2940 = _2930 * _2930;
    float _2942 = fma(_2934, _2934, _2940);
    float _2944 = fma(_2938, _2938, _2942);
    float _2946 = rsqrt(_2944);
    float _2948 = _2946 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2950 = _2934 * _2948;
    float _2952 = _2938 * _2948;
    float _2954 = _2950 * _2950;
    float _2956 = _2952 * _2952;
    float _2958 = _2954 + _2956;
    float _2960 = sqrt(_2958);
    bool _2962 = _2960 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2964 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2966 = _2960 + _2964;
    float _2968 = _2946;
    float _2970 = _2924;
    float _2972 = _2966;
    float _2974 = _2922;
    float _2976 = _2930;
    float _2978 = _2926;
    if (_2962)
    {
        float _2980 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2968 = _2980;
    }
    float _2982 = _2968;
    if (_2962)
    {
        float _2984 = rsqrt(_2958);
        _2970 = _2984;
    }
    float _2986 = _2970;
    float _2988 = _2986;
    if (_2962)
    {
        float _2990 = _2966 * _2982;
        _2972 = _2990;
    }
    float _2992 = _2972;
    if (_2962)
    {
        float _2994 = _2992 * 0.15915493667125701904296875;
        _2974 = _2994;
    }
    float _2996 = _2974;
    float _2998 = _2938;
    if (_2962)
    {
        float _3000 = _2996 * 6.283185482025146484375;
        float _3002 = sin(_3000);
        _2998 = _3002;
    }
    float _3004 = _2998;
    float _3006 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3008 = precise::max(0.0, _3006);
    float _3010 = _2422;
    float _3012 = _3008;
    if (_2962)
    {
        float _3014 = _2996 * 6.283185482025146484375;
        float _3016 = cos(_3014);
        _3010 = _3016;
    }
    float _3018 = _3010;
    float _3020 = -_2948;
    float _3022 = -_3008;
    float _3024 = fma(_2930, _3020, _3022);
    if (_2962)
    {
        float _3026 = _3024 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3012 = _3026;
    }
    float _3028 = _3012;
    float _3030 = sqrt(_2944);
    float _3032 = _3028;
    float _3034 = _3004;
    if (_2962)
    {
        float _3036 = fma(_3004, _3028, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3032 = _3036;
    }
    float _3038 = _3032;
    float _3040 = _3038;
    if (!_2962)
    {
        _3034 = _3024;
    }
    float _3042 = _3034;
    float _3044 = _3042;
    float _3046 = _3018;
    if (_2962)
    {
        float _3048 = _3018 + (-1.0);
        _2976 = _3048;
    }
    float _3050 = _2976;
    float _3052 = _3050;
    if (_2962)
    {
        float _3054 = _2986 * _3038;
        _2978 = _3054;
    }
    float _3056 = _2978;
    if (!_2962)
    {
        _2988 = _2950;
    }
    float _3058 = _2988;
    float _3060 = _2916 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3062 = _3058;
    if (_2962)
    {
        float _3064 = _3050 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2454 = _3064;
    }
    float _3066 = _2454;
    if (_2962)
    {
        float _3068 = _2950 * _3056;
        _3062 = _3068;
    }
    float _3070 = _3062;
    if (!_2962)
    {
        _3052 = _2952;
    }
    float _3072 = _3052;
    float _3074 = _3072;
    if (_2962)
    {
        float _3076 = _2952 * _3056;
        _3074 = _3076;
    }
    float _3078 = _3074;
    if (!_2962)
    {
        _3040 = _2954;
    }
    float _3080 = _3040;
    float _3082 = _3080;
    if (_2962)
    {
        float _3084 = fma(_3024, _3018, _3066);
        _3044 = _3084;
    }
    float _3086 = _3044;
    if (_2962)
    {
        float _3088 = _3070 * _3070;
        _3082 = _3088;
    }
    float _3090 = _3082;
    if (!_2962)
    {
        _3046 = _2956;
    }
    float _3092 = _3046;
    float _3094 = _3092;
    if (_2962)
    {
        float _3096 = _3078 * _3078;
        _3094 = _3096;
    }
    float _3098 = _3094;
    float _3100 = fma(_2918, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3060);
    float _3102 = fma(_3086, _3086, _3090);
    float _3104 = _2916 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3106 = fma(_2920, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3100);
    float _3108 = _3102 + _3098;
    float _3110 = _2916 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3112 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3114 = fma(_3030, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3112);
    float _3116 = precise::clamp(_3114, 0.0, 1.0);
    float _3118 = _2916 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3120 = fma(_2918, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3104);
    float _3122 = fma(_2918, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3110);
    float _3124 = rsqrt(_3108);
    float _3126 = -_3116;
    float _3128 = _3126 + 1.0;
    float _3130 = fma(_2918, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3118);
    float _3132 = fma(_2920, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3122);
    float _3134 = _3106 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3136 = fma(_2920, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3120);
    float _3138 = fma(_2920, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3130);
    float _3140 = _3132 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3142 = abs(_3128);
    float _3144 = log2(_3142);
    float _3146 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3148 = _3138 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3150 = _3140 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3152 = _3134 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3154 = _3136 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3156 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3150);
    float _3158 = _3124 * _3070;
    float _3160 = _3124 * _3086;
    float _3162 = _3124 * _3078;
    float _3164 = fma(_3134, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3156);
    float _3166 = _3158 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3168 = -_3152;
    float _3170 = fma(_3168, _3146, 1.0);
    float _3172 = fma(_3154, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3164);
    float _3174 = -_3166;
    float _3176 = fma(_3160, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3174);
    float _3178 = _3144 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3180 = _3140 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3182 = log2(_3170);
    float _3184 = -_3162;
    float _3186 = fma(_3184, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3176);
    float _3188 = _3140 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3190 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3180);
    float _3192 = _3160 + 1.0;
    float _3194 = fma(_3186, -0.5, 0.5);
    float _3196 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3188);
    float _3198 = fma(_3186, 0.5, 0.5);
    float _3200 = 1.0 / _3172;
    float _3202 = fma(_3134, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3190);
    float _3204 = fma(_3134, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3196);
    float _3206 = fma(_3198, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3208 = fma(_3154, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3204);
    float _3210 = fma(_3154, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3202);
    float _3212 = exp2(_3178);
    float _3214 = fma(_3198, _3206, -0.212114393711090087890625);
    float _3216 = _3182 * 0.693147182464599609375;
    float _3218 = _3216 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3220 = sqrt(_3194);
    float _3222 = _3208 * _3200;
    float _3224 = _3210 * _3200;
    float _3226 = fma(_3224, -0.5, 0.5);
    float _3228 = -_3160;
    float _3230 = fma(_3212, _3192, _3228);
    float _3232 = fma(_3198, _3214, 1.570728778839111328125);
    float _3234 = fma(_3222, 0.5, 0.5);
    float _3236 = fma(_3230, 0.5, 0.5);
    float _3238 = _3220 * 0.636619746685028076171875;
    float _3240 = -_3232;
    float _3242 = fma(_3238, _3240, 1.0);
    float3 _8447 = float3(_3234, _3226, _3218);
    float _3244 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8447, float3(0.0), isnan(_8447)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8447, float3(0.0), isnan(_8447)), level(0.0)).x;
    float3 _8458 = float3(_3234, _3226, _3218);
    float4 _3247 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8458, float3(0.0), isnan(_8458)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8458, float3(0.0), isnan(_8458)), level(0.0)).xyzw;
    float _3249 = _3247.x;
    float _3251 = _3247.y;
    float _3253 = _3247.z;
    float _3255 = _3247.w;
    float2 _8475 = float2(_3242, _3236);
    float3 _3259 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8475, float2(0.0), isnan(_8475)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8475, float2(0.0), isnan(_8475)), level(0.0)).xyz;
    float _3261 = _3259.x;
    float _3263 = _3259.y;
    float _3265 = _3259.z;
    float _3267 = _2686 * _2748;
    float _3269 = _2686 * _2762;
    float _3271 = _2686 * _2740;
    float _3273 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3275 = _2690 * _2748;
    float _3277 = _2690 * _2762;
    float _3279 = _2708 * _2748;
    float _3281 = _2708 * _2762;
    float _3283 = _2690 * _2740;
    float _3285 = _2708 * _2740;
    float _3287 = fma(_2692, _2712, _3267);
    float _3289 = fma(_2692, _2722, _3269);
    float _3291 = fma(_2692, _2714, _3271);
    float _3293 = fma(_3273, _3273, 1.0);
    float _3295 = _3144 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3297 = -_2654;
    float _3299 = fma(_3297, _2712, _3275);
    float _3301 = -_2654;
    float _3303 = fma(_3301, _2722, _3277);
    float _3305 = -_2654;
    float _3307 = fma(_3305, _2714, _3283);
    float _3309 = fma(_2696, _2712, _3279);
    float _3311 = rsqrt(_3293);
    float _3313 = fma(_2696, _2722, _3281);
    float _3315 = fma(_2696, _2714, _3285);
    float _3317 = fma(_2694, _2602, _3299);
    float _3319 = fma(_2688, _2602, _3309);
    float _3321 = fma(_2694, _2614, _3303);
    float _3323 = fma(_2694, _2606, _3307);
    float _3325 = fma(_2704, _2602, _3287);
    float _3327 = exp2(_3295);
    float _3329 = fma(_2704, _2614, _3289);
    float _3331 = fma(_2704, _2606, _3291);
    float _3333 = fma(_2688, _2614, _3313);
    float _3335 = fma(_2688, _2606, _3315);
    float _3337 = _3140 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3339 = _175 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3341 = _3273 * _3317;
    float _3343 = _3273 * _3311;
    float _3345 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3337);
    out.m_70.x = _3325;
    out.m_70.y = _3329;
    out.m_70.z = _3331;
    float _3347 = fma(_3339, _3325, _3341);
    float _3349 = -_3319;
    float _3351 = _3343 * _3349;
    float _3353 = _3273 * _3321;
    float _3355 = fma(_3134, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3345);
    out.m_72.x = _2918;
    out.m_72.y = _2916;
    out.m_72.z = _2920;
    float _3357 = -_3327;
    float _3359 = _3357 + 1.0;
    float _3361 = fma(_3311, _3317, _3351);
    float _3363 = fma(_3339, _3329, _3353);
    float _3365 = fma(_3154, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3355);
    float _3367 = _3359 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3369 = -_3333;
    float _3371 = _3343 * _3369;
    float _3373 = -_3335;
    float _3375 = _3343 * _3373;
    bool _3377 = _3030 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3379 = isnan(_3030);
    bool _3381 = _3377 || _3379;
    bool _3383 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3385 = _3381 || _3383;
    float _3387 = fma(_3311, _3321, _3371);
    float _3389 = _3273 * _3323;
    float _3391 = _3365 + _3172;
    float _3393 = fma(_3311, _3323, _3375);
    float _3395 = _3333 + _3363;
    float _3397 = fma(_3339, _3331, _3389);
    float _3399 = _3319 + _3347;
    float _3401 = _3391 * 0.5;
    out.m_74.x = _3361;
    out.m_74.y = _3387;
    out.m_74.z = _3393;
    float _3403 = _3335 + _3397;
    out.m_76.z = _3401;
    out.m_76.w = _3172;
    out.m_78.x = _3399;
    out.m_78.y = _3395;
    out.m_78.z = _3403;
    out.gl_Position.x = _3208;
    out.gl_Position.y = _3210;
    out.gl_Position.z = _3365;
    out.gl_Position.w = _3172;
    float _3405 = _3172;
    float _3407 = _3365;
    float _3409 = _3210;
    float _3411 = _3208;
    if (!_3385)
    {
        _3405 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3413 = _3405;
    float _3415 = _3413;
    float _3417 = _3413;
    if (!_3385)
    {
        _3407 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3419 = _3407;
    float _3421 = _3419;
    float _3423 = _3419;
    if (!_3385)
    {
        _3409 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3425 = _3409;
    float _3427 = _3425;
    float _3429 = _3425;
    if (!_3385)
    {
        _3411 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3431 = _3411;
    float _3433 = _3367 * _3244;
    float _3435 = -_3367;
    float _3437 = _3435 + 1.0;
    float _3439 = _3255 * _3433;
    float _3441 = _3265 * _3433;
    float _3443 = _3255 * _3437;
    float _3445 = fma(_3261, _3439, _3249);
    float _3447 = fma(_3263, _3439, _3251);
    float _3449 = fma(_3255, _3441, _3253);
    float _3451 = _3251;
    float _3453 = _3249;
    float _3455 = _3431;
    float _3457 = _3431;
    if (!_3385)
    {
        _3451 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3459 = _3451;
    float _3461 = _3459;
    float _3463 = _3459;
    if (!_3385)
    {
        _3453 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3465 = _3453;
    out.m_80.x = _3445;
    out.m_80.y = _3447;
    out.m_80.z = _3449;
    out.m_80.w = _3443;
    bool _3467 = !_3385;
    float _3469 = _3465;
    float _3471 = _3465;
    if (!_3467)
    {
        bool _3473 = _3030 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3475 = isnan(_3030);
        bool _3477 = _3473 || _3475;
        bool _3479 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3481 = _3477 || _3479;
        if (!_3481)
        {
            float _3483 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3485 = _3030 + _3483;
            float _3487 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3489 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3487;
            float _3491 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3493 = _3491 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3495 = 1.0 / _3489;
            float _3497 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3499 = _3497 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3501 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3503 = _3501 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3505 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3507 = _3505 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3509 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3511 = _3509 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3513 = _3485 * _3495;
            float _3515 = precise::clamp(_3513, 0.0, 1.0);
            float _3517 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3519 = _3517 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3521 = fma(_3515, _3493, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3523 = fma(_3515, _3519, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3525 = fma(_3515, _3499, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3527 = fma(_3515, _3503, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3529 = fma(_3515, _3507, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3531 = fma(_3515, _3511, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3471 = _3525;
            _3429 = _3529;
            _3463 = _3521;
            _3423 = _3527;
            _3417 = _3523;
            _3457 = _3531;
            _3533 = true;
        }
        else
        {
            bool _3535 = _3030 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3537 = isnan(_3030);
            bool _3539 = _3535 || _3537;
            bool _3541 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3543 = _3539 || _3541;
            if (!_3543)
            {
                _3461 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3545 = _3461;
            _3463 = _3545;
            if (!_3543)
            {
                _3469 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3547 = _3469;
            _3471 = _3547;
            if (!_3543)
            {
                _3415 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3549 = _3415;
            _3417 = _3549;
            if (!_3543)
            {
                _3421 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3551 = _3421;
            _3423 = _3551;
            if (!_3543)
            {
                _3427 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3553 = _3427;
            _3429 = _3553;
            if (!_3543)
            {
                _3455 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3555 = _3455;
            bool _3557 = !_3543;
            _3457 = _3555;
            if (!_3557)
            {
                bool _3559 = _3030 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3561 = isnan(_3030);
                bool _3563 = _3559 || _3561;
                bool _3565 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3567 = _3563 || _3565;
                if (!_3567)
                {
                    float _3569 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3571 = _3030 + _3569;
                    float _3573 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3575 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3573;
                    float _3577 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3579 = _3577 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3581 = 1.0 / _3575;
                    float _3583 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3585 = _3583 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3587 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3589 = _3587 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3591 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3593 = _3591 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3595 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3597 = _3595 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3599 = _3571 * _3581;
                    float _3601 = precise::clamp(_3599, 0.0, 1.0);
                    float _3603 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3605 = _3603 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3607 = fma(_3601, _3579, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3609 = fma(_3601, _3605, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3611 = fma(_3601, _3585, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3613 = fma(_3601, _3589, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3615 = fma(_3601, _3593, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3617 = fma(_3601, _3597, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3471 = _3611;
                    _3429 = _3615;
                    _3463 = _3607;
                    _3423 = _3613;
                    _3417 = _3609;
                    _3457 = _3617;
                    _3533 = true;
                }
                else
                {
                    _3471 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3429 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3463 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3423 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3417 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3457 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3533 = false;
    float _3619 = _3471;
    float _3621 = _3429;
    float _3623 = _3463;
    float _3625 = _3423;
    float _3627 = _3417;
    float _3629 = _3457;
    float _3631 = fma(_3395, -0.5, 0.5);
    float _3633 = precise::clamp(_3631, 0.0, 1.0);
    float _3635 = -_3619;
    float _3637 = _3635 + _3621;
    float _3639 = -_3623;
    float _3641 = _3639 + _3625;
    float _3643 = -_3627;
    float _3645 = _3643 + _3629;
    bool _3647 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3649 = fma(_3633, _3637, _3619);
    float _3651 = fma(_3633, _3641, _3623);
    float _3653 = fma(_3633, _3645, _3627);
    float _3655 = _3649 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3657 = fma(_3651, 0.298911988735198974609375, _3655);
    float _3659 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3661 = fma(_3653, 0.114477999508380889892578125, _3657);
    out.m_82.w = _3659;
    float _3663 = -_3661;
    float _3665 = _3651 + _3663;
    float _3667 = -_3661;
    float _3669 = _3649 + _3667;
    float _3671 = -_3661;
    float _3673 = _3653 + _3671;
    out.m_84.x = 0.0;
    float _3675 = fma(_3665, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3661);
    float _3677 = fma(_3669, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3661);
    float _3679 = fma(_3673, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3661);
    out.m_86.x = _3675;
    out.m_86.y = _3677;
    out.m_86.z = _3679;
    if (!_3647)
    {
        return out;
    }
    float _3681 = -_2916;
    float _3683 = _3681 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3685 = -_2918;
    float _3687 = _3685 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3689 = -_2920;
    float _3691 = _3689 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3693 = _3683 * _3683;
    float _3695 = fma(_3687, _3687, _3693);
    float _3697 = fma(_3691, _3691, _3695);
    float _3699 = sqrt(_3697);
    float _3701 = rsqrt(_3697);
    float _3703 = -_3699;
    float _3705 = _3703 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3707 = _3705 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3709 = precise::clamp(_3707, 0.0, 1.0);
    float _3711 = _3687 * _3701;
    float _3713 = _3683 * _3701;
    float _3715 = abs(_3709);
    float _3717 = log2(_3715);
    float _3719 = _3691 * _3701;
    float _3721 = _3711 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3723 = _3395 * _3713;
    float _3725 = -_3713;
    float _3727 = -_3721;
    float _3729 = fma(_3725, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3727);
    float _3731 = fma(_3399, _3711, _3723);
    float _3733 = -_3719;
    float _3735 = fma(_3733, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3729);
    float _3737 = fma(_3403, _3719, _3731);
    float _3739 = precise::clamp(_3737, 0.0, 1.0);
    float _3741 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3743 = _3735 + _3741;
    float _3745 = _3717 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3747 = _3743 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3749 = precise::clamp(_3747, 0.0, 1.0);
    float _3751 = exp2(_3745);
    float _3753 = _3751 * _3749;
    float _3755 = _3739 * _3753;
    float _3757 = _3755 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3759 = _3755 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3761 = _3755 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_84.x = _3757;
    out.m_84.y = _3759;
    out.m_84.z = _3761;
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
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3533 = false;
    bool _395 = false;
    bool _201 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_44.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_47.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3818 = as_type<float>(_121);
        out.gl_Position.z = _3818;
    }
    if (!_109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_49.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = 0.0;
    float _143 = _139;
    if (_135)
    {
        float _145 = float(_105);
        _141 = _145;
    }
    float _147 = _141;
    bool _149 = _139 >= _147;
    bool _151 = !_135;
    bool _153 = _149 || _151;
    if (_153)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _115;
    if (_153)
    {
        out.m_47.x = 0.0;
    }
    if (_153)
    {
        float _157 = _155 * 5.0;
        _123 = as_type<int>(_157);
    }
    int _159 = _123;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3887 = as_type<float>(_159);
        out.gl_Position.z = _3887;
    }
    if (_153)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    bool _163 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _165 = as_type<int>(_161) & 1;
    bool _167 = _165 != 0;
    int _169 = as_type<int>(_161) & 2;
    bool _171 = _169 != 0;
    bool _173 = !_167;
    float _175 = _173 ? (-0.5) : 0.5;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_163;
    float _199;
    if (!_181)
    {
        float _183 = in.m_54.x;
        float _185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _187 = _183 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _189 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _191 = _189 * _185;
        float _193 = floor(_191);
        float _195 = -_193;
        float _197 = _191 + _195;
        _199 = _197;
        _201 = true;
    }
    else
    {
        float _203 = float(_105);
        float _205 = 1.0 / _203;
        float _207 = _139 * _205;
        _199 = _207;
    }
    _201 = false;
    float _209 = _199;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = _209 + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _217 = _209 + _215;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _221 = _209 + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _225 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _223;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _229 = _227 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _231;
    bool _235 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _237 = isnan(_209);
    bool _239 = _235 || _237;
    bool _241 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _243 = _239 || _241;
    float _245 = float(_243);
    float _247 = 1.0 / _229;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _251 = 1.0 / _225;
    float _253 = 1.0 / _233;
    float _255 = _221 * _247;
    bool _257 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _259 = isnan(_209);
    bool _261 = _257 || _259;
    bool _263 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _265 = _261 || _263;
    float _267 = float(_265);
    float _269 = _213 * _251;
    bool _271 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _273 = isnan(_209);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = -_245;
    float _285 = _283 + 1.0;
    float _287 = _281 * _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _293 = _217 * _253;
    bool _295 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _297 = isnan(_209);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = -_281;
    float _309 = _307 + 1.0;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _323 = _305 * _309;
    float _325 = -_305;
    float _327 = _325 + 1.0;
    float _329 = fma(_313, _269, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _331 = fma(_317, _269, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _333 = _267 * _327;
    float _335 = -_267;
    float _337 = _335 + 1.0;
    float _339 = fma(_291, _255, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _341 = _329 * _333;
    float _343 = _331 * _333;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _345;
    float _349 = fma(_321, _255, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _351 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[143].x, _341);
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _353;
    float _357 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[143].y, _343);
    float _359 = fma(_347, _293, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _361 = fma(_339, _323, _351);
    float _363 = fma(_355, _293, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _365 = fma(_349, _323, _357);
    float _367 = fma(_359, _287, _361);
    float _369 = fma(_363, _287, _365);
    float _371 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[146].x, _367);
    float _373 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[146].y, _369);
    bool _375 = !_249;
    float _393;
    if (!_375)
    {
        float _377 = in.m_54.x;
        float _379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _381 = _377 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _383 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[11].x, _139);
        float _385 = _383 * _379;
        float _387 = floor(_385);
        float _389 = -_387;
        float _391 = _385 + _389;
        _393 = _391;
        _395 = true;
    }
    else
    {
        float _397 = float(_105);
        float _399 = 1.0 / _397;
        float _401 = _139 * _399;
        _393 = _401;
    }
    _395 = false;
    float _403 = _393;
    float _405 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _407 = int(_405);
    int _409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _411 = _409 != 0;
    float _413 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _415 = int(_413);
    float _417 = float(_407);
    float _419 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _421 = int(_419);
    float _423 = float(_415);
    float _425 = 1.0 / _417;
    float _427 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _429 = int(_427);
    float _431 = float(uint(_421));
    float _433 = 1.0 / _423;
    float _435 = _425 * _139;
    float _437 = 1.0 / _431;
    float _439 = float(uint(_429));
    int _441 = ~_429;
    int _443 = _441 + 1;
    float _445 = float(_429);
    float _447 = trunc(_435);
    int _449 = int(_447);
    float _451 = _433 * _139;
    float _453 = 1.0 / _439;
    int _455 = as_type<int>(_437) + (-2);
    float _457 = trunc(_451);
    int _459 = int(_457);
    float _461 = float(uint(_449));
    float _463 = as_type<float>(_455) * _461;
    int _465 = as_type<int>(_453) + (-2);
    float _467 = trunc(_463);
    float _469 = precise::max(_467, 0.0);
    uint _472 = uint(_469);
    float _474 = _453;
    if (_411)
    {
        float _476 = in.m_54.x;
        _474 = _476;
    }
    float _478 = _474;
    float _480 = _478;
    if (!_411)
    {
        float _482 = in.m_54.y;
        _480 = _482;
    }
    float _484 = _480;
    float _486 = float(uint(_459));
    float _488 = as_type<float>(_465) * _486;
    int _490 = ~_421;
    int _492 = _490 + 1;
    float _494 = trunc(_488);
    float _496 = precise::max(_494, 0.0);
    uint _498 = uint(_496);
    int _500 = _492 * int(_472);
    int _502 = _500 + _449;
    float _504 = float(uint(_502));
    float _506 = in.m_54.x;
    float _508 = in.m_54.y;
    float _510 = in.m_54.z;
    float _512 = in.m_54.w;
    float _514 = as_type<float>(_455) * _504;
    float _516 = _504;
    if (_411)
    {
        _516 = 1.0;
    }
    float _518 = _516;
    float _520 = _518;
    if (!_411)
    {
        _520 = 7.345489978790283203125;
    }
    float _522 = _520;
    int _524 = _443 * int(_498);
    int _526 = _524 + _459;
    float _528 = trunc(_514);
    float _530 = precise::max(_528, 0.0);
    uint _532 = uint(_530);
    float _534 = float(uint(_526));
    float _536 = float(_105);
    float _538 = float(_421);
    float _540 = as_type<float>(_465) * _534;
    float _542 = 1.0 / _536;
    float _544 = _522 * _506;
    int _546 = int(_472) + int(_532);
    float _548 = as_type<float>(_532);
    if (_411)
    {
        _548 = 1.0;
    }
    float _550 = _548;
    float _552 = trunc(_540);
    float _554 = precise::max(_552, 0.0);
    uint _556 = uint(_554);
    float _558 = float(_449);
    float _560 = _550;
    if (!_411)
    {
        _560 = 1.2345600128173828125;
    }
    float _562 = _560;
    float _564 = floor(_544);
    int _566 = ~_421;
    int _568 = _566 + 1;
    float _570 = _562 * _484;
    int _572 = _568 * _546;
    int _574 = _572 + _449;
    int _576 = int(_498) + int(_556);
    float _578 = floor(_570);
    int _580 = ~_429;
    int _582 = _580 + 1;
    bool _584 = _558 >= _538;
    bool _586 = isnan(_558);
    bool _588 = _584 || _586;
    bool _590 = isnan(_538);
    bool _592 = _588 || _590;
    float _594 = float(_592);
    bool _596 = uint(_574) >= uint(_421);
    int _598 = _582 * _576;
    int _600 = _598 + _459;
    float _602 = -_564;
    float _604 = _544 + _602;
    float _606 = float(_459);
    float _608 = trunc(_594);
    int _610 = int(_608);
    bool _612 = !_596;
    int _614 = _612 ? 0 : (-1);
    float _616 = _604 * _538;
    bool _618 = uint(_600) >= uint(_429);
    int _620 = ~_546;
    int _622 = _620 + _614;
    int _624 = _622 + 1;
    float _626 = trunc(_616);
    int _628 = int(_626);
    int _630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _632 = _630 != 0;
    int _634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _636 = _634 != 0;
    int _638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _640 = _638 != 0;
    float _642 = -_578;
    float _644 = _570 + _642;
    bool _646 = _606 >= _445;
    bool _648 = isnan(_606);
    bool _650 = _646 || _648;
    bool _652 = isnan(_445);
    bool _654 = _650 || _652;
    float _656 = float(_654);
    int _658 = _421 * _624;
    int _660 = _658 + _449;
    int _662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _664 = _662 != 0;
    bool _666 = !_618;
    int _668 = _666 ? 0 : (-1);
    bool _670 = !_636;
    int _672 = _670 ? 0 : 1;
    float _674 = trunc(_656);
    int _676 = int(_674);
    bool _678 = !_664;
    int _680 = _678 ? 0 : 1;
    bool _682 = _421 == 0;
    int _684 = ~_576;
    int _686 = _684 + _668;
    int _688 = _686 + 1;
    int _690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _692 = _690 != 0;
    int _694 = ~_610;
    int _696 = _694 + 1;
    int _698 = _696 + 1;
    bool _700 = !_682;
    int _702 = _700 ? _660 : (-1);
    int _704 = abs(_680);
    int _706 = _429 * _688;
    int _708 = _706 + _459;
    bool _710 = !_692;
    int _712 = _710 ? 0 : 1;
    float _714 = _542 * _139;
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _718 = _716 != 0;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _722 = _720 != 0;
    int _724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _726 = _724 != 0;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _730 = _728 != 0;
    int _732 = _702 * _698;
    int _734 = _421 + (-1);
    float _736 = _644 * _445;
    float _738 = _538 * _714;
    bool _740 = !_722;
    int _742 = _740 ? 0 : 1;
    float _744 = _445 * _714;
    int _746 = _610 * _734;
    int _748 = _746 + _732;
    bool _750 = _429 == 0;
    float _752 = trunc(_738);
    int _754 = int(_752);
    int _756 = ~_676;
    int _758 = _756 + 1;
    int _760 = _758 + 1;
    int _762 = _628 * _704;
    int _764 = _762 + _449;
    bool _766 = !_750;
    int _768 = _766 ? _708 : (-1);
    int _770 = abs(_672);
    int _772 = abs(_712);
    float _774 = trunc(_736);
    int _776 = int(_774);
    int _778 = _429 + (-1);
    int _780 = _768 * _760;
    int _782 = abs(_742);
    bool _784 = !_632;
    int _786 = _784 ? 0 : 1;
    int _788 = _676 * _778;
    int _790 = _788 + _780;
    float _792 = trunc(_744);
    int _794 = int(_792);
    int _796 = abs(_786);
    int _798 = _748 * _770;
    bool _800 = !_640;
    int _802 = _800 ? 0 : 1;
    int _804 = _790 * _782;
    int _806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _808 = _806 != 0;
    int _810 = _754 * _796;
    int _812 = _810 + _798;
    int _814 = abs(_802);
    int _816 = _776 * _772;
    int _818 = _816 + _459;
    bool _820 = !_718;
    int _822 = _820 ? 0 : 1;
    bool _824 = !_808;
    int _826 = _824 ? 0 : 1;
    bool _828 = !_726;
    int _830 = _828 ? 0 : 1;
    int _832 = abs(_822);
    int _834 = abs(_826);
    int _836 = _764 * _814;
    int _838 = _836 + _812;
    bool _840 = !_730;
    int _842 = _840 ? 0 : 1;
    int _844 = abs(_830);
    int _846 = abs(_842);
    int _848 = _794 * _832;
    int _850 = _848 + _804;
    int _852 = _628 * _834;
    int _854 = _852 + _838;
    float _856 = float(uint(_764));
    int _858 = _818 * _844;
    int _860 = _858 + _850;
    float _862 = float(uint(_854));
    int _864 = ~_421;
    int _866 = _864 + 1;
    int _868 = _776 * _846;
    int _870 = _868 + _860;
    float _872 = as_type<float>(_455) * _856;
    float _874 = as_type<float>(_455) * _862;
    float _876 = float(uint(_818));
    float _878 = float(uint(_870));
    float _880 = trunc(_874);
    float _882 = precise::max(_880, 0.0);
    uint _884 = uint(_882);
    float _886 = as_type<float>(_465) * _876;
    float _888 = as_type<float>(_465) * _878;
    int _890 = ~_429;
    int _892 = _890 + 1;
    int _894 = ~_421;
    int _896 = _894 + 1;
    int _898 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _900 = _898 != 0;
    float _902 = trunc(_888);
    float _904 = precise::max(_902, 0.0);
    uint _906 = uint(_904);
    int _908 = _866 * int(_884);
    int _910 = _908 + _854;
    float _912 = trunc(_872);
    float _914 = precise::max(_912, 0.0);
    uint _916 = uint(_914);
    float _918 = float(uint(_910));
    int _920 = _892 * int(_906);
    int _922 = _920 + _870;
    float _924 = trunc(_886);
    float _926 = precise::max(_924, 0.0);
    uint _928 = uint(_926);
    float _930 = as_type<float>(_455) * _918;
    float _932 = float(uint(_922));
    int _934 = _896 * int(_916);
    int _936 = _934 + _764;
    float _938 = as_type<float>(_465) * _932;
    float _940 = trunc(_930);
    float _942 = precise::max(_940, 0.0);
    uint _944 = uint(_942);
    float _946 = float(uint(_936));
    int _948 = ~_429;
    int _950 = _948 + 1;
    float _952 = trunc(_938);
    float _954 = precise::max(_952, 0.0);
    uint _956 = uint(_954);
    float _958 = as_type<float>(_455) * _946;
    int _960 = ~_421;
    int _962 = _960 + 1;
    int _964 = _950 * int(_928);
    int _966 = _964 + _818;
    float _968 = trunc(_958);
    float _970 = precise::max(_968, 0.0);
    uint _972 = uint(_970);
    int _974 = int(_884) + int(_944);
    int _976 = ~_429;
    int _978 = _976 + 1;
    float _980 = float(uint(_966));
    int _982 = _962 * _974;
    int _984 = _982 + _854;
    int _986 = int(_906) + int(_956);
    float _988 = as_type<float>(_465) * _980;
    bool _990 = uint(_984) >= uint(_421);
    int _992 = _978 * _986;
    int _994 = _992 + _870;
    int _996 = ~_421;
    int _998 = _996 + 1;
    int _1000 = int(_916) + int(_972);
    float _1002 = trunc(_988);
    float _1004 = precise::max(_1002, 0.0);
    uint _1006 = uint(_1004);
    bool _1008 = uint(_994) >= uint(_429);
    bool _1010 = !_990;
    int _1012 = _1010 ? 0 : (-1);
    int _1014 = _998 * _1000;
    int _1016 = _1014 + _764;
    bool _1018 = !_1008;
    int _1020 = _1018 ? 0 : (-1);
    int _1022 = ~_974;
    int _1024 = _1022 + _1012;
    int _1026 = _1024 + 1;
    int _1028 = ~_986;
    int _1030 = _1028 + _1020;
    int _1032 = _1030 + 1;
    bool _1034 = uint(_1016) >= uint(_421);
    int _1036 = _421 * _1026;
    int _1038 = _1036 + _854;
    int _1040 = _429 * _1032;
    int _1042 = _1040 + _870;
    bool _1044 = !_1034;
    int _1046 = _1044 ? 0 : (-1);
    bool _1048 = !_682;
    int _1050 = _1048 ? _1038 : (-1);
    bool _1052 = !_750;
    int _1054 = _1052 ? _1042 : (-1);
    int _1056 = ~_1000;
    int _1058 = _1056 + _1046;
    int _1060 = _1058 + 1;
    int _1062 = _1050 >> 31;
    int _1064 = _1054 >> 31;
    int _1066 = _421 * _1060;
    int _1068 = _1066 + _764;
    int _1070 = _1050 & 3;
    bool _1072 = _1070 != 0;
    int _1074 = _1062 & 3;
    int _1076 = _1064 & 3;
    int _1078 = _1050 & 3;
    bool _1080 = _1078 != 0;
    bool _1082 = _1070 != 3;
    int _1084 = _1054 + _1076;
    int _1086 = _1080 ? 0 : 1;
    int _1088 = _1050 + _1074;
    bool _1090 = uint(_1070) >= 2u;
    int _1092 = _1084 >> 2;
    int _1094 = _1088 >> 2;
    int _1096 = _1090 ? 0 : 1;
    int _1098 = _1092 << 4;
    int _1100 = _1098 + 512;
    int _1102 = _1094 << 4;
    int _1104 = _1102 + 368;
    bool _1106 = uint(_1070) > 1u;
    int _1108 = ~_1096;
    int _1110 = _1108 + 1;
    int _1112 = _1110 + 1;
    uint _1114 = uint(int(uint(_1104) >> uint(2)));
    uint _1116 = uint(int(uint(int(_1114)) >> uint(2)));
    int _1118 = int(_1114) & 3;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[int(_1116)][_1118];
    int _1122 = int(_1114) + 1;
    uint _1124 = uint(int(uint(_1122) >> uint(2)));
    int _1126 = _1122 & 3;
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[int(_1124)][_1126];
    int _1130 = _1112;
    if (_1082)
    {
        int _1132 = ~_1096;
        int _1134 = _1132 + 1;
        _1130 = _1134;
    }
    int _1136 = _1130;
    int _1138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1140 = _1138 != 0;
    int _1142 = int(_928) + int(_1006);
    int _1144 = ~_429;
    int _1146 = _1144 + 1;
    uint _1148 = uint(int(uint(_1100) >> uint(2)));
    uint _1150 = uint(int(uint(int(_1148)) >> uint(2)));
    int _1152 = int(_1148) & 3;
    float _1154 = (*spvDescriptorSet0.vp_c9)._m0[int(_1150)][_1152];
    int _1156 = int(_1148) + 1;
    uint _1158 = uint(int(uint(_1156) >> uint(2)));
    int _1160 = _1156 & 3;
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[int(_1158)][_1160];
    bool _1164 = !_1140;
    int _1166 = _1164 ? 0 : 1;
    int _1168 = _1054 & 3;
    bool _1170 = _1168 != 0;
    int _1172 = _1146 * _1142;
    int _1174 = _1172 + _818;
    int _1176 = ~_1086;
    int _1178 = _1176 + 1;
    int _1180 = _1178 + 1;
    int _1182 = _1180;
    if (!_1106)
    {
        int _1184 = ~_1086;
        int _1186 = _1184 + 1;
        _1182 = _1186;
    }
    int _1188 = _1182;
    int _1190 = _1100 + 8;
    uint _1192 = uint(int(uint(_1190) >> uint(2)));
    uint _1194 = uint(int(uint(int(_1192)) >> uint(2)));
    int _1196 = int(_1192) & 3;
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[int(_1194)][_1196];
    int _1200 = int(_1192) + 1;
    uint _1202 = uint(int(uint(_1200) >> uint(2)));
    int _1204 = _1200 & 3;
    float _1206 = (*spvDescriptorSet0.vp_c9)._m0[int(_1202)][_1204];
    int _1208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1210 = _1208 != 0;
    bool _1212 = !_682;
    int _1214 = _1212 ? _1068 : (-1);
    bool _1216 = uint(_1168) >= 2u;
    bool _1218 = !_1210;
    int _1220 = _1218 ? 0 : 1;
    bool _1222 = uint(_1168) > 1u;
    int _1224 = _1216 ? 0 : 1;
    bool _1226 = uint(_1174) >= uint(_429);
    bool _1228 = !_1072;
    int _1230 = _1228 ? 0 : 1;
    int _1232 = _1104 + 8;
    uint _1234 = uint(int(uint(_1232) >> uint(2)));
    uint _1236 = uint(int(uint(int(_1234)) >> uint(2)));
    int _1238 = int(_1234) & 3;
    float _1240 = (*spvDescriptorSet0.vp_c9)._m0[int(_1236)][_1238];
    int _1242 = int(_1234) + 1;
    uint _1244 = uint(int(uint(_1242) >> uint(2)));
    int _1246 = _1242 & 3;
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[int(_1244)][_1246];
    bool _1250 = _1168 != 3;
    int _1252 = _1054 & 3;
    bool _1254 = _1252 != 0;
    bool _1256 = !_1170;
    int _1258 = _1256 ? 0 : 1;
    bool _1260 = _512 > 0.5;
    int _1262 = _1254 ? 0 : 1;
    bool _1264 = _1070 != 3;
    int _1266 = ~_1262;
    int _1268 = _1266 + 1;
    int _1270 = _1268 + 1;
    int _1272 = _1270;
    if (!_1222)
    {
        int _1274 = ~_1262;
        int _1276 = _1274 + 1;
        _1272 = _1276;
    }
    int _1278 = _1272;
    bool _1280 = _1168 != 3;
    int _1282 = ~_1224;
    int _1284 = _1282 + 1;
    int _1286 = _1284 + 1;
    int _1288 = _1286;
    if (_1250)
    {
        int _1290 = ~_1224;
        int _1292 = _1290 + 1;
        _1288 = _1292;
    }
    int _1294 = _1288;
    bool _1296 = !_1264;
    int _1298 = _1296 ? 0 : (-1);
    bool _1300 = !_1280;
    int _1302 = _1300 ? 0 : (-1);
    int _1304 = abs(_1278);
    int _1306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1308 = _1306 != 0;
    int _1310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1312 = _1310 != 0;
    int _1314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1316 = _1314 != 0;
    int _1318 = abs(_1188);
    bool _1320 = !_1226;
    int _1322 = _1320 ? 0 : (-1);
    int _1324 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1326 = _1324 != 0;
    int _1328 = abs(_1230);
    float _1330 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1332 = int(_1330);
    int _1334 = ~_1142;
    int _1336 = _1334 + _1322;
    int _1338 = _1336 + 1;
    int _1340 = ~_1304;
    int _1342 = _1340 + 1;
    int _1344 = _1342 + 1;
    int _1346 = ~_1318;
    int _1348 = _1346 + 1;
    int _1350 = _1348 + 1;
    int _1352 = _429 * _1338;
    int _1354 = _1352 + _818;
    int _1356 = abs(_1258);
    int _1358 = _1344 * as_type<int>(_1162);
    int _1360 = ~_1328;
    int _1362 = _1360 + 1;
    int _1364 = _1362 + 1;
    int _1366 = _1350 * as_type<int>(_1128);
    float _1368 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1370 = int(_1368);
    int _1372 = abs(_1166);
    int _1374 = _1364 * as_type<int>(_1120);
    int _1376 = _1374 + _1366;
    int _1378 = ~_1356;
    int _1380 = _1378 + 1;
    int _1382 = _1380 + 1;
    int _1384 = abs(_1136);
    int _1386 = abs(_1294);
    int _1388 = _1382 * as_type<int>(_1154);
    int _1390 = _1388 + _1358;
    int _1392 = abs(_1332);
    int _1394 = ~_1386;
    int _1396 = _1394 + 1;
    int _1398 = _1396 + 1;
    int _1400 = abs(_1298);
    int _1402 = ~_1384;
    int _1404 = _1402 + 1;
    int _1406 = _1404 + 1;
    int _1408 = _1398 * as_type<int>(_1198);
    int _1410 = _1408 + _1390;
    float _1412 = float(uint(_1332));
    float _1414 = in.m_44.x;
    float _1416 = in.m_44.y;
    float _1418 = in.m_44.z;
    int _1420 = _1406 * as_type<int>(_1240);
    int _1422 = _1420 + _1376;
    int _1424 = abs(_1302);
    float _1426 = in.m_56.x;
    float _1428 = in.m_56.y;
    float _1430 = in.m_56.z;
    float _1432 = in.m_56.w;
    int _1434 = ~_1400;
    int _1436 = _1434 + 1;
    int _1438 = _1436 + 1;
    float _1440 = 1.0 / _1412;
    float _1442 = float(uint(_1370));
    int _1444 = abs(_1220);
    int _1446 = _1438 * as_type<int>(_1248);
    int _1448 = _1446 + _1422;
    float _1450 = in.m_58.x;
    float _1452 = in.m_58.y;
    float _1454 = in.m_58.z;
    float _1456 = in.m_58.w;
    int _1458 = ~_1372;
    int _1460 = _1458 + 1;
    int _1462 = _1460 + 1;
    float _1464 = 1.0 / _1442;
    int _1466 = abs(_1370);
    float _1468 = in.m_60.x;
    float _1470 = in.m_60.y;
    float _1472 = in.m_60.z;
    float _1474 = in.m_60.w;
    int _1476 = ~_1424;
    int _1478 = _1476 + 1;
    int _1480 = _1478 + 1;
    int _1482 = _1448 * _1462;
    int _1484 = ~_1444;
    int _1486 = _1484 + 1;
    int _1488 = _1486 + 1;
    int _1490 = _1480 * as_type<int>(_1206);
    int _1492 = _1490 + _1410;
    bool _1494 = !_750;
    int _1496 = _1494 ? _1354 : (-1);
    int _1498 = _1214 * _1372;
    int _1500 = _1498 + _1482;
    float _1502 = float(uint(_1392));
    int _1504 = _1492 * _1488;
    int _1506 = as_type<int>(_1440) + (-2);
    float _1508 = _1416 * _1428;
    float _1510 = float(uint(_1500));
    int _1512 = _1496 * _1444;
    int _1514 = _1512 + _1504;
    float _1516 = 1.0 / _1502;
    float _1518 = float(uint(_1466));
    float _1520 = fma(_1414, _1426, _1508);
    float _1522 = as_type<float>(_1506) * _1510;
    int _1524 = as_type<int>(_1464) + (-2);
    float _1526 = _1416 * _1452;
    float _1528 = float(uint(_1514));
    float _1530 = fma(_1418, _1430, _1520);
    float _1532 = 1.0 / _1518;
    int _1534 = abs(_1500);
    float _1536 = _1416 * _1470;
    float _1538 = as_type<float>(_1524) * _1528;
    float _1540 = _1530 + _1432;
    float _1542 = fma(_1414, _1468, _1536);
    float _1544 = trunc(_1522);
    float _1546 = precise::max(_1544, 0.0);
    uint _1548 = uint(_1546);
    int _1550 = as_type<int>(_1516) + (-2);
    float _1552 = fma(_1414, _1450, _1526);
    float _1554 = float(uint(_1534));
    float _1556 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1558 = abs(_1514);
    float _1560 = _506 * 2.0;
    float _1562 = trunc(_1538);
    float _1564 = precise::max(_1562, 0.0);
    uint _1566 = uint(_1564);
    int _1568 = ~_1332;
    int _1570 = _1568 + 1;
    float _1572 = as_type<float>(_1550) * _1554;
    int _1574 = as_type<int>(_1532) + (-2);
    float _1576 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1578 = float(uint(_1558));
    float _1580 = _508 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1582 = ~_1370;
    int _1584 = _1582 + 1;
    int _1586 = _1570 * int(_1548);
    int _1588 = _1586 + _1500;
    float _1590 = trunc(_1572);
    float _1592 = precise::max(_1590, 0.0);
    uint _1594 = uint(_1592);
    float _1596 = as_type<float>(_1574) * _1578;
    float _1598 = fma(_1580, -2.0, _1576);
    float _1600 = float(uint(_1588));
    float _1602 = _506 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1604 = ~_1466;
    int _1606 = _1604 + 1;
    int _1608 = _1584 * int(_1566);
    int _1610 = _1608 + _1514;
    float _1612 = trunc(_1596);
    float _1614 = precise::max(_1612, 0.0);
    uint _1616 = uint(_1614);
    float _1618 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1620 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1618;
    float _1622 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1624 = _1622 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    int _1626 = ~_1392;
    int _1628 = _1626 + 1;
    float _1630 = -_1556;
    float _1632 = fma(_1602, 2.0, _1630);
    float _1634 = float(uint(_1610));
    float _1636 = as_type<float>(_1506) * _1600;
    float _1638 = fma(_1418, _1472, _1542);
    float _1640 = 1.0 / _1624;
    int _1642 = _1628 * int(_1594);
    int _1644 = _1642 + _1534;
    float _1646 = as_type<float>(_1524) * _1634;
    float _1648 = fma(_1418, _1454, _1552);
    float _1650 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1652 = _403 + _1650;
    float _1654 = float(uint(_1644));
    float _1656 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1658 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1656;
    int _1660 = _1606 * int(_1616);
    int _1662 = _1660 + _1558;
    float _1664 = 1.0 / _1620;
    float _1666 = as_type<float>(_1550) * _1654;
    float _1668 = _506 + _508;
    float _1670 = float(uint(_1662));
    float _1672 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1674 = _403 + _1672;
    float _1676 = _1668 + (-1.0);
    float _1678 = trunc(_1636);
    float _1680 = precise::max(_1678, 0.0);
    uint _1682 = uint(_1680);
    float _1684 = as_type<float>(_1574) * _1670;
    float _1686 = _1674 * _1640;
    float _1688 = _510 + _508;
    float _1690 = _1648 + _1456;
    float _1692 = -_139;
    float _1694 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1632);
    float _1696 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1598);
    float _1698 = floor(_1560);
    float _1700 = _1652 * _1664;
    float _1702 = fma(_1676, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1704 = ~_1332;
    int _1706 = _1704 + 1;
    float _1708 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1710 = as_type<int>(_1652);
    if (_900)
    {
        _1710 = 0;
    }
    int _1712 = _1710;
    int _1714 = _1712;
    if (!_900)
    {
        _1714 = 1;
    }
    int _1716 = _1714;
    float _1718 = trunc(_1684);
    float _1720 = precise::max(_1718, 0.0);
    uint _1722 = uint(_1720);
    int _1724 = int(_1548) + int(_1682);
    float _1726 = _1688 + (-1.0);
    float _1728 = -_179;
    int _1730 = _1260 ? as_type<int>(_1728) : as_type<int>(_179);
    bool _1732 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1734 = isnan(_403);
    bool _1736 = _1732 || _1734;
    bool _1738 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1740 = _1736 || _1738;
    float _1742 = float(_1740);
    float _1744 = trunc(_1666);
    float _1746 = precise::max(_1744, 0.0);
    uint _1748 = uint(_1746);
    bool _1750 = _1698 > 0.0;
    float _1752 = fma(_1726, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1754 = _1698 >= 0.0;
    bool _1756 = isnan(_1698);
    bool _1758 = _1754 || _1756;
    bool _1760 = isnan(0.0);
    bool _1762 = _1758 || _1760;
    int _1764 = _1706 * _1724;
    int _1766 = _1764 + _1500;
    int _1768 = ~_1392;
    int _1770 = _1768 + 1;
    float _1772 = fma(_1658, _1700, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _1774 = !_1308;
    float _1776 = _1774 ? _179 : as_type<float>(_1730);
    float _1778 = trunc(_1646);
    float _1780 = precise::max(_1778, 0.0);
    uint _1782 = uint(_1780);
    int _1784 = int(_1616) + int(_1722);
    float _1786 = _508 * 2.0;
    bool _1788 = uint(_1766) >= uint(_1332);
    bool _1790 = _506 > 0.5;
    float _1792 = floor(_1786);
    int _1794 = int(_1594) + int(_1748);
    float _1796 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1796;
    int _1800 = ~_1370;
    int _1802 = _1800 + 1;
    bool _1804 = !_1788;
    int _1806 = _1804 ? 0 : (-1);
    int _1808 = _1770 * _1794;
    int _1810 = _1808 + _1534;
    float _1812 = -_175;
    int _1814 = _1790 ? as_type<int>(_1812) : as_type<int>(_175);
    float _1816 = fma(_1798, _1700, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    int _1818 = int(_1566) + int(_1782);
    bool _1820 = uint(_1810) >= uint(_1392);
    bool _1822 = _508 > 0.5;
    int _1824 = _1802 * _1818;
    int _1826 = _1824 + _1514;
    int _1828 = ~_1466;
    int _1830 = _1828 + 1;
    bool _1832 = !_1820;
    int _1834 = _1832 ? 0 : (-1);
    float _1836 = -_179;
    int _1838 = _1822 ? as_type<int>(_1836) : as_type<int>(_179);
    bool _1840 = uint(_1826) >= uint(_1370);
    bool _1842 = !_1326;
    float _1844 = _1842 ? _175 : as_type<float>(_1814);
    bool _1846 = _1716 != 1;
    int _1848 = _1830 * _1784;
    int _1850 = _1848 + _1558;
    bool _1852 = _510 > 0.5;
    bool _1854 = !_1312;
    float _1856 = _1854 ? _179 : as_type<float>(_1838);
    bool _1858 = !_1840;
    int _1860 = _1858 ? 0 : (-1);
    bool _1862 = _1792 > 0.0;
    bool _1864 = _1792 >= 0.0;
    bool _1866 = isnan(_1792);
    bool _1868 = _1864 || _1866;
    bool _1870 = isnan(0.0);
    bool _1872 = _1868 || _1870;
    float _1874 = _510 * 2.0;
    float _1876 = -_175;
    int _1878 = _1852 ? as_type<int>(_1876) : as_type<int>(_175);
    bool _1880 = uint(_1850) >= uint(_1466);
    int _1882 = ~_1724;
    int _1884 = _1882 + _1806;
    int _1886 = _1884 + 1;
    float _1888 = floor(_1874);
    bool _1890 = !_1316;
    float _1892 = _1890 ? _175 : as_type<float>(_1878);
    bool _1894 = _1332 == 0;
    int _1896 = _1332 * _1886;
    int _1898 = _1896 + _1500;
    float _1900 = as_type<float>(_1826);
    float _1902 = as_type<float>(_1830);
    float _1904 = as_type<float>(_1850);
    float _1906 = as_type<float>(_1724);
    if (!_1846)
    {
        _1900 = _508;
    }
    float _1908 = _1900;
    float _1910 = _1908;
    if (!_1846)
    {
        _1902 = _508;
    }
    float _1912 = _1902;
    float _1914 = _1912;
    if (!_1846)
    {
        _1904 = _510;
    }
    float _1916 = _1904;
    float _1918 = _1916;
    if (!_1846)
    {
        _1906 = _510;
    }
    float _1920 = _1906;
    float _1922 = _1920;
    if (_1846)
    {
        _1910 = _506;
    }
    float _1924 = _1910;
    if (_1846)
    {
        _1914 = _506;
    }
    float _1926 = _1914;
    if (_1846)
    {
        _1918 = _508;
    }
    float _1928 = _1918;
    if (_1846)
    {
        _1922 = _508;
    }
    float _1930 = _1922;
    bool _1932 = !_1880;
    int _1934 = _1932 ? 0 : (-1);
    float _1936 = _1928 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1938 = !_1894;
    int _1940 = _1938 ? _1898 : (-1);
    float _1942 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1942;
    int _1946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1948 = _1946 != 0;
    int _1950 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1952 = _1950 != 0;
    int _1954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1956 = _1954 != 0;
    bool _1958 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1960 = isnan(_403);
    bool _1962 = _1958 || _1960;
    bool _1964 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1966 = _1962 || _1964;
    float _1968 = float(_1966);
    float _1970 = fma(_1944, _1700, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _1972 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1974 = isnan(_403);
    bool _1976 = _1972 || _1974;
    bool _1978 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1980 = _1976 || _1978;
    float _1982 = float(_1980);
    float _1984 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1986 = _1984 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    int _1988 = _1762 ? 0 : 1;
    float _1990 = -_1968;
    float _1992 = _1990 + 1.0;
    bool _1994 = _1888 >= 0.0;
    bool _1996 = isnan(_1888);
    bool _1998 = _1994 || _1996;
    bool _2000 = isnan(0.0);
    bool _2002 = _1998 || _2000;
    float _2004 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _2006 = _2004 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _2008 = -_1982;
    float _2010 = _2008 + 1.0;
    float _2012 = _1982 * _1992;
    int _2014 = _2002 ? 0 : 1;
    float _2016 = fma(_1986, _1686, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    bool _2018 = _1888 > 0.0;
    float _2020 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _2022 = _2020 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _2024 = _1742 * _2010;
    float _2026 = -_1742;
    float _2028 = _2026 + 1.0;
    int _2030 = ~_1818;
    int _2032 = _2030 + _1860;
    int _2034 = _2032 + 1;
    float _2036 = fma(_2022, _1686, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _2038 = _1638 + _1474;
    float _2040 = _1970 * _2024;
    float _2042 = _1816 * _2024;
    float _2044 = _1772 * _2024;
    int _2046 = ~_1988;
    int _2048 = _2046 + 1;
    int _2050 = _2048 + 1;
    float _2052 = fma(_2028, (*spvDescriptorSet0.vp_c9)._m0[107].x, _2040);
    float _2054 = fma(_2028, (*spvDescriptorSet0.vp_c9)._m0[107].y, _2042);
    float _2056 = fma(_2028, (*spvDescriptorSet0.vp_c9)._m0[107].z, _2044);
    int _2058 = _2050;
    if (!_1750)
    {
        int _2060 = ~_1988;
        int _2062 = _2060 + 1;
        _2058 = _2062;
    }
    int _2064 = _2058;
    int _2066 = _1370 * _2034;
    int _2068 = _2066 + _1514;
    bool _2070 = _1370 == 0;
    float _2072 = fma(_2036, _2012, _2052);
    int _2074 = ~_1834;
    int _2076 = _1794 + _2074;
    int _2078 = _2076 + 1;
    float _2080 = fma(_1926, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1708);
    bool _2082 = !_2070;
    int _2084 = _2082 ? _2068 : (-1);
    float _2086 = fma(_2006, _1686, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _2088 = _1332 == 0;
    float _2090 = fma(_2016, _2012, _2054);
    int _2092 = _1500 ^ _1332;
    float _2094 = fma(_2086, _2012, _2056);
    float _2096 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    uint _2098 = uint(int(uint(_2092) >> uint(31)));
    float _2100 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2080);
    float _2102 = float(_1940);
    float _2104 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2106 = ~int(_2098);
    int _2108 = _2106 + 1;
    float _2110 = fma(_1968, (*spvDescriptorSet0.vp_c9)._m0[109].x, _2072);
    float _2112 = fma(_1930, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2104);
    int _2114 = _2078 ^ _2108;
    float _2116 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2118 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2112);
    int _2120 = ~_2108;
    int _2122 = _2120 + _2114;
    int _2124 = _2122 + 1;
    float _2126 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2128 = _1924 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2130 = _2096 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2132 = !_2088;
    int _2134 = _2132 ? _2124 : (-1);
    float _2136 = fma(_1968, (*spvDescriptorSet0.vp_c9)._m0[109].y, _2090);
    bool _2138 = _1370 == 0;
    float _2140 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2142 = _1514 ^ _1370;
    float _2144 = -_2126;
    float _2146 = fma(_2128, 2.0, _2144);
    int _2148 = ~_1934;
    int _2150 = _1784 + _2148;
    int _2152 = _2150 + 1;
    float _2154 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    uint _2156 = uint(int(uint(_2142) >> uint(31)));
    float _2158 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2160 = _1690 + _2158;
    float _2162 = fma(_2130, _2102, _1694);
    float _2164 = fma(_1936, -2.0, _2154);
    int _2166 = ~int(_2156);
    int _2168 = _2166 + 1;
    float _2170 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2172 = _1540 + _2170;
    float _2174 = _2160 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2176 = _1844 + 0.5;
    int _2178 = _2152 ^ _2168;
    float _2180 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2182 = _2038 + _2180;
    float _2184 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2174);
    float _2186 = _2140 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2188 = ~_2168;
    int _2190 = _2188 + _2178;
    int _2192 = _2190 + 1;
    float _2194 = _2116 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2198 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2184);
    float _2200 = float(_2134);
    float _2202 = fma(_2130, _2176, _2162);
    float _2204 = float(_2084);
    float _2206 = -_139;
    float _2208 = fma(_2206, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2146);
    bool _2210 = !_2138;
    int _2212 = _2210 ? _2192 : (-1);
    float _2214 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2216 = -_1696;
    float _2218 = fma(_2194, _2200, _2216);
    bool _2220 = _2198 >= 0.0;
    float _2222 = _1856 + (-0.5);
    float _2224 = fma(_2186, _2204, _2208);
    float _2226 = _1892 + 0.5;
    float _2228 = float(_2212);
    float _2230 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2214);
    float _2232 = _2196 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2234 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2164);
    float _2236 = -_2194;
    float _2238 = fma(_2236, _2222, _2218);
    float _2240 = fma(_2186, _2226, _2224);
    float _2242 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2230);
    float _2244 = -_2234;
    float _2246 = fma(_2232, _2228, _2244);
    float _2248 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2250 = log2(_2248);
    float _2252 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2254 = _1776 + (-0.5);
    float _2256 = -_2242;
    float _2258 = _2256 + 1.0;
    int _2260 = ~_2014;
    int _2262 = _2260 + 1;
    int _2264 = _2262 + 1;
    float _2266 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2252);
    float _2268 = -_2100;
    float _2270 = _2268 + 1.0;
    float _2272 = -_2232;
    float _2274 = fma(_2272, _2254, _2246);
    float _2276 = -_2258;
    float _2278 = fma(_1844, _2276, _2202);
    float _2280 = -_2118;
    float _2282 = _2280 + 1.0;
    bool _2284 = !_1948;
    int _2286 = _2284 ? 0 : 1;
    float _2288 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2266);
    int _2290 = _2264;
    float _2292 = _2136;
    if (!_2018)
    {
        int _2294 = ~_2014;
        int _2296 = _2294 + 1;
        _2290 = _2296;
    }
    int _2298 = _2290;
    float _2300 = fma(_1776, _2282, _2274);
    int _2302 = abs(_2286);
    float _2304 = _2160 * _2160;
    float _2306 = -_2270;
    float _2308 = fma(_1892, _2306, _2240);
    float _2310 = -_2288;
    float _2312 = _2310 + 1.0;
    float _2314 = _2250 * _139;
    float _2316 = float(_2302);
    float _2318 = fma(_2172, _2172, _2304);
    float _2320 = float(_2298);
    float _2322 = _2110 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2324 = fma(_1856, _2312, _2238);
    float _2326 = fma(_2182, _2182, _2318);
    float _2328 = fma(_1968, (*spvDescriptorSet0.vp_c9)._m0[109].z, _2094);
    float _2330 = exp2(_2314);
    float _2332 = _2316 * _2320;
    float _2334 = _2328 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2336 = _2136 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    if (_2220)
    {
        _2292 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2338 = _2292;
    float _2340 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2342 = 1.0 + _2340;
    float _2344 = rsqrt(_2326);
    float _2346 = in.m_62.x;
    float _2348 = in.m_62.y;
    float _2350 = in.m_62.z;
    float _2352 = _2322 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2354 = _2336 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2356 = _2334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2358 = as_type<int>(_2338);
    if (_2220)
    {
        float _2360 = _2338 * 5.0;
        _2358 = as_type<int>(_2360);
    }
    int _2362 = _2358;
    bool _2364 = !_1952;
    int _2366 = _2364 ? 0 : 1;
    out.m_64.x = _2278;
    out.m_64.y = _2324;
    out.m_64.z = _2308;
    out.m_64.w = _2300;
    float _2368 = 1.0 / _2342;
    float _2370 = -_2330;
    float _2372 = _2370 + 1.0;
    bool _2374 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2376 = isnan(0.0);
    bool _2378 = _2374 || _2376;
    bool _2380 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2382 = _2378 || _2380;
    out.m_66.x = _2352;
    out.m_66.y = _2354;
    out.m_66.z = _2356;
    bool _2384 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2386 = isnan(1.0);
    bool _2388 = _2384 || _2386;
    bool _2390 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2392 = _2388 || _2390;
    int _2394 = _1872 ? 0 : 1;
    if (_2220)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7089 = as_type<float>(_2362);
        out.gl_Position.z = _7089;
    }
    bool _2396 = !_1956;
    int _2398 = _2396 ? 0 : 1;
    float _2400 = _2160 * _2344;
    if (_2220)
    {
        out.m_47.x = 0.0;
    }
    int _2402 = abs(_2366);
    float _2404 = _2172 * _2344;
    if (_2220)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2406 = -_2400;
    float _2408 = fma(_2406, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1690);
    float _2410 = _2182 * _2344;
    float _2412 = -_2404;
    float _2414 = fma(_2412, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1540);
    float _2416 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2418 = _2408 + _2416;
    float _2420 = -_2410;
    float _2422 = fma(_2420, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2038);
    float _2424 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2426 = _2414 + _2424;
    int _2428 = ~_2394;
    int _2430 = _2428 + 1;
    int _2432 = _2430 + 1;
    float _2434 = _2418 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2436 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2438 = _2422 + _2436;
    float _2440 = float(_2064);
    float _2442 = _508 + (-0.5);
    float _2444 = fma(_2426, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2434);
    float _2446 = float(_2402);
    int _2448 = _2432;
    float _2450 = _2426;
    float _2452 = _2418;
    float _2454 = _2438;
    if (!_1862)
    {
        int _2456 = ~_2394;
        int _2458 = _2456 + 1;
        _2448 = _2458;
    }
    int _2460 = _2448;
    float _2462 = _2332 * (-2.0);
    float _2464 = fma(_2438, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2444);
    float _2466 = _2382 ? _2372 : 0.0;
    float _2468 = _2446 * _2440;
    float _2470 = _506 + (-0.5);
    float _2472 = fma(_2462, _2346, _2346);
    bool _2474 = _2464 >= 0.0;
    if (_2392)
    {
        float _2476 = _2466 * _2368;
        _143 = _2476;
    }
    float _2478 = _143;
    float _2480 = fma(_1702, _2462, _1702);
    float _2482 = fma(_2470, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2472);
    float _2484 = _2468 * (-2.0);
    int _2486 = abs(_2398);
    float _2488 = fma(_2480, _2478, _2482);
    float _2490 = fma(_2484, _2348, _2348);
    float _2492 = fma(_1752, _2484, _1752);
    float _2494 = _2488 * 0.15915493667125701904296875;
    float _2496 = fma(_2442, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2490);
    float _2498 = _2484;
    if (_2474)
    {
        _2498 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2500 = _2498;
    int _2502 = as_type<int>(_2500);
    if (_2474)
    {
        out.m_47.x = 0.0;
    }
    float _2504 = _2494 * 6.283185482025146484375;
    float _2506 = sin(_2504);
    float _2508 = fma(_2492, _2478, _2496);
    float _2510 = float(_2460);
    if (_2474)
    {
        float _2512 = _2500 * 5.0;
        _2502 = as_type<int>(_2512);
    }
    int _2514 = _2502;
    float _2516 = float(_2486);
    float _2518 = _2494 * 6.283185482025146484375;
    float _2520 = cos(_2518);
    if (_2474)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7295 = as_type<float>(_2514);
        out.gl_Position.z = _7295;
    }
    float _2522 = _2516 * _2510;
    if (_2474)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2524 = -_1690;
    float _2526 = _2524 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2528 = _510 + _506;
    float _2530 = _2508 * 0.15915493667125701904296875;
    float _2532 = -_1540;
    float _2534 = _2532 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2536 = _2526 * _2526;
    float _2538 = _2528 + (-1.0);
    float _2540 = -_2038;
    float _2542 = _2540 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2544 = -_2400;
    float _2546 = fma(_2544, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2160);
    float _2548 = fma(_2534, _2534, _2536);
    float _2550 = fma(_2538, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2552 = _2522 * (-2.0);
    float _2554 = _510 + (-0.5);
    float _2556 = fma(_2542, _2542, _2548);
    float _2558 = in.m_68.x;
    float _2560 = in.m_68.y;
    float _2562 = fma(_2552, _2350, _2350);
    float _2564 = -_2404;
    float _2566 = fma(_2564, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2172);
    float _2568 = _2546 * _2546;
    float _2570 = fma(_2550, _2552, _2550);
    float _2572 = rsqrt(_2556);
    float _2574 = fma(_2554, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2562);
    float _2576 = fma(_2566, _2566, _2568);
    float _2578 = -_2410;
    float _2580 = fma(_2578, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2182);
    float _2582 = fma(_2570, _2478, _2574);
    bool _2584 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2586 = isnan(0.5);
    bool _2588 = _2584 || _2586;
    bool _2590 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2592 = _2588 || _2590;
    float _2594 = fma(_2580, _2580, _2576);
    float _2596 = _2530 * 6.283185482025146484375;
    float _2598 = sin(_2596);
    float _2600 = _2582 * 0.15915493667125701904296875;
    float _2602 = _2534 * _2572;
    float _2604 = sqrt(_2594);
    float _2606 = _2542 * _2572;
    float _2608 = _373 * _2560;
    float _2610 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2612 = _2602 * _2610;
    float _2614 = _2526 * _2572;
    float _2616 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2618 = _2606 * _2616;
    float _2620 = _371 * _2558;
    float _2622 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2624 = -_2612;
    float _2626 = fma(_2606, _2622, _2624);
    float _2628 = _2530 * 6.283185482025146484375;
    float _2630 = cos(_2628);
    float _2632 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2634 = _2614 * _2632;
    float _2636 = _2506 * _2598;
    float _2638 = _2620 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2640 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _179);
    float _2642 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2644 = -_2634;
    float _2646 = fma(_2602, _2642, _2644);
    float _2648 = _2608 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2650 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _175);
    float _2652 = _2600 * 6.283185482025146484375;
    float _2654 = sin(_2652);
    float _2656 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2658 = -_2618;
    float _2660 = fma(_2614, _2656, _2658);
    float _2662 = _2626 * _2626;
    float _2664 = _2344 * _2604;
    float _2666 = fma(_2660, _2660, _2662);
    float _2668 = _2664 * _2648;
    float _2670 = _2600 * 6.283185482025146484375;
    float _2672 = cos(_2670);
    float _2674 = _2520 * _2630;
    float _2676 = fma(_2646, _2646, _2666);
    float _2678 = _2520 * _2598;
    float _2680 = _2506 * _2630;
    float _2682 = _2640 * _2668;
    float _2684 = rsqrt(_2676);
    float _2686 = fma(_2654, _2674, _2636);
    float _2688 = fma(_2654, _2636, _2674);
    float _2690 = _2520 * _2672;
    float _2692 = _2630 * _2672;
    float _2694 = _2506 * _2672;
    float _2696 = _2598 * _2672;
    float _2698 = _2664 * _2638;
    float _2700 = _2690 * _2682;
    float _2702 = -_2678;
    float _2704 = fma(_2654, _2680, _2702);
    float _2706 = -_2680;
    float _2708 = fma(_2654, _2678, _2706);
    float _2710 = _2650 * _2698;
    float _2712 = _2660 * _2684;
    float _2714 = _2646 * _2684;
    float _2716 = -_2682;
    float _2718 = _2654 * _2716;
    float _2720 = fma(_2686, _2710, _2700);
    float _2722 = _2626 * _2684;
    float _2724 = _2664 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2726 = _2724 * 0.5;
    float _2728 = _2614 * _2712;
    float _2730 = _2694 * _2682;
    float _2732 = fma(_2692, _2710, _2718);
    float _2734 = fma(_2708, _2726, _2720);
    float _2736 = _2606 * _2722;
    float _2738 = -_2728;
    float _2740 = fma(_2602, _2722, _2738);
    float _2742 = fma(_2704, _2710, _2730);
    float _2744 = fma(_2696, _2726, _2732);
    float _2746 = -_2736;
    float _2748 = fma(_2614, _2714, _2746);
    float _2750 = _2740 * _2734;
    float _2752 = fma(_2688, _2726, _2742);
    float _2754 = _2602 * _2714;
    float _2756 = _2748 * _2734;
    float _2758 = fma(_2714, _2744, _2750);
    float _2760 = -_2754;
    float _2762 = fma(_2606, _2712, _2760);
    float _2764 = fma(_2712, _2744, _2756);
    float _2766 = fma(_2606, _2752, _2758);
    float _2768 = _2762 * _2734;
    float _2770 = fma(_2602, _2752, _2764);
    float _2772 = _2038 + _2766;
    float _2774 = _1540 + _2770;
    float _2776 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2778 = _2772 + _2776;
    float _2780 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2782 = _2774 + _2780;
    float _2784 = _2778 * _2778;
    float _2786 = fma(_2782, _2782, _2784);
    float _2788 = fma(_2722, _2744, _2768);
    float _2790 = sqrt(_2786);
    float _2792 = fma(_2614, _2752, _2788);
    float _2794 = _1690 + _2792;
    bool _2796 = _2790 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2798 = _2788;
    float _2800 = _2752;
    float _2802 = _2768;
    if (!_2796)
    {
        _2798 = _2774;
    }
    float _2804 = _2798;
    float _2806 = _2804;
    if (!_2796)
    {
        _2800 = _2772;
    }
    float _2808 = _2800;
    float _2810 = _2808;
    if (!_2796)
    {
        _2802 = _2794;
    }
    float _2812 = _2802;
    bool _2814 = !_2796;
    float _2816 = _2812;
    if (!_2814)
    {
        float _2818 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2820 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2822 = _2790 + _2820;
        float _2824 = rsqrt(_2786);
        float _2826 = _2822 * _2818;
        float _2828 = _2794 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2830 = _2826 * 0.15915493667125701904296875;
        float _2832 = _2830 * 6.283185482025146484375;
        float _2834 = cos(_2832);
        float _2836 = _2830 * 6.283185482025146484375;
        float _2838 = sin(_2836);
        float _2840 = _2834 + (-1.0);
        float _2842 = _2840 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2844 = fma(_2838, _2828, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2846 = fma(_2794, _2834, _2842);
        float _2848 = _2824 * _2844;
        float _2850 = fma(_2782, _2848, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2852 = fma(_2778, _2848, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2806 = _2850;
        _2816 = _2846;
        _2810 = _2852;
    }
    float _2854 = _2806;
    float _2856 = _2816;
    float _2858 = _2810;
    float _2860 = -_2404;
    float _2862 = fma(_2860, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2854);
    float _2864 = -_2400;
    float _2866 = fma(_2864, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2856);
    float _2868 = -_2410;
    float _2870 = fma(_2868, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2858);
    float _2872 = _2866;
    float _2874 = _2862;
    float _2876 = _2870;
    float _2878 = _2856;
    if (!_2592)
    {
        float _2880 = _2418 * _2418;
        float _2882 = 1.0 / _2664;
        float _2884 = -_1540;
        float _2886 = _2884 + _2854;
        float _2888 = -_1690;
        float _2890 = _2888 + _2856;
        float _2892 = fma(_2426, _2426, _2880);
        float _2894 = -_2038;
        float _2896 = _2894 + _2858;
        float _2898 = fma(_2438, _2438, _2892);
        float _2900 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2902 = sqrt(_2898);
        float _2904 = precise::min(_2902, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2906 = _2904 * _2900;
        float _2908 = _2906 * _2882;
        float _2910 = fma(_2886, _2908, _2414);
        float _2912 = fma(_2890, _2908, _2408);
        float _2914 = fma(_2896, _2908, _2422);
        _2872 = _2912;
        _2874 = _2910;
        _2876 = _2914;
        _2450 = _2902;
        _2452 = _2900;
        _2878 = _2890;
    }
    float _2916 = _2872;
    float _2918 = _2874;
    float _2920 = _2876;
    float _2922 = _2450;
    float _2924 = _2452;
    float _2926 = _2878;
    float _2928 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2930 = _2916 + _2928;
    float _2932 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2934 = _2918 + _2932;
    float _2936 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2938 = _2920 + _2936;
    float _2940 = _2930 * _2930;
    float _2942 = fma(_2934, _2934, _2940);
    float _2944 = fma(_2938, _2938, _2942);
    float _2946 = rsqrt(_2944);
    float _2948 = _2946 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2950 = _2934 * _2948;
    float _2952 = _2938 * _2948;
    float _2954 = _2950 * _2950;
    float _2956 = _2952 * _2952;
    float _2958 = _2954 + _2956;
    float _2960 = sqrt(_2958);
    bool _2962 = _2960 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2964 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2966 = _2960 + _2964;
    float _2968 = _2946;
    float _2970 = _2924;
    float _2972 = _2966;
    float _2974 = _2922;
    float _2976 = _2930;
    float _2978 = _2926;
    if (_2962)
    {
        float _2980 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2968 = _2980;
    }
    float _2982 = _2968;
    if (_2962)
    {
        float _2984 = rsqrt(_2958);
        _2970 = _2984;
    }
    float _2986 = _2970;
    float _2988 = _2986;
    if (_2962)
    {
        float _2990 = _2966 * _2982;
        _2972 = _2990;
    }
    float _2992 = _2972;
    if (_2962)
    {
        float _2994 = _2992 * 0.15915493667125701904296875;
        _2974 = _2994;
    }
    float _2996 = _2974;
    float _2998 = _2938;
    if (_2962)
    {
        float _3000 = _2996 * 6.283185482025146484375;
        float _3002 = sin(_3000);
        _2998 = _3002;
    }
    float _3004 = _2998;
    float _3006 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3008 = precise::max(0.0, _3006);
    float _3010 = _2422;
    float _3012 = _3008;
    if (_2962)
    {
        float _3014 = _2996 * 6.283185482025146484375;
        float _3016 = cos(_3014);
        _3010 = _3016;
    }
    float _3018 = _3010;
    float _3020 = -_2948;
    float _3022 = -_3008;
    float _3024 = fma(_2930, _3020, _3022);
    if (_2962)
    {
        float _3026 = _3024 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3012 = _3026;
    }
    float _3028 = _3012;
    float _3030 = sqrt(_2944);
    float _3032 = _3028;
    float _3034 = _3004;
    if (_2962)
    {
        float _3036 = fma(_3004, _3028, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3032 = _3036;
    }
    float _3038 = _3032;
    float _3040 = _3038;
    if (!_2962)
    {
        _3034 = _3024;
    }
    float _3042 = _3034;
    float _3044 = _3042;
    float _3046 = _3018;
    if (_2962)
    {
        float _3048 = _3018 + (-1.0);
        _2976 = _3048;
    }
    float _3050 = _2976;
    float _3052 = _3050;
    if (_2962)
    {
        float _3054 = _2986 * _3038;
        _2978 = _3054;
    }
    float _3056 = _2978;
    if (!_2962)
    {
        _2988 = _2950;
    }
    float _3058 = _2988;
    float _3060 = _2916 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3062 = _3058;
    if (_2962)
    {
        float _3064 = _3050 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2454 = _3064;
    }
    float _3066 = _2454;
    if (_2962)
    {
        float _3068 = _2950 * _3056;
        _3062 = _3068;
    }
    float _3070 = _3062;
    if (!_2962)
    {
        _3052 = _2952;
    }
    float _3072 = _3052;
    float _3074 = _3072;
    if (_2962)
    {
        float _3076 = _2952 * _3056;
        _3074 = _3076;
    }
    float _3078 = _3074;
    if (!_2962)
    {
        _3040 = _2954;
    }
    float _3080 = _3040;
    float _3082 = _3080;
    if (_2962)
    {
        float _3084 = fma(_3024, _3018, _3066);
        _3044 = _3084;
    }
    float _3086 = _3044;
    if (_2962)
    {
        float _3088 = _3070 * _3070;
        _3082 = _3088;
    }
    float _3090 = _3082;
    if (!_2962)
    {
        _3046 = _2956;
    }
    float _3092 = _3046;
    float _3094 = _3092;
    if (_2962)
    {
        float _3096 = _3078 * _3078;
        _3094 = _3096;
    }
    float _3098 = _3094;
    float _3100 = fma(_2918, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3060);
    float _3102 = fma(_3086, _3086, _3090);
    float _3104 = _2916 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3106 = fma(_2920, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3100);
    float _3108 = _3102 + _3098;
    float _3110 = _2916 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3112 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3114 = fma(_3030, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3112);
    float _3116 = precise::clamp(_3114, 0.0, 1.0);
    float _3118 = _2916 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3120 = fma(_2918, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3104);
    float _3122 = fma(_2918, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3110);
    float _3124 = rsqrt(_3108);
    float _3126 = -_3116;
    float _3128 = _3126 + 1.0;
    float _3130 = fma(_2918, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3118);
    float _3132 = fma(_2920, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3122);
    float _3134 = _3106 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3136 = fma(_2920, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3120);
    float _3138 = fma(_2920, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3130);
    float _3140 = _3132 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3142 = abs(_3128);
    float _3144 = log2(_3142);
    float _3146 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3148 = _3138 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3150 = _3140 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3152 = _3134 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3154 = _3136 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3156 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3150);
    float _3158 = _3124 * _3070;
    float _3160 = _3124 * _3086;
    float _3162 = _3124 * _3078;
    float _3164 = fma(_3134, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3156);
    float _3166 = _3158 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3168 = -_3152;
    float _3170 = fma(_3168, _3146, 1.0);
    float _3172 = fma(_3154, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3164);
    float _3174 = -_3166;
    float _3176 = fma(_3160, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3174);
    float _3178 = _3144 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3180 = _3140 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3182 = log2(_3170);
    float _3184 = -_3162;
    float _3186 = fma(_3184, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3176);
    float _3188 = _3140 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3190 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3180);
    float _3192 = _3160 + 1.0;
    float _3194 = fma(_3186, -0.5, 0.5);
    float _3196 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3188);
    float _3198 = fma(_3186, 0.5, 0.5);
    float _3200 = 1.0 / _3172;
    float _3202 = fma(_3134, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3190);
    float _3204 = fma(_3134, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3196);
    float _3206 = fma(_3198, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3208 = fma(_3154, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3204);
    float _3210 = fma(_3154, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3202);
    float _3212 = exp2(_3178);
    float _3214 = fma(_3198, _3206, -0.212114393711090087890625);
    float _3216 = _3182 * 0.693147182464599609375;
    float _3218 = _3216 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3220 = sqrt(_3194);
    float _3222 = _3208 * _3200;
    float _3224 = _3210 * _3200;
    float _3226 = fma(_3224, -0.5, 0.5);
    float _3228 = -_3160;
    float _3230 = fma(_3212, _3192, _3228);
    float _3232 = fma(_3198, _3214, 1.570728778839111328125);
    float _3234 = fma(_3222, 0.5, 0.5);
    float _3236 = fma(_3230, 0.5, 0.5);
    float _3238 = _3220 * 0.636619746685028076171875;
    float _3240 = -_3232;
    float _3242 = fma(_3238, _3240, 1.0);
    float3 _8447 = float3(_3234, _3226, _3218);
    float _3244 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8447, float3(0.0), isnan(_8447)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8447, float3(0.0), isnan(_8447)), level(0.0)).x;
    float3 _8458 = float3(_3234, _3226, _3218);
    float4 _3247 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8458, float3(0.0), isnan(_8458)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8458, float3(0.0), isnan(_8458)), level(0.0)).xyzw;
    float _3249 = _3247.x;
    float _3251 = _3247.y;
    float _3253 = _3247.z;
    float _3255 = _3247.w;
    float2 _8475 = float2(_3242, _3236);
    float3 _3259 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8475, float2(0.0), isnan(_8475)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8475, float2(0.0), isnan(_8475)), level(0.0)).xyz;
    float _3261 = _3259.x;
    float _3263 = _3259.y;
    float _3265 = _3259.z;
    float _3267 = _2686 * _2748;
    float _3269 = _2686 * _2762;
    float _3271 = _2686 * _2740;
    float _3273 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3275 = _2690 * _2748;
    float _3277 = _2690 * _2762;
    float _3279 = _2708 * _2748;
    float _3281 = _2708 * _2762;
    float _3283 = _2690 * _2740;
    float _3285 = _2708 * _2740;
    float _3287 = fma(_2692, _2712, _3267);
    float _3289 = fma(_2692, _2722, _3269);
    float _3291 = fma(_2692, _2714, _3271);
    float _3293 = fma(_3273, _3273, 1.0);
    float _3295 = _3144 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3297 = -_2654;
    float _3299 = fma(_3297, _2712, _3275);
    float _3301 = -_2654;
    float _3303 = fma(_3301, _2722, _3277);
    float _3305 = -_2654;
    float _3307 = fma(_3305, _2714, _3283);
    float _3309 = fma(_2696, _2712, _3279);
    float _3311 = rsqrt(_3293);
    float _3313 = fma(_2696, _2722, _3281);
    float _3315 = fma(_2696, _2714, _3285);
    float _3317 = fma(_2694, _2602, _3299);
    float _3319 = fma(_2688, _2602, _3309);
    float _3321 = fma(_2694, _2614, _3303);
    float _3323 = fma(_2694, _2606, _3307);
    float _3325 = fma(_2704, _2602, _3287);
    float _3327 = exp2(_3295);
    float _3329 = fma(_2704, _2614, _3289);
    float _3331 = fma(_2704, _2606, _3291);
    float _3333 = fma(_2688, _2614, _3313);
    float _3335 = fma(_2688, _2606, _3315);
    float _3337 = _3140 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3339 = _175 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3341 = _3273 * _3317;
    float _3343 = _3273 * _3311;
    float _3345 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3337);
    out.m_70.x = _3325;
    out.m_70.y = _3329;
    out.m_70.z = _3331;
    float _3347 = fma(_3339, _3325, _3341);
    float _3349 = -_3319;
    float _3351 = _3343 * _3349;
    float _3353 = _3273 * _3321;
    float _3355 = fma(_3134, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3345);
    out.m_72.x = _2918;
    out.m_72.y = _2916;
    out.m_72.z = _2920;
    float _3357 = -_3327;
    float _3359 = _3357 + 1.0;
    float _3361 = fma(_3311, _3317, _3351);
    float _3363 = fma(_3339, _3329, _3353);
    float _3365 = fma(_3154, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3355);
    float _3367 = _3359 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3369 = -_3333;
    float _3371 = _3343 * _3369;
    float _3373 = -_3335;
    float _3375 = _3343 * _3373;
    bool _3377 = _3030 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3379 = isnan(_3030);
    bool _3381 = _3377 || _3379;
    bool _3383 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3385 = _3381 || _3383;
    float _3387 = fma(_3311, _3321, _3371);
    float _3389 = _3273 * _3323;
    float _3391 = _3365 + _3172;
    float _3393 = fma(_3311, _3323, _3375);
    float _3395 = _3333 + _3363;
    float _3397 = fma(_3339, _3331, _3389);
    float _3399 = _3319 + _3347;
    float _3401 = _3391 * 0.5;
    out.m_74.x = _3361;
    out.m_74.y = _3387;
    out.m_74.z = _3393;
    float _3403 = _3335 + _3397;
    out.m_76.z = _3401;
    out.m_76.w = _3172;
    out.m_78.x = _3399;
    out.m_78.y = _3395;
    out.m_78.z = _3403;
    out.gl_Position.x = _3208;
    out.gl_Position.y = _3210;
    out.gl_Position.z = _3365;
    out.gl_Position.w = _3172;
    float _3405 = _3172;
    float _3407 = _3365;
    float _3409 = _3210;
    float _3411 = _3208;
    if (!_3385)
    {
        _3405 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3413 = _3405;
    float _3415 = _3413;
    float _3417 = _3413;
    if (!_3385)
    {
        _3407 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3419 = _3407;
    float _3421 = _3419;
    float _3423 = _3419;
    if (!_3385)
    {
        _3409 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3425 = _3409;
    float _3427 = _3425;
    float _3429 = _3425;
    if (!_3385)
    {
        _3411 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3431 = _3411;
    float _3433 = _3367 * _3244;
    float _3435 = -_3367;
    float _3437 = _3435 + 1.0;
    float _3439 = _3255 * _3433;
    float _3441 = _3265 * _3433;
    float _3443 = _3255 * _3437;
    float _3445 = fma(_3261, _3439, _3249);
    float _3447 = fma(_3263, _3439, _3251);
    float _3449 = fma(_3255, _3441, _3253);
    float _3451 = _3251;
    float _3453 = _3249;
    float _3455 = _3431;
    float _3457 = _3431;
    if (!_3385)
    {
        _3451 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3459 = _3451;
    float _3461 = _3459;
    float _3463 = _3459;
    if (!_3385)
    {
        _3453 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3465 = _3453;
    out.m_80.x = _3445;
    out.m_80.y = _3447;
    out.m_80.z = _3449;
    out.m_80.w = _3443;
    bool _3467 = !_3385;
    float _3469 = _3465;
    float _3471 = _3465;
    if (!_3467)
    {
        bool _3473 = _3030 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3475 = isnan(_3030);
        bool _3477 = _3473 || _3475;
        bool _3479 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3481 = _3477 || _3479;
        if (!_3481)
        {
            float _3483 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3485 = _3030 + _3483;
            float _3487 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3489 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3487;
            float _3491 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3493 = _3491 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3495 = 1.0 / _3489;
            float _3497 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3499 = _3497 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3501 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3503 = _3501 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3505 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3507 = _3505 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3509 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3511 = _3509 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3513 = _3485 * _3495;
            float _3515 = precise::clamp(_3513, 0.0, 1.0);
            float _3517 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3519 = _3517 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3521 = fma(_3515, _3493, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3523 = fma(_3515, _3519, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3525 = fma(_3515, _3499, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3527 = fma(_3515, _3503, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3529 = fma(_3515, _3507, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3531 = fma(_3515, _3511, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3471 = _3525;
            _3429 = _3529;
            _3463 = _3521;
            _3423 = _3527;
            _3417 = _3523;
            _3457 = _3531;
            _3533 = true;
        }
        else
        {
            bool _3535 = _3030 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3537 = isnan(_3030);
            bool _3539 = _3535 || _3537;
            bool _3541 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3543 = _3539 || _3541;
            if (!_3543)
            {
                _3461 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3545 = _3461;
            _3463 = _3545;
            if (!_3543)
            {
                _3469 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3547 = _3469;
            _3471 = _3547;
            if (!_3543)
            {
                _3415 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3549 = _3415;
            _3417 = _3549;
            if (!_3543)
            {
                _3421 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3551 = _3421;
            _3423 = _3551;
            if (!_3543)
            {
                _3427 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3553 = _3427;
            _3429 = _3553;
            if (!_3543)
            {
                _3455 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3555 = _3455;
            bool _3557 = !_3543;
            _3457 = _3555;
            if (!_3557)
            {
                bool _3559 = _3030 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3561 = isnan(_3030);
                bool _3563 = _3559 || _3561;
                bool _3565 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3567 = _3563 || _3565;
                if (!_3567)
                {
                    float _3569 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3571 = _3030 + _3569;
                    float _3573 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3575 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3573;
                    float _3577 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3579 = _3577 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3581 = 1.0 / _3575;
                    float _3583 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3585 = _3583 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3587 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3589 = _3587 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3591 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3593 = _3591 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3595 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3597 = _3595 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3599 = _3571 * _3581;
                    float _3601 = precise::clamp(_3599, 0.0, 1.0);
                    float _3603 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3605 = _3603 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3607 = fma(_3601, _3579, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3609 = fma(_3601, _3605, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3611 = fma(_3601, _3585, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3613 = fma(_3601, _3589, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3615 = fma(_3601, _3593, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3617 = fma(_3601, _3597, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3471 = _3611;
                    _3429 = _3615;
                    _3463 = _3607;
                    _3423 = _3613;
                    _3417 = _3609;
                    _3457 = _3617;
                    _3533 = true;
                }
                else
                {
                    _3471 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3429 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3463 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3423 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3417 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3457 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3533 = false;
    float _3619 = _3471;
    float _3621 = _3429;
    float _3623 = _3463;
    float _3625 = _3423;
    float _3627 = _3417;
    float _3629 = _3457;
    float _3631 = fma(_3395, -0.5, 0.5);
    float _3633 = precise::clamp(_3631, 0.0, 1.0);
    float _3635 = -_3619;
    float _3637 = _3635 + _3621;
    float _3639 = -_3623;
    float _3641 = _3639 + _3625;
    float _3643 = -_3627;
    float _3645 = _3643 + _3629;
    bool _3647 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3649 = fma(_3633, _3637, _3619);
    float _3651 = fma(_3633, _3641, _3623);
    float _3653 = fma(_3633, _3645, _3627);
    float _3655 = _3649 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3657 = fma(_3651, 0.298911988735198974609375, _3655);
    float _3659 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3661 = fma(_3653, 0.114477999508380889892578125, _3657);
    out.m_82.w = _3659;
    float _3663 = -_3661;
    float _3665 = _3651 + _3663;
    float _3667 = -_3661;
    float _3669 = _3649 + _3667;
    float _3671 = -_3661;
    float _3673 = _3653 + _3671;
    out.m_84.x = 0.0;
    float _3675 = fma(_3665, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3661);
    float _3677 = fma(_3669, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3661);
    float _3679 = fma(_3673, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3661);
    out.m_86.x = _3675;
    out.m_86.y = _3677;
    out.m_86.z = _3679;
    if (!_3647)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3681 = -_2916;
    float _3683 = _3681 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3685 = -_2918;
    float _3687 = _3685 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3689 = -_2920;
    float _3691 = _3689 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3693 = _3683 * _3683;
    float _3695 = fma(_3687, _3687, _3693);
    float _3697 = fma(_3691, _3691, _3695);
    float _3699 = sqrt(_3697);
    float _3701 = rsqrt(_3697);
    float _3703 = -_3699;
    float _3705 = _3703 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3707 = _3705 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3709 = precise::clamp(_3707, 0.0, 1.0);
    float _3711 = _3687 * _3701;
    float _3713 = _3683 * _3701;
    float _3715 = abs(_3709);
    float _3717 = log2(_3715);
    float _3719 = _3691 * _3701;
    float _3721 = _3711 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3723 = _3395 * _3713;
    float _3725 = -_3713;
    float _3727 = -_3721;
    float _3729 = fma(_3725, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3727);
    float _3731 = fma(_3399, _3711, _3723);
    float _3733 = -_3719;
    float _3735 = fma(_3733, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3729);
    float _3737 = fma(_3403, _3719, _3731);
    float _3739 = precise::clamp(_3737, 0.0, 1.0);
    float _3741 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3743 = _3735 + _3741;
    float _3745 = _3717 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3747 = _3743 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3749 = precise::clamp(_3747, 0.0, 1.0);
    float _3751 = exp2(_3745);
    float _3753 = _3751 * _3749;
    float _3755 = _3739 * _3753;
    float _3757 = _3755 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3759 = _3755 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3761 = _3755 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_84.x = _3757;
    out.m_84.y = _3759;
    out.m_84.z = _3761;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

