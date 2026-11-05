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
    constant _16* vp_c13 [[id(4)]];
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
    float4 m_68 [[user(locn0)]];
    float4 m_80 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_88 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_70 [[user(locn5)]];
    float4 m_74 [[user(locn6)]];
    float4 m_82 [[user(locn7)]];
    float4 m_78 [[user(locn8)]];
    float4 m_72 [[user(locn9)]];
    float4 m_86 [[user(locn10)]];
    float4 m_76 [[user(locn11)]];
    float4 m_84 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(1)]];
    float4 m_62 [[attribute(2)]];
    float4 m_64 [[attribute(3)]];
    float4 m_66 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_58 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3347 = false;
    bool _3131 = false;
    bool _465 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_44.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (!_111)
    {
        out.m_47.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3632 = as_type<float>(_123);
        out.gl_Position.z = _3632;
    }
    if (!_111)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _127 = in.m_49.w;
    float _129 = in.m_51.x;
    bool _131 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_127);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_127;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _129;
    float _145 = 0.0;
    float _147 = _143;
    if (_139)
    {
        float _149 = float(_107);
        _145 = _149;
    }
    float _151 = _145;
    bool _153 = _143 >= _151;
    bool _155 = !_139;
    bool _157 = _153 || _155;
    if (_157)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _117;
    if (_157)
    {
        out.m_47.x = 0.0;
    }
    if (_157)
    {
        float _161 = _159 * 5.0;
        _125 = as_type<int>(_161);
    }
    int _163 = _125;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3705 = as_type<float>(_163);
        out.gl_Position.z = _3705;
    }
    if (_157)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    float _167 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _169 = in.m_58.w;
    bool _171 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _173 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _175 = _171 || _173;
    bool _177 = isnan(1.0);
    bool _179 = _175 || _177;
    float _181 = in.m_49.x;
    float _183 = in.m_49.y;
    float _185 = in.m_49.z;
    float _187 = in.m_44.x;
    float _189 = in.m_44.y;
    float _191 = in.m_44.z;
    float _193 = in.m_60.x;
    float _195 = in.m_60.y;
    float _197 = in.m_60.z;
    float _199 = 0.0;
    float _201 = _167;
    if (!_179)
    {
        float _203 = _167 * _167;
        float _205 = _203 * 0.5;
        _199 = _205;
    }
    float _207 = _199;
    float _209 = in.m_62.x;
    float _211 = in.m_62.y;
    float _213 = in.m_62.z;
    float _215 = _207;
    if (!_179)
    {
        float _217 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _215 = _217;
    }
    float _219 = _215;
    float _221 = in.m_64.x;
    float _223 = in.m_64.y;
    float _225 = in.m_64.z;
    int _227 = as_type<int>(_165) & 1;
    bool _229 = _227 != 0;
    int _231 = as_type<int>(_165) & 2;
    bool _233 = _231 != 0;
    bool _235 = !_229;
    float _237 = _235 ? (-0.5) : 0.5;
    bool _239 = !_233;
    float _241 = _239 ? (-0.5) : 0.5;
    bool _243 = !_179;
    float _245 = _219;
    float _247 = _223;
    if (!_243)
    {
        float _249 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = log2(_249);
        float _253 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _255 = _253 + 1.0;
        float _257 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _259 = _167 * _251;
        float _261 = 1.0 / _255;
        float _263 = _257 * 0.693147182464599609375;
        float _265 = exp2(_259);
        float _267 = 1.0 / _263;
        float _269 = _265 + (-1.0);
        float _271 = -_269;
        float _273 = fma(_271, _267, _167);
        float _275 = _273 * _261;
        float _277 = _275 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _245 = _277;
    }
    float _279 = _245;
    bool _281 = !_179;
    float _283 = _279;
    if (!_281)
    {
        float _285 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = log2(_285);
        float _289 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _291 = _289 + 1.0;
        float _293 = 1.0 / _291;
        float _295 = _167 * _287;
        float _297 = exp2(_295);
        float _299 = -_297;
        float _301 = _299 + 1.0;
        float _303 = _301 * _293;
        _201 = _303;
    }
    float _305 = _201;
    float _307 = _279 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _309 = _279 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _311 = _279 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _313 = _305;
    if (!_179)
    {
        float _315 = _143 * _143;
        float _317 = _315 * 0.5;
        _283 = _317;
    }
    float _319 = _283;
    float _321 = fma(_305, _181, _307);
    float _323 = fma(_305, _183, _309);
    float _325 = fma(_305, _185, _311);
    if (!_179)
    {
        float _327 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _313 = _327;
    }
    float _329 = _313;
    bool _331 = !_179;
    float _333 = _329;
    if (!_331)
    {
        float _335 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _337 = log2(_335);
        float _339 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _341 = _339 + 1.0;
        float _343 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _345 = _143 * _337;
        float _347 = 1.0 / _341;
        float _349 = _343 * 0.693147182464599609375;
        float _351 = exp2(_345);
        float _353 = 1.0 / _349;
        float _355 = _351 + (-1.0);
        float _357 = -_355;
        float _359 = fma(_357, _353, _143);
        float _361 = _359 * _347;
        float _363 = _361 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _333 = _363;
    }
    float _365 = _333;
    float _367 = _365 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _369 = _365 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _371 = _365 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _373 = _365;
    if (!_179)
    {
        _373 = _143;
    }
    float _375 = _373;
    bool _377 = !_179;
    float _379 = _375;
    if (!_377)
    {
        float _381 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _383 = log2(_381);
        float _385 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _387 = _385 + 1.0;
        float _389 = 1.0 / _387;
        float _391 = _143 * _383;
        float _393 = exp2(_391);
        float _395 = -_393;
        float _397 = _395 + 1.0;
        float _399 = _397 * _389;
        _379 = _399;
    }
    float _401 = _379;
    float _403 = fma(_401, _183, _369);
    bool _405 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _407 = fma(_401, _181, _367);
    float _409 = fma(_401, _185, _371);
    float _411 = -_403;
    float _413 = _323 + _411;
    float _415 = fma(_321, _169, _187);
    float _417 = -_407;
    float _419 = _321 + _417;
    float _421 = fma(_323, _169, _189);
    float _423 = _413 * _195;
    float _425 = _413 * _211;
    float _427 = _413 * _223;
    float _429 = -_409;
    float _431 = _325 + _429;
    float _433 = fma(_419, _193, _423);
    float _435 = fma(_419, _209, _425);
    float _437 = fma(_419, _221, _427);
    float _439 = fma(_325, _169, _191);
    float _441 = fma(_431, _197, _433);
    float _443 = fma(_431, _213, _435);
    float _445 = fma(_431, _225, _437);
    bool _447 = !_405;
    float _463;
    if (!_447)
    {
        float _449 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _451 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _453 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _455 = _453 * _449;
        float _457 = floor(_455);
        float _459 = -_457;
        float _461 = _455 + _459;
        _463 = _461;
        _465 = true;
    }
    else
    {
        float _467 = float(_107);
        float _469 = 1.0 / _467;
        float _471 = _143 * _469;
        _463 = _471;
    }
    _465 = false;
    float _473 = _463;
    float _475 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _477 = int(_475);
    float _479 = _421 * _211;
    float _481 = in.m_62.w;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _485 = _483 != 0;
    float _487 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _489 = int(_487);
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _493 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _495 = int(_493);
    float _497 = float(_477);
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _501 = 0.0;
    int _503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_485)
    {
        _501 = 1.0;
    }
    float _505 = _501;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _509 = 1.0 + _507;
    float _511 = _505;
    if (!_485)
    {
        _511 = 7.345489978790283203125;
    }
    float _513 = _511;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _517 = 1.0 / _497;
    float _519 = float(_489);
    float _521 = _513 * _129;
    float _523 = float(uint(_495));
    float _525 = 1.0 / _519;
    int _527 = ~_495;
    int _529 = _527 + 1;
    bool _531 = _495 == 0;
    float _533 = _517 * _143;
    float _535 = 1.0 / _523;
    float _537 = in.m_51.y;
    float _539 = trunc(_533);
    int _541 = int(_539);
    float _543 = _525 * _143;
    float _545 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _547 = int(_545);
    int _549 = as_type<int>(_535) + (-2);
    float _551 = float(uint(_541));
    float _553 = trunc(_543);
    int _555 = int(_553);
    float _557 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[78].w, _515);
    float _559 = as_type<float>(_549) * _551;
    float _561 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _557);
    float _563 = float(uint(_547));
    float _565 = trunc(_559);
    float _567 = precise::max(_565, 0.0);
    uint _570 = uint(_567);
    int _572 = ~_547;
    int _574 = _572 + 1;
    int _576 = ~_547;
    int _578 = _576 + 1;
    int _580 = ~_547;
    int _582 = _580 + 1;
    float _584 = 1.0 / _563;
    float _586 = float(uint(_555));
    float _588 = _559;
    float _590 = as_type<float>(_529);
    if (_485)
    {
        _588 = _129;
    }
    float _592 = _588;
    float _594 = _592;
    if (!_485)
    {
        _594 = _537;
    }
    float _596 = _594;
    float _598 = 1.0 / _509;
    int _600 = as_type<int>(_584) + (-2);
    int _602 = _529 * int(_570);
    int _604 = _602 + _541;
    if (_485)
    {
        _590 = 1.0;
    }
    float _606 = _590;
    float _608 = _606;
    if (!_485)
    {
        _608 = 1.2345600128173828125;
    }
    float _610 = _608;
    float _612 = as_type<float>(_600) * _586;
    float _614 = float(uint(_604));
    float _616 = trunc(_612);
    float _618 = precise::max(_616, 0.0);
    uint _620 = uint(_618);
    float _622 = as_type<float>(_549) * _614;
    float _624 = trunc(_622);
    float _626 = precise::max(_624, 0.0);
    uint _628 = uint(_626);
    float _630 = _610 * _596;
    int _632 = ~_495;
    int _634 = _632 + 1;
    float _636 = floor(_521);
    int _638 = _574 * int(_620);
    int _640 = _638 + _555;
    float _642 = float(_107);
    float _644 = float(uint(_640));
    int _646 = int(_570) + int(_628);
    float _648 = floor(_630);
    float _650 = as_type<float>(_600) * _644;
    float _652 = float(_495);
    int _654 = _634 * _646;
    int _656 = _654 + _541;
    float _658 = -_636;
    float _660 = _521 + _658;
    float _662 = 1.0 / _642;
    bool _664 = uint(_656) >= uint(_495);
    float _666 = _660 * _652;
    float _668 = float(_541);
    bool _670 = !_664;
    int _672 = _670 ? 0 : (-1);
    float _674 = trunc(_650);
    float _676 = precise::max(_674, 0.0);
    uint _678 = uint(_676);
    int _680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _682 = _680 != 0;
    float _684 = -_648;
    float _686 = _630 + _684;
    int _688 = ~_646;
    int _690 = _688 + _672;
    int _692 = _690 + 1;
    bool _694 = !_682;
    int _696 = _694 ? 0 : 1;
    bool _698 = _668 >= _652;
    bool _700 = isnan(_668);
    bool _702 = _698 || _700;
    bool _704 = isnan(_652);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = trunc(_666);
    int _712 = int(_710);
    float _714 = _662 * _143;
    float _716 = float(_547);
    int _718 = abs(_696);
    float _720 = _652 * _714;
    float _722 = float(_555);
    float _724 = _716 * _714;
    float _726 = trunc(_708);
    int _728 = int(_726);
    float _730 = _686 * _716;
    bool _732 = _722 >= _716;
    bool _734 = isnan(_722);
    bool _736 = _732 || _734;
    bool _738 = isnan(_716);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    int _744 = int(_620) + int(_678);
    int _746 = _712 * _718;
    int _748 = _746 + _541;
    int _750 = _495 * _692;
    int _752 = _750 + _541;
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _756 = _754 != 0;
    int _758 = _578 * _744;
    int _760 = _758 + _555;
    float _762 = trunc(_730);
    int _764 = int(_762);
    bool _766 = !_531;
    int _768 = _766 ? _752 : (-1);
    int _770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _772 = _770 != 0;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _776 = _774 != 0;
    int _778 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _780 = _778 != 0;
    bool _782 = uint(_760) >= uint(_547);
    bool _784 = !_756;
    int _786 = _784 ? 0 : 1;
    float _788 = trunc(_742);
    int _790 = int(_788);
    int _792 = ~_728;
    int _794 = _792 + 1;
    int _796 = _794 + 1;
    int _798 = abs(_786);
    bool _800 = !_782;
    int _802 = _800 ? 0 : (-1);
    int _804 = _768 * _796;
    bool _806 = !_776;
    int _808 = _806 ? 0 : 1;
    float _810 = trunc(_720);
    int _812 = int(_810);
    int _814 = _495 + (-1);
    int _816 = ~_744;
    int _818 = _816 + _802;
    int _820 = _818 + 1;
    int _822 = abs(_808);
    int _824 = _728 * _814;
    int _826 = _824 + _804;
    bool _828 = !_772;
    int _830 = _828 ? 0 : 1;
    int _832 = _764 * _798;
    int _834 = _832 + _555;
    bool _836 = _547 == 0;
    int _838 = _547 * _820;
    int _840 = _838 + _555;
    bool _842 = !_780;
    int _844 = _842 ? 0 : 1;
    int _846 = _826 * _822;
    int _848 = abs(_830);
    float _850 = trunc(_724);
    int _852 = int(_850);
    int _854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _856 = _854 != 0;
    float _858 = in.m_51.w;
    int _860 = abs(_844);
    int _862 = _812 * _848;
    int _864 = _862 + _846;
    int _866 = ~_790;
    int _868 = _866 + 1;
    int _870 = _868 + 1;
    bool _872 = !_836;
    int _874 = _872 ? _840 : (-1);
    bool _876 = !_856;
    int _878 = _876 ? 0 : 1;
    int _880 = _874 * _870;
    int _882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _884 = _882 != 0;
    int _886 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _888 = _886 != 0;
    int _890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _892 = _890 != 0;
    int _894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _896 = _894 != 0;
    int _898 = abs(_878);
    int _900 = _748 * _860;
    int _902 = _900 + _864;
    int _904 = _547 + (-1);
    bool _906 = !_888;
    int _908 = _906 ? 0 : 1;
    int _910 = _790 * _904;
    int _912 = _910 + _880;
    bool _914 = !_884;
    int _916 = _914 ? 0 : 1;
    int _918 = abs(_908);
    int _920 = _712 * _898;
    int _922 = _920 + _902;
    bool _924 = !_892;
    int _926 = _924 ? 0 : 1;
    int _928 = abs(_916);
    bool _930 = !_896;
    int _932 = _930 ? 0 : 1;
    int _934 = abs(_926);
    int _936 = _912 * _918;
    float _938 = float(uint(_922));
    int _940 = abs(_932);
    int _942 = _852 * _928;
    int _944 = _942 + _936;
    float _946 = as_type<float>(_549) * _938;
    int _948 = ~_495;
    int _950 = _948 + 1;
    int _952 = _834 * _934;
    int _954 = _952 + _944;
    int _956 = ~_547;
    int _958 = _956 + 1;
    float _960 = trunc(_946);
    float _962 = precise::max(_960, 0.0);
    uint _964 = uint(_962);
    bool _966 = _495 == 0;
    int _968 = _764 * _940;
    int _970 = _968 + _954;
    int _972 = ~_495;
    int _974 = _972 + 1;
    float _976 = float(uint(_834));
    float _978 = float(uint(_970));
    float _980 = as_type<float>(_600) * _978;
    float _982 = trunc(_980);
    float _984 = precise::max(_982, 0.0);
    uint _986 = uint(_984);
    int _988 = _974 * int(_964);
    int _990 = _988 + _922;
    float _992 = float(uint(_990));
    float _994 = as_type<float>(_549) * _992;
    float _996 = trunc(_994);
    float _998 = precise::max(_996, 0.0);
    uint _1000 = uint(_998);
    int _1002 = _958 * int(_986);
    int _1004 = _1002 + _970;
    float _1006 = float(uint(_1004));
    int _1008 = ~_547;
    int _1010 = _1008 + 1;
    float _1012 = as_type<float>(_600) * _1006;
    int _1014 = int(_964) + int(_1000);
    float _1016 = trunc(_1012);
    float _1018 = precise::max(_1016, 0.0);
    uint _1020 = uint(_1018);
    int _1022 = _950 * _1014;
    int _1024 = _1022 + _922;
    bool _1026 = uint(_1024) >= uint(_495);
    bool _1028 = !_1026;
    int _1030 = _1028 ? 0 : (-1);
    int _1032 = int(_986) + int(_1020);
    int _1034 = ~_1014;
    int _1036 = _1034 + _1030;
    int _1038 = _1036 + 1;
    int _1040 = _1010 * _1032;
    int _1042 = _1040 + _970;
    int _1044 = _495 * _1038;
    int _1046 = _1044 + _922;
    int _1048 = ~_495;
    int _1050 = _1048 + 1;
    bool _1052 = uint(_1042) >= uint(_547);
    bool _1054 = !_966;
    int _1056 = _1054 ? _1046 : (-1);
    bool _1058 = !_1052;
    int _1060 = _1058 ? 0 : (-1);
    int _1062 = _1056 & 3;
    bool _1064 = _1062 != 0;
    int _1066 = ~_1032;
    int _1068 = _1066 + _1060;
    int _1070 = _1068 + 1;
    bool _1072 = uint(_1062) > 1u;
    int _1074 = _1056 & 3;
    bool _1076 = _1074 != 0;
    int _1078 = _547 * _1070;
    int _1080 = _1078 + _970;
    float _1082 = float(uint(_748));
    int _1084 = _1076 ? 0 : 1;
    bool _1086 = !_836;
    int _1088 = _1086 ? _1080 : (-1);
    float _1090 = as_type<float>(_549) * _1082;
    int _1092 = ~_1084;
    int _1094 = _1092 + 1;
    int _1096 = _1094 + 1;
    bool _1098 = uint(_1062) >= 2u;
    float _1100 = trunc(_1090);
    float _1102 = precise::max(_1100, 0.0);
    uint _1104 = uint(_1102);
    int _1106 = _1096;
    if (!_1072)
    {
        int _1108 = ~_1084;
        int _1110 = _1108 + 1;
        _1106 = _1110;
    }
    int _1112 = _1106;
    int _1114 = _1088 & 3;
    bool _1116 = _1114 != 0;
    int _1118 = _1088 & 3;
    bool _1120 = _1118 != 0;
    int _1122 = _1098 ? 0 : 1;
    bool _1124 = _1062 != 3;
    int _1126 = _1116 ? 0 : 1;
    bool _1128 = uint(_1118) > 1u;
    int _1130 = ~_1122;
    int _1132 = _1130 + 1;
    int _1134 = _1132 + 1;
    int _1136 = _1050 * int(_1104);
    int _1138 = _1136 + _748;
    float _1140 = as_type<float>(_600) * _976;
    int _1142 = ~_1126;
    int _1144 = _1142 + 1;
    int _1146 = _1144 + 1;
    int _1148 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1150 = _1148 != 0;
    float _1152 = trunc(_1140);
    float _1154 = precise::max(_1152, 0.0);
    uint _1156 = uint(_1154);
    int _1158 = _1134;
    int _1160 = _1146;
    if (_1124)
    {
        int _1162 = ~_1122;
        int _1164 = _1162 + 1;
        _1158 = _1164;
    }
    int _1166 = _1158;
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1170 = _1168 != 0;
    float _1172 = in.m_51.z;
    if (!_1128)
    {
        int _1174 = ~_1126;
        int _1176 = _1174 + 1;
        _1160 = _1176;
    }
    int _1178 = _1160;
    bool _1180 = _1118 != 3;
    float _1182 = float(uint(_1138));
    bool _1184 = !_1170;
    int _1186 = _1184 ? 0 : 1;
    bool _1188 = uint(_1118) >= 2u;
    float _1190 = as_type<float>(_549) * _1182;
    float _1192 = _129 * 2.0;
    int _1194 = _582 * int(_1156);
    int _1196 = _1194 + _834;
    int _1198 = _1188 ? 0 : 1;
    float _1200 = floor(_1192);
    int _1202 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1204 = _1202 != 0;
    float _1206 = _537 * 2.0;
    int _1208 = ~_1198;
    int _1210 = _1208 + 1;
    int _1212 = _1210 + 1;
    int _1214 = _1212;
    float _1216 = as_type<float>(_1156);
    if (_1180)
    {
        int _1218 = ~_1198;
        int _1220 = _1218 + 1;
        _1214 = _1220;
    }
    int _1222 = _1214;
    bool _1224 = _129 > 0.5;
    float _1226 = floor(_1206);
    float _1228 = float(uint(_1196));
    float _1230 = -_237;
    int _1232 = _1224 ? as_type<int>(_1230) : as_type<int>(_237);
    bool _1234 = _537 > 0.5;
    float _1236 = as_type<float>(_600) * _1228;
    bool _1238 = !_1204;
    float _1240 = _1238 ? _237 : as_type<float>(_1232);
    float _1242 = trunc(_1190);
    float _1244 = precise::max(_1242, 0.0);
    uint _1246 = uint(_1244);
    bool _1248 = _1172 > 0.5;
    float _1250 = _421 * _195;
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1254 = _1252 != 0;
    float _1256 = -_241;
    int _1258 = _1234 ? as_type<int>(_1256) : as_type<int>(_241);
    float _1260 = fma(_415, _193, _1250);
    int _1262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1264 = _1262 != 0;
    float _1266 = trunc(_1236);
    float _1268 = precise::max(_1266, 0.0);
    uint _1270 = uint(_1268);
    float _1272 = -_237;
    int _1274 = _1248 ? as_type<int>(_1272) : as_type<int>(_237);
    float _1276 = fma(_439, _197, _1260);
    bool _1278 = !_1254;
    float _1280 = _1278 ? _241 : as_type<float>(_1258);
    float _1282 = _129 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1284 = _1200 > 0.0;
    bool _1286 = !_1264;
    float _1288 = _1286 ? _237 : as_type<float>(_1274);
    if (_1150)
    {
        _503 = 0;
    }
    int _1290 = _503;
    bool _1292 = _1200 >= 0.0;
    bool _1294 = isnan(_1200);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan(0.0);
    bool _1300 = _1296 || _1298;
    float _1302 = _1288 + 0.5;
    bool _1304 = _858 > 0.5;
    float _1306 = _421 * _223;
    int _1308 = _1290;
    if (!_1150)
    {
        _1308 = 1;
    }
    int _1310 = _1308;
    float _1312 = _1300 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1314 = fma(_415, _221, _1306);
    float _1316 = -_241;
    int _1318 = _1304 ? as_type<int>(_1316) : as_type<int>(_241);
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1322 = _1320 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _1324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1326 = _1324 != 0;
    bool _1328 = _1310 != 1;
    int _1330 = ~as_type<int>(_1312);
    int _1332 = _1330 + 1;
    int _1334 = _1332 + 1;
    int _1336 = _1334;
    float _1338 = _1312;
    if (!_1284)
    {
        int _1340 = ~as_type<int>(_1312);
        int _1342 = _1340 + 1;
        _1336 = _1342;
    }
    int _1344 = _1336;
    bool _1346 = !_1326;
    float _1348 = _1346 ? _241 : as_type<float>(_1318);
    bool _1350 = _1226 > 0.0;
    int _1352 = int(_1104) + int(_1246);
    float _1354 = _1348 + (-0.5);
    int _1356 = ~_495;
    int _1358 = _1356 + 1;
    int _1360 = ~_547;
    int _1362 = _1360 + 1;
    int _1364 = int(_1156) + int(_1270);
    int _1366 = _1358 * _1352;
    int _1368 = _1366 + _748;
    bool _1370 = _1226 >= 0.0;
    bool _1372 = isnan(_1226);
    bool _1374 = _1370 || _1372;
    bool _1376 = isnan(0.0);
    bool _1378 = _1374 || _1376;
    float _1380 = as_type<float>(_1270);
    if (!_1328)
    {
        _1216 = _537;
    }
    float _1382 = _1216;
    int _1384 = _1362 * _1364;
    int _1386 = _1384 + _834;
    int _1388 = _1378 ? 0 : 1;
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1390;
    float _1394 = _1382;
    if (!_1328)
    {
        _1380 = _537;
    }
    float _1396 = _1380;
    float _1398 = in.m_60.w;
    float _1400 = _1396;
    if (!_1328)
    {
        _1338 = _1172;
    }
    float _1402 = _1338;
    float _1404 = _1402;
    if (!_1328)
    {
        _247 = _1172;
    }
    float _1406 = _247;
    float _1408 = _1406;
    if (_1328)
    {
        _1394 = _129;
    }
    float _1410 = _1394;
    if (_1328)
    {
        _1400 = _129;
    }
    float _1412 = _1400;
    if (_1328)
    {
        _1404 = _537;
    }
    float _1414 = _1404;
    if (_1328)
    {
        _1408 = _537;
    }
    float _1416 = _1408;
    bool _1418 = uint(_1368) >= uint(_495);
    float _1420 = fma(_415, _209, _479);
    bool _1422 = uint(_1386) >= uint(_547);
    int _1424 = ~_1388;
    int _1426 = _1424 + 1;
    int _1428 = _1426 + 1;
    float _1430 = fma(_439, _213, _1420);
    float _1432 = 1.0 / _1392;
    int _1434 = _1428;
    if (!_1350)
    {
        int _1436 = ~_1388;
        int _1438 = _1436 + 1;
        _1434 = _1438;
    }
    int _1440 = _1434;
    float _1442 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1444 = _473 + _1442;
    bool _1446 = !_1422;
    int _1448 = _1446 ? 0 : (-1);
    float _1450 = _1430 + _481;
    int _1452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1454 = _1452 != 0;
    int _1456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1458 = _1456 != 0;
    int _1460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1462 = _1460 != 0;
    int _1464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1466 = _1464 != 0;
    float _1468 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1470 = fma(_439, _225, _1314);
    float _1472 = 1.0 / _1322;
    float _1474 = _1172 * 2.0;
    float _1476 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1478 = _473 + _1476;
    bool _1480 = !_1418;
    int _1482 = _1480 ? 0 : (-1);
    float _1484 = -_1468;
    float _1486 = fma(_1282, 2.0, _1484);
    float _1488 = in.m_64.w;
    float _1490 = _537 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1492 = floor(_1474);
    float _1494 = _1444 * _1432;
    float _1496 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1498 = _129 + _537;
    bool _1500 = !_1458;
    int _1502 = _1500 ? 0 : 1;
    float _1504 = _1172 + _537;
    float _1506 = fma(_1490, -2.0, _1496);
    float _1508 = _1498 + (-1.0);
    float _1510 = _1478 * _1472;
    float _1512 = _129 + _1172;
    bool _1514 = !_1462;
    int _1516 = _1514 ? 0 : 1;
    float _1518 = _1504 + (-1.0);
    float _1520 = _1512 + (-1.0);
    int _1522 = abs(_1516);
    float _1524 = -_143;
    float _1526 = fma(_1524, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1486);
    bool _1528 = _1492 >= 0.0;
    bool _1530 = isnan(_1492);
    bool _1532 = _1528 || _1530;
    bool _1534 = isnan(0.0);
    bool _1536 = _1532 || _1534;
    float _1538 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1540 = fma(_1508, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1542 = _1536 ? 0 : 1;
    float _1544 = _537 + (-0.5);
    bool _1546 = _1492 > 0.0;
    float _1548 = _1276 + _1398;
    float _1550 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1552 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1506);
    int _1554 = ~_1542;
    int _1556 = _1554 + 1;
    int _1558 = _1556 + 1;
    float _1560 = _1470 + _1488;
    int _1562 = abs(_1502);
    float _1564 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1566 = _1056 >> 31;
    float _1568 = fma(_1564, -2.0, _499);
    int _1570 = _1558;
    if (!_1546)
    {
        int _1572 = ~_1542;
        int _1574 = _1572 + 1;
        _1570 = _1574;
    }
    int _1576 = _1570;
    float _1578 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1550);
    float _1580 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1582 = log2(_1580);
    float _1584 = float(_1440);
    float _1586 = fma(_1518, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1588 = _1088 >> 31;
    float _1590 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1592 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1590;
    int _1594 = _1566 & 3;
    float _1596 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1598 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1596;
    float _1600 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1602 = _1600 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _1604 = _1588 & 3;
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1608 = _1606 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1610 = _1240 + 0.5;
    int _1612 = _1056 + _1594;
    float _1614 = fma(_1602, _1510, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _1616 = _1088 + _1604;
    float _1618 = fma(_1608, _1510, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1620 = fma(_1610, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1526);
    float _1622 = _1280 + (-0.5);
    int _1624 = _1612 >> 2;
    float _1626 = _1582 * _143;
    float _1628 = -_1622;
    float _1630 = -_1552;
    float _1632 = fma(_1628, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1630);
    float _1634 = _1410 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1636 = float(_1522);
    float _1638 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1640 = _1616 >> 2;
    float _1642 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1644 = _1624 << 4;
    int _1646 = _1644 + 368;
    float _1648 = _1636 * _1584;
    int _1650 = _1640 << 4;
    int _1652 = _1650 + 512;
    float _1654 = exp2(_1626);
    uint _1656 = uint(int(uint(_1646) >> uint(2)));
    uint _1658 = uint(int(uint(int(_1656)) >> uint(2)));
    int _1660 = int(_1656) & 3;
    float _1662 = (*spvDescriptorSet0.vp_c9)._m0[int(_1658)][_1660];
    int _1664 = int(_1656) + 1;
    uint _1666 = uint(int(uint(_1664) >> uint(2)));
    int _1668 = _1664 & 3;
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[int(_1666)][_1668];
    float _1672 = fma(_1412, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1638);
    float _1674 = -_1642;
    float _1676 = fma(_1634, 2.0, _1674);
    float _1678 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1680 = _1450 + _1678;
    float _1682 = fma(_1598, _1494, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1684 = fma(_1592, _1494, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1686 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1688 = _1548 + _1686;
    float _1690 = float(_1344);
    uint _1692 = uint(int(uint(_1652) >> uint(2)));
    uint _1694 = uint(int(uint(int(_1692)) >> uint(2)));
    int _1696 = int(_1692) & 3;
    float _1698 = (*spvDescriptorSet0.vp_c9)._m0[int(_1694)][_1696];
    int _1700 = int(_1692) + 1;
    uint _1702 = uint(int(uint(_1700) >> uint(2)));
    int _1704 = _1700 & 3;
    float _1706 = (*spvDescriptorSet0.vp_c9)._m0[int(_1702)][_1704];
    float _1708 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1710 = float(_1562);
    float _1712 = -_143;
    float _1714 = fma(_1712, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1676);
    int _1716 = ~_1352;
    int _1718 = _1716 + _1482;
    int _1720 = _1718 + 1;
    float _1722 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1708);
    float _1724 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1672);
    float _1726 = -_1654;
    float _1728 = _1726 + 1.0;
    int _1730 = _1646 + 8;
    uint _1732 = uint(int(uint(_1730) >> uint(2)));
    uint _1734 = uint(int(uint(int(_1732)) >> uint(2)));
    int _1736 = int(_1732) & 3;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[int(_1734)][_1736];
    int _1740 = int(_1732) + 1;
    uint _1742 = uint(int(uint(_1740) >> uint(2)));
    int _1744 = _1740 & 3;
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[int(_1742)][_1744];
    float _1748 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[78].z, _491);
    float _1750 = _1710 * _1690;
    int _1752 = abs(_1112);
    float _1754 = fma(_1302, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1714);
    float _1756 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1748);
    float _1758 = _1750 * (-2.0);
    bool _1760 = !_1064;
    int _1762 = _1760 ? 0 : 1;
    int _1764 = _1652 + 8;
    uint _1766 = uint(int(uint(_1764) >> uint(2)));
    uint _1768 = uint(int(uint(int(_1766)) >> uint(2)));
    int _1770 = int(_1766) & 3;
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[int(_1768)][_1770];
    int _1774 = int(_1766) + 1;
    uint _1776 = uint(int(uint(_1774) >> uint(2)));
    int _1778 = _1774 & 3;
    float _1780 = (*spvDescriptorSet0.vp_c9)._m0[int(_1776)][_1778];
    int _1782 = ~_1364;
    int _1784 = _1782 + _1448;
    int _1786 = _1784 + 1;
    float _1788 = fma(_1586, _1758, _1586);
    int _1790 = abs(_1178);
    float _1792 = in.m_66.x;
    float _1794 = in.m_66.y;
    float _1796 = in.m_66.z;
    float _1798 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1800 = _1560 + _1798;
    int _1802 = abs(_1166);
    int _1804 = _495 * _1720;
    int _1806 = _1804 + _748;
    int _1808 = abs(_1762);
    float _1810 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1722);
    int _1812 = ~_1752;
    int _1814 = _1812 + 1;
    int _1816 = _1814 + 1;
    int _1818 = _547 * _1786;
    int _1820 = _1818 + _834;
    bool _1822 = !_1120;
    int _1824 = _1822 ? 0 : 1;
    float _1826 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1578);
    int _1828 = ~_1790;
    int _1830 = _1828 + 1;
    int _1832 = _1830 + 1;
    float _1834 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1568);
    int _1836 = ~_1808;
    int _1838 = _1836 + 1;
    int _1840 = _1838 + 1;
    int _1842 = abs(_1824);
    float _1844 = -_1354;
    float _1846 = -_1834;
    float _1848 = fma(_1844, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1846);
    bool _1850 = _1062 != 3;
    int _1852 = _1816 * as_type<int>(_1670);
    int _1854 = abs(_1222);
    int _1856 = ~_1802;
    int _1858 = _1856 + 1;
    int _1860 = _1858 + 1;
    int _1862 = _1840 * as_type<int>(_1662);
    int _1864 = _1862 + _1852;
    bool _1866 = !_1850;
    int _1868 = _1866 ? 0 : (-1);
    float _1870 = fma(_1758, _1794, _1794);
    bool _1872 = _1118 != 3;
    int _1874 = _1832 * as_type<int>(_1706);
    int _1876 = ~_1842;
    int _1878 = _1876 + 1;
    int _1880 = _1878 + 1;
    int _1882 = abs(_1868);
    bool _1884 = _495 == 0;
    int _1886 = _1880 * as_type<int>(_1698);
    int _1888 = _1886 + _1874;
    bool _1890 = !_1872;
    int _1892 = _1890 ? 0 : (-1);
    int _1894 = _1860 * as_type<int>(_1738);
    int _1896 = _1894 + _1864;
    bool _1898 = !_1466;
    int _1900 = _1898 ? 0 : 1;
    int _1902 = abs(_1892);
    int _1904 = abs(_1900);
    int _1906 = ~_1854;
    int _1908 = _1906 + 1;
    int _1910 = _1908 + 1;
    int _1912 = ~_1902;
    int _1914 = _1912 + 1;
    int _1916 = _1914 + 1;
    bool _1918 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1920 = isnan(0.0);
    bool _1922 = _1918 || _1920;
    bool _1924 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1926 = _1922 || _1924;
    int _1928 = _1910 * as_type<int>(_1772);
    int _1930 = _1928 + _1888;
    int _1932 = ~_1882;
    int _1934 = _1932 + 1;
    int _1936 = _1934 + 1;
    float _1938 = -_1724;
    float _1940 = _1938 + 1.0;
    int _1942 = _1916 * as_type<int>(_1780);
    int _1944 = _1942 + _1930;
    float _1946 = _1680 * _1680;
    float _1948 = _1648 * (-2.0);
    int _1950 = abs(_1186);
    int _1952 = _1936 * as_type<int>(_1746);
    int _1954 = _1952 + _1896;
    float _1956 = fma(_1688, _1688, _1946);
    float _1958 = fma(_1538, _1948, _1538);
    float _1960 = fma(_1948, _1796, _1796);
    float _1962 = _1926 ? _1728 : 0.0;
    float _1964 = fma(_1800, _1800, _1956);
    bool _1966 = _1810 >= 0.0;
    float _1968 = -_1826;
    float _1970 = _1968 + 1.0;
    int _1972 = ~_1904;
    int _1974 = _1972 + 1;
    int _1976 = _1974 + 1;
    float _1978 = -_1940;
    float _1980 = fma(_1288, _1978, _1754);
    int _1982 = ~_1950;
    int _1984 = _1982 + 1;
    int _1986 = _1984 + 1;
    float _1988 = rsqrt(_1964);
    bool _1990 = _547 == 0;
    int _1992 = _1944 * _1976;
    bool _1994 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1996 = isnan(1.0);
    bool _1998 = _1994 || _1996;
    bool _2000 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2002 = _1998 || _2000;
    int _2004 = _1954 * _1986;
    bool _2006 = !_1990;
    float _2008 = _2006 ? as_type<float>(_1820) : as_type<float>(0xffffffffu /* nan */);
    float _2010 = fma(_1544, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1870);
    bool _2012 = !_1884;
    int _2014 = _2012 ? _1806 : (-1);
    float _2016 = fma(_1348, _1970, _1848);
    float _2018 = _2008;
    if (_1966)
    {
        out.m_47.x = 0.0;
    }
    int _2020 = as_type<int>(_2008) * _1904;
    int _2022 = _2020 + _1992;
    float _2024 = -_561;
    float _2026 = _2024 + 1.0;
    int _2028 = _2014 * _1950;
    int _2030 = _2028 + _2004;
    if (_1966)
    {
        _2018 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2032 = _2018;
    float _2034 = -_1756;
    float _2036 = _2034 + 1.0;
    float _2038 = fma(_1280, _2026, _1632);
    int _2040 = as_type<int>(_2032);
    if (_2002)
    {
        float _2042 = _1962 * _598;
        _147 = _2042;
    }
    float _2044 = _147;
    float _2046 = -_2036;
    float _2048 = fma(_1240, _2046, _1620);
    if (_1966)
    {
        float _2050 = _2032 * 5.0;
        _2040 = as_type<int>(_2050);
    }
    int _2052 = _2040;
    float _2054 = float(_2030);
    float _2056 = _1680 * _1988;
    float _2058 = float(_2022);
    float _2060 = fma(_1788, _2044, _2010);
    float _2062 = _1688 * _1988;
    float _2064 = -_2056;
    float _2066 = fma(_2064, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1680);
    float _2068 = _2056;
    if (_1966)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6416 = as_type<float>(_2052);
        out.gl_Position.z = _6416;
    }
    bool _2070 = !_1454;
    int _2072 = _2070 ? 0 : 1;
    float _2074 = -_2062;
    float _2076 = fma(_2074, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1688);
    float _2078 = _2066 * _2066;
    out.m_68.x = _2048;
    out.m_68.y = _2038;
    out.m_68.z = _1980;
    out.m_68.w = _2016;
    out.m_70.x = _2054;
    out.m_70.y = _2058;
    if (_1966)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2080 = -_2056;
    float _2082 = fma(_2080, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1450);
    float _2084 = -_2062;
    float _2086 = fma(_2084, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1548);
    bool _2088 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _2090 = isnan(_473);
    bool _2092 = _2088 || _2090;
    bool _2094 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _2096 = _2092 || _2094;
    float _2098 = float(_2096);
    float _2100 = _1800 * _1988;
    float _2102 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2104 = _2082 + _2102;
    float _2106 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2108 = _2086 + _2106;
    float _2110 = float(_1576);
    float _2112 = -_2098;
    float _2114 = _2112 + 1.0;
    float _2116 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _2118 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _2120 = isnan(_473);
    bool _2122 = _2118 || _2120;
    bool _2124 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _2126 = _2122 || _2124;
    float _2128 = float(_2126);
    float _2130 = _129 + (-0.5);
    bool _2132 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _2134 = isnan(_473);
    bool _2136 = _2132 || _2134;
    bool _2138 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _2140 = _2136 || _2138;
    float _2142 = float(_2140);
    float _2144 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2116);
    int _2146 = abs(_2072);
    float _2148 = _2128 * _2114;
    float _2150 = -_2100;
    float _2152 = fma(_2150, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1560);
    float _2154 = -_2128;
    float _2156 = _2154 + 1.0;
    float _2158 = _1172 + (-0.5);
    float _2160 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2162 = _2152 + _2160;
    float _2164 = _2142 * _2156;
    float _2166 = float(_2146);
    float _2168 = fma(_2158, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1960);
    float _2170 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2144);
    float _2172 = _1682 * _2164;
    float _2174 = -_2142;
    float _2176 = _2174 + 1.0;
    float _2178 = _2166 * _2110;
    float _2180 = fma(_1958, _2044, _2168);
    bool _2182 = _2170 >= 0.0;
    float _2184 = fma(_2076, _2076, _2078);
    float _2186 = _2178 * (-2.0);
    float _2188 = -_2100;
    float _2190 = fma(_2188, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1800);
    float _2192 = in.m_58.x;
    float _2194 = in.m_58.y;
    float _2196 = fma(_2176, (*spvDescriptorSet0.vp_c9)._m0[143].x, _2172);
    float _2198 = fma(_2186, _1792, _1792);
    float _2200 = fma(_1540, _2186, _1540);
    float _2202 = fma(_2190, _2190, _2184);
    float _2204 = _2060 * 0.15915493667125701904296875;
    float _2206 = fma(_2130, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2198);
    float _2208 = _1684 * _2164;
    float _2210 = _2180 * 0.15915493667125701904296875;
    float _2212 = fma(_1618, _2148, _2196);
    float _2214 = fma(_2200, _2044, _2206);
    float _2216 = _2180;
    if (_2182)
    {
        _2216 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2218 = _2216;
    float _2220 = sqrt(_2202);
    float _2222 = fma(_2176, (*spvDescriptorSet0.vp_c9)._m0[143].y, _2208);
    float _2224 = _2214 * 0.15915493667125701904296875;
    int _2226 = as_type<int>(_2218);
    if (_2182)
    {
        float _2228 = _2218 * 5.0;
        _2226 = as_type<int>(_2228);
    }
    int _2230 = _2226;
    float _2232 = fma(_1614, _2148, _2222);
    if (_2182)
    {
        out.m_47.x = 0.0;
    }
    float _2234 = _2204 * 6.283185482025146484375;
    float _2236 = sin(_2234);
    float _2238 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[145].y, _2232);
    if (_2182)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6704 = as_type<float>(_2230);
        out.gl_Position.z = _6704;
    }
    float _2240 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[145].x, _2212);
    float _2242 = _2238 * _2194;
    float _2244 = _2204 * 6.283185482025146484375;
    float _2246 = cos(_2244);
    float _2248 = _2210 * 6.283185482025146484375;
    float _2250 = sin(_2248);
    float _2252 = _2210 * 6.283185482025146484375;
    float _2254 = cos(_2252);
    float _2256 = _2224 * 6.283185482025146484375;
    float _2258 = sin(_2256);
    if (_2182)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2260 = _2224 * 6.283185482025146484375;
    float _2262 = cos(_2260);
    float _2264 = _1988 * _2220;
    float _2266 = _2242 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2268 = _2240 * _2192;
    float _2270 = _2246 * _2254;
    float _2272 = _2236 * _2250;
    float _2274 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _241);
    float _2276 = _2264 * _2266;
    float _2278 = _2268 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2280 = fma(_2258, _2272, _2270);
    float _2282 = fma(_2258, _2270, _2272);
    float _2284 = _2274 * _2276;
    float _2286 = _2236 * _2254;
    float _2288 = _2246 * _2250;
    float _2290 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _237);
    float _2292 = _2278 * _2264;
    float _2294 = _2254 * _2262;
    float _2296 = _2250 * _2262;
    float _2298 = -_2288;
    float _2300 = fma(_2258, _2286, _2298);
    float _2302 = _2292 * _2290;
    float _2304 = _2294 * _2284;
    float _2306 = -_2286;
    float _2308 = fma(_2258, _2288, _2306);
    float _2310 = _2264 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2312 = _2310 * 0.5;
    float _2314 = _2300 * _2284;
    float _2316 = fma(_2296, _2302, _2304);
    float _2318 = _2282 * _2284;
    float _2320 = _2236 * _2262;
    float _2322 = fma(_2280, _2302, _2314);
    float _2324 = -_2258;
    float _2326 = fma(_2324, _2312, _2316);
    float _2328 = _2246 * _2262;
    float _2330 = fma(_2308, _2302, _2318);
    float _2332 = fma(_2320, _2312, _2322);
    float _2334 = _2326 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2336 = _2326 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2338 = fma(_2328, _2312, _2330);
    float _2340 = fma(_2332, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2334);
    float _2342 = fma(_2332, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2336);
    float _2344 = fma(_2338, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2340);
    float _2346 = fma(_2338, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2342);
    float _2348 = _2344 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2350 = _2346 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2352 = _1560 + _2348;
    float _2354 = _1548 + _2350;
    float _2356 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2358 = _2352 + _2356;
    float _2360 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2362 = _2354 + _2360;
    float _2364 = _2358 * _2358;
    float _2366 = fma(_2362, _2362, _2364);
    float _2368 = _2326 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2370 = sqrt(_2366);
    float _2372 = fma(_2332, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2368);
    float _2374 = fma(_2338, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2372);
    float _2376 = _2374 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2378 = _1450 + _2376;
    bool _2380 = _2370 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2382 = _2376;
    float _2384 = _2354;
    float _2386 = _2352;
    float _2388 = _2326;
    if (!_2380)
    {
        _2382 = _2378;
    }
    float _2390 = _2382;
    bool _2392 = !_2380;
    float _2394 = _2390;
    if (!_2392)
    {
        float _2396 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2398 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2400 = _2370 + _2398;
        float _2402 = _2378 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2404 = rsqrt(_2366);
        float _2406 = _2400 * _2396;
        float _2408 = _2406 * 0.15915493667125701904296875;
        float _2410 = _2408 * 6.283185482025146484375;
        float _2412 = sin(_2410);
        float _2414 = _2408 * 6.283185482025146484375;
        float _2416 = cos(_2414);
        float _2418 = fma(_2412, _2402, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2420 = _2404 * _2418;
        float _2422 = _2416 + (-1.0);
        float _2424 = fma(_2362, _2420, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2426 = fma(_2358, _2420, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2428 = _2422 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2430 = fma(_2378, _2416, _2428);
        _2394 = _2430;
        _2384 = _2424;
        _2386 = _2426;
    }
    float _2432 = _2394;
    float _2434 = _2384;
    float _2436 = _2386;
    float _2438 = -_2056;
    float _2440 = fma(_2438, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2432);
    float _2442 = -_2062;
    float _2444 = fma(_2442, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2434);
    float _2446 = -_2100;
    float _2448 = fma(_2446, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2436);
    float _2450 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2452 = _2440 + _2450;
    float _2454 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2456 = _2444 + _2454;
    float _2458 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2460 = _2448 + _2458;
    float _2462 = _2452 * _2452;
    float _2464 = fma(_2456, _2456, _2462);
    float _2466 = fma(_2460, _2460, _2464);
    float _2468 = rsqrt(_2466);
    float _2470 = sqrt(_2466);
    float _2472 = _2468 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2474 = _2456 * _2472;
    float _2476 = _2460 * _2472;
    float _2478 = _2474 * _2474;
    float _2480 = _2476 * _2476;
    float _2482 = _2478 + _2480;
    float _2484 = sqrt(_2482);
    bool _2486 = _2484 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2488 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2490 = _2484 + _2488;
    float _2492 = _2460;
    float _2494 = _2482;
    float _2496 = _2490;
    float _2498 = _2452;
    if (_2486)
    {
        float _2500 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2492 = _2500;
    }
    float _2502 = _2492;
    if (_2486)
    {
        float _2504 = rsqrt(_2482);
        _2494 = _2504;
    }
    float _2506 = _2494;
    float _2508 = _2506;
    if (_2486)
    {
        float _2510 = _2490 * _2502;
        _2496 = _2510;
    }
    float _2512 = _2496;
    if (_2486)
    {
        float _2514 = _2512 * 0.15915493667125701904296875;
        _2388 = _2514;
    }
    float _2516 = _2388;
    float _2518 = _2502;
    float _2520 = _2516;
    if (_2486)
    {
        float _2522 = _2516 * 6.283185482025146484375;
        float _2524 = sin(_2522);
        _2518 = _2524;
    }
    float _2526 = _2518;
    float _2528 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2530 = precise::max(0.0, _2528);
    float _2532 = _2462;
    float _2534 = _2530;
    if (_2486)
    {
        float _2536 = _2516 * 6.283185482025146484375;
        float _2538 = cos(_2536);
        _2532 = _2538;
    }
    float _2540 = _2532;
    float _2542 = -_2472;
    float _2544 = -_2530;
    float _2546 = fma(_2452, _2542, _2544);
    if (!_2486)
    {
        _2498 = _2474;
    }
    float _2548 = _2498;
    float _2550 = _2548;
    if (_2486)
    {
        float _2552 = _2546 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2534 = _2552;
    }
    float _2554 = _2534;
    float _2556 = _2526;
    float _2558 = _2554;
    if (_2486)
    {
        float _2560 = fma(_2526, _2554, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2556 = _2560;
    }
    float _2562 = _2556;
    float _2564 = _2562;
    float _2566 = _2540;
    if (_2486)
    {
        float _2568 = _2540 + (-1.0);
        _2558 = _2568;
    }
    float _2570 = _2558;
    float _2572 = _2570;
    if (_2486)
    {
        float _2574 = _2506 * _2562;
        _2068 = _2574;
    }
    float _2576 = _2068;
    if (!_2486)
    {
        _2564 = _2546;
    }
    float _2578 = _2564;
    float _2580 = _2578;
    if (_2486)
    {
        float _2582 = _2570 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2520 = _2582;
    }
    float _2584 = _2520;
    if (_2486)
    {
        float _2586 = _2474 * _2576;
        _2550 = _2586;
    }
    float _2588 = _2550;
    if (!_2486)
    {
        _2572 = _2476;
    }
    float _2590 = _2572;
    float _2592 = _2590;
    if (_2486)
    {
        float _2594 = _2476 * _2576;
        _2592 = _2594;
    }
    float _2596 = _2592;
    if (!_2486)
    {
        _2508 = _2478;
    }
    float _2598 = _2508;
    float _2600 = _2598;
    if (_2486)
    {
        float _2602 = fma(_2546, _2540, _2584);
        _2580 = _2602;
    }
    float _2604 = _2580;
    if (_2486)
    {
        float _2606 = _2588 * _2588;
        _2600 = _2606;
    }
    float _2608 = _2600;
    if (!_2486)
    {
        _2566 = _2480;
    }
    float _2610 = _2566;
    float _2612 = _2610;
    if (_2486)
    {
        float _2614 = _2596 * _2596;
        _2612 = _2614;
    }
    float _2616 = _2612;
    float _2618 = fma(_2604, _2604, _2608);
    float _2620 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2622 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2624 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2626 = _2618 + _2616;
    float _2628 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2620);
    float _2630 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2632 = fma(_2470, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2630);
    float _2634 = precise::clamp(_2632, 0.0, 1.0);
    float _2636 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2638 = rsqrt(_2626);
    float _2640 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2628);
    float _2642 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2644 = -_2634;
    float _2646 = _2644 + 1.0;
    float _2648 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2636);
    float _2650 = _2640 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2652 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2642);
    float _2654 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2624);
    float _2656 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2648);
    float _2658 = _2650 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2660 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2652);
    float _2662 = abs(_2646);
    float _2664 = log2(_2662);
    float _2666 = _2656 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2668 = -_2658;
    float _2670 = fma(_2668, _2622, 1.0);
    float _2672 = _2660 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2674 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2654);
    float _2676 = _2638 * _2588;
    float _2678 = _2666 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2680 = _2638 * _2604;
    float _2682 = _2638 * _2596;
    float _2684 = _2676 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2686 = fma(_2672, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2678);
    float _2688 = _2674 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2690 = log2(_2670);
    float _2692 = -_2684;
    float _2694 = fma(_2680, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2692);
    float _2696 = fma(_2650, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2686);
    float _2698 = _2680 + 1.0;
    float _2700 = _2664 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2702 = -_2682;
    float _2704 = fma(_2702, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2694);
    float _2706 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2696);
    float _2708 = _2666 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2710 = _2666 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2712 = fma(_2704, -0.5, 0.5);
    float _2714 = 1.0 / _2706;
    float _2716 = fma(_2704, 0.5, 0.5);
    float _2718 = fma(_2672, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2708);
    float _2720 = fma(_2672, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2710);
    float _2722 = fma(_2716, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2724 = fma(_2650, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2718);
    float _2726 = fma(_2650, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2720);
    float _2728 = sqrt(_2712);
    float _2730 = fma(_2716, _2722, -0.212114393711090087890625);
    float _2732 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2724);
    float _2734 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2726);
    float _2736 = _2690 * 0.693147182464599609375;
    float _2738 = fma(_2716, _2730, 1.570728778839111328125);
    float _2740 = exp2(_2700);
    float _2742 = _2732 * _2714;
    float _2744 = _2734 * _2714;
    float _2746 = _2736 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2748 = fma(_2742, 0.5, 0.5);
    float _2750 = fma(_2744, -0.5, 0.5);
    float _2752 = _2728 * 0.636619746685028076171875;
    float3 _7559 = float3(_2748, _2750, _2746);
    float _2754 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7559, float3(0.0), isnan(_7559)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7559, float3(0.0), isnan(_7559)), level(0.0)).x;
    float _2756 = -_2738;
    float _2758 = fma(_2752, _2756, 1.0);
    float _2760 = -_2680;
    float _2762 = fma(_2740, _2698, _2760);
    float _2764 = fma(_2762, 0.5, 0.5);
    float3 _7583 = float3(_2748, _2750, _2746);
    float4 _2767 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7583, float3(0.0), isnan(_7583)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7583, float3(0.0), isnan(_7583)), level(0.0)).xyzw;
    float _2769 = _2767.x;
    float _2771 = _2767.y;
    float _2773 = _2767.z;
    float _2775 = _2767.w;
    float2 _7600 = float2(_2758, _2764);
    float3 _2779 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7600, float2(0.0), isnan(_7600)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7600, float2(0.0), isnan(_7600)), level(0.0)).xyz;
    float _2781 = _2779.x;
    float _2783 = _2779.y;
    float _2785 = _2779.z;
    float _2787 = -(*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2789 = _2258 * _2787;
    float _2791 = -(*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2793 = _2258 * _2791;
    float _2795 = -(*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2797 = _2258 * _2795;
    float _2799 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2801 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2803 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2805 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2807 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2799);
    float _2809 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2801);
    float _2811 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2789);
    float _2813 = _241 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2815 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2803);
    float _2817 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2805);
    float _2819 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2793);
    float _2821 = fma(_2813, _2813, 1.0);
    float _2823 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2797);
    float _2825 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2807);
    float _2827 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2809);
    float _2829 = rsqrt(_2821);
    float _2831 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2815);
    float _2833 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2817);
    float _2835 = _2296 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2837 = _2296 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2839 = _2296 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2841 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2843 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2845 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2847 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2835);
    float _2849 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2837);
    float _2851 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2839);
    float _2853 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2841);
    float _2855 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2843);
    float _2857 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2845);
    float _2859 = fma(_2328, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2819);
    float _2861 = fma(_2328, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2811);
    float _2863 = _2813 * _2829;
    float _2865 = fma(_2328, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2823);
    float _2867 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2847);
    float _2869 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2849);
    float _2871 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2851);
    float _2873 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2853);
    float _2875 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2855);
    float _2877 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2857);
    float _2879 = -_2861;
    float _2881 = _2863 * _2879;
    float _2883 = _2827 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2885 = -_2865;
    float _2887 = _2863 * _2885;
    float _2889 = -_2859;
    float _2891 = _2863 * _2889;
    float _2893 = _2813 * _2873;
    float _2895 = fma(_2829, _2875, _2881);
    float _2897 = _2813 * _2875;
    float _2899 = _2813 * _2877;
    float _2901 = _237 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2903 = fma(_2829, _2877, _2887);
    float _2905 = _2825 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2907 = _2883 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2909 = _2883 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2911 = _2883 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2913 = fma(_2829, _2873, _2891);
    float _2915 = _2883 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2917 = fma(_2901, _2867, _2893);
    float _2919 = fma(_2905, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2907);
    float _2921 = -_443;
    float _2923 = _2921 + _2440;
    float _2925 = fma(_2905, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2909);
    float _2927 = fma(_2905, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2911);
    float _2929 = fma(_2905, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2915);
    out.m_72.x = _2867;
    out.m_72.y = _2869;
    out.m_72.z = _2871;
    float _2931 = fma(_2901, _2869, _2897);
    float _2933 = _2923 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _2935 = -_441;
    float _2937 = _2935 + _2444;
    float _2939 = fma(_2901, _2871, _2899);
    float _2941 = _2831 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2943 = _2666 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2945 = -_445;
    float _2947 = _2945 + _2448;
    float _2949 = fma(_2937, (*spvDescriptorSet0.vp_c15)._m0[638].x, _2933);
    float _2951 = _2941 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _2953 = fma(_2672, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2943);
    float _2955 = fma(_2941, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2927);
    float _2957 = _2923 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _2959 = _2923 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _2961 = fma(_2947, (*spvDescriptorSet0.vp_c15)._m0[638].z, _2949);
    float _2963 = _2951 + _2929;
    float _2965 = fma(_2937, (*spvDescriptorSet0.vp_c15)._m0[635].x, _2957);
    float _2967 = fma(_2937, (*spvDescriptorSet0.vp_c15)._m0[636].x, _2959);
    float _2969 = _2833 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2971 = fma(_2650, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2953);
    float _2973 = fma(_2947, (*spvDescriptorSet0.vp_c15)._m0[635].z, _2965);
    float _2975 = fma(_2947, (*spvDescriptorSet0.vp_c15)._m0[636].z, _2967);
    float _2977 = _2664 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2979 = fma(_2969, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2963);
    float _2981 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2971);
    float _2983 = _2961 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _2985 = fma(_2969, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2955);
    float _2987 = 1.0 / _2979;
    out.m_74.x = _2913;
    out.m_74.y = _2895;
    out.m_74.z = _2903;
    float _2989 = _2981 + _2706;
    float _2991 = _2941 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    out.gl_Position.x = _2732;
    out.gl_Position.y = _2734;
    out.gl_Position.z = _2981;
    out.gl_Position.w = _2706;
    float _2993 = _2989 * 0.5;
    float _2995 = _2941 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _2997 = exp2(_2977);
    out.m_76.y = 1.0;
    float _2999 = _2975 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _3001 = _2995 + _2925;
    float _3003 = _2973 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _3005 = _2732 + _2706;
    float _3007 = _2706 * 0.5;
    float _3009 = 1.0 / _2983;
    float _3011 = _2985 * _2987;
    float _3013 = _3005 * 0.5;
    float _3015 = fma(_2734, -0.5, _3007);
    float _3017 = _2859 + _2917;
    float _3019 = _2865 + _2939;
    bool _3021 = _3011 > 0.0;
    out.m_78.x = _2444;
    out.m_78.y = _2440;
    out.m_78.z = _2448;
    float _3023 = -_2997;
    float _3025 = _3023 + 1.0;
    float _3027 = fma(_2969, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3001);
    bool _3029 = _3011 < 1.0;
    bool _3031 = _3029 && _3021;
    out.m_80.x = _3013;
    out.m_80.y = _3015;
    out.m_80.z = _2993;
    out.m_80.w = _2706;
    float _3033 = _3025 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3035 = _3027 * _2987;
    bool _3037 = _2742 > (-1.0);
    bool _3039 = _3037 && _3031;
    float _3041 = -_3033;
    float _3043 = _3041 + 1.0;
    float _3045 = _3003 * _3009;
    float _3047 = _2861 + _2931;
    bool _3049 = _2744 > (-1.0);
    bool _3051 = _3049 && _3039;
    float _3053 = _2991 + _2919;
    float _3055 = _2999 * _3009;
    out.m_82.x = _3017;
    out.m_82.y = _3047;
    out.m_82.z = _3019;
    bool _3057 = _2742 < 1.0;
    bool _3059 = _3057 && _3051;
    float _3061 = fma(_2969, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3053);
    bool _3063 = _2744 < 1.0;
    bool _3065 = _3063 && _3059;
    float _3067 = _3061 * _2987;
    float _3069 = _3033 * _2754;
    float _3071 = _2775 * _3069;
    float _3073 = _2775 * _3043;
    float _3075 = _2785 * _3069;
    float _3077 = fma(_2781, _3071, _2769);
    float _3079 = fma(_2783, _3071, _2771);
    float _3081 = fma(_2775, _3075, _2773);
    out.m_84.x = _3077;
    out.m_84.y = _3079;
    out.m_84.z = _3081;
    out.m_84.w = _3073;
    bool _3083 = !_3065;
    float _3085 = _3079;
    float _3087 = _2732;
    float _3089 = _3077;
    float _3091 = _2734;
    float _3093 = _2706;
    float _3119;
    float _3121;
    float _3129;
    if (!_3083)
    {
        float _3095 = -_3035;
        float _3097 = _2744 + _3095;
        float _3099 = -_3067;
        float _3101 = _2742 + _3099;
        float _3103 = -_3045;
        float _3105 = _2742 + _3103;
        float _3107 = -_3055;
        float _3109 = _2744 + _3107;
        float _3111 = _3097 * _3097;
        float _3113 = fma(_3101, _3101, _3111);
        float _3115 = sqrt(_3113);
        bool _3117 = _3115 > 0.0;
        _3119 = _3113;
        _3121 = _3115;
        if (!_3117)
        {
            _3085 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _3123 = _3085;
        bool _3125 = !_3117;
        float _3127 = _3123;
        _3129 = _3123;
        _3131 = _3125;
        if (!_3131)
        {
            float _3133 = _3109 * _3109;
            float _3135 = fma(_3105, _3105, _3133);
            float _3137 = rsqrt(_3113);
            float _3139 = sqrt(_3135);
            float _3141 = _3101 * _3137;
            float _3143 = _3097 * _3137;
            bool _3145 = _3139 > 0.0;
            _3089 = _3139;
            _3121 = _3137;
            if (!_3145)
            {
                _3127 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
            }
            float _3147 = _3127;
            bool _3149 = !_3145;
            _3129 = _3147;
            _3131 = _3149;
            if (!_3131)
            {
                float _3151 = _2292 * _2969;
                float _3153 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
                float _3155 = fma(_3151, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2951);
                float _3157 = fma(_3151, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2991);
                float _3159 = fma(_3151, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2995);
                float _3161 = fma(_2969, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3155);
                float _3163 = fma(_2969, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3159);
                float _3165 = fma(_2969, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3157);
                float _3167 = 1.0 / _3161;
                float _3169 = _3153 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _3171 = _3109 * _3169;
                float _3173 = _3105 * _3169;
                float _3175 = rsqrt(_3135);
                float _3177 = _3171 * _3171;
                float _3179 = fma(_3173, _3173, _3177);
                float _3181 = _3163 * _3167;
                float _3183 = _3165 * _3167;
                float _3185 = _3181 * _3181;
                float _3187 = sqrt(_3179);
                float _3189 = fma(_3183, _3183, _3185);
                float _3191 = _3109 * _3175;
                float _3193 = _3105 * _3175;
                float _3195 = sqrt(_3189);
                float _3197 = _3143 * _3191;
                float _3199 = fma(_3141, _3193, _3197);
                float _3201 = precise::min(0.0, _3199);
                float _3203 = _2706 * _3201;
                float _3205 = fma(_3187, (*spvDescriptorSet0.vp_c13)._m0[1].x, _3195);
                float _3207 = fma(_3173, _3203, _2732);
                float _3209 = 1.0 / _3205;
                float _3211 = fma(_3171, _3203, _2734);
                out.gl_Position.x = _3207;
                out.gl_Position.y = _3211;
                float _3213 = _3195 * _3209;
                out.m_76.y = _3213;
                _3087 = _3207;
                _3089 = _3171;
                _3091 = _3211;
                _3119 = _3203;
                _3121 = _3199;
                _3129 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
                _3131 = true;
            }
        }
    }
    else
    {
        float _3215 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _3215;
        _3087 = 0.0;
        _3091 = 0.0;
        _3119 = _3215;
        _3121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
        _3129 = 0.0;
    }
    _3131 = false;
    float _3217 = _3087;
    float _3219 = _3089;
    float _3221 = _3091;
    float _3223 = _3119;
    float _3225 = _3121;
    float _3227 = _3129;
    bool _3229 = _2470 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3231 = isnan(_2470);
    bool _3233 = _3229 || _3231;
    bool _3235 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3237 = _3233 || _3235;
    float _3239 = _3219;
    float _3241 = _3223;
    float _3243 = _3221;
    float _3245 = _3217;
    float _3247 = _3225;
    if (!_3237)
    {
        _3239 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3249 = _3239;
    float _3251 = _3249;
    float _3253 = _3249;
    if (!_3237)
    {
        _3093 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3255 = _3093;
    float _3257 = _3255;
    float _3259 = _3255;
    if (!_3237)
    {
        _3241 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3261 = _3241;
    float _3263 = _3261;
    float _3265 = _3261;
    if (!_3237)
    {
        _3243 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3267 = _3243;
    float _3269 = _3267;
    float _3271 = _3267;
    if (!_3237)
    {
        _3245 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3273 = _3245;
    float _3275 = _3273;
    float _3277 = _3273;
    if (!_3237)
    {
        _3247 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3279 = _3247;
    bool _3281 = !_3237;
    float _3283 = _3279;
    float _3285 = _3279;
    if (!_3281)
    {
        bool _3287 = _2470 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3289 = isnan(_2470);
        bool _3291 = _3287 || _3289;
        bool _3293 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3295 = _3291 || _3293;
        if (!_3295)
        {
            float _3297 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3299 = _2470 + _3297;
            float _3301 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3303 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3301;
            float _3305 = 1.0 / _3303;
            float _3307 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3309 = _3307 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3311 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3313 = _3311 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3315 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3317 = _3315 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3319 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3321 = _3319 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3323 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3325 = _3323 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3327 = _3299 * _3305;
            float _3329 = precise::clamp(_3327, 0.0, 1.0);
            float _3331 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3333 = _3331 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3335 = fma(_3329, _3309, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3337 = fma(_3329, _3333, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3339 = fma(_3329, _3313, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3341 = fma(_3329, _3317, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3343 = fma(_3329, _3321, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3345 = fma(_3329, _3325, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3259 = _3337;
            _3277 = _3343;
            _3253 = _3335;
            _3271 = _3341;
            _3265 = _3339;
            _3285 = _3345;
            _3347 = true;
        }
        else
        {
            bool _3349 = _2470 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3351 = isnan(_2470);
            bool _3353 = _3349 || _3351;
            bool _3355 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3357 = _3353 || _3355;
            if (!_3357)
            {
                _3251 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3359 = _3251;
            _3253 = _3359;
            if (!_3357)
            {
                _3257 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3361 = _3257;
            _3259 = _3361;
            if (!_3357)
            {
                _3263 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3363 = _3263;
            _3265 = _3363;
            if (!_3357)
            {
                _3269 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3365 = _3269;
            _3271 = _3365;
            if (!_3357)
            {
                _3275 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3367 = _3275;
            _3277 = _3367;
            if (!_3357)
            {
                _3283 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3369 = _3283;
            bool _3371 = !_3357;
            _3285 = _3369;
            if (!_3371)
            {
                bool _3373 = _2470 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3375 = isnan(_2470);
                bool _3377 = _3373 || _3375;
                bool _3379 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3381 = _3377 || _3379;
                if (!_3381)
                {
                    float _3383 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3385 = _2470 + _3383;
                    float _3387 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3389 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3387;
                    float _3391 = 1.0 / _3389;
                    float _3393 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3395 = _3393 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3397 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3399 = _3397 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3401 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3403 = _3401 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3405 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3407 = _3405 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3409 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3411 = _3409 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3413 = _3385 * _3391;
                    float _3415 = precise::clamp(_3413, 0.0, 1.0);
                    float _3417 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3419 = _3417 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3421 = fma(_3415, _3395, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3423 = fma(_3415, _3419, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3425 = fma(_3415, _3399, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3427 = fma(_3415, _3403, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3429 = fma(_3415, _3407, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3431 = fma(_3415, _3411, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3259 = _3423;
                    _3277 = _3429;
                    _3253 = _3421;
                    _3271 = _3427;
                    _3265 = _3425;
                    _3285 = _3431;
                    _3347 = true;
                }
                else
                {
                    _3259 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3277 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3253 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3271 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3265 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3285 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3347 = false;
    float _3433 = _3259;
    float _3435 = _3277;
    float _3437 = _3253;
    float _3439 = _3271;
    float _3441 = _3265;
    float _3443 = _3285;
    float _3445 = fma(_3047, -0.5, 0.5);
    float _3447 = precise::clamp(_3445, 0.0, 1.0);
    float _3449 = -_3433;
    float _3451 = _3449 + _3435;
    float _3453 = -_3437;
    float _3455 = _3453 + _3439;
    float _3457 = -_3441;
    float _3459 = _3457 + _3443;
    bool _3461 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3463 = fma(_3447, _3451, _3433);
    float _3465 = fma(_3447, _3455, _3437);
    float _3467 = fma(_3447, _3459, _3441);
    float _3469 = _3227 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3471 = _3463 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3473 = fma(_3465, 0.298911988735198974609375, _3471);
    out.m_76.w = _3469;
    float _3475 = fma(_3467, 0.114477999508380889892578125, _3473);
    float _3477 = -_3475;
    float _3479 = _3465 + _3477;
    float _3481 = -_3475;
    float _3483 = _3463 + _3481;
    float _3485 = -_3475;
    float _3487 = _3467 + _3485;
    out.m_86.x = 0.0;
    float _3489 = fma(_3479, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3475);
    float _3491 = fma(_3483, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3475);
    float _3493 = fma(_3487, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3475);
    out.m_88.x = _3489;
    out.m_88.y = _3491;
    out.m_88.z = _3493;
    if (!_3461)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3495 = -_2440;
    float _3497 = _3495 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3499 = -_2444;
    float _3501 = _3499 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3503 = -_2448;
    float _3505 = _3503 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3507 = _3497 * _3497;
    float _3509 = fma(_3501, _3501, _3507);
    float _3511 = fma(_3505, _3505, _3509);
    float _3513 = sqrt(_3511);
    float _3515 = rsqrt(_3511);
    float _3517 = -_3513;
    float _3519 = _3517 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3521 = _3519 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3523 = precise::clamp(_3521, 0.0, 1.0);
    float _3525 = _3501 * _3515;
    float _3527 = _3497 * _3515;
    float _3529 = abs(_3523);
    float _3531 = log2(_3529);
    float _3533 = _3505 * _3515;
    float _3535 = _3525 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3537 = _3047 * _3527;
    float _3539 = -_3527;
    float _3541 = -_3535;
    float _3543 = fma(_3539, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3541);
    float _3545 = fma(_3017, _3525, _3537);
    float _3547 = -_3533;
    float _3549 = fma(_3547, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3543);
    float _3551 = fma(_3019, _3533, _3545);
    float _3553 = precise::clamp(_3551, 0.0, 1.0);
    float _3555 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3557 = _3549 + _3555;
    float _3559 = _3531 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3561 = _3557 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3563 = precise::clamp(_3561, 0.0, 1.0);
    float _3565 = exp2(_3559);
    float _3567 = _3565 * _3563;
    float _3569 = _3553 * _3567;
    float _3571 = _3569 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3573 = _3569 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3575 = _3569 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _3571;
    out.m_86.y = _3573;
    out.m_86.z = _3575;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3347 = false;
    bool _3131 = false;
    bool _465 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_44.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (!_111)
    {
        out.m_47.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3632 = as_type<float>(_123);
        out.gl_Position.z = _3632;
    }
    if (!_111)
    {
        return out;
    }
    float _127 = in.m_49.w;
    float _129 = in.m_51.x;
    bool _131 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_127);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_127;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _129;
    float _145 = 0.0;
    float _147 = _143;
    if (_139)
    {
        float _149 = float(_107);
        _145 = _149;
    }
    float _151 = _145;
    bool _153 = _143 >= _151;
    bool _155 = !_139;
    bool _157 = _153 || _155;
    if (_157)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _117;
    if (_157)
    {
        out.m_47.x = 0.0;
    }
    if (_157)
    {
        float _161 = _159 * 5.0;
        _125 = as_type<int>(_161);
    }
    int _163 = _125;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3705 = as_type<float>(_163);
        out.gl_Position.z = _3705;
    }
    if (_157)
    {
        return out;
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    float _167 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _169 = in.m_58.w;
    bool _171 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _173 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _175 = _171 || _173;
    bool _177 = isnan(1.0);
    bool _179 = _175 || _177;
    float _181 = in.m_49.x;
    float _183 = in.m_49.y;
    float _185 = in.m_49.z;
    float _187 = in.m_44.x;
    float _189 = in.m_44.y;
    float _191 = in.m_44.z;
    float _193 = in.m_60.x;
    float _195 = in.m_60.y;
    float _197 = in.m_60.z;
    float _199 = 0.0;
    float _201 = _167;
    if (!_179)
    {
        float _203 = _167 * _167;
        float _205 = _203 * 0.5;
        _199 = _205;
    }
    float _207 = _199;
    float _209 = in.m_62.x;
    float _211 = in.m_62.y;
    float _213 = in.m_62.z;
    float _215 = _207;
    if (!_179)
    {
        float _217 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _215 = _217;
    }
    float _219 = _215;
    float _221 = in.m_64.x;
    float _223 = in.m_64.y;
    float _225 = in.m_64.z;
    int _227 = as_type<int>(_165) & 1;
    bool _229 = _227 != 0;
    int _231 = as_type<int>(_165) & 2;
    bool _233 = _231 != 0;
    bool _235 = !_229;
    float _237 = _235 ? (-0.5) : 0.5;
    bool _239 = !_233;
    float _241 = _239 ? (-0.5) : 0.5;
    bool _243 = !_179;
    float _245 = _219;
    float _247 = _223;
    if (!_243)
    {
        float _249 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = log2(_249);
        float _253 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _255 = _253 + 1.0;
        float _257 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _259 = _167 * _251;
        float _261 = 1.0 / _255;
        float _263 = _257 * 0.693147182464599609375;
        float _265 = exp2(_259);
        float _267 = 1.0 / _263;
        float _269 = _265 + (-1.0);
        float _271 = -_269;
        float _273 = fma(_271, _267, _167);
        float _275 = _273 * _261;
        float _277 = _275 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _245 = _277;
    }
    float _279 = _245;
    bool _281 = !_179;
    float _283 = _279;
    if (!_281)
    {
        float _285 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = log2(_285);
        float _289 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _291 = _289 + 1.0;
        float _293 = 1.0 / _291;
        float _295 = _167 * _287;
        float _297 = exp2(_295);
        float _299 = -_297;
        float _301 = _299 + 1.0;
        float _303 = _301 * _293;
        _201 = _303;
    }
    float _305 = _201;
    float _307 = _279 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _309 = _279 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _311 = _279 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _313 = _305;
    if (!_179)
    {
        float _315 = _143 * _143;
        float _317 = _315 * 0.5;
        _283 = _317;
    }
    float _319 = _283;
    float _321 = fma(_305, _181, _307);
    float _323 = fma(_305, _183, _309);
    float _325 = fma(_305, _185, _311);
    if (!_179)
    {
        float _327 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _313 = _327;
    }
    float _329 = _313;
    bool _331 = !_179;
    float _333 = _329;
    if (!_331)
    {
        float _335 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _337 = log2(_335);
        float _339 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _341 = _339 + 1.0;
        float _343 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _345 = _143 * _337;
        float _347 = 1.0 / _341;
        float _349 = _343 * 0.693147182464599609375;
        float _351 = exp2(_345);
        float _353 = 1.0 / _349;
        float _355 = _351 + (-1.0);
        float _357 = -_355;
        float _359 = fma(_357, _353, _143);
        float _361 = _359 * _347;
        float _363 = _361 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _333 = _363;
    }
    float _365 = _333;
    float _367 = _365 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _369 = _365 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _371 = _365 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _373 = _365;
    if (!_179)
    {
        _373 = _143;
    }
    float _375 = _373;
    bool _377 = !_179;
    float _379 = _375;
    if (!_377)
    {
        float _381 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _383 = log2(_381);
        float _385 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _387 = _385 + 1.0;
        float _389 = 1.0 / _387;
        float _391 = _143 * _383;
        float _393 = exp2(_391);
        float _395 = -_393;
        float _397 = _395 + 1.0;
        float _399 = _397 * _389;
        _379 = _399;
    }
    float _401 = _379;
    float _403 = fma(_401, _183, _369);
    bool _405 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _407 = fma(_401, _181, _367);
    float _409 = fma(_401, _185, _371);
    float _411 = -_403;
    float _413 = _323 + _411;
    float _415 = fma(_321, _169, _187);
    float _417 = -_407;
    float _419 = _321 + _417;
    float _421 = fma(_323, _169, _189);
    float _423 = _413 * _195;
    float _425 = _413 * _211;
    float _427 = _413 * _223;
    float _429 = -_409;
    float _431 = _325 + _429;
    float _433 = fma(_419, _193, _423);
    float _435 = fma(_419, _209, _425);
    float _437 = fma(_419, _221, _427);
    float _439 = fma(_325, _169, _191);
    float _441 = fma(_431, _197, _433);
    float _443 = fma(_431, _213, _435);
    float _445 = fma(_431, _225, _437);
    bool _447 = !_405;
    float _463;
    if (!_447)
    {
        float _449 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _451 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _453 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _455 = _453 * _449;
        float _457 = floor(_455);
        float _459 = -_457;
        float _461 = _455 + _459;
        _463 = _461;
        _465 = true;
    }
    else
    {
        float _467 = float(_107);
        float _469 = 1.0 / _467;
        float _471 = _143 * _469;
        _463 = _471;
    }
    _465 = false;
    float _473 = _463;
    float _475 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _477 = int(_475);
    float _479 = _421 * _211;
    float _481 = in.m_62.w;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _485 = _483 != 0;
    float _487 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _489 = int(_487);
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _493 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _495 = int(_493);
    float _497 = float(_477);
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _501 = 0.0;
    int _503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_485)
    {
        _501 = 1.0;
    }
    float _505 = _501;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _509 = 1.0 + _507;
    float _511 = _505;
    if (!_485)
    {
        _511 = 7.345489978790283203125;
    }
    float _513 = _511;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _517 = 1.0 / _497;
    float _519 = float(_489);
    float _521 = _513 * _129;
    float _523 = float(uint(_495));
    float _525 = 1.0 / _519;
    int _527 = ~_495;
    int _529 = _527 + 1;
    bool _531 = _495 == 0;
    float _533 = _517 * _143;
    float _535 = 1.0 / _523;
    float _537 = in.m_51.y;
    float _539 = trunc(_533);
    int _541 = int(_539);
    float _543 = _525 * _143;
    float _545 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _547 = int(_545);
    int _549 = as_type<int>(_535) + (-2);
    float _551 = float(uint(_541));
    float _553 = trunc(_543);
    int _555 = int(_553);
    float _557 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[78].w, _515);
    float _559 = as_type<float>(_549) * _551;
    float _561 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _557);
    float _563 = float(uint(_547));
    float _565 = trunc(_559);
    float _567 = precise::max(_565, 0.0);
    uint _570 = uint(_567);
    int _572 = ~_547;
    int _574 = _572 + 1;
    int _576 = ~_547;
    int _578 = _576 + 1;
    int _580 = ~_547;
    int _582 = _580 + 1;
    float _584 = 1.0 / _563;
    float _586 = float(uint(_555));
    float _588 = _559;
    float _590 = as_type<float>(_529);
    if (_485)
    {
        _588 = _129;
    }
    float _592 = _588;
    float _594 = _592;
    if (!_485)
    {
        _594 = _537;
    }
    float _596 = _594;
    float _598 = 1.0 / _509;
    int _600 = as_type<int>(_584) + (-2);
    int _602 = _529 * int(_570);
    int _604 = _602 + _541;
    if (_485)
    {
        _590 = 1.0;
    }
    float _606 = _590;
    float _608 = _606;
    if (!_485)
    {
        _608 = 1.2345600128173828125;
    }
    float _610 = _608;
    float _612 = as_type<float>(_600) * _586;
    float _614 = float(uint(_604));
    float _616 = trunc(_612);
    float _618 = precise::max(_616, 0.0);
    uint _620 = uint(_618);
    float _622 = as_type<float>(_549) * _614;
    float _624 = trunc(_622);
    float _626 = precise::max(_624, 0.0);
    uint _628 = uint(_626);
    float _630 = _610 * _596;
    int _632 = ~_495;
    int _634 = _632 + 1;
    float _636 = floor(_521);
    int _638 = _574 * int(_620);
    int _640 = _638 + _555;
    float _642 = float(_107);
    float _644 = float(uint(_640));
    int _646 = int(_570) + int(_628);
    float _648 = floor(_630);
    float _650 = as_type<float>(_600) * _644;
    float _652 = float(_495);
    int _654 = _634 * _646;
    int _656 = _654 + _541;
    float _658 = -_636;
    float _660 = _521 + _658;
    float _662 = 1.0 / _642;
    bool _664 = uint(_656) >= uint(_495);
    float _666 = _660 * _652;
    float _668 = float(_541);
    bool _670 = !_664;
    int _672 = _670 ? 0 : (-1);
    float _674 = trunc(_650);
    float _676 = precise::max(_674, 0.0);
    uint _678 = uint(_676);
    int _680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _682 = _680 != 0;
    float _684 = -_648;
    float _686 = _630 + _684;
    int _688 = ~_646;
    int _690 = _688 + _672;
    int _692 = _690 + 1;
    bool _694 = !_682;
    int _696 = _694 ? 0 : 1;
    bool _698 = _668 >= _652;
    bool _700 = isnan(_668);
    bool _702 = _698 || _700;
    bool _704 = isnan(_652);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = trunc(_666);
    int _712 = int(_710);
    float _714 = _662 * _143;
    float _716 = float(_547);
    int _718 = abs(_696);
    float _720 = _652 * _714;
    float _722 = float(_555);
    float _724 = _716 * _714;
    float _726 = trunc(_708);
    int _728 = int(_726);
    float _730 = _686 * _716;
    bool _732 = _722 >= _716;
    bool _734 = isnan(_722);
    bool _736 = _732 || _734;
    bool _738 = isnan(_716);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    int _744 = int(_620) + int(_678);
    int _746 = _712 * _718;
    int _748 = _746 + _541;
    int _750 = _495 * _692;
    int _752 = _750 + _541;
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _756 = _754 != 0;
    int _758 = _578 * _744;
    int _760 = _758 + _555;
    float _762 = trunc(_730);
    int _764 = int(_762);
    bool _766 = !_531;
    int _768 = _766 ? _752 : (-1);
    int _770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _772 = _770 != 0;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _776 = _774 != 0;
    int _778 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _780 = _778 != 0;
    bool _782 = uint(_760) >= uint(_547);
    bool _784 = !_756;
    int _786 = _784 ? 0 : 1;
    float _788 = trunc(_742);
    int _790 = int(_788);
    int _792 = ~_728;
    int _794 = _792 + 1;
    int _796 = _794 + 1;
    int _798 = abs(_786);
    bool _800 = !_782;
    int _802 = _800 ? 0 : (-1);
    int _804 = _768 * _796;
    bool _806 = !_776;
    int _808 = _806 ? 0 : 1;
    float _810 = trunc(_720);
    int _812 = int(_810);
    int _814 = _495 + (-1);
    int _816 = ~_744;
    int _818 = _816 + _802;
    int _820 = _818 + 1;
    int _822 = abs(_808);
    int _824 = _728 * _814;
    int _826 = _824 + _804;
    bool _828 = !_772;
    int _830 = _828 ? 0 : 1;
    int _832 = _764 * _798;
    int _834 = _832 + _555;
    bool _836 = _547 == 0;
    int _838 = _547 * _820;
    int _840 = _838 + _555;
    bool _842 = !_780;
    int _844 = _842 ? 0 : 1;
    int _846 = _826 * _822;
    int _848 = abs(_830);
    float _850 = trunc(_724);
    int _852 = int(_850);
    int _854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _856 = _854 != 0;
    float _858 = in.m_51.w;
    int _860 = abs(_844);
    int _862 = _812 * _848;
    int _864 = _862 + _846;
    int _866 = ~_790;
    int _868 = _866 + 1;
    int _870 = _868 + 1;
    bool _872 = !_836;
    int _874 = _872 ? _840 : (-1);
    bool _876 = !_856;
    int _878 = _876 ? 0 : 1;
    int _880 = _874 * _870;
    int _882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _884 = _882 != 0;
    int _886 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _888 = _886 != 0;
    int _890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _892 = _890 != 0;
    int _894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _896 = _894 != 0;
    int _898 = abs(_878);
    int _900 = _748 * _860;
    int _902 = _900 + _864;
    int _904 = _547 + (-1);
    bool _906 = !_888;
    int _908 = _906 ? 0 : 1;
    int _910 = _790 * _904;
    int _912 = _910 + _880;
    bool _914 = !_884;
    int _916 = _914 ? 0 : 1;
    int _918 = abs(_908);
    int _920 = _712 * _898;
    int _922 = _920 + _902;
    bool _924 = !_892;
    int _926 = _924 ? 0 : 1;
    int _928 = abs(_916);
    bool _930 = !_896;
    int _932 = _930 ? 0 : 1;
    int _934 = abs(_926);
    int _936 = _912 * _918;
    float _938 = float(uint(_922));
    int _940 = abs(_932);
    int _942 = _852 * _928;
    int _944 = _942 + _936;
    float _946 = as_type<float>(_549) * _938;
    int _948 = ~_495;
    int _950 = _948 + 1;
    int _952 = _834 * _934;
    int _954 = _952 + _944;
    int _956 = ~_547;
    int _958 = _956 + 1;
    float _960 = trunc(_946);
    float _962 = precise::max(_960, 0.0);
    uint _964 = uint(_962);
    bool _966 = _495 == 0;
    int _968 = _764 * _940;
    int _970 = _968 + _954;
    int _972 = ~_495;
    int _974 = _972 + 1;
    float _976 = float(uint(_834));
    float _978 = float(uint(_970));
    float _980 = as_type<float>(_600) * _978;
    float _982 = trunc(_980);
    float _984 = precise::max(_982, 0.0);
    uint _986 = uint(_984);
    int _988 = _974 * int(_964);
    int _990 = _988 + _922;
    float _992 = float(uint(_990));
    float _994 = as_type<float>(_549) * _992;
    float _996 = trunc(_994);
    float _998 = precise::max(_996, 0.0);
    uint _1000 = uint(_998);
    int _1002 = _958 * int(_986);
    int _1004 = _1002 + _970;
    float _1006 = float(uint(_1004));
    int _1008 = ~_547;
    int _1010 = _1008 + 1;
    float _1012 = as_type<float>(_600) * _1006;
    int _1014 = int(_964) + int(_1000);
    float _1016 = trunc(_1012);
    float _1018 = precise::max(_1016, 0.0);
    uint _1020 = uint(_1018);
    int _1022 = _950 * _1014;
    int _1024 = _1022 + _922;
    bool _1026 = uint(_1024) >= uint(_495);
    bool _1028 = !_1026;
    int _1030 = _1028 ? 0 : (-1);
    int _1032 = int(_986) + int(_1020);
    int _1034 = ~_1014;
    int _1036 = _1034 + _1030;
    int _1038 = _1036 + 1;
    int _1040 = _1010 * _1032;
    int _1042 = _1040 + _970;
    int _1044 = _495 * _1038;
    int _1046 = _1044 + _922;
    int _1048 = ~_495;
    int _1050 = _1048 + 1;
    bool _1052 = uint(_1042) >= uint(_547);
    bool _1054 = !_966;
    int _1056 = _1054 ? _1046 : (-1);
    bool _1058 = !_1052;
    int _1060 = _1058 ? 0 : (-1);
    int _1062 = _1056 & 3;
    bool _1064 = _1062 != 0;
    int _1066 = ~_1032;
    int _1068 = _1066 + _1060;
    int _1070 = _1068 + 1;
    bool _1072 = uint(_1062) > 1u;
    int _1074 = _1056 & 3;
    bool _1076 = _1074 != 0;
    int _1078 = _547 * _1070;
    int _1080 = _1078 + _970;
    float _1082 = float(uint(_748));
    int _1084 = _1076 ? 0 : 1;
    bool _1086 = !_836;
    int _1088 = _1086 ? _1080 : (-1);
    float _1090 = as_type<float>(_549) * _1082;
    int _1092 = ~_1084;
    int _1094 = _1092 + 1;
    int _1096 = _1094 + 1;
    bool _1098 = uint(_1062) >= 2u;
    float _1100 = trunc(_1090);
    float _1102 = precise::max(_1100, 0.0);
    uint _1104 = uint(_1102);
    int _1106 = _1096;
    if (!_1072)
    {
        int _1108 = ~_1084;
        int _1110 = _1108 + 1;
        _1106 = _1110;
    }
    int _1112 = _1106;
    int _1114 = _1088 & 3;
    bool _1116 = _1114 != 0;
    int _1118 = _1088 & 3;
    bool _1120 = _1118 != 0;
    int _1122 = _1098 ? 0 : 1;
    bool _1124 = _1062 != 3;
    int _1126 = _1116 ? 0 : 1;
    bool _1128 = uint(_1118) > 1u;
    int _1130 = ~_1122;
    int _1132 = _1130 + 1;
    int _1134 = _1132 + 1;
    int _1136 = _1050 * int(_1104);
    int _1138 = _1136 + _748;
    float _1140 = as_type<float>(_600) * _976;
    int _1142 = ~_1126;
    int _1144 = _1142 + 1;
    int _1146 = _1144 + 1;
    int _1148 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1150 = _1148 != 0;
    float _1152 = trunc(_1140);
    float _1154 = precise::max(_1152, 0.0);
    uint _1156 = uint(_1154);
    int _1158 = _1134;
    int _1160 = _1146;
    if (_1124)
    {
        int _1162 = ~_1122;
        int _1164 = _1162 + 1;
        _1158 = _1164;
    }
    int _1166 = _1158;
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1170 = _1168 != 0;
    float _1172 = in.m_51.z;
    if (!_1128)
    {
        int _1174 = ~_1126;
        int _1176 = _1174 + 1;
        _1160 = _1176;
    }
    int _1178 = _1160;
    bool _1180 = _1118 != 3;
    float _1182 = float(uint(_1138));
    bool _1184 = !_1170;
    int _1186 = _1184 ? 0 : 1;
    bool _1188 = uint(_1118) >= 2u;
    float _1190 = as_type<float>(_549) * _1182;
    float _1192 = _129 * 2.0;
    int _1194 = _582 * int(_1156);
    int _1196 = _1194 + _834;
    int _1198 = _1188 ? 0 : 1;
    float _1200 = floor(_1192);
    int _1202 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1204 = _1202 != 0;
    float _1206 = _537 * 2.0;
    int _1208 = ~_1198;
    int _1210 = _1208 + 1;
    int _1212 = _1210 + 1;
    int _1214 = _1212;
    float _1216 = as_type<float>(_1156);
    if (_1180)
    {
        int _1218 = ~_1198;
        int _1220 = _1218 + 1;
        _1214 = _1220;
    }
    int _1222 = _1214;
    bool _1224 = _129 > 0.5;
    float _1226 = floor(_1206);
    float _1228 = float(uint(_1196));
    float _1230 = -_237;
    int _1232 = _1224 ? as_type<int>(_1230) : as_type<int>(_237);
    bool _1234 = _537 > 0.5;
    float _1236 = as_type<float>(_600) * _1228;
    bool _1238 = !_1204;
    float _1240 = _1238 ? _237 : as_type<float>(_1232);
    float _1242 = trunc(_1190);
    float _1244 = precise::max(_1242, 0.0);
    uint _1246 = uint(_1244);
    bool _1248 = _1172 > 0.5;
    float _1250 = _421 * _195;
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1254 = _1252 != 0;
    float _1256 = -_241;
    int _1258 = _1234 ? as_type<int>(_1256) : as_type<int>(_241);
    float _1260 = fma(_415, _193, _1250);
    int _1262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1264 = _1262 != 0;
    float _1266 = trunc(_1236);
    float _1268 = precise::max(_1266, 0.0);
    uint _1270 = uint(_1268);
    float _1272 = -_237;
    int _1274 = _1248 ? as_type<int>(_1272) : as_type<int>(_237);
    float _1276 = fma(_439, _197, _1260);
    bool _1278 = !_1254;
    float _1280 = _1278 ? _241 : as_type<float>(_1258);
    float _1282 = _129 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1284 = _1200 > 0.0;
    bool _1286 = !_1264;
    float _1288 = _1286 ? _237 : as_type<float>(_1274);
    if (_1150)
    {
        _503 = 0;
    }
    int _1290 = _503;
    bool _1292 = _1200 >= 0.0;
    bool _1294 = isnan(_1200);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan(0.0);
    bool _1300 = _1296 || _1298;
    float _1302 = _1288 + 0.5;
    bool _1304 = _858 > 0.5;
    float _1306 = _421 * _223;
    int _1308 = _1290;
    if (!_1150)
    {
        _1308 = 1;
    }
    int _1310 = _1308;
    float _1312 = _1300 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1314 = fma(_415, _221, _1306);
    float _1316 = -_241;
    int _1318 = _1304 ? as_type<int>(_1316) : as_type<int>(_241);
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1322 = _1320 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _1324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1326 = _1324 != 0;
    bool _1328 = _1310 != 1;
    int _1330 = ~as_type<int>(_1312);
    int _1332 = _1330 + 1;
    int _1334 = _1332 + 1;
    int _1336 = _1334;
    float _1338 = _1312;
    if (!_1284)
    {
        int _1340 = ~as_type<int>(_1312);
        int _1342 = _1340 + 1;
        _1336 = _1342;
    }
    int _1344 = _1336;
    bool _1346 = !_1326;
    float _1348 = _1346 ? _241 : as_type<float>(_1318);
    bool _1350 = _1226 > 0.0;
    int _1352 = int(_1104) + int(_1246);
    float _1354 = _1348 + (-0.5);
    int _1356 = ~_495;
    int _1358 = _1356 + 1;
    int _1360 = ~_547;
    int _1362 = _1360 + 1;
    int _1364 = int(_1156) + int(_1270);
    int _1366 = _1358 * _1352;
    int _1368 = _1366 + _748;
    bool _1370 = _1226 >= 0.0;
    bool _1372 = isnan(_1226);
    bool _1374 = _1370 || _1372;
    bool _1376 = isnan(0.0);
    bool _1378 = _1374 || _1376;
    float _1380 = as_type<float>(_1270);
    if (!_1328)
    {
        _1216 = _537;
    }
    float _1382 = _1216;
    int _1384 = _1362 * _1364;
    int _1386 = _1384 + _834;
    int _1388 = _1378 ? 0 : 1;
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1390;
    float _1394 = _1382;
    if (!_1328)
    {
        _1380 = _537;
    }
    float _1396 = _1380;
    float _1398 = in.m_60.w;
    float _1400 = _1396;
    if (!_1328)
    {
        _1338 = _1172;
    }
    float _1402 = _1338;
    float _1404 = _1402;
    if (!_1328)
    {
        _247 = _1172;
    }
    float _1406 = _247;
    float _1408 = _1406;
    if (_1328)
    {
        _1394 = _129;
    }
    float _1410 = _1394;
    if (_1328)
    {
        _1400 = _129;
    }
    float _1412 = _1400;
    if (_1328)
    {
        _1404 = _537;
    }
    float _1414 = _1404;
    if (_1328)
    {
        _1408 = _537;
    }
    float _1416 = _1408;
    bool _1418 = uint(_1368) >= uint(_495);
    float _1420 = fma(_415, _209, _479);
    bool _1422 = uint(_1386) >= uint(_547);
    int _1424 = ~_1388;
    int _1426 = _1424 + 1;
    int _1428 = _1426 + 1;
    float _1430 = fma(_439, _213, _1420);
    float _1432 = 1.0 / _1392;
    int _1434 = _1428;
    if (!_1350)
    {
        int _1436 = ~_1388;
        int _1438 = _1436 + 1;
        _1434 = _1438;
    }
    int _1440 = _1434;
    float _1442 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1444 = _473 + _1442;
    bool _1446 = !_1422;
    int _1448 = _1446 ? 0 : (-1);
    float _1450 = _1430 + _481;
    int _1452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1454 = _1452 != 0;
    int _1456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1458 = _1456 != 0;
    int _1460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1462 = _1460 != 0;
    int _1464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1466 = _1464 != 0;
    float _1468 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1470 = fma(_439, _225, _1314);
    float _1472 = 1.0 / _1322;
    float _1474 = _1172 * 2.0;
    float _1476 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1478 = _473 + _1476;
    bool _1480 = !_1418;
    int _1482 = _1480 ? 0 : (-1);
    float _1484 = -_1468;
    float _1486 = fma(_1282, 2.0, _1484);
    float _1488 = in.m_64.w;
    float _1490 = _537 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1492 = floor(_1474);
    float _1494 = _1444 * _1432;
    float _1496 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1498 = _129 + _537;
    bool _1500 = !_1458;
    int _1502 = _1500 ? 0 : 1;
    float _1504 = _1172 + _537;
    float _1506 = fma(_1490, -2.0, _1496);
    float _1508 = _1498 + (-1.0);
    float _1510 = _1478 * _1472;
    float _1512 = _129 + _1172;
    bool _1514 = !_1462;
    int _1516 = _1514 ? 0 : 1;
    float _1518 = _1504 + (-1.0);
    float _1520 = _1512 + (-1.0);
    int _1522 = abs(_1516);
    float _1524 = -_143;
    float _1526 = fma(_1524, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1486);
    bool _1528 = _1492 >= 0.0;
    bool _1530 = isnan(_1492);
    bool _1532 = _1528 || _1530;
    bool _1534 = isnan(0.0);
    bool _1536 = _1532 || _1534;
    float _1538 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1540 = fma(_1508, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1542 = _1536 ? 0 : 1;
    float _1544 = _537 + (-0.5);
    bool _1546 = _1492 > 0.0;
    float _1548 = _1276 + _1398;
    float _1550 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1552 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1506);
    int _1554 = ~_1542;
    int _1556 = _1554 + 1;
    int _1558 = _1556 + 1;
    float _1560 = _1470 + _1488;
    int _1562 = abs(_1502);
    float _1564 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1566 = _1056 >> 31;
    float _1568 = fma(_1564, -2.0, _499);
    int _1570 = _1558;
    if (!_1546)
    {
        int _1572 = ~_1542;
        int _1574 = _1572 + 1;
        _1570 = _1574;
    }
    int _1576 = _1570;
    float _1578 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1550);
    float _1580 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1582 = log2(_1580);
    float _1584 = float(_1440);
    float _1586 = fma(_1518, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1588 = _1088 >> 31;
    float _1590 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1592 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1590;
    int _1594 = _1566 & 3;
    float _1596 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1598 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1596;
    float _1600 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1602 = _1600 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _1604 = _1588 & 3;
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1608 = _1606 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1610 = _1240 + 0.5;
    int _1612 = _1056 + _1594;
    float _1614 = fma(_1602, _1510, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _1616 = _1088 + _1604;
    float _1618 = fma(_1608, _1510, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1620 = fma(_1610, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1526);
    float _1622 = _1280 + (-0.5);
    int _1624 = _1612 >> 2;
    float _1626 = _1582 * _143;
    float _1628 = -_1622;
    float _1630 = -_1552;
    float _1632 = fma(_1628, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1630);
    float _1634 = _1410 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1636 = float(_1522);
    float _1638 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1640 = _1616 >> 2;
    float _1642 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1644 = _1624 << 4;
    int _1646 = _1644 + 368;
    float _1648 = _1636 * _1584;
    int _1650 = _1640 << 4;
    int _1652 = _1650 + 512;
    float _1654 = exp2(_1626);
    uint _1656 = uint(int(uint(_1646) >> uint(2)));
    uint _1658 = uint(int(uint(int(_1656)) >> uint(2)));
    int _1660 = int(_1656) & 3;
    float _1662 = (*spvDescriptorSet0.vp_c9)._m0[int(_1658)][_1660];
    int _1664 = int(_1656) + 1;
    uint _1666 = uint(int(uint(_1664) >> uint(2)));
    int _1668 = _1664 & 3;
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[int(_1666)][_1668];
    float _1672 = fma(_1412, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1638);
    float _1674 = -_1642;
    float _1676 = fma(_1634, 2.0, _1674);
    float _1678 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1680 = _1450 + _1678;
    float _1682 = fma(_1598, _1494, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1684 = fma(_1592, _1494, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1686 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1688 = _1548 + _1686;
    float _1690 = float(_1344);
    uint _1692 = uint(int(uint(_1652) >> uint(2)));
    uint _1694 = uint(int(uint(int(_1692)) >> uint(2)));
    int _1696 = int(_1692) & 3;
    float _1698 = (*spvDescriptorSet0.vp_c9)._m0[int(_1694)][_1696];
    int _1700 = int(_1692) + 1;
    uint _1702 = uint(int(uint(_1700) >> uint(2)));
    int _1704 = _1700 & 3;
    float _1706 = (*spvDescriptorSet0.vp_c9)._m0[int(_1702)][_1704];
    float _1708 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1710 = float(_1562);
    float _1712 = -_143;
    float _1714 = fma(_1712, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1676);
    int _1716 = ~_1352;
    int _1718 = _1716 + _1482;
    int _1720 = _1718 + 1;
    float _1722 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1708);
    float _1724 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1672);
    float _1726 = -_1654;
    float _1728 = _1726 + 1.0;
    int _1730 = _1646 + 8;
    uint _1732 = uint(int(uint(_1730) >> uint(2)));
    uint _1734 = uint(int(uint(int(_1732)) >> uint(2)));
    int _1736 = int(_1732) & 3;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[int(_1734)][_1736];
    int _1740 = int(_1732) + 1;
    uint _1742 = uint(int(uint(_1740) >> uint(2)));
    int _1744 = _1740 & 3;
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[int(_1742)][_1744];
    float _1748 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[78].z, _491);
    float _1750 = _1710 * _1690;
    int _1752 = abs(_1112);
    float _1754 = fma(_1302, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1714);
    float _1756 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1748);
    float _1758 = _1750 * (-2.0);
    bool _1760 = !_1064;
    int _1762 = _1760 ? 0 : 1;
    int _1764 = _1652 + 8;
    uint _1766 = uint(int(uint(_1764) >> uint(2)));
    uint _1768 = uint(int(uint(int(_1766)) >> uint(2)));
    int _1770 = int(_1766) & 3;
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[int(_1768)][_1770];
    int _1774 = int(_1766) + 1;
    uint _1776 = uint(int(uint(_1774) >> uint(2)));
    int _1778 = _1774 & 3;
    float _1780 = (*spvDescriptorSet0.vp_c9)._m0[int(_1776)][_1778];
    int _1782 = ~_1364;
    int _1784 = _1782 + _1448;
    int _1786 = _1784 + 1;
    float _1788 = fma(_1586, _1758, _1586);
    int _1790 = abs(_1178);
    float _1792 = in.m_66.x;
    float _1794 = in.m_66.y;
    float _1796 = in.m_66.z;
    float _1798 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1800 = _1560 + _1798;
    int _1802 = abs(_1166);
    int _1804 = _495 * _1720;
    int _1806 = _1804 + _748;
    int _1808 = abs(_1762);
    float _1810 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1722);
    int _1812 = ~_1752;
    int _1814 = _1812 + 1;
    int _1816 = _1814 + 1;
    int _1818 = _547 * _1786;
    int _1820 = _1818 + _834;
    bool _1822 = !_1120;
    int _1824 = _1822 ? 0 : 1;
    float _1826 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1578);
    int _1828 = ~_1790;
    int _1830 = _1828 + 1;
    int _1832 = _1830 + 1;
    float _1834 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1568);
    int _1836 = ~_1808;
    int _1838 = _1836 + 1;
    int _1840 = _1838 + 1;
    int _1842 = abs(_1824);
    float _1844 = -_1354;
    float _1846 = -_1834;
    float _1848 = fma(_1844, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1846);
    bool _1850 = _1062 != 3;
    int _1852 = _1816 * as_type<int>(_1670);
    int _1854 = abs(_1222);
    int _1856 = ~_1802;
    int _1858 = _1856 + 1;
    int _1860 = _1858 + 1;
    int _1862 = _1840 * as_type<int>(_1662);
    int _1864 = _1862 + _1852;
    bool _1866 = !_1850;
    int _1868 = _1866 ? 0 : (-1);
    float _1870 = fma(_1758, _1794, _1794);
    bool _1872 = _1118 != 3;
    int _1874 = _1832 * as_type<int>(_1706);
    int _1876 = ~_1842;
    int _1878 = _1876 + 1;
    int _1880 = _1878 + 1;
    int _1882 = abs(_1868);
    bool _1884 = _495 == 0;
    int _1886 = _1880 * as_type<int>(_1698);
    int _1888 = _1886 + _1874;
    bool _1890 = !_1872;
    int _1892 = _1890 ? 0 : (-1);
    int _1894 = _1860 * as_type<int>(_1738);
    int _1896 = _1894 + _1864;
    bool _1898 = !_1466;
    int _1900 = _1898 ? 0 : 1;
    int _1902 = abs(_1892);
    int _1904 = abs(_1900);
    int _1906 = ~_1854;
    int _1908 = _1906 + 1;
    int _1910 = _1908 + 1;
    int _1912 = ~_1902;
    int _1914 = _1912 + 1;
    int _1916 = _1914 + 1;
    bool _1918 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1920 = isnan(0.0);
    bool _1922 = _1918 || _1920;
    bool _1924 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1926 = _1922 || _1924;
    int _1928 = _1910 * as_type<int>(_1772);
    int _1930 = _1928 + _1888;
    int _1932 = ~_1882;
    int _1934 = _1932 + 1;
    int _1936 = _1934 + 1;
    float _1938 = -_1724;
    float _1940 = _1938 + 1.0;
    int _1942 = _1916 * as_type<int>(_1780);
    int _1944 = _1942 + _1930;
    float _1946 = _1680 * _1680;
    float _1948 = _1648 * (-2.0);
    int _1950 = abs(_1186);
    int _1952 = _1936 * as_type<int>(_1746);
    int _1954 = _1952 + _1896;
    float _1956 = fma(_1688, _1688, _1946);
    float _1958 = fma(_1538, _1948, _1538);
    float _1960 = fma(_1948, _1796, _1796);
    float _1962 = _1926 ? _1728 : 0.0;
    float _1964 = fma(_1800, _1800, _1956);
    bool _1966 = _1810 >= 0.0;
    float _1968 = -_1826;
    float _1970 = _1968 + 1.0;
    int _1972 = ~_1904;
    int _1974 = _1972 + 1;
    int _1976 = _1974 + 1;
    float _1978 = -_1940;
    float _1980 = fma(_1288, _1978, _1754);
    int _1982 = ~_1950;
    int _1984 = _1982 + 1;
    int _1986 = _1984 + 1;
    float _1988 = rsqrt(_1964);
    bool _1990 = _547 == 0;
    int _1992 = _1944 * _1976;
    bool _1994 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1996 = isnan(1.0);
    bool _1998 = _1994 || _1996;
    bool _2000 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2002 = _1998 || _2000;
    int _2004 = _1954 * _1986;
    bool _2006 = !_1990;
    float _2008 = _2006 ? as_type<float>(_1820) : as_type<float>(0xffffffffu /* nan */);
    float _2010 = fma(_1544, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1870);
    bool _2012 = !_1884;
    int _2014 = _2012 ? _1806 : (-1);
    float _2016 = fma(_1348, _1970, _1848);
    float _2018 = _2008;
    if (_1966)
    {
        out.m_47.x = 0.0;
    }
    int _2020 = as_type<int>(_2008) * _1904;
    int _2022 = _2020 + _1992;
    float _2024 = -_561;
    float _2026 = _2024 + 1.0;
    int _2028 = _2014 * _1950;
    int _2030 = _2028 + _2004;
    if (_1966)
    {
        _2018 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2032 = _2018;
    float _2034 = -_1756;
    float _2036 = _2034 + 1.0;
    float _2038 = fma(_1280, _2026, _1632);
    int _2040 = as_type<int>(_2032);
    if (_2002)
    {
        float _2042 = _1962 * _598;
        _147 = _2042;
    }
    float _2044 = _147;
    float _2046 = -_2036;
    float _2048 = fma(_1240, _2046, _1620);
    if (_1966)
    {
        float _2050 = _2032 * 5.0;
        _2040 = as_type<int>(_2050);
    }
    int _2052 = _2040;
    float _2054 = float(_2030);
    float _2056 = _1680 * _1988;
    float _2058 = float(_2022);
    float _2060 = fma(_1788, _2044, _2010);
    float _2062 = _1688 * _1988;
    float _2064 = -_2056;
    float _2066 = fma(_2064, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1680);
    float _2068 = _2056;
    if (_1966)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6416 = as_type<float>(_2052);
        out.gl_Position.z = _6416;
    }
    bool _2070 = !_1454;
    int _2072 = _2070 ? 0 : 1;
    float _2074 = -_2062;
    float _2076 = fma(_2074, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1688);
    float _2078 = _2066 * _2066;
    out.m_68.x = _2048;
    out.m_68.y = _2038;
    out.m_68.z = _1980;
    out.m_68.w = _2016;
    out.m_70.x = _2054;
    out.m_70.y = _2058;
    if (_1966)
    {
        return out;
    }
    float _2080 = -_2056;
    float _2082 = fma(_2080, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1450);
    float _2084 = -_2062;
    float _2086 = fma(_2084, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1548);
    bool _2088 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _2090 = isnan(_473);
    bool _2092 = _2088 || _2090;
    bool _2094 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _2096 = _2092 || _2094;
    float _2098 = float(_2096);
    float _2100 = _1800 * _1988;
    float _2102 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2104 = _2082 + _2102;
    float _2106 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2108 = _2086 + _2106;
    float _2110 = float(_1576);
    float _2112 = -_2098;
    float _2114 = _2112 + 1.0;
    float _2116 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _2118 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _2120 = isnan(_473);
    bool _2122 = _2118 || _2120;
    bool _2124 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _2126 = _2122 || _2124;
    float _2128 = float(_2126);
    float _2130 = _129 + (-0.5);
    bool _2132 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _2134 = isnan(_473);
    bool _2136 = _2132 || _2134;
    bool _2138 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _2140 = _2136 || _2138;
    float _2142 = float(_2140);
    float _2144 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2116);
    int _2146 = abs(_2072);
    float _2148 = _2128 * _2114;
    float _2150 = -_2100;
    float _2152 = fma(_2150, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1560);
    float _2154 = -_2128;
    float _2156 = _2154 + 1.0;
    float _2158 = _1172 + (-0.5);
    float _2160 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2162 = _2152 + _2160;
    float _2164 = _2142 * _2156;
    float _2166 = float(_2146);
    float _2168 = fma(_2158, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1960);
    float _2170 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2144);
    float _2172 = _1682 * _2164;
    float _2174 = -_2142;
    float _2176 = _2174 + 1.0;
    float _2178 = _2166 * _2110;
    float _2180 = fma(_1958, _2044, _2168);
    bool _2182 = _2170 >= 0.0;
    float _2184 = fma(_2076, _2076, _2078);
    float _2186 = _2178 * (-2.0);
    float _2188 = -_2100;
    float _2190 = fma(_2188, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1800);
    float _2192 = in.m_58.x;
    float _2194 = in.m_58.y;
    float _2196 = fma(_2176, (*spvDescriptorSet0.vp_c9)._m0[143].x, _2172);
    float _2198 = fma(_2186, _1792, _1792);
    float _2200 = fma(_1540, _2186, _1540);
    float _2202 = fma(_2190, _2190, _2184);
    float _2204 = _2060 * 0.15915493667125701904296875;
    float _2206 = fma(_2130, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2198);
    float _2208 = _1684 * _2164;
    float _2210 = _2180 * 0.15915493667125701904296875;
    float _2212 = fma(_1618, _2148, _2196);
    float _2214 = fma(_2200, _2044, _2206);
    float _2216 = _2180;
    if (_2182)
    {
        _2216 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2218 = _2216;
    float _2220 = sqrt(_2202);
    float _2222 = fma(_2176, (*spvDescriptorSet0.vp_c9)._m0[143].y, _2208);
    float _2224 = _2214 * 0.15915493667125701904296875;
    int _2226 = as_type<int>(_2218);
    if (_2182)
    {
        float _2228 = _2218 * 5.0;
        _2226 = as_type<int>(_2228);
    }
    int _2230 = _2226;
    float _2232 = fma(_1614, _2148, _2222);
    if (_2182)
    {
        out.m_47.x = 0.0;
    }
    float _2234 = _2204 * 6.283185482025146484375;
    float _2236 = sin(_2234);
    float _2238 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[145].y, _2232);
    if (_2182)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6704 = as_type<float>(_2230);
        out.gl_Position.z = _6704;
    }
    float _2240 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[145].x, _2212);
    float _2242 = _2238 * _2194;
    float _2244 = _2204 * 6.283185482025146484375;
    float _2246 = cos(_2244);
    float _2248 = _2210 * 6.283185482025146484375;
    float _2250 = sin(_2248);
    float _2252 = _2210 * 6.283185482025146484375;
    float _2254 = cos(_2252);
    float _2256 = _2224 * 6.283185482025146484375;
    float _2258 = sin(_2256);
    if (_2182)
    {
        return out;
    }
    float _2260 = _2224 * 6.283185482025146484375;
    float _2262 = cos(_2260);
    float _2264 = _1988 * _2220;
    float _2266 = _2242 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2268 = _2240 * _2192;
    float _2270 = _2246 * _2254;
    float _2272 = _2236 * _2250;
    float _2274 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _241);
    float _2276 = _2264 * _2266;
    float _2278 = _2268 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2280 = fma(_2258, _2272, _2270);
    float _2282 = fma(_2258, _2270, _2272);
    float _2284 = _2274 * _2276;
    float _2286 = _2236 * _2254;
    float _2288 = _2246 * _2250;
    float _2290 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _237);
    float _2292 = _2278 * _2264;
    float _2294 = _2254 * _2262;
    float _2296 = _2250 * _2262;
    float _2298 = -_2288;
    float _2300 = fma(_2258, _2286, _2298);
    float _2302 = _2292 * _2290;
    float _2304 = _2294 * _2284;
    float _2306 = -_2286;
    float _2308 = fma(_2258, _2288, _2306);
    float _2310 = _2264 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2312 = _2310 * 0.5;
    float _2314 = _2300 * _2284;
    float _2316 = fma(_2296, _2302, _2304);
    float _2318 = _2282 * _2284;
    float _2320 = _2236 * _2262;
    float _2322 = fma(_2280, _2302, _2314);
    float _2324 = -_2258;
    float _2326 = fma(_2324, _2312, _2316);
    float _2328 = _2246 * _2262;
    float _2330 = fma(_2308, _2302, _2318);
    float _2332 = fma(_2320, _2312, _2322);
    float _2334 = _2326 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2336 = _2326 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2338 = fma(_2328, _2312, _2330);
    float _2340 = fma(_2332, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2334);
    float _2342 = fma(_2332, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2336);
    float _2344 = fma(_2338, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2340);
    float _2346 = fma(_2338, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2342);
    float _2348 = _2344 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2350 = _2346 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2352 = _1560 + _2348;
    float _2354 = _1548 + _2350;
    float _2356 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2358 = _2352 + _2356;
    float _2360 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2362 = _2354 + _2360;
    float _2364 = _2358 * _2358;
    float _2366 = fma(_2362, _2362, _2364);
    float _2368 = _2326 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2370 = sqrt(_2366);
    float _2372 = fma(_2332, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2368);
    float _2374 = fma(_2338, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2372);
    float _2376 = _2374 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2378 = _1450 + _2376;
    bool _2380 = _2370 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2382 = _2376;
    float _2384 = _2354;
    float _2386 = _2352;
    float _2388 = _2326;
    if (!_2380)
    {
        _2382 = _2378;
    }
    float _2390 = _2382;
    bool _2392 = !_2380;
    float _2394 = _2390;
    if (!_2392)
    {
        float _2396 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2398 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2400 = _2370 + _2398;
        float _2402 = _2378 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2404 = rsqrt(_2366);
        float _2406 = _2400 * _2396;
        float _2408 = _2406 * 0.15915493667125701904296875;
        float _2410 = _2408 * 6.283185482025146484375;
        float _2412 = sin(_2410);
        float _2414 = _2408 * 6.283185482025146484375;
        float _2416 = cos(_2414);
        float _2418 = fma(_2412, _2402, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2420 = _2404 * _2418;
        float _2422 = _2416 + (-1.0);
        float _2424 = fma(_2362, _2420, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2426 = fma(_2358, _2420, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2428 = _2422 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2430 = fma(_2378, _2416, _2428);
        _2394 = _2430;
        _2384 = _2424;
        _2386 = _2426;
    }
    float _2432 = _2394;
    float _2434 = _2384;
    float _2436 = _2386;
    float _2438 = -_2056;
    float _2440 = fma(_2438, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2432);
    float _2442 = -_2062;
    float _2444 = fma(_2442, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2434);
    float _2446 = -_2100;
    float _2448 = fma(_2446, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2436);
    float _2450 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2452 = _2440 + _2450;
    float _2454 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2456 = _2444 + _2454;
    float _2458 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2460 = _2448 + _2458;
    float _2462 = _2452 * _2452;
    float _2464 = fma(_2456, _2456, _2462);
    float _2466 = fma(_2460, _2460, _2464);
    float _2468 = rsqrt(_2466);
    float _2470 = sqrt(_2466);
    float _2472 = _2468 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2474 = _2456 * _2472;
    float _2476 = _2460 * _2472;
    float _2478 = _2474 * _2474;
    float _2480 = _2476 * _2476;
    float _2482 = _2478 + _2480;
    float _2484 = sqrt(_2482);
    bool _2486 = _2484 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2488 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2490 = _2484 + _2488;
    float _2492 = _2460;
    float _2494 = _2482;
    float _2496 = _2490;
    float _2498 = _2452;
    if (_2486)
    {
        float _2500 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2492 = _2500;
    }
    float _2502 = _2492;
    if (_2486)
    {
        float _2504 = rsqrt(_2482);
        _2494 = _2504;
    }
    float _2506 = _2494;
    float _2508 = _2506;
    if (_2486)
    {
        float _2510 = _2490 * _2502;
        _2496 = _2510;
    }
    float _2512 = _2496;
    if (_2486)
    {
        float _2514 = _2512 * 0.15915493667125701904296875;
        _2388 = _2514;
    }
    float _2516 = _2388;
    float _2518 = _2502;
    float _2520 = _2516;
    if (_2486)
    {
        float _2522 = _2516 * 6.283185482025146484375;
        float _2524 = sin(_2522);
        _2518 = _2524;
    }
    float _2526 = _2518;
    float _2528 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2530 = precise::max(0.0, _2528);
    float _2532 = _2462;
    float _2534 = _2530;
    if (_2486)
    {
        float _2536 = _2516 * 6.283185482025146484375;
        float _2538 = cos(_2536);
        _2532 = _2538;
    }
    float _2540 = _2532;
    float _2542 = -_2472;
    float _2544 = -_2530;
    float _2546 = fma(_2452, _2542, _2544);
    if (!_2486)
    {
        _2498 = _2474;
    }
    float _2548 = _2498;
    float _2550 = _2548;
    if (_2486)
    {
        float _2552 = _2546 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2534 = _2552;
    }
    float _2554 = _2534;
    float _2556 = _2526;
    float _2558 = _2554;
    if (_2486)
    {
        float _2560 = fma(_2526, _2554, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2556 = _2560;
    }
    float _2562 = _2556;
    float _2564 = _2562;
    float _2566 = _2540;
    if (_2486)
    {
        float _2568 = _2540 + (-1.0);
        _2558 = _2568;
    }
    float _2570 = _2558;
    float _2572 = _2570;
    if (_2486)
    {
        float _2574 = _2506 * _2562;
        _2068 = _2574;
    }
    float _2576 = _2068;
    if (!_2486)
    {
        _2564 = _2546;
    }
    float _2578 = _2564;
    float _2580 = _2578;
    if (_2486)
    {
        float _2582 = _2570 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2520 = _2582;
    }
    float _2584 = _2520;
    if (_2486)
    {
        float _2586 = _2474 * _2576;
        _2550 = _2586;
    }
    float _2588 = _2550;
    if (!_2486)
    {
        _2572 = _2476;
    }
    float _2590 = _2572;
    float _2592 = _2590;
    if (_2486)
    {
        float _2594 = _2476 * _2576;
        _2592 = _2594;
    }
    float _2596 = _2592;
    if (!_2486)
    {
        _2508 = _2478;
    }
    float _2598 = _2508;
    float _2600 = _2598;
    if (_2486)
    {
        float _2602 = fma(_2546, _2540, _2584);
        _2580 = _2602;
    }
    float _2604 = _2580;
    if (_2486)
    {
        float _2606 = _2588 * _2588;
        _2600 = _2606;
    }
    float _2608 = _2600;
    if (!_2486)
    {
        _2566 = _2480;
    }
    float _2610 = _2566;
    float _2612 = _2610;
    if (_2486)
    {
        float _2614 = _2596 * _2596;
        _2612 = _2614;
    }
    float _2616 = _2612;
    float _2618 = fma(_2604, _2604, _2608);
    float _2620 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2622 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2624 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2626 = _2618 + _2616;
    float _2628 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2620);
    float _2630 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2632 = fma(_2470, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2630);
    float _2634 = precise::clamp(_2632, 0.0, 1.0);
    float _2636 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2638 = rsqrt(_2626);
    float _2640 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2628);
    float _2642 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2644 = -_2634;
    float _2646 = _2644 + 1.0;
    float _2648 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2636);
    float _2650 = _2640 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2652 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2642);
    float _2654 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2624);
    float _2656 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2648);
    float _2658 = _2650 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2660 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2652);
    float _2662 = abs(_2646);
    float _2664 = log2(_2662);
    float _2666 = _2656 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2668 = -_2658;
    float _2670 = fma(_2668, _2622, 1.0);
    float _2672 = _2660 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2674 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2654);
    float _2676 = _2638 * _2588;
    float _2678 = _2666 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2680 = _2638 * _2604;
    float _2682 = _2638 * _2596;
    float _2684 = _2676 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2686 = fma(_2672, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2678);
    float _2688 = _2674 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2690 = log2(_2670);
    float _2692 = -_2684;
    float _2694 = fma(_2680, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2692);
    float _2696 = fma(_2650, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2686);
    float _2698 = _2680 + 1.0;
    float _2700 = _2664 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2702 = -_2682;
    float _2704 = fma(_2702, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2694);
    float _2706 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2696);
    float _2708 = _2666 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2710 = _2666 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2712 = fma(_2704, -0.5, 0.5);
    float _2714 = 1.0 / _2706;
    float _2716 = fma(_2704, 0.5, 0.5);
    float _2718 = fma(_2672, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2708);
    float _2720 = fma(_2672, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2710);
    float _2722 = fma(_2716, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2724 = fma(_2650, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2718);
    float _2726 = fma(_2650, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2720);
    float _2728 = sqrt(_2712);
    float _2730 = fma(_2716, _2722, -0.212114393711090087890625);
    float _2732 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2724);
    float _2734 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2726);
    float _2736 = _2690 * 0.693147182464599609375;
    float _2738 = fma(_2716, _2730, 1.570728778839111328125);
    float _2740 = exp2(_2700);
    float _2742 = _2732 * _2714;
    float _2744 = _2734 * _2714;
    float _2746 = _2736 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2748 = fma(_2742, 0.5, 0.5);
    float _2750 = fma(_2744, -0.5, 0.5);
    float _2752 = _2728 * 0.636619746685028076171875;
    float3 _7559 = float3(_2748, _2750, _2746);
    float _2754 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7559, float3(0.0), isnan(_7559)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7559, float3(0.0), isnan(_7559)), level(0.0)).x;
    float _2756 = -_2738;
    float _2758 = fma(_2752, _2756, 1.0);
    float _2760 = -_2680;
    float _2762 = fma(_2740, _2698, _2760);
    float _2764 = fma(_2762, 0.5, 0.5);
    float3 _7583 = float3(_2748, _2750, _2746);
    float4 _2767 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7583, float3(0.0), isnan(_7583)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7583, float3(0.0), isnan(_7583)), level(0.0)).xyzw;
    float _2769 = _2767.x;
    float _2771 = _2767.y;
    float _2773 = _2767.z;
    float _2775 = _2767.w;
    float2 _7600 = float2(_2758, _2764);
    float3 _2779 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7600, float2(0.0), isnan(_7600)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7600, float2(0.0), isnan(_7600)), level(0.0)).xyz;
    float _2781 = _2779.x;
    float _2783 = _2779.y;
    float _2785 = _2779.z;
    float _2787 = -(*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2789 = _2258 * _2787;
    float _2791 = -(*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2793 = _2258 * _2791;
    float _2795 = -(*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2797 = _2258 * _2795;
    float _2799 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2801 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2803 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2805 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2807 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2799);
    float _2809 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2801);
    float _2811 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2789);
    float _2813 = _241 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2815 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2803);
    float _2817 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2805);
    float _2819 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2793);
    float _2821 = fma(_2813, _2813, 1.0);
    float _2823 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2797);
    float _2825 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2807);
    float _2827 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2809);
    float _2829 = rsqrt(_2821);
    float _2831 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2815);
    float _2833 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2817);
    float _2835 = _2296 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2837 = _2296 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2839 = _2296 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2841 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2843 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2845 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2847 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2835);
    float _2849 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2837);
    float _2851 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2839);
    float _2853 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2841);
    float _2855 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2843);
    float _2857 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2845);
    float _2859 = fma(_2328, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2819);
    float _2861 = fma(_2328, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2811);
    float _2863 = _2813 * _2829;
    float _2865 = fma(_2328, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2823);
    float _2867 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2847);
    float _2869 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2849);
    float _2871 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2851);
    float _2873 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2853);
    float _2875 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2855);
    float _2877 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2857);
    float _2879 = -_2861;
    float _2881 = _2863 * _2879;
    float _2883 = _2827 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2885 = -_2865;
    float _2887 = _2863 * _2885;
    float _2889 = -_2859;
    float _2891 = _2863 * _2889;
    float _2893 = _2813 * _2873;
    float _2895 = fma(_2829, _2875, _2881);
    float _2897 = _2813 * _2875;
    float _2899 = _2813 * _2877;
    float _2901 = _237 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2903 = fma(_2829, _2877, _2887);
    float _2905 = _2825 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2907 = _2883 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2909 = _2883 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2911 = _2883 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2913 = fma(_2829, _2873, _2891);
    float _2915 = _2883 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2917 = fma(_2901, _2867, _2893);
    float _2919 = fma(_2905, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2907);
    float _2921 = -_443;
    float _2923 = _2921 + _2440;
    float _2925 = fma(_2905, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2909);
    float _2927 = fma(_2905, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2911);
    float _2929 = fma(_2905, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2915);
    out.m_72.x = _2867;
    out.m_72.y = _2869;
    out.m_72.z = _2871;
    float _2931 = fma(_2901, _2869, _2897);
    float _2933 = _2923 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _2935 = -_441;
    float _2937 = _2935 + _2444;
    float _2939 = fma(_2901, _2871, _2899);
    float _2941 = _2831 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2943 = _2666 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2945 = -_445;
    float _2947 = _2945 + _2448;
    float _2949 = fma(_2937, (*spvDescriptorSet0.vp_c15)._m0[638].x, _2933);
    float _2951 = _2941 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _2953 = fma(_2672, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2943);
    float _2955 = fma(_2941, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2927);
    float _2957 = _2923 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _2959 = _2923 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _2961 = fma(_2947, (*spvDescriptorSet0.vp_c15)._m0[638].z, _2949);
    float _2963 = _2951 + _2929;
    float _2965 = fma(_2937, (*spvDescriptorSet0.vp_c15)._m0[635].x, _2957);
    float _2967 = fma(_2937, (*spvDescriptorSet0.vp_c15)._m0[636].x, _2959);
    float _2969 = _2833 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2971 = fma(_2650, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2953);
    float _2973 = fma(_2947, (*spvDescriptorSet0.vp_c15)._m0[635].z, _2965);
    float _2975 = fma(_2947, (*spvDescriptorSet0.vp_c15)._m0[636].z, _2967);
    float _2977 = _2664 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2979 = fma(_2969, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2963);
    float _2981 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2971);
    float _2983 = _2961 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _2985 = fma(_2969, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2955);
    float _2987 = 1.0 / _2979;
    out.m_74.x = _2913;
    out.m_74.y = _2895;
    out.m_74.z = _2903;
    float _2989 = _2981 + _2706;
    float _2991 = _2941 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    out.gl_Position.x = _2732;
    out.gl_Position.y = _2734;
    out.gl_Position.z = _2981;
    out.gl_Position.w = _2706;
    float _2993 = _2989 * 0.5;
    float _2995 = _2941 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _2997 = exp2(_2977);
    out.m_76.y = 1.0;
    float _2999 = _2975 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _3001 = _2995 + _2925;
    float _3003 = _2973 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _3005 = _2732 + _2706;
    float _3007 = _2706 * 0.5;
    float _3009 = 1.0 / _2983;
    float _3011 = _2985 * _2987;
    float _3013 = _3005 * 0.5;
    float _3015 = fma(_2734, -0.5, _3007);
    float _3017 = _2859 + _2917;
    float _3019 = _2865 + _2939;
    bool _3021 = _3011 > 0.0;
    out.m_78.x = _2444;
    out.m_78.y = _2440;
    out.m_78.z = _2448;
    float _3023 = -_2997;
    float _3025 = _3023 + 1.0;
    float _3027 = fma(_2969, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3001);
    bool _3029 = _3011 < 1.0;
    bool _3031 = _3029 && _3021;
    out.m_80.x = _3013;
    out.m_80.y = _3015;
    out.m_80.z = _2993;
    out.m_80.w = _2706;
    float _3033 = _3025 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3035 = _3027 * _2987;
    bool _3037 = _2742 > (-1.0);
    bool _3039 = _3037 && _3031;
    float _3041 = -_3033;
    float _3043 = _3041 + 1.0;
    float _3045 = _3003 * _3009;
    float _3047 = _2861 + _2931;
    bool _3049 = _2744 > (-1.0);
    bool _3051 = _3049 && _3039;
    float _3053 = _2991 + _2919;
    float _3055 = _2999 * _3009;
    out.m_82.x = _3017;
    out.m_82.y = _3047;
    out.m_82.z = _3019;
    bool _3057 = _2742 < 1.0;
    bool _3059 = _3057 && _3051;
    float _3061 = fma(_2969, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3053);
    bool _3063 = _2744 < 1.0;
    bool _3065 = _3063 && _3059;
    float _3067 = _3061 * _2987;
    float _3069 = _3033 * _2754;
    float _3071 = _2775 * _3069;
    float _3073 = _2775 * _3043;
    float _3075 = _2785 * _3069;
    float _3077 = fma(_2781, _3071, _2769);
    float _3079 = fma(_2783, _3071, _2771);
    float _3081 = fma(_2775, _3075, _2773);
    out.m_84.x = _3077;
    out.m_84.y = _3079;
    out.m_84.z = _3081;
    out.m_84.w = _3073;
    bool _3083 = !_3065;
    float _3085 = _3079;
    float _3087 = _2732;
    float _3089 = _3077;
    float _3091 = _2734;
    float _3093 = _2706;
    float _3119;
    float _3121;
    float _3129;
    if (!_3083)
    {
        float _3095 = -_3035;
        float _3097 = _2744 + _3095;
        float _3099 = -_3067;
        float _3101 = _2742 + _3099;
        float _3103 = -_3045;
        float _3105 = _2742 + _3103;
        float _3107 = -_3055;
        float _3109 = _2744 + _3107;
        float _3111 = _3097 * _3097;
        float _3113 = fma(_3101, _3101, _3111);
        float _3115 = sqrt(_3113);
        bool _3117 = _3115 > 0.0;
        _3119 = _3113;
        _3121 = _3115;
        if (!_3117)
        {
            _3085 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _3123 = _3085;
        bool _3125 = !_3117;
        float _3127 = _3123;
        _3129 = _3123;
        _3131 = _3125;
        if (!_3131)
        {
            float _3133 = _3109 * _3109;
            float _3135 = fma(_3105, _3105, _3133);
            float _3137 = rsqrt(_3113);
            float _3139 = sqrt(_3135);
            float _3141 = _3101 * _3137;
            float _3143 = _3097 * _3137;
            bool _3145 = _3139 > 0.0;
            _3089 = _3139;
            _3121 = _3137;
            if (!_3145)
            {
                _3127 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
            }
            float _3147 = _3127;
            bool _3149 = !_3145;
            _3129 = _3147;
            _3131 = _3149;
            if (!_3131)
            {
                float _3151 = _2292 * _2969;
                float _3153 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
                float _3155 = fma(_3151, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2951);
                float _3157 = fma(_3151, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2991);
                float _3159 = fma(_3151, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2995);
                float _3161 = fma(_2969, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3155);
                float _3163 = fma(_2969, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3159);
                float _3165 = fma(_2969, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3157);
                float _3167 = 1.0 / _3161;
                float _3169 = _3153 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _3171 = _3109 * _3169;
                float _3173 = _3105 * _3169;
                float _3175 = rsqrt(_3135);
                float _3177 = _3171 * _3171;
                float _3179 = fma(_3173, _3173, _3177);
                float _3181 = _3163 * _3167;
                float _3183 = _3165 * _3167;
                float _3185 = _3181 * _3181;
                float _3187 = sqrt(_3179);
                float _3189 = fma(_3183, _3183, _3185);
                float _3191 = _3109 * _3175;
                float _3193 = _3105 * _3175;
                float _3195 = sqrt(_3189);
                float _3197 = _3143 * _3191;
                float _3199 = fma(_3141, _3193, _3197);
                float _3201 = precise::min(0.0, _3199);
                float _3203 = _2706 * _3201;
                float _3205 = fma(_3187, (*spvDescriptorSet0.vp_c13)._m0[1].x, _3195);
                float _3207 = fma(_3173, _3203, _2732);
                float _3209 = 1.0 / _3205;
                float _3211 = fma(_3171, _3203, _2734);
                out.gl_Position.x = _3207;
                out.gl_Position.y = _3211;
                float _3213 = _3195 * _3209;
                out.m_76.y = _3213;
                _3087 = _3207;
                _3089 = _3171;
                _3091 = _3211;
                _3119 = _3203;
                _3121 = _3199;
                _3129 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
                _3131 = true;
            }
        }
    }
    else
    {
        float _3215 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _3215;
        _3087 = 0.0;
        _3091 = 0.0;
        _3119 = _3215;
        _3121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
        _3129 = 0.0;
    }
    _3131 = false;
    float _3217 = _3087;
    float _3219 = _3089;
    float _3221 = _3091;
    float _3223 = _3119;
    float _3225 = _3121;
    float _3227 = _3129;
    bool _3229 = _2470 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3231 = isnan(_2470);
    bool _3233 = _3229 || _3231;
    bool _3235 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3237 = _3233 || _3235;
    float _3239 = _3219;
    float _3241 = _3223;
    float _3243 = _3221;
    float _3245 = _3217;
    float _3247 = _3225;
    if (!_3237)
    {
        _3239 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3249 = _3239;
    float _3251 = _3249;
    float _3253 = _3249;
    if (!_3237)
    {
        _3093 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3255 = _3093;
    float _3257 = _3255;
    float _3259 = _3255;
    if (!_3237)
    {
        _3241 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3261 = _3241;
    float _3263 = _3261;
    float _3265 = _3261;
    if (!_3237)
    {
        _3243 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3267 = _3243;
    float _3269 = _3267;
    float _3271 = _3267;
    if (!_3237)
    {
        _3245 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3273 = _3245;
    float _3275 = _3273;
    float _3277 = _3273;
    if (!_3237)
    {
        _3247 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3279 = _3247;
    bool _3281 = !_3237;
    float _3283 = _3279;
    float _3285 = _3279;
    if (!_3281)
    {
        bool _3287 = _2470 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3289 = isnan(_2470);
        bool _3291 = _3287 || _3289;
        bool _3293 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3295 = _3291 || _3293;
        if (!_3295)
        {
            float _3297 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3299 = _2470 + _3297;
            float _3301 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3303 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3301;
            float _3305 = 1.0 / _3303;
            float _3307 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3309 = _3307 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3311 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3313 = _3311 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3315 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3317 = _3315 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3319 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3321 = _3319 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3323 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3325 = _3323 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3327 = _3299 * _3305;
            float _3329 = precise::clamp(_3327, 0.0, 1.0);
            float _3331 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3333 = _3331 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3335 = fma(_3329, _3309, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3337 = fma(_3329, _3333, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3339 = fma(_3329, _3313, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3341 = fma(_3329, _3317, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3343 = fma(_3329, _3321, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3345 = fma(_3329, _3325, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3259 = _3337;
            _3277 = _3343;
            _3253 = _3335;
            _3271 = _3341;
            _3265 = _3339;
            _3285 = _3345;
            _3347 = true;
        }
        else
        {
            bool _3349 = _2470 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3351 = isnan(_2470);
            bool _3353 = _3349 || _3351;
            bool _3355 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3357 = _3353 || _3355;
            if (!_3357)
            {
                _3251 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3359 = _3251;
            _3253 = _3359;
            if (!_3357)
            {
                _3257 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3361 = _3257;
            _3259 = _3361;
            if (!_3357)
            {
                _3263 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3363 = _3263;
            _3265 = _3363;
            if (!_3357)
            {
                _3269 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3365 = _3269;
            _3271 = _3365;
            if (!_3357)
            {
                _3275 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3367 = _3275;
            _3277 = _3367;
            if (!_3357)
            {
                _3283 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3369 = _3283;
            bool _3371 = !_3357;
            _3285 = _3369;
            if (!_3371)
            {
                bool _3373 = _2470 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3375 = isnan(_2470);
                bool _3377 = _3373 || _3375;
                bool _3379 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3381 = _3377 || _3379;
                if (!_3381)
                {
                    float _3383 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3385 = _2470 + _3383;
                    float _3387 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3389 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3387;
                    float _3391 = 1.0 / _3389;
                    float _3393 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3395 = _3393 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3397 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3399 = _3397 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3401 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3403 = _3401 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3405 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3407 = _3405 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3409 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3411 = _3409 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3413 = _3385 * _3391;
                    float _3415 = precise::clamp(_3413, 0.0, 1.0);
                    float _3417 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3419 = _3417 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3421 = fma(_3415, _3395, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3423 = fma(_3415, _3419, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3425 = fma(_3415, _3399, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3427 = fma(_3415, _3403, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3429 = fma(_3415, _3407, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3431 = fma(_3415, _3411, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3259 = _3423;
                    _3277 = _3429;
                    _3253 = _3421;
                    _3271 = _3427;
                    _3265 = _3425;
                    _3285 = _3431;
                    _3347 = true;
                }
                else
                {
                    _3259 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3277 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3253 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3271 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3265 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3285 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3347 = false;
    float _3433 = _3259;
    float _3435 = _3277;
    float _3437 = _3253;
    float _3439 = _3271;
    float _3441 = _3265;
    float _3443 = _3285;
    float _3445 = fma(_3047, -0.5, 0.5);
    float _3447 = precise::clamp(_3445, 0.0, 1.0);
    float _3449 = -_3433;
    float _3451 = _3449 + _3435;
    float _3453 = -_3437;
    float _3455 = _3453 + _3439;
    float _3457 = -_3441;
    float _3459 = _3457 + _3443;
    bool _3461 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3463 = fma(_3447, _3451, _3433);
    float _3465 = fma(_3447, _3455, _3437);
    float _3467 = fma(_3447, _3459, _3441);
    float _3469 = _3227 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3471 = _3463 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3473 = fma(_3465, 0.298911988735198974609375, _3471);
    out.m_76.w = _3469;
    float _3475 = fma(_3467, 0.114477999508380889892578125, _3473);
    float _3477 = -_3475;
    float _3479 = _3465 + _3477;
    float _3481 = -_3475;
    float _3483 = _3463 + _3481;
    float _3485 = -_3475;
    float _3487 = _3467 + _3485;
    out.m_86.x = 0.0;
    float _3489 = fma(_3479, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3475);
    float _3491 = fma(_3483, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3475);
    float _3493 = fma(_3487, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3475);
    out.m_88.x = _3489;
    out.m_88.y = _3491;
    out.m_88.z = _3493;
    if (!_3461)
    {
        return out;
    }
    float _3495 = -_2440;
    float _3497 = _3495 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3499 = -_2444;
    float _3501 = _3499 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3503 = -_2448;
    float _3505 = _3503 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3507 = _3497 * _3497;
    float _3509 = fma(_3501, _3501, _3507);
    float _3511 = fma(_3505, _3505, _3509);
    float _3513 = sqrt(_3511);
    float _3515 = rsqrt(_3511);
    float _3517 = -_3513;
    float _3519 = _3517 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3521 = _3519 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3523 = precise::clamp(_3521, 0.0, 1.0);
    float _3525 = _3501 * _3515;
    float _3527 = _3497 * _3515;
    float _3529 = abs(_3523);
    float _3531 = log2(_3529);
    float _3533 = _3505 * _3515;
    float _3535 = _3525 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3537 = _3047 * _3527;
    float _3539 = -_3527;
    float _3541 = -_3535;
    float _3543 = fma(_3539, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3541);
    float _3545 = fma(_3017, _3525, _3537);
    float _3547 = -_3533;
    float _3549 = fma(_3547, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3543);
    float _3551 = fma(_3019, _3533, _3545);
    float _3553 = precise::clamp(_3551, 0.0, 1.0);
    float _3555 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3557 = _3549 + _3555;
    float _3559 = _3531 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3561 = _3557 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3563 = precise::clamp(_3561, 0.0, 1.0);
    float _3565 = exp2(_3559);
    float _3567 = _3565 * _3563;
    float _3569 = _3553 * _3567;
    float _3571 = _3569 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3573 = _3569 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3575 = _3569 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _3571;
    out.m_86.y = _3573;
    out.m_86.z = _3575;
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3347 = false;
    bool _3131 = false;
    bool _465 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_44.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (!_111)
    {
        out.m_47.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3632 = as_type<float>(_123);
        out.gl_Position.z = _3632;
    }
    if (!_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _127 = in.m_49.w;
    float _129 = in.m_51.x;
    bool _131 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_127);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_127;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _129;
    float _145 = 0.0;
    float _147 = _143;
    if (_139)
    {
        float _149 = float(_107);
        _145 = _149;
    }
    float _151 = _145;
    bool _153 = _143 >= _151;
    bool _155 = !_139;
    bool _157 = _153 || _155;
    if (_157)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _117;
    if (_157)
    {
        out.m_47.x = 0.0;
    }
    if (_157)
    {
        float _161 = _159 * 5.0;
        _125 = as_type<int>(_161);
    }
    int _163 = _125;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3705 = as_type<float>(_163);
        out.gl_Position.z = _3705;
    }
    if (_157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    float _167 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _169 = in.m_58.w;
    bool _171 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _173 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _175 = _171 || _173;
    bool _177 = isnan(1.0);
    bool _179 = _175 || _177;
    float _181 = in.m_49.x;
    float _183 = in.m_49.y;
    float _185 = in.m_49.z;
    float _187 = in.m_44.x;
    float _189 = in.m_44.y;
    float _191 = in.m_44.z;
    float _193 = in.m_60.x;
    float _195 = in.m_60.y;
    float _197 = in.m_60.z;
    float _199 = 0.0;
    float _201 = _167;
    if (!_179)
    {
        float _203 = _167 * _167;
        float _205 = _203 * 0.5;
        _199 = _205;
    }
    float _207 = _199;
    float _209 = in.m_62.x;
    float _211 = in.m_62.y;
    float _213 = in.m_62.z;
    float _215 = _207;
    if (!_179)
    {
        float _217 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _215 = _217;
    }
    float _219 = _215;
    float _221 = in.m_64.x;
    float _223 = in.m_64.y;
    float _225 = in.m_64.z;
    int _227 = as_type<int>(_165) & 1;
    bool _229 = _227 != 0;
    int _231 = as_type<int>(_165) & 2;
    bool _233 = _231 != 0;
    bool _235 = !_229;
    float _237 = _235 ? (-0.5) : 0.5;
    bool _239 = !_233;
    float _241 = _239 ? (-0.5) : 0.5;
    bool _243 = !_179;
    float _245 = _219;
    float _247 = _223;
    if (!_243)
    {
        float _249 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = log2(_249);
        float _253 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _255 = _253 + 1.0;
        float _257 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _259 = _167 * _251;
        float _261 = 1.0 / _255;
        float _263 = _257 * 0.693147182464599609375;
        float _265 = exp2(_259);
        float _267 = 1.0 / _263;
        float _269 = _265 + (-1.0);
        float _271 = -_269;
        float _273 = fma(_271, _267, _167);
        float _275 = _273 * _261;
        float _277 = _275 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _245 = _277;
    }
    float _279 = _245;
    bool _281 = !_179;
    float _283 = _279;
    if (!_281)
    {
        float _285 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = log2(_285);
        float _289 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _291 = _289 + 1.0;
        float _293 = 1.0 / _291;
        float _295 = _167 * _287;
        float _297 = exp2(_295);
        float _299 = -_297;
        float _301 = _299 + 1.0;
        float _303 = _301 * _293;
        _201 = _303;
    }
    float _305 = _201;
    float _307 = _279 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _309 = _279 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _311 = _279 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _313 = _305;
    if (!_179)
    {
        float _315 = _143 * _143;
        float _317 = _315 * 0.5;
        _283 = _317;
    }
    float _319 = _283;
    float _321 = fma(_305, _181, _307);
    float _323 = fma(_305, _183, _309);
    float _325 = fma(_305, _185, _311);
    if (!_179)
    {
        float _327 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _313 = _327;
    }
    float _329 = _313;
    bool _331 = !_179;
    float _333 = _329;
    if (!_331)
    {
        float _335 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _337 = log2(_335);
        float _339 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _341 = _339 + 1.0;
        float _343 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _345 = _143 * _337;
        float _347 = 1.0 / _341;
        float _349 = _343 * 0.693147182464599609375;
        float _351 = exp2(_345);
        float _353 = 1.0 / _349;
        float _355 = _351 + (-1.0);
        float _357 = -_355;
        float _359 = fma(_357, _353, _143);
        float _361 = _359 * _347;
        float _363 = _361 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _333 = _363;
    }
    float _365 = _333;
    float _367 = _365 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _369 = _365 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _371 = _365 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _373 = _365;
    if (!_179)
    {
        _373 = _143;
    }
    float _375 = _373;
    bool _377 = !_179;
    float _379 = _375;
    if (!_377)
    {
        float _381 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _383 = log2(_381);
        float _385 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _387 = _385 + 1.0;
        float _389 = 1.0 / _387;
        float _391 = _143 * _383;
        float _393 = exp2(_391);
        float _395 = -_393;
        float _397 = _395 + 1.0;
        float _399 = _397 * _389;
        _379 = _399;
    }
    float _401 = _379;
    float _403 = fma(_401, _183, _369);
    bool _405 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _407 = fma(_401, _181, _367);
    float _409 = fma(_401, _185, _371);
    float _411 = -_403;
    float _413 = _323 + _411;
    float _415 = fma(_321, _169, _187);
    float _417 = -_407;
    float _419 = _321 + _417;
    float _421 = fma(_323, _169, _189);
    float _423 = _413 * _195;
    float _425 = _413 * _211;
    float _427 = _413 * _223;
    float _429 = -_409;
    float _431 = _325 + _429;
    float _433 = fma(_419, _193, _423);
    float _435 = fma(_419, _209, _425);
    float _437 = fma(_419, _221, _427);
    float _439 = fma(_325, _169, _191);
    float _441 = fma(_431, _197, _433);
    float _443 = fma(_431, _213, _435);
    float _445 = fma(_431, _225, _437);
    bool _447 = !_405;
    float _463;
    if (!_447)
    {
        float _449 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _451 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _453 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _455 = _453 * _449;
        float _457 = floor(_455);
        float _459 = -_457;
        float _461 = _455 + _459;
        _463 = _461;
        _465 = true;
    }
    else
    {
        float _467 = float(_107);
        float _469 = 1.0 / _467;
        float _471 = _143 * _469;
        _463 = _471;
    }
    _465 = false;
    float _473 = _463;
    float _475 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _477 = int(_475);
    float _479 = _421 * _211;
    float _481 = in.m_62.w;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _485 = _483 != 0;
    float _487 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _489 = int(_487);
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _493 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _495 = int(_493);
    float _497 = float(_477);
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _501 = 0.0;
    int _503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_485)
    {
        _501 = 1.0;
    }
    float _505 = _501;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _509 = 1.0 + _507;
    float _511 = _505;
    if (!_485)
    {
        _511 = 7.345489978790283203125;
    }
    float _513 = _511;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _517 = 1.0 / _497;
    float _519 = float(_489);
    float _521 = _513 * _129;
    float _523 = float(uint(_495));
    float _525 = 1.0 / _519;
    int _527 = ~_495;
    int _529 = _527 + 1;
    bool _531 = _495 == 0;
    float _533 = _517 * _143;
    float _535 = 1.0 / _523;
    float _537 = in.m_51.y;
    float _539 = trunc(_533);
    int _541 = int(_539);
    float _543 = _525 * _143;
    float _545 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _547 = int(_545);
    int _549 = as_type<int>(_535) + (-2);
    float _551 = float(uint(_541));
    float _553 = trunc(_543);
    int _555 = int(_553);
    float _557 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[78].w, _515);
    float _559 = as_type<float>(_549) * _551;
    float _561 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _557);
    float _563 = float(uint(_547));
    float _565 = trunc(_559);
    float _567 = precise::max(_565, 0.0);
    uint _570 = uint(_567);
    int _572 = ~_547;
    int _574 = _572 + 1;
    int _576 = ~_547;
    int _578 = _576 + 1;
    int _580 = ~_547;
    int _582 = _580 + 1;
    float _584 = 1.0 / _563;
    float _586 = float(uint(_555));
    float _588 = _559;
    float _590 = as_type<float>(_529);
    if (_485)
    {
        _588 = _129;
    }
    float _592 = _588;
    float _594 = _592;
    if (!_485)
    {
        _594 = _537;
    }
    float _596 = _594;
    float _598 = 1.0 / _509;
    int _600 = as_type<int>(_584) + (-2);
    int _602 = _529 * int(_570);
    int _604 = _602 + _541;
    if (_485)
    {
        _590 = 1.0;
    }
    float _606 = _590;
    float _608 = _606;
    if (!_485)
    {
        _608 = 1.2345600128173828125;
    }
    float _610 = _608;
    float _612 = as_type<float>(_600) * _586;
    float _614 = float(uint(_604));
    float _616 = trunc(_612);
    float _618 = precise::max(_616, 0.0);
    uint _620 = uint(_618);
    float _622 = as_type<float>(_549) * _614;
    float _624 = trunc(_622);
    float _626 = precise::max(_624, 0.0);
    uint _628 = uint(_626);
    float _630 = _610 * _596;
    int _632 = ~_495;
    int _634 = _632 + 1;
    float _636 = floor(_521);
    int _638 = _574 * int(_620);
    int _640 = _638 + _555;
    float _642 = float(_107);
    float _644 = float(uint(_640));
    int _646 = int(_570) + int(_628);
    float _648 = floor(_630);
    float _650 = as_type<float>(_600) * _644;
    float _652 = float(_495);
    int _654 = _634 * _646;
    int _656 = _654 + _541;
    float _658 = -_636;
    float _660 = _521 + _658;
    float _662 = 1.0 / _642;
    bool _664 = uint(_656) >= uint(_495);
    float _666 = _660 * _652;
    float _668 = float(_541);
    bool _670 = !_664;
    int _672 = _670 ? 0 : (-1);
    float _674 = trunc(_650);
    float _676 = precise::max(_674, 0.0);
    uint _678 = uint(_676);
    int _680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _682 = _680 != 0;
    float _684 = -_648;
    float _686 = _630 + _684;
    int _688 = ~_646;
    int _690 = _688 + _672;
    int _692 = _690 + 1;
    bool _694 = !_682;
    int _696 = _694 ? 0 : 1;
    bool _698 = _668 >= _652;
    bool _700 = isnan(_668);
    bool _702 = _698 || _700;
    bool _704 = isnan(_652);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = trunc(_666);
    int _712 = int(_710);
    float _714 = _662 * _143;
    float _716 = float(_547);
    int _718 = abs(_696);
    float _720 = _652 * _714;
    float _722 = float(_555);
    float _724 = _716 * _714;
    float _726 = trunc(_708);
    int _728 = int(_726);
    float _730 = _686 * _716;
    bool _732 = _722 >= _716;
    bool _734 = isnan(_722);
    bool _736 = _732 || _734;
    bool _738 = isnan(_716);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    int _744 = int(_620) + int(_678);
    int _746 = _712 * _718;
    int _748 = _746 + _541;
    int _750 = _495 * _692;
    int _752 = _750 + _541;
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _756 = _754 != 0;
    int _758 = _578 * _744;
    int _760 = _758 + _555;
    float _762 = trunc(_730);
    int _764 = int(_762);
    bool _766 = !_531;
    int _768 = _766 ? _752 : (-1);
    int _770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _772 = _770 != 0;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _776 = _774 != 0;
    int _778 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _780 = _778 != 0;
    bool _782 = uint(_760) >= uint(_547);
    bool _784 = !_756;
    int _786 = _784 ? 0 : 1;
    float _788 = trunc(_742);
    int _790 = int(_788);
    int _792 = ~_728;
    int _794 = _792 + 1;
    int _796 = _794 + 1;
    int _798 = abs(_786);
    bool _800 = !_782;
    int _802 = _800 ? 0 : (-1);
    int _804 = _768 * _796;
    bool _806 = !_776;
    int _808 = _806 ? 0 : 1;
    float _810 = trunc(_720);
    int _812 = int(_810);
    int _814 = _495 + (-1);
    int _816 = ~_744;
    int _818 = _816 + _802;
    int _820 = _818 + 1;
    int _822 = abs(_808);
    int _824 = _728 * _814;
    int _826 = _824 + _804;
    bool _828 = !_772;
    int _830 = _828 ? 0 : 1;
    int _832 = _764 * _798;
    int _834 = _832 + _555;
    bool _836 = _547 == 0;
    int _838 = _547 * _820;
    int _840 = _838 + _555;
    bool _842 = !_780;
    int _844 = _842 ? 0 : 1;
    int _846 = _826 * _822;
    int _848 = abs(_830);
    float _850 = trunc(_724);
    int _852 = int(_850);
    int _854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _856 = _854 != 0;
    float _858 = in.m_51.w;
    int _860 = abs(_844);
    int _862 = _812 * _848;
    int _864 = _862 + _846;
    int _866 = ~_790;
    int _868 = _866 + 1;
    int _870 = _868 + 1;
    bool _872 = !_836;
    int _874 = _872 ? _840 : (-1);
    bool _876 = !_856;
    int _878 = _876 ? 0 : 1;
    int _880 = _874 * _870;
    int _882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _884 = _882 != 0;
    int _886 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _888 = _886 != 0;
    int _890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _892 = _890 != 0;
    int _894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _896 = _894 != 0;
    int _898 = abs(_878);
    int _900 = _748 * _860;
    int _902 = _900 + _864;
    int _904 = _547 + (-1);
    bool _906 = !_888;
    int _908 = _906 ? 0 : 1;
    int _910 = _790 * _904;
    int _912 = _910 + _880;
    bool _914 = !_884;
    int _916 = _914 ? 0 : 1;
    int _918 = abs(_908);
    int _920 = _712 * _898;
    int _922 = _920 + _902;
    bool _924 = !_892;
    int _926 = _924 ? 0 : 1;
    int _928 = abs(_916);
    bool _930 = !_896;
    int _932 = _930 ? 0 : 1;
    int _934 = abs(_926);
    int _936 = _912 * _918;
    float _938 = float(uint(_922));
    int _940 = abs(_932);
    int _942 = _852 * _928;
    int _944 = _942 + _936;
    float _946 = as_type<float>(_549) * _938;
    int _948 = ~_495;
    int _950 = _948 + 1;
    int _952 = _834 * _934;
    int _954 = _952 + _944;
    int _956 = ~_547;
    int _958 = _956 + 1;
    float _960 = trunc(_946);
    float _962 = precise::max(_960, 0.0);
    uint _964 = uint(_962);
    bool _966 = _495 == 0;
    int _968 = _764 * _940;
    int _970 = _968 + _954;
    int _972 = ~_495;
    int _974 = _972 + 1;
    float _976 = float(uint(_834));
    float _978 = float(uint(_970));
    float _980 = as_type<float>(_600) * _978;
    float _982 = trunc(_980);
    float _984 = precise::max(_982, 0.0);
    uint _986 = uint(_984);
    int _988 = _974 * int(_964);
    int _990 = _988 + _922;
    float _992 = float(uint(_990));
    float _994 = as_type<float>(_549) * _992;
    float _996 = trunc(_994);
    float _998 = precise::max(_996, 0.0);
    uint _1000 = uint(_998);
    int _1002 = _958 * int(_986);
    int _1004 = _1002 + _970;
    float _1006 = float(uint(_1004));
    int _1008 = ~_547;
    int _1010 = _1008 + 1;
    float _1012 = as_type<float>(_600) * _1006;
    int _1014 = int(_964) + int(_1000);
    float _1016 = trunc(_1012);
    float _1018 = precise::max(_1016, 0.0);
    uint _1020 = uint(_1018);
    int _1022 = _950 * _1014;
    int _1024 = _1022 + _922;
    bool _1026 = uint(_1024) >= uint(_495);
    bool _1028 = !_1026;
    int _1030 = _1028 ? 0 : (-1);
    int _1032 = int(_986) + int(_1020);
    int _1034 = ~_1014;
    int _1036 = _1034 + _1030;
    int _1038 = _1036 + 1;
    int _1040 = _1010 * _1032;
    int _1042 = _1040 + _970;
    int _1044 = _495 * _1038;
    int _1046 = _1044 + _922;
    int _1048 = ~_495;
    int _1050 = _1048 + 1;
    bool _1052 = uint(_1042) >= uint(_547);
    bool _1054 = !_966;
    int _1056 = _1054 ? _1046 : (-1);
    bool _1058 = !_1052;
    int _1060 = _1058 ? 0 : (-1);
    int _1062 = _1056 & 3;
    bool _1064 = _1062 != 0;
    int _1066 = ~_1032;
    int _1068 = _1066 + _1060;
    int _1070 = _1068 + 1;
    bool _1072 = uint(_1062) > 1u;
    int _1074 = _1056 & 3;
    bool _1076 = _1074 != 0;
    int _1078 = _547 * _1070;
    int _1080 = _1078 + _970;
    float _1082 = float(uint(_748));
    int _1084 = _1076 ? 0 : 1;
    bool _1086 = !_836;
    int _1088 = _1086 ? _1080 : (-1);
    float _1090 = as_type<float>(_549) * _1082;
    int _1092 = ~_1084;
    int _1094 = _1092 + 1;
    int _1096 = _1094 + 1;
    bool _1098 = uint(_1062) >= 2u;
    float _1100 = trunc(_1090);
    float _1102 = precise::max(_1100, 0.0);
    uint _1104 = uint(_1102);
    int _1106 = _1096;
    if (!_1072)
    {
        int _1108 = ~_1084;
        int _1110 = _1108 + 1;
        _1106 = _1110;
    }
    int _1112 = _1106;
    int _1114 = _1088 & 3;
    bool _1116 = _1114 != 0;
    int _1118 = _1088 & 3;
    bool _1120 = _1118 != 0;
    int _1122 = _1098 ? 0 : 1;
    bool _1124 = _1062 != 3;
    int _1126 = _1116 ? 0 : 1;
    bool _1128 = uint(_1118) > 1u;
    int _1130 = ~_1122;
    int _1132 = _1130 + 1;
    int _1134 = _1132 + 1;
    int _1136 = _1050 * int(_1104);
    int _1138 = _1136 + _748;
    float _1140 = as_type<float>(_600) * _976;
    int _1142 = ~_1126;
    int _1144 = _1142 + 1;
    int _1146 = _1144 + 1;
    int _1148 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1150 = _1148 != 0;
    float _1152 = trunc(_1140);
    float _1154 = precise::max(_1152, 0.0);
    uint _1156 = uint(_1154);
    int _1158 = _1134;
    int _1160 = _1146;
    if (_1124)
    {
        int _1162 = ~_1122;
        int _1164 = _1162 + 1;
        _1158 = _1164;
    }
    int _1166 = _1158;
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1170 = _1168 != 0;
    float _1172 = in.m_51.z;
    if (!_1128)
    {
        int _1174 = ~_1126;
        int _1176 = _1174 + 1;
        _1160 = _1176;
    }
    int _1178 = _1160;
    bool _1180 = _1118 != 3;
    float _1182 = float(uint(_1138));
    bool _1184 = !_1170;
    int _1186 = _1184 ? 0 : 1;
    bool _1188 = uint(_1118) >= 2u;
    float _1190 = as_type<float>(_549) * _1182;
    float _1192 = _129 * 2.0;
    int _1194 = _582 * int(_1156);
    int _1196 = _1194 + _834;
    int _1198 = _1188 ? 0 : 1;
    float _1200 = floor(_1192);
    int _1202 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1204 = _1202 != 0;
    float _1206 = _537 * 2.0;
    int _1208 = ~_1198;
    int _1210 = _1208 + 1;
    int _1212 = _1210 + 1;
    int _1214 = _1212;
    float _1216 = as_type<float>(_1156);
    if (_1180)
    {
        int _1218 = ~_1198;
        int _1220 = _1218 + 1;
        _1214 = _1220;
    }
    int _1222 = _1214;
    bool _1224 = _129 > 0.5;
    float _1226 = floor(_1206);
    float _1228 = float(uint(_1196));
    float _1230 = -_237;
    int _1232 = _1224 ? as_type<int>(_1230) : as_type<int>(_237);
    bool _1234 = _537 > 0.5;
    float _1236 = as_type<float>(_600) * _1228;
    bool _1238 = !_1204;
    float _1240 = _1238 ? _237 : as_type<float>(_1232);
    float _1242 = trunc(_1190);
    float _1244 = precise::max(_1242, 0.0);
    uint _1246 = uint(_1244);
    bool _1248 = _1172 > 0.5;
    float _1250 = _421 * _195;
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1254 = _1252 != 0;
    float _1256 = -_241;
    int _1258 = _1234 ? as_type<int>(_1256) : as_type<int>(_241);
    float _1260 = fma(_415, _193, _1250);
    int _1262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1264 = _1262 != 0;
    float _1266 = trunc(_1236);
    float _1268 = precise::max(_1266, 0.0);
    uint _1270 = uint(_1268);
    float _1272 = -_237;
    int _1274 = _1248 ? as_type<int>(_1272) : as_type<int>(_237);
    float _1276 = fma(_439, _197, _1260);
    bool _1278 = !_1254;
    float _1280 = _1278 ? _241 : as_type<float>(_1258);
    float _1282 = _129 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1284 = _1200 > 0.0;
    bool _1286 = !_1264;
    float _1288 = _1286 ? _237 : as_type<float>(_1274);
    if (_1150)
    {
        _503 = 0;
    }
    int _1290 = _503;
    bool _1292 = _1200 >= 0.0;
    bool _1294 = isnan(_1200);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan(0.0);
    bool _1300 = _1296 || _1298;
    float _1302 = _1288 + 0.5;
    bool _1304 = _858 > 0.5;
    float _1306 = _421 * _223;
    int _1308 = _1290;
    if (!_1150)
    {
        _1308 = 1;
    }
    int _1310 = _1308;
    float _1312 = _1300 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1314 = fma(_415, _221, _1306);
    float _1316 = -_241;
    int _1318 = _1304 ? as_type<int>(_1316) : as_type<int>(_241);
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1322 = _1320 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _1324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1326 = _1324 != 0;
    bool _1328 = _1310 != 1;
    int _1330 = ~as_type<int>(_1312);
    int _1332 = _1330 + 1;
    int _1334 = _1332 + 1;
    int _1336 = _1334;
    float _1338 = _1312;
    if (!_1284)
    {
        int _1340 = ~as_type<int>(_1312);
        int _1342 = _1340 + 1;
        _1336 = _1342;
    }
    int _1344 = _1336;
    bool _1346 = !_1326;
    float _1348 = _1346 ? _241 : as_type<float>(_1318);
    bool _1350 = _1226 > 0.0;
    int _1352 = int(_1104) + int(_1246);
    float _1354 = _1348 + (-0.5);
    int _1356 = ~_495;
    int _1358 = _1356 + 1;
    int _1360 = ~_547;
    int _1362 = _1360 + 1;
    int _1364 = int(_1156) + int(_1270);
    int _1366 = _1358 * _1352;
    int _1368 = _1366 + _748;
    bool _1370 = _1226 >= 0.0;
    bool _1372 = isnan(_1226);
    bool _1374 = _1370 || _1372;
    bool _1376 = isnan(0.0);
    bool _1378 = _1374 || _1376;
    float _1380 = as_type<float>(_1270);
    if (!_1328)
    {
        _1216 = _537;
    }
    float _1382 = _1216;
    int _1384 = _1362 * _1364;
    int _1386 = _1384 + _834;
    int _1388 = _1378 ? 0 : 1;
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1390;
    float _1394 = _1382;
    if (!_1328)
    {
        _1380 = _537;
    }
    float _1396 = _1380;
    float _1398 = in.m_60.w;
    float _1400 = _1396;
    if (!_1328)
    {
        _1338 = _1172;
    }
    float _1402 = _1338;
    float _1404 = _1402;
    if (!_1328)
    {
        _247 = _1172;
    }
    float _1406 = _247;
    float _1408 = _1406;
    if (_1328)
    {
        _1394 = _129;
    }
    float _1410 = _1394;
    if (_1328)
    {
        _1400 = _129;
    }
    float _1412 = _1400;
    if (_1328)
    {
        _1404 = _537;
    }
    float _1414 = _1404;
    if (_1328)
    {
        _1408 = _537;
    }
    float _1416 = _1408;
    bool _1418 = uint(_1368) >= uint(_495);
    float _1420 = fma(_415, _209, _479);
    bool _1422 = uint(_1386) >= uint(_547);
    int _1424 = ~_1388;
    int _1426 = _1424 + 1;
    int _1428 = _1426 + 1;
    float _1430 = fma(_439, _213, _1420);
    float _1432 = 1.0 / _1392;
    int _1434 = _1428;
    if (!_1350)
    {
        int _1436 = ~_1388;
        int _1438 = _1436 + 1;
        _1434 = _1438;
    }
    int _1440 = _1434;
    float _1442 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1444 = _473 + _1442;
    bool _1446 = !_1422;
    int _1448 = _1446 ? 0 : (-1);
    float _1450 = _1430 + _481;
    int _1452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1454 = _1452 != 0;
    int _1456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1458 = _1456 != 0;
    int _1460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1462 = _1460 != 0;
    int _1464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1466 = _1464 != 0;
    float _1468 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1470 = fma(_439, _225, _1314);
    float _1472 = 1.0 / _1322;
    float _1474 = _1172 * 2.0;
    float _1476 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1478 = _473 + _1476;
    bool _1480 = !_1418;
    int _1482 = _1480 ? 0 : (-1);
    float _1484 = -_1468;
    float _1486 = fma(_1282, 2.0, _1484);
    float _1488 = in.m_64.w;
    float _1490 = _537 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1492 = floor(_1474);
    float _1494 = _1444 * _1432;
    float _1496 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1498 = _129 + _537;
    bool _1500 = !_1458;
    int _1502 = _1500 ? 0 : 1;
    float _1504 = _1172 + _537;
    float _1506 = fma(_1490, -2.0, _1496);
    float _1508 = _1498 + (-1.0);
    float _1510 = _1478 * _1472;
    float _1512 = _129 + _1172;
    bool _1514 = !_1462;
    int _1516 = _1514 ? 0 : 1;
    float _1518 = _1504 + (-1.0);
    float _1520 = _1512 + (-1.0);
    int _1522 = abs(_1516);
    float _1524 = -_143;
    float _1526 = fma(_1524, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1486);
    bool _1528 = _1492 >= 0.0;
    bool _1530 = isnan(_1492);
    bool _1532 = _1528 || _1530;
    bool _1534 = isnan(0.0);
    bool _1536 = _1532 || _1534;
    float _1538 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1540 = fma(_1508, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1542 = _1536 ? 0 : 1;
    float _1544 = _537 + (-0.5);
    bool _1546 = _1492 > 0.0;
    float _1548 = _1276 + _1398;
    float _1550 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1552 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1506);
    int _1554 = ~_1542;
    int _1556 = _1554 + 1;
    int _1558 = _1556 + 1;
    float _1560 = _1470 + _1488;
    int _1562 = abs(_1502);
    float _1564 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1566 = _1056 >> 31;
    float _1568 = fma(_1564, -2.0, _499);
    int _1570 = _1558;
    if (!_1546)
    {
        int _1572 = ~_1542;
        int _1574 = _1572 + 1;
        _1570 = _1574;
    }
    int _1576 = _1570;
    float _1578 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1550);
    float _1580 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1582 = log2(_1580);
    float _1584 = float(_1440);
    float _1586 = fma(_1518, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1588 = _1088 >> 31;
    float _1590 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1592 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1590;
    int _1594 = _1566 & 3;
    float _1596 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1598 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1596;
    float _1600 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1602 = _1600 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _1604 = _1588 & 3;
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1608 = _1606 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1610 = _1240 + 0.5;
    int _1612 = _1056 + _1594;
    float _1614 = fma(_1602, _1510, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _1616 = _1088 + _1604;
    float _1618 = fma(_1608, _1510, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1620 = fma(_1610, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1526);
    float _1622 = _1280 + (-0.5);
    int _1624 = _1612 >> 2;
    float _1626 = _1582 * _143;
    float _1628 = -_1622;
    float _1630 = -_1552;
    float _1632 = fma(_1628, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1630);
    float _1634 = _1410 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1636 = float(_1522);
    float _1638 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1640 = _1616 >> 2;
    float _1642 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1644 = _1624 << 4;
    int _1646 = _1644 + 368;
    float _1648 = _1636 * _1584;
    int _1650 = _1640 << 4;
    int _1652 = _1650 + 512;
    float _1654 = exp2(_1626);
    uint _1656 = uint(int(uint(_1646) >> uint(2)));
    uint _1658 = uint(int(uint(int(_1656)) >> uint(2)));
    int _1660 = int(_1656) & 3;
    float _1662 = (*spvDescriptorSet0.vp_c9)._m0[int(_1658)][_1660];
    int _1664 = int(_1656) + 1;
    uint _1666 = uint(int(uint(_1664) >> uint(2)));
    int _1668 = _1664 & 3;
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[int(_1666)][_1668];
    float _1672 = fma(_1412, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1638);
    float _1674 = -_1642;
    float _1676 = fma(_1634, 2.0, _1674);
    float _1678 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1680 = _1450 + _1678;
    float _1682 = fma(_1598, _1494, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1684 = fma(_1592, _1494, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1686 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1688 = _1548 + _1686;
    float _1690 = float(_1344);
    uint _1692 = uint(int(uint(_1652) >> uint(2)));
    uint _1694 = uint(int(uint(int(_1692)) >> uint(2)));
    int _1696 = int(_1692) & 3;
    float _1698 = (*spvDescriptorSet0.vp_c9)._m0[int(_1694)][_1696];
    int _1700 = int(_1692) + 1;
    uint _1702 = uint(int(uint(_1700) >> uint(2)));
    int _1704 = _1700 & 3;
    float _1706 = (*spvDescriptorSet0.vp_c9)._m0[int(_1702)][_1704];
    float _1708 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1710 = float(_1562);
    float _1712 = -_143;
    float _1714 = fma(_1712, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1676);
    int _1716 = ~_1352;
    int _1718 = _1716 + _1482;
    int _1720 = _1718 + 1;
    float _1722 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1708);
    float _1724 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1672);
    float _1726 = -_1654;
    float _1728 = _1726 + 1.0;
    int _1730 = _1646 + 8;
    uint _1732 = uint(int(uint(_1730) >> uint(2)));
    uint _1734 = uint(int(uint(int(_1732)) >> uint(2)));
    int _1736 = int(_1732) & 3;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[int(_1734)][_1736];
    int _1740 = int(_1732) + 1;
    uint _1742 = uint(int(uint(_1740) >> uint(2)));
    int _1744 = _1740 & 3;
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[int(_1742)][_1744];
    float _1748 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[78].z, _491);
    float _1750 = _1710 * _1690;
    int _1752 = abs(_1112);
    float _1754 = fma(_1302, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1714);
    float _1756 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1748);
    float _1758 = _1750 * (-2.0);
    bool _1760 = !_1064;
    int _1762 = _1760 ? 0 : 1;
    int _1764 = _1652 + 8;
    uint _1766 = uint(int(uint(_1764) >> uint(2)));
    uint _1768 = uint(int(uint(int(_1766)) >> uint(2)));
    int _1770 = int(_1766) & 3;
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[int(_1768)][_1770];
    int _1774 = int(_1766) + 1;
    uint _1776 = uint(int(uint(_1774) >> uint(2)));
    int _1778 = _1774 & 3;
    float _1780 = (*spvDescriptorSet0.vp_c9)._m0[int(_1776)][_1778];
    int _1782 = ~_1364;
    int _1784 = _1782 + _1448;
    int _1786 = _1784 + 1;
    float _1788 = fma(_1586, _1758, _1586);
    int _1790 = abs(_1178);
    float _1792 = in.m_66.x;
    float _1794 = in.m_66.y;
    float _1796 = in.m_66.z;
    float _1798 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1800 = _1560 + _1798;
    int _1802 = abs(_1166);
    int _1804 = _495 * _1720;
    int _1806 = _1804 + _748;
    int _1808 = abs(_1762);
    float _1810 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1722);
    int _1812 = ~_1752;
    int _1814 = _1812 + 1;
    int _1816 = _1814 + 1;
    int _1818 = _547 * _1786;
    int _1820 = _1818 + _834;
    bool _1822 = !_1120;
    int _1824 = _1822 ? 0 : 1;
    float _1826 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1578);
    int _1828 = ~_1790;
    int _1830 = _1828 + 1;
    int _1832 = _1830 + 1;
    float _1834 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1568);
    int _1836 = ~_1808;
    int _1838 = _1836 + 1;
    int _1840 = _1838 + 1;
    int _1842 = abs(_1824);
    float _1844 = -_1354;
    float _1846 = -_1834;
    float _1848 = fma(_1844, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1846);
    bool _1850 = _1062 != 3;
    int _1852 = _1816 * as_type<int>(_1670);
    int _1854 = abs(_1222);
    int _1856 = ~_1802;
    int _1858 = _1856 + 1;
    int _1860 = _1858 + 1;
    int _1862 = _1840 * as_type<int>(_1662);
    int _1864 = _1862 + _1852;
    bool _1866 = !_1850;
    int _1868 = _1866 ? 0 : (-1);
    float _1870 = fma(_1758, _1794, _1794);
    bool _1872 = _1118 != 3;
    int _1874 = _1832 * as_type<int>(_1706);
    int _1876 = ~_1842;
    int _1878 = _1876 + 1;
    int _1880 = _1878 + 1;
    int _1882 = abs(_1868);
    bool _1884 = _495 == 0;
    int _1886 = _1880 * as_type<int>(_1698);
    int _1888 = _1886 + _1874;
    bool _1890 = !_1872;
    int _1892 = _1890 ? 0 : (-1);
    int _1894 = _1860 * as_type<int>(_1738);
    int _1896 = _1894 + _1864;
    bool _1898 = !_1466;
    int _1900 = _1898 ? 0 : 1;
    int _1902 = abs(_1892);
    int _1904 = abs(_1900);
    int _1906 = ~_1854;
    int _1908 = _1906 + 1;
    int _1910 = _1908 + 1;
    int _1912 = ~_1902;
    int _1914 = _1912 + 1;
    int _1916 = _1914 + 1;
    bool _1918 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1920 = isnan(0.0);
    bool _1922 = _1918 || _1920;
    bool _1924 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1926 = _1922 || _1924;
    int _1928 = _1910 * as_type<int>(_1772);
    int _1930 = _1928 + _1888;
    int _1932 = ~_1882;
    int _1934 = _1932 + 1;
    int _1936 = _1934 + 1;
    float _1938 = -_1724;
    float _1940 = _1938 + 1.0;
    int _1942 = _1916 * as_type<int>(_1780);
    int _1944 = _1942 + _1930;
    float _1946 = _1680 * _1680;
    float _1948 = _1648 * (-2.0);
    int _1950 = abs(_1186);
    int _1952 = _1936 * as_type<int>(_1746);
    int _1954 = _1952 + _1896;
    float _1956 = fma(_1688, _1688, _1946);
    float _1958 = fma(_1538, _1948, _1538);
    float _1960 = fma(_1948, _1796, _1796);
    float _1962 = _1926 ? _1728 : 0.0;
    float _1964 = fma(_1800, _1800, _1956);
    bool _1966 = _1810 >= 0.0;
    float _1968 = -_1826;
    float _1970 = _1968 + 1.0;
    int _1972 = ~_1904;
    int _1974 = _1972 + 1;
    int _1976 = _1974 + 1;
    float _1978 = -_1940;
    float _1980 = fma(_1288, _1978, _1754);
    int _1982 = ~_1950;
    int _1984 = _1982 + 1;
    int _1986 = _1984 + 1;
    float _1988 = rsqrt(_1964);
    bool _1990 = _547 == 0;
    int _1992 = _1944 * _1976;
    bool _1994 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1996 = isnan(1.0);
    bool _1998 = _1994 || _1996;
    bool _2000 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2002 = _1998 || _2000;
    int _2004 = _1954 * _1986;
    bool _2006 = !_1990;
    float _2008 = _2006 ? as_type<float>(_1820) : as_type<float>(0xffffffffu /* nan */);
    float _2010 = fma(_1544, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1870);
    bool _2012 = !_1884;
    int _2014 = _2012 ? _1806 : (-1);
    float _2016 = fma(_1348, _1970, _1848);
    float _2018 = _2008;
    if (_1966)
    {
        out.m_47.x = 0.0;
    }
    int _2020 = as_type<int>(_2008) * _1904;
    int _2022 = _2020 + _1992;
    float _2024 = -_561;
    float _2026 = _2024 + 1.0;
    int _2028 = _2014 * _1950;
    int _2030 = _2028 + _2004;
    if (_1966)
    {
        _2018 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2032 = _2018;
    float _2034 = -_1756;
    float _2036 = _2034 + 1.0;
    float _2038 = fma(_1280, _2026, _1632);
    int _2040 = as_type<int>(_2032);
    if (_2002)
    {
        float _2042 = _1962 * _598;
        _147 = _2042;
    }
    float _2044 = _147;
    float _2046 = -_2036;
    float _2048 = fma(_1240, _2046, _1620);
    if (_1966)
    {
        float _2050 = _2032 * 5.0;
        _2040 = as_type<int>(_2050);
    }
    int _2052 = _2040;
    float _2054 = float(_2030);
    float _2056 = _1680 * _1988;
    float _2058 = float(_2022);
    float _2060 = fma(_1788, _2044, _2010);
    float _2062 = _1688 * _1988;
    float _2064 = -_2056;
    float _2066 = fma(_2064, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1680);
    float _2068 = _2056;
    if (_1966)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6416 = as_type<float>(_2052);
        out.gl_Position.z = _6416;
    }
    bool _2070 = !_1454;
    int _2072 = _2070 ? 0 : 1;
    float _2074 = -_2062;
    float _2076 = fma(_2074, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1688);
    float _2078 = _2066 * _2066;
    out.m_68.x = _2048;
    out.m_68.y = _2038;
    out.m_68.z = _1980;
    out.m_68.w = _2016;
    out.m_70.x = _2054;
    out.m_70.y = _2058;
    if (_1966)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2080 = -_2056;
    float _2082 = fma(_2080, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1450);
    float _2084 = -_2062;
    float _2086 = fma(_2084, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1548);
    bool _2088 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _2090 = isnan(_473);
    bool _2092 = _2088 || _2090;
    bool _2094 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _2096 = _2092 || _2094;
    float _2098 = float(_2096);
    float _2100 = _1800 * _1988;
    float _2102 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2104 = _2082 + _2102;
    float _2106 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2108 = _2086 + _2106;
    float _2110 = float(_1576);
    float _2112 = -_2098;
    float _2114 = _2112 + 1.0;
    float _2116 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _2118 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _2120 = isnan(_473);
    bool _2122 = _2118 || _2120;
    bool _2124 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _2126 = _2122 || _2124;
    float _2128 = float(_2126);
    float _2130 = _129 + (-0.5);
    bool _2132 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _2134 = isnan(_473);
    bool _2136 = _2132 || _2134;
    bool _2138 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _2140 = _2136 || _2138;
    float _2142 = float(_2140);
    float _2144 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2116);
    int _2146 = abs(_2072);
    float _2148 = _2128 * _2114;
    float _2150 = -_2100;
    float _2152 = fma(_2150, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1560);
    float _2154 = -_2128;
    float _2156 = _2154 + 1.0;
    float _2158 = _1172 + (-0.5);
    float _2160 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2162 = _2152 + _2160;
    float _2164 = _2142 * _2156;
    float _2166 = float(_2146);
    float _2168 = fma(_2158, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1960);
    float _2170 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2144);
    float _2172 = _1682 * _2164;
    float _2174 = -_2142;
    float _2176 = _2174 + 1.0;
    float _2178 = _2166 * _2110;
    float _2180 = fma(_1958, _2044, _2168);
    bool _2182 = _2170 >= 0.0;
    float _2184 = fma(_2076, _2076, _2078);
    float _2186 = _2178 * (-2.0);
    float _2188 = -_2100;
    float _2190 = fma(_2188, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1800);
    float _2192 = in.m_58.x;
    float _2194 = in.m_58.y;
    float _2196 = fma(_2176, (*spvDescriptorSet0.vp_c9)._m0[143].x, _2172);
    float _2198 = fma(_2186, _1792, _1792);
    float _2200 = fma(_1540, _2186, _1540);
    float _2202 = fma(_2190, _2190, _2184);
    float _2204 = _2060 * 0.15915493667125701904296875;
    float _2206 = fma(_2130, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2198);
    float _2208 = _1684 * _2164;
    float _2210 = _2180 * 0.15915493667125701904296875;
    float _2212 = fma(_1618, _2148, _2196);
    float _2214 = fma(_2200, _2044, _2206);
    float _2216 = _2180;
    if (_2182)
    {
        _2216 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2218 = _2216;
    float _2220 = sqrt(_2202);
    float _2222 = fma(_2176, (*spvDescriptorSet0.vp_c9)._m0[143].y, _2208);
    float _2224 = _2214 * 0.15915493667125701904296875;
    int _2226 = as_type<int>(_2218);
    if (_2182)
    {
        float _2228 = _2218 * 5.0;
        _2226 = as_type<int>(_2228);
    }
    int _2230 = _2226;
    float _2232 = fma(_1614, _2148, _2222);
    if (_2182)
    {
        out.m_47.x = 0.0;
    }
    float _2234 = _2204 * 6.283185482025146484375;
    float _2236 = sin(_2234);
    float _2238 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[145].y, _2232);
    if (_2182)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6704 = as_type<float>(_2230);
        out.gl_Position.z = _6704;
    }
    float _2240 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[145].x, _2212);
    float _2242 = _2238 * _2194;
    float _2244 = _2204 * 6.283185482025146484375;
    float _2246 = cos(_2244);
    float _2248 = _2210 * 6.283185482025146484375;
    float _2250 = sin(_2248);
    float _2252 = _2210 * 6.283185482025146484375;
    float _2254 = cos(_2252);
    float _2256 = _2224 * 6.283185482025146484375;
    float _2258 = sin(_2256);
    if (_2182)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2260 = _2224 * 6.283185482025146484375;
    float _2262 = cos(_2260);
    float _2264 = _1988 * _2220;
    float _2266 = _2242 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2268 = _2240 * _2192;
    float _2270 = _2246 * _2254;
    float _2272 = _2236 * _2250;
    float _2274 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _241);
    float _2276 = _2264 * _2266;
    float _2278 = _2268 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2280 = fma(_2258, _2272, _2270);
    float _2282 = fma(_2258, _2270, _2272);
    float _2284 = _2274 * _2276;
    float _2286 = _2236 * _2254;
    float _2288 = _2246 * _2250;
    float _2290 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _237);
    float _2292 = _2278 * _2264;
    float _2294 = _2254 * _2262;
    float _2296 = _2250 * _2262;
    float _2298 = -_2288;
    float _2300 = fma(_2258, _2286, _2298);
    float _2302 = _2292 * _2290;
    float _2304 = _2294 * _2284;
    float _2306 = -_2286;
    float _2308 = fma(_2258, _2288, _2306);
    float _2310 = _2264 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2312 = _2310 * 0.5;
    float _2314 = _2300 * _2284;
    float _2316 = fma(_2296, _2302, _2304);
    float _2318 = _2282 * _2284;
    float _2320 = _2236 * _2262;
    float _2322 = fma(_2280, _2302, _2314);
    float _2324 = -_2258;
    float _2326 = fma(_2324, _2312, _2316);
    float _2328 = _2246 * _2262;
    float _2330 = fma(_2308, _2302, _2318);
    float _2332 = fma(_2320, _2312, _2322);
    float _2334 = _2326 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2336 = _2326 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2338 = fma(_2328, _2312, _2330);
    float _2340 = fma(_2332, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2334);
    float _2342 = fma(_2332, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2336);
    float _2344 = fma(_2338, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2340);
    float _2346 = fma(_2338, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2342);
    float _2348 = _2344 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2350 = _2346 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2352 = _1560 + _2348;
    float _2354 = _1548 + _2350;
    float _2356 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2358 = _2352 + _2356;
    float _2360 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2362 = _2354 + _2360;
    float _2364 = _2358 * _2358;
    float _2366 = fma(_2362, _2362, _2364);
    float _2368 = _2326 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2370 = sqrt(_2366);
    float _2372 = fma(_2332, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2368);
    float _2374 = fma(_2338, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2372);
    float _2376 = _2374 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2378 = _1450 + _2376;
    bool _2380 = _2370 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2382 = _2376;
    float _2384 = _2354;
    float _2386 = _2352;
    float _2388 = _2326;
    if (!_2380)
    {
        _2382 = _2378;
    }
    float _2390 = _2382;
    bool _2392 = !_2380;
    float _2394 = _2390;
    if (!_2392)
    {
        float _2396 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2398 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2400 = _2370 + _2398;
        float _2402 = _2378 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2404 = rsqrt(_2366);
        float _2406 = _2400 * _2396;
        float _2408 = _2406 * 0.15915493667125701904296875;
        float _2410 = _2408 * 6.283185482025146484375;
        float _2412 = sin(_2410);
        float _2414 = _2408 * 6.283185482025146484375;
        float _2416 = cos(_2414);
        float _2418 = fma(_2412, _2402, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2420 = _2404 * _2418;
        float _2422 = _2416 + (-1.0);
        float _2424 = fma(_2362, _2420, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2426 = fma(_2358, _2420, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2428 = _2422 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2430 = fma(_2378, _2416, _2428);
        _2394 = _2430;
        _2384 = _2424;
        _2386 = _2426;
    }
    float _2432 = _2394;
    float _2434 = _2384;
    float _2436 = _2386;
    float _2438 = -_2056;
    float _2440 = fma(_2438, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2432);
    float _2442 = -_2062;
    float _2444 = fma(_2442, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2434);
    float _2446 = -_2100;
    float _2448 = fma(_2446, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2436);
    float _2450 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2452 = _2440 + _2450;
    float _2454 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2456 = _2444 + _2454;
    float _2458 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2460 = _2448 + _2458;
    float _2462 = _2452 * _2452;
    float _2464 = fma(_2456, _2456, _2462);
    float _2466 = fma(_2460, _2460, _2464);
    float _2468 = rsqrt(_2466);
    float _2470 = sqrt(_2466);
    float _2472 = _2468 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2474 = _2456 * _2472;
    float _2476 = _2460 * _2472;
    float _2478 = _2474 * _2474;
    float _2480 = _2476 * _2476;
    float _2482 = _2478 + _2480;
    float _2484 = sqrt(_2482);
    bool _2486 = _2484 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2488 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2490 = _2484 + _2488;
    float _2492 = _2460;
    float _2494 = _2482;
    float _2496 = _2490;
    float _2498 = _2452;
    if (_2486)
    {
        float _2500 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2492 = _2500;
    }
    float _2502 = _2492;
    if (_2486)
    {
        float _2504 = rsqrt(_2482);
        _2494 = _2504;
    }
    float _2506 = _2494;
    float _2508 = _2506;
    if (_2486)
    {
        float _2510 = _2490 * _2502;
        _2496 = _2510;
    }
    float _2512 = _2496;
    if (_2486)
    {
        float _2514 = _2512 * 0.15915493667125701904296875;
        _2388 = _2514;
    }
    float _2516 = _2388;
    float _2518 = _2502;
    float _2520 = _2516;
    if (_2486)
    {
        float _2522 = _2516 * 6.283185482025146484375;
        float _2524 = sin(_2522);
        _2518 = _2524;
    }
    float _2526 = _2518;
    float _2528 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2530 = precise::max(0.0, _2528);
    float _2532 = _2462;
    float _2534 = _2530;
    if (_2486)
    {
        float _2536 = _2516 * 6.283185482025146484375;
        float _2538 = cos(_2536);
        _2532 = _2538;
    }
    float _2540 = _2532;
    float _2542 = -_2472;
    float _2544 = -_2530;
    float _2546 = fma(_2452, _2542, _2544);
    if (!_2486)
    {
        _2498 = _2474;
    }
    float _2548 = _2498;
    float _2550 = _2548;
    if (_2486)
    {
        float _2552 = _2546 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2534 = _2552;
    }
    float _2554 = _2534;
    float _2556 = _2526;
    float _2558 = _2554;
    if (_2486)
    {
        float _2560 = fma(_2526, _2554, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2556 = _2560;
    }
    float _2562 = _2556;
    float _2564 = _2562;
    float _2566 = _2540;
    if (_2486)
    {
        float _2568 = _2540 + (-1.0);
        _2558 = _2568;
    }
    float _2570 = _2558;
    float _2572 = _2570;
    if (_2486)
    {
        float _2574 = _2506 * _2562;
        _2068 = _2574;
    }
    float _2576 = _2068;
    if (!_2486)
    {
        _2564 = _2546;
    }
    float _2578 = _2564;
    float _2580 = _2578;
    if (_2486)
    {
        float _2582 = _2570 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2520 = _2582;
    }
    float _2584 = _2520;
    if (_2486)
    {
        float _2586 = _2474 * _2576;
        _2550 = _2586;
    }
    float _2588 = _2550;
    if (!_2486)
    {
        _2572 = _2476;
    }
    float _2590 = _2572;
    float _2592 = _2590;
    if (_2486)
    {
        float _2594 = _2476 * _2576;
        _2592 = _2594;
    }
    float _2596 = _2592;
    if (!_2486)
    {
        _2508 = _2478;
    }
    float _2598 = _2508;
    float _2600 = _2598;
    if (_2486)
    {
        float _2602 = fma(_2546, _2540, _2584);
        _2580 = _2602;
    }
    float _2604 = _2580;
    if (_2486)
    {
        float _2606 = _2588 * _2588;
        _2600 = _2606;
    }
    float _2608 = _2600;
    if (!_2486)
    {
        _2566 = _2480;
    }
    float _2610 = _2566;
    float _2612 = _2610;
    if (_2486)
    {
        float _2614 = _2596 * _2596;
        _2612 = _2614;
    }
    float _2616 = _2612;
    float _2618 = fma(_2604, _2604, _2608);
    float _2620 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2622 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2624 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2626 = _2618 + _2616;
    float _2628 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2620);
    float _2630 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2632 = fma(_2470, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2630);
    float _2634 = precise::clamp(_2632, 0.0, 1.0);
    float _2636 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2638 = rsqrt(_2626);
    float _2640 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2628);
    float _2642 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2644 = -_2634;
    float _2646 = _2644 + 1.0;
    float _2648 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2636);
    float _2650 = _2640 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2652 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2642);
    float _2654 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2624);
    float _2656 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2648);
    float _2658 = _2650 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2660 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2652);
    float _2662 = abs(_2646);
    float _2664 = log2(_2662);
    float _2666 = _2656 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2668 = -_2658;
    float _2670 = fma(_2668, _2622, 1.0);
    float _2672 = _2660 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2674 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2654);
    float _2676 = _2638 * _2588;
    float _2678 = _2666 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2680 = _2638 * _2604;
    float _2682 = _2638 * _2596;
    float _2684 = _2676 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2686 = fma(_2672, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2678);
    float _2688 = _2674 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2690 = log2(_2670);
    float _2692 = -_2684;
    float _2694 = fma(_2680, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2692);
    float _2696 = fma(_2650, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2686);
    float _2698 = _2680 + 1.0;
    float _2700 = _2664 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2702 = -_2682;
    float _2704 = fma(_2702, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2694);
    float _2706 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2696);
    float _2708 = _2666 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2710 = _2666 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2712 = fma(_2704, -0.5, 0.5);
    float _2714 = 1.0 / _2706;
    float _2716 = fma(_2704, 0.5, 0.5);
    float _2718 = fma(_2672, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2708);
    float _2720 = fma(_2672, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2710);
    float _2722 = fma(_2716, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2724 = fma(_2650, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2718);
    float _2726 = fma(_2650, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2720);
    float _2728 = sqrt(_2712);
    float _2730 = fma(_2716, _2722, -0.212114393711090087890625);
    float _2732 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2724);
    float _2734 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2726);
    float _2736 = _2690 * 0.693147182464599609375;
    float _2738 = fma(_2716, _2730, 1.570728778839111328125);
    float _2740 = exp2(_2700);
    float _2742 = _2732 * _2714;
    float _2744 = _2734 * _2714;
    float _2746 = _2736 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2748 = fma(_2742, 0.5, 0.5);
    float _2750 = fma(_2744, -0.5, 0.5);
    float _2752 = _2728 * 0.636619746685028076171875;
    float3 _7559 = float3(_2748, _2750, _2746);
    float _2754 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7559, float3(0.0), isnan(_7559)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7559, float3(0.0), isnan(_7559)), level(0.0)).x;
    float _2756 = -_2738;
    float _2758 = fma(_2752, _2756, 1.0);
    float _2760 = -_2680;
    float _2762 = fma(_2740, _2698, _2760);
    float _2764 = fma(_2762, 0.5, 0.5);
    float3 _7583 = float3(_2748, _2750, _2746);
    float4 _2767 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7583, float3(0.0), isnan(_7583)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7583, float3(0.0), isnan(_7583)), level(0.0)).xyzw;
    float _2769 = _2767.x;
    float _2771 = _2767.y;
    float _2773 = _2767.z;
    float _2775 = _2767.w;
    float2 _7600 = float2(_2758, _2764);
    float3 _2779 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7600, float2(0.0), isnan(_7600)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7600, float2(0.0), isnan(_7600)), level(0.0)).xyz;
    float _2781 = _2779.x;
    float _2783 = _2779.y;
    float _2785 = _2779.z;
    float _2787 = -(*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2789 = _2258 * _2787;
    float _2791 = -(*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2793 = _2258 * _2791;
    float _2795 = -(*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2797 = _2258 * _2795;
    float _2799 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2801 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2803 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2805 = _2082 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2807 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2799);
    float _2809 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2801);
    float _2811 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2789);
    float _2813 = _241 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2815 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2803);
    float _2817 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2805);
    float _2819 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2793);
    float _2821 = fma(_2813, _2813, 1.0);
    float _2823 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2797);
    float _2825 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2807);
    float _2827 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2809);
    float _2829 = rsqrt(_2821);
    float _2831 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2815);
    float _2833 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2817);
    float _2835 = _2296 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2837 = _2296 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2839 = _2296 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2841 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2843 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2845 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2847 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2835);
    float _2849 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2837);
    float _2851 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2839);
    float _2853 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2841);
    float _2855 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2843);
    float _2857 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2845);
    float _2859 = fma(_2328, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2819);
    float _2861 = fma(_2328, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2811);
    float _2863 = _2813 * _2829;
    float _2865 = fma(_2328, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2823);
    float _2867 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2847);
    float _2869 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2849);
    float _2871 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2851);
    float _2873 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2853);
    float _2875 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2855);
    float _2877 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2857);
    float _2879 = -_2861;
    float _2881 = _2863 * _2879;
    float _2883 = _2827 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2885 = -_2865;
    float _2887 = _2863 * _2885;
    float _2889 = -_2859;
    float _2891 = _2863 * _2889;
    float _2893 = _2813 * _2873;
    float _2895 = fma(_2829, _2875, _2881);
    float _2897 = _2813 * _2875;
    float _2899 = _2813 * _2877;
    float _2901 = _237 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2903 = fma(_2829, _2877, _2887);
    float _2905 = _2825 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2907 = _2883 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2909 = _2883 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2911 = _2883 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2913 = fma(_2829, _2873, _2891);
    float _2915 = _2883 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2917 = fma(_2901, _2867, _2893);
    float _2919 = fma(_2905, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2907);
    float _2921 = -_443;
    float _2923 = _2921 + _2440;
    float _2925 = fma(_2905, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2909);
    float _2927 = fma(_2905, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2911);
    float _2929 = fma(_2905, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2915);
    out.m_72.x = _2867;
    out.m_72.y = _2869;
    out.m_72.z = _2871;
    float _2931 = fma(_2901, _2869, _2897);
    float _2933 = _2923 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _2935 = -_441;
    float _2937 = _2935 + _2444;
    float _2939 = fma(_2901, _2871, _2899);
    float _2941 = _2831 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2943 = _2666 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2945 = -_445;
    float _2947 = _2945 + _2448;
    float _2949 = fma(_2937, (*spvDescriptorSet0.vp_c15)._m0[638].x, _2933);
    float _2951 = _2941 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _2953 = fma(_2672, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2943);
    float _2955 = fma(_2941, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2927);
    float _2957 = _2923 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _2959 = _2923 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _2961 = fma(_2947, (*spvDescriptorSet0.vp_c15)._m0[638].z, _2949);
    float _2963 = _2951 + _2929;
    float _2965 = fma(_2937, (*spvDescriptorSet0.vp_c15)._m0[635].x, _2957);
    float _2967 = fma(_2937, (*spvDescriptorSet0.vp_c15)._m0[636].x, _2959);
    float _2969 = _2833 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2971 = fma(_2650, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2953);
    float _2973 = fma(_2947, (*spvDescriptorSet0.vp_c15)._m0[635].z, _2965);
    float _2975 = fma(_2947, (*spvDescriptorSet0.vp_c15)._m0[636].z, _2967);
    float _2977 = _2664 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2979 = fma(_2969, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2963);
    float _2981 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2971);
    float _2983 = _2961 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _2985 = fma(_2969, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2955);
    float _2987 = 1.0 / _2979;
    out.m_74.x = _2913;
    out.m_74.y = _2895;
    out.m_74.z = _2903;
    float _2989 = _2981 + _2706;
    float _2991 = _2941 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    out.gl_Position.x = _2732;
    out.gl_Position.y = _2734;
    out.gl_Position.z = _2981;
    out.gl_Position.w = _2706;
    float _2993 = _2989 * 0.5;
    float _2995 = _2941 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _2997 = exp2(_2977);
    out.m_76.y = 1.0;
    float _2999 = _2975 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _3001 = _2995 + _2925;
    float _3003 = _2973 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _3005 = _2732 + _2706;
    float _3007 = _2706 * 0.5;
    float _3009 = 1.0 / _2983;
    float _3011 = _2985 * _2987;
    float _3013 = _3005 * 0.5;
    float _3015 = fma(_2734, -0.5, _3007);
    float _3017 = _2859 + _2917;
    float _3019 = _2865 + _2939;
    bool _3021 = _3011 > 0.0;
    out.m_78.x = _2444;
    out.m_78.y = _2440;
    out.m_78.z = _2448;
    float _3023 = -_2997;
    float _3025 = _3023 + 1.0;
    float _3027 = fma(_2969, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3001);
    bool _3029 = _3011 < 1.0;
    bool _3031 = _3029 && _3021;
    out.m_80.x = _3013;
    out.m_80.y = _3015;
    out.m_80.z = _2993;
    out.m_80.w = _2706;
    float _3033 = _3025 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3035 = _3027 * _2987;
    bool _3037 = _2742 > (-1.0);
    bool _3039 = _3037 && _3031;
    float _3041 = -_3033;
    float _3043 = _3041 + 1.0;
    float _3045 = _3003 * _3009;
    float _3047 = _2861 + _2931;
    bool _3049 = _2744 > (-1.0);
    bool _3051 = _3049 && _3039;
    float _3053 = _2991 + _2919;
    float _3055 = _2999 * _3009;
    out.m_82.x = _3017;
    out.m_82.y = _3047;
    out.m_82.z = _3019;
    bool _3057 = _2742 < 1.0;
    bool _3059 = _3057 && _3051;
    float _3061 = fma(_2969, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3053);
    bool _3063 = _2744 < 1.0;
    bool _3065 = _3063 && _3059;
    float _3067 = _3061 * _2987;
    float _3069 = _3033 * _2754;
    float _3071 = _2775 * _3069;
    float _3073 = _2775 * _3043;
    float _3075 = _2785 * _3069;
    float _3077 = fma(_2781, _3071, _2769);
    float _3079 = fma(_2783, _3071, _2771);
    float _3081 = fma(_2775, _3075, _2773);
    out.m_84.x = _3077;
    out.m_84.y = _3079;
    out.m_84.z = _3081;
    out.m_84.w = _3073;
    bool _3083 = !_3065;
    float _3085 = _3079;
    float _3087 = _2732;
    float _3089 = _3077;
    float _3091 = _2734;
    float _3093 = _2706;
    float _3119;
    float _3121;
    float _3129;
    if (!_3083)
    {
        float _3095 = -_3035;
        float _3097 = _2744 + _3095;
        float _3099 = -_3067;
        float _3101 = _2742 + _3099;
        float _3103 = -_3045;
        float _3105 = _2742 + _3103;
        float _3107 = -_3055;
        float _3109 = _2744 + _3107;
        float _3111 = _3097 * _3097;
        float _3113 = fma(_3101, _3101, _3111);
        float _3115 = sqrt(_3113);
        bool _3117 = _3115 > 0.0;
        _3119 = _3113;
        _3121 = _3115;
        if (!_3117)
        {
            _3085 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _3123 = _3085;
        bool _3125 = !_3117;
        float _3127 = _3123;
        _3129 = _3123;
        _3131 = _3125;
        if (!_3131)
        {
            float _3133 = _3109 * _3109;
            float _3135 = fma(_3105, _3105, _3133);
            float _3137 = rsqrt(_3113);
            float _3139 = sqrt(_3135);
            float _3141 = _3101 * _3137;
            float _3143 = _3097 * _3137;
            bool _3145 = _3139 > 0.0;
            _3089 = _3139;
            _3121 = _3137;
            if (!_3145)
            {
                _3127 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
            }
            float _3147 = _3127;
            bool _3149 = !_3145;
            _3129 = _3147;
            _3131 = _3149;
            if (!_3131)
            {
                float _3151 = _2292 * _2969;
                float _3153 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
                float _3155 = fma(_3151, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2951);
                float _3157 = fma(_3151, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2991);
                float _3159 = fma(_3151, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2995);
                float _3161 = fma(_2969, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3155);
                float _3163 = fma(_2969, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3159);
                float _3165 = fma(_2969, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3157);
                float _3167 = 1.0 / _3161;
                float _3169 = _3153 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _3171 = _3109 * _3169;
                float _3173 = _3105 * _3169;
                float _3175 = rsqrt(_3135);
                float _3177 = _3171 * _3171;
                float _3179 = fma(_3173, _3173, _3177);
                float _3181 = _3163 * _3167;
                float _3183 = _3165 * _3167;
                float _3185 = _3181 * _3181;
                float _3187 = sqrt(_3179);
                float _3189 = fma(_3183, _3183, _3185);
                float _3191 = _3109 * _3175;
                float _3193 = _3105 * _3175;
                float _3195 = sqrt(_3189);
                float _3197 = _3143 * _3191;
                float _3199 = fma(_3141, _3193, _3197);
                float _3201 = precise::min(0.0, _3199);
                float _3203 = _2706 * _3201;
                float _3205 = fma(_3187, (*spvDescriptorSet0.vp_c13)._m0[1].x, _3195);
                float _3207 = fma(_3173, _3203, _2732);
                float _3209 = 1.0 / _3205;
                float _3211 = fma(_3171, _3203, _2734);
                out.gl_Position.x = _3207;
                out.gl_Position.y = _3211;
                float _3213 = _3195 * _3209;
                out.m_76.y = _3213;
                _3087 = _3207;
                _3089 = _3171;
                _3091 = _3211;
                _3119 = _3203;
                _3121 = _3199;
                _3129 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
                _3131 = true;
            }
        }
    }
    else
    {
        float _3215 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _3215;
        _3087 = 0.0;
        _3091 = 0.0;
        _3119 = _3215;
        _3121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
        _3129 = 0.0;
    }
    _3131 = false;
    float _3217 = _3087;
    float _3219 = _3089;
    float _3221 = _3091;
    float _3223 = _3119;
    float _3225 = _3121;
    float _3227 = _3129;
    bool _3229 = _2470 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3231 = isnan(_2470);
    bool _3233 = _3229 || _3231;
    bool _3235 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3237 = _3233 || _3235;
    float _3239 = _3219;
    float _3241 = _3223;
    float _3243 = _3221;
    float _3245 = _3217;
    float _3247 = _3225;
    if (!_3237)
    {
        _3239 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3249 = _3239;
    float _3251 = _3249;
    float _3253 = _3249;
    if (!_3237)
    {
        _3093 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3255 = _3093;
    float _3257 = _3255;
    float _3259 = _3255;
    if (!_3237)
    {
        _3241 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3261 = _3241;
    float _3263 = _3261;
    float _3265 = _3261;
    if (!_3237)
    {
        _3243 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3267 = _3243;
    float _3269 = _3267;
    float _3271 = _3267;
    if (!_3237)
    {
        _3245 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3273 = _3245;
    float _3275 = _3273;
    float _3277 = _3273;
    if (!_3237)
    {
        _3247 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3279 = _3247;
    bool _3281 = !_3237;
    float _3283 = _3279;
    float _3285 = _3279;
    if (!_3281)
    {
        bool _3287 = _2470 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3289 = isnan(_2470);
        bool _3291 = _3287 || _3289;
        bool _3293 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3295 = _3291 || _3293;
        if (!_3295)
        {
            float _3297 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3299 = _2470 + _3297;
            float _3301 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3303 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3301;
            float _3305 = 1.0 / _3303;
            float _3307 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3309 = _3307 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3311 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3313 = _3311 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3315 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3317 = _3315 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3319 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3321 = _3319 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3323 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3325 = _3323 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3327 = _3299 * _3305;
            float _3329 = precise::clamp(_3327, 0.0, 1.0);
            float _3331 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3333 = _3331 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3335 = fma(_3329, _3309, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3337 = fma(_3329, _3333, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3339 = fma(_3329, _3313, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3341 = fma(_3329, _3317, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3343 = fma(_3329, _3321, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3345 = fma(_3329, _3325, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3259 = _3337;
            _3277 = _3343;
            _3253 = _3335;
            _3271 = _3341;
            _3265 = _3339;
            _3285 = _3345;
            _3347 = true;
        }
        else
        {
            bool _3349 = _2470 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3351 = isnan(_2470);
            bool _3353 = _3349 || _3351;
            bool _3355 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3357 = _3353 || _3355;
            if (!_3357)
            {
                _3251 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3359 = _3251;
            _3253 = _3359;
            if (!_3357)
            {
                _3257 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3361 = _3257;
            _3259 = _3361;
            if (!_3357)
            {
                _3263 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3363 = _3263;
            _3265 = _3363;
            if (!_3357)
            {
                _3269 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3365 = _3269;
            _3271 = _3365;
            if (!_3357)
            {
                _3275 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3367 = _3275;
            _3277 = _3367;
            if (!_3357)
            {
                _3283 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3369 = _3283;
            bool _3371 = !_3357;
            _3285 = _3369;
            if (!_3371)
            {
                bool _3373 = _2470 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3375 = isnan(_2470);
                bool _3377 = _3373 || _3375;
                bool _3379 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3381 = _3377 || _3379;
                if (!_3381)
                {
                    float _3383 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3385 = _2470 + _3383;
                    float _3387 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3389 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3387;
                    float _3391 = 1.0 / _3389;
                    float _3393 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3395 = _3393 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3397 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3399 = _3397 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3401 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3403 = _3401 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3405 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3407 = _3405 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3409 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3411 = _3409 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3413 = _3385 * _3391;
                    float _3415 = precise::clamp(_3413, 0.0, 1.0);
                    float _3417 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3419 = _3417 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3421 = fma(_3415, _3395, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3423 = fma(_3415, _3419, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3425 = fma(_3415, _3399, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3427 = fma(_3415, _3403, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3429 = fma(_3415, _3407, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3431 = fma(_3415, _3411, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3259 = _3423;
                    _3277 = _3429;
                    _3253 = _3421;
                    _3271 = _3427;
                    _3265 = _3425;
                    _3285 = _3431;
                    _3347 = true;
                }
                else
                {
                    _3259 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3277 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3253 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3271 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3265 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3285 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3347 = false;
    float _3433 = _3259;
    float _3435 = _3277;
    float _3437 = _3253;
    float _3439 = _3271;
    float _3441 = _3265;
    float _3443 = _3285;
    float _3445 = fma(_3047, -0.5, 0.5);
    float _3447 = precise::clamp(_3445, 0.0, 1.0);
    float _3449 = -_3433;
    float _3451 = _3449 + _3435;
    float _3453 = -_3437;
    float _3455 = _3453 + _3439;
    float _3457 = -_3441;
    float _3459 = _3457 + _3443;
    bool _3461 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3463 = fma(_3447, _3451, _3433);
    float _3465 = fma(_3447, _3455, _3437);
    float _3467 = fma(_3447, _3459, _3441);
    float _3469 = _3227 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3471 = _3463 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3473 = fma(_3465, 0.298911988735198974609375, _3471);
    out.m_76.w = _3469;
    float _3475 = fma(_3467, 0.114477999508380889892578125, _3473);
    float _3477 = -_3475;
    float _3479 = _3465 + _3477;
    float _3481 = -_3475;
    float _3483 = _3463 + _3481;
    float _3485 = -_3475;
    float _3487 = _3467 + _3485;
    out.m_86.x = 0.0;
    float _3489 = fma(_3479, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3475);
    float _3491 = fma(_3483, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3475);
    float _3493 = fma(_3487, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3475);
    out.m_88.x = _3489;
    out.m_88.y = _3491;
    out.m_88.z = _3493;
    if (!_3461)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3495 = -_2440;
    float _3497 = _3495 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3499 = -_2444;
    float _3501 = _3499 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3503 = -_2448;
    float _3505 = _3503 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3507 = _3497 * _3497;
    float _3509 = fma(_3501, _3501, _3507);
    float _3511 = fma(_3505, _3505, _3509);
    float _3513 = sqrt(_3511);
    float _3515 = rsqrt(_3511);
    float _3517 = -_3513;
    float _3519 = _3517 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3521 = _3519 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3523 = precise::clamp(_3521, 0.0, 1.0);
    float _3525 = _3501 * _3515;
    float _3527 = _3497 * _3515;
    float _3529 = abs(_3523);
    float _3531 = log2(_3529);
    float _3533 = _3505 * _3515;
    float _3535 = _3525 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3537 = _3047 * _3527;
    float _3539 = -_3527;
    float _3541 = -_3535;
    float _3543 = fma(_3539, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3541);
    float _3545 = fma(_3017, _3525, _3537);
    float _3547 = -_3533;
    float _3549 = fma(_3547, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3543);
    float _3551 = fma(_3019, _3533, _3545);
    float _3553 = precise::clamp(_3551, 0.0, 1.0);
    float _3555 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3557 = _3549 + _3555;
    float _3559 = _3531 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3561 = _3557 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3563 = precise::clamp(_3561, 0.0, 1.0);
    float _3565 = exp2(_3559);
    float _3567 = _3565 * _3563;
    float _3569 = _3553 * _3567;
    float _3571 = _3569 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3573 = _3569 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3575 = _3569 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _3571;
    out.m_86.y = _3573;
    out.m_86.z = _3575;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

