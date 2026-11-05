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
    float4 m_66 [[user(locn0)]];
    float4 m_70 [[user(locn1)]];
    float4 m_84 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_80 [[user(locn4)]];
    float4 m_74 [[user(locn5)]];
    float4 m_60 [[user(locn6)]];
    float4 m_76 [[user(locn7)]];
    float4 m_78 [[user(locn8)]];
    float4 m_82 [[user(locn9)]];
    float4 m_72 [[user(locn10)]];
    float4 m_86 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_64 [[attribute(1)]];
    float4 m_62 [[attribute(2)]];
    float4 m_58 [[attribute(3)]];
    float4 m_68 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_56 [[attribute(7)]];
    float4 m_54 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3030 = false;
    bool _321 = false;
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
        float _3738 = as_type<float>(_121);
        out.gl_Position.z = _3738;
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
    float _141 = _139;
    if (_135)
    {
        float _143 = float(_105);
        _115 = _143;
    }
    float _145 = _115;
    bool _147 = _139 >= _145;
    bool _149 = !_135;
    bool _151 = _147 || _149;
    float _153 = _145;
    if (_151)
    {
        _153 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _153;
    if (_151)
    {
        out.m_47.x = 0.0;
    }
    if (_151)
    {
        float _157 = _155 * 5.0;
        _123 = as_type<int>(_157);
    }
    int _159 = _123;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3808 = as_type<float>(_159);
        out.gl_Position.z = _3808;
    }
    if (_151)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    float _163 = in.m_54.w;
    bool _165 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _167 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _169 = _165 || _167;
    bool _171 = isnan(1.0);
    bool _173 = _169 || _171;
    float _175 = in.m_49.x;
    float _177 = in.m_49.y;
    float _179 = in.m_49.z;
    float _181 = in.m_44.x;
    float _183 = in.m_44.y;
    float _185 = in.m_44.z;
    int _187 = as_type<int>(_161) & 1;
    bool _189 = _187 != 0;
    int _191 = as_type<int>(_161) & 2;
    bool _193 = _191 != 0;
    float _195 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _197 = 0.0;
    float _199 = _195;
    if (!_173)
    {
        float _201 = _195 * _195;
        float _203 = _201 * 0.5;
        _197 = _203;
    }
    float _205 = _197;
    bool _207 = !_189;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_193;
    float _213 = _211 ? (-0.5) : 0.5;
    float _215 = _205;
    if (!_173)
    {
        float _217 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _215 = _217;
    }
    float _219 = _215;
    bool _221 = !_173;
    float _223 = _219;
    if (!_221)
    {
        float _225 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = log2(_225);
        float _229 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _231 = _229 + 1.0;
        float _233 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = _195 * _227;
        float _237 = 1.0 / _231;
        float _239 = _233 * 0.693147182464599609375;
        float _241 = exp2(_235);
        float _243 = 1.0 / _239;
        float _245 = _241 + (-1.0);
        float _247 = -_245;
        float _249 = fma(_247, _243, _195);
        float _251 = _249 * _237;
        float _253 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _223 = _253;
    }
    float _255 = _223;
    bool _257 = !_173;
    if (!_257)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _195 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _199 = _277;
    }
    float _279 = _199;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _283 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _285 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _287 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _289 = fma(_279, _175, _283);
    float _291 = fma(_279, _177, _285);
    float _293 = fma(_279, _179, _287);
    float _295 = fma(_289, _163, _181);
    float _297 = fma(_291, _163, _183);
    float _299 = fma(_293, _163, _185);
    bool _301 = !_281;
    float _319;
    if (!_301)
    {
        float _303 = in.m_56.x;
        float _305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _307 = _303 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _311 = _309 * _305;
        float _313 = floor(_311);
        float _315 = -_313;
        float _317 = _311 + _315;
        _319 = _317;
        _321 = true;
    }
    else
    {
        float _323 = float(_105);
        float _325 = 1.0 / _323;
        float _327 = _139 * _325;
        _319 = _327;
    }
    _321 = false;
    float _329 = _319;
    float _331 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _333 = int(_331);
    float _335 = in.m_56.y;
    float _337 = in.m_56.z;
    float _339 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _341 = int(_339);
    float _343 = float(_105);
    float _345 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _347 = int(_345);
    float _349 = float(_333);
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _351;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _359;
    bool _363 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _365 = isnan(_329);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = 1.0 / _349;
    float _377 = float(_341);
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _379;
    bool _383 = _335 > 0.5;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _389 = _337 > 0.5;
    float _391 = -_209;
    int _393 = _383 ? as_type<int>(_391) : as_type<int>(_209);
    float _395 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _397 = int(_395);
    float _399 = float(uint(_347));
    int _401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _403 = _401 != 0;
    int _405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _407 = _405 != 0;
    int _409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _411 = _409 != 0;
    float _413 = -_213;
    int _415 = _389 ? as_type<int>(_413) : as_type<int>(_213);
    int _417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _419 = _417 != 0;
    float _421 = 1.0 / _377;
    float _423 = _375 * _139;
    bool _425 = !_407;
    float _427 = _425 ? _209 : as_type<float>(_393);
    bool _429 = !_411;
    float _431 = _429 ? _213 : as_type<float>(_415);
    int _433 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _435 = _433 != 0;
    int _437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _439 = _437 != 0;
    int _441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _443 = _441 != 0;
    float _445 = 1.0 / _399;
    float _447 = float(uint(_397));
    int _449 = ~_397;
    int _451 = _449 + 1;
    bool _453 = !_439;
    int _455 = _453 ? 0 : 1;
    int _457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _459 = _457 != 0;
    float _461 = trunc(_423);
    int _463 = int(_461);
    float _465 = _421 * _139;
    float _467 = float(_347);
    float _469 = in.m_56.w;
    bool _471 = !_435;
    int _473 = _471 ? 0 : 1;
    bool _475 = !_443;
    int _477 = _475 ? 0 : 1;
    float _479 = 1.0 / _447;
    int _481 = as_type<int>(_445) + (-2);
    int _483 = ~_347;
    int _485 = _483 + 1;
    int _487 = abs(_477);
    float _489 = trunc(_465);
    int _491 = int(_489);
    float _493 = float(uint(_463));
    float _495 = as_type<float>(_481) * _493;
    int _497 = as_type<int>(_479) + (-2);
    float _499 = 1.0 / _343;
    float _501 = float(uint(_491));
    float _503 = trunc(_495);
    float _505 = precise::max(_503, 0.0);
    uint _508 = uint(_505);
    float _510 = as_type<float>(_497) * _501;
    float _512 = in.m_56.x;
    float _514 = trunc(_510);
    float _516 = precise::max(_514, 0.0);
    uint _518 = uint(_516);
    int _520 = _485 * int(_508);
    int _522 = _520 + _463;
    float _524 = 1.0 / _357;
    float _526 = float(uint(_522));
    int _528 = _451 * int(_518);
    int _530 = _528 + _491;
    float _532 = as_type<float>(_481) * _526;
    float _534 = 1.0 / _353;
    float _536 = float(uint(_530));
    bool _538 = !_419;
    int _540 = _538 ? 0 : 1;
    bool _542 = _469 > 0.5;
    float _544 = as_type<float>(_497) * _536;
    float _546 = _469;
    if (_459)
    {
        _546 = 1.0;
    }
    float _548 = _546;
    float _550 = trunc(_532);
    float _552 = precise::max(_550, 0.0);
    uint _554 = uint(_552);
    float _556 = _548;
    if (!_459)
    {
        _556 = 7.345489978790283203125;
    }
    float _558 = _556;
    int _560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _562 = _560 != 0;
    int _564 = abs(_540);
    float _566 = _558 * _512;
    float _568 = trunc(_544);
    float _570 = precise::max(_568, 0.0);
    uint _572 = uint(_570);
    int _574 = ~_347;
    int _576 = _574 + 1;
    int _578 = int(_508) + int(_554);
    float _580 = floor(_566);
    int _582 = ~_397;
    int _584 = _582 + 1;
    int _586 = _576 * _578;
    int _588 = _586 + _463;
    int _590 = int(_518) + int(_572);
    float _592 = 1.0 / _361;
    float _594 = float(_463);
    bool _596 = !_562;
    int _598 = _596 ? 0 : 1;
    int _600 = _584 * _590;
    int _602 = _600 + _491;
    bool _604 = uint(_588) >= uint(_347);
    float _606 = -_580;
    float _608 = _566 + _606;
    bool _610 = _594 >= _467;
    bool _612 = isnan(_594);
    bool _614 = _610 || _612;
    bool _616 = isnan(_467);
    bool _618 = _614 || _616;
    float _620 = float(_618);
    float _622 = _499 * _139;
    float _624 = -_213;
    int _626 = _542 ? as_type<int>(_624) : as_type<int>(_213);
    float _628 = _608 * _467;
    float _630 = trunc(_620);
    int _632 = int(_630);
    int _634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _636 = _634 != 0;
    float _638 = _467 * _622;
    bool _640 = !_403;
    float _642 = _640 ? _213 : as_type<float>(_626);
    bool _644 = uint(_602) >= uint(_397);
    bool _646 = !_604;
    float _648 = _646 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _650 = trunc(_628);
    int _652 = int(_650);
    bool _654 = !_636;
    int _656 = _654 ? 0 : 1;
    bool _658 = !_644;
    int _660 = _658 ? 0 : (-1);
    int _662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _664 = _662 != 0;
    int _666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _668 = _666 != 0;
    int _670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _672 = _670 != 0;
    int _674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _676 = _674 != 0;
    int _678 = ~_578;
    int _680 = _678 + as_type<int>(_648);
    int _682 = _680 + 1;
    float _684 = trunc(_638);
    int _686 = int(_684);
    int _688 = ~_632;
    int _690 = _688 + 1;
    int _692 = _690 + 1;
    bool _694 = !_668;
    int _696 = _694 ? 0 : 1;
    int _698 = _347 * _682;
    int _700 = _698 + _463;
    bool _702 = _347 == 0;
    int _704 = _347 + (-1);
    int _706 = _652 * _564;
    int _708 = _706 + _463;
    bool _710 = !_702;
    int _712 = _710 ? _700 : (-1);
    float _714 = _648;
    float _716 = _620;
    if (_459)
    {
        _714 = 1.0;
    }
    float _718 = _714;
    float _720 = _718;
    if (_459)
    {
        _716 = _512;
    }
    float _722 = _716;
    int _724 = _712 * _692;
    float _726 = _722;
    if (!_459)
    {
        _720 = 1.2345600128173828125;
    }
    float _728 = _720;
    if (!_459)
    {
        _726 = _335;
    }
    float _730 = _726;
    int _732 = _632 * _704;
    int _734 = _732 + _724;
    int _736 = abs(_455);
    int _738 = abs(_473);
    float _740 = _728 * _730;
    int _742 = abs(_598);
    int _744 = _734 * _736;
    float _746 = floor(_740);
    float _748 = float(_397);
    int _750 = _686 * _738;
    int _752 = _750 + _744;
    float _754 = float(_491);
    int _756 = _708 * _487;
    int _758 = _756 + _752;
    bool _760 = _754 >= _748;
    bool _762 = isnan(_754);
    bool _764 = _760 || _762;
    bool _766 = isnan(_748);
    bool _768 = _764 || _766;
    float _770 = float(_768);
    float _772 = _748 * _622;
    int _774 = ~_590;
    int _776 = _774 + _660;
    int _778 = _776 + 1;
    int _780 = _652 * _742;
    int _782 = _780 + _758;
    bool _784 = !_664;
    int _786 = _784 ? 0 : 1;
    float _788 = trunc(_770);
    int _790 = int(_788);
    int _792 = _397 * _778;
    int _794 = _792 + _491;
    float _796 = float(uint(_782));
    float _798 = -_746;
    float _800 = _740 + _798;
    bool _802 = _397 == 0;
    float _804 = as_type<float>(_481) * _796;
    float _806 = _800 * _748;
    int _808 = ~_347;
    int _810 = _808 + 1;
    float _812 = trunc(_772);
    int _814 = int(_812);
    int _816 = ~_790;
    int _818 = _816 + 1;
    int _820 = _818 + 1;
    float _822 = trunc(_806);
    int _824 = int(_822);
    float _826 = trunc(_804);
    float _828 = precise::max(_826, 0.0);
    uint _830 = uint(_828);
    int _832 = abs(_656);
    bool _834 = !_802;
    int _836 = _834 ? _794 : (-1);
    int _838 = _397 + (-1);
    int _840 = _836 * _820;
    int _842 = _824 * _832;
    int _844 = _842 + _491;
    int _846 = _790 * _838;
    int _848 = _846 + _840;
    int _850 = abs(_696);
    bool _852 = !_672;
    int _854 = _852 ? 0 : 1;
    int _856 = _810 * int(_830);
    int _858 = _856 + _782;
    int _860 = abs(_786);
    bool _862 = !_676;
    int _864 = _862 ? 0 : 1;
    int _866 = abs(_854);
    int _868 = _848 * _850;
    float _870 = float(uint(_858));
    int _872 = abs(_864);
    float _874 = as_type<float>(_481) * _870;
    int _876 = _814 * _860;
    int _878 = _876 + _868;
    float _880 = trunc(_874);
    float _882 = precise::max(_880, 0.0);
    uint _884 = uint(_882);
    float _886 = float(uint(_708));
    int _888 = _844 * _866;
    int _890 = _888 + _878;
    int _892 = ~_347;
    int _894 = _892 + 1;
    float _896 = as_type<float>(_481) * _886;
    int _898 = _824 * _872;
    int _900 = _898 + _890;
    int _902 = ~_347;
    int _904 = _902 + 1;
    int _906 = ~_397;
    int _908 = _906 + 1;
    float _910 = trunc(_896);
    float _912 = precise::max(_910, 0.0);
    uint _914 = uint(_912);
    float _916 = float(uint(_900));
    int _918 = int(_830) + int(_884);
    float _920 = as_type<float>(_497) * _916;
    float _922 = trunc(_920);
    float _924 = precise::max(_922, 0.0);
    uint _926 = uint(_924);
    int _928 = _904 * _918;
    int _930 = _928 + _782;
    int _932 = _894 * int(_914);
    int _934 = _932 + _708;
    bool _936 = uint(_930) >= uint(_347);
    float _938 = float(uint(_934));
    bool _940 = !_936;
    int _942 = _940 ? 0 : (-1);
    float _944 = as_type<float>(_481) * _938;
    int _946 = ~_918;
    int _948 = _946 + _942;
    int _950 = _948 + 1;
    int _952 = _908 * int(_926);
    int _954 = _952 + _900;
    float _956 = trunc(_944);
    float _958 = precise::max(_956, 0.0);
    uint _960 = uint(_958);
    int _962 = _347 * _950;
    int _964 = _962 + _782;
    float _966 = float(uint(_954));
    bool _968 = !_702;
    int _970 = _968 ? _964 : (-1);
    float _972 = as_type<float>(_497) * _966;
    int _974 = ~_347;
    int _976 = _974 + 1;
    int _978 = _970 & 3;
    bool _980 = _978 != 0;
    int _982 = _970 & 3;
    bool _984 = _982 != 0;
    float _986 = trunc(_972);
    float _988 = precise::max(_986, 0.0);
    uint _990 = uint(_988);
    int _992 = _980 ? 0 : 1;
    bool _994 = uint(_982) > 1u;
    int _996 = int(_914) + int(_960);
    int _998 = ~_397;
    int _1000 = _998 + 1;
    int _1002 = ~_992;
    int _1004 = _1002 + 1;
    int _1006 = _1004 + 1;
    bool _1008 = !_984;
    int _1010 = _1008 ? 0 : 1;
    int _1012 = _1006;
    int _1014 = _996;
    if (!_994)
    {
        int _1016 = ~_992;
        int _1018 = _1016 + 1;
        _1012 = _1018;
    }
    int _1020 = _1012;
    int _1022 = _976 * _996;
    int _1024 = _1022 + _708;
    int _1026 = int(_926) + int(_990);
    bool _1028 = uint(_982) >= 2u;
    int _1030 = _1028 ? 0 : 1;
    bool _1032 = uint(_1024) >= uint(_347);
    int _1034 = _1000 * _1026;
    int _1036 = _1034 + _900;
    int _1038 = ~_1030;
    int _1040 = _1038 + 1;
    int _1042 = _1040 + 1;
    bool _1044 = !_1032;
    int _1046 = _1044 ? 0 : (-1);
    bool _1048 = uint(_1036) >= uint(_397);
    int _1050 = ~_996;
    int _1052 = _1050 + _1046;
    int _1054 = _1052 + 1;
    bool _1056 = !_1048;
    int _1058 = _1056 ? 0 : (-1);
    bool _1060 = _982 != 3;
    int _1062 = _347 * _1054;
    int _1064 = _1062 + _708;
    int _1066 = ~_1026;
    int _1068 = _1066 + _1058;
    int _1070 = _1068 + 1;
    float _1072 = _335 * 2.0;
    int _1074 = _1042;
    int _1076 = _1064;
    if (_459)
    {
        _1014 = 0;
    }
    int _1078 = _1014;
    int _1080 = _1078;
    if (!_459)
    {
        _1080 = 1;
    }
    int _1082 = _1080;
    int _1084 = _397 * _1070;
    int _1086 = _1084 + _900;
    float _1088 = _512 * 2.0;
    bool _1090 = !_702;
    int _1092 = _1090 ? _1064 : (-1);
    float _1094 = floor(_1072);
    bool _1096 = _1082 != 1;
    if (_1060)
    {
        int _1098 = ~_1030;
        int _1100 = _1098 + 1;
        _1074 = _1100;
    }
    int _1102 = _1074;
    int _1104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1106 = _1104 != 0;
    bool _1108 = !_802;
    int _1110 = _1108 ? _1086 : (-1);
    float _1112 = floor(_1088);
    bool _1114 = !_1106;
    int _1116 = _1114 ? 0 : 1;
    float _1118 = in.m_58.x;
    float _1120 = in.m_58.y;
    float _1122 = in.m_58.z;
    int _1124 = _1110 & 3;
    bool _1126 = _1124 != 0;
    int _1128 = _1110 & 3;
    bool _1130 = _1128 != 0;
    bool _1132 = uint(_1124) > 1u;
    int _1134 = _1130 ? 0 : 1;
    if (_459)
    {
        _1076 = 0;
    }
    int _1136 = _1076;
    int _1138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1140 = _1138 != 0;
    int _1142 = _1136;
    if (!_459)
    {
        _1142 = 2;
    }
    int _1144 = _1142;
    bool _1146 = !_1140;
    int _1148 = _1146 ? 0 : 1;
    int _1150 = ~_1134;
    int _1152 = _1150 + 1;
    int _1154 = _1152 + 1;
    bool _1156 = _1144 != 2;
    float _1158 = -_213;
    float _1160 = _1158 + 0.5;
    float _1162 = 0.0;
    int _1164 = _1154;
    if (!_1096)
    {
        _1162 = _335;
    }
    float _1166 = _1162;
    float _1168 = _1166;
    if (!_1132)
    {
        int _1170 = ~_1134;
        int _1172 = _1170 + 1;
        _1164 = _1172;
    }
    int _1174 = _1164;
    float _1176 = _209 + 0.5;
    bool _1178 = _1112 > 0.0;
    float _1180 = _297 * _1120;
    float _1182 = 0.0;
    if (!_1096)
    {
        _1182 = _1166;
    }
    float _1184 = _1182;
    float _1186 = _335 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1188 = 0.0;
    float _1190 = _1184;
    if (!_1096)
    {
        _1188 = _337;
    }
    float _1192 = _1188;
    out.m_60.x = _1176;
    out.m_60.y = _1160;
    float _1194 = 0.0;
    float _1196 = _1192;
    if (!_1096)
    {
        _1194 = _337;
    }
    float _1198 = _1194;
    float _1200 = _1198;
    if (_1096)
    {
        _1190 = _512;
    }
    float _1202 = _1190;
    if (_1096)
    {
        _1168 = _512;
    }
    float _1204 = _1168;
    if (_1096)
    {
        _1196 = _335;
    }
    float _1206 = _1196;
    float _1208 = _1202 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1096)
    {
        _1200 = _335;
    }
    float _1210 = _1200;
    bool _1212 = _1112 >= 0.0;
    bool _1214 = isnan(_1112);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan(0.0);
    bool _1220 = _1216 || _1218;
    float _1222 = 0.0;
    if (_1156)
    {
        _1222 = _512;
    }
    float _1224 = _1222;
    int _1226 = _1220 ? 0 : 1;
    float _1228 = 0.0;
    float _1230 = _1224;
    if (_1156)
    {
        _1228 = _335;
    }
    float _1232 = _1228;
    int _1234 = ~_1226;
    int _1236 = _1234 + 1;
    int _1238 = _1236 + 1;
    float _1240 = _1232;
    int _1242 = _1238;
    if (!_1156)
    {
        _1230 = _337;
    }
    float _1244 = _1230;
    if (!_1156)
    {
        _1240 = _512;
    }
    float _1246 = _1240;
    bool _1248 = _1094 > 0.0;
    bool _1250 = _1094 >= 0.0;
    bool _1252 = isnan(_1094);
    bool _1254 = _1250 || _1252;
    bool _1256 = isnan(0.0);
    bool _1258 = _1254 || _1256;
    if (!_1178)
    {
        int _1260 = ~_1226;
        int _1262 = _1260 + 1;
        _1242 = _1262;
    }
    int _1264 = _1242;
    float _1266 = in.m_62.x;
    float _1268 = in.m_62.y;
    float _1270 = in.m_62.z;
    bool _1272 = _982 != 3;
    int _1274 = _1258 ? 0 : 1;
    float _1276 = in.m_64.x;
    float _1278 = in.m_64.y;
    float _1280 = in.m_64.z;
    bool _1282 = !_1126;
    int _1284 = _1282 ? 0 : 1;
    bool _1286 = uint(_1124) >= 2u;
    bool _1288 = _1124 != 3;
    bool _1290 = !_1272;
    int _1292 = _1290 ? 0 : (-1);
    bool _1294 = !_1288;
    int _1296 = _1294 ? 0 : (-1);
    int _1298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1300 = _1298 != 0;
    int _1302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1304 = _1302 != 0;
    int _1306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1308 = _1306 != 0;
    int _1310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1312 = _1310 != 0;
    int _1314 = ~_1274;
    int _1316 = _1314 + 1;
    int _1318 = _1316 + 1;
    int _1320 = _1286 ? 0 : 1;
    float _1322 = _297 * _1268;
    int _1324 = _1318;
    if (!_1248)
    {
        int _1326 = ~_1274;
        int _1328 = _1326 + 1;
        _1324 = _1328;
    }
    int _1330 = _1324;
    int _1332 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1334 = _1332 != 0;
    float _1336 = fma(_295, _1266, _1322);
    int _1338 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1340 = _1338 != 0;
    float _1342 = _297 * _1278;
    float _1344 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1346 = _512 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1348 = fma(_295, _1276, _1342);
    float _1350 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1352 = _1350 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1354 = _1344 * _512;
    float _1356 = fma(_295, _1118, _1180);
    float _1358 = fma(_299, _1280, _1348);
    float _1360 = trunc(_1354);
    int _1362 = int(_1360);
    float _1364 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1368 = _329 + _1366;
    float _1370 = fma(_299, _1122, _1356);
    float _1372 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1374 = fma(_1186, -2.0, _1364);
    float _1376 = _1368 * _524;
    float _1378 = fma(_299, _1270, _1336);
    float _1380 = 1.0 / _1352;
    float _1382 = -_1372;
    float _1384 = fma(_1346, 2.0, _1382);
    float _1386 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1388 = _329 + _1386;
    float _1390 = _512 + _335;
    float _1392 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1394 = _329 + _1392;
    float _1396 = _337 * 2.0;
    float _1398 = _1388 * _534;
    float _1400 = _1390 + (-1.0);
    int _1402 = _1362 << 4;
    int _1404 = _1402 + 1712;
    float _1406 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1408 = _329 + _1406;
    float _1410 = floor(_1396);
    int _1412 = _1404 + 8;
    uint _1414 = uint(int(uint(_1412) >> uint(2)));
    uint _1416 = uint(int(uint(int(_1414)) >> uint(2)));
    int _1418 = int(_1414) & 3;
    float _1420 = (*spvDescriptorSet0.vp_c9)._m0[int(_1416)][_1418];
    float _1422 = _1408 * _592;
    float _1424 = _337 + _335;
    float _1426 = _512 + _337;
    float _1428 = _1394 * _1380;
    float _1430 = _1424 + (-1.0);
    uint _1432 = uint(int(uint(_1404) >> uint(2)));
    uint _1434 = uint(int(uint(int(_1432)) >> uint(2)));
    int _1436 = int(_1432) & 3;
    float _1438 = (*spvDescriptorSet0.vp_c9)._m0[int(_1434)][_1436];
    int _1440 = int(_1432) + 1;
    uint _1442 = uint(int(uint(_1440) >> uint(2)));
    int _1444 = _1440 & 3;
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[int(_1442)][_1444];
    float _1448 = _1426 + (-1.0);
    float _1450 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1452 = !_1300;
    int _1454 = _1452 ? 0 : 1;
    float _1456 = fma(_1400, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1458 = fma(_1448, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1460 = _1410 >= 0.0;
    bool _1462 = isnan(_1410);
    bool _1464 = _1460 || _1462;
    bool _1466 = isnan(0.0);
    bool _1468 = _1464 || _1466;
    float _1470 = fma(_387, _1376, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _1472 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _1474 = isnan(_329);
    bool _1476 = _1472 || _1474;
    bool _1478 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _1480 = _1476 || _1478;
    float _1482 = float(_1480);
    float _1484 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1484;
    int _1488 = _1468 ? 0 : 1;
    float _1490 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1492 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1490;
    bool _1494 = _1410 > 0.0;
    float _1496 = fma(_381, _1398, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _1498 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1500 = isnan(_329);
    bool _1502 = _1498 || _1500;
    bool _1504 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1506 = _1502 || _1504;
    float _1508 = float(_1506);
    float _1510 = -_1482;
    float _1512 = _1510 + 1.0;
    float _1514 = fma(_1486, _1398, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1516 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1518 = _1516 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1520 = !_1308;
    int _1522 = _1520 ? 0 : 1;
    float _1524 = _1508 * _1512;
    float _1526 = -_1508;
    float _1528 = _1526 + 1.0;
    float _1530 = fma(_1518, _1376, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _1532 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1534 = isnan(_329);
    bool _1536 = _1532 || _1534;
    bool _1538 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1540 = _1536 || _1538;
    float _1542 = float(_1540);
    float _1544 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _1546 = _1544 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1548 = _373 * _1528;
    float _1550 = -_373;
    float _1552 = _1550 + 1.0;
    bool _1554 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1556 = isnan(_329);
    bool _1558 = _1554 || _1556;
    bool _1560 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1562 = _1558 || _1560;
    float _1564 = float(_1562);
    float _1566 = -_1542;
    float _1568 = _1566 + 1.0;
    bool _1570 = !_1304;
    int _1572 = _1570 ? 0 : 1;
    float _1574 = _1542 * _1552;
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1576;
    float _1580 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1582 = _1580 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    int _1584 = abs(_1020);
    float _1586 = fma(_1578, _1422, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1588 = fma(_1492, _1422, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1590 = _1564 * _1568;
    float _1592 = fma(_1582, _1428, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _1594 = _1420 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1596 = _1496 * _1590;
    float _1598 = _1514 * _1590;
    float _1600 = -_1564;
    float _1602 = _1600 + 1.0;
    float _1604 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1606 = _1594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1608 = ~_1488;
    int _1610 = _1608 + 1;
    int _1612 = _1610 + 1;
    float _1614 = fma(_1602, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1596);
    float _1616 = _1438 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1618 = _1446 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1620 = fma(_1602, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1598);
    float _1622 = _1616 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1624 = _1618 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1626 = _1612;
    float _1628 = _1378;
    if (!_1494)
    {
        int _1630 = ~_1488;
        int _1632 = _1630 + 1;
        _1626 = _1632;
    }
    int _1634 = _1626;
    float _1636 = fma(_1530, _1574, _1620);
    float _1638 = fma(_1470, _1574, _1614);
    out.m_66.x = _1622;
    out.m_66.y = _1624;
    out.m_66.z = _1606;
    out.m_66.w = _1604;
    float _1640 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1642 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1644 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1646 = fma(_1586, _1548, _1638);
    float _1648 = fma(_1588, _1548, _1636);
    float _1650 = -_1640;
    float _1652 = fma(_1642, 2.0, _1650);
    float _1654 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1656 = float(_1264);
    float _1658 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1644);
    int _1660 = abs(_1572);
    float _1662 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1664 = abs(_1454);
    float _1666 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1668 = log2(_1666);
    float _1670 = float(uint(_844));
    float _1672 = _1246 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1674 = fma(_1546, _1428, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _1676 = float(_1330);
    float _1678 = as_type<float>(_497) * _1670;
    float _1680 = fma(_1672, -2.0, _1662);
    float _1682 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1684 = abs(_1522);
    float _1686 = _1206 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1688 = _1124 != 3;
    float _1690 = trunc(_1678);
    float _1692 = precise::max(_1690, 0.0);
    uint _1694 = uint(_1692);
    float _1696 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1682);
    float _1698 = float(_1684);
    float _1700 = fma(_1686, -2.0, _1654);
    float _1702 = _1668 * _139;
    float _1704 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1706 = -_139;
    float _1708 = fma(_1706, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1384);
    int _1710 = ~_397;
    int _1712 = _1710 + 1;
    float _1714 = _1698 * _1676;
    int _1716 = ~_1320;
    int _1718 = _1716 + 1;
    int _1720 = _1718 + 1;
    float _1722 = exp2(_1702);
    float _1724 = _1704 * _512;
    int _1726 = _1720;
    if (_1688)
    {
        int _1728 = ~_1320;
        int _1730 = _1728 + 1;
        _1726 = _1730;
    }
    int _1732 = _1726;
    float _1734 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1696);
    bool _1736 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1738 = isnan(0.0);
    bool _1740 = _1736 || _1738;
    bool _1742 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1744 = _1740 || _1742;
    float _1746 = -_139;
    float _1748 = fma(_1746, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1652);
    int _1750 = _1712 * int(_1694);
    int _1752 = _1750 + _844;
    float _1754 = trunc(_1724);
    int _1756 = int(_1754);
    float _1758 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1658);
    float _1760 = float(uint(_1752));
    float _1762 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1680);
    float _1764 = float(_1634);
    float _1766 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1768 = float(_1664);
    float _1770 = -_1722;
    float _1772 = _1770 + 1.0;
    float _1774 = as_type<float>(_497) * _1760;
    float _1776 = -_1766;
    float _1778 = fma(_1208, 2.0, _1776);
    float _1780 = in.m_68.x;
    float _1782 = in.m_68.y;
    float _1784 = in.m_68.z;
    float _1786 = _1768 * _1764;
    float _1788 = _1744 ? _1772 : 0.0;
    float _1790 = trunc(_1774);
    float _1792 = precise::max(_1790, 0.0);
    uint _1794 = uint(_1792);
    bool _1796 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1798 = isnan(1.0);
    bool _1800 = _1796 || _1798;
    bool _1802 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1804 = _1800 || _1802;
    float _1806 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1808 = 1.0 + _1806;
    int _1810 = _1756 << 4;
    int _1812 = _1810 + 1968;
    float _1814 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1816 = -_139;
    float _1818 = fma(_1816, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1778);
    float _1820 = 1.0 / _1808;
    uint _1822 = uint(int(uint(_1812) >> uint(2)));
    uint _1824 = uint(int(uint(int(_1822)) >> uint(2)));
    int _1826 = int(_1822) & 3;
    float _1828 = (*spvDescriptorSet0.vp_c9)._m0[int(_1824)][_1826];
    int _1830 = int(_1822) + 1;
    uint _1832 = uint(int(uint(_1830) >> uint(2)));
    int _1834 = _1830 & 3;
    float _1836 = (*spvDescriptorSet0.vp_c9)._m0[int(_1832)][_1834];
    float _1838 = float(_1660);
    float _1840 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1842 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1844 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1846 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1814);
    float _1848 = _1838 * _1656;
    float _1850 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1840);
    int _1852 = _1812 + 8;
    uint _1854 = uint(int(uint(_1852) >> uint(2)));
    uint _1856 = uint(int(uint(int(_1854)) >> uint(2)));
    int _1858 = int(_1854) & 3;
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[int(_1856)][_1858];
    float _1862 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1842);
    float _1864 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1844);
    int _1866 = ~_397;
    int _1868 = _1866 + 1;
    float _1870 = _1848 * (-2.0);
    int _1872 = int(_1694) + int(_1794);
    float _1874 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1846);
    float _1876 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1374);
    float _1878 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1850);
    float _1880 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1862);
    float _1882 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1864);
    float _1884 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1700);
    if (_1804)
    {
        float _1886 = _1788 * _1820;
        _141 = _1886;
    }
    float _1888 = _141;
    float _1890 = fma(_1450, _1870, _1450);
    int _1892 = _1868 * _1872;
    int _1894 = _1892 + _844;
    float _1896 = fma(_1870, _1782, _1782);
    float _1898 = _335 + (-0.5);
    float _1900 = _1714 * (-2.0);
    float _1902 = _337 + (-0.5);
    bool _1904 = uint(_1894) >= uint(_397);
    float _1906 = fma(_1898, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1896);
    float _1908 = _1786 * (-2.0);
    float _1910 = fma(_1458, _1900, _1458);
    bool _1912 = !_1904;
    int _1914 = _1912 ? 0 : (-1);
    float _1916 = fma(_1900, _1784, _1784);
    bool _1918 = _512 > 0.5;
    float _1920 = fma(_1908, _1780, _1780);
    float _1922 = _512 + (-0.5);
    float _1924 = fma(_1456, _1908, _1456);
    float _1926 = fma(_1902, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1916);
    float _1928 = fma(_1922, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1920);
    float _1930 = fma(_1592, _1524, _1646);
    float _1932 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1934 = fma(_1890, _1888, _1906);
    float _1936 = fma(_1924, _1888, _1928);
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1940 = in.m_54.x;
    float _1942 = in.m_54.y;
    float _1944 = fma(_1674, _1524, _1648);
    float _1946 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1930);
    float _1948 = _1828 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1950 = _1836 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1952 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1954 = _1934 * 0.15915493667125701904296875;
    float _1956 = _1948 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1958 = _1950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1960 = _1936 * 0.15915493667125701904296875;
    float _1962 = fma(_1910, _1888, _1926);
    float _1964 = _1860 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1966 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1944);
    float _1968 = _1954 * 6.283185482025146484375;
    float _1970 = sin(_1968);
    float _1972 = _1962 * 0.15915493667125701904296875;
    float _1974 = _1964 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1976 = _1932 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1978 = _431 + (-0.5);
    float _1980 = _427 + 0.5;
    int _1982 = ~_1872;
    int _1984 = _1982 + _1914;
    int _1986 = _1984 + 1;
    out.m_70.x = _1956;
    out.m_70.y = _1958;
    out.m_70.z = _1974;
    out.m_70.w = _1938;
    float _1988 = _1954 * 6.283185482025146484375;
    float _1990 = cos(_1988);
    float _1992 = _1952 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1994 = fma(_1976, _1980, _1748);
    float _1996 = _1946 * _1940;
    float _1998 = _1966 * _1942;
    float _2000 = -_1992;
    float _2002 = -_1762;
    float _2004 = fma(_2000, _1978, _2002);
    float _2006 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _2008 = abs(_1102);
    float _2010 = _1960 * 6.283185482025146484375;
    float _2012 = sin(_2010);
    float _2014 = _1996 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2016 = _1998 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _2018 = abs(_1116);
    int _2020 = _397 * _1986;
    int _2022 = _2020 + _844;
    int _2024 = _970 >> 31;
    float _2026 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _209);
    int _2028 = _1110 >> 31;
    float _2030 = _1960 * 6.283185482025146484375;
    float _2032 = cos(_2030);
    int _2034 = _2024 & 3;
    float _2036 = _2014 * _2026;
    int _2038 = _2028 & 3;
    float _2040 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _213);
    int _2042 = _970 + _2034;
    int _2044 = _1110 + _2038;
    float _2046 = _1972 * 6.283185482025146484375;
    float _2048 = cos(_2046);
    int _2050 = _2042 >> 2;
    float _2052 = _2012 * _1970;
    int _2054 = _2044 >> 2;
    float _2056 = _2016 * _2040;
    int _2058 = _2050 << 4;
    int _2060 = _2058 + 368;
    float _2062 = _2012 * _1990;
    int _2064 = _2054 << 4;
    int _2066 = _2064 + 512;
    float _2068 = _1972 * 6.283185482025146484375;
    float _2070 = sin(_2068);
    uint _2072 = uint(int(uint(_2060) >> uint(2)));
    uint _2074 = uint(int(uint(int(_2072)) >> uint(2)));
    int _2076 = int(_2072) & 3;
    float _2078 = (*spvDescriptorSet0.vp_c9)._m0[int(_2074)][_2076];
    int _2080 = int(_2072) + 1;
    uint _2082 = uint(int(uint(_2080) >> uint(2)));
    int _2084 = _2080 & 3;
    float _2086 = (*spvDescriptorSet0.vp_c9)._m0[int(_2082)][_2084];
    float _2088 = _2032 * _1990;
    float _2090 = _2032 * _1970;
    float _2092 = _2032 * _2048;
    float _2094 = _2012 * _2048;
    float _2096 = _1990 * _2048;
    float _2098 = _1970 * _2048;
    float _2100 = _2092 * _2056;
    float _2102 = _2092 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2104 = _2092 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2106 = _2092 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2108 = fma(_2070, _2088, _2052);
    float _2110 = fma(_2070, _2052, _2088);
    float _2112 = -_2056;
    float _2114 = _2070 * _2112;
    uint _2116 = uint(int(uint(_2066) >> uint(2)));
    uint _2118 = uint(int(uint(int(_2116)) >> uint(2)));
    int _2120 = int(_2116) & 3;
    float _2122 = (*spvDescriptorSet0.vp_c9)._m0[int(_2118)][_2120];
    int _2124 = int(_2116) + 1;
    uint _2126 = uint(int(uint(_2124) >> uint(2)));
    int _2128 = _2124 & 3;
    float _2130 = (*spvDescriptorSet0.vp_c9)._m0[int(_2126)][_2128];
    float _2132 = _2094 * _2056;
    float _2134 = -_2090;
    float _2136 = fma(_2070, _2062, _2134);
    float _2138 = fma(_2096, _2036, _2114);
    float _2140 = fma(_2108, _2036, _2100);
    float _2142 = -_2070;
    float _2144 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2102);
    float _2146 = fma(_2136, _2036, _2132);
    float _2148 = -_2062;
    float _2150 = fma(_2070, _2090, _2148);
    int _2152 = _2060 + 8;
    uint _2154 = uint(int(uint(_2152) >> uint(2)));
    uint _2156 = uint(int(uint(int(_2154)) >> uint(2)));
    int _2158 = int(_2154) & 3;
    float _2160 = (*spvDescriptorSet0.vp_c9)._m0[int(_2156)][_2158];
    int _2162 = int(_2154) + 1;
    uint _2164 = uint(int(uint(_2162) >> uint(2)));
    int _2166 = _2162 & 3;
    float _2168 = (*spvDescriptorSet0.vp_c9)._m0[int(_2164)][_2166];
    float _2170 = -_2070;
    float _2172 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2104);
    float _2174 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2144);
    float _2176 = -_2070;
    float _2178 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2106);
    float _2180 = _2150 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2182 = _2108 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2184 = _2108 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2186 = _2108 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2188 = _2066 + 8;
    uint _2190 = uint(int(uint(_2188) >> uint(2)));
    uint _2192 = uint(int(uint(int(_2190)) >> uint(2)));
    int _2194 = int(_2190) & 3;
    float _2196 = (*spvDescriptorSet0.vp_c9)._m0[int(_2192)][_2194];
    int _2198 = int(_2190) + 1;
    uint _2200 = uint(int(uint(_2198) >> uint(2)));
    int _2202 = _2198 & 3;
    float _2204 = (*spvDescriptorSet0.vp_c9)._m0[int(_2200)][_2202];
    int _2206 = abs(_1010);
    float _2208 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2182);
    float _2210 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2184);
    float _2212 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2186);
    float _2214 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2172);
    float _2216 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2178);
    int _2218 = abs(_1174);
    float _2220 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2180);
    int _2222 = ~_1584;
    int _2224 = _2222 + 1;
    int _2226 = _2224 + 1;
    float _2228 = fma(_2098, _2006, _2138);
    float _2230 = _2150 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2232 = _2150 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2234 = fma(_2150, _2006, _2140);
    int _2236 = ~_2206;
    int _2238 = _2236 + 1;
    int _2240 = _2238 + 1;
    int _2242 = _2226 * as_type<int>(_2086);
    float _2244 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2230);
    float _2246 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2232);
    int _2248 = ~_2218;
    int _2250 = _2248 + 1;
    int _2252 = _2250 + 1;
    int _2254 = _2240 * as_type<int>(_2078);
    int _2256 = _2254 + _2242;
    int _2258 = abs(_1292);
    float _2260 = fma(_2110, _2006, _2146);
    int _2262 = abs(_1284);
    float _2264 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2244);
    float _2266 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2220);
    int _2268 = abs(_1732);
    float _2270 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2272 = int(_2270);
    int _2274 = ~_2262;
    int _2276 = _2274 + 1;
    int _2278 = _2276 + 1;
    float _2280 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2246);
    int _2282 = ~_2008;
    int _2284 = _2282 + 1;
    int _2286 = _2284 + 1;
    int _2288 = _2252 * as_type<int>(_2130);
    int _2290 = ~_2268;
    int _2292 = _2290 + 1;
    int _2294 = _2292 + 1;
    int _2296 = ~_2258;
    int _2298 = _2296 + 1;
    int _2300 = _2298 + 1;
    float _2302 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2304 = int(_2302);
    int _2306 = _2278 * as_type<int>(_2122);
    int _2308 = _2306 + _2288;
    float _2310 = _2234 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2312 = _2286 * as_type<int>(_2160);
    int _2314 = _2312 + _2256;
    float _2316 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2310);
    int _2318 = _2300 * as_type<int>(_2168);
    int _2320 = _2318 + _2314;
    int _2322 = abs(_1148);
    int _2324 = _2294 * as_type<int>(_2196);
    int _2326 = _2324 + _2308;
    int _2328 = abs(_1296);
    int _2330 = ~_2018;
    int _2332 = _2330 + 1;
    int _2334 = _2332 + 1;
    int _2336 = ~_2328;
    int _2338 = _2336 + 1;
    int _2340 = _2338 + 1;
    int _2342 = _2320 * _2334;
    float _2344 = float(uint(_2304));
    int _2346 = _2340 * as_type<int>(_2204);
    int _2348 = _2346 + _2326;
    int _2350 = ~_2322;
    int _2352 = _2350 + 1;
    int _2354 = _2352 + 1;
    int _2356 = _1092 * _2018;
    int _2358 = _2356 + _2342;
    float _2360 = float(uint(_2272));
    float _2362 = _1370 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2364 = abs(_2272);
    float _2366 = 1.0 / _2344;
    int _2368 = _2348 * _2354;
    float _2370 = _2234 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2372 = _2234 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2374 = abs(_2304);
    float _2376 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2370);
    int _2378 = ~_2272;
    int _2380 = _2378 + 1;
    float _2382 = 1.0 / _2360;
    float _2384 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2372);
    float _2386 = fma(_2260, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2376);
    bool _2388 = !_802;
    int _2390 = _2388 ? _2022 : (-1);
    float _2392 = fma(_2260, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2384);
    float _2394 = float(uint(_2374));
    float _2396 = _2386 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2398 = float(uint(_2364));
    int _2400 = _2390 * _2322;
    int _2402 = _2400 + _2368;
    float _2404 = _1358 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2406 = _2392 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _2408 = as_type<int>(_2366) + (-2);
    float _2410 = _2362 + _2396;
    float _2412 = float(uint(_2358));
    float _2414 = _2404 + _2406;
    int _2416 = as_type<int>(_2382) + (-2);
    float _2418 = 1.0 / _2394;
    float _2420 = float(uint(_2402));
    float _2422 = as_type<float>(_2408) * _2412;
    float _2424 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2426 = _2414 + _2424;
    float _2428 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2430 = _2410 + _2428;
    int _2432 = abs(_2402);
    float _2434 = as_type<float>(_2416) * _2420;
    float _2436 = _2426 * _2426;
    float _2438 = 1.0 / _2398;
    float _2440 = _2430 * _2430;
    int _2442 = ~_2304;
    int _2444 = _2442 + 1;
    float _2446 = fma(_2260, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2316);
    float _2448 = float(uint(_2432));
    float _2450 = _2436 + _2440;
    int _2452 = ~_2374;
    int _2454 = _2452 + 1;
    float _2456 = trunc(_2422);
    float _2458 = precise::max(_2456, 0.0);
    uint _2460 = uint(_2458);
    int _2462 = as_type<int>(_2418) + (-2);
    float _2464 = trunc(_2434);
    float _2466 = precise::max(_2464, 0.0);
    uint _2468 = uint(_2466);
    int _2470 = abs(_2358);
    int _2472 = as_type<int>(_2438) + (-2);
    float _2474 = float(uint(_2470));
    float _2476 = sqrt(_2450);
    int _2478 = _2444 * int(_2460);
    int _2480 = _2478 + _2358;
    float _2482 = as_type<float>(_2462) * _2474;
    float _2484 = as_type<float>(_2472) * _2448;
    float _2486 = float(uint(_2480));
    int _2488 = _2380 * int(_2468);
    int _2490 = _2488 + _2402;
    float _2492 = trunc(_2482);
    float _2494 = precise::max(_2492, 0.0);
    uint _2496 = uint(_2494);
    float _2498 = float(uint(_2490));
    float _2500 = as_type<float>(_2408) * _2486;
    float _2502 = _1378 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _2504 = _2476 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2506 = trunc(_2484);
    float _2508 = precise::max(_2506, 0.0);
    uint _2510 = uint(_2508);
    float _2512 = as_type<float>(_2416) * _2498;
    int _2514 = ~_2364;
    int _2516 = _2514 + 1;
    float _2518 = _2446 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2520 = _2502 + _2518;
    float _2522 = trunc(_2500);
    float _2524 = precise::max(_2522, 0.0);
    uint _2526 = uint(_2524);
    int _2528 = _2454 * int(_2496);
    int _2530 = _2528 + _2470;
    float _2532 = as_type<float>(_2454);
    float _2534 = _2436;
    float _2536 = _2410;
    float _2538 = _2414;
    float _2540 = _2362;
    if (!_2504)
    {
        _1628 = _2440;
    }
    float _2542 = _1628;
    float _2544 = _2542;
    if (!_2504)
    {
        _2532 = _2436;
    }
    float _2546 = _2532;
    int _2548 = _2516 * int(_2510);
    int _2550 = _2548 + _2432;
    float _2552 = float(uint(_2530));
    float _2554 = _2546;
    if (!_2504)
    {
        _2534 = _2520;
    }
    float _2556 = _2534;
    float _2558 = float(uint(_2550));
    bool _2560 = !_2504;
    float _2562 = _2556;
    if (!_2560)
    {
        float _2564 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2566 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2568 = _2476 + _2566;
        float _2570 = rsqrt(_2450);
        float _2572 = _2568 * _2564;
        float _2574 = _2520 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2576 = _2572 * 0.15915493667125701904296875;
        float _2578 = _2576 * 6.283185482025146484375;
        float _2580 = sin(_2578);
        float _2582 = _2576 * 6.283185482025146484375;
        float _2584 = cos(_2582);
        float _2586 = fma(_2580, _2574, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2588 = _2570 * _2586;
        float _2590 = _2584 + (-1.0);
        float _2592 = fma(_2426, _2588, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2594 = fma(_2430, _2588, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2596 = _2590 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2598 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2600 = _2592 + _2598;
        float _2602 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2604 = _2594 + _2602;
        float _2606 = fma(_2520, _2584, _2596);
        float _2608 = _2600 * _2600;
        float _2610 = _2604 * _2604;
        _2562 = _2606;
        _2554 = _2608;
        _2544 = _2610;
        _2536 = _2594;
        _2538 = _2592;
    }
    float _2612 = _2562;
    float _2614 = _2554;
    float _2616 = _2544;
    float _2618 = _2536;
    float _2620 = _2538;
    bool _2622 = _335 > 0.5;
    float _2624 = as_type<float>(_2462) * _2552;
    float _2626 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2208);
    float _2628 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2210);
    float _2630 = -_213;
    int _2632 = _2622 ? as_type<int>(_2630) : as_type<int>(_213);
    float _2634 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2212);
    bool _2636 = _337 > 0.5;
    float _2638 = as_type<float>(_2472) * _2558;
    float _2640 = -_209;
    int _2642 = _1918 ? as_type<int>(_2640) : as_type<int>(_209);
    float _2644 = trunc(_2624);
    float _2646 = precise::max(_2644, 0.0);
    uint _2648 = uint(_2646);
    float _2650 = -_209;
    int _2652 = _2636 ? as_type<int>(_2650) : as_type<int>(_209);
    float _2654 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2656 = !_1334;
    float _2658 = _2656 ? _213 : as_type<float>(_2632);
    float _2660 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2662 = _2612 + _2660;
    bool _2664 = !_1312;
    float _2666 = _2664 ? _209 : as_type<float>(_2652);
    float _2668 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2670 = !_1340;
    float _2672 = _2670 ? _209 : as_type<float>(_2642);
    float _2674 = trunc(_2512);
    float _2676 = precise::max(_2674, 0.0);
    uint _2678 = uint(_2676);
    float _2680 = _2654 * _2174;
    float _2682 = _2654 * _2216;
    int _2684 = int(_2460) + int(_2526);
    float _2686 = -_1880;
    float _2688 = _2686 + 1.0;
    int _2690 = ~_2304;
    int _2692 = _2690 + 1;
    float _2694 = fma(_2668, _2626, _2680);
    float _2696 = fma(_2662, _2662, _2614);
    float _2698 = trunc(_2638);
    float _2700 = precise::max(_2698, 0.0);
    uint _2702 = uint(_2700);
    float _2704 = _2654 * _2214;
    int _2706 = _2692 * _2684;
    int _2708 = _2706 + _2358;
    int _2710 = int(_2496) + int(_2648);
    float _2712 = -_2688;
    float _2714 = fma(_427, _2712, _1994);
    float _2716 = fma(_2668, _2628, _2704);
    float _2718 = fma(_2668, _2634, _2682);
    int _2720 = ~_2272;
    int _2722 = _2720 + 1;
    float _2724 = -_1882;
    float _2726 = _2724 + 1.0;
    int _2728 = int(_2468) + int(_2678);
    float _2730 = -_1734;
    float _2732 = _2730 + 1.0;
    out.m_72.x = _2626;
    out.m_72.y = _2628;
    out.m_72.z = _2634;
    int _2734 = ~_2374;
    int _2736 = _2734 + 1;
    int _2738 = ~_2364;
    int _2740 = _2738 + 1;
    int _2742 = _2722 * _2728;
    int _2744 = _2742 + _2402;
    int _2746 = int(_2510) + int(_2702);
    int _2748 = _2736 * _2710;
    int _2750 = _2748 + _2470;
    bool _2752 = uint(_2708) >= uint(_2304);
    float _2754 = _2696 + _2616;
    bool _2756 = uint(_2744) >= uint(_2272);
    int _2758 = _2740 * _2746;
    int _2760 = _2758 + _2432;
    bool _2762 = !_2752;
    int _2764 = _2762 ? 0 : (-1);
    float _2766 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2768 = uint(_2750) >= uint(_2374);
    float _2770 = fma(_431, _2726, _2004);
    int _2772 = ~_2684;
    int _2774 = _2772 + _2764;
    int _2776 = _2774 + 1;
    bool _2778 = uint(_2760) >= uint(_2364);
    int _2780 = _2358 ^ _2304;
    float _2782 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2784 = !_2756;
    int _2786 = _2784 ? 0 : (-1);
    out.m_74.x = _2714;
    out.m_74.y = _2770;
    bool _2788 = _2304 == 0;
    bool _2790 = _2304 == 0;
    int _2792 = _2304 * _2776;
    int _2794 = _2792 + _2358;
    bool _2796 = !_2768;
    int _2798 = _2796 ? 0 : (-1);
    float _2800 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _2802 = uint(int(uint(_2780) >> uint(31)));
    int _2804 = ~_2728;
    int _2806 = _2804 + _2786;
    int _2808 = _2806 + 1;
    int _2810 = ~_2798;
    int _2812 = _2710 + _2810;
    int _2814 = _2812 + 1;
    int _2816 = ~int(_2802);
    int _2818 = _2816 + 1;
    int _2820 = _2272 * _2808;
    int _2822 = _2820 + _2402;
    int _2824 = _2402 ^ _2272;
    float _2826 = _2782 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2828 = !_2788;
    int _2830 = _2828 ? _2794 : (-1);
    float _2832 = sqrt(_2754);
    int _2834 = _2814 ^ _2818;
    bool _2836 = !_2778;
    int _2838 = _2836 ? 0 : (-1);
    float _2840 = _2800 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    uint _2842 = uint(int(uint(_2824) >> uint(31)));
    bool _2844 = _2272 == 0;
    float _2846 = float(_2830);
    int _2848 = ~_2818;
    int _2850 = _2848 + _2834;
    int _2852 = _2850 + 1;
    float _2854 = fma(_2654, _2654, 1.0);
    bool _2856 = _2272 == 0;
    float _2858 = fma(_2826, _2846, _1708);
    int _2860 = ~_2838;
    int _2862 = _2746 + _2860;
    int _2864 = _2862 + 1;
    float _2866 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2868 = ~int(_2842);
    int _2870 = _2868 + 1;
    bool _2872 = !_2844;
    int _2874 = _2872 ? _2822 : (-1);
    float _2876 = _2666 + 0.5;
    int _2878 = _2864 ^ _2870;
    float _2880 = float(_2874);
    float _2882 = rsqrt(_2854);
    int _2884 = ~_2870;
    int _2886 = _2884 + _2878;
    int _2888 = _2886 + 1;
    float _2890 = _2672 + 0.5;
    bool _2892 = _2832 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2894 = isnan(_2832);
    bool _2896 = _2892 || _2894;
    bool _2898 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2900 = _2896 || _2898;
    float _2902 = fma(_2840, _2880, _1818);
    bool _2904 = !_2790;
    int _2906 = _2904 ? _2852 : (-1);
    float _2908 = fma(_2826, _2890, _2858);
    bool _2910 = !_2856;
    int _2912 = _2910 ? _2888 : (-1);
    float _2914 = _2766 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2916 = float(_2906);
    float _2918 = fma(_2840, _2876, _2902);
    float _2920 = float(_2912);
    float _2922 = _2866 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2924 = _642 + (-0.5);
    float _2926 = -_1876;
    float _2928 = fma(_2914, _2916, _2926);
    float _2930 = _2658 + (-0.5);
    float _2932 = -_1884;
    float _2934 = fma(_2922, _2920, _2932);
    float _2936 = _2654 * _2882;
    float _2938 = _2280 + _2718;
    float _2940 = -_2914;
    float _2942 = fma(_2940, _2930, _2928);
    float _2944 = -_2922;
    float _2946 = fma(_2944, _2924, _2934);
    float _2948 = -_2264;
    float _2950 = _2936 * _2948;
    float _2952 = -_2266;
    float _2954 = _2936 * _2952;
    float _2956 = -_2280;
    float _2958 = _2936 * _2956;
    float _2960 = -_1758;
    float _2962 = _2960 + 1.0;
    float _2964 = fma(_2882, _2174, _2950);
    float _2966 = fma(_2882, _2214, _2954);
    float _2968 = -_1874;
    float _2970 = _2968 + 1.0;
    float _2972 = -_1878;
    float _2974 = _2972 + 1.0;
    float _2976 = fma(_2882, _2216, _2958);
    float _2978 = -_2962;
    float _2980 = fma(_2666, _2978, _2918);
    float _2982 = _2264 + _2694;
    float _2984 = _2266 + _2716;
    float _2986 = -_2970;
    float _2988 = fma(_2672, _2986, _2908);
    float _2990 = fma(_2658, _2974, _2942);
    float _2992 = fma(_642, _2732, _2946);
    out.m_76.x = _2964;
    out.m_76.y = _2966;
    out.m_76.z = _2976;
    float _2994 = _2942;
    if (!_2900)
    {
        _2994 = 1.0;
    }
    float _2996 = _2994;
    out.m_78.x = _2982;
    out.m_78.y = _2984;
    out.m_78.z = _2938;
    out.m_80.x = _2988;
    out.m_80.y = _2990;
    out.m_80.z = _2980;
    out.m_80.w = _2992;
    bool _2998 = !_2900;
    float _3000 = _2996;
    if (!_2998)
    {
        bool _3002 = _2832 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3004 = isnan(_2832);
        bool _3006 = _3002 || _3004;
        bool _3008 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3010 = _3006 || _3008;
        if (!_3010)
        {
            float _3012 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3014 = _2832 + _3012;
            float _3016 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3018 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3016;
            float _3020 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3022 = _3020 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3024 = 1.0 / _3018;
            float _3026 = _3014 * _3024;
            float _3028 = fma(_3026, _3022, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3000 = _3028;
            _3030 = true;
        }
        else
        {
            bool _3032 = _2832 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3034 = isnan(_2832);
            bool _3036 = _3032 || _3034;
            bool _3038 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3040 = _3036 || _3038;
            if (!_3040)
            {
                float _3042 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3044 = _2832 + _3042;
                float _3046 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3048 = _3046 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3050 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3052 = _3050 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3054 = 1.0 / _3048;
                float _3056 = _3044 * _3054;
                float _3058 = fma(_3056, _3052, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3000 = _3058;
                _3030 = true;
            }
            else
            {
                _3000 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3030 = false;
    float _3060 = _3000;
    float _3062 = _2502 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3064 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3066 = _2612 + _3064;
    float _3068 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3070 = _2618 + _3068;
    float _3072 = fma(_2404, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3062);
    float _3074 = _2502 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _3076 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3078 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3080 = _3076 || _3078;
    bool _3082 = isnan(0.5);
    bool _3084 = _3080 || _3082;
    float _3086 = fma(_3066, _3060, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3088 = fma(_2362, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3072);
    float _3090 = fma(_2404, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3074);
    float _3092 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3094 = _2620 + _3092;
    float _3096 = _3088 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3098 = fma(_2362, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3090);
    float _3100 = fma(_3094, _3060, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3102 = fma(_3070, _3060, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3104 = 1.0 / _3096;
    float _3106 = _3098 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _3108 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3110 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3112 = _3108 || _3110;
    bool _3114 = isnan(0.5);
    bool _3116 = _3112 || _3114;
    float _3118 = _3094;
    float _3120 = _3106;
    float _3122 = _3088;
    float _3124 = _3100;
    float _3126 = _3060;
    float _3128 = _3102;
    if (_3084)
    {
        _3118 = _3100;
    }
    float _3130 = _3118;
    float _3132 = _3106 + _3096;
    float _3134 = _3130;
    if (_3084)
    {
        _3120 = _3086;
    }
    float _3136 = _3120;
    float _3138 = _3136;
    if (_3084)
    {
        _3122 = _3102;
    }
    float _3140 = _3122;
    float _3142 = _3140;
    if (!_3084)
    {
        float _3144 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3146 = _2502 + _3144;
        float _3148 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3150 = _2404 + _3148;
        float _3152 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3154 = _3146 * _3146;
        float _3156 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3158 = _2362 + _3156;
        float _3160 = fma(_3150, _3150, _3154);
        float _3162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3164 = fma(_3158, _3158, _3160);
        float _3166 = sqrt(_3164);
        float _3168 = _3152 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3170 = precise::min(_3166, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3172 = _3170 * _3162;
        float _3174 = -_2404;
        float _3176 = _3174 + _3100;
        float _3178 = -_2362;
        float _3180 = _3178 + _3102;
        float _3182 = _3168 * _3172;
        float _3184 = -_2502;
        float _3186 = _3184 + _3086;
        float _3188 = fma(_3176, _3182, _2404);
        float _3190 = fma(_3186, _3182, _2502);
        float _3192 = fma(_3180, _3182, _2362);
        _3138 = _3190;
        _3134 = _3188;
        _3142 = _3192;
        _3124 = _3182;
        _3126 = _3180;
    }
    float _3194 = _3138;
    float _3196 = _3134;
    float _3198 = _3142;
    float _3200 = _3124;
    float _3202 = _3126;
    float _3204 = _3202;
    float _3206 = _3200;
    if (_3116)
    {
        _3204 = 1.0;
    }
    float _3208 = _3204;
    float _3210 = _3132 * _3104;
    float _3212 = _3210 * 0.5;
    float _3214 = _3208;
    float _3216 = _3212;
    if (!_3116)
    {
        float _3218 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3220 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3222 = fma(_3212, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3220);
        float _3224 = _3218 * 0.15915493667125701904296875;
        float _3226 = _3224 * 6.283185482025146484375;
        float _3228 = cos(_3226);
        float _3230 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3232 = _3230 * 0.15915493667125701904296875;
        float _3234 = _3224 * 6.283185482025146484375;
        float _3236 = sin(_3234);
        float _3238 = 1.0 / _3228;
        float _3240 = _3232 * 6.283185482025146484375;
        float _3242 = cos(_3240);
        float _3244 = _3236 * _3238;
        float _3246 = 1.0 / _3222;
        float _3248 = _3242 * _3244;
        float _3250 = _3232 * 6.283185482025146484375;
        float _3252 = sin(_3250);
        float _3254 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3256 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3254;
        float _3258 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3260 = _3246 * _3258;
        float _3262 = 1.0 / _3248;
        float _3264 = 1.0 / _3256;
        float _3266 = _3252 * _3262;
        float _3268 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3270 = fma(_3266, _3260, _3268);
        float _3272 = _3270 * _3264;
        float _3274 = precise::clamp(_3272, 0.0, 1.0);
        float _3276 = -_3274;
        float _3278 = _3276 + 1.0;
        _3128 = _3232;
        _3206 = _3264;
        _3214 = _3278;
    }
    float _3280 = _3128;
    float _3282 = _3206;
    float _3284 = _3214;
    float _3286 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3288 = _3194 + _3286;
    float _3290 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3292 = _3196 + _3290;
    float _3294 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3296 = _3198 + _3294;
    float _3298 = _3288 * _3288;
    float _3300 = fma(_3292, _3292, _3298);
    float _3302 = fma(_3296, _3296, _3300);
    float _3304 = rsqrt(_3302);
    float _3306 = sqrt(_3302);
    float _3308 = _3304 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3310 = _3292 * _3308;
    float _3312 = _3296 * _3308;
    float _3314 = _3310 * _3310;
    float _3316 = _3312 * _3312;
    float _3318 = _3314 + _3316;
    float _3320 = sqrt(_3318);
    bool _3322 = _3320 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3324 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3326 = _3320 + _3324;
    float _3328 = _3280;
    float _3330 = _3326;
    float _3332 = _3288;
    float _3334 = _3310;
    if (_3322)
    {
        float _3336 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3328 = _3336;
    }
    float _3338 = _3328;
    float _3340 = _3338;
    if (_3322)
    {
        float _3342 = _3326 * _3338;
        _3330 = _3342;
    }
    float _3344 = _3330;
    if (_3322)
    {
        float _3346 = rsqrt(_3318);
        _3340 = _3346;
    }
    float _3348 = _3340;
    float _3350 = _3348;
    if (_3322)
    {
        float _3352 = _3344 * 0.15915493667125701904296875;
        _3216 = _3352;
    }
    float _3354 = _3216;
    float _3356 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3358 = _3296;
    if (_3322)
    {
        float _3360 = _3354 * 6.283185482025146484375;
        float _3362 = sin(_3360);
        _3358 = _3362;
    }
    float _3364 = _3358;
    float _3366 = precise::max(0.0, _3356);
    float _3368 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3370 = _3282;
    float _3372 = _3366;
    if (_3322)
    {
        float _3374 = _3354 * 6.283185482025146484375;
        float _3376 = cos(_3374);
        _3370 = _3376;
    }
    float _3378 = _3370;
    float _3380 = -_3308;
    float _3382 = -_3366;
    float _3384 = fma(_3288, _3380, _3382);
    if (_3322)
    {
        float _3386 = _3384 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3332 = _3386;
    }
    float _3388 = _3332;
    float _3390 = _3364;
    float _3392 = _3388;
    if (_3322)
    {
        float _3394 = fma(_3364, _3388, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3390 = _3394;
    }
    float _3396 = _3390;
    float _3398 = _3396;
    if (!_3322)
    {
        _3392 = _3384;
    }
    float _3400 = _3392;
    float _3402 = _3400;
    if (_3322)
    {
        float _3404 = _3348 * _3396;
        _2540 = _3404;
    }
    float _3406 = _2540;
    if (!_3322)
    {
        _3398 = _3314;
    }
    float _3408 = _3398;
    float _3410 = _3194 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3412 = _3408;
    float _3414 = _3378;
    if (_3322)
    {
        float _3416 = _3378 + (-1.0);
        _3372 = _3416;
    }
    float _3418 = _3372;
    float _3420 = _3418;
    if (_3322)
    {
        float _3422 = _3310 * _3406;
        _3334 = _3422;
    }
    float _3424 = _3334;
    float _3426 = fma(_3196, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3410);
    if (_3322)
    {
        float _3428 = _3418 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3350 = _3428;
    }
    float _3430 = _3350;
    if (!_3322)
    {
        _3420 = _3312;
    }
    float _3432 = _3420;
    float _3434 = _3432;
    if (_3322)
    {
        float _3436 = _3312 * _3406;
        _3434 = _3436;
    }
    float _3438 = _3434;
    if (_3322)
    {
        float _3440 = _3424 * _3424;
        _3412 = _3440;
    }
    float _3442 = _3412;
    if (_3322)
    {
        float _3444 = fma(_3384, _3378, _3430);
        _3402 = _3444;
    }
    float _3446 = _3402;
    if (!_3322)
    {
        _3414 = _3316;
    }
    float _3448 = _3414;
    float _3450 = _3448;
    if (_3322)
    {
        float _3452 = _3438 * _3438;
        _3450 = _3452;
    }
    float _3454 = _3450;
    float _3456 = fma(_3446, _3446, _3442);
    float _3458 = fma(_3198, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3426);
    float _3460 = _3456 + _3454;
    float _3462 = _3194 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3464 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3466 = fma(_3306, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3464);
    float _3468 = precise::clamp(_3466, 0.0, 1.0);
    float _3470 = _3194 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3472 = rsqrt(_3460);
    float _3474 = fma(_3196, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3462);
    float _3476 = -_3468;
    float _3478 = _3476 + 1.0;
    float _3480 = fma(_3196, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3470);
    float _3482 = _3458 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3484 = fma(_3198, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3474);
    float _3486 = _3194 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3488 = fma(_3198, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3480);
    float _3490 = abs(_3478);
    float _3492 = log2(_3490);
    float _3494 = _3484 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3496 = fma(_3196, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3486);
    float _3498 = _3488 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3500 = _3494 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3502 = fma(_3198, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3496);
    float _3504 = _3472 * _3424;
    float _3506 = -_3500;
    float _3508 = fma(_3506, _3368, 1.0);
    float _3510 = _3472 * _3446;
    float _3512 = _3502 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3514 = _3498 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3516 = _3504 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3518 = _3472 * _3438;
    float _3520 = log2(_3508);
    float _3522 = fma(_3512, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3514);
    float _3524 = -_3516;
    float _3526 = fma(_3510, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3524);
    float _3528 = _3492 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3530 = fma(_3494, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3522);
    float _3532 = -_3518;
    float _3534 = fma(_3532, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3526);
    float _3536 = _3498 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3538 = fma(_3482, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3530);
    float _3540 = fma(_3534, -0.5, 0.5);
    float _3542 = exp2(_3528);
    float _3544 = _3498 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3546 = fma(_3512, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3536);
    float _3548 = fma(_3534, 0.5, 0.5);
    float _3550 = _3510 + 1.0;
    float _3552 = fma(_3512, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3544);
    float _3554 = fma(_3494, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3546);
    float _3556 = fma(_3548, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3558 = 1.0 / _3538;
    float _3560 = fma(_3494, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3552);
    float _3562 = fma(_3482, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3554);
    float _3564 = fma(_3548, _3556, -0.212114393711090087890625);
    float _3566 = fma(_3482, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3560);
    float _3568 = fma(_3548, _3564, 1.570728778839111328125);
    float _3570 = sqrt(_3540);
    float _3572 = -_3510;
    float _3574 = fma(_3542, _3550, _3572);
    float _3576 = _3520 * 0.693147182464599609375;
    float _3578 = fma(_3574, 0.5, 0.5);
    float _3580 = _3576 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3582 = _3562 * _3558;
    float _3584 = _3566 * _3558;
    float _3586 = fma(_3582, 0.5, 0.5);
    float _3588 = fma(_3584, -0.5, 0.5);
    float _3590 = _3570 * 0.636619746685028076171875;
    float _3592 = -_3568;
    float _3594 = fma(_3590, _3592, 1.0);
    float3 _8966 = float3(_3586, _3588, _3580);
    float _3596 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8966, float3(0.0), isnan(_8966)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8966, float3(0.0), isnan(_8966)), level(0.0)).x;
    float3 _8977 = float3(_3586, _3588, _3580);
    float4 _3599 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8977, float3(0.0), isnan(_8977)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8977, float3(0.0), isnan(_8977)), level(0.0)).xyzw;
    float _3601 = _3599.x;
    float _3603 = _3599.y;
    float _3605 = _3599.z;
    float _3607 = _3599.w;
    float2 _8994 = float2(_3594, _3578);
    float3 _3611 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8994, float2(0.0), isnan(_8994)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8994, float2(0.0), isnan(_8994)), level(0.0)).xyz;
    float _3613 = _3611.x;
    float _3615 = _3611.y;
    float _3617 = _3611.z;
    float _3619 = _3498 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3621 = _3492 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3623 = _3284 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3625 = _3562 + _3538;
    float _3627 = fma(_3512, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3619);
    bool _3629 = _3284 > 0.0;
    bool _3631 = isnan(_3284);
    bool _3633 = _3629 || _3631;
    bool _3635 = isnan(0.0);
    bool _3637 = _3633 || _3635;
    out.m_82.x = _3196;
    out.m_82.y = _3194;
    out.m_82.z = _3198;
    float _3639 = exp2(_3621);
    float _3641 = fma(_3494, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3627);
    float _3643 = _3538 * 0.5;
    float _3645 = _3625 * 0.5;
    float _3647 = fma(_3482, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3641);
    float _3649 = _3647 + _3538;
    out.gl_Position.x = _3562;
    out.gl_Position.y = _3566;
    out.gl_Position.z = _3647;
    out.gl_Position.w = _3538;
    float _3651 = _3649 * 0.5;
    float _3653 = -_3639;
    float _3655 = _3653 + 1.0;
    float _3657 = fma(_3566, -0.5, _3643);
    float _3659 = _3623 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3661 = _3655 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_84.x = _3645;
    out.m_84.y = _3657;
    out.m_84.z = _3651;
    out.m_84.w = _3538;
    float _3663 = -_3661;
    float _3665 = _3663 + 1.0;
    out.m_47.x = _3659;
    float _3667 = _3661 * _3596;
    float _3669 = _3607 * _3665;
    float _3671 = _3607 * _3667;
    float _3673 = _3617 * _3667;
    float _3675 = fma(_3613, _3671, _3601);
    float _3677 = fma(_3615, _3671, _3603);
    float _3679 = fma(_3607, _3673, _3605);
    out.m_86.x = _3675;
    out.m_86.y = _3677;
    out.m_86.z = _3679;
    out.m_86.w = _3669;
    if (_3637)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _3681 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3681;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3030 = false;
    bool _321 = false;
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
        float _3738 = as_type<float>(_121);
        out.gl_Position.z = _3738;
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
    float _141 = _139;
    if (_135)
    {
        float _143 = float(_105);
        _115 = _143;
    }
    float _145 = _115;
    bool _147 = _139 >= _145;
    bool _149 = !_135;
    bool _151 = _147 || _149;
    float _153 = _145;
    if (_151)
    {
        _153 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _153;
    if (_151)
    {
        out.m_47.x = 0.0;
    }
    if (_151)
    {
        float _157 = _155 * 5.0;
        _123 = as_type<int>(_157);
    }
    int _159 = _123;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3808 = as_type<float>(_159);
        out.gl_Position.z = _3808;
    }
    if (_151)
    {
        return out;
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    float _163 = in.m_54.w;
    bool _165 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _167 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _169 = _165 || _167;
    bool _171 = isnan(1.0);
    bool _173 = _169 || _171;
    float _175 = in.m_49.x;
    float _177 = in.m_49.y;
    float _179 = in.m_49.z;
    float _181 = in.m_44.x;
    float _183 = in.m_44.y;
    float _185 = in.m_44.z;
    int _187 = as_type<int>(_161) & 1;
    bool _189 = _187 != 0;
    int _191 = as_type<int>(_161) & 2;
    bool _193 = _191 != 0;
    float _195 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _197 = 0.0;
    float _199 = _195;
    if (!_173)
    {
        float _201 = _195 * _195;
        float _203 = _201 * 0.5;
        _197 = _203;
    }
    float _205 = _197;
    bool _207 = !_189;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_193;
    float _213 = _211 ? (-0.5) : 0.5;
    float _215 = _205;
    if (!_173)
    {
        float _217 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _215 = _217;
    }
    float _219 = _215;
    bool _221 = !_173;
    float _223 = _219;
    if (!_221)
    {
        float _225 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = log2(_225);
        float _229 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _231 = _229 + 1.0;
        float _233 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = _195 * _227;
        float _237 = 1.0 / _231;
        float _239 = _233 * 0.693147182464599609375;
        float _241 = exp2(_235);
        float _243 = 1.0 / _239;
        float _245 = _241 + (-1.0);
        float _247 = -_245;
        float _249 = fma(_247, _243, _195);
        float _251 = _249 * _237;
        float _253 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _223 = _253;
    }
    float _255 = _223;
    bool _257 = !_173;
    if (!_257)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _195 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _199 = _277;
    }
    float _279 = _199;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _283 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _285 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _287 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _289 = fma(_279, _175, _283);
    float _291 = fma(_279, _177, _285);
    float _293 = fma(_279, _179, _287);
    float _295 = fma(_289, _163, _181);
    float _297 = fma(_291, _163, _183);
    float _299 = fma(_293, _163, _185);
    bool _301 = !_281;
    float _319;
    if (!_301)
    {
        float _303 = in.m_56.x;
        float _305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _307 = _303 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _311 = _309 * _305;
        float _313 = floor(_311);
        float _315 = -_313;
        float _317 = _311 + _315;
        _319 = _317;
        _321 = true;
    }
    else
    {
        float _323 = float(_105);
        float _325 = 1.0 / _323;
        float _327 = _139 * _325;
        _319 = _327;
    }
    _321 = false;
    float _329 = _319;
    float _331 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _333 = int(_331);
    float _335 = in.m_56.y;
    float _337 = in.m_56.z;
    float _339 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _341 = int(_339);
    float _343 = float(_105);
    float _345 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _347 = int(_345);
    float _349 = float(_333);
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _351;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _359;
    bool _363 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _365 = isnan(_329);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = 1.0 / _349;
    float _377 = float(_341);
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _379;
    bool _383 = _335 > 0.5;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _389 = _337 > 0.5;
    float _391 = -_209;
    int _393 = _383 ? as_type<int>(_391) : as_type<int>(_209);
    float _395 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _397 = int(_395);
    float _399 = float(uint(_347));
    int _401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _403 = _401 != 0;
    int _405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _407 = _405 != 0;
    int _409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _411 = _409 != 0;
    float _413 = -_213;
    int _415 = _389 ? as_type<int>(_413) : as_type<int>(_213);
    int _417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _419 = _417 != 0;
    float _421 = 1.0 / _377;
    float _423 = _375 * _139;
    bool _425 = !_407;
    float _427 = _425 ? _209 : as_type<float>(_393);
    bool _429 = !_411;
    float _431 = _429 ? _213 : as_type<float>(_415);
    int _433 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _435 = _433 != 0;
    int _437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _439 = _437 != 0;
    int _441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _443 = _441 != 0;
    float _445 = 1.0 / _399;
    float _447 = float(uint(_397));
    int _449 = ~_397;
    int _451 = _449 + 1;
    bool _453 = !_439;
    int _455 = _453 ? 0 : 1;
    int _457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _459 = _457 != 0;
    float _461 = trunc(_423);
    int _463 = int(_461);
    float _465 = _421 * _139;
    float _467 = float(_347);
    float _469 = in.m_56.w;
    bool _471 = !_435;
    int _473 = _471 ? 0 : 1;
    bool _475 = !_443;
    int _477 = _475 ? 0 : 1;
    float _479 = 1.0 / _447;
    int _481 = as_type<int>(_445) + (-2);
    int _483 = ~_347;
    int _485 = _483 + 1;
    int _487 = abs(_477);
    float _489 = trunc(_465);
    int _491 = int(_489);
    float _493 = float(uint(_463));
    float _495 = as_type<float>(_481) * _493;
    int _497 = as_type<int>(_479) + (-2);
    float _499 = 1.0 / _343;
    float _501 = float(uint(_491));
    float _503 = trunc(_495);
    float _505 = precise::max(_503, 0.0);
    uint _508 = uint(_505);
    float _510 = as_type<float>(_497) * _501;
    float _512 = in.m_56.x;
    float _514 = trunc(_510);
    float _516 = precise::max(_514, 0.0);
    uint _518 = uint(_516);
    int _520 = _485 * int(_508);
    int _522 = _520 + _463;
    float _524 = 1.0 / _357;
    float _526 = float(uint(_522));
    int _528 = _451 * int(_518);
    int _530 = _528 + _491;
    float _532 = as_type<float>(_481) * _526;
    float _534 = 1.0 / _353;
    float _536 = float(uint(_530));
    bool _538 = !_419;
    int _540 = _538 ? 0 : 1;
    bool _542 = _469 > 0.5;
    float _544 = as_type<float>(_497) * _536;
    float _546 = _469;
    if (_459)
    {
        _546 = 1.0;
    }
    float _548 = _546;
    float _550 = trunc(_532);
    float _552 = precise::max(_550, 0.0);
    uint _554 = uint(_552);
    float _556 = _548;
    if (!_459)
    {
        _556 = 7.345489978790283203125;
    }
    float _558 = _556;
    int _560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _562 = _560 != 0;
    int _564 = abs(_540);
    float _566 = _558 * _512;
    float _568 = trunc(_544);
    float _570 = precise::max(_568, 0.0);
    uint _572 = uint(_570);
    int _574 = ~_347;
    int _576 = _574 + 1;
    int _578 = int(_508) + int(_554);
    float _580 = floor(_566);
    int _582 = ~_397;
    int _584 = _582 + 1;
    int _586 = _576 * _578;
    int _588 = _586 + _463;
    int _590 = int(_518) + int(_572);
    float _592 = 1.0 / _361;
    float _594 = float(_463);
    bool _596 = !_562;
    int _598 = _596 ? 0 : 1;
    int _600 = _584 * _590;
    int _602 = _600 + _491;
    bool _604 = uint(_588) >= uint(_347);
    float _606 = -_580;
    float _608 = _566 + _606;
    bool _610 = _594 >= _467;
    bool _612 = isnan(_594);
    bool _614 = _610 || _612;
    bool _616 = isnan(_467);
    bool _618 = _614 || _616;
    float _620 = float(_618);
    float _622 = _499 * _139;
    float _624 = -_213;
    int _626 = _542 ? as_type<int>(_624) : as_type<int>(_213);
    float _628 = _608 * _467;
    float _630 = trunc(_620);
    int _632 = int(_630);
    int _634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _636 = _634 != 0;
    float _638 = _467 * _622;
    bool _640 = !_403;
    float _642 = _640 ? _213 : as_type<float>(_626);
    bool _644 = uint(_602) >= uint(_397);
    bool _646 = !_604;
    float _648 = _646 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _650 = trunc(_628);
    int _652 = int(_650);
    bool _654 = !_636;
    int _656 = _654 ? 0 : 1;
    bool _658 = !_644;
    int _660 = _658 ? 0 : (-1);
    int _662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _664 = _662 != 0;
    int _666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _668 = _666 != 0;
    int _670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _672 = _670 != 0;
    int _674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _676 = _674 != 0;
    int _678 = ~_578;
    int _680 = _678 + as_type<int>(_648);
    int _682 = _680 + 1;
    float _684 = trunc(_638);
    int _686 = int(_684);
    int _688 = ~_632;
    int _690 = _688 + 1;
    int _692 = _690 + 1;
    bool _694 = !_668;
    int _696 = _694 ? 0 : 1;
    int _698 = _347 * _682;
    int _700 = _698 + _463;
    bool _702 = _347 == 0;
    int _704 = _347 + (-1);
    int _706 = _652 * _564;
    int _708 = _706 + _463;
    bool _710 = !_702;
    int _712 = _710 ? _700 : (-1);
    float _714 = _648;
    float _716 = _620;
    if (_459)
    {
        _714 = 1.0;
    }
    float _718 = _714;
    float _720 = _718;
    if (_459)
    {
        _716 = _512;
    }
    float _722 = _716;
    int _724 = _712 * _692;
    float _726 = _722;
    if (!_459)
    {
        _720 = 1.2345600128173828125;
    }
    float _728 = _720;
    if (!_459)
    {
        _726 = _335;
    }
    float _730 = _726;
    int _732 = _632 * _704;
    int _734 = _732 + _724;
    int _736 = abs(_455);
    int _738 = abs(_473);
    float _740 = _728 * _730;
    int _742 = abs(_598);
    int _744 = _734 * _736;
    float _746 = floor(_740);
    float _748 = float(_397);
    int _750 = _686 * _738;
    int _752 = _750 + _744;
    float _754 = float(_491);
    int _756 = _708 * _487;
    int _758 = _756 + _752;
    bool _760 = _754 >= _748;
    bool _762 = isnan(_754);
    bool _764 = _760 || _762;
    bool _766 = isnan(_748);
    bool _768 = _764 || _766;
    float _770 = float(_768);
    float _772 = _748 * _622;
    int _774 = ~_590;
    int _776 = _774 + _660;
    int _778 = _776 + 1;
    int _780 = _652 * _742;
    int _782 = _780 + _758;
    bool _784 = !_664;
    int _786 = _784 ? 0 : 1;
    float _788 = trunc(_770);
    int _790 = int(_788);
    int _792 = _397 * _778;
    int _794 = _792 + _491;
    float _796 = float(uint(_782));
    float _798 = -_746;
    float _800 = _740 + _798;
    bool _802 = _397 == 0;
    float _804 = as_type<float>(_481) * _796;
    float _806 = _800 * _748;
    int _808 = ~_347;
    int _810 = _808 + 1;
    float _812 = trunc(_772);
    int _814 = int(_812);
    int _816 = ~_790;
    int _818 = _816 + 1;
    int _820 = _818 + 1;
    float _822 = trunc(_806);
    int _824 = int(_822);
    float _826 = trunc(_804);
    float _828 = precise::max(_826, 0.0);
    uint _830 = uint(_828);
    int _832 = abs(_656);
    bool _834 = !_802;
    int _836 = _834 ? _794 : (-1);
    int _838 = _397 + (-1);
    int _840 = _836 * _820;
    int _842 = _824 * _832;
    int _844 = _842 + _491;
    int _846 = _790 * _838;
    int _848 = _846 + _840;
    int _850 = abs(_696);
    bool _852 = !_672;
    int _854 = _852 ? 0 : 1;
    int _856 = _810 * int(_830);
    int _858 = _856 + _782;
    int _860 = abs(_786);
    bool _862 = !_676;
    int _864 = _862 ? 0 : 1;
    int _866 = abs(_854);
    int _868 = _848 * _850;
    float _870 = float(uint(_858));
    int _872 = abs(_864);
    float _874 = as_type<float>(_481) * _870;
    int _876 = _814 * _860;
    int _878 = _876 + _868;
    float _880 = trunc(_874);
    float _882 = precise::max(_880, 0.0);
    uint _884 = uint(_882);
    float _886 = float(uint(_708));
    int _888 = _844 * _866;
    int _890 = _888 + _878;
    int _892 = ~_347;
    int _894 = _892 + 1;
    float _896 = as_type<float>(_481) * _886;
    int _898 = _824 * _872;
    int _900 = _898 + _890;
    int _902 = ~_347;
    int _904 = _902 + 1;
    int _906 = ~_397;
    int _908 = _906 + 1;
    float _910 = trunc(_896);
    float _912 = precise::max(_910, 0.0);
    uint _914 = uint(_912);
    float _916 = float(uint(_900));
    int _918 = int(_830) + int(_884);
    float _920 = as_type<float>(_497) * _916;
    float _922 = trunc(_920);
    float _924 = precise::max(_922, 0.0);
    uint _926 = uint(_924);
    int _928 = _904 * _918;
    int _930 = _928 + _782;
    int _932 = _894 * int(_914);
    int _934 = _932 + _708;
    bool _936 = uint(_930) >= uint(_347);
    float _938 = float(uint(_934));
    bool _940 = !_936;
    int _942 = _940 ? 0 : (-1);
    float _944 = as_type<float>(_481) * _938;
    int _946 = ~_918;
    int _948 = _946 + _942;
    int _950 = _948 + 1;
    int _952 = _908 * int(_926);
    int _954 = _952 + _900;
    float _956 = trunc(_944);
    float _958 = precise::max(_956, 0.0);
    uint _960 = uint(_958);
    int _962 = _347 * _950;
    int _964 = _962 + _782;
    float _966 = float(uint(_954));
    bool _968 = !_702;
    int _970 = _968 ? _964 : (-1);
    float _972 = as_type<float>(_497) * _966;
    int _974 = ~_347;
    int _976 = _974 + 1;
    int _978 = _970 & 3;
    bool _980 = _978 != 0;
    int _982 = _970 & 3;
    bool _984 = _982 != 0;
    float _986 = trunc(_972);
    float _988 = precise::max(_986, 0.0);
    uint _990 = uint(_988);
    int _992 = _980 ? 0 : 1;
    bool _994 = uint(_982) > 1u;
    int _996 = int(_914) + int(_960);
    int _998 = ~_397;
    int _1000 = _998 + 1;
    int _1002 = ~_992;
    int _1004 = _1002 + 1;
    int _1006 = _1004 + 1;
    bool _1008 = !_984;
    int _1010 = _1008 ? 0 : 1;
    int _1012 = _1006;
    int _1014 = _996;
    if (!_994)
    {
        int _1016 = ~_992;
        int _1018 = _1016 + 1;
        _1012 = _1018;
    }
    int _1020 = _1012;
    int _1022 = _976 * _996;
    int _1024 = _1022 + _708;
    int _1026 = int(_926) + int(_990);
    bool _1028 = uint(_982) >= 2u;
    int _1030 = _1028 ? 0 : 1;
    bool _1032 = uint(_1024) >= uint(_347);
    int _1034 = _1000 * _1026;
    int _1036 = _1034 + _900;
    int _1038 = ~_1030;
    int _1040 = _1038 + 1;
    int _1042 = _1040 + 1;
    bool _1044 = !_1032;
    int _1046 = _1044 ? 0 : (-1);
    bool _1048 = uint(_1036) >= uint(_397);
    int _1050 = ~_996;
    int _1052 = _1050 + _1046;
    int _1054 = _1052 + 1;
    bool _1056 = !_1048;
    int _1058 = _1056 ? 0 : (-1);
    bool _1060 = _982 != 3;
    int _1062 = _347 * _1054;
    int _1064 = _1062 + _708;
    int _1066 = ~_1026;
    int _1068 = _1066 + _1058;
    int _1070 = _1068 + 1;
    float _1072 = _335 * 2.0;
    int _1074 = _1042;
    int _1076 = _1064;
    if (_459)
    {
        _1014 = 0;
    }
    int _1078 = _1014;
    int _1080 = _1078;
    if (!_459)
    {
        _1080 = 1;
    }
    int _1082 = _1080;
    int _1084 = _397 * _1070;
    int _1086 = _1084 + _900;
    float _1088 = _512 * 2.0;
    bool _1090 = !_702;
    int _1092 = _1090 ? _1064 : (-1);
    float _1094 = floor(_1072);
    bool _1096 = _1082 != 1;
    if (_1060)
    {
        int _1098 = ~_1030;
        int _1100 = _1098 + 1;
        _1074 = _1100;
    }
    int _1102 = _1074;
    int _1104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1106 = _1104 != 0;
    bool _1108 = !_802;
    int _1110 = _1108 ? _1086 : (-1);
    float _1112 = floor(_1088);
    bool _1114 = !_1106;
    int _1116 = _1114 ? 0 : 1;
    float _1118 = in.m_58.x;
    float _1120 = in.m_58.y;
    float _1122 = in.m_58.z;
    int _1124 = _1110 & 3;
    bool _1126 = _1124 != 0;
    int _1128 = _1110 & 3;
    bool _1130 = _1128 != 0;
    bool _1132 = uint(_1124) > 1u;
    int _1134 = _1130 ? 0 : 1;
    if (_459)
    {
        _1076 = 0;
    }
    int _1136 = _1076;
    int _1138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1140 = _1138 != 0;
    int _1142 = _1136;
    if (!_459)
    {
        _1142 = 2;
    }
    int _1144 = _1142;
    bool _1146 = !_1140;
    int _1148 = _1146 ? 0 : 1;
    int _1150 = ~_1134;
    int _1152 = _1150 + 1;
    int _1154 = _1152 + 1;
    bool _1156 = _1144 != 2;
    float _1158 = -_213;
    float _1160 = _1158 + 0.5;
    float _1162 = 0.0;
    int _1164 = _1154;
    if (!_1096)
    {
        _1162 = _335;
    }
    float _1166 = _1162;
    float _1168 = _1166;
    if (!_1132)
    {
        int _1170 = ~_1134;
        int _1172 = _1170 + 1;
        _1164 = _1172;
    }
    int _1174 = _1164;
    float _1176 = _209 + 0.5;
    bool _1178 = _1112 > 0.0;
    float _1180 = _297 * _1120;
    float _1182 = 0.0;
    if (!_1096)
    {
        _1182 = _1166;
    }
    float _1184 = _1182;
    float _1186 = _335 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1188 = 0.0;
    float _1190 = _1184;
    if (!_1096)
    {
        _1188 = _337;
    }
    float _1192 = _1188;
    out.m_60.x = _1176;
    out.m_60.y = _1160;
    float _1194 = 0.0;
    float _1196 = _1192;
    if (!_1096)
    {
        _1194 = _337;
    }
    float _1198 = _1194;
    float _1200 = _1198;
    if (_1096)
    {
        _1190 = _512;
    }
    float _1202 = _1190;
    if (_1096)
    {
        _1168 = _512;
    }
    float _1204 = _1168;
    if (_1096)
    {
        _1196 = _335;
    }
    float _1206 = _1196;
    float _1208 = _1202 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1096)
    {
        _1200 = _335;
    }
    float _1210 = _1200;
    bool _1212 = _1112 >= 0.0;
    bool _1214 = isnan(_1112);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan(0.0);
    bool _1220 = _1216 || _1218;
    float _1222 = 0.0;
    if (_1156)
    {
        _1222 = _512;
    }
    float _1224 = _1222;
    int _1226 = _1220 ? 0 : 1;
    float _1228 = 0.0;
    float _1230 = _1224;
    if (_1156)
    {
        _1228 = _335;
    }
    float _1232 = _1228;
    int _1234 = ~_1226;
    int _1236 = _1234 + 1;
    int _1238 = _1236 + 1;
    float _1240 = _1232;
    int _1242 = _1238;
    if (!_1156)
    {
        _1230 = _337;
    }
    float _1244 = _1230;
    if (!_1156)
    {
        _1240 = _512;
    }
    float _1246 = _1240;
    bool _1248 = _1094 > 0.0;
    bool _1250 = _1094 >= 0.0;
    bool _1252 = isnan(_1094);
    bool _1254 = _1250 || _1252;
    bool _1256 = isnan(0.0);
    bool _1258 = _1254 || _1256;
    if (!_1178)
    {
        int _1260 = ~_1226;
        int _1262 = _1260 + 1;
        _1242 = _1262;
    }
    int _1264 = _1242;
    float _1266 = in.m_62.x;
    float _1268 = in.m_62.y;
    float _1270 = in.m_62.z;
    bool _1272 = _982 != 3;
    int _1274 = _1258 ? 0 : 1;
    float _1276 = in.m_64.x;
    float _1278 = in.m_64.y;
    float _1280 = in.m_64.z;
    bool _1282 = !_1126;
    int _1284 = _1282 ? 0 : 1;
    bool _1286 = uint(_1124) >= 2u;
    bool _1288 = _1124 != 3;
    bool _1290 = !_1272;
    int _1292 = _1290 ? 0 : (-1);
    bool _1294 = !_1288;
    int _1296 = _1294 ? 0 : (-1);
    int _1298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1300 = _1298 != 0;
    int _1302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1304 = _1302 != 0;
    int _1306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1308 = _1306 != 0;
    int _1310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1312 = _1310 != 0;
    int _1314 = ~_1274;
    int _1316 = _1314 + 1;
    int _1318 = _1316 + 1;
    int _1320 = _1286 ? 0 : 1;
    float _1322 = _297 * _1268;
    int _1324 = _1318;
    if (!_1248)
    {
        int _1326 = ~_1274;
        int _1328 = _1326 + 1;
        _1324 = _1328;
    }
    int _1330 = _1324;
    int _1332 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1334 = _1332 != 0;
    float _1336 = fma(_295, _1266, _1322);
    int _1338 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1340 = _1338 != 0;
    float _1342 = _297 * _1278;
    float _1344 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1346 = _512 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1348 = fma(_295, _1276, _1342);
    float _1350 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1352 = _1350 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1354 = _1344 * _512;
    float _1356 = fma(_295, _1118, _1180);
    float _1358 = fma(_299, _1280, _1348);
    float _1360 = trunc(_1354);
    int _1362 = int(_1360);
    float _1364 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1368 = _329 + _1366;
    float _1370 = fma(_299, _1122, _1356);
    float _1372 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1374 = fma(_1186, -2.0, _1364);
    float _1376 = _1368 * _524;
    float _1378 = fma(_299, _1270, _1336);
    float _1380 = 1.0 / _1352;
    float _1382 = -_1372;
    float _1384 = fma(_1346, 2.0, _1382);
    float _1386 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1388 = _329 + _1386;
    float _1390 = _512 + _335;
    float _1392 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1394 = _329 + _1392;
    float _1396 = _337 * 2.0;
    float _1398 = _1388 * _534;
    float _1400 = _1390 + (-1.0);
    int _1402 = _1362 << 4;
    int _1404 = _1402 + 1712;
    float _1406 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1408 = _329 + _1406;
    float _1410 = floor(_1396);
    int _1412 = _1404 + 8;
    uint _1414 = uint(int(uint(_1412) >> uint(2)));
    uint _1416 = uint(int(uint(int(_1414)) >> uint(2)));
    int _1418 = int(_1414) & 3;
    float _1420 = (*spvDescriptorSet0.vp_c9)._m0[int(_1416)][_1418];
    float _1422 = _1408 * _592;
    float _1424 = _337 + _335;
    float _1426 = _512 + _337;
    float _1428 = _1394 * _1380;
    float _1430 = _1424 + (-1.0);
    uint _1432 = uint(int(uint(_1404) >> uint(2)));
    uint _1434 = uint(int(uint(int(_1432)) >> uint(2)));
    int _1436 = int(_1432) & 3;
    float _1438 = (*spvDescriptorSet0.vp_c9)._m0[int(_1434)][_1436];
    int _1440 = int(_1432) + 1;
    uint _1442 = uint(int(uint(_1440) >> uint(2)));
    int _1444 = _1440 & 3;
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[int(_1442)][_1444];
    float _1448 = _1426 + (-1.0);
    float _1450 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1452 = !_1300;
    int _1454 = _1452 ? 0 : 1;
    float _1456 = fma(_1400, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1458 = fma(_1448, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1460 = _1410 >= 0.0;
    bool _1462 = isnan(_1410);
    bool _1464 = _1460 || _1462;
    bool _1466 = isnan(0.0);
    bool _1468 = _1464 || _1466;
    float _1470 = fma(_387, _1376, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _1472 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _1474 = isnan(_329);
    bool _1476 = _1472 || _1474;
    bool _1478 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _1480 = _1476 || _1478;
    float _1482 = float(_1480);
    float _1484 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1484;
    int _1488 = _1468 ? 0 : 1;
    float _1490 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1492 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1490;
    bool _1494 = _1410 > 0.0;
    float _1496 = fma(_381, _1398, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _1498 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1500 = isnan(_329);
    bool _1502 = _1498 || _1500;
    bool _1504 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1506 = _1502 || _1504;
    float _1508 = float(_1506);
    float _1510 = -_1482;
    float _1512 = _1510 + 1.0;
    float _1514 = fma(_1486, _1398, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1516 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1518 = _1516 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1520 = !_1308;
    int _1522 = _1520 ? 0 : 1;
    float _1524 = _1508 * _1512;
    float _1526 = -_1508;
    float _1528 = _1526 + 1.0;
    float _1530 = fma(_1518, _1376, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _1532 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1534 = isnan(_329);
    bool _1536 = _1532 || _1534;
    bool _1538 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1540 = _1536 || _1538;
    float _1542 = float(_1540);
    float _1544 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _1546 = _1544 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1548 = _373 * _1528;
    float _1550 = -_373;
    float _1552 = _1550 + 1.0;
    bool _1554 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1556 = isnan(_329);
    bool _1558 = _1554 || _1556;
    bool _1560 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1562 = _1558 || _1560;
    float _1564 = float(_1562);
    float _1566 = -_1542;
    float _1568 = _1566 + 1.0;
    bool _1570 = !_1304;
    int _1572 = _1570 ? 0 : 1;
    float _1574 = _1542 * _1552;
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1576;
    float _1580 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1582 = _1580 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    int _1584 = abs(_1020);
    float _1586 = fma(_1578, _1422, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1588 = fma(_1492, _1422, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1590 = _1564 * _1568;
    float _1592 = fma(_1582, _1428, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _1594 = _1420 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1596 = _1496 * _1590;
    float _1598 = _1514 * _1590;
    float _1600 = -_1564;
    float _1602 = _1600 + 1.0;
    float _1604 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1606 = _1594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1608 = ~_1488;
    int _1610 = _1608 + 1;
    int _1612 = _1610 + 1;
    float _1614 = fma(_1602, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1596);
    float _1616 = _1438 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1618 = _1446 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1620 = fma(_1602, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1598);
    float _1622 = _1616 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1624 = _1618 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1626 = _1612;
    float _1628 = _1378;
    if (!_1494)
    {
        int _1630 = ~_1488;
        int _1632 = _1630 + 1;
        _1626 = _1632;
    }
    int _1634 = _1626;
    float _1636 = fma(_1530, _1574, _1620);
    float _1638 = fma(_1470, _1574, _1614);
    out.m_66.x = _1622;
    out.m_66.y = _1624;
    out.m_66.z = _1606;
    out.m_66.w = _1604;
    float _1640 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1642 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1644 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1646 = fma(_1586, _1548, _1638);
    float _1648 = fma(_1588, _1548, _1636);
    float _1650 = -_1640;
    float _1652 = fma(_1642, 2.0, _1650);
    float _1654 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1656 = float(_1264);
    float _1658 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1644);
    int _1660 = abs(_1572);
    float _1662 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1664 = abs(_1454);
    float _1666 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1668 = log2(_1666);
    float _1670 = float(uint(_844));
    float _1672 = _1246 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1674 = fma(_1546, _1428, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _1676 = float(_1330);
    float _1678 = as_type<float>(_497) * _1670;
    float _1680 = fma(_1672, -2.0, _1662);
    float _1682 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1684 = abs(_1522);
    float _1686 = _1206 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1688 = _1124 != 3;
    float _1690 = trunc(_1678);
    float _1692 = precise::max(_1690, 0.0);
    uint _1694 = uint(_1692);
    float _1696 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1682);
    float _1698 = float(_1684);
    float _1700 = fma(_1686, -2.0, _1654);
    float _1702 = _1668 * _139;
    float _1704 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1706 = -_139;
    float _1708 = fma(_1706, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1384);
    int _1710 = ~_397;
    int _1712 = _1710 + 1;
    float _1714 = _1698 * _1676;
    int _1716 = ~_1320;
    int _1718 = _1716 + 1;
    int _1720 = _1718 + 1;
    float _1722 = exp2(_1702);
    float _1724 = _1704 * _512;
    int _1726 = _1720;
    if (_1688)
    {
        int _1728 = ~_1320;
        int _1730 = _1728 + 1;
        _1726 = _1730;
    }
    int _1732 = _1726;
    float _1734 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1696);
    bool _1736 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1738 = isnan(0.0);
    bool _1740 = _1736 || _1738;
    bool _1742 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1744 = _1740 || _1742;
    float _1746 = -_139;
    float _1748 = fma(_1746, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1652);
    int _1750 = _1712 * int(_1694);
    int _1752 = _1750 + _844;
    float _1754 = trunc(_1724);
    int _1756 = int(_1754);
    float _1758 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1658);
    float _1760 = float(uint(_1752));
    float _1762 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1680);
    float _1764 = float(_1634);
    float _1766 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1768 = float(_1664);
    float _1770 = -_1722;
    float _1772 = _1770 + 1.0;
    float _1774 = as_type<float>(_497) * _1760;
    float _1776 = -_1766;
    float _1778 = fma(_1208, 2.0, _1776);
    float _1780 = in.m_68.x;
    float _1782 = in.m_68.y;
    float _1784 = in.m_68.z;
    float _1786 = _1768 * _1764;
    float _1788 = _1744 ? _1772 : 0.0;
    float _1790 = trunc(_1774);
    float _1792 = precise::max(_1790, 0.0);
    uint _1794 = uint(_1792);
    bool _1796 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1798 = isnan(1.0);
    bool _1800 = _1796 || _1798;
    bool _1802 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1804 = _1800 || _1802;
    float _1806 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1808 = 1.0 + _1806;
    int _1810 = _1756 << 4;
    int _1812 = _1810 + 1968;
    float _1814 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1816 = -_139;
    float _1818 = fma(_1816, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1778);
    float _1820 = 1.0 / _1808;
    uint _1822 = uint(int(uint(_1812) >> uint(2)));
    uint _1824 = uint(int(uint(int(_1822)) >> uint(2)));
    int _1826 = int(_1822) & 3;
    float _1828 = (*spvDescriptorSet0.vp_c9)._m0[int(_1824)][_1826];
    int _1830 = int(_1822) + 1;
    uint _1832 = uint(int(uint(_1830) >> uint(2)));
    int _1834 = _1830 & 3;
    float _1836 = (*spvDescriptorSet0.vp_c9)._m0[int(_1832)][_1834];
    float _1838 = float(_1660);
    float _1840 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1842 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1844 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1846 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1814);
    float _1848 = _1838 * _1656;
    float _1850 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1840);
    int _1852 = _1812 + 8;
    uint _1854 = uint(int(uint(_1852) >> uint(2)));
    uint _1856 = uint(int(uint(int(_1854)) >> uint(2)));
    int _1858 = int(_1854) & 3;
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[int(_1856)][_1858];
    float _1862 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1842);
    float _1864 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1844);
    int _1866 = ~_397;
    int _1868 = _1866 + 1;
    float _1870 = _1848 * (-2.0);
    int _1872 = int(_1694) + int(_1794);
    float _1874 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1846);
    float _1876 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1374);
    float _1878 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1850);
    float _1880 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1862);
    float _1882 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1864);
    float _1884 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1700);
    if (_1804)
    {
        float _1886 = _1788 * _1820;
        _141 = _1886;
    }
    float _1888 = _141;
    float _1890 = fma(_1450, _1870, _1450);
    int _1892 = _1868 * _1872;
    int _1894 = _1892 + _844;
    float _1896 = fma(_1870, _1782, _1782);
    float _1898 = _335 + (-0.5);
    float _1900 = _1714 * (-2.0);
    float _1902 = _337 + (-0.5);
    bool _1904 = uint(_1894) >= uint(_397);
    float _1906 = fma(_1898, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1896);
    float _1908 = _1786 * (-2.0);
    float _1910 = fma(_1458, _1900, _1458);
    bool _1912 = !_1904;
    int _1914 = _1912 ? 0 : (-1);
    float _1916 = fma(_1900, _1784, _1784);
    bool _1918 = _512 > 0.5;
    float _1920 = fma(_1908, _1780, _1780);
    float _1922 = _512 + (-0.5);
    float _1924 = fma(_1456, _1908, _1456);
    float _1926 = fma(_1902, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1916);
    float _1928 = fma(_1922, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1920);
    float _1930 = fma(_1592, _1524, _1646);
    float _1932 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1934 = fma(_1890, _1888, _1906);
    float _1936 = fma(_1924, _1888, _1928);
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1940 = in.m_54.x;
    float _1942 = in.m_54.y;
    float _1944 = fma(_1674, _1524, _1648);
    float _1946 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1930);
    float _1948 = _1828 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1950 = _1836 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1952 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1954 = _1934 * 0.15915493667125701904296875;
    float _1956 = _1948 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1958 = _1950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1960 = _1936 * 0.15915493667125701904296875;
    float _1962 = fma(_1910, _1888, _1926);
    float _1964 = _1860 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1966 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1944);
    float _1968 = _1954 * 6.283185482025146484375;
    float _1970 = sin(_1968);
    float _1972 = _1962 * 0.15915493667125701904296875;
    float _1974 = _1964 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1976 = _1932 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1978 = _431 + (-0.5);
    float _1980 = _427 + 0.5;
    int _1982 = ~_1872;
    int _1984 = _1982 + _1914;
    int _1986 = _1984 + 1;
    out.m_70.x = _1956;
    out.m_70.y = _1958;
    out.m_70.z = _1974;
    out.m_70.w = _1938;
    float _1988 = _1954 * 6.283185482025146484375;
    float _1990 = cos(_1988);
    float _1992 = _1952 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1994 = fma(_1976, _1980, _1748);
    float _1996 = _1946 * _1940;
    float _1998 = _1966 * _1942;
    float _2000 = -_1992;
    float _2002 = -_1762;
    float _2004 = fma(_2000, _1978, _2002);
    float _2006 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _2008 = abs(_1102);
    float _2010 = _1960 * 6.283185482025146484375;
    float _2012 = sin(_2010);
    float _2014 = _1996 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2016 = _1998 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _2018 = abs(_1116);
    int _2020 = _397 * _1986;
    int _2022 = _2020 + _844;
    int _2024 = _970 >> 31;
    float _2026 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _209);
    int _2028 = _1110 >> 31;
    float _2030 = _1960 * 6.283185482025146484375;
    float _2032 = cos(_2030);
    int _2034 = _2024 & 3;
    float _2036 = _2014 * _2026;
    int _2038 = _2028 & 3;
    float _2040 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _213);
    int _2042 = _970 + _2034;
    int _2044 = _1110 + _2038;
    float _2046 = _1972 * 6.283185482025146484375;
    float _2048 = cos(_2046);
    int _2050 = _2042 >> 2;
    float _2052 = _2012 * _1970;
    int _2054 = _2044 >> 2;
    float _2056 = _2016 * _2040;
    int _2058 = _2050 << 4;
    int _2060 = _2058 + 368;
    float _2062 = _2012 * _1990;
    int _2064 = _2054 << 4;
    int _2066 = _2064 + 512;
    float _2068 = _1972 * 6.283185482025146484375;
    float _2070 = sin(_2068);
    uint _2072 = uint(int(uint(_2060) >> uint(2)));
    uint _2074 = uint(int(uint(int(_2072)) >> uint(2)));
    int _2076 = int(_2072) & 3;
    float _2078 = (*spvDescriptorSet0.vp_c9)._m0[int(_2074)][_2076];
    int _2080 = int(_2072) + 1;
    uint _2082 = uint(int(uint(_2080) >> uint(2)));
    int _2084 = _2080 & 3;
    float _2086 = (*spvDescriptorSet0.vp_c9)._m0[int(_2082)][_2084];
    float _2088 = _2032 * _1990;
    float _2090 = _2032 * _1970;
    float _2092 = _2032 * _2048;
    float _2094 = _2012 * _2048;
    float _2096 = _1990 * _2048;
    float _2098 = _1970 * _2048;
    float _2100 = _2092 * _2056;
    float _2102 = _2092 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2104 = _2092 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2106 = _2092 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2108 = fma(_2070, _2088, _2052);
    float _2110 = fma(_2070, _2052, _2088);
    float _2112 = -_2056;
    float _2114 = _2070 * _2112;
    uint _2116 = uint(int(uint(_2066) >> uint(2)));
    uint _2118 = uint(int(uint(int(_2116)) >> uint(2)));
    int _2120 = int(_2116) & 3;
    float _2122 = (*spvDescriptorSet0.vp_c9)._m0[int(_2118)][_2120];
    int _2124 = int(_2116) + 1;
    uint _2126 = uint(int(uint(_2124) >> uint(2)));
    int _2128 = _2124 & 3;
    float _2130 = (*spvDescriptorSet0.vp_c9)._m0[int(_2126)][_2128];
    float _2132 = _2094 * _2056;
    float _2134 = -_2090;
    float _2136 = fma(_2070, _2062, _2134);
    float _2138 = fma(_2096, _2036, _2114);
    float _2140 = fma(_2108, _2036, _2100);
    float _2142 = -_2070;
    float _2144 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2102);
    float _2146 = fma(_2136, _2036, _2132);
    float _2148 = -_2062;
    float _2150 = fma(_2070, _2090, _2148);
    int _2152 = _2060 + 8;
    uint _2154 = uint(int(uint(_2152) >> uint(2)));
    uint _2156 = uint(int(uint(int(_2154)) >> uint(2)));
    int _2158 = int(_2154) & 3;
    float _2160 = (*spvDescriptorSet0.vp_c9)._m0[int(_2156)][_2158];
    int _2162 = int(_2154) + 1;
    uint _2164 = uint(int(uint(_2162) >> uint(2)));
    int _2166 = _2162 & 3;
    float _2168 = (*spvDescriptorSet0.vp_c9)._m0[int(_2164)][_2166];
    float _2170 = -_2070;
    float _2172 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2104);
    float _2174 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2144);
    float _2176 = -_2070;
    float _2178 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2106);
    float _2180 = _2150 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2182 = _2108 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2184 = _2108 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2186 = _2108 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2188 = _2066 + 8;
    uint _2190 = uint(int(uint(_2188) >> uint(2)));
    uint _2192 = uint(int(uint(int(_2190)) >> uint(2)));
    int _2194 = int(_2190) & 3;
    float _2196 = (*spvDescriptorSet0.vp_c9)._m0[int(_2192)][_2194];
    int _2198 = int(_2190) + 1;
    uint _2200 = uint(int(uint(_2198) >> uint(2)));
    int _2202 = _2198 & 3;
    float _2204 = (*spvDescriptorSet0.vp_c9)._m0[int(_2200)][_2202];
    int _2206 = abs(_1010);
    float _2208 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2182);
    float _2210 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2184);
    float _2212 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2186);
    float _2214 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2172);
    float _2216 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2178);
    int _2218 = abs(_1174);
    float _2220 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2180);
    int _2222 = ~_1584;
    int _2224 = _2222 + 1;
    int _2226 = _2224 + 1;
    float _2228 = fma(_2098, _2006, _2138);
    float _2230 = _2150 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2232 = _2150 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2234 = fma(_2150, _2006, _2140);
    int _2236 = ~_2206;
    int _2238 = _2236 + 1;
    int _2240 = _2238 + 1;
    int _2242 = _2226 * as_type<int>(_2086);
    float _2244 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2230);
    float _2246 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2232);
    int _2248 = ~_2218;
    int _2250 = _2248 + 1;
    int _2252 = _2250 + 1;
    int _2254 = _2240 * as_type<int>(_2078);
    int _2256 = _2254 + _2242;
    int _2258 = abs(_1292);
    float _2260 = fma(_2110, _2006, _2146);
    int _2262 = abs(_1284);
    float _2264 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2244);
    float _2266 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2220);
    int _2268 = abs(_1732);
    float _2270 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2272 = int(_2270);
    int _2274 = ~_2262;
    int _2276 = _2274 + 1;
    int _2278 = _2276 + 1;
    float _2280 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2246);
    int _2282 = ~_2008;
    int _2284 = _2282 + 1;
    int _2286 = _2284 + 1;
    int _2288 = _2252 * as_type<int>(_2130);
    int _2290 = ~_2268;
    int _2292 = _2290 + 1;
    int _2294 = _2292 + 1;
    int _2296 = ~_2258;
    int _2298 = _2296 + 1;
    int _2300 = _2298 + 1;
    float _2302 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2304 = int(_2302);
    int _2306 = _2278 * as_type<int>(_2122);
    int _2308 = _2306 + _2288;
    float _2310 = _2234 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2312 = _2286 * as_type<int>(_2160);
    int _2314 = _2312 + _2256;
    float _2316 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2310);
    int _2318 = _2300 * as_type<int>(_2168);
    int _2320 = _2318 + _2314;
    int _2322 = abs(_1148);
    int _2324 = _2294 * as_type<int>(_2196);
    int _2326 = _2324 + _2308;
    int _2328 = abs(_1296);
    int _2330 = ~_2018;
    int _2332 = _2330 + 1;
    int _2334 = _2332 + 1;
    int _2336 = ~_2328;
    int _2338 = _2336 + 1;
    int _2340 = _2338 + 1;
    int _2342 = _2320 * _2334;
    float _2344 = float(uint(_2304));
    int _2346 = _2340 * as_type<int>(_2204);
    int _2348 = _2346 + _2326;
    int _2350 = ~_2322;
    int _2352 = _2350 + 1;
    int _2354 = _2352 + 1;
    int _2356 = _1092 * _2018;
    int _2358 = _2356 + _2342;
    float _2360 = float(uint(_2272));
    float _2362 = _1370 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2364 = abs(_2272);
    float _2366 = 1.0 / _2344;
    int _2368 = _2348 * _2354;
    float _2370 = _2234 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2372 = _2234 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2374 = abs(_2304);
    float _2376 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2370);
    int _2378 = ~_2272;
    int _2380 = _2378 + 1;
    float _2382 = 1.0 / _2360;
    float _2384 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2372);
    float _2386 = fma(_2260, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2376);
    bool _2388 = !_802;
    int _2390 = _2388 ? _2022 : (-1);
    float _2392 = fma(_2260, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2384);
    float _2394 = float(uint(_2374));
    float _2396 = _2386 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2398 = float(uint(_2364));
    int _2400 = _2390 * _2322;
    int _2402 = _2400 + _2368;
    float _2404 = _1358 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2406 = _2392 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _2408 = as_type<int>(_2366) + (-2);
    float _2410 = _2362 + _2396;
    float _2412 = float(uint(_2358));
    float _2414 = _2404 + _2406;
    int _2416 = as_type<int>(_2382) + (-2);
    float _2418 = 1.0 / _2394;
    float _2420 = float(uint(_2402));
    float _2422 = as_type<float>(_2408) * _2412;
    float _2424 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2426 = _2414 + _2424;
    float _2428 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2430 = _2410 + _2428;
    int _2432 = abs(_2402);
    float _2434 = as_type<float>(_2416) * _2420;
    float _2436 = _2426 * _2426;
    float _2438 = 1.0 / _2398;
    float _2440 = _2430 * _2430;
    int _2442 = ~_2304;
    int _2444 = _2442 + 1;
    float _2446 = fma(_2260, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2316);
    float _2448 = float(uint(_2432));
    float _2450 = _2436 + _2440;
    int _2452 = ~_2374;
    int _2454 = _2452 + 1;
    float _2456 = trunc(_2422);
    float _2458 = precise::max(_2456, 0.0);
    uint _2460 = uint(_2458);
    int _2462 = as_type<int>(_2418) + (-2);
    float _2464 = trunc(_2434);
    float _2466 = precise::max(_2464, 0.0);
    uint _2468 = uint(_2466);
    int _2470 = abs(_2358);
    int _2472 = as_type<int>(_2438) + (-2);
    float _2474 = float(uint(_2470));
    float _2476 = sqrt(_2450);
    int _2478 = _2444 * int(_2460);
    int _2480 = _2478 + _2358;
    float _2482 = as_type<float>(_2462) * _2474;
    float _2484 = as_type<float>(_2472) * _2448;
    float _2486 = float(uint(_2480));
    int _2488 = _2380 * int(_2468);
    int _2490 = _2488 + _2402;
    float _2492 = trunc(_2482);
    float _2494 = precise::max(_2492, 0.0);
    uint _2496 = uint(_2494);
    float _2498 = float(uint(_2490));
    float _2500 = as_type<float>(_2408) * _2486;
    float _2502 = _1378 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _2504 = _2476 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2506 = trunc(_2484);
    float _2508 = precise::max(_2506, 0.0);
    uint _2510 = uint(_2508);
    float _2512 = as_type<float>(_2416) * _2498;
    int _2514 = ~_2364;
    int _2516 = _2514 + 1;
    float _2518 = _2446 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2520 = _2502 + _2518;
    float _2522 = trunc(_2500);
    float _2524 = precise::max(_2522, 0.0);
    uint _2526 = uint(_2524);
    int _2528 = _2454 * int(_2496);
    int _2530 = _2528 + _2470;
    float _2532 = as_type<float>(_2454);
    float _2534 = _2436;
    float _2536 = _2410;
    float _2538 = _2414;
    float _2540 = _2362;
    if (!_2504)
    {
        _1628 = _2440;
    }
    float _2542 = _1628;
    float _2544 = _2542;
    if (!_2504)
    {
        _2532 = _2436;
    }
    float _2546 = _2532;
    int _2548 = _2516 * int(_2510);
    int _2550 = _2548 + _2432;
    float _2552 = float(uint(_2530));
    float _2554 = _2546;
    if (!_2504)
    {
        _2534 = _2520;
    }
    float _2556 = _2534;
    float _2558 = float(uint(_2550));
    bool _2560 = !_2504;
    float _2562 = _2556;
    if (!_2560)
    {
        float _2564 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2566 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2568 = _2476 + _2566;
        float _2570 = rsqrt(_2450);
        float _2572 = _2568 * _2564;
        float _2574 = _2520 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2576 = _2572 * 0.15915493667125701904296875;
        float _2578 = _2576 * 6.283185482025146484375;
        float _2580 = sin(_2578);
        float _2582 = _2576 * 6.283185482025146484375;
        float _2584 = cos(_2582);
        float _2586 = fma(_2580, _2574, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2588 = _2570 * _2586;
        float _2590 = _2584 + (-1.0);
        float _2592 = fma(_2426, _2588, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2594 = fma(_2430, _2588, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2596 = _2590 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2598 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2600 = _2592 + _2598;
        float _2602 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2604 = _2594 + _2602;
        float _2606 = fma(_2520, _2584, _2596);
        float _2608 = _2600 * _2600;
        float _2610 = _2604 * _2604;
        _2562 = _2606;
        _2554 = _2608;
        _2544 = _2610;
        _2536 = _2594;
        _2538 = _2592;
    }
    float _2612 = _2562;
    float _2614 = _2554;
    float _2616 = _2544;
    float _2618 = _2536;
    float _2620 = _2538;
    bool _2622 = _335 > 0.5;
    float _2624 = as_type<float>(_2462) * _2552;
    float _2626 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2208);
    float _2628 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2210);
    float _2630 = -_213;
    int _2632 = _2622 ? as_type<int>(_2630) : as_type<int>(_213);
    float _2634 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2212);
    bool _2636 = _337 > 0.5;
    float _2638 = as_type<float>(_2472) * _2558;
    float _2640 = -_209;
    int _2642 = _1918 ? as_type<int>(_2640) : as_type<int>(_209);
    float _2644 = trunc(_2624);
    float _2646 = precise::max(_2644, 0.0);
    uint _2648 = uint(_2646);
    float _2650 = -_209;
    int _2652 = _2636 ? as_type<int>(_2650) : as_type<int>(_209);
    float _2654 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2656 = !_1334;
    float _2658 = _2656 ? _213 : as_type<float>(_2632);
    float _2660 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2662 = _2612 + _2660;
    bool _2664 = !_1312;
    float _2666 = _2664 ? _209 : as_type<float>(_2652);
    float _2668 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2670 = !_1340;
    float _2672 = _2670 ? _209 : as_type<float>(_2642);
    float _2674 = trunc(_2512);
    float _2676 = precise::max(_2674, 0.0);
    uint _2678 = uint(_2676);
    float _2680 = _2654 * _2174;
    float _2682 = _2654 * _2216;
    int _2684 = int(_2460) + int(_2526);
    float _2686 = -_1880;
    float _2688 = _2686 + 1.0;
    int _2690 = ~_2304;
    int _2692 = _2690 + 1;
    float _2694 = fma(_2668, _2626, _2680);
    float _2696 = fma(_2662, _2662, _2614);
    float _2698 = trunc(_2638);
    float _2700 = precise::max(_2698, 0.0);
    uint _2702 = uint(_2700);
    float _2704 = _2654 * _2214;
    int _2706 = _2692 * _2684;
    int _2708 = _2706 + _2358;
    int _2710 = int(_2496) + int(_2648);
    float _2712 = -_2688;
    float _2714 = fma(_427, _2712, _1994);
    float _2716 = fma(_2668, _2628, _2704);
    float _2718 = fma(_2668, _2634, _2682);
    int _2720 = ~_2272;
    int _2722 = _2720 + 1;
    float _2724 = -_1882;
    float _2726 = _2724 + 1.0;
    int _2728 = int(_2468) + int(_2678);
    float _2730 = -_1734;
    float _2732 = _2730 + 1.0;
    out.m_72.x = _2626;
    out.m_72.y = _2628;
    out.m_72.z = _2634;
    int _2734 = ~_2374;
    int _2736 = _2734 + 1;
    int _2738 = ~_2364;
    int _2740 = _2738 + 1;
    int _2742 = _2722 * _2728;
    int _2744 = _2742 + _2402;
    int _2746 = int(_2510) + int(_2702);
    int _2748 = _2736 * _2710;
    int _2750 = _2748 + _2470;
    bool _2752 = uint(_2708) >= uint(_2304);
    float _2754 = _2696 + _2616;
    bool _2756 = uint(_2744) >= uint(_2272);
    int _2758 = _2740 * _2746;
    int _2760 = _2758 + _2432;
    bool _2762 = !_2752;
    int _2764 = _2762 ? 0 : (-1);
    float _2766 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2768 = uint(_2750) >= uint(_2374);
    float _2770 = fma(_431, _2726, _2004);
    int _2772 = ~_2684;
    int _2774 = _2772 + _2764;
    int _2776 = _2774 + 1;
    bool _2778 = uint(_2760) >= uint(_2364);
    int _2780 = _2358 ^ _2304;
    float _2782 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2784 = !_2756;
    int _2786 = _2784 ? 0 : (-1);
    out.m_74.x = _2714;
    out.m_74.y = _2770;
    bool _2788 = _2304 == 0;
    bool _2790 = _2304 == 0;
    int _2792 = _2304 * _2776;
    int _2794 = _2792 + _2358;
    bool _2796 = !_2768;
    int _2798 = _2796 ? 0 : (-1);
    float _2800 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _2802 = uint(int(uint(_2780) >> uint(31)));
    int _2804 = ~_2728;
    int _2806 = _2804 + _2786;
    int _2808 = _2806 + 1;
    int _2810 = ~_2798;
    int _2812 = _2710 + _2810;
    int _2814 = _2812 + 1;
    int _2816 = ~int(_2802);
    int _2818 = _2816 + 1;
    int _2820 = _2272 * _2808;
    int _2822 = _2820 + _2402;
    int _2824 = _2402 ^ _2272;
    float _2826 = _2782 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2828 = !_2788;
    int _2830 = _2828 ? _2794 : (-1);
    float _2832 = sqrt(_2754);
    int _2834 = _2814 ^ _2818;
    bool _2836 = !_2778;
    int _2838 = _2836 ? 0 : (-1);
    float _2840 = _2800 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    uint _2842 = uint(int(uint(_2824) >> uint(31)));
    bool _2844 = _2272 == 0;
    float _2846 = float(_2830);
    int _2848 = ~_2818;
    int _2850 = _2848 + _2834;
    int _2852 = _2850 + 1;
    float _2854 = fma(_2654, _2654, 1.0);
    bool _2856 = _2272 == 0;
    float _2858 = fma(_2826, _2846, _1708);
    int _2860 = ~_2838;
    int _2862 = _2746 + _2860;
    int _2864 = _2862 + 1;
    float _2866 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2868 = ~int(_2842);
    int _2870 = _2868 + 1;
    bool _2872 = !_2844;
    int _2874 = _2872 ? _2822 : (-1);
    float _2876 = _2666 + 0.5;
    int _2878 = _2864 ^ _2870;
    float _2880 = float(_2874);
    float _2882 = rsqrt(_2854);
    int _2884 = ~_2870;
    int _2886 = _2884 + _2878;
    int _2888 = _2886 + 1;
    float _2890 = _2672 + 0.5;
    bool _2892 = _2832 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2894 = isnan(_2832);
    bool _2896 = _2892 || _2894;
    bool _2898 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2900 = _2896 || _2898;
    float _2902 = fma(_2840, _2880, _1818);
    bool _2904 = !_2790;
    int _2906 = _2904 ? _2852 : (-1);
    float _2908 = fma(_2826, _2890, _2858);
    bool _2910 = !_2856;
    int _2912 = _2910 ? _2888 : (-1);
    float _2914 = _2766 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2916 = float(_2906);
    float _2918 = fma(_2840, _2876, _2902);
    float _2920 = float(_2912);
    float _2922 = _2866 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2924 = _642 + (-0.5);
    float _2926 = -_1876;
    float _2928 = fma(_2914, _2916, _2926);
    float _2930 = _2658 + (-0.5);
    float _2932 = -_1884;
    float _2934 = fma(_2922, _2920, _2932);
    float _2936 = _2654 * _2882;
    float _2938 = _2280 + _2718;
    float _2940 = -_2914;
    float _2942 = fma(_2940, _2930, _2928);
    float _2944 = -_2922;
    float _2946 = fma(_2944, _2924, _2934);
    float _2948 = -_2264;
    float _2950 = _2936 * _2948;
    float _2952 = -_2266;
    float _2954 = _2936 * _2952;
    float _2956 = -_2280;
    float _2958 = _2936 * _2956;
    float _2960 = -_1758;
    float _2962 = _2960 + 1.0;
    float _2964 = fma(_2882, _2174, _2950);
    float _2966 = fma(_2882, _2214, _2954);
    float _2968 = -_1874;
    float _2970 = _2968 + 1.0;
    float _2972 = -_1878;
    float _2974 = _2972 + 1.0;
    float _2976 = fma(_2882, _2216, _2958);
    float _2978 = -_2962;
    float _2980 = fma(_2666, _2978, _2918);
    float _2982 = _2264 + _2694;
    float _2984 = _2266 + _2716;
    float _2986 = -_2970;
    float _2988 = fma(_2672, _2986, _2908);
    float _2990 = fma(_2658, _2974, _2942);
    float _2992 = fma(_642, _2732, _2946);
    out.m_76.x = _2964;
    out.m_76.y = _2966;
    out.m_76.z = _2976;
    float _2994 = _2942;
    if (!_2900)
    {
        _2994 = 1.0;
    }
    float _2996 = _2994;
    out.m_78.x = _2982;
    out.m_78.y = _2984;
    out.m_78.z = _2938;
    out.m_80.x = _2988;
    out.m_80.y = _2990;
    out.m_80.z = _2980;
    out.m_80.w = _2992;
    bool _2998 = !_2900;
    float _3000 = _2996;
    if (!_2998)
    {
        bool _3002 = _2832 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3004 = isnan(_2832);
        bool _3006 = _3002 || _3004;
        bool _3008 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3010 = _3006 || _3008;
        if (!_3010)
        {
            float _3012 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3014 = _2832 + _3012;
            float _3016 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3018 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3016;
            float _3020 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3022 = _3020 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3024 = 1.0 / _3018;
            float _3026 = _3014 * _3024;
            float _3028 = fma(_3026, _3022, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3000 = _3028;
            _3030 = true;
        }
        else
        {
            bool _3032 = _2832 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3034 = isnan(_2832);
            bool _3036 = _3032 || _3034;
            bool _3038 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3040 = _3036 || _3038;
            if (!_3040)
            {
                float _3042 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3044 = _2832 + _3042;
                float _3046 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3048 = _3046 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3050 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3052 = _3050 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3054 = 1.0 / _3048;
                float _3056 = _3044 * _3054;
                float _3058 = fma(_3056, _3052, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3000 = _3058;
                _3030 = true;
            }
            else
            {
                _3000 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3030 = false;
    float _3060 = _3000;
    float _3062 = _2502 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3064 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3066 = _2612 + _3064;
    float _3068 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3070 = _2618 + _3068;
    float _3072 = fma(_2404, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3062);
    float _3074 = _2502 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _3076 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3078 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3080 = _3076 || _3078;
    bool _3082 = isnan(0.5);
    bool _3084 = _3080 || _3082;
    float _3086 = fma(_3066, _3060, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3088 = fma(_2362, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3072);
    float _3090 = fma(_2404, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3074);
    float _3092 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3094 = _2620 + _3092;
    float _3096 = _3088 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3098 = fma(_2362, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3090);
    float _3100 = fma(_3094, _3060, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3102 = fma(_3070, _3060, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3104 = 1.0 / _3096;
    float _3106 = _3098 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _3108 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3110 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3112 = _3108 || _3110;
    bool _3114 = isnan(0.5);
    bool _3116 = _3112 || _3114;
    float _3118 = _3094;
    float _3120 = _3106;
    float _3122 = _3088;
    float _3124 = _3100;
    float _3126 = _3060;
    float _3128 = _3102;
    if (_3084)
    {
        _3118 = _3100;
    }
    float _3130 = _3118;
    float _3132 = _3106 + _3096;
    float _3134 = _3130;
    if (_3084)
    {
        _3120 = _3086;
    }
    float _3136 = _3120;
    float _3138 = _3136;
    if (_3084)
    {
        _3122 = _3102;
    }
    float _3140 = _3122;
    float _3142 = _3140;
    if (!_3084)
    {
        float _3144 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3146 = _2502 + _3144;
        float _3148 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3150 = _2404 + _3148;
        float _3152 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3154 = _3146 * _3146;
        float _3156 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3158 = _2362 + _3156;
        float _3160 = fma(_3150, _3150, _3154);
        float _3162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3164 = fma(_3158, _3158, _3160);
        float _3166 = sqrt(_3164);
        float _3168 = _3152 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3170 = precise::min(_3166, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3172 = _3170 * _3162;
        float _3174 = -_2404;
        float _3176 = _3174 + _3100;
        float _3178 = -_2362;
        float _3180 = _3178 + _3102;
        float _3182 = _3168 * _3172;
        float _3184 = -_2502;
        float _3186 = _3184 + _3086;
        float _3188 = fma(_3176, _3182, _2404);
        float _3190 = fma(_3186, _3182, _2502);
        float _3192 = fma(_3180, _3182, _2362);
        _3138 = _3190;
        _3134 = _3188;
        _3142 = _3192;
        _3124 = _3182;
        _3126 = _3180;
    }
    float _3194 = _3138;
    float _3196 = _3134;
    float _3198 = _3142;
    float _3200 = _3124;
    float _3202 = _3126;
    float _3204 = _3202;
    float _3206 = _3200;
    if (_3116)
    {
        _3204 = 1.0;
    }
    float _3208 = _3204;
    float _3210 = _3132 * _3104;
    float _3212 = _3210 * 0.5;
    float _3214 = _3208;
    float _3216 = _3212;
    if (!_3116)
    {
        float _3218 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3220 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3222 = fma(_3212, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3220);
        float _3224 = _3218 * 0.15915493667125701904296875;
        float _3226 = _3224 * 6.283185482025146484375;
        float _3228 = cos(_3226);
        float _3230 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3232 = _3230 * 0.15915493667125701904296875;
        float _3234 = _3224 * 6.283185482025146484375;
        float _3236 = sin(_3234);
        float _3238 = 1.0 / _3228;
        float _3240 = _3232 * 6.283185482025146484375;
        float _3242 = cos(_3240);
        float _3244 = _3236 * _3238;
        float _3246 = 1.0 / _3222;
        float _3248 = _3242 * _3244;
        float _3250 = _3232 * 6.283185482025146484375;
        float _3252 = sin(_3250);
        float _3254 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3256 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3254;
        float _3258 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3260 = _3246 * _3258;
        float _3262 = 1.0 / _3248;
        float _3264 = 1.0 / _3256;
        float _3266 = _3252 * _3262;
        float _3268 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3270 = fma(_3266, _3260, _3268);
        float _3272 = _3270 * _3264;
        float _3274 = precise::clamp(_3272, 0.0, 1.0);
        float _3276 = -_3274;
        float _3278 = _3276 + 1.0;
        _3128 = _3232;
        _3206 = _3264;
        _3214 = _3278;
    }
    float _3280 = _3128;
    float _3282 = _3206;
    float _3284 = _3214;
    float _3286 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3288 = _3194 + _3286;
    float _3290 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3292 = _3196 + _3290;
    float _3294 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3296 = _3198 + _3294;
    float _3298 = _3288 * _3288;
    float _3300 = fma(_3292, _3292, _3298);
    float _3302 = fma(_3296, _3296, _3300);
    float _3304 = rsqrt(_3302);
    float _3306 = sqrt(_3302);
    float _3308 = _3304 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3310 = _3292 * _3308;
    float _3312 = _3296 * _3308;
    float _3314 = _3310 * _3310;
    float _3316 = _3312 * _3312;
    float _3318 = _3314 + _3316;
    float _3320 = sqrt(_3318);
    bool _3322 = _3320 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3324 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3326 = _3320 + _3324;
    float _3328 = _3280;
    float _3330 = _3326;
    float _3332 = _3288;
    float _3334 = _3310;
    if (_3322)
    {
        float _3336 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3328 = _3336;
    }
    float _3338 = _3328;
    float _3340 = _3338;
    if (_3322)
    {
        float _3342 = _3326 * _3338;
        _3330 = _3342;
    }
    float _3344 = _3330;
    if (_3322)
    {
        float _3346 = rsqrt(_3318);
        _3340 = _3346;
    }
    float _3348 = _3340;
    float _3350 = _3348;
    if (_3322)
    {
        float _3352 = _3344 * 0.15915493667125701904296875;
        _3216 = _3352;
    }
    float _3354 = _3216;
    float _3356 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3358 = _3296;
    if (_3322)
    {
        float _3360 = _3354 * 6.283185482025146484375;
        float _3362 = sin(_3360);
        _3358 = _3362;
    }
    float _3364 = _3358;
    float _3366 = precise::max(0.0, _3356);
    float _3368 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3370 = _3282;
    float _3372 = _3366;
    if (_3322)
    {
        float _3374 = _3354 * 6.283185482025146484375;
        float _3376 = cos(_3374);
        _3370 = _3376;
    }
    float _3378 = _3370;
    float _3380 = -_3308;
    float _3382 = -_3366;
    float _3384 = fma(_3288, _3380, _3382);
    if (_3322)
    {
        float _3386 = _3384 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3332 = _3386;
    }
    float _3388 = _3332;
    float _3390 = _3364;
    float _3392 = _3388;
    if (_3322)
    {
        float _3394 = fma(_3364, _3388, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3390 = _3394;
    }
    float _3396 = _3390;
    float _3398 = _3396;
    if (!_3322)
    {
        _3392 = _3384;
    }
    float _3400 = _3392;
    float _3402 = _3400;
    if (_3322)
    {
        float _3404 = _3348 * _3396;
        _2540 = _3404;
    }
    float _3406 = _2540;
    if (!_3322)
    {
        _3398 = _3314;
    }
    float _3408 = _3398;
    float _3410 = _3194 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3412 = _3408;
    float _3414 = _3378;
    if (_3322)
    {
        float _3416 = _3378 + (-1.0);
        _3372 = _3416;
    }
    float _3418 = _3372;
    float _3420 = _3418;
    if (_3322)
    {
        float _3422 = _3310 * _3406;
        _3334 = _3422;
    }
    float _3424 = _3334;
    float _3426 = fma(_3196, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3410);
    if (_3322)
    {
        float _3428 = _3418 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3350 = _3428;
    }
    float _3430 = _3350;
    if (!_3322)
    {
        _3420 = _3312;
    }
    float _3432 = _3420;
    float _3434 = _3432;
    if (_3322)
    {
        float _3436 = _3312 * _3406;
        _3434 = _3436;
    }
    float _3438 = _3434;
    if (_3322)
    {
        float _3440 = _3424 * _3424;
        _3412 = _3440;
    }
    float _3442 = _3412;
    if (_3322)
    {
        float _3444 = fma(_3384, _3378, _3430);
        _3402 = _3444;
    }
    float _3446 = _3402;
    if (!_3322)
    {
        _3414 = _3316;
    }
    float _3448 = _3414;
    float _3450 = _3448;
    if (_3322)
    {
        float _3452 = _3438 * _3438;
        _3450 = _3452;
    }
    float _3454 = _3450;
    float _3456 = fma(_3446, _3446, _3442);
    float _3458 = fma(_3198, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3426);
    float _3460 = _3456 + _3454;
    float _3462 = _3194 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3464 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3466 = fma(_3306, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3464);
    float _3468 = precise::clamp(_3466, 0.0, 1.0);
    float _3470 = _3194 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3472 = rsqrt(_3460);
    float _3474 = fma(_3196, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3462);
    float _3476 = -_3468;
    float _3478 = _3476 + 1.0;
    float _3480 = fma(_3196, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3470);
    float _3482 = _3458 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3484 = fma(_3198, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3474);
    float _3486 = _3194 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3488 = fma(_3198, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3480);
    float _3490 = abs(_3478);
    float _3492 = log2(_3490);
    float _3494 = _3484 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3496 = fma(_3196, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3486);
    float _3498 = _3488 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3500 = _3494 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3502 = fma(_3198, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3496);
    float _3504 = _3472 * _3424;
    float _3506 = -_3500;
    float _3508 = fma(_3506, _3368, 1.0);
    float _3510 = _3472 * _3446;
    float _3512 = _3502 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3514 = _3498 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3516 = _3504 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3518 = _3472 * _3438;
    float _3520 = log2(_3508);
    float _3522 = fma(_3512, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3514);
    float _3524 = -_3516;
    float _3526 = fma(_3510, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3524);
    float _3528 = _3492 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3530 = fma(_3494, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3522);
    float _3532 = -_3518;
    float _3534 = fma(_3532, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3526);
    float _3536 = _3498 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3538 = fma(_3482, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3530);
    float _3540 = fma(_3534, -0.5, 0.5);
    float _3542 = exp2(_3528);
    float _3544 = _3498 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3546 = fma(_3512, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3536);
    float _3548 = fma(_3534, 0.5, 0.5);
    float _3550 = _3510 + 1.0;
    float _3552 = fma(_3512, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3544);
    float _3554 = fma(_3494, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3546);
    float _3556 = fma(_3548, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3558 = 1.0 / _3538;
    float _3560 = fma(_3494, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3552);
    float _3562 = fma(_3482, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3554);
    float _3564 = fma(_3548, _3556, -0.212114393711090087890625);
    float _3566 = fma(_3482, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3560);
    float _3568 = fma(_3548, _3564, 1.570728778839111328125);
    float _3570 = sqrt(_3540);
    float _3572 = -_3510;
    float _3574 = fma(_3542, _3550, _3572);
    float _3576 = _3520 * 0.693147182464599609375;
    float _3578 = fma(_3574, 0.5, 0.5);
    float _3580 = _3576 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3582 = _3562 * _3558;
    float _3584 = _3566 * _3558;
    float _3586 = fma(_3582, 0.5, 0.5);
    float _3588 = fma(_3584, -0.5, 0.5);
    float _3590 = _3570 * 0.636619746685028076171875;
    float _3592 = -_3568;
    float _3594 = fma(_3590, _3592, 1.0);
    float3 _8966 = float3(_3586, _3588, _3580);
    float _3596 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8966, float3(0.0), isnan(_8966)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8966, float3(0.0), isnan(_8966)), level(0.0)).x;
    float3 _8977 = float3(_3586, _3588, _3580);
    float4 _3599 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8977, float3(0.0), isnan(_8977)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8977, float3(0.0), isnan(_8977)), level(0.0)).xyzw;
    float _3601 = _3599.x;
    float _3603 = _3599.y;
    float _3605 = _3599.z;
    float _3607 = _3599.w;
    float2 _8994 = float2(_3594, _3578);
    float3 _3611 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8994, float2(0.0), isnan(_8994)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8994, float2(0.0), isnan(_8994)), level(0.0)).xyz;
    float _3613 = _3611.x;
    float _3615 = _3611.y;
    float _3617 = _3611.z;
    float _3619 = _3498 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3621 = _3492 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3623 = _3284 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3625 = _3562 + _3538;
    float _3627 = fma(_3512, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3619);
    bool _3629 = _3284 > 0.0;
    bool _3631 = isnan(_3284);
    bool _3633 = _3629 || _3631;
    bool _3635 = isnan(0.0);
    bool _3637 = _3633 || _3635;
    out.m_82.x = _3196;
    out.m_82.y = _3194;
    out.m_82.z = _3198;
    float _3639 = exp2(_3621);
    float _3641 = fma(_3494, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3627);
    float _3643 = _3538 * 0.5;
    float _3645 = _3625 * 0.5;
    float _3647 = fma(_3482, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3641);
    float _3649 = _3647 + _3538;
    out.gl_Position.x = _3562;
    out.gl_Position.y = _3566;
    out.gl_Position.z = _3647;
    out.gl_Position.w = _3538;
    float _3651 = _3649 * 0.5;
    float _3653 = -_3639;
    float _3655 = _3653 + 1.0;
    float _3657 = fma(_3566, -0.5, _3643);
    float _3659 = _3623 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3661 = _3655 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_84.x = _3645;
    out.m_84.y = _3657;
    out.m_84.z = _3651;
    out.m_84.w = _3538;
    float _3663 = -_3661;
    float _3665 = _3663 + 1.0;
    out.m_47.x = _3659;
    float _3667 = _3661 * _3596;
    float _3669 = _3607 * _3665;
    float _3671 = _3607 * _3667;
    float _3673 = _3617 * _3667;
    float _3675 = fma(_3613, _3671, _3601);
    float _3677 = fma(_3615, _3671, _3603);
    float _3679 = fma(_3607, _3673, _3605);
    out.m_86.x = _3675;
    out.m_86.y = _3677;
    out.m_86.z = _3679;
    out.m_86.w = _3669;
    if (_3637)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _3681 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3681;
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
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3030 = false;
    bool _321 = false;
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
        float _3738 = as_type<float>(_121);
        out.gl_Position.z = _3738;
    }
    if (!_109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_49.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = _139;
    if (_135)
    {
        float _143 = float(_105);
        _115 = _143;
    }
    float _145 = _115;
    bool _147 = _139 >= _145;
    bool _149 = !_135;
    bool _151 = _147 || _149;
    float _153 = _145;
    if (_151)
    {
        _153 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _153;
    if (_151)
    {
        out.m_47.x = 0.0;
    }
    if (_151)
    {
        float _157 = _155 * 5.0;
        _123 = as_type<int>(_157);
    }
    int _159 = _123;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3808 = as_type<float>(_159);
        out.gl_Position.z = _3808;
    }
    if (_151)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    float _163 = in.m_54.w;
    bool _165 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _167 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _169 = _165 || _167;
    bool _171 = isnan(1.0);
    bool _173 = _169 || _171;
    float _175 = in.m_49.x;
    float _177 = in.m_49.y;
    float _179 = in.m_49.z;
    float _181 = in.m_44.x;
    float _183 = in.m_44.y;
    float _185 = in.m_44.z;
    int _187 = as_type<int>(_161) & 1;
    bool _189 = _187 != 0;
    int _191 = as_type<int>(_161) & 2;
    bool _193 = _191 != 0;
    float _195 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _197 = 0.0;
    float _199 = _195;
    if (!_173)
    {
        float _201 = _195 * _195;
        float _203 = _201 * 0.5;
        _197 = _203;
    }
    float _205 = _197;
    bool _207 = !_189;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_193;
    float _213 = _211 ? (-0.5) : 0.5;
    float _215 = _205;
    if (!_173)
    {
        float _217 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _215 = _217;
    }
    float _219 = _215;
    bool _221 = !_173;
    float _223 = _219;
    if (!_221)
    {
        float _225 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = log2(_225);
        float _229 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _231 = _229 + 1.0;
        float _233 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = _195 * _227;
        float _237 = 1.0 / _231;
        float _239 = _233 * 0.693147182464599609375;
        float _241 = exp2(_235);
        float _243 = 1.0 / _239;
        float _245 = _241 + (-1.0);
        float _247 = -_245;
        float _249 = fma(_247, _243, _195);
        float _251 = _249 * _237;
        float _253 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _223 = _253;
    }
    float _255 = _223;
    bool _257 = !_173;
    if (!_257)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _195 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _199 = _277;
    }
    float _279 = _199;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _283 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _285 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _287 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _289 = fma(_279, _175, _283);
    float _291 = fma(_279, _177, _285);
    float _293 = fma(_279, _179, _287);
    float _295 = fma(_289, _163, _181);
    float _297 = fma(_291, _163, _183);
    float _299 = fma(_293, _163, _185);
    bool _301 = !_281;
    float _319;
    if (!_301)
    {
        float _303 = in.m_56.x;
        float _305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _307 = _303 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _311 = _309 * _305;
        float _313 = floor(_311);
        float _315 = -_313;
        float _317 = _311 + _315;
        _319 = _317;
        _321 = true;
    }
    else
    {
        float _323 = float(_105);
        float _325 = 1.0 / _323;
        float _327 = _139 * _325;
        _319 = _327;
    }
    _321 = false;
    float _329 = _319;
    float _331 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _333 = int(_331);
    float _335 = in.m_56.y;
    float _337 = in.m_56.z;
    float _339 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _341 = int(_339);
    float _343 = float(_105);
    float _345 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _347 = int(_345);
    float _349 = float(_333);
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _351;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _359;
    bool _363 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _365 = isnan(_329);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = 1.0 / _349;
    float _377 = float(_341);
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _379;
    bool _383 = _335 > 0.5;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _389 = _337 > 0.5;
    float _391 = -_209;
    int _393 = _383 ? as_type<int>(_391) : as_type<int>(_209);
    float _395 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _397 = int(_395);
    float _399 = float(uint(_347));
    int _401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _403 = _401 != 0;
    int _405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _407 = _405 != 0;
    int _409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _411 = _409 != 0;
    float _413 = -_213;
    int _415 = _389 ? as_type<int>(_413) : as_type<int>(_213);
    int _417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _419 = _417 != 0;
    float _421 = 1.0 / _377;
    float _423 = _375 * _139;
    bool _425 = !_407;
    float _427 = _425 ? _209 : as_type<float>(_393);
    bool _429 = !_411;
    float _431 = _429 ? _213 : as_type<float>(_415);
    int _433 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _435 = _433 != 0;
    int _437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _439 = _437 != 0;
    int _441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _443 = _441 != 0;
    float _445 = 1.0 / _399;
    float _447 = float(uint(_397));
    int _449 = ~_397;
    int _451 = _449 + 1;
    bool _453 = !_439;
    int _455 = _453 ? 0 : 1;
    int _457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _459 = _457 != 0;
    float _461 = trunc(_423);
    int _463 = int(_461);
    float _465 = _421 * _139;
    float _467 = float(_347);
    float _469 = in.m_56.w;
    bool _471 = !_435;
    int _473 = _471 ? 0 : 1;
    bool _475 = !_443;
    int _477 = _475 ? 0 : 1;
    float _479 = 1.0 / _447;
    int _481 = as_type<int>(_445) + (-2);
    int _483 = ~_347;
    int _485 = _483 + 1;
    int _487 = abs(_477);
    float _489 = trunc(_465);
    int _491 = int(_489);
    float _493 = float(uint(_463));
    float _495 = as_type<float>(_481) * _493;
    int _497 = as_type<int>(_479) + (-2);
    float _499 = 1.0 / _343;
    float _501 = float(uint(_491));
    float _503 = trunc(_495);
    float _505 = precise::max(_503, 0.0);
    uint _508 = uint(_505);
    float _510 = as_type<float>(_497) * _501;
    float _512 = in.m_56.x;
    float _514 = trunc(_510);
    float _516 = precise::max(_514, 0.0);
    uint _518 = uint(_516);
    int _520 = _485 * int(_508);
    int _522 = _520 + _463;
    float _524 = 1.0 / _357;
    float _526 = float(uint(_522));
    int _528 = _451 * int(_518);
    int _530 = _528 + _491;
    float _532 = as_type<float>(_481) * _526;
    float _534 = 1.0 / _353;
    float _536 = float(uint(_530));
    bool _538 = !_419;
    int _540 = _538 ? 0 : 1;
    bool _542 = _469 > 0.5;
    float _544 = as_type<float>(_497) * _536;
    float _546 = _469;
    if (_459)
    {
        _546 = 1.0;
    }
    float _548 = _546;
    float _550 = trunc(_532);
    float _552 = precise::max(_550, 0.0);
    uint _554 = uint(_552);
    float _556 = _548;
    if (!_459)
    {
        _556 = 7.345489978790283203125;
    }
    float _558 = _556;
    int _560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _562 = _560 != 0;
    int _564 = abs(_540);
    float _566 = _558 * _512;
    float _568 = trunc(_544);
    float _570 = precise::max(_568, 0.0);
    uint _572 = uint(_570);
    int _574 = ~_347;
    int _576 = _574 + 1;
    int _578 = int(_508) + int(_554);
    float _580 = floor(_566);
    int _582 = ~_397;
    int _584 = _582 + 1;
    int _586 = _576 * _578;
    int _588 = _586 + _463;
    int _590 = int(_518) + int(_572);
    float _592 = 1.0 / _361;
    float _594 = float(_463);
    bool _596 = !_562;
    int _598 = _596 ? 0 : 1;
    int _600 = _584 * _590;
    int _602 = _600 + _491;
    bool _604 = uint(_588) >= uint(_347);
    float _606 = -_580;
    float _608 = _566 + _606;
    bool _610 = _594 >= _467;
    bool _612 = isnan(_594);
    bool _614 = _610 || _612;
    bool _616 = isnan(_467);
    bool _618 = _614 || _616;
    float _620 = float(_618);
    float _622 = _499 * _139;
    float _624 = -_213;
    int _626 = _542 ? as_type<int>(_624) : as_type<int>(_213);
    float _628 = _608 * _467;
    float _630 = trunc(_620);
    int _632 = int(_630);
    int _634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _636 = _634 != 0;
    float _638 = _467 * _622;
    bool _640 = !_403;
    float _642 = _640 ? _213 : as_type<float>(_626);
    bool _644 = uint(_602) >= uint(_397);
    bool _646 = !_604;
    float _648 = _646 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _650 = trunc(_628);
    int _652 = int(_650);
    bool _654 = !_636;
    int _656 = _654 ? 0 : 1;
    bool _658 = !_644;
    int _660 = _658 ? 0 : (-1);
    int _662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _664 = _662 != 0;
    int _666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _668 = _666 != 0;
    int _670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _672 = _670 != 0;
    int _674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _676 = _674 != 0;
    int _678 = ~_578;
    int _680 = _678 + as_type<int>(_648);
    int _682 = _680 + 1;
    float _684 = trunc(_638);
    int _686 = int(_684);
    int _688 = ~_632;
    int _690 = _688 + 1;
    int _692 = _690 + 1;
    bool _694 = !_668;
    int _696 = _694 ? 0 : 1;
    int _698 = _347 * _682;
    int _700 = _698 + _463;
    bool _702 = _347 == 0;
    int _704 = _347 + (-1);
    int _706 = _652 * _564;
    int _708 = _706 + _463;
    bool _710 = !_702;
    int _712 = _710 ? _700 : (-1);
    float _714 = _648;
    float _716 = _620;
    if (_459)
    {
        _714 = 1.0;
    }
    float _718 = _714;
    float _720 = _718;
    if (_459)
    {
        _716 = _512;
    }
    float _722 = _716;
    int _724 = _712 * _692;
    float _726 = _722;
    if (!_459)
    {
        _720 = 1.2345600128173828125;
    }
    float _728 = _720;
    if (!_459)
    {
        _726 = _335;
    }
    float _730 = _726;
    int _732 = _632 * _704;
    int _734 = _732 + _724;
    int _736 = abs(_455);
    int _738 = abs(_473);
    float _740 = _728 * _730;
    int _742 = abs(_598);
    int _744 = _734 * _736;
    float _746 = floor(_740);
    float _748 = float(_397);
    int _750 = _686 * _738;
    int _752 = _750 + _744;
    float _754 = float(_491);
    int _756 = _708 * _487;
    int _758 = _756 + _752;
    bool _760 = _754 >= _748;
    bool _762 = isnan(_754);
    bool _764 = _760 || _762;
    bool _766 = isnan(_748);
    bool _768 = _764 || _766;
    float _770 = float(_768);
    float _772 = _748 * _622;
    int _774 = ~_590;
    int _776 = _774 + _660;
    int _778 = _776 + 1;
    int _780 = _652 * _742;
    int _782 = _780 + _758;
    bool _784 = !_664;
    int _786 = _784 ? 0 : 1;
    float _788 = trunc(_770);
    int _790 = int(_788);
    int _792 = _397 * _778;
    int _794 = _792 + _491;
    float _796 = float(uint(_782));
    float _798 = -_746;
    float _800 = _740 + _798;
    bool _802 = _397 == 0;
    float _804 = as_type<float>(_481) * _796;
    float _806 = _800 * _748;
    int _808 = ~_347;
    int _810 = _808 + 1;
    float _812 = trunc(_772);
    int _814 = int(_812);
    int _816 = ~_790;
    int _818 = _816 + 1;
    int _820 = _818 + 1;
    float _822 = trunc(_806);
    int _824 = int(_822);
    float _826 = trunc(_804);
    float _828 = precise::max(_826, 0.0);
    uint _830 = uint(_828);
    int _832 = abs(_656);
    bool _834 = !_802;
    int _836 = _834 ? _794 : (-1);
    int _838 = _397 + (-1);
    int _840 = _836 * _820;
    int _842 = _824 * _832;
    int _844 = _842 + _491;
    int _846 = _790 * _838;
    int _848 = _846 + _840;
    int _850 = abs(_696);
    bool _852 = !_672;
    int _854 = _852 ? 0 : 1;
    int _856 = _810 * int(_830);
    int _858 = _856 + _782;
    int _860 = abs(_786);
    bool _862 = !_676;
    int _864 = _862 ? 0 : 1;
    int _866 = abs(_854);
    int _868 = _848 * _850;
    float _870 = float(uint(_858));
    int _872 = abs(_864);
    float _874 = as_type<float>(_481) * _870;
    int _876 = _814 * _860;
    int _878 = _876 + _868;
    float _880 = trunc(_874);
    float _882 = precise::max(_880, 0.0);
    uint _884 = uint(_882);
    float _886 = float(uint(_708));
    int _888 = _844 * _866;
    int _890 = _888 + _878;
    int _892 = ~_347;
    int _894 = _892 + 1;
    float _896 = as_type<float>(_481) * _886;
    int _898 = _824 * _872;
    int _900 = _898 + _890;
    int _902 = ~_347;
    int _904 = _902 + 1;
    int _906 = ~_397;
    int _908 = _906 + 1;
    float _910 = trunc(_896);
    float _912 = precise::max(_910, 0.0);
    uint _914 = uint(_912);
    float _916 = float(uint(_900));
    int _918 = int(_830) + int(_884);
    float _920 = as_type<float>(_497) * _916;
    float _922 = trunc(_920);
    float _924 = precise::max(_922, 0.0);
    uint _926 = uint(_924);
    int _928 = _904 * _918;
    int _930 = _928 + _782;
    int _932 = _894 * int(_914);
    int _934 = _932 + _708;
    bool _936 = uint(_930) >= uint(_347);
    float _938 = float(uint(_934));
    bool _940 = !_936;
    int _942 = _940 ? 0 : (-1);
    float _944 = as_type<float>(_481) * _938;
    int _946 = ~_918;
    int _948 = _946 + _942;
    int _950 = _948 + 1;
    int _952 = _908 * int(_926);
    int _954 = _952 + _900;
    float _956 = trunc(_944);
    float _958 = precise::max(_956, 0.0);
    uint _960 = uint(_958);
    int _962 = _347 * _950;
    int _964 = _962 + _782;
    float _966 = float(uint(_954));
    bool _968 = !_702;
    int _970 = _968 ? _964 : (-1);
    float _972 = as_type<float>(_497) * _966;
    int _974 = ~_347;
    int _976 = _974 + 1;
    int _978 = _970 & 3;
    bool _980 = _978 != 0;
    int _982 = _970 & 3;
    bool _984 = _982 != 0;
    float _986 = trunc(_972);
    float _988 = precise::max(_986, 0.0);
    uint _990 = uint(_988);
    int _992 = _980 ? 0 : 1;
    bool _994 = uint(_982) > 1u;
    int _996 = int(_914) + int(_960);
    int _998 = ~_397;
    int _1000 = _998 + 1;
    int _1002 = ~_992;
    int _1004 = _1002 + 1;
    int _1006 = _1004 + 1;
    bool _1008 = !_984;
    int _1010 = _1008 ? 0 : 1;
    int _1012 = _1006;
    int _1014 = _996;
    if (!_994)
    {
        int _1016 = ~_992;
        int _1018 = _1016 + 1;
        _1012 = _1018;
    }
    int _1020 = _1012;
    int _1022 = _976 * _996;
    int _1024 = _1022 + _708;
    int _1026 = int(_926) + int(_990);
    bool _1028 = uint(_982) >= 2u;
    int _1030 = _1028 ? 0 : 1;
    bool _1032 = uint(_1024) >= uint(_347);
    int _1034 = _1000 * _1026;
    int _1036 = _1034 + _900;
    int _1038 = ~_1030;
    int _1040 = _1038 + 1;
    int _1042 = _1040 + 1;
    bool _1044 = !_1032;
    int _1046 = _1044 ? 0 : (-1);
    bool _1048 = uint(_1036) >= uint(_397);
    int _1050 = ~_996;
    int _1052 = _1050 + _1046;
    int _1054 = _1052 + 1;
    bool _1056 = !_1048;
    int _1058 = _1056 ? 0 : (-1);
    bool _1060 = _982 != 3;
    int _1062 = _347 * _1054;
    int _1064 = _1062 + _708;
    int _1066 = ~_1026;
    int _1068 = _1066 + _1058;
    int _1070 = _1068 + 1;
    float _1072 = _335 * 2.0;
    int _1074 = _1042;
    int _1076 = _1064;
    if (_459)
    {
        _1014 = 0;
    }
    int _1078 = _1014;
    int _1080 = _1078;
    if (!_459)
    {
        _1080 = 1;
    }
    int _1082 = _1080;
    int _1084 = _397 * _1070;
    int _1086 = _1084 + _900;
    float _1088 = _512 * 2.0;
    bool _1090 = !_702;
    int _1092 = _1090 ? _1064 : (-1);
    float _1094 = floor(_1072);
    bool _1096 = _1082 != 1;
    if (_1060)
    {
        int _1098 = ~_1030;
        int _1100 = _1098 + 1;
        _1074 = _1100;
    }
    int _1102 = _1074;
    int _1104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1106 = _1104 != 0;
    bool _1108 = !_802;
    int _1110 = _1108 ? _1086 : (-1);
    float _1112 = floor(_1088);
    bool _1114 = !_1106;
    int _1116 = _1114 ? 0 : 1;
    float _1118 = in.m_58.x;
    float _1120 = in.m_58.y;
    float _1122 = in.m_58.z;
    int _1124 = _1110 & 3;
    bool _1126 = _1124 != 0;
    int _1128 = _1110 & 3;
    bool _1130 = _1128 != 0;
    bool _1132 = uint(_1124) > 1u;
    int _1134 = _1130 ? 0 : 1;
    if (_459)
    {
        _1076 = 0;
    }
    int _1136 = _1076;
    int _1138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1140 = _1138 != 0;
    int _1142 = _1136;
    if (!_459)
    {
        _1142 = 2;
    }
    int _1144 = _1142;
    bool _1146 = !_1140;
    int _1148 = _1146 ? 0 : 1;
    int _1150 = ~_1134;
    int _1152 = _1150 + 1;
    int _1154 = _1152 + 1;
    bool _1156 = _1144 != 2;
    float _1158 = -_213;
    float _1160 = _1158 + 0.5;
    float _1162 = 0.0;
    int _1164 = _1154;
    if (!_1096)
    {
        _1162 = _335;
    }
    float _1166 = _1162;
    float _1168 = _1166;
    if (!_1132)
    {
        int _1170 = ~_1134;
        int _1172 = _1170 + 1;
        _1164 = _1172;
    }
    int _1174 = _1164;
    float _1176 = _209 + 0.5;
    bool _1178 = _1112 > 0.0;
    float _1180 = _297 * _1120;
    float _1182 = 0.0;
    if (!_1096)
    {
        _1182 = _1166;
    }
    float _1184 = _1182;
    float _1186 = _335 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1188 = 0.0;
    float _1190 = _1184;
    if (!_1096)
    {
        _1188 = _337;
    }
    float _1192 = _1188;
    out.m_60.x = _1176;
    out.m_60.y = _1160;
    float _1194 = 0.0;
    float _1196 = _1192;
    if (!_1096)
    {
        _1194 = _337;
    }
    float _1198 = _1194;
    float _1200 = _1198;
    if (_1096)
    {
        _1190 = _512;
    }
    float _1202 = _1190;
    if (_1096)
    {
        _1168 = _512;
    }
    float _1204 = _1168;
    if (_1096)
    {
        _1196 = _335;
    }
    float _1206 = _1196;
    float _1208 = _1202 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1096)
    {
        _1200 = _335;
    }
    float _1210 = _1200;
    bool _1212 = _1112 >= 0.0;
    bool _1214 = isnan(_1112);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan(0.0);
    bool _1220 = _1216 || _1218;
    float _1222 = 0.0;
    if (_1156)
    {
        _1222 = _512;
    }
    float _1224 = _1222;
    int _1226 = _1220 ? 0 : 1;
    float _1228 = 0.0;
    float _1230 = _1224;
    if (_1156)
    {
        _1228 = _335;
    }
    float _1232 = _1228;
    int _1234 = ~_1226;
    int _1236 = _1234 + 1;
    int _1238 = _1236 + 1;
    float _1240 = _1232;
    int _1242 = _1238;
    if (!_1156)
    {
        _1230 = _337;
    }
    float _1244 = _1230;
    if (!_1156)
    {
        _1240 = _512;
    }
    float _1246 = _1240;
    bool _1248 = _1094 > 0.0;
    bool _1250 = _1094 >= 0.0;
    bool _1252 = isnan(_1094);
    bool _1254 = _1250 || _1252;
    bool _1256 = isnan(0.0);
    bool _1258 = _1254 || _1256;
    if (!_1178)
    {
        int _1260 = ~_1226;
        int _1262 = _1260 + 1;
        _1242 = _1262;
    }
    int _1264 = _1242;
    float _1266 = in.m_62.x;
    float _1268 = in.m_62.y;
    float _1270 = in.m_62.z;
    bool _1272 = _982 != 3;
    int _1274 = _1258 ? 0 : 1;
    float _1276 = in.m_64.x;
    float _1278 = in.m_64.y;
    float _1280 = in.m_64.z;
    bool _1282 = !_1126;
    int _1284 = _1282 ? 0 : 1;
    bool _1286 = uint(_1124) >= 2u;
    bool _1288 = _1124 != 3;
    bool _1290 = !_1272;
    int _1292 = _1290 ? 0 : (-1);
    bool _1294 = !_1288;
    int _1296 = _1294 ? 0 : (-1);
    int _1298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1300 = _1298 != 0;
    int _1302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1304 = _1302 != 0;
    int _1306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1308 = _1306 != 0;
    int _1310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1312 = _1310 != 0;
    int _1314 = ~_1274;
    int _1316 = _1314 + 1;
    int _1318 = _1316 + 1;
    int _1320 = _1286 ? 0 : 1;
    float _1322 = _297 * _1268;
    int _1324 = _1318;
    if (!_1248)
    {
        int _1326 = ~_1274;
        int _1328 = _1326 + 1;
        _1324 = _1328;
    }
    int _1330 = _1324;
    int _1332 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1334 = _1332 != 0;
    float _1336 = fma(_295, _1266, _1322);
    int _1338 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1340 = _1338 != 0;
    float _1342 = _297 * _1278;
    float _1344 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1346 = _512 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1348 = fma(_295, _1276, _1342);
    float _1350 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1352 = _1350 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1354 = _1344 * _512;
    float _1356 = fma(_295, _1118, _1180);
    float _1358 = fma(_299, _1280, _1348);
    float _1360 = trunc(_1354);
    int _1362 = int(_1360);
    float _1364 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1368 = _329 + _1366;
    float _1370 = fma(_299, _1122, _1356);
    float _1372 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1374 = fma(_1186, -2.0, _1364);
    float _1376 = _1368 * _524;
    float _1378 = fma(_299, _1270, _1336);
    float _1380 = 1.0 / _1352;
    float _1382 = -_1372;
    float _1384 = fma(_1346, 2.0, _1382);
    float _1386 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1388 = _329 + _1386;
    float _1390 = _512 + _335;
    float _1392 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1394 = _329 + _1392;
    float _1396 = _337 * 2.0;
    float _1398 = _1388 * _534;
    float _1400 = _1390 + (-1.0);
    int _1402 = _1362 << 4;
    int _1404 = _1402 + 1712;
    float _1406 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1408 = _329 + _1406;
    float _1410 = floor(_1396);
    int _1412 = _1404 + 8;
    uint _1414 = uint(int(uint(_1412) >> uint(2)));
    uint _1416 = uint(int(uint(int(_1414)) >> uint(2)));
    int _1418 = int(_1414) & 3;
    float _1420 = (*spvDescriptorSet0.vp_c9)._m0[int(_1416)][_1418];
    float _1422 = _1408 * _592;
    float _1424 = _337 + _335;
    float _1426 = _512 + _337;
    float _1428 = _1394 * _1380;
    float _1430 = _1424 + (-1.0);
    uint _1432 = uint(int(uint(_1404) >> uint(2)));
    uint _1434 = uint(int(uint(int(_1432)) >> uint(2)));
    int _1436 = int(_1432) & 3;
    float _1438 = (*spvDescriptorSet0.vp_c9)._m0[int(_1434)][_1436];
    int _1440 = int(_1432) + 1;
    uint _1442 = uint(int(uint(_1440) >> uint(2)));
    int _1444 = _1440 & 3;
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[int(_1442)][_1444];
    float _1448 = _1426 + (-1.0);
    float _1450 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1452 = !_1300;
    int _1454 = _1452 ? 0 : 1;
    float _1456 = fma(_1400, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1458 = fma(_1448, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1460 = _1410 >= 0.0;
    bool _1462 = isnan(_1410);
    bool _1464 = _1460 || _1462;
    bool _1466 = isnan(0.0);
    bool _1468 = _1464 || _1466;
    float _1470 = fma(_387, _1376, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _1472 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _1474 = isnan(_329);
    bool _1476 = _1472 || _1474;
    bool _1478 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _1480 = _1476 || _1478;
    float _1482 = float(_1480);
    float _1484 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1484;
    int _1488 = _1468 ? 0 : 1;
    float _1490 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1492 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1490;
    bool _1494 = _1410 > 0.0;
    float _1496 = fma(_381, _1398, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _1498 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1500 = isnan(_329);
    bool _1502 = _1498 || _1500;
    bool _1504 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1506 = _1502 || _1504;
    float _1508 = float(_1506);
    float _1510 = -_1482;
    float _1512 = _1510 + 1.0;
    float _1514 = fma(_1486, _1398, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1516 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1518 = _1516 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1520 = !_1308;
    int _1522 = _1520 ? 0 : 1;
    float _1524 = _1508 * _1512;
    float _1526 = -_1508;
    float _1528 = _1526 + 1.0;
    float _1530 = fma(_1518, _1376, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _1532 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1534 = isnan(_329);
    bool _1536 = _1532 || _1534;
    bool _1538 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1540 = _1536 || _1538;
    float _1542 = float(_1540);
    float _1544 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _1546 = _1544 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1548 = _373 * _1528;
    float _1550 = -_373;
    float _1552 = _1550 + 1.0;
    bool _1554 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1556 = isnan(_329);
    bool _1558 = _1554 || _1556;
    bool _1560 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1562 = _1558 || _1560;
    float _1564 = float(_1562);
    float _1566 = -_1542;
    float _1568 = _1566 + 1.0;
    bool _1570 = !_1304;
    int _1572 = _1570 ? 0 : 1;
    float _1574 = _1542 * _1552;
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1576;
    float _1580 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1582 = _1580 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    int _1584 = abs(_1020);
    float _1586 = fma(_1578, _1422, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1588 = fma(_1492, _1422, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1590 = _1564 * _1568;
    float _1592 = fma(_1582, _1428, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _1594 = _1420 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1596 = _1496 * _1590;
    float _1598 = _1514 * _1590;
    float _1600 = -_1564;
    float _1602 = _1600 + 1.0;
    float _1604 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1606 = _1594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1608 = ~_1488;
    int _1610 = _1608 + 1;
    int _1612 = _1610 + 1;
    float _1614 = fma(_1602, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1596);
    float _1616 = _1438 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1618 = _1446 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1620 = fma(_1602, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1598);
    float _1622 = _1616 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1624 = _1618 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1626 = _1612;
    float _1628 = _1378;
    if (!_1494)
    {
        int _1630 = ~_1488;
        int _1632 = _1630 + 1;
        _1626 = _1632;
    }
    int _1634 = _1626;
    float _1636 = fma(_1530, _1574, _1620);
    float _1638 = fma(_1470, _1574, _1614);
    out.m_66.x = _1622;
    out.m_66.y = _1624;
    out.m_66.z = _1606;
    out.m_66.w = _1604;
    float _1640 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1642 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1644 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1646 = fma(_1586, _1548, _1638);
    float _1648 = fma(_1588, _1548, _1636);
    float _1650 = -_1640;
    float _1652 = fma(_1642, 2.0, _1650);
    float _1654 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1656 = float(_1264);
    float _1658 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1644);
    int _1660 = abs(_1572);
    float _1662 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1664 = abs(_1454);
    float _1666 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1668 = log2(_1666);
    float _1670 = float(uint(_844));
    float _1672 = _1246 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1674 = fma(_1546, _1428, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _1676 = float(_1330);
    float _1678 = as_type<float>(_497) * _1670;
    float _1680 = fma(_1672, -2.0, _1662);
    float _1682 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1684 = abs(_1522);
    float _1686 = _1206 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1688 = _1124 != 3;
    float _1690 = trunc(_1678);
    float _1692 = precise::max(_1690, 0.0);
    uint _1694 = uint(_1692);
    float _1696 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1682);
    float _1698 = float(_1684);
    float _1700 = fma(_1686, -2.0, _1654);
    float _1702 = _1668 * _139;
    float _1704 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1706 = -_139;
    float _1708 = fma(_1706, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1384);
    int _1710 = ~_397;
    int _1712 = _1710 + 1;
    float _1714 = _1698 * _1676;
    int _1716 = ~_1320;
    int _1718 = _1716 + 1;
    int _1720 = _1718 + 1;
    float _1722 = exp2(_1702);
    float _1724 = _1704 * _512;
    int _1726 = _1720;
    if (_1688)
    {
        int _1728 = ~_1320;
        int _1730 = _1728 + 1;
        _1726 = _1730;
    }
    int _1732 = _1726;
    float _1734 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1696);
    bool _1736 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1738 = isnan(0.0);
    bool _1740 = _1736 || _1738;
    bool _1742 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1744 = _1740 || _1742;
    float _1746 = -_139;
    float _1748 = fma(_1746, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1652);
    int _1750 = _1712 * int(_1694);
    int _1752 = _1750 + _844;
    float _1754 = trunc(_1724);
    int _1756 = int(_1754);
    float _1758 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1658);
    float _1760 = float(uint(_1752));
    float _1762 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1680);
    float _1764 = float(_1634);
    float _1766 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1768 = float(_1664);
    float _1770 = -_1722;
    float _1772 = _1770 + 1.0;
    float _1774 = as_type<float>(_497) * _1760;
    float _1776 = -_1766;
    float _1778 = fma(_1208, 2.0, _1776);
    float _1780 = in.m_68.x;
    float _1782 = in.m_68.y;
    float _1784 = in.m_68.z;
    float _1786 = _1768 * _1764;
    float _1788 = _1744 ? _1772 : 0.0;
    float _1790 = trunc(_1774);
    float _1792 = precise::max(_1790, 0.0);
    uint _1794 = uint(_1792);
    bool _1796 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1798 = isnan(1.0);
    bool _1800 = _1796 || _1798;
    bool _1802 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1804 = _1800 || _1802;
    float _1806 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1808 = 1.0 + _1806;
    int _1810 = _1756 << 4;
    int _1812 = _1810 + 1968;
    float _1814 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1816 = -_139;
    float _1818 = fma(_1816, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1778);
    float _1820 = 1.0 / _1808;
    uint _1822 = uint(int(uint(_1812) >> uint(2)));
    uint _1824 = uint(int(uint(int(_1822)) >> uint(2)));
    int _1826 = int(_1822) & 3;
    float _1828 = (*spvDescriptorSet0.vp_c9)._m0[int(_1824)][_1826];
    int _1830 = int(_1822) + 1;
    uint _1832 = uint(int(uint(_1830) >> uint(2)));
    int _1834 = _1830 & 3;
    float _1836 = (*spvDescriptorSet0.vp_c9)._m0[int(_1832)][_1834];
    float _1838 = float(_1660);
    float _1840 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1842 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1844 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1846 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1814);
    float _1848 = _1838 * _1656;
    float _1850 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1840);
    int _1852 = _1812 + 8;
    uint _1854 = uint(int(uint(_1852) >> uint(2)));
    uint _1856 = uint(int(uint(int(_1854)) >> uint(2)));
    int _1858 = int(_1854) & 3;
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[int(_1856)][_1858];
    float _1862 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1842);
    float _1864 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1844);
    int _1866 = ~_397;
    int _1868 = _1866 + 1;
    float _1870 = _1848 * (-2.0);
    int _1872 = int(_1694) + int(_1794);
    float _1874 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1846);
    float _1876 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1374);
    float _1878 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1850);
    float _1880 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1862);
    float _1882 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1864);
    float _1884 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1700);
    if (_1804)
    {
        float _1886 = _1788 * _1820;
        _141 = _1886;
    }
    float _1888 = _141;
    float _1890 = fma(_1450, _1870, _1450);
    int _1892 = _1868 * _1872;
    int _1894 = _1892 + _844;
    float _1896 = fma(_1870, _1782, _1782);
    float _1898 = _335 + (-0.5);
    float _1900 = _1714 * (-2.0);
    float _1902 = _337 + (-0.5);
    bool _1904 = uint(_1894) >= uint(_397);
    float _1906 = fma(_1898, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1896);
    float _1908 = _1786 * (-2.0);
    float _1910 = fma(_1458, _1900, _1458);
    bool _1912 = !_1904;
    int _1914 = _1912 ? 0 : (-1);
    float _1916 = fma(_1900, _1784, _1784);
    bool _1918 = _512 > 0.5;
    float _1920 = fma(_1908, _1780, _1780);
    float _1922 = _512 + (-0.5);
    float _1924 = fma(_1456, _1908, _1456);
    float _1926 = fma(_1902, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1916);
    float _1928 = fma(_1922, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1920);
    float _1930 = fma(_1592, _1524, _1646);
    float _1932 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1934 = fma(_1890, _1888, _1906);
    float _1936 = fma(_1924, _1888, _1928);
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1940 = in.m_54.x;
    float _1942 = in.m_54.y;
    float _1944 = fma(_1674, _1524, _1648);
    float _1946 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1930);
    float _1948 = _1828 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1950 = _1836 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1952 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1954 = _1934 * 0.15915493667125701904296875;
    float _1956 = _1948 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1958 = _1950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1960 = _1936 * 0.15915493667125701904296875;
    float _1962 = fma(_1910, _1888, _1926);
    float _1964 = _1860 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1966 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1944);
    float _1968 = _1954 * 6.283185482025146484375;
    float _1970 = sin(_1968);
    float _1972 = _1962 * 0.15915493667125701904296875;
    float _1974 = _1964 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1976 = _1932 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1978 = _431 + (-0.5);
    float _1980 = _427 + 0.5;
    int _1982 = ~_1872;
    int _1984 = _1982 + _1914;
    int _1986 = _1984 + 1;
    out.m_70.x = _1956;
    out.m_70.y = _1958;
    out.m_70.z = _1974;
    out.m_70.w = _1938;
    float _1988 = _1954 * 6.283185482025146484375;
    float _1990 = cos(_1988);
    float _1992 = _1952 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1994 = fma(_1976, _1980, _1748);
    float _1996 = _1946 * _1940;
    float _1998 = _1966 * _1942;
    float _2000 = -_1992;
    float _2002 = -_1762;
    float _2004 = fma(_2000, _1978, _2002);
    float _2006 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _2008 = abs(_1102);
    float _2010 = _1960 * 6.283185482025146484375;
    float _2012 = sin(_2010);
    float _2014 = _1996 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2016 = _1998 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _2018 = abs(_1116);
    int _2020 = _397 * _1986;
    int _2022 = _2020 + _844;
    int _2024 = _970 >> 31;
    float _2026 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _209);
    int _2028 = _1110 >> 31;
    float _2030 = _1960 * 6.283185482025146484375;
    float _2032 = cos(_2030);
    int _2034 = _2024 & 3;
    float _2036 = _2014 * _2026;
    int _2038 = _2028 & 3;
    float _2040 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _213);
    int _2042 = _970 + _2034;
    int _2044 = _1110 + _2038;
    float _2046 = _1972 * 6.283185482025146484375;
    float _2048 = cos(_2046);
    int _2050 = _2042 >> 2;
    float _2052 = _2012 * _1970;
    int _2054 = _2044 >> 2;
    float _2056 = _2016 * _2040;
    int _2058 = _2050 << 4;
    int _2060 = _2058 + 368;
    float _2062 = _2012 * _1990;
    int _2064 = _2054 << 4;
    int _2066 = _2064 + 512;
    float _2068 = _1972 * 6.283185482025146484375;
    float _2070 = sin(_2068);
    uint _2072 = uint(int(uint(_2060) >> uint(2)));
    uint _2074 = uint(int(uint(int(_2072)) >> uint(2)));
    int _2076 = int(_2072) & 3;
    float _2078 = (*spvDescriptorSet0.vp_c9)._m0[int(_2074)][_2076];
    int _2080 = int(_2072) + 1;
    uint _2082 = uint(int(uint(_2080) >> uint(2)));
    int _2084 = _2080 & 3;
    float _2086 = (*spvDescriptorSet0.vp_c9)._m0[int(_2082)][_2084];
    float _2088 = _2032 * _1990;
    float _2090 = _2032 * _1970;
    float _2092 = _2032 * _2048;
    float _2094 = _2012 * _2048;
    float _2096 = _1990 * _2048;
    float _2098 = _1970 * _2048;
    float _2100 = _2092 * _2056;
    float _2102 = _2092 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2104 = _2092 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2106 = _2092 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2108 = fma(_2070, _2088, _2052);
    float _2110 = fma(_2070, _2052, _2088);
    float _2112 = -_2056;
    float _2114 = _2070 * _2112;
    uint _2116 = uint(int(uint(_2066) >> uint(2)));
    uint _2118 = uint(int(uint(int(_2116)) >> uint(2)));
    int _2120 = int(_2116) & 3;
    float _2122 = (*spvDescriptorSet0.vp_c9)._m0[int(_2118)][_2120];
    int _2124 = int(_2116) + 1;
    uint _2126 = uint(int(uint(_2124) >> uint(2)));
    int _2128 = _2124 & 3;
    float _2130 = (*spvDescriptorSet0.vp_c9)._m0[int(_2126)][_2128];
    float _2132 = _2094 * _2056;
    float _2134 = -_2090;
    float _2136 = fma(_2070, _2062, _2134);
    float _2138 = fma(_2096, _2036, _2114);
    float _2140 = fma(_2108, _2036, _2100);
    float _2142 = -_2070;
    float _2144 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2102);
    float _2146 = fma(_2136, _2036, _2132);
    float _2148 = -_2062;
    float _2150 = fma(_2070, _2090, _2148);
    int _2152 = _2060 + 8;
    uint _2154 = uint(int(uint(_2152) >> uint(2)));
    uint _2156 = uint(int(uint(int(_2154)) >> uint(2)));
    int _2158 = int(_2154) & 3;
    float _2160 = (*spvDescriptorSet0.vp_c9)._m0[int(_2156)][_2158];
    int _2162 = int(_2154) + 1;
    uint _2164 = uint(int(uint(_2162) >> uint(2)));
    int _2166 = _2162 & 3;
    float _2168 = (*spvDescriptorSet0.vp_c9)._m0[int(_2164)][_2166];
    float _2170 = -_2070;
    float _2172 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2104);
    float _2174 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2144);
    float _2176 = -_2070;
    float _2178 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2106);
    float _2180 = _2150 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2182 = _2108 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2184 = _2108 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2186 = _2108 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2188 = _2066 + 8;
    uint _2190 = uint(int(uint(_2188) >> uint(2)));
    uint _2192 = uint(int(uint(int(_2190)) >> uint(2)));
    int _2194 = int(_2190) & 3;
    float _2196 = (*spvDescriptorSet0.vp_c9)._m0[int(_2192)][_2194];
    int _2198 = int(_2190) + 1;
    uint _2200 = uint(int(uint(_2198) >> uint(2)));
    int _2202 = _2198 & 3;
    float _2204 = (*spvDescriptorSet0.vp_c9)._m0[int(_2200)][_2202];
    int _2206 = abs(_1010);
    float _2208 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2182);
    float _2210 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2184);
    float _2212 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2186);
    float _2214 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2172);
    float _2216 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2178);
    int _2218 = abs(_1174);
    float _2220 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2180);
    int _2222 = ~_1584;
    int _2224 = _2222 + 1;
    int _2226 = _2224 + 1;
    float _2228 = fma(_2098, _2006, _2138);
    float _2230 = _2150 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2232 = _2150 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2234 = fma(_2150, _2006, _2140);
    int _2236 = ~_2206;
    int _2238 = _2236 + 1;
    int _2240 = _2238 + 1;
    int _2242 = _2226 * as_type<int>(_2086);
    float _2244 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2230);
    float _2246 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2232);
    int _2248 = ~_2218;
    int _2250 = _2248 + 1;
    int _2252 = _2250 + 1;
    int _2254 = _2240 * as_type<int>(_2078);
    int _2256 = _2254 + _2242;
    int _2258 = abs(_1292);
    float _2260 = fma(_2110, _2006, _2146);
    int _2262 = abs(_1284);
    float _2264 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2244);
    float _2266 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2220);
    int _2268 = abs(_1732);
    float _2270 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2272 = int(_2270);
    int _2274 = ~_2262;
    int _2276 = _2274 + 1;
    int _2278 = _2276 + 1;
    float _2280 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2246);
    int _2282 = ~_2008;
    int _2284 = _2282 + 1;
    int _2286 = _2284 + 1;
    int _2288 = _2252 * as_type<int>(_2130);
    int _2290 = ~_2268;
    int _2292 = _2290 + 1;
    int _2294 = _2292 + 1;
    int _2296 = ~_2258;
    int _2298 = _2296 + 1;
    int _2300 = _2298 + 1;
    float _2302 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2304 = int(_2302);
    int _2306 = _2278 * as_type<int>(_2122);
    int _2308 = _2306 + _2288;
    float _2310 = _2234 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2312 = _2286 * as_type<int>(_2160);
    int _2314 = _2312 + _2256;
    float _2316 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2310);
    int _2318 = _2300 * as_type<int>(_2168);
    int _2320 = _2318 + _2314;
    int _2322 = abs(_1148);
    int _2324 = _2294 * as_type<int>(_2196);
    int _2326 = _2324 + _2308;
    int _2328 = abs(_1296);
    int _2330 = ~_2018;
    int _2332 = _2330 + 1;
    int _2334 = _2332 + 1;
    int _2336 = ~_2328;
    int _2338 = _2336 + 1;
    int _2340 = _2338 + 1;
    int _2342 = _2320 * _2334;
    float _2344 = float(uint(_2304));
    int _2346 = _2340 * as_type<int>(_2204);
    int _2348 = _2346 + _2326;
    int _2350 = ~_2322;
    int _2352 = _2350 + 1;
    int _2354 = _2352 + 1;
    int _2356 = _1092 * _2018;
    int _2358 = _2356 + _2342;
    float _2360 = float(uint(_2272));
    float _2362 = _1370 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2364 = abs(_2272);
    float _2366 = 1.0 / _2344;
    int _2368 = _2348 * _2354;
    float _2370 = _2234 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2372 = _2234 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2374 = abs(_2304);
    float _2376 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2370);
    int _2378 = ~_2272;
    int _2380 = _2378 + 1;
    float _2382 = 1.0 / _2360;
    float _2384 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2372);
    float _2386 = fma(_2260, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2376);
    bool _2388 = !_802;
    int _2390 = _2388 ? _2022 : (-1);
    float _2392 = fma(_2260, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2384);
    float _2394 = float(uint(_2374));
    float _2396 = _2386 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2398 = float(uint(_2364));
    int _2400 = _2390 * _2322;
    int _2402 = _2400 + _2368;
    float _2404 = _1358 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2406 = _2392 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _2408 = as_type<int>(_2366) + (-2);
    float _2410 = _2362 + _2396;
    float _2412 = float(uint(_2358));
    float _2414 = _2404 + _2406;
    int _2416 = as_type<int>(_2382) + (-2);
    float _2418 = 1.0 / _2394;
    float _2420 = float(uint(_2402));
    float _2422 = as_type<float>(_2408) * _2412;
    float _2424 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2426 = _2414 + _2424;
    float _2428 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2430 = _2410 + _2428;
    int _2432 = abs(_2402);
    float _2434 = as_type<float>(_2416) * _2420;
    float _2436 = _2426 * _2426;
    float _2438 = 1.0 / _2398;
    float _2440 = _2430 * _2430;
    int _2442 = ~_2304;
    int _2444 = _2442 + 1;
    float _2446 = fma(_2260, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2316);
    float _2448 = float(uint(_2432));
    float _2450 = _2436 + _2440;
    int _2452 = ~_2374;
    int _2454 = _2452 + 1;
    float _2456 = trunc(_2422);
    float _2458 = precise::max(_2456, 0.0);
    uint _2460 = uint(_2458);
    int _2462 = as_type<int>(_2418) + (-2);
    float _2464 = trunc(_2434);
    float _2466 = precise::max(_2464, 0.0);
    uint _2468 = uint(_2466);
    int _2470 = abs(_2358);
    int _2472 = as_type<int>(_2438) + (-2);
    float _2474 = float(uint(_2470));
    float _2476 = sqrt(_2450);
    int _2478 = _2444 * int(_2460);
    int _2480 = _2478 + _2358;
    float _2482 = as_type<float>(_2462) * _2474;
    float _2484 = as_type<float>(_2472) * _2448;
    float _2486 = float(uint(_2480));
    int _2488 = _2380 * int(_2468);
    int _2490 = _2488 + _2402;
    float _2492 = trunc(_2482);
    float _2494 = precise::max(_2492, 0.0);
    uint _2496 = uint(_2494);
    float _2498 = float(uint(_2490));
    float _2500 = as_type<float>(_2408) * _2486;
    float _2502 = _1378 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _2504 = _2476 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2506 = trunc(_2484);
    float _2508 = precise::max(_2506, 0.0);
    uint _2510 = uint(_2508);
    float _2512 = as_type<float>(_2416) * _2498;
    int _2514 = ~_2364;
    int _2516 = _2514 + 1;
    float _2518 = _2446 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2520 = _2502 + _2518;
    float _2522 = trunc(_2500);
    float _2524 = precise::max(_2522, 0.0);
    uint _2526 = uint(_2524);
    int _2528 = _2454 * int(_2496);
    int _2530 = _2528 + _2470;
    float _2532 = as_type<float>(_2454);
    float _2534 = _2436;
    float _2536 = _2410;
    float _2538 = _2414;
    float _2540 = _2362;
    if (!_2504)
    {
        _1628 = _2440;
    }
    float _2542 = _1628;
    float _2544 = _2542;
    if (!_2504)
    {
        _2532 = _2436;
    }
    float _2546 = _2532;
    int _2548 = _2516 * int(_2510);
    int _2550 = _2548 + _2432;
    float _2552 = float(uint(_2530));
    float _2554 = _2546;
    if (!_2504)
    {
        _2534 = _2520;
    }
    float _2556 = _2534;
    float _2558 = float(uint(_2550));
    bool _2560 = !_2504;
    float _2562 = _2556;
    if (!_2560)
    {
        float _2564 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2566 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2568 = _2476 + _2566;
        float _2570 = rsqrt(_2450);
        float _2572 = _2568 * _2564;
        float _2574 = _2520 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2576 = _2572 * 0.15915493667125701904296875;
        float _2578 = _2576 * 6.283185482025146484375;
        float _2580 = sin(_2578);
        float _2582 = _2576 * 6.283185482025146484375;
        float _2584 = cos(_2582);
        float _2586 = fma(_2580, _2574, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2588 = _2570 * _2586;
        float _2590 = _2584 + (-1.0);
        float _2592 = fma(_2426, _2588, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2594 = fma(_2430, _2588, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2596 = _2590 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2598 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2600 = _2592 + _2598;
        float _2602 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2604 = _2594 + _2602;
        float _2606 = fma(_2520, _2584, _2596);
        float _2608 = _2600 * _2600;
        float _2610 = _2604 * _2604;
        _2562 = _2606;
        _2554 = _2608;
        _2544 = _2610;
        _2536 = _2594;
        _2538 = _2592;
    }
    float _2612 = _2562;
    float _2614 = _2554;
    float _2616 = _2544;
    float _2618 = _2536;
    float _2620 = _2538;
    bool _2622 = _335 > 0.5;
    float _2624 = as_type<float>(_2462) * _2552;
    float _2626 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2208);
    float _2628 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2210);
    float _2630 = -_213;
    int _2632 = _2622 ? as_type<int>(_2630) : as_type<int>(_213);
    float _2634 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2212);
    bool _2636 = _337 > 0.5;
    float _2638 = as_type<float>(_2472) * _2558;
    float _2640 = -_209;
    int _2642 = _1918 ? as_type<int>(_2640) : as_type<int>(_209);
    float _2644 = trunc(_2624);
    float _2646 = precise::max(_2644, 0.0);
    uint _2648 = uint(_2646);
    float _2650 = -_209;
    int _2652 = _2636 ? as_type<int>(_2650) : as_type<int>(_209);
    float _2654 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2656 = !_1334;
    float _2658 = _2656 ? _213 : as_type<float>(_2632);
    float _2660 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2662 = _2612 + _2660;
    bool _2664 = !_1312;
    float _2666 = _2664 ? _209 : as_type<float>(_2652);
    float _2668 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2670 = !_1340;
    float _2672 = _2670 ? _209 : as_type<float>(_2642);
    float _2674 = trunc(_2512);
    float _2676 = precise::max(_2674, 0.0);
    uint _2678 = uint(_2676);
    float _2680 = _2654 * _2174;
    float _2682 = _2654 * _2216;
    int _2684 = int(_2460) + int(_2526);
    float _2686 = -_1880;
    float _2688 = _2686 + 1.0;
    int _2690 = ~_2304;
    int _2692 = _2690 + 1;
    float _2694 = fma(_2668, _2626, _2680);
    float _2696 = fma(_2662, _2662, _2614);
    float _2698 = trunc(_2638);
    float _2700 = precise::max(_2698, 0.0);
    uint _2702 = uint(_2700);
    float _2704 = _2654 * _2214;
    int _2706 = _2692 * _2684;
    int _2708 = _2706 + _2358;
    int _2710 = int(_2496) + int(_2648);
    float _2712 = -_2688;
    float _2714 = fma(_427, _2712, _1994);
    float _2716 = fma(_2668, _2628, _2704);
    float _2718 = fma(_2668, _2634, _2682);
    int _2720 = ~_2272;
    int _2722 = _2720 + 1;
    float _2724 = -_1882;
    float _2726 = _2724 + 1.0;
    int _2728 = int(_2468) + int(_2678);
    float _2730 = -_1734;
    float _2732 = _2730 + 1.0;
    out.m_72.x = _2626;
    out.m_72.y = _2628;
    out.m_72.z = _2634;
    int _2734 = ~_2374;
    int _2736 = _2734 + 1;
    int _2738 = ~_2364;
    int _2740 = _2738 + 1;
    int _2742 = _2722 * _2728;
    int _2744 = _2742 + _2402;
    int _2746 = int(_2510) + int(_2702);
    int _2748 = _2736 * _2710;
    int _2750 = _2748 + _2470;
    bool _2752 = uint(_2708) >= uint(_2304);
    float _2754 = _2696 + _2616;
    bool _2756 = uint(_2744) >= uint(_2272);
    int _2758 = _2740 * _2746;
    int _2760 = _2758 + _2432;
    bool _2762 = !_2752;
    int _2764 = _2762 ? 0 : (-1);
    float _2766 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2768 = uint(_2750) >= uint(_2374);
    float _2770 = fma(_431, _2726, _2004);
    int _2772 = ~_2684;
    int _2774 = _2772 + _2764;
    int _2776 = _2774 + 1;
    bool _2778 = uint(_2760) >= uint(_2364);
    int _2780 = _2358 ^ _2304;
    float _2782 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2784 = !_2756;
    int _2786 = _2784 ? 0 : (-1);
    out.m_74.x = _2714;
    out.m_74.y = _2770;
    bool _2788 = _2304 == 0;
    bool _2790 = _2304 == 0;
    int _2792 = _2304 * _2776;
    int _2794 = _2792 + _2358;
    bool _2796 = !_2768;
    int _2798 = _2796 ? 0 : (-1);
    float _2800 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _2802 = uint(int(uint(_2780) >> uint(31)));
    int _2804 = ~_2728;
    int _2806 = _2804 + _2786;
    int _2808 = _2806 + 1;
    int _2810 = ~_2798;
    int _2812 = _2710 + _2810;
    int _2814 = _2812 + 1;
    int _2816 = ~int(_2802);
    int _2818 = _2816 + 1;
    int _2820 = _2272 * _2808;
    int _2822 = _2820 + _2402;
    int _2824 = _2402 ^ _2272;
    float _2826 = _2782 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2828 = !_2788;
    int _2830 = _2828 ? _2794 : (-1);
    float _2832 = sqrt(_2754);
    int _2834 = _2814 ^ _2818;
    bool _2836 = !_2778;
    int _2838 = _2836 ? 0 : (-1);
    float _2840 = _2800 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    uint _2842 = uint(int(uint(_2824) >> uint(31)));
    bool _2844 = _2272 == 0;
    float _2846 = float(_2830);
    int _2848 = ~_2818;
    int _2850 = _2848 + _2834;
    int _2852 = _2850 + 1;
    float _2854 = fma(_2654, _2654, 1.0);
    bool _2856 = _2272 == 0;
    float _2858 = fma(_2826, _2846, _1708);
    int _2860 = ~_2838;
    int _2862 = _2746 + _2860;
    int _2864 = _2862 + 1;
    float _2866 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2868 = ~int(_2842);
    int _2870 = _2868 + 1;
    bool _2872 = !_2844;
    int _2874 = _2872 ? _2822 : (-1);
    float _2876 = _2666 + 0.5;
    int _2878 = _2864 ^ _2870;
    float _2880 = float(_2874);
    float _2882 = rsqrt(_2854);
    int _2884 = ~_2870;
    int _2886 = _2884 + _2878;
    int _2888 = _2886 + 1;
    float _2890 = _2672 + 0.5;
    bool _2892 = _2832 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2894 = isnan(_2832);
    bool _2896 = _2892 || _2894;
    bool _2898 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2900 = _2896 || _2898;
    float _2902 = fma(_2840, _2880, _1818);
    bool _2904 = !_2790;
    int _2906 = _2904 ? _2852 : (-1);
    float _2908 = fma(_2826, _2890, _2858);
    bool _2910 = !_2856;
    int _2912 = _2910 ? _2888 : (-1);
    float _2914 = _2766 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2916 = float(_2906);
    float _2918 = fma(_2840, _2876, _2902);
    float _2920 = float(_2912);
    float _2922 = _2866 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2924 = _642 + (-0.5);
    float _2926 = -_1876;
    float _2928 = fma(_2914, _2916, _2926);
    float _2930 = _2658 + (-0.5);
    float _2932 = -_1884;
    float _2934 = fma(_2922, _2920, _2932);
    float _2936 = _2654 * _2882;
    float _2938 = _2280 + _2718;
    float _2940 = -_2914;
    float _2942 = fma(_2940, _2930, _2928);
    float _2944 = -_2922;
    float _2946 = fma(_2944, _2924, _2934);
    float _2948 = -_2264;
    float _2950 = _2936 * _2948;
    float _2952 = -_2266;
    float _2954 = _2936 * _2952;
    float _2956 = -_2280;
    float _2958 = _2936 * _2956;
    float _2960 = -_1758;
    float _2962 = _2960 + 1.0;
    float _2964 = fma(_2882, _2174, _2950);
    float _2966 = fma(_2882, _2214, _2954);
    float _2968 = -_1874;
    float _2970 = _2968 + 1.0;
    float _2972 = -_1878;
    float _2974 = _2972 + 1.0;
    float _2976 = fma(_2882, _2216, _2958);
    float _2978 = -_2962;
    float _2980 = fma(_2666, _2978, _2918);
    float _2982 = _2264 + _2694;
    float _2984 = _2266 + _2716;
    float _2986 = -_2970;
    float _2988 = fma(_2672, _2986, _2908);
    float _2990 = fma(_2658, _2974, _2942);
    float _2992 = fma(_642, _2732, _2946);
    out.m_76.x = _2964;
    out.m_76.y = _2966;
    out.m_76.z = _2976;
    float _2994 = _2942;
    if (!_2900)
    {
        _2994 = 1.0;
    }
    float _2996 = _2994;
    out.m_78.x = _2982;
    out.m_78.y = _2984;
    out.m_78.z = _2938;
    out.m_80.x = _2988;
    out.m_80.y = _2990;
    out.m_80.z = _2980;
    out.m_80.w = _2992;
    bool _2998 = !_2900;
    float _3000 = _2996;
    if (!_2998)
    {
        bool _3002 = _2832 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3004 = isnan(_2832);
        bool _3006 = _3002 || _3004;
        bool _3008 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3010 = _3006 || _3008;
        if (!_3010)
        {
            float _3012 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3014 = _2832 + _3012;
            float _3016 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3018 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3016;
            float _3020 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3022 = _3020 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3024 = 1.0 / _3018;
            float _3026 = _3014 * _3024;
            float _3028 = fma(_3026, _3022, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3000 = _3028;
            _3030 = true;
        }
        else
        {
            bool _3032 = _2832 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3034 = isnan(_2832);
            bool _3036 = _3032 || _3034;
            bool _3038 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3040 = _3036 || _3038;
            if (!_3040)
            {
                float _3042 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3044 = _2832 + _3042;
                float _3046 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3048 = _3046 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3050 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3052 = _3050 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3054 = 1.0 / _3048;
                float _3056 = _3044 * _3054;
                float _3058 = fma(_3056, _3052, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3000 = _3058;
                _3030 = true;
            }
            else
            {
                _3000 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3030 = false;
    float _3060 = _3000;
    float _3062 = _2502 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3064 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3066 = _2612 + _3064;
    float _3068 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3070 = _2618 + _3068;
    float _3072 = fma(_2404, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3062);
    float _3074 = _2502 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _3076 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3078 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3080 = _3076 || _3078;
    bool _3082 = isnan(0.5);
    bool _3084 = _3080 || _3082;
    float _3086 = fma(_3066, _3060, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3088 = fma(_2362, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3072);
    float _3090 = fma(_2404, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3074);
    float _3092 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3094 = _2620 + _3092;
    float _3096 = _3088 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3098 = fma(_2362, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3090);
    float _3100 = fma(_3094, _3060, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3102 = fma(_3070, _3060, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3104 = 1.0 / _3096;
    float _3106 = _3098 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _3108 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3110 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3112 = _3108 || _3110;
    bool _3114 = isnan(0.5);
    bool _3116 = _3112 || _3114;
    float _3118 = _3094;
    float _3120 = _3106;
    float _3122 = _3088;
    float _3124 = _3100;
    float _3126 = _3060;
    float _3128 = _3102;
    if (_3084)
    {
        _3118 = _3100;
    }
    float _3130 = _3118;
    float _3132 = _3106 + _3096;
    float _3134 = _3130;
    if (_3084)
    {
        _3120 = _3086;
    }
    float _3136 = _3120;
    float _3138 = _3136;
    if (_3084)
    {
        _3122 = _3102;
    }
    float _3140 = _3122;
    float _3142 = _3140;
    if (!_3084)
    {
        float _3144 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3146 = _2502 + _3144;
        float _3148 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3150 = _2404 + _3148;
        float _3152 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3154 = _3146 * _3146;
        float _3156 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3158 = _2362 + _3156;
        float _3160 = fma(_3150, _3150, _3154);
        float _3162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3164 = fma(_3158, _3158, _3160);
        float _3166 = sqrt(_3164);
        float _3168 = _3152 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3170 = precise::min(_3166, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3172 = _3170 * _3162;
        float _3174 = -_2404;
        float _3176 = _3174 + _3100;
        float _3178 = -_2362;
        float _3180 = _3178 + _3102;
        float _3182 = _3168 * _3172;
        float _3184 = -_2502;
        float _3186 = _3184 + _3086;
        float _3188 = fma(_3176, _3182, _2404);
        float _3190 = fma(_3186, _3182, _2502);
        float _3192 = fma(_3180, _3182, _2362);
        _3138 = _3190;
        _3134 = _3188;
        _3142 = _3192;
        _3124 = _3182;
        _3126 = _3180;
    }
    float _3194 = _3138;
    float _3196 = _3134;
    float _3198 = _3142;
    float _3200 = _3124;
    float _3202 = _3126;
    float _3204 = _3202;
    float _3206 = _3200;
    if (_3116)
    {
        _3204 = 1.0;
    }
    float _3208 = _3204;
    float _3210 = _3132 * _3104;
    float _3212 = _3210 * 0.5;
    float _3214 = _3208;
    float _3216 = _3212;
    if (!_3116)
    {
        float _3218 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3220 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3222 = fma(_3212, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3220);
        float _3224 = _3218 * 0.15915493667125701904296875;
        float _3226 = _3224 * 6.283185482025146484375;
        float _3228 = cos(_3226);
        float _3230 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3232 = _3230 * 0.15915493667125701904296875;
        float _3234 = _3224 * 6.283185482025146484375;
        float _3236 = sin(_3234);
        float _3238 = 1.0 / _3228;
        float _3240 = _3232 * 6.283185482025146484375;
        float _3242 = cos(_3240);
        float _3244 = _3236 * _3238;
        float _3246 = 1.0 / _3222;
        float _3248 = _3242 * _3244;
        float _3250 = _3232 * 6.283185482025146484375;
        float _3252 = sin(_3250);
        float _3254 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3256 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3254;
        float _3258 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3260 = _3246 * _3258;
        float _3262 = 1.0 / _3248;
        float _3264 = 1.0 / _3256;
        float _3266 = _3252 * _3262;
        float _3268 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3270 = fma(_3266, _3260, _3268);
        float _3272 = _3270 * _3264;
        float _3274 = precise::clamp(_3272, 0.0, 1.0);
        float _3276 = -_3274;
        float _3278 = _3276 + 1.0;
        _3128 = _3232;
        _3206 = _3264;
        _3214 = _3278;
    }
    float _3280 = _3128;
    float _3282 = _3206;
    float _3284 = _3214;
    float _3286 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3288 = _3194 + _3286;
    float _3290 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3292 = _3196 + _3290;
    float _3294 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3296 = _3198 + _3294;
    float _3298 = _3288 * _3288;
    float _3300 = fma(_3292, _3292, _3298);
    float _3302 = fma(_3296, _3296, _3300);
    float _3304 = rsqrt(_3302);
    float _3306 = sqrt(_3302);
    float _3308 = _3304 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3310 = _3292 * _3308;
    float _3312 = _3296 * _3308;
    float _3314 = _3310 * _3310;
    float _3316 = _3312 * _3312;
    float _3318 = _3314 + _3316;
    float _3320 = sqrt(_3318);
    bool _3322 = _3320 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3324 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3326 = _3320 + _3324;
    float _3328 = _3280;
    float _3330 = _3326;
    float _3332 = _3288;
    float _3334 = _3310;
    if (_3322)
    {
        float _3336 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3328 = _3336;
    }
    float _3338 = _3328;
    float _3340 = _3338;
    if (_3322)
    {
        float _3342 = _3326 * _3338;
        _3330 = _3342;
    }
    float _3344 = _3330;
    if (_3322)
    {
        float _3346 = rsqrt(_3318);
        _3340 = _3346;
    }
    float _3348 = _3340;
    float _3350 = _3348;
    if (_3322)
    {
        float _3352 = _3344 * 0.15915493667125701904296875;
        _3216 = _3352;
    }
    float _3354 = _3216;
    float _3356 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3358 = _3296;
    if (_3322)
    {
        float _3360 = _3354 * 6.283185482025146484375;
        float _3362 = sin(_3360);
        _3358 = _3362;
    }
    float _3364 = _3358;
    float _3366 = precise::max(0.0, _3356);
    float _3368 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3370 = _3282;
    float _3372 = _3366;
    if (_3322)
    {
        float _3374 = _3354 * 6.283185482025146484375;
        float _3376 = cos(_3374);
        _3370 = _3376;
    }
    float _3378 = _3370;
    float _3380 = -_3308;
    float _3382 = -_3366;
    float _3384 = fma(_3288, _3380, _3382);
    if (_3322)
    {
        float _3386 = _3384 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3332 = _3386;
    }
    float _3388 = _3332;
    float _3390 = _3364;
    float _3392 = _3388;
    if (_3322)
    {
        float _3394 = fma(_3364, _3388, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3390 = _3394;
    }
    float _3396 = _3390;
    float _3398 = _3396;
    if (!_3322)
    {
        _3392 = _3384;
    }
    float _3400 = _3392;
    float _3402 = _3400;
    if (_3322)
    {
        float _3404 = _3348 * _3396;
        _2540 = _3404;
    }
    float _3406 = _2540;
    if (!_3322)
    {
        _3398 = _3314;
    }
    float _3408 = _3398;
    float _3410 = _3194 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3412 = _3408;
    float _3414 = _3378;
    if (_3322)
    {
        float _3416 = _3378 + (-1.0);
        _3372 = _3416;
    }
    float _3418 = _3372;
    float _3420 = _3418;
    if (_3322)
    {
        float _3422 = _3310 * _3406;
        _3334 = _3422;
    }
    float _3424 = _3334;
    float _3426 = fma(_3196, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3410);
    if (_3322)
    {
        float _3428 = _3418 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3350 = _3428;
    }
    float _3430 = _3350;
    if (!_3322)
    {
        _3420 = _3312;
    }
    float _3432 = _3420;
    float _3434 = _3432;
    if (_3322)
    {
        float _3436 = _3312 * _3406;
        _3434 = _3436;
    }
    float _3438 = _3434;
    if (_3322)
    {
        float _3440 = _3424 * _3424;
        _3412 = _3440;
    }
    float _3442 = _3412;
    if (_3322)
    {
        float _3444 = fma(_3384, _3378, _3430);
        _3402 = _3444;
    }
    float _3446 = _3402;
    if (!_3322)
    {
        _3414 = _3316;
    }
    float _3448 = _3414;
    float _3450 = _3448;
    if (_3322)
    {
        float _3452 = _3438 * _3438;
        _3450 = _3452;
    }
    float _3454 = _3450;
    float _3456 = fma(_3446, _3446, _3442);
    float _3458 = fma(_3198, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3426);
    float _3460 = _3456 + _3454;
    float _3462 = _3194 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3464 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3466 = fma(_3306, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3464);
    float _3468 = precise::clamp(_3466, 0.0, 1.0);
    float _3470 = _3194 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3472 = rsqrt(_3460);
    float _3474 = fma(_3196, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3462);
    float _3476 = -_3468;
    float _3478 = _3476 + 1.0;
    float _3480 = fma(_3196, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3470);
    float _3482 = _3458 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3484 = fma(_3198, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3474);
    float _3486 = _3194 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3488 = fma(_3198, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3480);
    float _3490 = abs(_3478);
    float _3492 = log2(_3490);
    float _3494 = _3484 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3496 = fma(_3196, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3486);
    float _3498 = _3488 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3500 = _3494 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3502 = fma(_3198, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3496);
    float _3504 = _3472 * _3424;
    float _3506 = -_3500;
    float _3508 = fma(_3506, _3368, 1.0);
    float _3510 = _3472 * _3446;
    float _3512 = _3502 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3514 = _3498 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3516 = _3504 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3518 = _3472 * _3438;
    float _3520 = log2(_3508);
    float _3522 = fma(_3512, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3514);
    float _3524 = -_3516;
    float _3526 = fma(_3510, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3524);
    float _3528 = _3492 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3530 = fma(_3494, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3522);
    float _3532 = -_3518;
    float _3534 = fma(_3532, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3526);
    float _3536 = _3498 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3538 = fma(_3482, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3530);
    float _3540 = fma(_3534, -0.5, 0.5);
    float _3542 = exp2(_3528);
    float _3544 = _3498 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3546 = fma(_3512, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3536);
    float _3548 = fma(_3534, 0.5, 0.5);
    float _3550 = _3510 + 1.0;
    float _3552 = fma(_3512, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3544);
    float _3554 = fma(_3494, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3546);
    float _3556 = fma(_3548, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3558 = 1.0 / _3538;
    float _3560 = fma(_3494, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3552);
    float _3562 = fma(_3482, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3554);
    float _3564 = fma(_3548, _3556, -0.212114393711090087890625);
    float _3566 = fma(_3482, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3560);
    float _3568 = fma(_3548, _3564, 1.570728778839111328125);
    float _3570 = sqrt(_3540);
    float _3572 = -_3510;
    float _3574 = fma(_3542, _3550, _3572);
    float _3576 = _3520 * 0.693147182464599609375;
    float _3578 = fma(_3574, 0.5, 0.5);
    float _3580 = _3576 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3582 = _3562 * _3558;
    float _3584 = _3566 * _3558;
    float _3586 = fma(_3582, 0.5, 0.5);
    float _3588 = fma(_3584, -0.5, 0.5);
    float _3590 = _3570 * 0.636619746685028076171875;
    float _3592 = -_3568;
    float _3594 = fma(_3590, _3592, 1.0);
    float3 _8966 = float3(_3586, _3588, _3580);
    float _3596 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8966, float3(0.0), isnan(_8966)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8966, float3(0.0), isnan(_8966)), level(0.0)).x;
    float3 _8977 = float3(_3586, _3588, _3580);
    float4 _3599 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8977, float3(0.0), isnan(_8977)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8977, float3(0.0), isnan(_8977)), level(0.0)).xyzw;
    float _3601 = _3599.x;
    float _3603 = _3599.y;
    float _3605 = _3599.z;
    float _3607 = _3599.w;
    float2 _8994 = float2(_3594, _3578);
    float3 _3611 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8994, float2(0.0), isnan(_8994)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8994, float2(0.0), isnan(_8994)), level(0.0)).xyz;
    float _3613 = _3611.x;
    float _3615 = _3611.y;
    float _3617 = _3611.z;
    float _3619 = _3498 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3621 = _3492 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3623 = _3284 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3625 = _3562 + _3538;
    float _3627 = fma(_3512, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3619);
    bool _3629 = _3284 > 0.0;
    bool _3631 = isnan(_3284);
    bool _3633 = _3629 || _3631;
    bool _3635 = isnan(0.0);
    bool _3637 = _3633 || _3635;
    out.m_82.x = _3196;
    out.m_82.y = _3194;
    out.m_82.z = _3198;
    float _3639 = exp2(_3621);
    float _3641 = fma(_3494, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3627);
    float _3643 = _3538 * 0.5;
    float _3645 = _3625 * 0.5;
    float _3647 = fma(_3482, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3641);
    float _3649 = _3647 + _3538;
    out.gl_Position.x = _3562;
    out.gl_Position.y = _3566;
    out.gl_Position.z = _3647;
    out.gl_Position.w = _3538;
    float _3651 = _3649 * 0.5;
    float _3653 = -_3639;
    float _3655 = _3653 + 1.0;
    float _3657 = fma(_3566, -0.5, _3643);
    float _3659 = _3623 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3661 = _3655 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_84.x = _3645;
    out.m_84.y = _3657;
    out.m_84.z = _3651;
    out.m_84.w = _3538;
    float _3663 = -_3661;
    float _3665 = _3663 + 1.0;
    out.m_47.x = _3659;
    float _3667 = _3661 * _3596;
    float _3669 = _3607 * _3665;
    float _3671 = _3607 * _3667;
    float _3673 = _3617 * _3667;
    float _3675 = fma(_3613, _3671, _3601);
    float _3677 = fma(_3615, _3671, _3603);
    float _3679 = fma(_3607, _3673, _3605);
    out.m_86.x = _3675;
    out.m_86.y = _3677;
    out.m_86.z = _3679;
    out.m_86.w = _3669;
    if (_3637)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _3681 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3681;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

