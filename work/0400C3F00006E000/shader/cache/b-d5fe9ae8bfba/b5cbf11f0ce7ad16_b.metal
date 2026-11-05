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
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c12 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture3d<float> vp_t_tcb_32 [[id(7)]];
    sampler vp_t_tcb_32Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_30 [[id(9)]];
    sampler vp_t_tcb_30Smplr [[id(10)]];
    texture2d<float> vp_t_tcb_1C [[id(11)]];
    sampler vp_t_tcb_1CSmplr [[id(12)]];
    sampler vp_t_tcb_32Smplr_w [[id(13)]];
    sampler vp_t_tcb_30Smplr_w [[id(14)]];
    sampler vp_t_tcb_1CSmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_76 [[user(locn0)]];
    float4 m_86 [[user(locn1)]];
    float4 m_74 [[user(locn2)]];
    float4 m_92 [[user(locn3)]];
    float4 m_84 [[user(locn4)]];
    float4 m_90 [[user(locn5)]];
    float4 m_51 [[user(locn6)]];
    float4 m_94 [[user(locn7)]];
    float4 m_72 [[user(locn8)]];
    float4 m_80 [[user(locn9)]];
    float4 m_82 [[user(locn10)]];
    float4 m_88 [[user(locn11)]];
    float4 m_53 [[user(locn12)]];
    float4 m_57 [[user(locn13)]];
    float4 m_78 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_61 [[attribute(1)]];
    float4 m_59 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_70 [[attribute(4)]];
    float4 m_46 [[attribute(5)]];
    float4 m_48 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_68 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4203 = false;
    bool _3985 = false;
    bool _2748 = false;
    bool _2736 = false;
    bool _681 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_46.w;
    float _110 = in.m_48.w;
    float _112 = trunc(_108);
    int _115 = int(_112);
    float _117 = -_110;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _119;
    bool _123 = _115 >= 1;
    float _125 = 0.0;
    float _127 = _110;
    float _129 = _119;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _125;
    if (!_123)
    {
        out.m_53.x = 0.0;
    }
    int _133 = 0;
    if (!_123)
    {
        float _135 = _131 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    int _139 = _137;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4513 = as_type<float>(_137);
        out.gl_Position.z = _4513;
    }
    if (!_123)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _141 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_110);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = in.m_55.x;
    float _153 = float(_115);
    float _155 = in.m_55.y;
    bool _157 = _119 >= _153;
    bool _159 = !_149;
    bool _161 = _157 || _159;
    float _163 = in.m_55.z;
    if (_161)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _127;
    if (_161)
    {
        out.m_53.x = 0.0;
    }
    if (_161)
    {
        float _167 = _165 * 5.0;
        _139 = as_type<int>(_167);
    }
    int _169 = _139;
    out.m_57.x = _151;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4576 = as_type<float>(_169);
        out.gl_Position.z = _4576;
    }
    out.m_57.y = _155;
    out.m_57.z = _163;
    if (_161)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _171 = in.m_59.x;
    float _173 = in.m_59.y;
    float _175 = in.m_59.z;
    float _177 = in.m_61.x;
    float _179 = in.m_61.y;
    float _181 = in.m_61.z;
    float _183 = in.m_63.x;
    float _185 = in.m_63.y;
    float _187 = in.m_63.z;
    float _189 = as_type<float>(int(gl_VertexIndex));
    float _191 = in.m_68.w;
    float _193 = in.m_46.x;
    float _195 = in.m_46.y;
    float _197 = in.m_46.z;
    float _199 = _171 * _171;
    float _201 = _173 * _173;
    float _203 = fma(_177, _177, _199);
    float _205 = fma(_179, _179, _201);
    float _207 = fma(_183, _183, _203);
    float _209 = _175 * _175;
    float _211 = fma(_185, _185, _205);
    float _213 = sqrt(_207);
    float _215 = fma(_181, _181, _209);
    float _217 = fma(_187, _187, _215);
    float _219 = sqrt(_211);
    float _221 = sqrt(_217);
    bool _223 = _213 > 0.0;
    bool _225 = _219 > 0.0;
    float _227 = 0.0;
    float _229 = _207;
    float _231 = _181;
    if (_223)
    {
        float _233 = rsqrt(_207);
        _227 = _233;
    }
    float _235 = _227;
    float _237 = 0.0;
    if (!_223)
    {
        _237 = 0.0;
    }
    float _239 = _237;
    bool _241 = _221 > 0.0;
    float _243 = 0.0;
    float _245 = _239;
    if (!_223)
    {
        _243 = 0.0;
    }
    float _247 = _243;
    int _249 = as_type<int>(_189) & 1;
    bool _251 = _249 != 0;
    int _253 = as_type<int>(_189) & 2;
    bool _255 = _253 != 0;
    float _257 = 0.0;
    float _259 = _247;
    if (_225)
    {
        float _261 = rsqrt(_211);
        _257 = _261;
    }
    float _263 = _257;
    float _265 = in.m_48.x;
    float _267 = in.m_48.y;
    float _269 = in.m_48.z;
    bool _271 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _273 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _275 = _271 || _273;
    bool _277 = isnan(1.0);
    bool _279 = _275 || _277;
    float _281 = 0.0;
    float _283 = 0.0;
    if (!_225)
    {
        _281 = 0.0;
        _283 = 0.0;
    }
    float _285 = _281;
    float _287 = _283;
    float _289 = _285;
    float _291 = _287;
    if (!_223)
    {
        _229 = 0.0;
    }
    float _293 = _229;
    float _295 = 0.0;
    float _297 = _293;
    if (!_225)
    {
        _295 = 0.0;
    }
    float _299 = _295;
    float _301 = 0.0;
    float _303 = _299;
    if (_241)
    {
        float _305 = rsqrt(_217);
        _301 = _305;
    }
    float _307 = _301;
    int _309 = int(_251);
    int _311 = _255 ? 2 : 0;
    int _313 = _309 | _311;
    int _315 = _223 ? 4 : 0;
    int _317 = _313 | _315;
    int _319 = _225 ? 8 : 0;
    int _321 = _317 | _319;
    int _323 = _241 ? 16 : 0;
    int _325 = _321 | _323;
    int _327 = _279 ? 32 : 0;
    int _329 = _325 | _327;
    int _331 = false ? 64 : 0;
    int _333 = _329 | _331;
    int _335 = _333 & 32;
    float _337 = 0.0;
    float _339 = 0.0;
    float _341 = as_type<float>(_335);
    if (!_241)
    {
        _337 = 0.0;
        _339 = 0.0;
    }
    float _343 = _337;
    float _345 = _339;
    float _347 = _345;
    float _349 = _343;
    if (_223)
    {
        float _351 = _235 * _177;
        _245 = _351;
    }
    float _353 = _245;
    if (_223)
    {
        float _355 = _235 * _171;
        _297 = _355;
    }
    float _357 = _297;
    if (_223)
    {
        float _359 = _235 * _183;
        _259 = _359;
    }
    float _361 = _259;
    float _363 = 0.0;
    if (!_241)
    {
        _363 = 0.0;
    }
    float _365 = _363;
    float _367 = _365;
    if (_225)
    {
        float _369 = _263 * _179;
        _303 = _369;
    }
    float _371 = _303;
    float _373 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _375 = _373;
    if (_225)
    {
        float _377 = _263 * _173;
        _289 = _377;
    }
    float _379 = _289;
    if (_225)
    {
        float _381 = _263 * _185;
        _291 = _381;
    }
    float _383 = _291;
    bool _385 = !_251;
    float _387 = _385 ? (-0.5) : 0.5;
    if (!_279)
    {
        float _389 = _373 * _373;
        float _391 = _389 * 0.5;
        _341 = _391;
    }
    float _393 = _341;
    bool _395 = !_255;
    float _397 = _395 ? (-0.5) : 0.5;
    float _399 = _393;
    float _401 = _265;
    float _403 = _269;
    if (_241)
    {
        float _405 = _307 * _181;
        _347 = _405;
    }
    float _407 = _347;
    if (_241)
    {
        float _409 = _307 * _175;
        _349 = _409;
    }
    float _411 = _349;
    if (_241)
    {
        float _413 = _307 * _187;
        _367 = _413;
    }
    float _415 = _367;
    if (!_279)
    {
        float _417 = _393 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _399 = _417;
    }
    float _419 = _399;
    bool _421 = !_279;
    float _423 = _419;
    if (!_421)
    {
        float _425 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _427 = log2(_425);
        float _429 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _431 = _429 + 1.0;
        float _433 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _435 = _373 * _427;
        float _437 = 1.0 / _431;
        float _439 = _433 * 0.693147182464599609375;
        float _441 = exp2(_435);
        float _443 = 1.0 / _439;
        float _445 = _441 + (-1.0);
        float _447 = -_445;
        float _449 = fma(_447, _443, _373);
        float _451 = _449 * _437;
        float _453 = _451 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _423 = _453;
    }
    float _455 = _423;
    float _457 = _455 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _459 = !_279;
    float _461 = _457;
    float _463 = _455;
    if (!_459)
    {
        float _465 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _467 = log2(_465);
        float _469 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _471 = _469 + 1.0;
        float _473 = 1.0 / _471;
        float _475 = _373 * _467;
        float _477 = exp2(_475);
        float _479 = -_477;
        float _481 = _479 + 1.0;
        float _483 = _481 * _473;
        _375 = _483;
    }
    float _485 = _375;
    float _487 = _455 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _489 = _457 * _357;
    float _491 = _457 * _379;
    float _493 = _457 * _411;
    float _495 = _485;
    if (!_279)
    {
        float _497 = _119 * _119;
        float _499 = _497 * 0.5;
        _461 = _499;
    }
    float _501 = _461;
    float _503 = fma(_487, _353, _489);
    float _505 = fma(_487, _371, _491);
    float _507 = fma(_487, _407, _493);
    float _509 = _455 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_279)
    {
        float _511 = _501 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _463 = _511;
    }
    float _513 = _463;
    bool _515 = !_279;
    float _517 = _513;
    if (!_515)
    {
        float _519 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _521 = log2(_519);
        float _523 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _525 = _523 + 1.0;
        float _527 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _529 = _119 * _521;
        float _531 = 1.0 / _525;
        float _533 = _527 * 0.693147182464599609375;
        float _535 = exp2(_529);
        float _537 = 1.0 / _533;
        float _539 = _535 + (-1.0);
        float _541 = -_539;
        float _543 = fma(_541, _537, _119);
        float _545 = _543 * _531;
        float _547 = _545 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _517 = _547;
    }
    float _549 = _517;
    float _551 = _549 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _553 = fma(_509, _361, _503);
    float _555 = fma(_509, _383, _505);
    float _557 = _549 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _559 = _551 * _357;
    float _561 = _551 * _379;
    float _563 = _551 * _411;
    float _565 = fma(_509, _415, _507);
    float _567 = fma(_557, _353, _559);
    float _569 = fma(_557, _371, _561);
    float _571 = fma(_557, _407, _563);
    float _573 = _549 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _575 = fma(_485, _265, _553);
    float _577 = fma(_485, _267, _555);
    float _579 = fma(_485, _269, _565);
    float _581 = fma(_573, _361, _567);
    float _583 = fma(_573, _383, _569);
    float _585 = fma(_573, _415, _571);
    if (!_279)
    {
        _495 = _119;
    }
    float _587 = _495;
    bool _589 = !_279;
    float _591 = _587;
    if (!_589)
    {
        float _593 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _595 = log2(_593);
        float _597 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _599 = _597 + 1.0;
        float _601 = 1.0 / _599;
        float _603 = _119 * _595;
        float _605 = exp2(_603);
        float _607 = -_605;
        float _609 = _607 + 1.0;
        float _611 = _609 * _601;
        _591 = _611;
    }
    float _613 = _591;
    float _615 = fma(_613, _267, _583);
    float _617 = 1.0 / _153;
    bool _619 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _621 = fma(_613, _265, _581);
    float _623 = -_615;
    float _625 = _577 + _623;
    float _627 = fma(_613, _269, _585);
    float _629 = fma(_577, _191, _195);
    float _631 = fma(_575, _191, _193);
    float _633 = -_621;
    float _635 = _575 + _633;
    float _637 = _625 * _179;
    float _639 = _625 * _173;
    float _641 = _625 * _185;
    float _643 = -_627;
    float _645 = _579 + _643;
    float _647 = fma(_635, _177, _637);
    float _649 = fma(_635, _171, _639);
    float _651 = fma(_635, _183, _641);
    float _653 = fma(_579, _191, _197);
    float _655 = fma(_645, _181, _647);
    float _657 = fma(_645, _175, _649);
    float _659 = fma(_645, _187, _651);
    float _661 = _119 * _617;
    bool _663 = !_619;
    float _679;
    if (!_663)
    {
        float _665 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _667 = _151 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _669 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _671 = _669 * _665;
        float _673 = floor(_671);
        float _675 = -_673;
        float _677 = _671 + _675;
        _679 = _677;
        _681 = true;
    }
    else
    {
        _679 = _661;
    }
    _681 = false;
    float _683 = _679;
    float _685 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _687 = int(_685);
    float _689 = in.m_55.w;
    float _691 = _151 * 2.0;
    float _693 = _629 * _173;
    float _695 = _629 * _185;
    int _697 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _699 = _697 != 0;
    float _701 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _703 = int(_701);
    float _705 = _151 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _709 = _707 != 0;
    int _711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _713 = _711 != 0;
    int _715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _717 = _715 != 0;
    float _719 = fma(_631, _171, _693);
    bool _721 = _151 > 0.5;
    float _723 = fma(_631, _183, _695);
    float _725 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _727 = int(_725);
    float _729 = float(_687);
    float _731 = in.m_63.w;
    bool _733 = !_713;
    int _735 = _733 ? 0 : 1;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _739 = -_387;
    int _741 = _721 ? as_type<int>(_739) : as_type<int>(_387);
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _745 = _683 + _743;
    bool _747 = _155 > 0.5;
    float _749 = 1.0 / _729;
    float _751 = float(_703);
    float _753 = -_737;
    float _755 = fma(_705, 2.0, _753);
    bool _757 = _689 > 0.5;
    float _759 = in.m_59.w;
    float _761 = _155 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _763 = !_709;
    int _765 = _763 ? 0 : 1;
    float _767 = 1.0 / _751;
    float _769 = float(uint(_727));
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _773 = _771 != 0;
    float _775 = -_397;
    float _777 = _757 ? _775 : _397;
    bool _779 = !_773;
    int _781 = _779 ? 0 : 1;
    float _783 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _785 = int(_783);
    float _787 = _119 * _749;
    float _789 = _155 * 2.0;
    int _791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _793 = _791 != 0;
    int _795 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _797 = _795 != 0;
    float _799 = _163 * 2.0;
    float _801 = 1.0 / _769;
    float _803 = _119 * _767;
    bool _805 = !_797;
    float _807 = _805 ? _387 : as_type<float>(_741);
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _811 = _809 != 0;
    bool _813 = !_717;
    int _815 = _813 ? 0 : 1;
    float _817 = trunc(_787);
    int _819 = int(_817);
    float _821 = float(uint(_785));
    int _823 = ~_785;
    int _825 = _823 + 1;
    float _827 = 0.0;
    float _829 = _777;
    if (_699)
    {
        _827 = 1.0;
    }
    float _831 = _827;
    float _833 = 0.0;
    float _835 = _831;
    if (_699)
    {
        _833 = _151;
    }
    float _837 = _833;
    float _839 = 1.0 / _821;
    int _841 = as_type<int>(_801) + (-2);
    float _843 = 0.0;
    float _845 = _837;
    if (_699)
    {
        _843 = 1.0;
    }
    float _847 = _843;
    float _849 = _847;
    if (!_699)
    {
        _835 = 7.345489978790283203125;
    }
    float _851 = _835;
    if (!_699)
    {
        _845 = _155;
    }
    float _853 = _845;
    float _855 = trunc(_803);
    int _857 = int(_855);
    float _859 = float(uint(_819));
    float _861 = _851 * _151;
    if (!_699)
    {
        _849 = 1.2345600128173828125;
    }
    float _863 = _849;
    float _865 = as_type<float>(_841) * _859;
    float _867 = floor(_691);
    int _869 = as_type<int>(_839) + (-2);
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _871;
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _877 = _853 * _863;
    bool _879 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _881 = isnan(_683);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _887 = _883 || _885;
    float _889 = float(_887);
    float _891 = float(uint(_857));
    float _893 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _895 = log2(_893);
    float _897 = fma(_761, -2.0, _875);
    float _899 = _151 + _155;
    float _901 = as_type<float>(_869) * _891;
    float _903 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _897);
    float _905 = _899 + (-1.0);
    bool _907 = _867 > 0.0;
    float _909 = trunc(_865);
    float _911 = precise::max(_909, 0.0);
    uint _914 = uint(_911);
    bool _916 = _867 >= 0.0;
    bool _918 = isnan(_867);
    bool _920 = _916 || _918;
    bool _922 = isnan(0.0);
    bool _924 = _920 || _922;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _926;
    float _930 = -_397;
    int _932 = _747 ? as_type<int>(_930) : as_type<int>(_397);
    bool _934 = _163 > 0.5;
    bool _936 = !_811;
    float _938 = _936 ? _397 : as_type<float>(_932);
    float _940 = trunc(_901);
    float _942 = precise::max(_940, 0.0);
    uint _944 = uint(_942);
    int _946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _948 = _946 != 0;
    float _950 = -_387;
    int _952 = _934 ? as_type<int>(_950) : as_type<int>(_387);
    int _954 = abs(_765);
    bool _956 = !_948;
    float _958 = _956 ? _387 : as_type<float>(_952);
    float _960 = floor(_789);
    int _962 = ~_727;
    int _964 = _962 + 1;
    int _966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _968 = _966 != 0;
    int _970 = abs(_815);
    int _972 = _964 * int(_914);
    int _974 = _972 + _819;
    bool _976 = !_968;
    int _978 = _976 ? 0 : 1;
    float _980 = floor(_799);
    int _982 = _924 ? 0 : 1;
    float _984 = float(uint(_974));
    int _986 = ~_982;
    int _988 = _986 + 1;
    int _990 = _988 + 1;
    int _992 = _990;
    int _994 = _974;
    if (!_907)
    {
        int _996 = ~_982;
        int _998 = _996 + 1;
        _992 = _998;
    }
    int _1000 = _992;
    float _1002 = _119 * _895;
    float _1004 = 1.0 / _873;
    bool _1006 = _960 > 0.0;
    bool _1008 = _960 >= 0.0;
    bool _1010 = isnan(_960);
    bool _1012 = _1008 || _1010;
    bool _1014 = isnan(0.0);
    bool _1016 = _1012 || _1014;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1020 = 1.0 + _1018;
    int _1022 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1024 = _1022 != 0;
    if (_699)
    {
        _994 = 0;
    }
    int _1026 = _994;
    float _1028 = exp2(_1002);
    bool _1030 = !_1024;
    int _1032 = _1030 ? 0 : 1;
    bool _1034 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1036 = isnan(0.0);
    bool _1038 = _1034 || _1036;
    bool _1040 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1042 = _1038 || _1040;
    int _1044 = _1026;
    if (!_699)
    {
        _1044 = 1;
    }
    int _1046 = _1044;
    float _1048 = float(_1000);
    float _1050 = 1.0 / _1020;
    int _1052 = _825 * int(_944);
    int _1054 = _1052 + _857;
    float _1056 = as_type<float>(_841) * _984;
    int _1058 = _1016 ? 0 : 1;
    int _1060 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1062 = _1060 != 0;
    int _1064 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1066 = _1064 != 0;
    int _1068 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1070 = _1068 != 0;
    float _1072 = float(uint(_1054));
    float _1074 = trunc(_1056);
    float _1076 = precise::max(_1074, 0.0);
    uint _1078 = uint(_1076);
    float _1080 = -_1028;
    float _1082 = _1080 + 1.0;
    bool _1084 = _1046 != 1;
    float _1086 = as_type<float>(_869) * _1072;
    int _1088 = ~_1058;
    int _1090 = _1088 + 1;
    int _1092 = _1090 + 1;
    int _1094 = _1092;
    if (!_1006)
    {
        int _1096 = ~_1058;
        int _1098 = _1096 + 1;
        _1094 = _1098;
    }
    int _1100 = _1094;
    float _1102 = trunc(_1086);
    float _1104 = precise::max(_1102, 0.0);
    uint _1106 = uint(_1104);
    float _1108 = _1042 ? _1082 : 0.0;
    bool _1110 = _980 > 0.0;
    bool _1112 = _980 >= 0.0;
    bool _1114 = isnan(_980);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan(0.0);
    bool _1120 = _1116 || _1118;
    float _1122 = _1108 * _1050;
    int _1124 = ~_785;
    int _1126 = _1124 + 1;
    int _1128 = int(_914) + int(_1078);
    int _1130 = ~_727;
    int _1132 = _1130 + 1;
    bool _1134 = !_793;
    float _1136 = _1134 ? _397 : _777;
    int _1138 = _1132 * _1128;
    int _1140 = _1138 + _819;
    int _1142 = int(_944) + int(_1106);
    int _1144 = _1120 ? 0 : 1;
    float _1146 = 0.0;
    if (!_1084)
    {
        _1146 = _155;
    }
    float _1148 = _1146;
    int _1150 = _1126 * _1142;
    int _1152 = _1150 + _857;
    float _1154 = 0.0;
    float _1156 = _1148;
    if (!_1084)
    {
        _1154 = _155;
    }
    float _1158 = _1154;
    float _1160 = 0.0;
    float _1162 = _1158;
    if (!_1084)
    {
        _1160 = _163;
    }
    float _1164 = _1160;
    float _1166 = _1164;
    if (!_1084)
    {
        _829 = _163;
    }
    float _1168 = _829;
    float _1170 = _1168;
    if (_1084)
    {
        _1156 = _151;
    }
    float _1172 = _1156;
    if (_1084)
    {
        _1162 = _151;
    }
    float _1174 = _1162;
    if (_1084)
    {
        _1166 = _155;
    }
    float _1176 = _1166;
    if (_1084)
    {
        _1170 = _155;
    }
    float _1178 = _1170;
    bool _1180 = !_1066;
    int _1182 = _1180 ? 0 : 1;
    bool _1184 = uint(_1140) >= uint(_727);
    bool _1186 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1188 = isnan(1.0);
    bool _1190 = _1186 || _1188;
    bool _1192 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1194 = _1190 || _1192;
    bool _1196 = uint(_1152) >= uint(_785);
    float _1198 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1200 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1198;
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1204 = _1202 != 0;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _1210 = ~_1144;
    int _1212 = _1210 + 1;
    int _1214 = _1212 + 1;
    int _1216 = _1214;
    if (!_1110)
    {
        int _1218 = ~_1144;
        int _1220 = _1218 + 1;
        _1216 = _1220;
    }
    int _1222 = _1216;
    float _1224 = 1.0 / _1200;
    bool _1226 = !_1194;
    float _1228 = _1226 ? _119 : _1122;
    float _1230 = _155 + _163;
    bool _1232 = !_1184;
    int _1234 = _1232 ? 0 : (-1);
    bool _1236 = !_1196;
    int _1238 = _1236 ? 0 : (-1);
    float _1240 = _1230 + (-1.0);
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1244 = _1242 != 0;
    int _1246 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1248 = _1246 != 0;
    int _1250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1252 = _1250 != 0;
    int _1254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1256 = _1254 != 0;
    float _1258 = _629 * _179;
    float _1260 = 1.0 / _1208;
    float _1262 = fma(_631, _177, _1258);
    float _1264 = _151 + _163;
    float _1266 = in.m_61.w;
    float _1268 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1270 = _745 * _1224;
    float _1272 = _1264 + (-1.0);
    float _1274 = fma(_653, _175, _719);
    float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1278 = _683 + _1276;
    float _1280 = fma(_653, _181, _1262);
    float _1282 = fma(_653, _187, _723);
    float _1284 = _1274 + _759;
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1288 = _683 + _1286;
    float _1290 = _1278 * _1260;
    float _1292 = _1282 + _731;
    float _1294 = _1288 * _1004;
    float _1296 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1298 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1300 = isnan(_683);
    bool _1302 = _1298 || _1300;
    bool _1304 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1306 = _1302 || _1304;
    float _1308 = float(_1306);
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1310;
    float _1314 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1316 = _1314 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1318 = _1284 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _1320 = fma(_1312, _1270, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1322 = _1292 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    bool _1324 = !_1070;
    int _1326 = _1324 ? 0 : 1;
    float _1328 = _1280 + _1266;
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1332 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1330;
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1336 = _1334 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1338 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1340 = fma(_1332, _1270, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _1342 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1344 = isnan(_683);
    bool _1346 = _1342 || _1344;
    bool _1348 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1350 = _1346 || _1348;
    float _1352 = float(_1350);
    float _1354 = fma(_1336, _1290, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _1356 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1358 = isnan(_683);
    bool _1360 = _1356 || _1358;
    bool _1362 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1364 = _1360 || _1362;
    float _1366 = float(_1364);
    float _1368 = fma(_1316, _1290, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1372 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1370;
    float _1374 = -_1352;
    float _1376 = _1374 + 1.0;
    float _1378 = floor(_861);
    float _1380 = -_1366;
    float _1382 = _1380 + 1.0;
    float _1384 = _1328 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _1386 = _1366 * _1376;
    float _1388 = -_119;
    float _1390 = fma(_1388, (*spvDescriptorSet0.vp_c9)._m0[76].x, _755);
    float _1392 = _807 + 0.5;
    float _1394 = _1308 * _1382;
    float _1396 = -_1308;
    float _1398 = _1396 + 1.0;
    float _1400 = fma(_928, _1294, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1402 = fma(_1392, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1390);
    float _1404 = fma(_1372, _1294, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1406 = floor(_877);
    float _1408 = _889 * _1398;
    float _1410 = _938 + (-0.5);
    float _1412 = -_889;
    float _1414 = _1412 + 1.0;
    bool _1416 = !_1062;
    int _1418 = _1416 ? 0 : 1;
    float _1420 = _1340 * _1408;
    float _1422 = _1320 * _1408;
    float _1424 = -_1410;
    float _1426 = -_903;
    float _1428 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1426);
    float _1430 = -_1378;
    float _1432 = _861 + _1430;
    float _1434 = fma(_1414, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1420);
    float _1436 = fma(_1414, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1422);
    float _1438 = _1318 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _1440 = _1318 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _1442 = fma(_1354, _1394, _1434);
    float _1444 = fma(_1368, _1394, _1436);
    float _1446 = float(_727);
    float _1448 = -_1406;
    float _1450 = _877 + _1448;
    float _1452 = fma(_1384, (*spvDescriptorSet0.vp_c12)._m0[6].x, _1438);
    float _1454 = _1318 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _1456 = float(_785);
    float _1458 = _1432 * _1446;
    float _1460 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1462 = float(_819);
    float _1464 = fma(_1384, (*spvDescriptorSet0.vp_c12)._m0[6].y, _1440);
    float _1466 = float(_857);
    float _1468 = _1450 * _1456;
    bool _1470 = _1462 >= _1446;
    bool _1472 = isnan(_1462);
    bool _1474 = _1470 || _1472;
    bool _1476 = isnan(_1446);
    bool _1478 = _1474 || _1476;
    float _1480 = float(_1478);
    float _1482 = _661 * _1446;
    float _1484 = _661 * _1456;
    bool _1486 = _1466 >= _1456;
    bool _1488 = isnan(_1466);
    bool _1490 = _1486 || _1488;
    bool _1492 = isnan(_1456);
    bool _1494 = _1490 || _1492;
    float _1496 = float(_1494);
    float _1498 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1460);
    float _1500 = fma(_1322, (*spvDescriptorSet0.vp_c12)._m0[8].x, _1452);
    float _1502 = _1172 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1504 = fma(_1384, (*spvDescriptorSet0.vp_c12)._m0[6].z, _1454);
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1508 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1510 = fma(_1322, (*spvDescriptorSet0.vp_c12)._m0[8].y, _1464);
    float _1512 = fma(_1322, (*spvDescriptorSet0.vp_c12)._m0[8].z, _1504);
    float _1514 = fma(_1400, _1386, _1442);
    float _1516 = fma(_1404, _1386, _1444);
    float _1518 = -_1506;
    float _1520 = fma(_1502, 2.0, _1518);
    float _1522 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1524 = abs(_1182);
    float _1526 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1508);
    int _1528 = abs(_1326);
    float _1530 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    int _1532 = abs(_1418);
    float _1534 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1536 = float(_1100);
    float _1538 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1514);
    float _1540 = in.m_70.x;
    float _1542 = in.m_70.y;
    float _1544 = in.m_70.z;
    float _1546 = float(_1528);
    float _1548 = fma(_1534, -2.0, _1522);
    float _1550 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1552 = float(_1222);
    float _1554 = _1500 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _1556 = float(_1532);
    float _1558 = _1546 * _1536;
    float _1560 = _1510 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _1562 = float(_1524);
    float _1564 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1516);
    float _1566 = _1556 * _1552;
    float _1568 = _1560 * _1530;
    float _1570 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1572 = _1512 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _1574 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1548);
    float _1576 = _1566 * (-2.0);
    float _1578 = _1562 * _1048;
    float _1580 = _1558 * (-2.0);
    float _1582 = _1554 * _1550;
    float _1584 = _1136 + (-0.5);
    float _1586 = fma(_1268, _1576, _1268);
    float _1588 = trunc(_1468);
    int _1590 = int(_1588);
    float _1592 = -_1584;
    float _1594 = -_1574;
    float _1596 = fma(_1592, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1594);
    float _1598 = fma(_1576, _1540, _1540);
    float _1600 = _1578 * (-2.0);
    float _1602 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1604 = _1572 * _1570;
    float _1606 = fma(_1338, _1600, _1338);
    float _1608 = fma(_1600, _1542, _1542);
    float _1610 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1612 = trunc(_1458);
    int _1614 = int(_1612);
    float _1616 = fma(_1580, _1544, _1544);
    float _1618 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1602);
    float _1620 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1610);
    float _1622 = _151 + (-0.5);
    float _1624 = _155 + (-0.5);
    float _1626 = _163 + (-0.5);
    int _1628 = ~_1128;
    int _1630 = _1628 + _1234;
    int _1632 = _1630 + 1;
    float _1634 = trunc(_1480);
    int _1636 = int(_1634);
    float _1638 = fma(_1624, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1608);
    float _1640 = fma(_1626, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1616);
    int _1642 = abs(_781);
    float _1644 = fma(_1622, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1598);
    int _1646 = abs(_1032);
    int _1648 = _727 * _1632;
    int _1650 = _1648 + _819;
    int _1652 = ~_1142;
    int _1654 = _1652 + _1238;
    int _1656 = _1654 + 1;
    float _1658 = trunc(_1496);
    int _1660 = int(_1658);
    int _1662 = _1614 * _1642;
    int _1664 = _1662 + _819;
    bool _1666 = !_1248;
    int _1668 = _1666 ? 0 : 1;
    int _1670 = _1590 * _1646;
    int _1672 = _1670 + _857;
    bool _1674 = _727 == 0;
    int _1676 = _785 * _1656;
    int _1678 = _1676 + _857;
    bool _1680 = !_1244;
    int _1682 = _1680 ? 0 : 1;
    float _1684 = fma(_1228, _1586, _1644);
    bool _1686 = _785 == 0;
    float _1688 = trunc(_1482);
    int _1690 = int(_1688);
    int _1692 = ~_1636;
    int _1694 = _1692 + 1;
    int _1696 = _1694 + 1;
    float _1698 = fma(_1228, _1606, _1638);
    bool _1700 = !_1674;
    int _1702 = _1700 ? _1650 : (-1);
    float _1704 = in.m_68.x;
    float _1706 = in.m_68.y;
    bool _1708 = !_1686;
    int _1710 = _1708 ? _1678 : (-1);
    float _1712 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1620);
    int _1714 = ~_1660;
    int _1716 = _1714 + 1;
    int _1718 = _1716 + 1;
    float _1720 = trunc(_1484);
    int _1722 = int(_1720);
    int _1724 = _727 + (-1);
    int _1726 = _1702 * _1696;
    int _1728 = abs(_735);
    int _1730 = _1710 * _1718;
    int _1732 = _785 + (-1);
    int _1734 = _1636 * _1724;
    int _1736 = _1734 + _1726;
    float _1738 = float(uint(_1672));
    float _1740 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1498);
    int _1742 = abs(_1668);
    int _1744 = _1660 * _1732;
    int _1746 = _1744 + _1730;
    float _1748 = as_type<float>(_869) * _1738;
    int _1750 = abs(_1682);
    float _1752 = _958 + 0.5;
    int _1754 = _1736 * _1728;
    bool _1756 = !_1252;
    int _1758 = _1756 ? 0 : 1;
    float _1760 = trunc(_1748);
    float _1762 = precise::max(_1760, 0.0);
    uint _1764 = uint(_1762);
    float _1766 = -_119;
    float _1768 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1520);
    int _1770 = _1746 * _1742;
    float _1772 = _1564 * _1706;
    int _1774 = _1690 * _954;
    int _1776 = _1774 + _1754;
    int _1778 = abs(_978);
    int _1780 = _1722 * _1750;
    int _1782 = _1780 + _1770;
    float _1784 = fma(_1752, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1768);
    int _1786 = _1664 * _970;
    int _1788 = _1786 + _1776;
    int _1790 = abs(_1758);
    float _1792 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1526);
    bool _1794 = !_1256;
    int _1796 = _1794 ? 0 : 1;
    int _1798 = _1614 * _1778;
    int _1800 = _1798 + _1788;
    float _1802 = _1698 * 0.15915493667125701904296875;
    int _1804 = abs(_1796);
    float _1806 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1618);
    float _1808 = float(uint(_1664));
    int _1810 = _1672 * _1790;
    int _1812 = _1810 + _1782;
    float _1814 = -_1806;
    float _1816 = _1814 + 1.0;
    float _1818 = -_1792;
    float _1820 = _1818 + 1.0;
    float _1822 = as_type<float>(_841) * _1808;
    float _1824 = fma(_1296, _1580, _1296);
    int _1826 = _1590 * _1804;
    int _1828 = _1826 + _1812;
    float _1830 = float(uint(_1800));
    float _1832 = -_1712;
    float _1834 = _1832 + 1.0;
    float _1836 = -_1740;
    float _1838 = _1836 + 1.0;
    float _1840 = -_1816;
    float _1842 = fma(_807, _1840, _1402);
    float _1844 = fma(_1136, _1820, _1596);
    float _1846 = as_type<float>(_841) * _1830;
    float _1848 = -_1838;
    float _1850 = fma(_958, _1848, _1784);
    int _1852 = ~_727;
    int _1854 = _1852 + 1;
    float _1856 = fma(_938, _1834, _1428);
    float _1858 = trunc(_1846);
    float _1860 = precise::max(_1858, 0.0);
    uint _1862 = uint(_1860);
    float _1864 = float(uint(_1828));
    float _1866 = fma(_1228, _1824, _1640);
    float _1868 = fma(_1568, 0.5, 0.5);
    out.m_72.x = _1842;
    out.m_72.y = _1856;
    out.m_72.z = _1850;
    out.m_72.w = _1844;
    float _1870 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _397);
    float _1872 = fma(_1582, 0.5, 0.5);
    float _1874 = _1772 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1876 = trunc(_1822);
    float _1878 = precise::max(_1876, 0.0);
    uint _1880 = uint(_1878);
    float _1882 = as_type<float>(_869) * _1864;
    float _1884 = _1684 * 0.15915493667125701904296875;
    float _1886 = _1866 * 0.15915493667125701904296875;
    float _1888 = _1874 * _1870;
    int _1890 = ~_727;
    int _1892 = _1890 + 1;
    float _1894 = _1538 * _1704;
    int _1896 = ~_785;
    int _1898 = _1896 + 1;
    int _1900 = _1854 * int(_1862);
    int _1902 = _1900 + _1800;
    float _1904 = trunc(_1882);
    float _1906 = precise::max(_1904, 0.0);
    uint _1908 = uint(_1906);
    int _1910 = ~_785;
    int _1912 = _1910 + 1;
    float _1914 = fma(_1604, 0.5, 0.5);
    float _1916 = _397 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1918 = float(uint(_1902));
    int _1920 = _1892 * int(_1880);
    int _1922 = _1920 + _1664;
    float _1924 = floor(_1868);
    int _1926 = _1898 * int(_1764);
    int _1928 = _1926 + _1672;
    float _1930 = as_type<float>(_841) * _1918;
    int _1932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1934 = _1932 != 0;
    float _1936 = float(uint(_1922));
    float _1938 = float(uint(_1928));
    float _1940 = floor(_1872);
    int _1942 = _1912 * int(_1908);
    int _1944 = _1942 + _1828;
    float _1946 = _1884 * 6.283185482025146484375;
    float _1948 = sin(_1946);
    float _1950 = -_1924;
    float _1952 = _1868 + _1950;
    float _1954 = as_type<float>(_869) * _1938;
    float _1956 = fma(_1952, 2.0, -1.0);
    float _1958 = _1884 * 6.283185482025146484375;
    float _1960 = cos(_1958);
    float _1962 = -_1940;
    float _1964 = _1872 + _1962;
    float _1966 = _1802 * 6.283185482025146484375;
    float _1968 = sin(_1966);
    float _1970 = _1802 * 6.283185482025146484375;
    float _1972 = cos(_1970);
    float _1974 = _1886 * 6.283185482025146484375;
    float _1976 = cos(_1974);
    float _1978 = _1948 * _1968;
    float _1980 = _1960 * _1968;
    float _1982 = trunc(_1930);
    float _1984 = precise::max(_1982, 0.0);
    uint _1986 = uint(_1984);
    float _1988 = _1960 * _1972;
    float _1990 = _1886 * 6.283185482025146484375;
    float _1992 = sin(_1990);
    float _1994 = _1948 * _1976;
    float _1996 = _1960 * _1976;
    float _1998 = _1968 * _1976;
    int _2000 = int(_1862) + int(_1986);
    float _2002 = as_type<float>(_841) * _1936;
    float _2004 = _1948 * _1972;
    float _2006 = _1972 * _1976;
    float _2008 = float(uint(_1944));
    float _2010 = fma(_1964, 2.0, -1.0);
    int _2012 = ~_727;
    int _2014 = _2012 + 1;
    float _2016 = _1956 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _2018 = -_1980;
    float _2020 = fma(_1992, _2004, _2018);
    float _2022 = as_type<float>(_869) * _2008;
    float _2024 = -_2004;
    float _2026 = fma(_1992, _1980, _2024);
    int _2028 = _2014 * _2000;
    int _2030 = _2028 + _1800;
    float _2032 = trunc(_2002);
    float _2034 = precise::max(_2032, 0.0);
    uint _2036 = uint(_2034);
    float _2038 = _2010 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _2040 = _2016 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _2042 = fma(_1992, _1988, _1978);
    bool _2044 = uint(_2030) >= uint(_727);
    float _2046 = fma(_1992, _1978, _1988);
    float _2048 = fma(_2038, (*spvDescriptorSet0.vp_c12)._m0[2].x, _2040);
    float _2050 = _1996 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2052 = trunc(_2022);
    float _2054 = precise::max(_2052, 0.0);
    uint _2056 = uint(_2054);
    float _2058 = _2016 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _2060 = _2016 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _2062 = -_1992;
    float _2064 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2050);
    float _2066 = fma(_2038, (*spvDescriptorSet0.vp_c12)._m0[2].y, _2058);
    bool _2068 = !_2044;
    int _2070 = _2068 ? 0 : (-1);
    float _2072 = fma(_2038, (*spvDescriptorSet0.vp_c12)._m0[2].z, _2060);
    float _2074 = _1894 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2076 = trunc(_1954);
    float _2078 = precise::max(_2076, 0.0);
    uint _2080 = uint(_2078);
    int _2082 = ~_2000;
    int _2084 = _2082 + _2070;
    int _2086 = _2084 + 1;
    int _2088 = int(_1880) + int(_2036);
    float _2090 = _1996 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2092 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _387);
    int _2094 = _727 * _2086;
    int _2096 = _2094 + _1800;
    int _2098 = int(_1908) + int(_2056);
    float _2100 = _1996 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2102 = ~_785;
    int _2104 = _2102 + 1;
    float _2106 = floor(_1914);
    bool _2108 = !_1674;
    int _2110 = _2108 ? _2096 : (-1);
    float _2112 = -_1992;
    float _2114 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2100);
    float _2116 = -_1992;
    float _2118 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2090);
    int _2120 = _2104 * _2098;
    int _2122 = _2120 + _1828;
    int _2124 = _2110 & 3;
    bool _2126 = _2124 != 0;
    float _2128 = _2074 * _2092;
    float _2130 = -_1888;
    float _2132 = _1992 * _2130;
    int _2134 = int(_1764) + int(_2080);
    float _2136 = _2042 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2138 = uint(_2122) >= uint(_785);
    float _2140 = _1996 * _1888;
    int _2142 = _2126 ? 0 : 1;
    float _2144 = fma(_2006, _2128, _2132);
    int _2146 = _2110 & 3;
    bool _2148 = _2146 != 0;
    float _2150 = _1994 * _1888;
    bool _2152 = !_2138;
    int _2154 = _2152 ? 0 : (-1);
    float _2156 = fma(_2042, _2128, _2140);
    bool _2158 = uint(_2146) > 1u;
    float _2160 = _2042 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2162 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2064);
    float _2164 = _2042 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2166 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2168 = fma(_2020, _2128, _2150);
    float _2170 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2118);
    float _2172 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2136);
    float _2174 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2114);
    float _2176 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2160);
    float _2178 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2164);
    float _2180 = fma(_1998, _2166, _2144);
    float _2182 = _2026 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2184 = _2026 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2186 = _2026 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2188 = ~_2098;
    int _2190 = _2188 + _2154;
    int _2192 = _2190 + 1;
    float _2194 = -_2106;
    float _2196 = _1914 + _2194;
    int _2198 = ~_2142;
    int _2200 = _2198 + 1;
    int _2202 = _2200 + 1;
    float _2204 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2182);
    int _2206 = _2202;
    float _2208 = _2010;
    float _2210 = _1956;
    float _2212 = _2010;
    float _2214 = _1956;
    if (!_2158)
    {
        int _2216 = ~_2142;
        int _2218 = _2216 + 1;
        _2206 = _2218;
    }
    int _2220 = _2206;
    float _2222 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2184);
    float _2224 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2186);
    bool _2226 = uint(_2146) >= 2u;
    int _2228 = _785 * _2192;
    int _2230 = _2228 + _1828;
    int _2232 = ~_727;
    int _2234 = _2232 + 1;
    float _2236 = fma(_2026, _2166, _2156);
    int _2238 = _2226 ? 0 : 1;
    float _2240 = fma(_2046, _2166, _2168);
    float _2242 = _387 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2244 = _2146 != 3;
    float _2246 = _1916 * _2174;
    int _2248 = _2110 >> 31;
    int _2250 = _2234 * _2088;
    int _2252 = _2250 + _1664;
    bool _2254 = !_1686;
    int _2256 = _2254 ? _2230 : (-1);
    float _2258 = fma(_2046, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2204);
    int _2260 = _2248 & 3;
    float _2262 = _1916 * _2162;
    int _2264 = _2256 >> 31;
    float _2266 = fma(_2196, 2.0, -1.0);
    int _2268 = ~_785;
    int _2270 = _2268 + 1;
    int _2272 = _2110 + _2260;
    int _2274 = _2264 & 3;
    int _2276 = ~_2238;
    int _2278 = _2276 + 1;
    int _2280 = _2278 + 1;
    int _2282 = _2280;
    if (_2244)
    {
        int _2284 = ~_2238;
        int _2286 = _2284 + 1;
        _2282 = _2286;
    }
    int _2288 = _2282;
    int _2290 = _2256 + _2274;
    int _2292 = _2272 >> 2;
    bool _2294 = uint(_2252) >= uint(_727);
    int _2296 = _2270 * _2134;
    int _2298 = _2296 + _1672;
    int _2300 = _2290 >> 2;
    float _2302 = fma(_2020, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2172);
    int _2304 = _2292 << 4;
    int _2306 = _2304 + 368;
    float _2308 = fma(_2020, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2176);
    bool _2310 = !_2294;
    int _2312 = _2310 ? 0 : (-1);
    float _2314 = fma(_2020, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2178);
    bool _2316 = uint(_2298) >= uint(_785);
    float _2318 = fma(_2046, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2222);
    int _2320 = _2300 << 4;
    int _2322 = _2320 + 512;
    uint _2324 = uint(int(uint(_2306) >> uint(2)));
    uint _2326 = uint(int(uint(int(_2324)) >> uint(2)));
    int _2328 = int(_2324) & 3;
    float _2330 = (*spvDescriptorSet0.vp_c9)._m0[int(_2326)][_2328];
    int _2332 = int(_2324) + 1;
    uint _2334 = uint(int(uint(_2332) >> uint(2)));
    int _2336 = _2332 & 3;
    float _2338 = (*spvDescriptorSet0.vp_c9)._m0[int(_2334)][_2336];
    float _2340 = fma(_2242, _2308, _2246);
    int _2342 = ~_2088;
    int _2344 = _2342 + _2312;
    int _2346 = _2344 + 1;
    float _2348 = fma(_2046, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2224);
    bool _2350 = !_2148;
    int _2352 = _2350 ? 0 : 1;
    out.m_74.x = _2308;
    out.m_74.y = _2302;
    out.m_74.z = _2314;
    int _2354 = _2256 & 3;
    bool _2356 = _2354 != 0;
    float _2358 = fma(_2242, _2302, _2262);
    uint _2360 = uint(int(uint(_2322) >> uint(2)));
    uint _2362 = uint(int(uint(int(_2360)) >> uint(2)));
    int _2364 = int(_2360) & 3;
    float _2366 = (*spvDescriptorSet0.vp_c9)._m0[int(_2362)][_2364];
    int _2368 = int(_2360) + 1;
    uint _2370 = uint(int(uint(_2368) >> uint(2)));
    int _2372 = _2368 & 3;
    float _2374 = (*spvDescriptorSet0.vp_c9)._m0[int(_2370)][_2372];
    bool _2376 = !_2316;
    int _2378 = _2376 ? 0 : (-1);
    int _2380 = _727 * _2346;
    int _2382 = _2380 + _1664;
    bool _2384 = uint(_2354) > 1u;
    float _2386 = _1916 * _2170;
    int _2388 = _2256 & 3;
    bool _2390 = _2388 != 0;
    int _2392 = ~_2134;
    int _2394 = _2392 + _2378;
    int _2396 = _2394 + 1;
    int _2398 = _2306 + 8;
    uint _2400 = uint(int(uint(_2398) >> uint(2)));
    uint _2402 = uint(int(uint(int(_2400)) >> uint(2)));
    int _2404 = int(_2400) & 3;
    float _2406 = (*spvDescriptorSet0.vp_c9)._m0[int(_2402)][_2404];
    int _2408 = int(_2400) + 1;
    uint _2410 = uint(int(uint(_2408) >> uint(2)));
    int _2412 = _2408 & 3;
    float _2414 = (*spvDescriptorSet0.vp_c9)._m0[int(_2410)][_2412];
    int _2416 = _2390 ? 0 : 1;
    float _2418 = fma(_2242, _2314, _2386);
    bool _2420 = _2146 != 3;
    int _2422 = _785 * _2396;
    int _2424 = _2422 + _1672;
    int _2426 = ~_2416;
    int _2428 = _2426 + 1;
    int _2430 = _2428 + 1;
    float _2432 = _2348 + _2418;
    bool _2434 = !_2356;
    int _2436 = _2434 ? 0 : 1;
    int _2438 = _2322 + 8;
    uint _2440 = uint(int(uint(_2438) >> uint(2)));
    uint _2442 = uint(int(uint(int(_2440)) >> uint(2)));
    int _2444 = int(_2440) & 3;
    float _2446 = (*spvDescriptorSet0.vp_c9)._m0[int(_2442)][_2444];
    int _2448 = int(_2440) + 1;
    uint _2450 = uint(int(uint(_2448) >> uint(2)));
    int _2452 = _2448 & 3;
    float _2454 = (*spvDescriptorSet0.vp_c9)._m0[int(_2450)][_2452];
    int _2456 = _2430;
    if (!_2384)
    {
        int _2458 = ~_2416;
        int _2460 = _2458 + 1;
        _2456 = _2460;
    }
    int _2462 = _2456;
    int _2464 = abs(_2220);
    int _2466 = abs(_2462);
    bool _2468 = _2354 != 3;
    int _2470 = abs(_2352);
    int _2472 = ~_2464;
    int _2474 = _2472 + 1;
    int _2476 = _2474 + 1;
    bool _2478 = uint(_2354) >= 2u;
    int _2480 = abs(_2436);
    int _2482 = ~_2466;
    int _2484 = _2482 + 1;
    int _2486 = _2484 + 1;
    int _2488 = _2476 * as_type<int>(_2338);
    int _2490 = _2478 ? 0 : 1;
    int _2492 = abs(_2288);
    int _2494 = ~_2470;
    int _2496 = _2494 + 1;
    int _2498 = _2496 + 1;
    int _2500 = _2486 * as_type<int>(_2374);
    int _2502 = ~_2490;
    int _2504 = _2502 + 1;
    int _2506 = _2504 + 1;
    int _2508 = _2498 * as_type<int>(_2330);
    int _2510 = _2508 + _2488;
    int _2512 = ~_2492;
    int _2514 = _2512 + 1;
    int _2516 = _2514 + 1;
    float _2518 = fma(_1916, _1916, 1.0);
    int _2520 = _2506;
    if (_2468)
    {
        int _2522 = ~_2490;
        int _2524 = _2522 + 1;
        _2520 = _2524;
    }
    int _2526 = _2520;
    bool _2528 = !_1934;
    int _2530 = _2528 ? 0 : 1;
    int _2532 = _2516 * as_type<int>(_2406);
    int _2534 = _2532 + _2510;
    int _2536 = ~_2480;
    int _2538 = _2536 + 1;
    int _2540 = _2538 + 1;
    float _2542 = rsqrt(_2518);
    int _2544 = abs(_2526);
    bool _2546 = _2354 != 3;
    int _2548 = _2540 * as_type<int>(_2366);
    int _2550 = _2548 + _2500;
    bool _2552 = !_2420;
    int _2554 = _2552 ? 0 : (-1);
    bool _2556 = !_1204;
    int _2558 = _2556 ? 0 : 1;
    int _2560 = abs(_2530);
    bool _2562 = !_2546;
    int _2564 = _2562 ? 0 : (-1);
    int _2566 = abs(_2554);
    int _2568 = abs(_2558);
    int _2570 = ~_2544;
    int _2572 = _2570 + 1;
    int _2574 = _2572 + 1;
    int _2576 = abs(_2564);
    int _2578 = ~_2566;
    int _2580 = _2578 + 1;
    int _2582 = _2580 + 1;
    int _2584 = _2574 * as_type<int>(_2446);
    int _2586 = _2584 + _2550;
    int _2588 = ~_2576;
    int _2590 = _2588 + 1;
    int _2592 = _2590 + 1;
    int _2594 = ~_2560;
    int _2596 = _2594 + 1;
    int _2598 = _2596 + 1;
    int _2600 = _2582 * as_type<int>(_2414);
    int _2602 = _2600 + _2534;
    int _2604 = ~_2568;
    int _2606 = _2604 + 1;
    int _2608 = _2606 + 1;
    int _2610 = _2592 * as_type<int>(_2454);
    int _2612 = _2610 + _2586;
    bool _2614 = !_1686;
    int _2616 = _2614 ? _2424 : (-1);
    int _2618 = _2602 * _2598;
    float _2620 = _1916 * _2542;
    int _2622 = _2612 * _2608;
    bool _2624 = !_1674;
    int _2626 = _2624 ? _2382 : (-1);
    float _2628 = _2258 + _2340;
    float _2630 = -_2258;
    float _2632 = _2620 * _2630;
    int _2634 = _2616 * _2568;
    int _2636 = _2634 + _2622;
    float _2638 = -_2348;
    float _2640 = _2620 * _2638;
    int _2642 = _2626 * _2560;
    int _2644 = _2642 + _2618;
    float _2646 = fma(_2542, _2174, _2632);
    float _2648 = _2318 + _2358;
    float _2650 = -_2318;
    float _2652 = _2620 * _2650;
    float _2654 = fma(_2542, _2170, _2640);
    float _2656 = _2236 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2658 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _2660 = isnan(1.0);
    bool _2662 = _2658 || _2660;
    bool _2664 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _2666 = _2662 || _2664;
    out.m_76.x = _2628;
    out.m_76.y = _2648;
    out.m_76.z = _2432;
    float _2668 = fma(_2542, _2162, _2652);
    float _2670 = _2236 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2672 = _2236 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2674 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2656);
    float _2676 = float(_2644);
    float _2678 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2670);
    float _2680 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2672);
    float _2682 = _2266 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _2684 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2674);
    float _2686 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2678);
    float _2688 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2680);
    float _2690 = fma(_2682, (*spvDescriptorSet0.vp_c12)._m0[4].x, _2048);
    float _2692 = fma(_2682, (*spvDescriptorSet0.vp_c12)._m0[4].y, _2066);
    float _2694 = fma(_2682, (*spvDescriptorSet0.vp_c12)._m0[4].z, _2072);
    float _2696 = float(_2636);
    out.m_78.x = _2646;
    out.m_78.y = _2668;
    out.m_78.z = _2654;
    float _2698 = _2690 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _2700 = _2692 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _2702 = _2694 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _2704 = _2686 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2706 = _2684 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    out.m_80.x = _2676;
    out.m_80.y = _2696;
    float _2708 = _2706 + _2700;
    float _2710 = _2688 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2712 = _2704 + _2698;
    float _2714 = _2710 + _2702;
    float _2716 = _2704;
    float _2718 = _2710;
    float _2720 = _2654;
    float _2722 = _2704;
    float _2724 = _2654;
    float _2726 = _2710;
    float _2728 = _2646;
    float _2730 = _2694;
    float _2740;
    float _2742;
    float _2744;
    float _2746;
    if (!_2666)
    {
        bool _2732 = _2700 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _2734 = !_2732;
        _2736 = _2734;
        if (!_2736)
        {
            float _2738 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _2740 = _2738;
            _2742 = 0.0;
            _2744 = 0.0;
            _2746 = 0.0;
            _2748 = true;
        }
    }
    if ((!_2748) || _2736)
    {
        bool _2786;
        if (!_2736)
        {
            bool _2750 = _2700 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _2752 = isnan(_2700);
            bool _2754 = _2750 || _2752;
            bool _2756 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _2758 = _2754 || _2756;
            bool _2760 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _2762 = !_2758;
            bool _2764 = _2760 && _2762;
            bool _2766 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            float _2768 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_2764)
            {
                _2716 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _2770 = _2716;
            float _2772 = _2770;
            if (_2764)
            {
                _2718 = 0.0;
                _2768 = 0.0;
            }
            float _2774 = _2718;
            float _2776 = _2768;
            _2726 = _2774;
            _2728 = _2776;
            _2742 = _2774;
            _2746 = _2776;
            if (_2764)
            {
                _2720 = 0.0;
            }
            float _2778 = _2720;
            _2724 = _2778;
            _2744 = _2778;
            if (_2764)
            {
                float _2780 = _2770 * 5.0;
                _2772 = _2780;
            }
            float _2782 = _2772;
            bool _2784 = !_2758;
            _2786 = _2784 && _2766;
            _2722 = _2782;
            _2740 = _2782;
        }
        if ((!_2786) || _2736)
        {
            _2736 = false;
            float _2788 = _2722;
            float _2790 = _2724;
            float _2792 = _2726;
            float _2794 = _2728;
            bool _2796 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _2798 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _2800 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _2802 = _2788;
            float _2804 = _2790;
            float _2806 = _2792;
            float _2808 = _2794;
            if (_2796)
            {
                float _2810 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _2802 = _2810;
            }
            float _2812 = _2802;
            if (_2796)
            {
                float _2814 = abs(_2010);
                float _2816 = -_2814;
                float _2818 = _2816 + 1.0;
                _2208 = _2818;
            }
            float _2820 = _2208;
            _2212 = _2820;
            if (_2798)
            {
                float _2822 = abs(_1956);
                float _2824 = -_2822;
                float _2826 = _2824 + 1.0;
                _2210 = _2826;
            }
            float _2828 = _2210;
            _2214 = _2828;
            if (!_2796)
            {
                _2804 = 1.0;
            }
            float _2830 = _2804;
            float _2832 = _2830;
            if (!_2798)
            {
                _2806 = 1.0;
            }
            float _2834 = _2806;
            float _2836 = _2834;
            if (!_2800)
            {
                _2808 = 1.0;
            }
            float _2838 = _2808;
            float _2840 = _2676;
            float _2842 = _2838;
            if (_2798)
            {
                float _2844 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _2840 = _2844;
            }
            float _2846 = _2840;
            float _2848 = _2706;
            if (_2800)
            {
                float _2850 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _2848 = _2850;
            }
            float _2852 = _2848;
            float _2854 = _2812;
            if (_2796)
            {
                float _2856 = _2820 * _2812;
                float _2858 = precise::clamp(_2856, 0.0, 1.0);
                _2832 = _2858;
            }
            float _2860 = _2832;
            if (_2800)
            {
                float _2862 = abs(_2266);
                float _2864 = -_2862;
                float _2866 = _2864 + 1.0;
                _2854 = _2866;
            }
            float _2868 = _2854;
            if (_2798)
            {
                float _2870 = _2828 * _2846;
                float _2872 = precise::clamp(_2870, 0.0, 1.0);
                _2836 = _2872;
            }
            float _2874 = _2836;
            if (_2800)
            {
                float _2876 = _2868 * _2852;
                float _2878 = precise::clamp(_2876, 0.0, 1.0);
                _2842 = _2878;
            }
            float _2880 = _2842;
            float _2882 = _2860 * _2874;
            float _2884 = _2882 * _2880;
            _2740 = _2714;
            _2742 = _2712;
            _2744 = _2708;
            _2746 = _2884;
        }
    }
    _2748 = false;
    float _2886 = _2740;
    float _2888 = _2742;
    float _2890 = _2744;
    float _2892 = _2212;
    float _2894 = _2214;
    float _2896 = _2746;
    float _2898 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2900 = _2886 + _2898;
    float _2902 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2904 = _2888 + _2902;
    float _2906 = _2900 * _2900;
    float _2908 = fma(_2904, _2904, _2906);
    float _2910 = sqrt(_2908);
    bool _2912 = _2910 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _2914 = !_2912;
    float _2916 = _2890;
    float _2918 = _2888;
    float _2920 = _2886;
    float _2922 = _2892;
    float _2924 = _2904;
    float _2926 = _2894;
    if (!_2914)
    {
        float _2928 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2930 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2932 = _2910 + _2930;
        float _2934 = rsqrt(_2908);
        float _2936 = _2932 * _2928;
        float _2938 = _2890 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2940 = _2936 * 0.15915493667125701904296875;
        float _2942 = _2940 * 6.283185482025146484375;
        float _2944 = cos(_2942);
        float _2946 = _2940 * 6.283185482025146484375;
        float _2948 = sin(_2946);
        float _2950 = _2944 + (-1.0);
        float _2952 = fma(_2948, _2938, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2954 = _2950 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2956 = _2934 * _2952;
        float _2958 = fma(_2944, _2890, _2954);
        float _2960 = fma(_2904, _2956, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2962 = fma(_2900, _2956, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2916 = _2958;
        _2918 = _2960;
        _2920 = _2962;
    }
    float _2964 = _2916;
    float _2966 = _2918;
    float _2968 = _2920;
    float _2970 = -_2700;
    float _2972 = _2970 + _2964;
    float _2974 = -_2698;
    float _2976 = _2974 + _2966;
    float _2978 = -_2702;
    float _2980 = _2978 + _2968;
    float _2982 = _2972 * _2972;
    float _2984 = fma(_2976, _2976, _2982);
    float _2986 = fma(_2980, _2980, _2984);
    float _2988 = sqrt(_2986);
    bool _2990 = _2988 > 0.0;
    bool _2992 = !_2990;
    float _2994 = _2988;
    float _2996 = _2966;
    float _2998 = _2968;
    float _3000 = _2964;
    if (!_2992)
    {
        bool _3002 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _3004 = _2690;
        if (_3002)
        {
            float _3006 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _3004 = _3006;
        }
        float _3008 = _3004;
        if (_3002)
        {
            _2922 = _655;
        }
        float _3010 = _2922;
        float _3012 = _3010;
        if (_3002)
        {
            _2924 = _657;
        }
        float _3014 = _2924;
        float _3016 = _3014;
        if (_3002)
        {
            _2994 = _659;
        }
        float _3018 = _2994;
        float _3020 = _3008;
        float _3022 = _3018;
        if (_3002)
        {
            float _3024 = _655 * _3008;
            _2730 = _3024;
        }
        float _3026 = _2730;
        float _3028 = _3026;
        if (_3002)
        {
            float _3030 = _657 * _3008;
            _2926 = _3030;
        }
        float _3032 = _2926;
        float _3034 = _3032;
        if (_3002)
        {
            float _3036 = _659 * _3008;
            _3020 = _3036;
        }
        float _3038 = _3020;
        float _3040 = _3038;
        if (!_3002)
        {
            bool _3042 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _3044 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _3046 = _3042 || _3044;
            bool _3048 = isnan(1.0);
            bool _3050 = _3046 || _3048;
            float _3052 = _119 + 1.0;
            if (!_3050)
            {
                float _3054 = _3052 * _3052;
                float _3056 = _3054 * 0.5;
                _129 = _3056;
            }
            float _3058 = _129;
            float _3060 = _3058;
            if (!_3050)
            {
                float _3062 = _3058 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3060 = _3062;
            }
            float _3064 = _3060;
            bool _3066 = !_3050;
            float _3068 = _3064;
            if (!_3066)
            {
                float _3070 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3072 = log2(_3070);
                float _3074 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3076 = 1.0 + _3074;
                float _3078 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3080 = _3072 * _3052;
                float _3082 = 1.0 / _3076;
                float _3084 = _3078 * 0.693147182464599609375;
                float _3086 = exp2(_3080);
                float _3088 = 1.0 / _3084;
                float _3090 = _3086 + (-1.0);
                float _3092 = -_3090;
                float _3094 = fma(_3092, _3088, _3052);
                float _3096 = _3094 * _3082;
                float _3098 = _3096 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3068 = _3098;
            }
            float _3100 = _3068;
            float _3102 = _3100 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _3104 = _3100 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _3106 = _3102 * _379;
            float _3108 = _3100 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _3110 = _3102 * _357;
            float _3112 = _3102 * _411;
            float _3114 = fma(_3104, _371, _3106);
            float _3116 = _3100;
            if (!_3050)
            {
                _3116 = _3052;
            }
            float _3118 = _3116;
            float _3120 = fma(_3104, _353, _3110);
            float _3122 = fma(_3108, _383, _3114);
            bool _3124 = !_3050;
            float _3126 = _3118;
            if (!_3124)
            {
                float _3128 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3130 = log2(_3128);
                float _3132 = _3130 * _3052;
                float _3134 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3136 = 1.0 + _3134;
                float _3138 = exp2(_3132);
                float _3140 = 1.0 / _3136;
                float _3142 = -_3138;
                float _3144 = _3142 + 1.0;
                float _3146 = _3144 * _3140;
                _3126 = _3146;
            }
            float _3148 = _3126;
            float _3150 = fma(_3104, _407, _3112);
            float _3152 = fma(_3108, _361, _3120);
            float _3154 = fma(_3148, _267, _3122);
            float _3156 = fma(_3108, _415, _3150);
            float _3158 = fma(_3148, _265, _3152);
            float _3160 = -_615;
            float _3162 = _3160 + _3154;
            float _3164 = fma(_3148, _269, _3156);
            float _3166 = -_621;
            float _3168 = _3166 + _3158;
            float _3170 = _3162 * _179;
            float _3172 = _3162 * _173;
            float _3174 = _3162 * _185;
            float _3176 = -_627;
            float _3178 = _3176 + _3164;
            float _3180 = fma(_3168, _177, _3170);
            float _3182 = fma(_3168, _171, _3172);
            float _3184 = fma(_3168, _183, _3174);
            float _3186 = fma(_3178, _181, _3180);
            float _3188 = fma(_3178, _175, _3182);
            float _3190 = fma(_3178, _187, _3184);
            _3016 = _3188;
            _3012 = _3186;
            _3022 = _3190;
            _3028 = _3186;
            _3034 = _3188;
            _3040 = _3190;
        }
        float _3192 = _3016;
        float _3194 = _3012;
        float _3196 = _3022;
        float _3198 = _3028;
        float _3200 = _3034;
        float _3202 = _3040;
        float _3204 = _3192 * _3192;
        float _3206 = rsqrt(_2986);
        float _3208 = fma(_3194, _3194, _3204);
        float _3210 = fma(_3196, _3196, _3208);
        float _3212 = sqrt(_3210);
        float _3214 = _2976 * _3206;
        float _3216 = _2972 * _3206;
        float _3218 = _2980 * _3206;
        bool _3220 = _3212 > 0.0;
        bool _3222 = !_3220;
        _401 = _3212;
        if (!_3222)
        {
            float _3224 = rsqrt(_3210);
            float _3226 = _3224 * _3192;
            float _3228 = _3224 * _3194;
            float _3230 = _3224 * _3196;
            float _3232 = _3216 * _3226;
            float _3234 = fma(_3214, _3228, _3232);
            float _3236 = fma(_3218, _3230, _3234);
            float _3238 = _3236 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3240 = fma(_3198, _3238, _2966);
            float _3242 = fma(_3200, _3238, _2964);
            float _3244 = fma(_3202, _3238, _2968);
            _2996 = _3240;
            _2998 = _3244;
            _3000 = _3242;
            _401 = _3238;
            _403 = _3226;
        }
    }
    float _3246 = _2996;
    float _3248 = _2998;
    float _3250 = _3000;
    float _3252 = _401;
    float _3254 = _403;
    float _3256 = _2700 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _3258 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3260 = isnan(0.5);
    bool _3262 = _3258 || _3260;
    bool _3264 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3266 = _3262 || _3264;
    bool _3268 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3270 = isnan(0.5);
    bool _3272 = _3268 || _3270;
    bool _3274 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3276 = _3272 || _3274;
    float _3278 = fma(_2698, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3256);
    float _3280 = _2700 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3282 = fma(_2702, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3278);
    float _3284 = fma(_2698, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3280);
    float _3286 = _3282 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3288 = fma(_2702, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3284);
    float _3290 = _3252;
    float _3292 = _3254;
    float _3294 = _3246;
    float _3296 = _3282;
    if (_3266)
    {
        _3290 = _3246;
    }
    float _3298 = _3290;
    float _3300 = 1.0 / _3286;
    float _3302 = _3288 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3304 = _3302;
    float _3306 = _3298;
    if (_3266)
    {
        _3292 = _3248;
    }
    float _3308 = _3292;
    float _3310 = _3302 + _3286;
    float _3312 = _3308;
    if (_3266)
    {
        _3304 = _3250;
    }
    float _3314 = _3304;
    float _3316 = _3314;
    if (!_3266)
    {
        float _3318 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3320 = _2700 + _3318;
        float _3322 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3324 = _2698 + _3322;
        float _3326 = -_2698;
        float _3328 = _3326 + _3246;
        float _3330 = -_2700;
        float _3332 = _3330 + _3250;
        float _3334 = _3320 * _3320;
        float _3336 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3338 = _2702 + _3336;
        float _3340 = -_2702;
        float _3342 = _3340 + _3248;
        float _3344 = fma(_3324, _3324, _3334);
        float _3346 = fma(_3338, _3338, _3344);
        float _3348 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3350 = sqrt(_3346);
        float _3352 = precise::min(_3350, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3354 = _3352 * _3348;
        float _3356 = fma(_3328, _3354, _2698);
        float _3358 = fma(_3332, _3354, _2700);
        float _3360 = fma(_3342, _3354, _2702);
        _3316 = _3358;
        _3306 = _3356;
        _3312 = _3360;
        _3294 = _3328;
        _3296 = _3350;
    }
    float _3362 = _3316;
    float _3364 = _3306;
    float _3366 = _3312;
    float _3368 = _3294;
    float _3370 = _3296;
    float _3372 = _3370;
    float _3374 = _3368;
    if (_3276)
    {
        _3372 = 1.0;
    }
    float _3376 = _3372;
    float _3378 = _3310 * _3300;
    float _3380 = _3378 * 0.5;
    float _3382 = _3376;
    if (!_3276)
    {
        float _3384 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3386 = fma(_3380, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3384);
        float _3388 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3390 = _3388 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _3392 = 1.0 / _3386;
        float _3394 = 1.0 / _3390;
        float _3396 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3398 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3400 = fma(_3392, _3396, _3398);
        float _3402 = _3400 * _3394;
        float _3404 = precise::clamp(_3402, 0.0, 1.0);
        _3382 = _3404;
    }
    float _3406 = _3382;
    float _3408 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3410 = _3362 + _3408;
    float _3412 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3414 = _3364 + _3412;
    float _3416 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3418 = _3366 + _3416;
    float _3420 = _3410 * _3410;
    float _3422 = fma(_3414, _3414, _3420);
    float _3424 = fma(_3418, _3418, _3422);
    float _3426 = rsqrt(_3424);
    float _3428 = sqrt(_3424);
    float _3430 = _3426 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3432 = _3414 * _3430;
    float _3434 = _3418 * _3430;
    float _3436 = _3432 * _3432;
    float _3438 = _3434 * _3434;
    float _3440 = _3436 + _3438;
    float _3442 = sqrt(_3440);
    bool _3444 = _3442 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3446 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3448 = _3442 + _3446;
    float _3450 = _3426;
    float _3452 = _3448;
    float _3454 = _3410;
    if (_3444)
    {
        float _3456 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3450 = _3456;
    }
    float _3458 = _3450;
    float _3460 = _3458;
    if (_3444)
    {
        float _3462 = _3448 * _3458;
        _3452 = _3462;
    }
    float _3464 = _3452;
    if (_3444)
    {
        float _3466 = rsqrt(_3440);
        _3460 = _3466;
    }
    float _3468 = _3460;
    float _3470 = _3468;
    if (_3444)
    {
        float _3472 = _3464 * 0.15915493667125701904296875;
        _231 = _3472;
    }
    float _3474 = _231;
    float _3476 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3478 = _3418;
    float _3480 = _3474;
    if (_3444)
    {
        float _3482 = _3474 * 6.283185482025146484375;
        float _3484 = sin(_3482);
        _3478 = _3484;
    }
    float _3486 = _3478;
    float _3488 = precise::max(0.0, _3476);
    float _3490 = _179;
    float _3492 = _3488;
    if (_3444)
    {
        float _3494 = _3474 * 6.283185482025146484375;
        float _3496 = cos(_3494);
        _3490 = _3496;
    }
    float _3498 = _3490;
    float _3500 = -_3430;
    float _3502 = -_3488;
    float _3504 = fma(_3410, _3500, _3502);
    if (_3444)
    {
        float _3506 = _3504 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3454 = _3506;
    }
    float _3508 = _3454;
    float _3510 = _3486;
    float _3512 = _3508;
    if (_3444)
    {
        float _3514 = fma(_3486, _3508, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3510 = _3514;
    }
    float _3516 = _3510;
    float _3518 = _3516;
    if (!_3444)
    {
        _3512 = _3504;
    }
    float _3520 = _3512;
    float _3522 = _3520;
    if (_3444)
    {
        float _3524 = _3468 * _3516;
        _3374 = _3524;
    }
    float _3526 = _3374;
    if (!_3444)
    {
        _3470 = _3432;
    }
    float _3528 = _3470;
    float _3530 = _3528;
    float _3532 = _3498;
    if (_3444)
    {
        float _3534 = _3498 + (-1.0);
        _3492 = _3534;
    }
    float _3536 = _3492;
    float _3538 = _3536;
    if (_3444)
    {
        float _3540 = _3432 * _3526;
        _3530 = _3540;
    }
    float _3542 = _3530;
    if (!_3444)
    {
        _3518 = _3436;
    }
    float _3544 = _3518;
    float _3546 = _3362 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3548 = _3544;
    if (_3444)
    {
        float _3550 = _3536 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3480 = _3550;
    }
    float _3552 = _3480;
    if (!_3444)
    {
        _3538 = _3434;
    }
    float _3554 = _3538;
    float _3556 = _3554;
    if (_3444)
    {
        float _3558 = _3434 * _3526;
        _3556 = _3558;
    }
    float _3560 = _3556;
    if (_3444)
    {
        float _3562 = _3542 * _3542;
        _3548 = _3562;
    }
    float _3564 = _3548;
    if (_3444)
    {
        float _3566 = fma(_3504, _3498, _3552);
        _3522 = _3566;
    }
    float _3568 = _3522;
    if (!_3444)
    {
        _3532 = _3438;
    }
    float _3570 = _3532;
    float _3572 = _3570;
    if (_3444)
    {
        float _3574 = _3560 * _3560;
        _3572 = _3574;
    }
    float _3576 = _3572;
    float _3578 = fma(_3568, _3568, _3564);
    float _3580 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3582 = _3578 + _3576;
    float _3584 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3586 = fma(_3428, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3584);
    float _3588 = precise::clamp(_3586, 0.0, 1.0);
    float _3590 = fma(_3364, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3546);
    float _3592 = _3362 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3594 = rsqrt(_3582);
    float _3596 = -_3588;
    float _3598 = _3596 + 1.0;
    float _3600 = fma(_3366, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3590);
    float _3602 = _3362 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3604 = fma(_3364, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3592);
    float _3606 = _3362 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3608 = _3600 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3610 = fma(_3364, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3602);
    float _3612 = abs(_3598);
    float _3614 = log2(_3612);
    float _3616 = fma(_3366, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3604);
    float _3618 = _3608 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3620 = fma(_3366, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3610);
    float _3622 = fma(_3364, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3606);
    float _3624 = _3616 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3626 = -_3618;
    float _3628 = fma(_3626, _3580, 1.0);
    float _3630 = _3620 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3632 = _3594 * _3542;
    float _3634 = _3624 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3636 = _3594 * _3568;
    float _3638 = fma(_3366, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3622);
    float _3640 = _3632 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3642 = fma(_3630, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3634);
    float _3644 = _3594 * _3560;
    float _3646 = _3638 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3648 = -_3640;
    float _3650 = fma(_3636, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3648);
    float _3652 = _3614 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3654 = fma(_3608, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3642);
    float _3656 = log2(_3628);
    float _3658 = -_3644;
    float _3660 = fma(_3658, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3650);
    float _3662 = _3624 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3664 = fma(_3646, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3654);
    float _3666 = _3624 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3668 = fma(_3660, -0.5, 0.5);
    float _3670 = fma(_3630, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3662);
    float _3672 = fma(_3660, 0.5, 0.5);
    float _3674 = exp2(_3652);
    float _3676 = fma(_3630, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3666);
    float _3678 = _3636 + 1.0;
    float _3680 = fma(_3608, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3670);
    float _3682 = fma(_3608, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3676);
    float _3684 = fma(_3646, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3680);
    float _3686 = 1.0 / _3664;
    float _3688 = fma(_3672, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3690 = _3656 * 0.693147182464599609375;
    float _3692 = fma(_3672, _3688, -0.212114393711090087890625);
    float _3694 = _3690 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3696 = sqrt(_3668);
    float _3698 = -_3636;
    float _3700 = fma(_3674, _3678, _3698);
    float _3702 = fma(_3646, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3682);
    float _3704 = fma(_3672, _3692, 1.570728778839111328125);
    float _3706 = _3684 * _3686;
    float _3708 = _3702 * _3686;
    float _3710 = fma(_3706, 0.5, 0.5);
    float _3712 = fma(_3708, -0.5, 0.5);
    float _3714 = _3696 * 0.636619746685028076171875;
    float3 _9843 = float3(_3710, _3712, _3694);
    float _3716 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9843, float3(0.0), isnan(_9843)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9843, float3(0.0), isnan(_9843)), level(0.0)).x;
    float _3718 = -_3704;
    float _3720 = fma(_3714, _3718, 1.0);
    float _3722 = fma(_3700, 0.5, 0.5);
    float3 _9861 = float3(_3710, _3712, _3694);
    float4 _3725 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9861, float3(0.0), isnan(_9861)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9861, float3(0.0), isnan(_9861)), level(0.0)).xyzw;
    float _3727 = _3725.x;
    float _3729 = _3725.y;
    float _3731 = _3725.z;
    float _3733 = _3725.w;
    float2 _9878 = float2(_3720, _3722);
    float3 _3737 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9878, float2(0.0), isnan(_9878)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9878, float2(0.0), isnan(_9878)), level(0.0)).xyz;
    float _3739 = _3737.x;
    float _3741 = _3737.y;
    float _3743 = _3737.z;
    float _3745 = _2700 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3747 = _2700 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3749 = _2700 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3751 = _2700 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3753 = fma(_2698, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3745);
    float _3755 = fma(_2698, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3747);
    float _3757 = fma(_2698, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3749);
    float _3759 = _3624 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3761 = fma(_2702, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3753);
    float _3763 = fma(_2702, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3755);
    float _3765 = fma(_2698, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3751);
    out.m_82.x = _2698;
    out.m_82.y = _2700;
    out.m_82.z = _2702;
    float _3767 = _3761 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3769 = fma(_2702, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3757);
    float _3771 = _3763 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3773 = fma(_3630, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3759);
    float _3775 = fma(_2702, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3765);
    float _3777 = _3767 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3779 = -_657;
    float _3781 = _3779 + _3362;
    float _3783 = _3767 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3785 = _3769 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3787 = fma(_3771, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3777);
    float _3789 = -_655;
    float _3791 = _3789 + _3364;
    float _3793 = _3767 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3795 = _3767 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    out.m_84.y = 1.0;
    float _3797 = fma(_3771, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3783);
    float _3799 = fma(_3771, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3793);
    float _3801 = fma(_3608, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3773);
    float _3803 = _3781 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _3805 = _3785 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _3807 = _3614 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3809 = -_659;
    float _3811 = _3809 + _3366;
    float _3813 = fma(_3771, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3795);
    float _3815 = _3781 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _3817 = _3781 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _3819 = fma(_3791, (*spvDescriptorSet0.vp_c15)._m0[636].x, _3803);
    float _3821 = _3775 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3823 = _3805 + _3797;
    float _3825 = _3664 * 0.5;
    float _3827 = fma(_3791, (*spvDescriptorSet0.vp_c15)._m0[638].x, _3817);
    float _3829 = exp2(_3807);
    float _3831 = fma(_3821, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3823);
    float _3833 = fma(_3791, (*spvDescriptorSet0.vp_c15)._m0[635].x, _3815);
    float _3835 = fma(_3811, (*spvDescriptorSet0.vp_c15)._m0[638].z, _3827);
    float _3837 = fma(_3785, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3787);
    float _3839 = fma(_3646, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3801);
    float _3841 = fma(_3811, (*spvDescriptorSet0.vp_c15)._m0[635].z, _3833);
    float _3843 = _3835 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _3845 = fma(_3821, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3837);
    float _3847 = fma(_3702, -0.5, _3825);
    float _3849 = _3785 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _3851 = 1.0 / _3831;
    float _3853 = _3841 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _3855 = fma(_3811, (*spvDescriptorSet0.vp_c15)._m0[636].z, _3819);
    float _3857 = _3785 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _3859 = _3849 + _3813;
    float _3861 = -_3829;
    float _3863 = _3861 + 1.0;
    float _3865 = _3839 + _3664;
    out.gl_Position.x = _3684;
    out.gl_Position.y = _3702;
    out.gl_Position.z = _3839;
    out.gl_Position.w = _3664;
    float _3867 = 1.0 / _3843;
    float _3869 = _3863 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3871 = _3684 + _3664;
    out.m_86.x = _3364;
    out.m_86.y = _3362;
    out.m_86.z = _3366;
    float _3873 = _3857 + _3799;
    float _3875 = _3865 * 0.5;
    float _3877 = _3871 * 0.5;
    float _3879 = _3845 * _3851;
    float _3881 = _3855 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _3883 = fma(_3821, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3873);
    float _3885 = fma(_3821, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3859);
    bool _3887 = _3879 > 0.0;
    float _3889 = -_3869;
    float _3891 = _3889 + 1.0;
    out.m_88.x = _3877;
    out.m_88.y = _3847;
    out.m_88.z = _3875;
    out.m_88.w = _3664;
    float _3893 = _3853 * _3867;
    bool _3895 = _3879 < 1.0;
    bool _3897 = _3895 && _3887;
    float _3899 = _3881 * _3867;
    bool _3901 = _3706 > (-1.0);
    bool _3903 = _3901 && _3897;
    bool _3905 = _3708 > (-1.0);
    bool _3907 = _3905 && _3903;
    bool _3909 = _3706 < 1.0;
    bool _3911 = _3909 && _3907;
    float _3913 = _3883 * _3851;
    float _3915 = _3885 * _3851;
    bool _3917 = _3708 < 1.0;
    bool _3919 = _3917 && _3911;
    float _3921 = _3869 * _3716;
    float _3923 = _3733 * _3921;
    float _3925 = _3743 * _3921;
    float _3927 = fma(_3739, _3923, _3727);
    float _3929 = fma(_3741, _3923, _3729);
    float _3931 = _3733 * _3891;
    float _3933 = fma(_3733, _3925, _3731);
    out.m_90.x = _3927;
    out.m_90.y = _3929;
    out.m_90.z = _3933;
    out.m_90.w = _3931;
    bool _3935 = !_3919;
    float _3937 = _3733;
    float _3939 = _3702;
    float _3941 = _3731;
    float _3943 = _3923;
    float _3945 = _3891;
    float _3947 = _3684;
    float _3949 = _3664;
    float _3983;
    if (!_3935)
    {
        float _3951 = -_3915;
        float _3953 = _3708 + _3951;
        float _3955 = -_3913;
        float _3957 = _3706 + _3955;
        float _3959 = _2896 * _3406;
        float _3961 = -_3893;
        float _3963 = _3706 + _3961;
        float _3965 = _3953 * _3953;
        float _3967 = -_3899;
        float _3969 = _3708 + _3967;
        float _3971 = _3959 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
        float _3973 = fma(_3957, _3957, _3965);
        float _3975 = sqrt(_3973);
        bool _3977 = _3975 > 0.0;
        _3941 = _3973;
        _3943 = _3957;
        _3945 = _3975;
        if (!_3977)
        {
            _3937 = _3971;
        }
        float _3979 = _3937;
        bool _3981 = !_3977;
        _3983 = _3979;
        _3985 = _3981;
        if (!_3985)
        {
            float _3987 = _3969 * _3969;
            float _3989 = fma(_3963, _3963, _3987);
            float _3991 = rsqrt(_3973);
            float _3993 = sqrt(_3989);
            float _3995 = _3957 * _3991;
            float _3997 = _3953 * _3991;
            bool _3999 = _3993 > 0.0;
            float _4001 = _3993;
            _3945 = _3991;
            if (!_3999)
            {
                _4001 = _3971;
            }
            float _4003 = _4001;
            bool _4005 = !_3999;
            _3983 = _4003;
            _3985 = _4005;
            if (!_3985)
            {
                float _4007 = _2074 * _3821;
                float _4009 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
                float _4011 = fma(_4007, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3805);
                float _4013 = fma(_4007, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3849);
                float _4015 = fma(_3821, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4011);
                float _4017 = fma(_3821, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4013);
                float _4019 = 1.0 / _4015;
                float _4021 = _4009 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _4023 = fma(_4007, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3857);
                float _4025 = rsqrt(_3989);
                float _4027 = _3969 * _4021;
                float _4029 = fma(_3821, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4023);
                float _4031 = _3963 * _4021;
                float _4033 = _4027 * _4027;
                float _4035 = _4017 * _4019;
                float _4037 = _4029 * _4019;
                float _4039 = fma(_4031, _4031, _4033);
                float _4041 = _4035 * _4035;
                float _4043 = fma(_4037, _4037, _4041);
                float _4045 = sqrt(_4039);
                float _4047 = _3969 * _4025;
                float _4049 = _3963 * _4025;
                float _4051 = _3997 * _4047;
                float _4053 = sqrt(_4043);
                float _4055 = fma(_3995, _4049, _4051);
                float _4057 = precise::min(0.0, _4055);
                float _4059 = _3664 * _4057;
                float _4061 = fma(_4031, _4059, _3684);
                float _4063 = fma(_4045, (*spvDescriptorSet0.vp_c13)._m0[1].x, _4053);
                float _4065 = fma(_4027, _4059, _3702);
                float _4067 = 1.0 / _4063;
                out.gl_Position.x = _4061;
                out.gl_Position.y = _4065;
                float _4069 = _4053 * _4067;
                out.m_84.y = _4069;
                _3939 = _4065;
                _3941 = _4027;
                _3983 = _3971;
                _3943 = _4051;
                _3945 = _4059;
                _3947 = _4061;
                _3985 = true;
            }
        }
    }
    else
    {
        float _4071 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _4071;
        _3983 = 0.0;
        _3947 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    _3985 = false;
    float _4073 = _3939;
    float _4075 = _3941;
    float _4077 = _3983;
    float _4079 = _3943;
    float _4081 = _3945;
    float _4083 = _3947;
    bool _4085 = _3428 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4087 = isnan(_3428);
    bool _4089 = _4085 || _4087;
    bool _4091 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4093 = _4089 || _4091;
    float _4095 = _4079;
    float _4097 = _4075;
    float _4099 = _4081;
    float _4101 = _4073;
    float _4103 = _4083;
    if (!_4093)
    {
        _4095 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4105 = _4095;
    float _4107 = _4105;
    float _4109 = _4105;
    if (!_4093)
    {
        _4097 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4111 = _4097;
    float _4113 = _4111;
    float _4115 = _4111;
    if (!_4093)
    {
        _3949 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4117 = _3949;
    float _4119 = _4117;
    float _4121 = _4117;
    if (!_4093)
    {
        _4099 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4123 = _4099;
    float _4125 = _4123;
    float _4127 = _4123;
    if (!_4093)
    {
        _4101 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4129 = _4101;
    float _4131 = _4129;
    float _4133 = _4129;
    if (!_4093)
    {
        _4103 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4135 = _4103;
    bool _4137 = !_4093;
    float _4139 = _4135;
    float _4141 = _4135;
    if (!_4137)
    {
        bool _4143 = _3428 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4145 = isnan(_3428);
        bool _4147 = _4143 || _4145;
        bool _4149 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4151 = _4147 || _4149;
        if (!_4151)
        {
            float _4153 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4155 = _3428 + _4153;
            float _4157 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4159 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4157;
            float _4161 = 1.0 / _4159;
            float _4163 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4165 = _4163 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4167 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4169 = _4167 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4171 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4173 = _4171 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4175 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4177 = _4175 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4179 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4181 = _4179 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4183 = _4155 * _4161;
            float _4185 = precise::clamp(_4183, 0.0, 1.0);
            float _4187 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4189 = _4187 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4191 = fma(_4185, _4165, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4193 = fma(_4185, _4189, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4195 = fma(_4185, _4169, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4197 = fma(_4185, _4173, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4199 = fma(_4185, _4177, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4201 = fma(_4185, _4181, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4115 = _4193;
            _4133 = _4199;
            _4109 = _4191;
            _4127 = _4197;
            _4121 = _4195;
            _4141 = _4201;
            _4203 = true;
        }
        else
        {
            bool _4205 = _3428 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4207 = isnan(_3428);
            bool _4209 = _4205 || _4207;
            bool _4211 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4213 = _4209 || _4211;
            if (!_4213)
            {
                _4107 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4215 = _4107;
            _4109 = _4215;
            if (!_4213)
            {
                _4113 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4217 = _4113;
            _4115 = _4217;
            if (!_4213)
            {
                _4119 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4219 = _4119;
            _4121 = _4219;
            if (!_4213)
            {
                _4125 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4221 = _4125;
            _4127 = _4221;
            if (!_4213)
            {
                _4131 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4223 = _4131;
            _4133 = _4223;
            if (!_4213)
            {
                _4139 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4225 = _4139;
            bool _4227 = !_4213;
            _4141 = _4225;
            if (!_4227)
            {
                bool _4229 = _3428 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4231 = isnan(_3428);
                bool _4233 = _4229 || _4231;
                bool _4235 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4237 = _4233 || _4235;
                if (!_4237)
                {
                    float _4239 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4241 = _3428 + _4239;
                    float _4243 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4245 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4243;
                    float _4247 = 1.0 / _4245;
                    float _4249 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4251 = _4249 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4253 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4255 = _4253 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4257 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4259 = _4257 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4261 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4263 = _4261 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4265 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4267 = _4265 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4269 = _4241 * _4247;
                    float _4271 = precise::clamp(_4269, 0.0, 1.0);
                    float _4273 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4275 = _4273 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4277 = fma(_4271, _4251, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4279 = fma(_4271, _4275, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4281 = fma(_4271, _4255, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4283 = fma(_4271, _4259, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4285 = fma(_4271, _4263, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4287 = fma(_4271, _4267, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4115 = _4279;
                    _4133 = _4285;
                    _4109 = _4277;
                    _4127 = _4283;
                    _4121 = _4281;
                    _4141 = _4287;
                    _4203 = true;
                }
                else
                {
                    _4115 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4133 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4109 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4127 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4121 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4141 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4203 = false;
    float _4289 = _4115;
    float _4291 = _4133;
    float _4293 = _4109;
    float _4295 = _4127;
    float _4297 = _4121;
    float _4299 = _4141;
    float _4301 = fma(_2648, -0.5, 0.5);
    float _4303 = precise::clamp(_4301, 0.0, 1.0);
    float _4305 = -_4289;
    float _4307 = _4305 + _4291;
    float _4309 = _4077 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4311 = -_4293;
    float _4313 = _4311 + _4295;
    float _4315 = fma(_4303, _4307, _4289);
    out.m_92.x = 0.0;
    float _4317 = -_4297;
    float _4319 = _4317 + _4299;
    float _4321 = fma(_4303, _4313, _4293);
    float _4323 = _4315 * 0.586610972881317138671875;
    out.m_53.x = _4309;
    bool _4325 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4327 = fma(_4303, _4319, _4297);
    float _4329 = fma(_4321, 0.298911988735198974609375, _4323);
    bool _4331 = _3406 > 0.0;
    bool _4333 = isnan(_3406);
    bool _4335 = _4331 || _4333;
    bool _4337 = isnan(0.0);
    bool _4339 = _4335 || _4337;
    float _4341 = fma(_4327, 0.114477999508380889892578125, _4329);
    float _4343 = -_4341;
    float _4345 = _4321 + _4343;
    float _4347 = -_4341;
    float _4349 = _4315 + _4347;
    float _4351 = -_4341;
    float _4353 = _4327 + _4351;
    float _4355 = fma(_4345, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4341);
    float _4357 = fma(_4349, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4341);
    float _4359 = fma(_4353, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4341);
    bool _4361 = !_4325;
    if (!_4361)
    {
        float _4363 = -_3362;
        float _4365 = _4363 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4367 = -_3364;
        float _4369 = _4367 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4371 = -_3366;
        float _4373 = _4371 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4375 = _4365 * _4365;
        float _4377 = fma(_4369, _4369, _4375);
        float _4379 = fma(_4373, _4373, _4377);
        float _4381 = sqrt(_4379);
        float _4383 = rsqrt(_4379);
        float _4385 = -_4381;
        float _4387 = _4385 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4389 = _4387 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4391 = precise::clamp(_4389, 0.0, 1.0);
        float _4393 = _4369 * _4383;
        float _4395 = _4365 * _4383;
        float _4397 = abs(_4391);
        float _4399 = log2(_4397);
        float _4401 = _4373 * _4383;
        float _4403 = _4393 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4405 = _2648 * _4395;
        float _4407 = -_4395;
        float _4409 = -_4403;
        float _4411 = fma(_4407, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4409);
        float _4413 = fma(_2628, _4393, _4405);
        float _4415 = -_4401;
        float _4417 = fma(_4415, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4411);
        float _4419 = fma(_2432, _4401, _4413);
        float _4421 = precise::clamp(_4419, 0.0, 1.0);
        float _4423 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4425 = _4417 + _4423;
        float _4427 = _4399 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4429 = _4425 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4431 = precise::clamp(_4429, 0.0, 1.0);
        float _4433 = exp2(_4427);
        float _4435 = _4433 * _4431;
        float _4437 = _4421 * _4435;
        float _4439 = _4437 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4441 = _4437 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4443 = _4437 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _4439;
        out.m_92.y = _4441;
        out.m_92.z = _4443;
    }
    out.m_94.x = _4355;
    out.m_94.y = _4357;
    out.m_94.z = _4359;
    if (_4339)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _4445 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4445;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4203 = false;
    bool _3985 = false;
    bool _2748 = false;
    bool _2736 = false;
    bool _681 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_46.w;
    float _110 = in.m_48.w;
    float _112 = trunc(_108);
    int _115 = int(_112);
    float _117 = -_110;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _119;
    bool _123 = _115 >= 1;
    float _125 = 0.0;
    float _127 = _110;
    float _129 = _119;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _125;
    if (!_123)
    {
        out.m_53.x = 0.0;
    }
    int _133 = 0;
    if (!_123)
    {
        float _135 = _131 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    int _139 = _137;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4513 = as_type<float>(_137);
        out.gl_Position.z = _4513;
    }
    if (!_123)
    {
        return out;
    }
    bool _141 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_110);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = in.m_55.x;
    float _153 = float(_115);
    float _155 = in.m_55.y;
    bool _157 = _119 >= _153;
    bool _159 = !_149;
    bool _161 = _157 || _159;
    float _163 = in.m_55.z;
    if (_161)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _127;
    if (_161)
    {
        out.m_53.x = 0.0;
    }
    if (_161)
    {
        float _167 = _165 * 5.0;
        _139 = as_type<int>(_167);
    }
    int _169 = _139;
    out.m_57.x = _151;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4576 = as_type<float>(_169);
        out.gl_Position.z = _4576;
    }
    out.m_57.y = _155;
    out.m_57.z = _163;
    if (_161)
    {
        return out;
    }
    float _171 = in.m_59.x;
    float _173 = in.m_59.y;
    float _175 = in.m_59.z;
    float _177 = in.m_61.x;
    float _179 = in.m_61.y;
    float _181 = in.m_61.z;
    float _183 = in.m_63.x;
    float _185 = in.m_63.y;
    float _187 = in.m_63.z;
    float _189 = as_type<float>(int(gl_VertexIndex));
    float _191 = in.m_68.w;
    float _193 = in.m_46.x;
    float _195 = in.m_46.y;
    float _197 = in.m_46.z;
    float _199 = _171 * _171;
    float _201 = _173 * _173;
    float _203 = fma(_177, _177, _199);
    float _205 = fma(_179, _179, _201);
    float _207 = fma(_183, _183, _203);
    float _209 = _175 * _175;
    float _211 = fma(_185, _185, _205);
    float _213 = sqrt(_207);
    float _215 = fma(_181, _181, _209);
    float _217 = fma(_187, _187, _215);
    float _219 = sqrt(_211);
    float _221 = sqrt(_217);
    bool _223 = _213 > 0.0;
    bool _225 = _219 > 0.0;
    float _227 = 0.0;
    float _229 = _207;
    float _231 = _181;
    if (_223)
    {
        float _233 = rsqrt(_207);
        _227 = _233;
    }
    float _235 = _227;
    float _237 = 0.0;
    if (!_223)
    {
        _237 = 0.0;
    }
    float _239 = _237;
    bool _241 = _221 > 0.0;
    float _243 = 0.0;
    float _245 = _239;
    if (!_223)
    {
        _243 = 0.0;
    }
    float _247 = _243;
    int _249 = as_type<int>(_189) & 1;
    bool _251 = _249 != 0;
    int _253 = as_type<int>(_189) & 2;
    bool _255 = _253 != 0;
    float _257 = 0.0;
    float _259 = _247;
    if (_225)
    {
        float _261 = rsqrt(_211);
        _257 = _261;
    }
    float _263 = _257;
    float _265 = in.m_48.x;
    float _267 = in.m_48.y;
    float _269 = in.m_48.z;
    bool _271 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _273 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _275 = _271 || _273;
    bool _277 = isnan(1.0);
    bool _279 = _275 || _277;
    float _281 = 0.0;
    float _283 = 0.0;
    if (!_225)
    {
        _281 = 0.0;
        _283 = 0.0;
    }
    float _285 = _281;
    float _287 = _283;
    float _289 = _285;
    float _291 = _287;
    if (!_223)
    {
        _229 = 0.0;
    }
    float _293 = _229;
    float _295 = 0.0;
    float _297 = _293;
    if (!_225)
    {
        _295 = 0.0;
    }
    float _299 = _295;
    float _301 = 0.0;
    float _303 = _299;
    if (_241)
    {
        float _305 = rsqrt(_217);
        _301 = _305;
    }
    float _307 = _301;
    int _309 = int(_251);
    int _311 = _255 ? 2 : 0;
    int _313 = _309 | _311;
    int _315 = _223 ? 4 : 0;
    int _317 = _313 | _315;
    int _319 = _225 ? 8 : 0;
    int _321 = _317 | _319;
    int _323 = _241 ? 16 : 0;
    int _325 = _321 | _323;
    int _327 = _279 ? 32 : 0;
    int _329 = _325 | _327;
    int _331 = false ? 64 : 0;
    int _333 = _329 | _331;
    int _335 = _333 & 32;
    float _337 = 0.0;
    float _339 = 0.0;
    float _341 = as_type<float>(_335);
    if (!_241)
    {
        _337 = 0.0;
        _339 = 0.0;
    }
    float _343 = _337;
    float _345 = _339;
    float _347 = _345;
    float _349 = _343;
    if (_223)
    {
        float _351 = _235 * _177;
        _245 = _351;
    }
    float _353 = _245;
    if (_223)
    {
        float _355 = _235 * _171;
        _297 = _355;
    }
    float _357 = _297;
    if (_223)
    {
        float _359 = _235 * _183;
        _259 = _359;
    }
    float _361 = _259;
    float _363 = 0.0;
    if (!_241)
    {
        _363 = 0.0;
    }
    float _365 = _363;
    float _367 = _365;
    if (_225)
    {
        float _369 = _263 * _179;
        _303 = _369;
    }
    float _371 = _303;
    float _373 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _375 = _373;
    if (_225)
    {
        float _377 = _263 * _173;
        _289 = _377;
    }
    float _379 = _289;
    if (_225)
    {
        float _381 = _263 * _185;
        _291 = _381;
    }
    float _383 = _291;
    bool _385 = !_251;
    float _387 = _385 ? (-0.5) : 0.5;
    if (!_279)
    {
        float _389 = _373 * _373;
        float _391 = _389 * 0.5;
        _341 = _391;
    }
    float _393 = _341;
    bool _395 = !_255;
    float _397 = _395 ? (-0.5) : 0.5;
    float _399 = _393;
    float _401 = _265;
    float _403 = _269;
    if (_241)
    {
        float _405 = _307 * _181;
        _347 = _405;
    }
    float _407 = _347;
    if (_241)
    {
        float _409 = _307 * _175;
        _349 = _409;
    }
    float _411 = _349;
    if (_241)
    {
        float _413 = _307 * _187;
        _367 = _413;
    }
    float _415 = _367;
    if (!_279)
    {
        float _417 = _393 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _399 = _417;
    }
    float _419 = _399;
    bool _421 = !_279;
    float _423 = _419;
    if (!_421)
    {
        float _425 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _427 = log2(_425);
        float _429 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _431 = _429 + 1.0;
        float _433 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _435 = _373 * _427;
        float _437 = 1.0 / _431;
        float _439 = _433 * 0.693147182464599609375;
        float _441 = exp2(_435);
        float _443 = 1.0 / _439;
        float _445 = _441 + (-1.0);
        float _447 = -_445;
        float _449 = fma(_447, _443, _373);
        float _451 = _449 * _437;
        float _453 = _451 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _423 = _453;
    }
    float _455 = _423;
    float _457 = _455 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _459 = !_279;
    float _461 = _457;
    float _463 = _455;
    if (!_459)
    {
        float _465 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _467 = log2(_465);
        float _469 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _471 = _469 + 1.0;
        float _473 = 1.0 / _471;
        float _475 = _373 * _467;
        float _477 = exp2(_475);
        float _479 = -_477;
        float _481 = _479 + 1.0;
        float _483 = _481 * _473;
        _375 = _483;
    }
    float _485 = _375;
    float _487 = _455 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _489 = _457 * _357;
    float _491 = _457 * _379;
    float _493 = _457 * _411;
    float _495 = _485;
    if (!_279)
    {
        float _497 = _119 * _119;
        float _499 = _497 * 0.5;
        _461 = _499;
    }
    float _501 = _461;
    float _503 = fma(_487, _353, _489);
    float _505 = fma(_487, _371, _491);
    float _507 = fma(_487, _407, _493);
    float _509 = _455 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_279)
    {
        float _511 = _501 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _463 = _511;
    }
    float _513 = _463;
    bool _515 = !_279;
    float _517 = _513;
    if (!_515)
    {
        float _519 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _521 = log2(_519);
        float _523 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _525 = _523 + 1.0;
        float _527 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _529 = _119 * _521;
        float _531 = 1.0 / _525;
        float _533 = _527 * 0.693147182464599609375;
        float _535 = exp2(_529);
        float _537 = 1.0 / _533;
        float _539 = _535 + (-1.0);
        float _541 = -_539;
        float _543 = fma(_541, _537, _119);
        float _545 = _543 * _531;
        float _547 = _545 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _517 = _547;
    }
    float _549 = _517;
    float _551 = _549 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _553 = fma(_509, _361, _503);
    float _555 = fma(_509, _383, _505);
    float _557 = _549 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _559 = _551 * _357;
    float _561 = _551 * _379;
    float _563 = _551 * _411;
    float _565 = fma(_509, _415, _507);
    float _567 = fma(_557, _353, _559);
    float _569 = fma(_557, _371, _561);
    float _571 = fma(_557, _407, _563);
    float _573 = _549 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _575 = fma(_485, _265, _553);
    float _577 = fma(_485, _267, _555);
    float _579 = fma(_485, _269, _565);
    float _581 = fma(_573, _361, _567);
    float _583 = fma(_573, _383, _569);
    float _585 = fma(_573, _415, _571);
    if (!_279)
    {
        _495 = _119;
    }
    float _587 = _495;
    bool _589 = !_279;
    float _591 = _587;
    if (!_589)
    {
        float _593 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _595 = log2(_593);
        float _597 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _599 = _597 + 1.0;
        float _601 = 1.0 / _599;
        float _603 = _119 * _595;
        float _605 = exp2(_603);
        float _607 = -_605;
        float _609 = _607 + 1.0;
        float _611 = _609 * _601;
        _591 = _611;
    }
    float _613 = _591;
    float _615 = fma(_613, _267, _583);
    float _617 = 1.0 / _153;
    bool _619 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _621 = fma(_613, _265, _581);
    float _623 = -_615;
    float _625 = _577 + _623;
    float _627 = fma(_613, _269, _585);
    float _629 = fma(_577, _191, _195);
    float _631 = fma(_575, _191, _193);
    float _633 = -_621;
    float _635 = _575 + _633;
    float _637 = _625 * _179;
    float _639 = _625 * _173;
    float _641 = _625 * _185;
    float _643 = -_627;
    float _645 = _579 + _643;
    float _647 = fma(_635, _177, _637);
    float _649 = fma(_635, _171, _639);
    float _651 = fma(_635, _183, _641);
    float _653 = fma(_579, _191, _197);
    float _655 = fma(_645, _181, _647);
    float _657 = fma(_645, _175, _649);
    float _659 = fma(_645, _187, _651);
    float _661 = _119 * _617;
    bool _663 = !_619;
    float _679;
    if (!_663)
    {
        float _665 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _667 = _151 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _669 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _671 = _669 * _665;
        float _673 = floor(_671);
        float _675 = -_673;
        float _677 = _671 + _675;
        _679 = _677;
        _681 = true;
    }
    else
    {
        _679 = _661;
    }
    _681 = false;
    float _683 = _679;
    float _685 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _687 = int(_685);
    float _689 = in.m_55.w;
    float _691 = _151 * 2.0;
    float _693 = _629 * _173;
    float _695 = _629 * _185;
    int _697 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _699 = _697 != 0;
    float _701 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _703 = int(_701);
    float _705 = _151 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _709 = _707 != 0;
    int _711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _713 = _711 != 0;
    int _715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _717 = _715 != 0;
    float _719 = fma(_631, _171, _693);
    bool _721 = _151 > 0.5;
    float _723 = fma(_631, _183, _695);
    float _725 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _727 = int(_725);
    float _729 = float(_687);
    float _731 = in.m_63.w;
    bool _733 = !_713;
    int _735 = _733 ? 0 : 1;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _739 = -_387;
    int _741 = _721 ? as_type<int>(_739) : as_type<int>(_387);
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _745 = _683 + _743;
    bool _747 = _155 > 0.5;
    float _749 = 1.0 / _729;
    float _751 = float(_703);
    float _753 = -_737;
    float _755 = fma(_705, 2.0, _753);
    bool _757 = _689 > 0.5;
    float _759 = in.m_59.w;
    float _761 = _155 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _763 = !_709;
    int _765 = _763 ? 0 : 1;
    float _767 = 1.0 / _751;
    float _769 = float(uint(_727));
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _773 = _771 != 0;
    float _775 = -_397;
    float _777 = _757 ? _775 : _397;
    bool _779 = !_773;
    int _781 = _779 ? 0 : 1;
    float _783 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _785 = int(_783);
    float _787 = _119 * _749;
    float _789 = _155 * 2.0;
    int _791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _793 = _791 != 0;
    int _795 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _797 = _795 != 0;
    float _799 = _163 * 2.0;
    float _801 = 1.0 / _769;
    float _803 = _119 * _767;
    bool _805 = !_797;
    float _807 = _805 ? _387 : as_type<float>(_741);
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _811 = _809 != 0;
    bool _813 = !_717;
    int _815 = _813 ? 0 : 1;
    float _817 = trunc(_787);
    int _819 = int(_817);
    float _821 = float(uint(_785));
    int _823 = ~_785;
    int _825 = _823 + 1;
    float _827 = 0.0;
    float _829 = _777;
    if (_699)
    {
        _827 = 1.0;
    }
    float _831 = _827;
    float _833 = 0.0;
    float _835 = _831;
    if (_699)
    {
        _833 = _151;
    }
    float _837 = _833;
    float _839 = 1.0 / _821;
    int _841 = as_type<int>(_801) + (-2);
    float _843 = 0.0;
    float _845 = _837;
    if (_699)
    {
        _843 = 1.0;
    }
    float _847 = _843;
    float _849 = _847;
    if (!_699)
    {
        _835 = 7.345489978790283203125;
    }
    float _851 = _835;
    if (!_699)
    {
        _845 = _155;
    }
    float _853 = _845;
    float _855 = trunc(_803);
    int _857 = int(_855);
    float _859 = float(uint(_819));
    float _861 = _851 * _151;
    if (!_699)
    {
        _849 = 1.2345600128173828125;
    }
    float _863 = _849;
    float _865 = as_type<float>(_841) * _859;
    float _867 = floor(_691);
    int _869 = as_type<int>(_839) + (-2);
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _871;
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _877 = _853 * _863;
    bool _879 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _881 = isnan(_683);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _887 = _883 || _885;
    float _889 = float(_887);
    float _891 = float(uint(_857));
    float _893 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _895 = log2(_893);
    float _897 = fma(_761, -2.0, _875);
    float _899 = _151 + _155;
    float _901 = as_type<float>(_869) * _891;
    float _903 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _897);
    float _905 = _899 + (-1.0);
    bool _907 = _867 > 0.0;
    float _909 = trunc(_865);
    float _911 = precise::max(_909, 0.0);
    uint _914 = uint(_911);
    bool _916 = _867 >= 0.0;
    bool _918 = isnan(_867);
    bool _920 = _916 || _918;
    bool _922 = isnan(0.0);
    bool _924 = _920 || _922;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _926;
    float _930 = -_397;
    int _932 = _747 ? as_type<int>(_930) : as_type<int>(_397);
    bool _934 = _163 > 0.5;
    bool _936 = !_811;
    float _938 = _936 ? _397 : as_type<float>(_932);
    float _940 = trunc(_901);
    float _942 = precise::max(_940, 0.0);
    uint _944 = uint(_942);
    int _946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _948 = _946 != 0;
    float _950 = -_387;
    int _952 = _934 ? as_type<int>(_950) : as_type<int>(_387);
    int _954 = abs(_765);
    bool _956 = !_948;
    float _958 = _956 ? _387 : as_type<float>(_952);
    float _960 = floor(_789);
    int _962 = ~_727;
    int _964 = _962 + 1;
    int _966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _968 = _966 != 0;
    int _970 = abs(_815);
    int _972 = _964 * int(_914);
    int _974 = _972 + _819;
    bool _976 = !_968;
    int _978 = _976 ? 0 : 1;
    float _980 = floor(_799);
    int _982 = _924 ? 0 : 1;
    float _984 = float(uint(_974));
    int _986 = ~_982;
    int _988 = _986 + 1;
    int _990 = _988 + 1;
    int _992 = _990;
    int _994 = _974;
    if (!_907)
    {
        int _996 = ~_982;
        int _998 = _996 + 1;
        _992 = _998;
    }
    int _1000 = _992;
    float _1002 = _119 * _895;
    float _1004 = 1.0 / _873;
    bool _1006 = _960 > 0.0;
    bool _1008 = _960 >= 0.0;
    bool _1010 = isnan(_960);
    bool _1012 = _1008 || _1010;
    bool _1014 = isnan(0.0);
    bool _1016 = _1012 || _1014;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1020 = 1.0 + _1018;
    int _1022 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1024 = _1022 != 0;
    if (_699)
    {
        _994 = 0;
    }
    int _1026 = _994;
    float _1028 = exp2(_1002);
    bool _1030 = !_1024;
    int _1032 = _1030 ? 0 : 1;
    bool _1034 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1036 = isnan(0.0);
    bool _1038 = _1034 || _1036;
    bool _1040 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1042 = _1038 || _1040;
    int _1044 = _1026;
    if (!_699)
    {
        _1044 = 1;
    }
    int _1046 = _1044;
    float _1048 = float(_1000);
    float _1050 = 1.0 / _1020;
    int _1052 = _825 * int(_944);
    int _1054 = _1052 + _857;
    float _1056 = as_type<float>(_841) * _984;
    int _1058 = _1016 ? 0 : 1;
    int _1060 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1062 = _1060 != 0;
    int _1064 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1066 = _1064 != 0;
    int _1068 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1070 = _1068 != 0;
    float _1072 = float(uint(_1054));
    float _1074 = trunc(_1056);
    float _1076 = precise::max(_1074, 0.0);
    uint _1078 = uint(_1076);
    float _1080 = -_1028;
    float _1082 = _1080 + 1.0;
    bool _1084 = _1046 != 1;
    float _1086 = as_type<float>(_869) * _1072;
    int _1088 = ~_1058;
    int _1090 = _1088 + 1;
    int _1092 = _1090 + 1;
    int _1094 = _1092;
    if (!_1006)
    {
        int _1096 = ~_1058;
        int _1098 = _1096 + 1;
        _1094 = _1098;
    }
    int _1100 = _1094;
    float _1102 = trunc(_1086);
    float _1104 = precise::max(_1102, 0.0);
    uint _1106 = uint(_1104);
    float _1108 = _1042 ? _1082 : 0.0;
    bool _1110 = _980 > 0.0;
    bool _1112 = _980 >= 0.0;
    bool _1114 = isnan(_980);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan(0.0);
    bool _1120 = _1116 || _1118;
    float _1122 = _1108 * _1050;
    int _1124 = ~_785;
    int _1126 = _1124 + 1;
    int _1128 = int(_914) + int(_1078);
    int _1130 = ~_727;
    int _1132 = _1130 + 1;
    bool _1134 = !_793;
    float _1136 = _1134 ? _397 : _777;
    int _1138 = _1132 * _1128;
    int _1140 = _1138 + _819;
    int _1142 = int(_944) + int(_1106);
    int _1144 = _1120 ? 0 : 1;
    float _1146 = 0.0;
    if (!_1084)
    {
        _1146 = _155;
    }
    float _1148 = _1146;
    int _1150 = _1126 * _1142;
    int _1152 = _1150 + _857;
    float _1154 = 0.0;
    float _1156 = _1148;
    if (!_1084)
    {
        _1154 = _155;
    }
    float _1158 = _1154;
    float _1160 = 0.0;
    float _1162 = _1158;
    if (!_1084)
    {
        _1160 = _163;
    }
    float _1164 = _1160;
    float _1166 = _1164;
    if (!_1084)
    {
        _829 = _163;
    }
    float _1168 = _829;
    float _1170 = _1168;
    if (_1084)
    {
        _1156 = _151;
    }
    float _1172 = _1156;
    if (_1084)
    {
        _1162 = _151;
    }
    float _1174 = _1162;
    if (_1084)
    {
        _1166 = _155;
    }
    float _1176 = _1166;
    if (_1084)
    {
        _1170 = _155;
    }
    float _1178 = _1170;
    bool _1180 = !_1066;
    int _1182 = _1180 ? 0 : 1;
    bool _1184 = uint(_1140) >= uint(_727);
    bool _1186 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1188 = isnan(1.0);
    bool _1190 = _1186 || _1188;
    bool _1192 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1194 = _1190 || _1192;
    bool _1196 = uint(_1152) >= uint(_785);
    float _1198 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1200 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1198;
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1204 = _1202 != 0;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _1210 = ~_1144;
    int _1212 = _1210 + 1;
    int _1214 = _1212 + 1;
    int _1216 = _1214;
    if (!_1110)
    {
        int _1218 = ~_1144;
        int _1220 = _1218 + 1;
        _1216 = _1220;
    }
    int _1222 = _1216;
    float _1224 = 1.0 / _1200;
    bool _1226 = !_1194;
    float _1228 = _1226 ? _119 : _1122;
    float _1230 = _155 + _163;
    bool _1232 = !_1184;
    int _1234 = _1232 ? 0 : (-1);
    bool _1236 = !_1196;
    int _1238 = _1236 ? 0 : (-1);
    float _1240 = _1230 + (-1.0);
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1244 = _1242 != 0;
    int _1246 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1248 = _1246 != 0;
    int _1250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1252 = _1250 != 0;
    int _1254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1256 = _1254 != 0;
    float _1258 = _629 * _179;
    float _1260 = 1.0 / _1208;
    float _1262 = fma(_631, _177, _1258);
    float _1264 = _151 + _163;
    float _1266 = in.m_61.w;
    float _1268 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1270 = _745 * _1224;
    float _1272 = _1264 + (-1.0);
    float _1274 = fma(_653, _175, _719);
    float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1278 = _683 + _1276;
    float _1280 = fma(_653, _181, _1262);
    float _1282 = fma(_653, _187, _723);
    float _1284 = _1274 + _759;
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1288 = _683 + _1286;
    float _1290 = _1278 * _1260;
    float _1292 = _1282 + _731;
    float _1294 = _1288 * _1004;
    float _1296 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1298 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1300 = isnan(_683);
    bool _1302 = _1298 || _1300;
    bool _1304 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1306 = _1302 || _1304;
    float _1308 = float(_1306);
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1310;
    float _1314 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1316 = _1314 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1318 = _1284 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _1320 = fma(_1312, _1270, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1322 = _1292 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    bool _1324 = !_1070;
    int _1326 = _1324 ? 0 : 1;
    float _1328 = _1280 + _1266;
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1332 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1330;
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1336 = _1334 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1338 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1340 = fma(_1332, _1270, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _1342 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1344 = isnan(_683);
    bool _1346 = _1342 || _1344;
    bool _1348 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1350 = _1346 || _1348;
    float _1352 = float(_1350);
    float _1354 = fma(_1336, _1290, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _1356 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1358 = isnan(_683);
    bool _1360 = _1356 || _1358;
    bool _1362 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1364 = _1360 || _1362;
    float _1366 = float(_1364);
    float _1368 = fma(_1316, _1290, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1372 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1370;
    float _1374 = -_1352;
    float _1376 = _1374 + 1.0;
    float _1378 = floor(_861);
    float _1380 = -_1366;
    float _1382 = _1380 + 1.0;
    float _1384 = _1328 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _1386 = _1366 * _1376;
    float _1388 = -_119;
    float _1390 = fma(_1388, (*spvDescriptorSet0.vp_c9)._m0[76].x, _755);
    float _1392 = _807 + 0.5;
    float _1394 = _1308 * _1382;
    float _1396 = -_1308;
    float _1398 = _1396 + 1.0;
    float _1400 = fma(_928, _1294, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1402 = fma(_1392, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1390);
    float _1404 = fma(_1372, _1294, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1406 = floor(_877);
    float _1408 = _889 * _1398;
    float _1410 = _938 + (-0.5);
    float _1412 = -_889;
    float _1414 = _1412 + 1.0;
    bool _1416 = !_1062;
    int _1418 = _1416 ? 0 : 1;
    float _1420 = _1340 * _1408;
    float _1422 = _1320 * _1408;
    float _1424 = -_1410;
    float _1426 = -_903;
    float _1428 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1426);
    float _1430 = -_1378;
    float _1432 = _861 + _1430;
    float _1434 = fma(_1414, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1420);
    float _1436 = fma(_1414, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1422);
    float _1438 = _1318 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _1440 = _1318 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _1442 = fma(_1354, _1394, _1434);
    float _1444 = fma(_1368, _1394, _1436);
    float _1446 = float(_727);
    float _1448 = -_1406;
    float _1450 = _877 + _1448;
    float _1452 = fma(_1384, (*spvDescriptorSet0.vp_c12)._m0[6].x, _1438);
    float _1454 = _1318 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _1456 = float(_785);
    float _1458 = _1432 * _1446;
    float _1460 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1462 = float(_819);
    float _1464 = fma(_1384, (*spvDescriptorSet0.vp_c12)._m0[6].y, _1440);
    float _1466 = float(_857);
    float _1468 = _1450 * _1456;
    bool _1470 = _1462 >= _1446;
    bool _1472 = isnan(_1462);
    bool _1474 = _1470 || _1472;
    bool _1476 = isnan(_1446);
    bool _1478 = _1474 || _1476;
    float _1480 = float(_1478);
    float _1482 = _661 * _1446;
    float _1484 = _661 * _1456;
    bool _1486 = _1466 >= _1456;
    bool _1488 = isnan(_1466);
    bool _1490 = _1486 || _1488;
    bool _1492 = isnan(_1456);
    bool _1494 = _1490 || _1492;
    float _1496 = float(_1494);
    float _1498 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1460);
    float _1500 = fma(_1322, (*spvDescriptorSet0.vp_c12)._m0[8].x, _1452);
    float _1502 = _1172 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1504 = fma(_1384, (*spvDescriptorSet0.vp_c12)._m0[6].z, _1454);
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1508 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1510 = fma(_1322, (*spvDescriptorSet0.vp_c12)._m0[8].y, _1464);
    float _1512 = fma(_1322, (*spvDescriptorSet0.vp_c12)._m0[8].z, _1504);
    float _1514 = fma(_1400, _1386, _1442);
    float _1516 = fma(_1404, _1386, _1444);
    float _1518 = -_1506;
    float _1520 = fma(_1502, 2.0, _1518);
    float _1522 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1524 = abs(_1182);
    float _1526 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1508);
    int _1528 = abs(_1326);
    float _1530 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    int _1532 = abs(_1418);
    float _1534 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1536 = float(_1100);
    float _1538 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1514);
    float _1540 = in.m_70.x;
    float _1542 = in.m_70.y;
    float _1544 = in.m_70.z;
    float _1546 = float(_1528);
    float _1548 = fma(_1534, -2.0, _1522);
    float _1550 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1552 = float(_1222);
    float _1554 = _1500 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _1556 = float(_1532);
    float _1558 = _1546 * _1536;
    float _1560 = _1510 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _1562 = float(_1524);
    float _1564 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1516);
    float _1566 = _1556 * _1552;
    float _1568 = _1560 * _1530;
    float _1570 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1572 = _1512 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _1574 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1548);
    float _1576 = _1566 * (-2.0);
    float _1578 = _1562 * _1048;
    float _1580 = _1558 * (-2.0);
    float _1582 = _1554 * _1550;
    float _1584 = _1136 + (-0.5);
    float _1586 = fma(_1268, _1576, _1268);
    float _1588 = trunc(_1468);
    int _1590 = int(_1588);
    float _1592 = -_1584;
    float _1594 = -_1574;
    float _1596 = fma(_1592, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1594);
    float _1598 = fma(_1576, _1540, _1540);
    float _1600 = _1578 * (-2.0);
    float _1602 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1604 = _1572 * _1570;
    float _1606 = fma(_1338, _1600, _1338);
    float _1608 = fma(_1600, _1542, _1542);
    float _1610 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1612 = trunc(_1458);
    int _1614 = int(_1612);
    float _1616 = fma(_1580, _1544, _1544);
    float _1618 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1602);
    float _1620 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1610);
    float _1622 = _151 + (-0.5);
    float _1624 = _155 + (-0.5);
    float _1626 = _163 + (-0.5);
    int _1628 = ~_1128;
    int _1630 = _1628 + _1234;
    int _1632 = _1630 + 1;
    float _1634 = trunc(_1480);
    int _1636 = int(_1634);
    float _1638 = fma(_1624, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1608);
    float _1640 = fma(_1626, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1616);
    int _1642 = abs(_781);
    float _1644 = fma(_1622, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1598);
    int _1646 = abs(_1032);
    int _1648 = _727 * _1632;
    int _1650 = _1648 + _819;
    int _1652 = ~_1142;
    int _1654 = _1652 + _1238;
    int _1656 = _1654 + 1;
    float _1658 = trunc(_1496);
    int _1660 = int(_1658);
    int _1662 = _1614 * _1642;
    int _1664 = _1662 + _819;
    bool _1666 = !_1248;
    int _1668 = _1666 ? 0 : 1;
    int _1670 = _1590 * _1646;
    int _1672 = _1670 + _857;
    bool _1674 = _727 == 0;
    int _1676 = _785 * _1656;
    int _1678 = _1676 + _857;
    bool _1680 = !_1244;
    int _1682 = _1680 ? 0 : 1;
    float _1684 = fma(_1228, _1586, _1644);
    bool _1686 = _785 == 0;
    float _1688 = trunc(_1482);
    int _1690 = int(_1688);
    int _1692 = ~_1636;
    int _1694 = _1692 + 1;
    int _1696 = _1694 + 1;
    float _1698 = fma(_1228, _1606, _1638);
    bool _1700 = !_1674;
    int _1702 = _1700 ? _1650 : (-1);
    float _1704 = in.m_68.x;
    float _1706 = in.m_68.y;
    bool _1708 = !_1686;
    int _1710 = _1708 ? _1678 : (-1);
    float _1712 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1620);
    int _1714 = ~_1660;
    int _1716 = _1714 + 1;
    int _1718 = _1716 + 1;
    float _1720 = trunc(_1484);
    int _1722 = int(_1720);
    int _1724 = _727 + (-1);
    int _1726 = _1702 * _1696;
    int _1728 = abs(_735);
    int _1730 = _1710 * _1718;
    int _1732 = _785 + (-1);
    int _1734 = _1636 * _1724;
    int _1736 = _1734 + _1726;
    float _1738 = float(uint(_1672));
    float _1740 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1498);
    int _1742 = abs(_1668);
    int _1744 = _1660 * _1732;
    int _1746 = _1744 + _1730;
    float _1748 = as_type<float>(_869) * _1738;
    int _1750 = abs(_1682);
    float _1752 = _958 + 0.5;
    int _1754 = _1736 * _1728;
    bool _1756 = !_1252;
    int _1758 = _1756 ? 0 : 1;
    float _1760 = trunc(_1748);
    float _1762 = precise::max(_1760, 0.0);
    uint _1764 = uint(_1762);
    float _1766 = -_119;
    float _1768 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1520);
    int _1770 = _1746 * _1742;
    float _1772 = _1564 * _1706;
    int _1774 = _1690 * _954;
    int _1776 = _1774 + _1754;
    int _1778 = abs(_978);
    int _1780 = _1722 * _1750;
    int _1782 = _1780 + _1770;
    float _1784 = fma(_1752, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1768);
    int _1786 = _1664 * _970;
    int _1788 = _1786 + _1776;
    int _1790 = abs(_1758);
    float _1792 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1526);
    bool _1794 = !_1256;
    int _1796 = _1794 ? 0 : 1;
    int _1798 = _1614 * _1778;
    int _1800 = _1798 + _1788;
    float _1802 = _1698 * 0.15915493667125701904296875;
    int _1804 = abs(_1796);
    float _1806 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1618);
    float _1808 = float(uint(_1664));
    int _1810 = _1672 * _1790;
    int _1812 = _1810 + _1782;
    float _1814 = -_1806;
    float _1816 = _1814 + 1.0;
    float _1818 = -_1792;
    float _1820 = _1818 + 1.0;
    float _1822 = as_type<float>(_841) * _1808;
    float _1824 = fma(_1296, _1580, _1296);
    int _1826 = _1590 * _1804;
    int _1828 = _1826 + _1812;
    float _1830 = float(uint(_1800));
    float _1832 = -_1712;
    float _1834 = _1832 + 1.0;
    float _1836 = -_1740;
    float _1838 = _1836 + 1.0;
    float _1840 = -_1816;
    float _1842 = fma(_807, _1840, _1402);
    float _1844 = fma(_1136, _1820, _1596);
    float _1846 = as_type<float>(_841) * _1830;
    float _1848 = -_1838;
    float _1850 = fma(_958, _1848, _1784);
    int _1852 = ~_727;
    int _1854 = _1852 + 1;
    float _1856 = fma(_938, _1834, _1428);
    float _1858 = trunc(_1846);
    float _1860 = precise::max(_1858, 0.0);
    uint _1862 = uint(_1860);
    float _1864 = float(uint(_1828));
    float _1866 = fma(_1228, _1824, _1640);
    float _1868 = fma(_1568, 0.5, 0.5);
    out.m_72.x = _1842;
    out.m_72.y = _1856;
    out.m_72.z = _1850;
    out.m_72.w = _1844;
    float _1870 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _397);
    float _1872 = fma(_1582, 0.5, 0.5);
    float _1874 = _1772 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1876 = trunc(_1822);
    float _1878 = precise::max(_1876, 0.0);
    uint _1880 = uint(_1878);
    float _1882 = as_type<float>(_869) * _1864;
    float _1884 = _1684 * 0.15915493667125701904296875;
    float _1886 = _1866 * 0.15915493667125701904296875;
    float _1888 = _1874 * _1870;
    int _1890 = ~_727;
    int _1892 = _1890 + 1;
    float _1894 = _1538 * _1704;
    int _1896 = ~_785;
    int _1898 = _1896 + 1;
    int _1900 = _1854 * int(_1862);
    int _1902 = _1900 + _1800;
    float _1904 = trunc(_1882);
    float _1906 = precise::max(_1904, 0.0);
    uint _1908 = uint(_1906);
    int _1910 = ~_785;
    int _1912 = _1910 + 1;
    float _1914 = fma(_1604, 0.5, 0.5);
    float _1916 = _397 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1918 = float(uint(_1902));
    int _1920 = _1892 * int(_1880);
    int _1922 = _1920 + _1664;
    float _1924 = floor(_1868);
    int _1926 = _1898 * int(_1764);
    int _1928 = _1926 + _1672;
    float _1930 = as_type<float>(_841) * _1918;
    int _1932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1934 = _1932 != 0;
    float _1936 = float(uint(_1922));
    float _1938 = float(uint(_1928));
    float _1940 = floor(_1872);
    int _1942 = _1912 * int(_1908);
    int _1944 = _1942 + _1828;
    float _1946 = _1884 * 6.283185482025146484375;
    float _1948 = sin(_1946);
    float _1950 = -_1924;
    float _1952 = _1868 + _1950;
    float _1954 = as_type<float>(_869) * _1938;
    float _1956 = fma(_1952, 2.0, -1.0);
    float _1958 = _1884 * 6.283185482025146484375;
    float _1960 = cos(_1958);
    float _1962 = -_1940;
    float _1964 = _1872 + _1962;
    float _1966 = _1802 * 6.283185482025146484375;
    float _1968 = sin(_1966);
    float _1970 = _1802 * 6.283185482025146484375;
    float _1972 = cos(_1970);
    float _1974 = _1886 * 6.283185482025146484375;
    float _1976 = cos(_1974);
    float _1978 = _1948 * _1968;
    float _1980 = _1960 * _1968;
    float _1982 = trunc(_1930);
    float _1984 = precise::max(_1982, 0.0);
    uint _1986 = uint(_1984);
    float _1988 = _1960 * _1972;
    float _1990 = _1886 * 6.283185482025146484375;
    float _1992 = sin(_1990);
    float _1994 = _1948 * _1976;
    float _1996 = _1960 * _1976;
    float _1998 = _1968 * _1976;
    int _2000 = int(_1862) + int(_1986);
    float _2002 = as_type<float>(_841) * _1936;
    float _2004 = _1948 * _1972;
    float _2006 = _1972 * _1976;
    float _2008 = float(uint(_1944));
    float _2010 = fma(_1964, 2.0, -1.0);
    int _2012 = ~_727;
    int _2014 = _2012 + 1;
    float _2016 = _1956 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _2018 = -_1980;
    float _2020 = fma(_1992, _2004, _2018);
    float _2022 = as_type<float>(_869) * _2008;
    float _2024 = -_2004;
    float _2026 = fma(_1992, _1980, _2024);
    int _2028 = _2014 * _2000;
    int _2030 = _2028 + _1800;
    float _2032 = trunc(_2002);
    float _2034 = precise::max(_2032, 0.0);
    uint _2036 = uint(_2034);
    float _2038 = _2010 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _2040 = _2016 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _2042 = fma(_1992, _1988, _1978);
    bool _2044 = uint(_2030) >= uint(_727);
    float _2046 = fma(_1992, _1978, _1988);
    float _2048 = fma(_2038, (*spvDescriptorSet0.vp_c12)._m0[2].x, _2040);
    float _2050 = _1996 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2052 = trunc(_2022);
    float _2054 = precise::max(_2052, 0.0);
    uint _2056 = uint(_2054);
    float _2058 = _2016 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _2060 = _2016 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _2062 = -_1992;
    float _2064 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2050);
    float _2066 = fma(_2038, (*spvDescriptorSet0.vp_c12)._m0[2].y, _2058);
    bool _2068 = !_2044;
    int _2070 = _2068 ? 0 : (-1);
    float _2072 = fma(_2038, (*spvDescriptorSet0.vp_c12)._m0[2].z, _2060);
    float _2074 = _1894 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2076 = trunc(_1954);
    float _2078 = precise::max(_2076, 0.0);
    uint _2080 = uint(_2078);
    int _2082 = ~_2000;
    int _2084 = _2082 + _2070;
    int _2086 = _2084 + 1;
    int _2088 = int(_1880) + int(_2036);
    float _2090 = _1996 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2092 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _387);
    int _2094 = _727 * _2086;
    int _2096 = _2094 + _1800;
    int _2098 = int(_1908) + int(_2056);
    float _2100 = _1996 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2102 = ~_785;
    int _2104 = _2102 + 1;
    float _2106 = floor(_1914);
    bool _2108 = !_1674;
    int _2110 = _2108 ? _2096 : (-1);
    float _2112 = -_1992;
    float _2114 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2100);
    float _2116 = -_1992;
    float _2118 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2090);
    int _2120 = _2104 * _2098;
    int _2122 = _2120 + _1828;
    int _2124 = _2110 & 3;
    bool _2126 = _2124 != 0;
    float _2128 = _2074 * _2092;
    float _2130 = -_1888;
    float _2132 = _1992 * _2130;
    int _2134 = int(_1764) + int(_2080);
    float _2136 = _2042 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2138 = uint(_2122) >= uint(_785);
    float _2140 = _1996 * _1888;
    int _2142 = _2126 ? 0 : 1;
    float _2144 = fma(_2006, _2128, _2132);
    int _2146 = _2110 & 3;
    bool _2148 = _2146 != 0;
    float _2150 = _1994 * _1888;
    bool _2152 = !_2138;
    int _2154 = _2152 ? 0 : (-1);
    float _2156 = fma(_2042, _2128, _2140);
    bool _2158 = uint(_2146) > 1u;
    float _2160 = _2042 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2162 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2064);
    float _2164 = _2042 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2166 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2168 = fma(_2020, _2128, _2150);
    float _2170 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2118);
    float _2172 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2136);
    float _2174 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2114);
    float _2176 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2160);
    float _2178 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2164);
    float _2180 = fma(_1998, _2166, _2144);
    float _2182 = _2026 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2184 = _2026 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2186 = _2026 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2188 = ~_2098;
    int _2190 = _2188 + _2154;
    int _2192 = _2190 + 1;
    float _2194 = -_2106;
    float _2196 = _1914 + _2194;
    int _2198 = ~_2142;
    int _2200 = _2198 + 1;
    int _2202 = _2200 + 1;
    float _2204 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2182);
    int _2206 = _2202;
    float _2208 = _2010;
    float _2210 = _1956;
    float _2212 = _2010;
    float _2214 = _1956;
    if (!_2158)
    {
        int _2216 = ~_2142;
        int _2218 = _2216 + 1;
        _2206 = _2218;
    }
    int _2220 = _2206;
    float _2222 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2184);
    float _2224 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2186);
    bool _2226 = uint(_2146) >= 2u;
    int _2228 = _785 * _2192;
    int _2230 = _2228 + _1828;
    int _2232 = ~_727;
    int _2234 = _2232 + 1;
    float _2236 = fma(_2026, _2166, _2156);
    int _2238 = _2226 ? 0 : 1;
    float _2240 = fma(_2046, _2166, _2168);
    float _2242 = _387 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2244 = _2146 != 3;
    float _2246 = _1916 * _2174;
    int _2248 = _2110 >> 31;
    int _2250 = _2234 * _2088;
    int _2252 = _2250 + _1664;
    bool _2254 = !_1686;
    int _2256 = _2254 ? _2230 : (-1);
    float _2258 = fma(_2046, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2204);
    int _2260 = _2248 & 3;
    float _2262 = _1916 * _2162;
    int _2264 = _2256 >> 31;
    float _2266 = fma(_2196, 2.0, -1.0);
    int _2268 = ~_785;
    int _2270 = _2268 + 1;
    int _2272 = _2110 + _2260;
    int _2274 = _2264 & 3;
    int _2276 = ~_2238;
    int _2278 = _2276 + 1;
    int _2280 = _2278 + 1;
    int _2282 = _2280;
    if (_2244)
    {
        int _2284 = ~_2238;
        int _2286 = _2284 + 1;
        _2282 = _2286;
    }
    int _2288 = _2282;
    int _2290 = _2256 + _2274;
    int _2292 = _2272 >> 2;
    bool _2294 = uint(_2252) >= uint(_727);
    int _2296 = _2270 * _2134;
    int _2298 = _2296 + _1672;
    int _2300 = _2290 >> 2;
    float _2302 = fma(_2020, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2172);
    int _2304 = _2292 << 4;
    int _2306 = _2304 + 368;
    float _2308 = fma(_2020, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2176);
    bool _2310 = !_2294;
    int _2312 = _2310 ? 0 : (-1);
    float _2314 = fma(_2020, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2178);
    bool _2316 = uint(_2298) >= uint(_785);
    float _2318 = fma(_2046, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2222);
    int _2320 = _2300 << 4;
    int _2322 = _2320 + 512;
    uint _2324 = uint(int(uint(_2306) >> uint(2)));
    uint _2326 = uint(int(uint(int(_2324)) >> uint(2)));
    int _2328 = int(_2324) & 3;
    float _2330 = (*spvDescriptorSet0.vp_c9)._m0[int(_2326)][_2328];
    int _2332 = int(_2324) + 1;
    uint _2334 = uint(int(uint(_2332) >> uint(2)));
    int _2336 = _2332 & 3;
    float _2338 = (*spvDescriptorSet0.vp_c9)._m0[int(_2334)][_2336];
    float _2340 = fma(_2242, _2308, _2246);
    int _2342 = ~_2088;
    int _2344 = _2342 + _2312;
    int _2346 = _2344 + 1;
    float _2348 = fma(_2046, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2224);
    bool _2350 = !_2148;
    int _2352 = _2350 ? 0 : 1;
    out.m_74.x = _2308;
    out.m_74.y = _2302;
    out.m_74.z = _2314;
    int _2354 = _2256 & 3;
    bool _2356 = _2354 != 0;
    float _2358 = fma(_2242, _2302, _2262);
    uint _2360 = uint(int(uint(_2322) >> uint(2)));
    uint _2362 = uint(int(uint(int(_2360)) >> uint(2)));
    int _2364 = int(_2360) & 3;
    float _2366 = (*spvDescriptorSet0.vp_c9)._m0[int(_2362)][_2364];
    int _2368 = int(_2360) + 1;
    uint _2370 = uint(int(uint(_2368) >> uint(2)));
    int _2372 = _2368 & 3;
    float _2374 = (*spvDescriptorSet0.vp_c9)._m0[int(_2370)][_2372];
    bool _2376 = !_2316;
    int _2378 = _2376 ? 0 : (-1);
    int _2380 = _727 * _2346;
    int _2382 = _2380 + _1664;
    bool _2384 = uint(_2354) > 1u;
    float _2386 = _1916 * _2170;
    int _2388 = _2256 & 3;
    bool _2390 = _2388 != 0;
    int _2392 = ~_2134;
    int _2394 = _2392 + _2378;
    int _2396 = _2394 + 1;
    int _2398 = _2306 + 8;
    uint _2400 = uint(int(uint(_2398) >> uint(2)));
    uint _2402 = uint(int(uint(int(_2400)) >> uint(2)));
    int _2404 = int(_2400) & 3;
    float _2406 = (*spvDescriptorSet0.vp_c9)._m0[int(_2402)][_2404];
    int _2408 = int(_2400) + 1;
    uint _2410 = uint(int(uint(_2408) >> uint(2)));
    int _2412 = _2408 & 3;
    float _2414 = (*spvDescriptorSet0.vp_c9)._m0[int(_2410)][_2412];
    int _2416 = _2390 ? 0 : 1;
    float _2418 = fma(_2242, _2314, _2386);
    bool _2420 = _2146 != 3;
    int _2422 = _785 * _2396;
    int _2424 = _2422 + _1672;
    int _2426 = ~_2416;
    int _2428 = _2426 + 1;
    int _2430 = _2428 + 1;
    float _2432 = _2348 + _2418;
    bool _2434 = !_2356;
    int _2436 = _2434 ? 0 : 1;
    int _2438 = _2322 + 8;
    uint _2440 = uint(int(uint(_2438) >> uint(2)));
    uint _2442 = uint(int(uint(int(_2440)) >> uint(2)));
    int _2444 = int(_2440) & 3;
    float _2446 = (*spvDescriptorSet0.vp_c9)._m0[int(_2442)][_2444];
    int _2448 = int(_2440) + 1;
    uint _2450 = uint(int(uint(_2448) >> uint(2)));
    int _2452 = _2448 & 3;
    float _2454 = (*spvDescriptorSet0.vp_c9)._m0[int(_2450)][_2452];
    int _2456 = _2430;
    if (!_2384)
    {
        int _2458 = ~_2416;
        int _2460 = _2458 + 1;
        _2456 = _2460;
    }
    int _2462 = _2456;
    int _2464 = abs(_2220);
    int _2466 = abs(_2462);
    bool _2468 = _2354 != 3;
    int _2470 = abs(_2352);
    int _2472 = ~_2464;
    int _2474 = _2472 + 1;
    int _2476 = _2474 + 1;
    bool _2478 = uint(_2354) >= 2u;
    int _2480 = abs(_2436);
    int _2482 = ~_2466;
    int _2484 = _2482 + 1;
    int _2486 = _2484 + 1;
    int _2488 = _2476 * as_type<int>(_2338);
    int _2490 = _2478 ? 0 : 1;
    int _2492 = abs(_2288);
    int _2494 = ~_2470;
    int _2496 = _2494 + 1;
    int _2498 = _2496 + 1;
    int _2500 = _2486 * as_type<int>(_2374);
    int _2502 = ~_2490;
    int _2504 = _2502 + 1;
    int _2506 = _2504 + 1;
    int _2508 = _2498 * as_type<int>(_2330);
    int _2510 = _2508 + _2488;
    int _2512 = ~_2492;
    int _2514 = _2512 + 1;
    int _2516 = _2514 + 1;
    float _2518 = fma(_1916, _1916, 1.0);
    int _2520 = _2506;
    if (_2468)
    {
        int _2522 = ~_2490;
        int _2524 = _2522 + 1;
        _2520 = _2524;
    }
    int _2526 = _2520;
    bool _2528 = !_1934;
    int _2530 = _2528 ? 0 : 1;
    int _2532 = _2516 * as_type<int>(_2406);
    int _2534 = _2532 + _2510;
    int _2536 = ~_2480;
    int _2538 = _2536 + 1;
    int _2540 = _2538 + 1;
    float _2542 = rsqrt(_2518);
    int _2544 = abs(_2526);
    bool _2546 = _2354 != 3;
    int _2548 = _2540 * as_type<int>(_2366);
    int _2550 = _2548 + _2500;
    bool _2552 = !_2420;
    int _2554 = _2552 ? 0 : (-1);
    bool _2556 = !_1204;
    int _2558 = _2556 ? 0 : 1;
    int _2560 = abs(_2530);
    bool _2562 = !_2546;
    int _2564 = _2562 ? 0 : (-1);
    int _2566 = abs(_2554);
    int _2568 = abs(_2558);
    int _2570 = ~_2544;
    int _2572 = _2570 + 1;
    int _2574 = _2572 + 1;
    int _2576 = abs(_2564);
    int _2578 = ~_2566;
    int _2580 = _2578 + 1;
    int _2582 = _2580 + 1;
    int _2584 = _2574 * as_type<int>(_2446);
    int _2586 = _2584 + _2550;
    int _2588 = ~_2576;
    int _2590 = _2588 + 1;
    int _2592 = _2590 + 1;
    int _2594 = ~_2560;
    int _2596 = _2594 + 1;
    int _2598 = _2596 + 1;
    int _2600 = _2582 * as_type<int>(_2414);
    int _2602 = _2600 + _2534;
    int _2604 = ~_2568;
    int _2606 = _2604 + 1;
    int _2608 = _2606 + 1;
    int _2610 = _2592 * as_type<int>(_2454);
    int _2612 = _2610 + _2586;
    bool _2614 = !_1686;
    int _2616 = _2614 ? _2424 : (-1);
    int _2618 = _2602 * _2598;
    float _2620 = _1916 * _2542;
    int _2622 = _2612 * _2608;
    bool _2624 = !_1674;
    int _2626 = _2624 ? _2382 : (-1);
    float _2628 = _2258 + _2340;
    float _2630 = -_2258;
    float _2632 = _2620 * _2630;
    int _2634 = _2616 * _2568;
    int _2636 = _2634 + _2622;
    float _2638 = -_2348;
    float _2640 = _2620 * _2638;
    int _2642 = _2626 * _2560;
    int _2644 = _2642 + _2618;
    float _2646 = fma(_2542, _2174, _2632);
    float _2648 = _2318 + _2358;
    float _2650 = -_2318;
    float _2652 = _2620 * _2650;
    float _2654 = fma(_2542, _2170, _2640);
    float _2656 = _2236 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2658 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _2660 = isnan(1.0);
    bool _2662 = _2658 || _2660;
    bool _2664 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _2666 = _2662 || _2664;
    out.m_76.x = _2628;
    out.m_76.y = _2648;
    out.m_76.z = _2432;
    float _2668 = fma(_2542, _2162, _2652);
    float _2670 = _2236 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2672 = _2236 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2674 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2656);
    float _2676 = float(_2644);
    float _2678 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2670);
    float _2680 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2672);
    float _2682 = _2266 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _2684 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2674);
    float _2686 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2678);
    float _2688 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2680);
    float _2690 = fma(_2682, (*spvDescriptorSet0.vp_c12)._m0[4].x, _2048);
    float _2692 = fma(_2682, (*spvDescriptorSet0.vp_c12)._m0[4].y, _2066);
    float _2694 = fma(_2682, (*spvDescriptorSet0.vp_c12)._m0[4].z, _2072);
    float _2696 = float(_2636);
    out.m_78.x = _2646;
    out.m_78.y = _2668;
    out.m_78.z = _2654;
    float _2698 = _2690 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _2700 = _2692 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _2702 = _2694 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _2704 = _2686 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2706 = _2684 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    out.m_80.x = _2676;
    out.m_80.y = _2696;
    float _2708 = _2706 + _2700;
    float _2710 = _2688 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2712 = _2704 + _2698;
    float _2714 = _2710 + _2702;
    float _2716 = _2704;
    float _2718 = _2710;
    float _2720 = _2654;
    float _2722 = _2704;
    float _2724 = _2654;
    float _2726 = _2710;
    float _2728 = _2646;
    float _2730 = _2694;
    float _2740;
    float _2742;
    float _2744;
    float _2746;
    if (!_2666)
    {
        bool _2732 = _2700 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _2734 = !_2732;
        _2736 = _2734;
        if (!_2736)
        {
            float _2738 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _2740 = _2738;
            _2742 = 0.0;
            _2744 = 0.0;
            _2746 = 0.0;
            _2748 = true;
        }
    }
    if ((!_2748) || _2736)
    {
        bool _2786;
        if (!_2736)
        {
            bool _2750 = _2700 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _2752 = isnan(_2700);
            bool _2754 = _2750 || _2752;
            bool _2756 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _2758 = _2754 || _2756;
            bool _2760 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _2762 = !_2758;
            bool _2764 = _2760 && _2762;
            bool _2766 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            float _2768 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_2764)
            {
                _2716 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _2770 = _2716;
            float _2772 = _2770;
            if (_2764)
            {
                _2718 = 0.0;
                _2768 = 0.0;
            }
            float _2774 = _2718;
            float _2776 = _2768;
            _2726 = _2774;
            _2728 = _2776;
            _2742 = _2774;
            _2746 = _2776;
            if (_2764)
            {
                _2720 = 0.0;
            }
            float _2778 = _2720;
            _2724 = _2778;
            _2744 = _2778;
            if (_2764)
            {
                float _2780 = _2770 * 5.0;
                _2772 = _2780;
            }
            float _2782 = _2772;
            bool _2784 = !_2758;
            _2786 = _2784 && _2766;
            _2722 = _2782;
            _2740 = _2782;
        }
        if ((!_2786) || _2736)
        {
            _2736 = false;
            float _2788 = _2722;
            float _2790 = _2724;
            float _2792 = _2726;
            float _2794 = _2728;
            bool _2796 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _2798 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _2800 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _2802 = _2788;
            float _2804 = _2790;
            float _2806 = _2792;
            float _2808 = _2794;
            if (_2796)
            {
                float _2810 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _2802 = _2810;
            }
            float _2812 = _2802;
            if (_2796)
            {
                float _2814 = abs(_2010);
                float _2816 = -_2814;
                float _2818 = _2816 + 1.0;
                _2208 = _2818;
            }
            float _2820 = _2208;
            _2212 = _2820;
            if (_2798)
            {
                float _2822 = abs(_1956);
                float _2824 = -_2822;
                float _2826 = _2824 + 1.0;
                _2210 = _2826;
            }
            float _2828 = _2210;
            _2214 = _2828;
            if (!_2796)
            {
                _2804 = 1.0;
            }
            float _2830 = _2804;
            float _2832 = _2830;
            if (!_2798)
            {
                _2806 = 1.0;
            }
            float _2834 = _2806;
            float _2836 = _2834;
            if (!_2800)
            {
                _2808 = 1.0;
            }
            float _2838 = _2808;
            float _2840 = _2676;
            float _2842 = _2838;
            if (_2798)
            {
                float _2844 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _2840 = _2844;
            }
            float _2846 = _2840;
            float _2848 = _2706;
            if (_2800)
            {
                float _2850 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _2848 = _2850;
            }
            float _2852 = _2848;
            float _2854 = _2812;
            if (_2796)
            {
                float _2856 = _2820 * _2812;
                float _2858 = precise::clamp(_2856, 0.0, 1.0);
                _2832 = _2858;
            }
            float _2860 = _2832;
            if (_2800)
            {
                float _2862 = abs(_2266);
                float _2864 = -_2862;
                float _2866 = _2864 + 1.0;
                _2854 = _2866;
            }
            float _2868 = _2854;
            if (_2798)
            {
                float _2870 = _2828 * _2846;
                float _2872 = precise::clamp(_2870, 0.0, 1.0);
                _2836 = _2872;
            }
            float _2874 = _2836;
            if (_2800)
            {
                float _2876 = _2868 * _2852;
                float _2878 = precise::clamp(_2876, 0.0, 1.0);
                _2842 = _2878;
            }
            float _2880 = _2842;
            float _2882 = _2860 * _2874;
            float _2884 = _2882 * _2880;
            _2740 = _2714;
            _2742 = _2712;
            _2744 = _2708;
            _2746 = _2884;
        }
    }
    _2748 = false;
    float _2886 = _2740;
    float _2888 = _2742;
    float _2890 = _2744;
    float _2892 = _2212;
    float _2894 = _2214;
    float _2896 = _2746;
    float _2898 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2900 = _2886 + _2898;
    float _2902 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2904 = _2888 + _2902;
    float _2906 = _2900 * _2900;
    float _2908 = fma(_2904, _2904, _2906);
    float _2910 = sqrt(_2908);
    bool _2912 = _2910 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _2914 = !_2912;
    float _2916 = _2890;
    float _2918 = _2888;
    float _2920 = _2886;
    float _2922 = _2892;
    float _2924 = _2904;
    float _2926 = _2894;
    if (!_2914)
    {
        float _2928 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2930 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2932 = _2910 + _2930;
        float _2934 = rsqrt(_2908);
        float _2936 = _2932 * _2928;
        float _2938 = _2890 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2940 = _2936 * 0.15915493667125701904296875;
        float _2942 = _2940 * 6.283185482025146484375;
        float _2944 = cos(_2942);
        float _2946 = _2940 * 6.283185482025146484375;
        float _2948 = sin(_2946);
        float _2950 = _2944 + (-1.0);
        float _2952 = fma(_2948, _2938, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2954 = _2950 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2956 = _2934 * _2952;
        float _2958 = fma(_2944, _2890, _2954);
        float _2960 = fma(_2904, _2956, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2962 = fma(_2900, _2956, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2916 = _2958;
        _2918 = _2960;
        _2920 = _2962;
    }
    float _2964 = _2916;
    float _2966 = _2918;
    float _2968 = _2920;
    float _2970 = -_2700;
    float _2972 = _2970 + _2964;
    float _2974 = -_2698;
    float _2976 = _2974 + _2966;
    float _2978 = -_2702;
    float _2980 = _2978 + _2968;
    float _2982 = _2972 * _2972;
    float _2984 = fma(_2976, _2976, _2982);
    float _2986 = fma(_2980, _2980, _2984);
    float _2988 = sqrt(_2986);
    bool _2990 = _2988 > 0.0;
    bool _2992 = !_2990;
    float _2994 = _2988;
    float _2996 = _2966;
    float _2998 = _2968;
    float _3000 = _2964;
    if (!_2992)
    {
        bool _3002 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _3004 = _2690;
        if (_3002)
        {
            float _3006 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _3004 = _3006;
        }
        float _3008 = _3004;
        if (_3002)
        {
            _2922 = _655;
        }
        float _3010 = _2922;
        float _3012 = _3010;
        if (_3002)
        {
            _2924 = _657;
        }
        float _3014 = _2924;
        float _3016 = _3014;
        if (_3002)
        {
            _2994 = _659;
        }
        float _3018 = _2994;
        float _3020 = _3008;
        float _3022 = _3018;
        if (_3002)
        {
            float _3024 = _655 * _3008;
            _2730 = _3024;
        }
        float _3026 = _2730;
        float _3028 = _3026;
        if (_3002)
        {
            float _3030 = _657 * _3008;
            _2926 = _3030;
        }
        float _3032 = _2926;
        float _3034 = _3032;
        if (_3002)
        {
            float _3036 = _659 * _3008;
            _3020 = _3036;
        }
        float _3038 = _3020;
        float _3040 = _3038;
        if (!_3002)
        {
            bool _3042 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _3044 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _3046 = _3042 || _3044;
            bool _3048 = isnan(1.0);
            bool _3050 = _3046 || _3048;
            float _3052 = _119 + 1.0;
            if (!_3050)
            {
                float _3054 = _3052 * _3052;
                float _3056 = _3054 * 0.5;
                _129 = _3056;
            }
            float _3058 = _129;
            float _3060 = _3058;
            if (!_3050)
            {
                float _3062 = _3058 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3060 = _3062;
            }
            float _3064 = _3060;
            bool _3066 = !_3050;
            float _3068 = _3064;
            if (!_3066)
            {
                float _3070 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3072 = log2(_3070);
                float _3074 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3076 = 1.0 + _3074;
                float _3078 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3080 = _3072 * _3052;
                float _3082 = 1.0 / _3076;
                float _3084 = _3078 * 0.693147182464599609375;
                float _3086 = exp2(_3080);
                float _3088 = 1.0 / _3084;
                float _3090 = _3086 + (-1.0);
                float _3092 = -_3090;
                float _3094 = fma(_3092, _3088, _3052);
                float _3096 = _3094 * _3082;
                float _3098 = _3096 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3068 = _3098;
            }
            float _3100 = _3068;
            float _3102 = _3100 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _3104 = _3100 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _3106 = _3102 * _379;
            float _3108 = _3100 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _3110 = _3102 * _357;
            float _3112 = _3102 * _411;
            float _3114 = fma(_3104, _371, _3106);
            float _3116 = _3100;
            if (!_3050)
            {
                _3116 = _3052;
            }
            float _3118 = _3116;
            float _3120 = fma(_3104, _353, _3110);
            float _3122 = fma(_3108, _383, _3114);
            bool _3124 = !_3050;
            float _3126 = _3118;
            if (!_3124)
            {
                float _3128 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3130 = log2(_3128);
                float _3132 = _3130 * _3052;
                float _3134 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3136 = 1.0 + _3134;
                float _3138 = exp2(_3132);
                float _3140 = 1.0 / _3136;
                float _3142 = -_3138;
                float _3144 = _3142 + 1.0;
                float _3146 = _3144 * _3140;
                _3126 = _3146;
            }
            float _3148 = _3126;
            float _3150 = fma(_3104, _407, _3112);
            float _3152 = fma(_3108, _361, _3120);
            float _3154 = fma(_3148, _267, _3122);
            float _3156 = fma(_3108, _415, _3150);
            float _3158 = fma(_3148, _265, _3152);
            float _3160 = -_615;
            float _3162 = _3160 + _3154;
            float _3164 = fma(_3148, _269, _3156);
            float _3166 = -_621;
            float _3168 = _3166 + _3158;
            float _3170 = _3162 * _179;
            float _3172 = _3162 * _173;
            float _3174 = _3162 * _185;
            float _3176 = -_627;
            float _3178 = _3176 + _3164;
            float _3180 = fma(_3168, _177, _3170);
            float _3182 = fma(_3168, _171, _3172);
            float _3184 = fma(_3168, _183, _3174);
            float _3186 = fma(_3178, _181, _3180);
            float _3188 = fma(_3178, _175, _3182);
            float _3190 = fma(_3178, _187, _3184);
            _3016 = _3188;
            _3012 = _3186;
            _3022 = _3190;
            _3028 = _3186;
            _3034 = _3188;
            _3040 = _3190;
        }
        float _3192 = _3016;
        float _3194 = _3012;
        float _3196 = _3022;
        float _3198 = _3028;
        float _3200 = _3034;
        float _3202 = _3040;
        float _3204 = _3192 * _3192;
        float _3206 = rsqrt(_2986);
        float _3208 = fma(_3194, _3194, _3204);
        float _3210 = fma(_3196, _3196, _3208);
        float _3212 = sqrt(_3210);
        float _3214 = _2976 * _3206;
        float _3216 = _2972 * _3206;
        float _3218 = _2980 * _3206;
        bool _3220 = _3212 > 0.0;
        bool _3222 = !_3220;
        _401 = _3212;
        if (!_3222)
        {
            float _3224 = rsqrt(_3210);
            float _3226 = _3224 * _3192;
            float _3228 = _3224 * _3194;
            float _3230 = _3224 * _3196;
            float _3232 = _3216 * _3226;
            float _3234 = fma(_3214, _3228, _3232);
            float _3236 = fma(_3218, _3230, _3234);
            float _3238 = _3236 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3240 = fma(_3198, _3238, _2966);
            float _3242 = fma(_3200, _3238, _2964);
            float _3244 = fma(_3202, _3238, _2968);
            _2996 = _3240;
            _2998 = _3244;
            _3000 = _3242;
            _401 = _3238;
            _403 = _3226;
        }
    }
    float _3246 = _2996;
    float _3248 = _2998;
    float _3250 = _3000;
    float _3252 = _401;
    float _3254 = _403;
    float _3256 = _2700 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _3258 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3260 = isnan(0.5);
    bool _3262 = _3258 || _3260;
    bool _3264 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3266 = _3262 || _3264;
    bool _3268 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3270 = isnan(0.5);
    bool _3272 = _3268 || _3270;
    bool _3274 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3276 = _3272 || _3274;
    float _3278 = fma(_2698, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3256);
    float _3280 = _2700 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3282 = fma(_2702, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3278);
    float _3284 = fma(_2698, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3280);
    float _3286 = _3282 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3288 = fma(_2702, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3284);
    float _3290 = _3252;
    float _3292 = _3254;
    float _3294 = _3246;
    float _3296 = _3282;
    if (_3266)
    {
        _3290 = _3246;
    }
    float _3298 = _3290;
    float _3300 = 1.0 / _3286;
    float _3302 = _3288 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3304 = _3302;
    float _3306 = _3298;
    if (_3266)
    {
        _3292 = _3248;
    }
    float _3308 = _3292;
    float _3310 = _3302 + _3286;
    float _3312 = _3308;
    if (_3266)
    {
        _3304 = _3250;
    }
    float _3314 = _3304;
    float _3316 = _3314;
    if (!_3266)
    {
        float _3318 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3320 = _2700 + _3318;
        float _3322 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3324 = _2698 + _3322;
        float _3326 = -_2698;
        float _3328 = _3326 + _3246;
        float _3330 = -_2700;
        float _3332 = _3330 + _3250;
        float _3334 = _3320 * _3320;
        float _3336 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3338 = _2702 + _3336;
        float _3340 = -_2702;
        float _3342 = _3340 + _3248;
        float _3344 = fma(_3324, _3324, _3334);
        float _3346 = fma(_3338, _3338, _3344);
        float _3348 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3350 = sqrt(_3346);
        float _3352 = precise::min(_3350, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3354 = _3352 * _3348;
        float _3356 = fma(_3328, _3354, _2698);
        float _3358 = fma(_3332, _3354, _2700);
        float _3360 = fma(_3342, _3354, _2702);
        _3316 = _3358;
        _3306 = _3356;
        _3312 = _3360;
        _3294 = _3328;
        _3296 = _3350;
    }
    float _3362 = _3316;
    float _3364 = _3306;
    float _3366 = _3312;
    float _3368 = _3294;
    float _3370 = _3296;
    float _3372 = _3370;
    float _3374 = _3368;
    if (_3276)
    {
        _3372 = 1.0;
    }
    float _3376 = _3372;
    float _3378 = _3310 * _3300;
    float _3380 = _3378 * 0.5;
    float _3382 = _3376;
    if (!_3276)
    {
        float _3384 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3386 = fma(_3380, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3384);
        float _3388 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3390 = _3388 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _3392 = 1.0 / _3386;
        float _3394 = 1.0 / _3390;
        float _3396 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3398 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3400 = fma(_3392, _3396, _3398);
        float _3402 = _3400 * _3394;
        float _3404 = precise::clamp(_3402, 0.0, 1.0);
        _3382 = _3404;
    }
    float _3406 = _3382;
    float _3408 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3410 = _3362 + _3408;
    float _3412 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3414 = _3364 + _3412;
    float _3416 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3418 = _3366 + _3416;
    float _3420 = _3410 * _3410;
    float _3422 = fma(_3414, _3414, _3420);
    float _3424 = fma(_3418, _3418, _3422);
    float _3426 = rsqrt(_3424);
    float _3428 = sqrt(_3424);
    float _3430 = _3426 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3432 = _3414 * _3430;
    float _3434 = _3418 * _3430;
    float _3436 = _3432 * _3432;
    float _3438 = _3434 * _3434;
    float _3440 = _3436 + _3438;
    float _3442 = sqrt(_3440);
    bool _3444 = _3442 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3446 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3448 = _3442 + _3446;
    float _3450 = _3426;
    float _3452 = _3448;
    float _3454 = _3410;
    if (_3444)
    {
        float _3456 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3450 = _3456;
    }
    float _3458 = _3450;
    float _3460 = _3458;
    if (_3444)
    {
        float _3462 = _3448 * _3458;
        _3452 = _3462;
    }
    float _3464 = _3452;
    if (_3444)
    {
        float _3466 = rsqrt(_3440);
        _3460 = _3466;
    }
    float _3468 = _3460;
    float _3470 = _3468;
    if (_3444)
    {
        float _3472 = _3464 * 0.15915493667125701904296875;
        _231 = _3472;
    }
    float _3474 = _231;
    float _3476 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3478 = _3418;
    float _3480 = _3474;
    if (_3444)
    {
        float _3482 = _3474 * 6.283185482025146484375;
        float _3484 = sin(_3482);
        _3478 = _3484;
    }
    float _3486 = _3478;
    float _3488 = precise::max(0.0, _3476);
    float _3490 = _179;
    float _3492 = _3488;
    if (_3444)
    {
        float _3494 = _3474 * 6.283185482025146484375;
        float _3496 = cos(_3494);
        _3490 = _3496;
    }
    float _3498 = _3490;
    float _3500 = -_3430;
    float _3502 = -_3488;
    float _3504 = fma(_3410, _3500, _3502);
    if (_3444)
    {
        float _3506 = _3504 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3454 = _3506;
    }
    float _3508 = _3454;
    float _3510 = _3486;
    float _3512 = _3508;
    if (_3444)
    {
        float _3514 = fma(_3486, _3508, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3510 = _3514;
    }
    float _3516 = _3510;
    float _3518 = _3516;
    if (!_3444)
    {
        _3512 = _3504;
    }
    float _3520 = _3512;
    float _3522 = _3520;
    if (_3444)
    {
        float _3524 = _3468 * _3516;
        _3374 = _3524;
    }
    float _3526 = _3374;
    if (!_3444)
    {
        _3470 = _3432;
    }
    float _3528 = _3470;
    float _3530 = _3528;
    float _3532 = _3498;
    if (_3444)
    {
        float _3534 = _3498 + (-1.0);
        _3492 = _3534;
    }
    float _3536 = _3492;
    float _3538 = _3536;
    if (_3444)
    {
        float _3540 = _3432 * _3526;
        _3530 = _3540;
    }
    float _3542 = _3530;
    if (!_3444)
    {
        _3518 = _3436;
    }
    float _3544 = _3518;
    float _3546 = _3362 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3548 = _3544;
    if (_3444)
    {
        float _3550 = _3536 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3480 = _3550;
    }
    float _3552 = _3480;
    if (!_3444)
    {
        _3538 = _3434;
    }
    float _3554 = _3538;
    float _3556 = _3554;
    if (_3444)
    {
        float _3558 = _3434 * _3526;
        _3556 = _3558;
    }
    float _3560 = _3556;
    if (_3444)
    {
        float _3562 = _3542 * _3542;
        _3548 = _3562;
    }
    float _3564 = _3548;
    if (_3444)
    {
        float _3566 = fma(_3504, _3498, _3552);
        _3522 = _3566;
    }
    float _3568 = _3522;
    if (!_3444)
    {
        _3532 = _3438;
    }
    float _3570 = _3532;
    float _3572 = _3570;
    if (_3444)
    {
        float _3574 = _3560 * _3560;
        _3572 = _3574;
    }
    float _3576 = _3572;
    float _3578 = fma(_3568, _3568, _3564);
    float _3580 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3582 = _3578 + _3576;
    float _3584 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3586 = fma(_3428, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3584);
    float _3588 = precise::clamp(_3586, 0.0, 1.0);
    float _3590 = fma(_3364, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3546);
    float _3592 = _3362 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3594 = rsqrt(_3582);
    float _3596 = -_3588;
    float _3598 = _3596 + 1.0;
    float _3600 = fma(_3366, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3590);
    float _3602 = _3362 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3604 = fma(_3364, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3592);
    float _3606 = _3362 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3608 = _3600 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3610 = fma(_3364, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3602);
    float _3612 = abs(_3598);
    float _3614 = log2(_3612);
    float _3616 = fma(_3366, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3604);
    float _3618 = _3608 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3620 = fma(_3366, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3610);
    float _3622 = fma(_3364, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3606);
    float _3624 = _3616 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3626 = -_3618;
    float _3628 = fma(_3626, _3580, 1.0);
    float _3630 = _3620 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3632 = _3594 * _3542;
    float _3634 = _3624 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3636 = _3594 * _3568;
    float _3638 = fma(_3366, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3622);
    float _3640 = _3632 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3642 = fma(_3630, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3634);
    float _3644 = _3594 * _3560;
    float _3646 = _3638 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3648 = -_3640;
    float _3650 = fma(_3636, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3648);
    float _3652 = _3614 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3654 = fma(_3608, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3642);
    float _3656 = log2(_3628);
    float _3658 = -_3644;
    float _3660 = fma(_3658, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3650);
    float _3662 = _3624 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3664 = fma(_3646, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3654);
    float _3666 = _3624 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3668 = fma(_3660, -0.5, 0.5);
    float _3670 = fma(_3630, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3662);
    float _3672 = fma(_3660, 0.5, 0.5);
    float _3674 = exp2(_3652);
    float _3676 = fma(_3630, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3666);
    float _3678 = _3636 + 1.0;
    float _3680 = fma(_3608, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3670);
    float _3682 = fma(_3608, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3676);
    float _3684 = fma(_3646, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3680);
    float _3686 = 1.0 / _3664;
    float _3688 = fma(_3672, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3690 = _3656 * 0.693147182464599609375;
    float _3692 = fma(_3672, _3688, -0.212114393711090087890625);
    float _3694 = _3690 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3696 = sqrt(_3668);
    float _3698 = -_3636;
    float _3700 = fma(_3674, _3678, _3698);
    float _3702 = fma(_3646, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3682);
    float _3704 = fma(_3672, _3692, 1.570728778839111328125);
    float _3706 = _3684 * _3686;
    float _3708 = _3702 * _3686;
    float _3710 = fma(_3706, 0.5, 0.5);
    float _3712 = fma(_3708, -0.5, 0.5);
    float _3714 = _3696 * 0.636619746685028076171875;
    float3 _9843 = float3(_3710, _3712, _3694);
    float _3716 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9843, float3(0.0), isnan(_9843)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9843, float3(0.0), isnan(_9843)), level(0.0)).x;
    float _3718 = -_3704;
    float _3720 = fma(_3714, _3718, 1.0);
    float _3722 = fma(_3700, 0.5, 0.5);
    float3 _9861 = float3(_3710, _3712, _3694);
    float4 _3725 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9861, float3(0.0), isnan(_9861)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9861, float3(0.0), isnan(_9861)), level(0.0)).xyzw;
    float _3727 = _3725.x;
    float _3729 = _3725.y;
    float _3731 = _3725.z;
    float _3733 = _3725.w;
    float2 _9878 = float2(_3720, _3722);
    float3 _3737 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9878, float2(0.0), isnan(_9878)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9878, float2(0.0), isnan(_9878)), level(0.0)).xyz;
    float _3739 = _3737.x;
    float _3741 = _3737.y;
    float _3743 = _3737.z;
    float _3745 = _2700 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3747 = _2700 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3749 = _2700 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3751 = _2700 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3753 = fma(_2698, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3745);
    float _3755 = fma(_2698, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3747);
    float _3757 = fma(_2698, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3749);
    float _3759 = _3624 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3761 = fma(_2702, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3753);
    float _3763 = fma(_2702, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3755);
    float _3765 = fma(_2698, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3751);
    out.m_82.x = _2698;
    out.m_82.y = _2700;
    out.m_82.z = _2702;
    float _3767 = _3761 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3769 = fma(_2702, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3757);
    float _3771 = _3763 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3773 = fma(_3630, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3759);
    float _3775 = fma(_2702, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3765);
    float _3777 = _3767 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3779 = -_657;
    float _3781 = _3779 + _3362;
    float _3783 = _3767 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3785 = _3769 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3787 = fma(_3771, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3777);
    float _3789 = -_655;
    float _3791 = _3789 + _3364;
    float _3793 = _3767 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3795 = _3767 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    out.m_84.y = 1.0;
    float _3797 = fma(_3771, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3783);
    float _3799 = fma(_3771, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3793);
    float _3801 = fma(_3608, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3773);
    float _3803 = _3781 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _3805 = _3785 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _3807 = _3614 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3809 = -_659;
    float _3811 = _3809 + _3366;
    float _3813 = fma(_3771, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3795);
    float _3815 = _3781 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _3817 = _3781 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _3819 = fma(_3791, (*spvDescriptorSet0.vp_c15)._m0[636].x, _3803);
    float _3821 = _3775 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3823 = _3805 + _3797;
    float _3825 = _3664 * 0.5;
    float _3827 = fma(_3791, (*spvDescriptorSet0.vp_c15)._m0[638].x, _3817);
    float _3829 = exp2(_3807);
    float _3831 = fma(_3821, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3823);
    float _3833 = fma(_3791, (*spvDescriptorSet0.vp_c15)._m0[635].x, _3815);
    float _3835 = fma(_3811, (*spvDescriptorSet0.vp_c15)._m0[638].z, _3827);
    float _3837 = fma(_3785, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3787);
    float _3839 = fma(_3646, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3801);
    float _3841 = fma(_3811, (*spvDescriptorSet0.vp_c15)._m0[635].z, _3833);
    float _3843 = _3835 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _3845 = fma(_3821, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3837);
    float _3847 = fma(_3702, -0.5, _3825);
    float _3849 = _3785 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _3851 = 1.0 / _3831;
    float _3853 = _3841 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _3855 = fma(_3811, (*spvDescriptorSet0.vp_c15)._m0[636].z, _3819);
    float _3857 = _3785 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _3859 = _3849 + _3813;
    float _3861 = -_3829;
    float _3863 = _3861 + 1.0;
    float _3865 = _3839 + _3664;
    out.gl_Position.x = _3684;
    out.gl_Position.y = _3702;
    out.gl_Position.z = _3839;
    out.gl_Position.w = _3664;
    float _3867 = 1.0 / _3843;
    float _3869 = _3863 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3871 = _3684 + _3664;
    out.m_86.x = _3364;
    out.m_86.y = _3362;
    out.m_86.z = _3366;
    float _3873 = _3857 + _3799;
    float _3875 = _3865 * 0.5;
    float _3877 = _3871 * 0.5;
    float _3879 = _3845 * _3851;
    float _3881 = _3855 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _3883 = fma(_3821, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3873);
    float _3885 = fma(_3821, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3859);
    bool _3887 = _3879 > 0.0;
    float _3889 = -_3869;
    float _3891 = _3889 + 1.0;
    out.m_88.x = _3877;
    out.m_88.y = _3847;
    out.m_88.z = _3875;
    out.m_88.w = _3664;
    float _3893 = _3853 * _3867;
    bool _3895 = _3879 < 1.0;
    bool _3897 = _3895 && _3887;
    float _3899 = _3881 * _3867;
    bool _3901 = _3706 > (-1.0);
    bool _3903 = _3901 && _3897;
    bool _3905 = _3708 > (-1.0);
    bool _3907 = _3905 && _3903;
    bool _3909 = _3706 < 1.0;
    bool _3911 = _3909 && _3907;
    float _3913 = _3883 * _3851;
    float _3915 = _3885 * _3851;
    bool _3917 = _3708 < 1.0;
    bool _3919 = _3917 && _3911;
    float _3921 = _3869 * _3716;
    float _3923 = _3733 * _3921;
    float _3925 = _3743 * _3921;
    float _3927 = fma(_3739, _3923, _3727);
    float _3929 = fma(_3741, _3923, _3729);
    float _3931 = _3733 * _3891;
    float _3933 = fma(_3733, _3925, _3731);
    out.m_90.x = _3927;
    out.m_90.y = _3929;
    out.m_90.z = _3933;
    out.m_90.w = _3931;
    bool _3935 = !_3919;
    float _3937 = _3733;
    float _3939 = _3702;
    float _3941 = _3731;
    float _3943 = _3923;
    float _3945 = _3891;
    float _3947 = _3684;
    float _3949 = _3664;
    float _3983;
    if (!_3935)
    {
        float _3951 = -_3915;
        float _3953 = _3708 + _3951;
        float _3955 = -_3913;
        float _3957 = _3706 + _3955;
        float _3959 = _2896 * _3406;
        float _3961 = -_3893;
        float _3963 = _3706 + _3961;
        float _3965 = _3953 * _3953;
        float _3967 = -_3899;
        float _3969 = _3708 + _3967;
        float _3971 = _3959 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
        float _3973 = fma(_3957, _3957, _3965);
        float _3975 = sqrt(_3973);
        bool _3977 = _3975 > 0.0;
        _3941 = _3973;
        _3943 = _3957;
        _3945 = _3975;
        if (!_3977)
        {
            _3937 = _3971;
        }
        float _3979 = _3937;
        bool _3981 = !_3977;
        _3983 = _3979;
        _3985 = _3981;
        if (!_3985)
        {
            float _3987 = _3969 * _3969;
            float _3989 = fma(_3963, _3963, _3987);
            float _3991 = rsqrt(_3973);
            float _3993 = sqrt(_3989);
            float _3995 = _3957 * _3991;
            float _3997 = _3953 * _3991;
            bool _3999 = _3993 > 0.0;
            float _4001 = _3993;
            _3945 = _3991;
            if (!_3999)
            {
                _4001 = _3971;
            }
            float _4003 = _4001;
            bool _4005 = !_3999;
            _3983 = _4003;
            _3985 = _4005;
            if (!_3985)
            {
                float _4007 = _2074 * _3821;
                float _4009 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
                float _4011 = fma(_4007, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3805);
                float _4013 = fma(_4007, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3849);
                float _4015 = fma(_3821, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4011);
                float _4017 = fma(_3821, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4013);
                float _4019 = 1.0 / _4015;
                float _4021 = _4009 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _4023 = fma(_4007, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3857);
                float _4025 = rsqrt(_3989);
                float _4027 = _3969 * _4021;
                float _4029 = fma(_3821, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4023);
                float _4031 = _3963 * _4021;
                float _4033 = _4027 * _4027;
                float _4035 = _4017 * _4019;
                float _4037 = _4029 * _4019;
                float _4039 = fma(_4031, _4031, _4033);
                float _4041 = _4035 * _4035;
                float _4043 = fma(_4037, _4037, _4041);
                float _4045 = sqrt(_4039);
                float _4047 = _3969 * _4025;
                float _4049 = _3963 * _4025;
                float _4051 = _3997 * _4047;
                float _4053 = sqrt(_4043);
                float _4055 = fma(_3995, _4049, _4051);
                float _4057 = precise::min(0.0, _4055);
                float _4059 = _3664 * _4057;
                float _4061 = fma(_4031, _4059, _3684);
                float _4063 = fma(_4045, (*spvDescriptorSet0.vp_c13)._m0[1].x, _4053);
                float _4065 = fma(_4027, _4059, _3702);
                float _4067 = 1.0 / _4063;
                out.gl_Position.x = _4061;
                out.gl_Position.y = _4065;
                float _4069 = _4053 * _4067;
                out.m_84.y = _4069;
                _3939 = _4065;
                _3941 = _4027;
                _3983 = _3971;
                _3943 = _4051;
                _3945 = _4059;
                _3947 = _4061;
                _3985 = true;
            }
        }
    }
    else
    {
        float _4071 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _4071;
        _3983 = 0.0;
        _3947 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    _3985 = false;
    float _4073 = _3939;
    float _4075 = _3941;
    float _4077 = _3983;
    float _4079 = _3943;
    float _4081 = _3945;
    float _4083 = _3947;
    bool _4085 = _3428 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4087 = isnan(_3428);
    bool _4089 = _4085 || _4087;
    bool _4091 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4093 = _4089 || _4091;
    float _4095 = _4079;
    float _4097 = _4075;
    float _4099 = _4081;
    float _4101 = _4073;
    float _4103 = _4083;
    if (!_4093)
    {
        _4095 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4105 = _4095;
    float _4107 = _4105;
    float _4109 = _4105;
    if (!_4093)
    {
        _4097 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4111 = _4097;
    float _4113 = _4111;
    float _4115 = _4111;
    if (!_4093)
    {
        _3949 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4117 = _3949;
    float _4119 = _4117;
    float _4121 = _4117;
    if (!_4093)
    {
        _4099 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4123 = _4099;
    float _4125 = _4123;
    float _4127 = _4123;
    if (!_4093)
    {
        _4101 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4129 = _4101;
    float _4131 = _4129;
    float _4133 = _4129;
    if (!_4093)
    {
        _4103 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4135 = _4103;
    bool _4137 = !_4093;
    float _4139 = _4135;
    float _4141 = _4135;
    if (!_4137)
    {
        bool _4143 = _3428 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4145 = isnan(_3428);
        bool _4147 = _4143 || _4145;
        bool _4149 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4151 = _4147 || _4149;
        if (!_4151)
        {
            float _4153 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4155 = _3428 + _4153;
            float _4157 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4159 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4157;
            float _4161 = 1.0 / _4159;
            float _4163 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4165 = _4163 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4167 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4169 = _4167 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4171 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4173 = _4171 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4175 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4177 = _4175 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4179 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4181 = _4179 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4183 = _4155 * _4161;
            float _4185 = precise::clamp(_4183, 0.0, 1.0);
            float _4187 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4189 = _4187 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4191 = fma(_4185, _4165, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4193 = fma(_4185, _4189, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4195 = fma(_4185, _4169, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4197 = fma(_4185, _4173, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4199 = fma(_4185, _4177, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4201 = fma(_4185, _4181, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4115 = _4193;
            _4133 = _4199;
            _4109 = _4191;
            _4127 = _4197;
            _4121 = _4195;
            _4141 = _4201;
            _4203 = true;
        }
        else
        {
            bool _4205 = _3428 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4207 = isnan(_3428);
            bool _4209 = _4205 || _4207;
            bool _4211 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4213 = _4209 || _4211;
            if (!_4213)
            {
                _4107 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4215 = _4107;
            _4109 = _4215;
            if (!_4213)
            {
                _4113 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4217 = _4113;
            _4115 = _4217;
            if (!_4213)
            {
                _4119 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4219 = _4119;
            _4121 = _4219;
            if (!_4213)
            {
                _4125 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4221 = _4125;
            _4127 = _4221;
            if (!_4213)
            {
                _4131 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4223 = _4131;
            _4133 = _4223;
            if (!_4213)
            {
                _4139 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4225 = _4139;
            bool _4227 = !_4213;
            _4141 = _4225;
            if (!_4227)
            {
                bool _4229 = _3428 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4231 = isnan(_3428);
                bool _4233 = _4229 || _4231;
                bool _4235 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4237 = _4233 || _4235;
                if (!_4237)
                {
                    float _4239 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4241 = _3428 + _4239;
                    float _4243 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4245 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4243;
                    float _4247 = 1.0 / _4245;
                    float _4249 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4251 = _4249 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4253 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4255 = _4253 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4257 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4259 = _4257 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4261 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4263 = _4261 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4265 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4267 = _4265 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4269 = _4241 * _4247;
                    float _4271 = precise::clamp(_4269, 0.0, 1.0);
                    float _4273 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4275 = _4273 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4277 = fma(_4271, _4251, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4279 = fma(_4271, _4275, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4281 = fma(_4271, _4255, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4283 = fma(_4271, _4259, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4285 = fma(_4271, _4263, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4287 = fma(_4271, _4267, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4115 = _4279;
                    _4133 = _4285;
                    _4109 = _4277;
                    _4127 = _4283;
                    _4121 = _4281;
                    _4141 = _4287;
                    _4203 = true;
                }
                else
                {
                    _4115 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4133 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4109 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4127 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4121 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4141 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4203 = false;
    float _4289 = _4115;
    float _4291 = _4133;
    float _4293 = _4109;
    float _4295 = _4127;
    float _4297 = _4121;
    float _4299 = _4141;
    float _4301 = fma(_2648, -0.5, 0.5);
    float _4303 = precise::clamp(_4301, 0.0, 1.0);
    float _4305 = -_4289;
    float _4307 = _4305 + _4291;
    float _4309 = _4077 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4311 = -_4293;
    float _4313 = _4311 + _4295;
    float _4315 = fma(_4303, _4307, _4289);
    out.m_92.x = 0.0;
    float _4317 = -_4297;
    float _4319 = _4317 + _4299;
    float _4321 = fma(_4303, _4313, _4293);
    float _4323 = _4315 * 0.586610972881317138671875;
    out.m_53.x = _4309;
    bool _4325 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4327 = fma(_4303, _4319, _4297);
    float _4329 = fma(_4321, 0.298911988735198974609375, _4323);
    bool _4331 = _3406 > 0.0;
    bool _4333 = isnan(_3406);
    bool _4335 = _4331 || _4333;
    bool _4337 = isnan(0.0);
    bool _4339 = _4335 || _4337;
    float _4341 = fma(_4327, 0.114477999508380889892578125, _4329);
    float _4343 = -_4341;
    float _4345 = _4321 + _4343;
    float _4347 = -_4341;
    float _4349 = _4315 + _4347;
    float _4351 = -_4341;
    float _4353 = _4327 + _4351;
    float _4355 = fma(_4345, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4341);
    float _4357 = fma(_4349, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4341);
    float _4359 = fma(_4353, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4341);
    bool _4361 = !_4325;
    if (!_4361)
    {
        float _4363 = -_3362;
        float _4365 = _4363 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4367 = -_3364;
        float _4369 = _4367 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4371 = -_3366;
        float _4373 = _4371 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4375 = _4365 * _4365;
        float _4377 = fma(_4369, _4369, _4375);
        float _4379 = fma(_4373, _4373, _4377);
        float _4381 = sqrt(_4379);
        float _4383 = rsqrt(_4379);
        float _4385 = -_4381;
        float _4387 = _4385 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4389 = _4387 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4391 = precise::clamp(_4389, 0.0, 1.0);
        float _4393 = _4369 * _4383;
        float _4395 = _4365 * _4383;
        float _4397 = abs(_4391);
        float _4399 = log2(_4397);
        float _4401 = _4373 * _4383;
        float _4403 = _4393 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4405 = _2648 * _4395;
        float _4407 = -_4395;
        float _4409 = -_4403;
        float _4411 = fma(_4407, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4409);
        float _4413 = fma(_2628, _4393, _4405);
        float _4415 = -_4401;
        float _4417 = fma(_4415, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4411);
        float _4419 = fma(_2432, _4401, _4413);
        float _4421 = precise::clamp(_4419, 0.0, 1.0);
        float _4423 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4425 = _4417 + _4423;
        float _4427 = _4399 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4429 = _4425 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4431 = precise::clamp(_4429, 0.0, 1.0);
        float _4433 = exp2(_4427);
        float _4435 = _4433 * _4431;
        float _4437 = _4421 * _4435;
        float _4439 = _4437 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4441 = _4437 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4443 = _4437 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _4439;
        out.m_92.y = _4441;
        out.m_92.z = _4443;
    }
    out.m_94.x = _4355;
    out.m_94.y = _4357;
    out.m_94.z = _4359;
    if (_4339)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _4445 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4445;
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
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4203 = false;
    bool _3985 = false;
    bool _2748 = false;
    bool _2736 = false;
    bool _681 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_46.w;
    float _110 = in.m_48.w;
    float _112 = trunc(_108);
    int _115 = int(_112);
    float _117 = -_110;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _119;
    bool _123 = _115 >= 1;
    float _125 = 0.0;
    float _127 = _110;
    float _129 = _119;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _125;
    if (!_123)
    {
        out.m_53.x = 0.0;
    }
    int _133 = 0;
    if (!_123)
    {
        float _135 = _131 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    int _139 = _137;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4513 = as_type<float>(_137);
        out.gl_Position.z = _4513;
    }
    if (!_123)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _141 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_110);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = in.m_55.x;
    float _153 = float(_115);
    float _155 = in.m_55.y;
    bool _157 = _119 >= _153;
    bool _159 = !_149;
    bool _161 = _157 || _159;
    float _163 = in.m_55.z;
    if (_161)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _127;
    if (_161)
    {
        out.m_53.x = 0.0;
    }
    if (_161)
    {
        float _167 = _165 * 5.0;
        _139 = as_type<int>(_167);
    }
    int _169 = _139;
    out.m_57.x = _151;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4576 = as_type<float>(_169);
        out.gl_Position.z = _4576;
    }
    out.m_57.y = _155;
    out.m_57.z = _163;
    if (_161)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _171 = in.m_59.x;
    float _173 = in.m_59.y;
    float _175 = in.m_59.z;
    float _177 = in.m_61.x;
    float _179 = in.m_61.y;
    float _181 = in.m_61.z;
    float _183 = in.m_63.x;
    float _185 = in.m_63.y;
    float _187 = in.m_63.z;
    float _189 = as_type<float>(int(gl_VertexIndex));
    float _191 = in.m_68.w;
    float _193 = in.m_46.x;
    float _195 = in.m_46.y;
    float _197 = in.m_46.z;
    float _199 = _171 * _171;
    float _201 = _173 * _173;
    float _203 = fma(_177, _177, _199);
    float _205 = fma(_179, _179, _201);
    float _207 = fma(_183, _183, _203);
    float _209 = _175 * _175;
    float _211 = fma(_185, _185, _205);
    float _213 = sqrt(_207);
    float _215 = fma(_181, _181, _209);
    float _217 = fma(_187, _187, _215);
    float _219 = sqrt(_211);
    float _221 = sqrt(_217);
    bool _223 = _213 > 0.0;
    bool _225 = _219 > 0.0;
    float _227 = 0.0;
    float _229 = _207;
    float _231 = _181;
    if (_223)
    {
        float _233 = rsqrt(_207);
        _227 = _233;
    }
    float _235 = _227;
    float _237 = 0.0;
    if (!_223)
    {
        _237 = 0.0;
    }
    float _239 = _237;
    bool _241 = _221 > 0.0;
    float _243 = 0.0;
    float _245 = _239;
    if (!_223)
    {
        _243 = 0.0;
    }
    float _247 = _243;
    int _249 = as_type<int>(_189) & 1;
    bool _251 = _249 != 0;
    int _253 = as_type<int>(_189) & 2;
    bool _255 = _253 != 0;
    float _257 = 0.0;
    float _259 = _247;
    if (_225)
    {
        float _261 = rsqrt(_211);
        _257 = _261;
    }
    float _263 = _257;
    float _265 = in.m_48.x;
    float _267 = in.m_48.y;
    float _269 = in.m_48.z;
    bool _271 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _273 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _275 = _271 || _273;
    bool _277 = isnan(1.0);
    bool _279 = _275 || _277;
    float _281 = 0.0;
    float _283 = 0.0;
    if (!_225)
    {
        _281 = 0.0;
        _283 = 0.0;
    }
    float _285 = _281;
    float _287 = _283;
    float _289 = _285;
    float _291 = _287;
    if (!_223)
    {
        _229 = 0.0;
    }
    float _293 = _229;
    float _295 = 0.0;
    float _297 = _293;
    if (!_225)
    {
        _295 = 0.0;
    }
    float _299 = _295;
    float _301 = 0.0;
    float _303 = _299;
    if (_241)
    {
        float _305 = rsqrt(_217);
        _301 = _305;
    }
    float _307 = _301;
    int _309 = int(_251);
    int _311 = _255 ? 2 : 0;
    int _313 = _309 | _311;
    int _315 = _223 ? 4 : 0;
    int _317 = _313 | _315;
    int _319 = _225 ? 8 : 0;
    int _321 = _317 | _319;
    int _323 = _241 ? 16 : 0;
    int _325 = _321 | _323;
    int _327 = _279 ? 32 : 0;
    int _329 = _325 | _327;
    int _331 = false ? 64 : 0;
    int _333 = _329 | _331;
    int _335 = _333 & 32;
    float _337 = 0.0;
    float _339 = 0.0;
    float _341 = as_type<float>(_335);
    if (!_241)
    {
        _337 = 0.0;
        _339 = 0.0;
    }
    float _343 = _337;
    float _345 = _339;
    float _347 = _345;
    float _349 = _343;
    if (_223)
    {
        float _351 = _235 * _177;
        _245 = _351;
    }
    float _353 = _245;
    if (_223)
    {
        float _355 = _235 * _171;
        _297 = _355;
    }
    float _357 = _297;
    if (_223)
    {
        float _359 = _235 * _183;
        _259 = _359;
    }
    float _361 = _259;
    float _363 = 0.0;
    if (!_241)
    {
        _363 = 0.0;
    }
    float _365 = _363;
    float _367 = _365;
    if (_225)
    {
        float _369 = _263 * _179;
        _303 = _369;
    }
    float _371 = _303;
    float _373 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _375 = _373;
    if (_225)
    {
        float _377 = _263 * _173;
        _289 = _377;
    }
    float _379 = _289;
    if (_225)
    {
        float _381 = _263 * _185;
        _291 = _381;
    }
    float _383 = _291;
    bool _385 = !_251;
    float _387 = _385 ? (-0.5) : 0.5;
    if (!_279)
    {
        float _389 = _373 * _373;
        float _391 = _389 * 0.5;
        _341 = _391;
    }
    float _393 = _341;
    bool _395 = !_255;
    float _397 = _395 ? (-0.5) : 0.5;
    float _399 = _393;
    float _401 = _265;
    float _403 = _269;
    if (_241)
    {
        float _405 = _307 * _181;
        _347 = _405;
    }
    float _407 = _347;
    if (_241)
    {
        float _409 = _307 * _175;
        _349 = _409;
    }
    float _411 = _349;
    if (_241)
    {
        float _413 = _307 * _187;
        _367 = _413;
    }
    float _415 = _367;
    if (!_279)
    {
        float _417 = _393 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _399 = _417;
    }
    float _419 = _399;
    bool _421 = !_279;
    float _423 = _419;
    if (!_421)
    {
        float _425 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _427 = log2(_425);
        float _429 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _431 = _429 + 1.0;
        float _433 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _435 = _373 * _427;
        float _437 = 1.0 / _431;
        float _439 = _433 * 0.693147182464599609375;
        float _441 = exp2(_435);
        float _443 = 1.0 / _439;
        float _445 = _441 + (-1.0);
        float _447 = -_445;
        float _449 = fma(_447, _443, _373);
        float _451 = _449 * _437;
        float _453 = _451 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _423 = _453;
    }
    float _455 = _423;
    float _457 = _455 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _459 = !_279;
    float _461 = _457;
    float _463 = _455;
    if (!_459)
    {
        float _465 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _467 = log2(_465);
        float _469 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _471 = _469 + 1.0;
        float _473 = 1.0 / _471;
        float _475 = _373 * _467;
        float _477 = exp2(_475);
        float _479 = -_477;
        float _481 = _479 + 1.0;
        float _483 = _481 * _473;
        _375 = _483;
    }
    float _485 = _375;
    float _487 = _455 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _489 = _457 * _357;
    float _491 = _457 * _379;
    float _493 = _457 * _411;
    float _495 = _485;
    if (!_279)
    {
        float _497 = _119 * _119;
        float _499 = _497 * 0.5;
        _461 = _499;
    }
    float _501 = _461;
    float _503 = fma(_487, _353, _489);
    float _505 = fma(_487, _371, _491);
    float _507 = fma(_487, _407, _493);
    float _509 = _455 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_279)
    {
        float _511 = _501 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _463 = _511;
    }
    float _513 = _463;
    bool _515 = !_279;
    float _517 = _513;
    if (!_515)
    {
        float _519 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _521 = log2(_519);
        float _523 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _525 = _523 + 1.0;
        float _527 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _529 = _119 * _521;
        float _531 = 1.0 / _525;
        float _533 = _527 * 0.693147182464599609375;
        float _535 = exp2(_529);
        float _537 = 1.0 / _533;
        float _539 = _535 + (-1.0);
        float _541 = -_539;
        float _543 = fma(_541, _537, _119);
        float _545 = _543 * _531;
        float _547 = _545 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _517 = _547;
    }
    float _549 = _517;
    float _551 = _549 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _553 = fma(_509, _361, _503);
    float _555 = fma(_509, _383, _505);
    float _557 = _549 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _559 = _551 * _357;
    float _561 = _551 * _379;
    float _563 = _551 * _411;
    float _565 = fma(_509, _415, _507);
    float _567 = fma(_557, _353, _559);
    float _569 = fma(_557, _371, _561);
    float _571 = fma(_557, _407, _563);
    float _573 = _549 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _575 = fma(_485, _265, _553);
    float _577 = fma(_485, _267, _555);
    float _579 = fma(_485, _269, _565);
    float _581 = fma(_573, _361, _567);
    float _583 = fma(_573, _383, _569);
    float _585 = fma(_573, _415, _571);
    if (!_279)
    {
        _495 = _119;
    }
    float _587 = _495;
    bool _589 = !_279;
    float _591 = _587;
    if (!_589)
    {
        float _593 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _595 = log2(_593);
        float _597 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _599 = _597 + 1.0;
        float _601 = 1.0 / _599;
        float _603 = _119 * _595;
        float _605 = exp2(_603);
        float _607 = -_605;
        float _609 = _607 + 1.0;
        float _611 = _609 * _601;
        _591 = _611;
    }
    float _613 = _591;
    float _615 = fma(_613, _267, _583);
    float _617 = 1.0 / _153;
    bool _619 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _621 = fma(_613, _265, _581);
    float _623 = -_615;
    float _625 = _577 + _623;
    float _627 = fma(_613, _269, _585);
    float _629 = fma(_577, _191, _195);
    float _631 = fma(_575, _191, _193);
    float _633 = -_621;
    float _635 = _575 + _633;
    float _637 = _625 * _179;
    float _639 = _625 * _173;
    float _641 = _625 * _185;
    float _643 = -_627;
    float _645 = _579 + _643;
    float _647 = fma(_635, _177, _637);
    float _649 = fma(_635, _171, _639);
    float _651 = fma(_635, _183, _641);
    float _653 = fma(_579, _191, _197);
    float _655 = fma(_645, _181, _647);
    float _657 = fma(_645, _175, _649);
    float _659 = fma(_645, _187, _651);
    float _661 = _119 * _617;
    bool _663 = !_619;
    float _679;
    if (!_663)
    {
        float _665 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _667 = _151 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _669 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _671 = _669 * _665;
        float _673 = floor(_671);
        float _675 = -_673;
        float _677 = _671 + _675;
        _679 = _677;
        _681 = true;
    }
    else
    {
        _679 = _661;
    }
    _681 = false;
    float _683 = _679;
    float _685 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _687 = int(_685);
    float _689 = in.m_55.w;
    float _691 = _151 * 2.0;
    float _693 = _629 * _173;
    float _695 = _629 * _185;
    int _697 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _699 = _697 != 0;
    float _701 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _703 = int(_701);
    float _705 = _151 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _709 = _707 != 0;
    int _711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _713 = _711 != 0;
    int _715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _717 = _715 != 0;
    float _719 = fma(_631, _171, _693);
    bool _721 = _151 > 0.5;
    float _723 = fma(_631, _183, _695);
    float _725 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _727 = int(_725);
    float _729 = float(_687);
    float _731 = in.m_63.w;
    bool _733 = !_713;
    int _735 = _733 ? 0 : 1;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _739 = -_387;
    int _741 = _721 ? as_type<int>(_739) : as_type<int>(_387);
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _745 = _683 + _743;
    bool _747 = _155 > 0.5;
    float _749 = 1.0 / _729;
    float _751 = float(_703);
    float _753 = -_737;
    float _755 = fma(_705, 2.0, _753);
    bool _757 = _689 > 0.5;
    float _759 = in.m_59.w;
    float _761 = _155 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _763 = !_709;
    int _765 = _763 ? 0 : 1;
    float _767 = 1.0 / _751;
    float _769 = float(uint(_727));
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _773 = _771 != 0;
    float _775 = -_397;
    float _777 = _757 ? _775 : _397;
    bool _779 = !_773;
    int _781 = _779 ? 0 : 1;
    float _783 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _785 = int(_783);
    float _787 = _119 * _749;
    float _789 = _155 * 2.0;
    int _791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _793 = _791 != 0;
    int _795 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _797 = _795 != 0;
    float _799 = _163 * 2.0;
    float _801 = 1.0 / _769;
    float _803 = _119 * _767;
    bool _805 = !_797;
    float _807 = _805 ? _387 : as_type<float>(_741);
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _811 = _809 != 0;
    bool _813 = !_717;
    int _815 = _813 ? 0 : 1;
    float _817 = trunc(_787);
    int _819 = int(_817);
    float _821 = float(uint(_785));
    int _823 = ~_785;
    int _825 = _823 + 1;
    float _827 = 0.0;
    float _829 = _777;
    if (_699)
    {
        _827 = 1.0;
    }
    float _831 = _827;
    float _833 = 0.0;
    float _835 = _831;
    if (_699)
    {
        _833 = _151;
    }
    float _837 = _833;
    float _839 = 1.0 / _821;
    int _841 = as_type<int>(_801) + (-2);
    float _843 = 0.0;
    float _845 = _837;
    if (_699)
    {
        _843 = 1.0;
    }
    float _847 = _843;
    float _849 = _847;
    if (!_699)
    {
        _835 = 7.345489978790283203125;
    }
    float _851 = _835;
    if (!_699)
    {
        _845 = _155;
    }
    float _853 = _845;
    float _855 = trunc(_803);
    int _857 = int(_855);
    float _859 = float(uint(_819));
    float _861 = _851 * _151;
    if (!_699)
    {
        _849 = 1.2345600128173828125;
    }
    float _863 = _849;
    float _865 = as_type<float>(_841) * _859;
    float _867 = floor(_691);
    int _869 = as_type<int>(_839) + (-2);
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _871;
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _877 = _853 * _863;
    bool _879 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _881 = isnan(_683);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _887 = _883 || _885;
    float _889 = float(_887);
    float _891 = float(uint(_857));
    float _893 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _895 = log2(_893);
    float _897 = fma(_761, -2.0, _875);
    float _899 = _151 + _155;
    float _901 = as_type<float>(_869) * _891;
    float _903 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _897);
    float _905 = _899 + (-1.0);
    bool _907 = _867 > 0.0;
    float _909 = trunc(_865);
    float _911 = precise::max(_909, 0.0);
    uint _914 = uint(_911);
    bool _916 = _867 >= 0.0;
    bool _918 = isnan(_867);
    bool _920 = _916 || _918;
    bool _922 = isnan(0.0);
    bool _924 = _920 || _922;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _926;
    float _930 = -_397;
    int _932 = _747 ? as_type<int>(_930) : as_type<int>(_397);
    bool _934 = _163 > 0.5;
    bool _936 = !_811;
    float _938 = _936 ? _397 : as_type<float>(_932);
    float _940 = trunc(_901);
    float _942 = precise::max(_940, 0.0);
    uint _944 = uint(_942);
    int _946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _948 = _946 != 0;
    float _950 = -_387;
    int _952 = _934 ? as_type<int>(_950) : as_type<int>(_387);
    int _954 = abs(_765);
    bool _956 = !_948;
    float _958 = _956 ? _387 : as_type<float>(_952);
    float _960 = floor(_789);
    int _962 = ~_727;
    int _964 = _962 + 1;
    int _966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _968 = _966 != 0;
    int _970 = abs(_815);
    int _972 = _964 * int(_914);
    int _974 = _972 + _819;
    bool _976 = !_968;
    int _978 = _976 ? 0 : 1;
    float _980 = floor(_799);
    int _982 = _924 ? 0 : 1;
    float _984 = float(uint(_974));
    int _986 = ~_982;
    int _988 = _986 + 1;
    int _990 = _988 + 1;
    int _992 = _990;
    int _994 = _974;
    if (!_907)
    {
        int _996 = ~_982;
        int _998 = _996 + 1;
        _992 = _998;
    }
    int _1000 = _992;
    float _1002 = _119 * _895;
    float _1004 = 1.0 / _873;
    bool _1006 = _960 > 0.0;
    bool _1008 = _960 >= 0.0;
    bool _1010 = isnan(_960);
    bool _1012 = _1008 || _1010;
    bool _1014 = isnan(0.0);
    bool _1016 = _1012 || _1014;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1020 = 1.0 + _1018;
    int _1022 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1024 = _1022 != 0;
    if (_699)
    {
        _994 = 0;
    }
    int _1026 = _994;
    float _1028 = exp2(_1002);
    bool _1030 = !_1024;
    int _1032 = _1030 ? 0 : 1;
    bool _1034 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1036 = isnan(0.0);
    bool _1038 = _1034 || _1036;
    bool _1040 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1042 = _1038 || _1040;
    int _1044 = _1026;
    if (!_699)
    {
        _1044 = 1;
    }
    int _1046 = _1044;
    float _1048 = float(_1000);
    float _1050 = 1.0 / _1020;
    int _1052 = _825 * int(_944);
    int _1054 = _1052 + _857;
    float _1056 = as_type<float>(_841) * _984;
    int _1058 = _1016 ? 0 : 1;
    int _1060 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1062 = _1060 != 0;
    int _1064 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1066 = _1064 != 0;
    int _1068 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1070 = _1068 != 0;
    float _1072 = float(uint(_1054));
    float _1074 = trunc(_1056);
    float _1076 = precise::max(_1074, 0.0);
    uint _1078 = uint(_1076);
    float _1080 = -_1028;
    float _1082 = _1080 + 1.0;
    bool _1084 = _1046 != 1;
    float _1086 = as_type<float>(_869) * _1072;
    int _1088 = ~_1058;
    int _1090 = _1088 + 1;
    int _1092 = _1090 + 1;
    int _1094 = _1092;
    if (!_1006)
    {
        int _1096 = ~_1058;
        int _1098 = _1096 + 1;
        _1094 = _1098;
    }
    int _1100 = _1094;
    float _1102 = trunc(_1086);
    float _1104 = precise::max(_1102, 0.0);
    uint _1106 = uint(_1104);
    float _1108 = _1042 ? _1082 : 0.0;
    bool _1110 = _980 > 0.0;
    bool _1112 = _980 >= 0.0;
    bool _1114 = isnan(_980);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan(0.0);
    bool _1120 = _1116 || _1118;
    float _1122 = _1108 * _1050;
    int _1124 = ~_785;
    int _1126 = _1124 + 1;
    int _1128 = int(_914) + int(_1078);
    int _1130 = ~_727;
    int _1132 = _1130 + 1;
    bool _1134 = !_793;
    float _1136 = _1134 ? _397 : _777;
    int _1138 = _1132 * _1128;
    int _1140 = _1138 + _819;
    int _1142 = int(_944) + int(_1106);
    int _1144 = _1120 ? 0 : 1;
    float _1146 = 0.0;
    if (!_1084)
    {
        _1146 = _155;
    }
    float _1148 = _1146;
    int _1150 = _1126 * _1142;
    int _1152 = _1150 + _857;
    float _1154 = 0.0;
    float _1156 = _1148;
    if (!_1084)
    {
        _1154 = _155;
    }
    float _1158 = _1154;
    float _1160 = 0.0;
    float _1162 = _1158;
    if (!_1084)
    {
        _1160 = _163;
    }
    float _1164 = _1160;
    float _1166 = _1164;
    if (!_1084)
    {
        _829 = _163;
    }
    float _1168 = _829;
    float _1170 = _1168;
    if (_1084)
    {
        _1156 = _151;
    }
    float _1172 = _1156;
    if (_1084)
    {
        _1162 = _151;
    }
    float _1174 = _1162;
    if (_1084)
    {
        _1166 = _155;
    }
    float _1176 = _1166;
    if (_1084)
    {
        _1170 = _155;
    }
    float _1178 = _1170;
    bool _1180 = !_1066;
    int _1182 = _1180 ? 0 : 1;
    bool _1184 = uint(_1140) >= uint(_727);
    bool _1186 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1188 = isnan(1.0);
    bool _1190 = _1186 || _1188;
    bool _1192 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1194 = _1190 || _1192;
    bool _1196 = uint(_1152) >= uint(_785);
    float _1198 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1200 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1198;
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1204 = _1202 != 0;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _1210 = ~_1144;
    int _1212 = _1210 + 1;
    int _1214 = _1212 + 1;
    int _1216 = _1214;
    if (!_1110)
    {
        int _1218 = ~_1144;
        int _1220 = _1218 + 1;
        _1216 = _1220;
    }
    int _1222 = _1216;
    float _1224 = 1.0 / _1200;
    bool _1226 = !_1194;
    float _1228 = _1226 ? _119 : _1122;
    float _1230 = _155 + _163;
    bool _1232 = !_1184;
    int _1234 = _1232 ? 0 : (-1);
    bool _1236 = !_1196;
    int _1238 = _1236 ? 0 : (-1);
    float _1240 = _1230 + (-1.0);
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1244 = _1242 != 0;
    int _1246 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1248 = _1246 != 0;
    int _1250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1252 = _1250 != 0;
    int _1254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1256 = _1254 != 0;
    float _1258 = _629 * _179;
    float _1260 = 1.0 / _1208;
    float _1262 = fma(_631, _177, _1258);
    float _1264 = _151 + _163;
    float _1266 = in.m_61.w;
    float _1268 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1270 = _745 * _1224;
    float _1272 = _1264 + (-1.0);
    float _1274 = fma(_653, _175, _719);
    float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1278 = _683 + _1276;
    float _1280 = fma(_653, _181, _1262);
    float _1282 = fma(_653, _187, _723);
    float _1284 = _1274 + _759;
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1288 = _683 + _1286;
    float _1290 = _1278 * _1260;
    float _1292 = _1282 + _731;
    float _1294 = _1288 * _1004;
    float _1296 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1298 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1300 = isnan(_683);
    bool _1302 = _1298 || _1300;
    bool _1304 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1306 = _1302 || _1304;
    float _1308 = float(_1306);
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1310;
    float _1314 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1316 = _1314 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1318 = _1284 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _1320 = fma(_1312, _1270, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1322 = _1292 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    bool _1324 = !_1070;
    int _1326 = _1324 ? 0 : 1;
    float _1328 = _1280 + _1266;
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1332 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1330;
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1336 = _1334 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1338 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1340 = fma(_1332, _1270, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _1342 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1344 = isnan(_683);
    bool _1346 = _1342 || _1344;
    bool _1348 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1350 = _1346 || _1348;
    float _1352 = float(_1350);
    float _1354 = fma(_1336, _1290, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _1356 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1358 = isnan(_683);
    bool _1360 = _1356 || _1358;
    bool _1362 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1364 = _1360 || _1362;
    float _1366 = float(_1364);
    float _1368 = fma(_1316, _1290, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1372 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1370;
    float _1374 = -_1352;
    float _1376 = _1374 + 1.0;
    float _1378 = floor(_861);
    float _1380 = -_1366;
    float _1382 = _1380 + 1.0;
    float _1384 = _1328 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _1386 = _1366 * _1376;
    float _1388 = -_119;
    float _1390 = fma(_1388, (*spvDescriptorSet0.vp_c9)._m0[76].x, _755);
    float _1392 = _807 + 0.5;
    float _1394 = _1308 * _1382;
    float _1396 = -_1308;
    float _1398 = _1396 + 1.0;
    float _1400 = fma(_928, _1294, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1402 = fma(_1392, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1390);
    float _1404 = fma(_1372, _1294, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1406 = floor(_877);
    float _1408 = _889 * _1398;
    float _1410 = _938 + (-0.5);
    float _1412 = -_889;
    float _1414 = _1412 + 1.0;
    bool _1416 = !_1062;
    int _1418 = _1416 ? 0 : 1;
    float _1420 = _1340 * _1408;
    float _1422 = _1320 * _1408;
    float _1424 = -_1410;
    float _1426 = -_903;
    float _1428 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1426);
    float _1430 = -_1378;
    float _1432 = _861 + _1430;
    float _1434 = fma(_1414, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1420);
    float _1436 = fma(_1414, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1422);
    float _1438 = _1318 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _1440 = _1318 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _1442 = fma(_1354, _1394, _1434);
    float _1444 = fma(_1368, _1394, _1436);
    float _1446 = float(_727);
    float _1448 = -_1406;
    float _1450 = _877 + _1448;
    float _1452 = fma(_1384, (*spvDescriptorSet0.vp_c12)._m0[6].x, _1438);
    float _1454 = _1318 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _1456 = float(_785);
    float _1458 = _1432 * _1446;
    float _1460 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1462 = float(_819);
    float _1464 = fma(_1384, (*spvDescriptorSet0.vp_c12)._m0[6].y, _1440);
    float _1466 = float(_857);
    float _1468 = _1450 * _1456;
    bool _1470 = _1462 >= _1446;
    bool _1472 = isnan(_1462);
    bool _1474 = _1470 || _1472;
    bool _1476 = isnan(_1446);
    bool _1478 = _1474 || _1476;
    float _1480 = float(_1478);
    float _1482 = _661 * _1446;
    float _1484 = _661 * _1456;
    bool _1486 = _1466 >= _1456;
    bool _1488 = isnan(_1466);
    bool _1490 = _1486 || _1488;
    bool _1492 = isnan(_1456);
    bool _1494 = _1490 || _1492;
    float _1496 = float(_1494);
    float _1498 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1460);
    float _1500 = fma(_1322, (*spvDescriptorSet0.vp_c12)._m0[8].x, _1452);
    float _1502 = _1172 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1504 = fma(_1384, (*spvDescriptorSet0.vp_c12)._m0[6].z, _1454);
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1508 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1510 = fma(_1322, (*spvDescriptorSet0.vp_c12)._m0[8].y, _1464);
    float _1512 = fma(_1322, (*spvDescriptorSet0.vp_c12)._m0[8].z, _1504);
    float _1514 = fma(_1400, _1386, _1442);
    float _1516 = fma(_1404, _1386, _1444);
    float _1518 = -_1506;
    float _1520 = fma(_1502, 2.0, _1518);
    float _1522 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1524 = abs(_1182);
    float _1526 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1508);
    int _1528 = abs(_1326);
    float _1530 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    int _1532 = abs(_1418);
    float _1534 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1536 = float(_1100);
    float _1538 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1514);
    float _1540 = in.m_70.x;
    float _1542 = in.m_70.y;
    float _1544 = in.m_70.z;
    float _1546 = float(_1528);
    float _1548 = fma(_1534, -2.0, _1522);
    float _1550 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1552 = float(_1222);
    float _1554 = _1500 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _1556 = float(_1532);
    float _1558 = _1546 * _1536;
    float _1560 = _1510 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _1562 = float(_1524);
    float _1564 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1516);
    float _1566 = _1556 * _1552;
    float _1568 = _1560 * _1530;
    float _1570 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1572 = _1512 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _1574 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1548);
    float _1576 = _1566 * (-2.0);
    float _1578 = _1562 * _1048;
    float _1580 = _1558 * (-2.0);
    float _1582 = _1554 * _1550;
    float _1584 = _1136 + (-0.5);
    float _1586 = fma(_1268, _1576, _1268);
    float _1588 = trunc(_1468);
    int _1590 = int(_1588);
    float _1592 = -_1584;
    float _1594 = -_1574;
    float _1596 = fma(_1592, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1594);
    float _1598 = fma(_1576, _1540, _1540);
    float _1600 = _1578 * (-2.0);
    float _1602 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1604 = _1572 * _1570;
    float _1606 = fma(_1338, _1600, _1338);
    float _1608 = fma(_1600, _1542, _1542);
    float _1610 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1612 = trunc(_1458);
    int _1614 = int(_1612);
    float _1616 = fma(_1580, _1544, _1544);
    float _1618 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1602);
    float _1620 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1610);
    float _1622 = _151 + (-0.5);
    float _1624 = _155 + (-0.5);
    float _1626 = _163 + (-0.5);
    int _1628 = ~_1128;
    int _1630 = _1628 + _1234;
    int _1632 = _1630 + 1;
    float _1634 = trunc(_1480);
    int _1636 = int(_1634);
    float _1638 = fma(_1624, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1608);
    float _1640 = fma(_1626, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1616);
    int _1642 = abs(_781);
    float _1644 = fma(_1622, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1598);
    int _1646 = abs(_1032);
    int _1648 = _727 * _1632;
    int _1650 = _1648 + _819;
    int _1652 = ~_1142;
    int _1654 = _1652 + _1238;
    int _1656 = _1654 + 1;
    float _1658 = trunc(_1496);
    int _1660 = int(_1658);
    int _1662 = _1614 * _1642;
    int _1664 = _1662 + _819;
    bool _1666 = !_1248;
    int _1668 = _1666 ? 0 : 1;
    int _1670 = _1590 * _1646;
    int _1672 = _1670 + _857;
    bool _1674 = _727 == 0;
    int _1676 = _785 * _1656;
    int _1678 = _1676 + _857;
    bool _1680 = !_1244;
    int _1682 = _1680 ? 0 : 1;
    float _1684 = fma(_1228, _1586, _1644);
    bool _1686 = _785 == 0;
    float _1688 = trunc(_1482);
    int _1690 = int(_1688);
    int _1692 = ~_1636;
    int _1694 = _1692 + 1;
    int _1696 = _1694 + 1;
    float _1698 = fma(_1228, _1606, _1638);
    bool _1700 = !_1674;
    int _1702 = _1700 ? _1650 : (-1);
    float _1704 = in.m_68.x;
    float _1706 = in.m_68.y;
    bool _1708 = !_1686;
    int _1710 = _1708 ? _1678 : (-1);
    float _1712 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1620);
    int _1714 = ~_1660;
    int _1716 = _1714 + 1;
    int _1718 = _1716 + 1;
    float _1720 = trunc(_1484);
    int _1722 = int(_1720);
    int _1724 = _727 + (-1);
    int _1726 = _1702 * _1696;
    int _1728 = abs(_735);
    int _1730 = _1710 * _1718;
    int _1732 = _785 + (-1);
    int _1734 = _1636 * _1724;
    int _1736 = _1734 + _1726;
    float _1738 = float(uint(_1672));
    float _1740 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1498);
    int _1742 = abs(_1668);
    int _1744 = _1660 * _1732;
    int _1746 = _1744 + _1730;
    float _1748 = as_type<float>(_869) * _1738;
    int _1750 = abs(_1682);
    float _1752 = _958 + 0.5;
    int _1754 = _1736 * _1728;
    bool _1756 = !_1252;
    int _1758 = _1756 ? 0 : 1;
    float _1760 = trunc(_1748);
    float _1762 = precise::max(_1760, 0.0);
    uint _1764 = uint(_1762);
    float _1766 = -_119;
    float _1768 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1520);
    int _1770 = _1746 * _1742;
    float _1772 = _1564 * _1706;
    int _1774 = _1690 * _954;
    int _1776 = _1774 + _1754;
    int _1778 = abs(_978);
    int _1780 = _1722 * _1750;
    int _1782 = _1780 + _1770;
    float _1784 = fma(_1752, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1768);
    int _1786 = _1664 * _970;
    int _1788 = _1786 + _1776;
    int _1790 = abs(_1758);
    float _1792 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1526);
    bool _1794 = !_1256;
    int _1796 = _1794 ? 0 : 1;
    int _1798 = _1614 * _1778;
    int _1800 = _1798 + _1788;
    float _1802 = _1698 * 0.15915493667125701904296875;
    int _1804 = abs(_1796);
    float _1806 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1618);
    float _1808 = float(uint(_1664));
    int _1810 = _1672 * _1790;
    int _1812 = _1810 + _1782;
    float _1814 = -_1806;
    float _1816 = _1814 + 1.0;
    float _1818 = -_1792;
    float _1820 = _1818 + 1.0;
    float _1822 = as_type<float>(_841) * _1808;
    float _1824 = fma(_1296, _1580, _1296);
    int _1826 = _1590 * _1804;
    int _1828 = _1826 + _1812;
    float _1830 = float(uint(_1800));
    float _1832 = -_1712;
    float _1834 = _1832 + 1.0;
    float _1836 = -_1740;
    float _1838 = _1836 + 1.0;
    float _1840 = -_1816;
    float _1842 = fma(_807, _1840, _1402);
    float _1844 = fma(_1136, _1820, _1596);
    float _1846 = as_type<float>(_841) * _1830;
    float _1848 = -_1838;
    float _1850 = fma(_958, _1848, _1784);
    int _1852 = ~_727;
    int _1854 = _1852 + 1;
    float _1856 = fma(_938, _1834, _1428);
    float _1858 = trunc(_1846);
    float _1860 = precise::max(_1858, 0.0);
    uint _1862 = uint(_1860);
    float _1864 = float(uint(_1828));
    float _1866 = fma(_1228, _1824, _1640);
    float _1868 = fma(_1568, 0.5, 0.5);
    out.m_72.x = _1842;
    out.m_72.y = _1856;
    out.m_72.z = _1850;
    out.m_72.w = _1844;
    float _1870 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _397);
    float _1872 = fma(_1582, 0.5, 0.5);
    float _1874 = _1772 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1876 = trunc(_1822);
    float _1878 = precise::max(_1876, 0.0);
    uint _1880 = uint(_1878);
    float _1882 = as_type<float>(_869) * _1864;
    float _1884 = _1684 * 0.15915493667125701904296875;
    float _1886 = _1866 * 0.15915493667125701904296875;
    float _1888 = _1874 * _1870;
    int _1890 = ~_727;
    int _1892 = _1890 + 1;
    float _1894 = _1538 * _1704;
    int _1896 = ~_785;
    int _1898 = _1896 + 1;
    int _1900 = _1854 * int(_1862);
    int _1902 = _1900 + _1800;
    float _1904 = trunc(_1882);
    float _1906 = precise::max(_1904, 0.0);
    uint _1908 = uint(_1906);
    int _1910 = ~_785;
    int _1912 = _1910 + 1;
    float _1914 = fma(_1604, 0.5, 0.5);
    float _1916 = _397 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1918 = float(uint(_1902));
    int _1920 = _1892 * int(_1880);
    int _1922 = _1920 + _1664;
    float _1924 = floor(_1868);
    int _1926 = _1898 * int(_1764);
    int _1928 = _1926 + _1672;
    float _1930 = as_type<float>(_841) * _1918;
    int _1932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1934 = _1932 != 0;
    float _1936 = float(uint(_1922));
    float _1938 = float(uint(_1928));
    float _1940 = floor(_1872);
    int _1942 = _1912 * int(_1908);
    int _1944 = _1942 + _1828;
    float _1946 = _1884 * 6.283185482025146484375;
    float _1948 = sin(_1946);
    float _1950 = -_1924;
    float _1952 = _1868 + _1950;
    float _1954 = as_type<float>(_869) * _1938;
    float _1956 = fma(_1952, 2.0, -1.0);
    float _1958 = _1884 * 6.283185482025146484375;
    float _1960 = cos(_1958);
    float _1962 = -_1940;
    float _1964 = _1872 + _1962;
    float _1966 = _1802 * 6.283185482025146484375;
    float _1968 = sin(_1966);
    float _1970 = _1802 * 6.283185482025146484375;
    float _1972 = cos(_1970);
    float _1974 = _1886 * 6.283185482025146484375;
    float _1976 = cos(_1974);
    float _1978 = _1948 * _1968;
    float _1980 = _1960 * _1968;
    float _1982 = trunc(_1930);
    float _1984 = precise::max(_1982, 0.0);
    uint _1986 = uint(_1984);
    float _1988 = _1960 * _1972;
    float _1990 = _1886 * 6.283185482025146484375;
    float _1992 = sin(_1990);
    float _1994 = _1948 * _1976;
    float _1996 = _1960 * _1976;
    float _1998 = _1968 * _1976;
    int _2000 = int(_1862) + int(_1986);
    float _2002 = as_type<float>(_841) * _1936;
    float _2004 = _1948 * _1972;
    float _2006 = _1972 * _1976;
    float _2008 = float(uint(_1944));
    float _2010 = fma(_1964, 2.0, -1.0);
    int _2012 = ~_727;
    int _2014 = _2012 + 1;
    float _2016 = _1956 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _2018 = -_1980;
    float _2020 = fma(_1992, _2004, _2018);
    float _2022 = as_type<float>(_869) * _2008;
    float _2024 = -_2004;
    float _2026 = fma(_1992, _1980, _2024);
    int _2028 = _2014 * _2000;
    int _2030 = _2028 + _1800;
    float _2032 = trunc(_2002);
    float _2034 = precise::max(_2032, 0.0);
    uint _2036 = uint(_2034);
    float _2038 = _2010 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _2040 = _2016 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _2042 = fma(_1992, _1988, _1978);
    bool _2044 = uint(_2030) >= uint(_727);
    float _2046 = fma(_1992, _1978, _1988);
    float _2048 = fma(_2038, (*spvDescriptorSet0.vp_c12)._m0[2].x, _2040);
    float _2050 = _1996 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2052 = trunc(_2022);
    float _2054 = precise::max(_2052, 0.0);
    uint _2056 = uint(_2054);
    float _2058 = _2016 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _2060 = _2016 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _2062 = -_1992;
    float _2064 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2050);
    float _2066 = fma(_2038, (*spvDescriptorSet0.vp_c12)._m0[2].y, _2058);
    bool _2068 = !_2044;
    int _2070 = _2068 ? 0 : (-1);
    float _2072 = fma(_2038, (*spvDescriptorSet0.vp_c12)._m0[2].z, _2060);
    float _2074 = _1894 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2076 = trunc(_1954);
    float _2078 = precise::max(_2076, 0.0);
    uint _2080 = uint(_2078);
    int _2082 = ~_2000;
    int _2084 = _2082 + _2070;
    int _2086 = _2084 + 1;
    int _2088 = int(_1880) + int(_2036);
    float _2090 = _1996 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2092 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _387);
    int _2094 = _727 * _2086;
    int _2096 = _2094 + _1800;
    int _2098 = int(_1908) + int(_2056);
    float _2100 = _1996 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2102 = ~_785;
    int _2104 = _2102 + 1;
    float _2106 = floor(_1914);
    bool _2108 = !_1674;
    int _2110 = _2108 ? _2096 : (-1);
    float _2112 = -_1992;
    float _2114 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2100);
    float _2116 = -_1992;
    float _2118 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2090);
    int _2120 = _2104 * _2098;
    int _2122 = _2120 + _1828;
    int _2124 = _2110 & 3;
    bool _2126 = _2124 != 0;
    float _2128 = _2074 * _2092;
    float _2130 = -_1888;
    float _2132 = _1992 * _2130;
    int _2134 = int(_1764) + int(_2080);
    float _2136 = _2042 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2138 = uint(_2122) >= uint(_785);
    float _2140 = _1996 * _1888;
    int _2142 = _2126 ? 0 : 1;
    float _2144 = fma(_2006, _2128, _2132);
    int _2146 = _2110 & 3;
    bool _2148 = _2146 != 0;
    float _2150 = _1994 * _1888;
    bool _2152 = !_2138;
    int _2154 = _2152 ? 0 : (-1);
    float _2156 = fma(_2042, _2128, _2140);
    bool _2158 = uint(_2146) > 1u;
    float _2160 = _2042 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2162 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2064);
    float _2164 = _2042 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2166 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2168 = fma(_2020, _2128, _2150);
    float _2170 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2118);
    float _2172 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2136);
    float _2174 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2114);
    float _2176 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2160);
    float _2178 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2164);
    float _2180 = fma(_1998, _2166, _2144);
    float _2182 = _2026 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2184 = _2026 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2186 = _2026 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2188 = ~_2098;
    int _2190 = _2188 + _2154;
    int _2192 = _2190 + 1;
    float _2194 = -_2106;
    float _2196 = _1914 + _2194;
    int _2198 = ~_2142;
    int _2200 = _2198 + 1;
    int _2202 = _2200 + 1;
    float _2204 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2182);
    int _2206 = _2202;
    float _2208 = _2010;
    float _2210 = _1956;
    float _2212 = _2010;
    float _2214 = _1956;
    if (!_2158)
    {
        int _2216 = ~_2142;
        int _2218 = _2216 + 1;
        _2206 = _2218;
    }
    int _2220 = _2206;
    float _2222 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2184);
    float _2224 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2186);
    bool _2226 = uint(_2146) >= 2u;
    int _2228 = _785 * _2192;
    int _2230 = _2228 + _1828;
    int _2232 = ~_727;
    int _2234 = _2232 + 1;
    float _2236 = fma(_2026, _2166, _2156);
    int _2238 = _2226 ? 0 : 1;
    float _2240 = fma(_2046, _2166, _2168);
    float _2242 = _387 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2244 = _2146 != 3;
    float _2246 = _1916 * _2174;
    int _2248 = _2110 >> 31;
    int _2250 = _2234 * _2088;
    int _2252 = _2250 + _1664;
    bool _2254 = !_1686;
    int _2256 = _2254 ? _2230 : (-1);
    float _2258 = fma(_2046, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2204);
    int _2260 = _2248 & 3;
    float _2262 = _1916 * _2162;
    int _2264 = _2256 >> 31;
    float _2266 = fma(_2196, 2.0, -1.0);
    int _2268 = ~_785;
    int _2270 = _2268 + 1;
    int _2272 = _2110 + _2260;
    int _2274 = _2264 & 3;
    int _2276 = ~_2238;
    int _2278 = _2276 + 1;
    int _2280 = _2278 + 1;
    int _2282 = _2280;
    if (_2244)
    {
        int _2284 = ~_2238;
        int _2286 = _2284 + 1;
        _2282 = _2286;
    }
    int _2288 = _2282;
    int _2290 = _2256 + _2274;
    int _2292 = _2272 >> 2;
    bool _2294 = uint(_2252) >= uint(_727);
    int _2296 = _2270 * _2134;
    int _2298 = _2296 + _1672;
    int _2300 = _2290 >> 2;
    float _2302 = fma(_2020, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2172);
    int _2304 = _2292 << 4;
    int _2306 = _2304 + 368;
    float _2308 = fma(_2020, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2176);
    bool _2310 = !_2294;
    int _2312 = _2310 ? 0 : (-1);
    float _2314 = fma(_2020, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2178);
    bool _2316 = uint(_2298) >= uint(_785);
    float _2318 = fma(_2046, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2222);
    int _2320 = _2300 << 4;
    int _2322 = _2320 + 512;
    uint _2324 = uint(int(uint(_2306) >> uint(2)));
    uint _2326 = uint(int(uint(int(_2324)) >> uint(2)));
    int _2328 = int(_2324) & 3;
    float _2330 = (*spvDescriptorSet0.vp_c9)._m0[int(_2326)][_2328];
    int _2332 = int(_2324) + 1;
    uint _2334 = uint(int(uint(_2332) >> uint(2)));
    int _2336 = _2332 & 3;
    float _2338 = (*spvDescriptorSet0.vp_c9)._m0[int(_2334)][_2336];
    float _2340 = fma(_2242, _2308, _2246);
    int _2342 = ~_2088;
    int _2344 = _2342 + _2312;
    int _2346 = _2344 + 1;
    float _2348 = fma(_2046, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2224);
    bool _2350 = !_2148;
    int _2352 = _2350 ? 0 : 1;
    out.m_74.x = _2308;
    out.m_74.y = _2302;
    out.m_74.z = _2314;
    int _2354 = _2256 & 3;
    bool _2356 = _2354 != 0;
    float _2358 = fma(_2242, _2302, _2262);
    uint _2360 = uint(int(uint(_2322) >> uint(2)));
    uint _2362 = uint(int(uint(int(_2360)) >> uint(2)));
    int _2364 = int(_2360) & 3;
    float _2366 = (*spvDescriptorSet0.vp_c9)._m0[int(_2362)][_2364];
    int _2368 = int(_2360) + 1;
    uint _2370 = uint(int(uint(_2368) >> uint(2)));
    int _2372 = _2368 & 3;
    float _2374 = (*spvDescriptorSet0.vp_c9)._m0[int(_2370)][_2372];
    bool _2376 = !_2316;
    int _2378 = _2376 ? 0 : (-1);
    int _2380 = _727 * _2346;
    int _2382 = _2380 + _1664;
    bool _2384 = uint(_2354) > 1u;
    float _2386 = _1916 * _2170;
    int _2388 = _2256 & 3;
    bool _2390 = _2388 != 0;
    int _2392 = ~_2134;
    int _2394 = _2392 + _2378;
    int _2396 = _2394 + 1;
    int _2398 = _2306 + 8;
    uint _2400 = uint(int(uint(_2398) >> uint(2)));
    uint _2402 = uint(int(uint(int(_2400)) >> uint(2)));
    int _2404 = int(_2400) & 3;
    float _2406 = (*spvDescriptorSet0.vp_c9)._m0[int(_2402)][_2404];
    int _2408 = int(_2400) + 1;
    uint _2410 = uint(int(uint(_2408) >> uint(2)));
    int _2412 = _2408 & 3;
    float _2414 = (*spvDescriptorSet0.vp_c9)._m0[int(_2410)][_2412];
    int _2416 = _2390 ? 0 : 1;
    float _2418 = fma(_2242, _2314, _2386);
    bool _2420 = _2146 != 3;
    int _2422 = _785 * _2396;
    int _2424 = _2422 + _1672;
    int _2426 = ~_2416;
    int _2428 = _2426 + 1;
    int _2430 = _2428 + 1;
    float _2432 = _2348 + _2418;
    bool _2434 = !_2356;
    int _2436 = _2434 ? 0 : 1;
    int _2438 = _2322 + 8;
    uint _2440 = uint(int(uint(_2438) >> uint(2)));
    uint _2442 = uint(int(uint(int(_2440)) >> uint(2)));
    int _2444 = int(_2440) & 3;
    float _2446 = (*spvDescriptorSet0.vp_c9)._m0[int(_2442)][_2444];
    int _2448 = int(_2440) + 1;
    uint _2450 = uint(int(uint(_2448) >> uint(2)));
    int _2452 = _2448 & 3;
    float _2454 = (*spvDescriptorSet0.vp_c9)._m0[int(_2450)][_2452];
    int _2456 = _2430;
    if (!_2384)
    {
        int _2458 = ~_2416;
        int _2460 = _2458 + 1;
        _2456 = _2460;
    }
    int _2462 = _2456;
    int _2464 = abs(_2220);
    int _2466 = abs(_2462);
    bool _2468 = _2354 != 3;
    int _2470 = abs(_2352);
    int _2472 = ~_2464;
    int _2474 = _2472 + 1;
    int _2476 = _2474 + 1;
    bool _2478 = uint(_2354) >= 2u;
    int _2480 = abs(_2436);
    int _2482 = ~_2466;
    int _2484 = _2482 + 1;
    int _2486 = _2484 + 1;
    int _2488 = _2476 * as_type<int>(_2338);
    int _2490 = _2478 ? 0 : 1;
    int _2492 = abs(_2288);
    int _2494 = ~_2470;
    int _2496 = _2494 + 1;
    int _2498 = _2496 + 1;
    int _2500 = _2486 * as_type<int>(_2374);
    int _2502 = ~_2490;
    int _2504 = _2502 + 1;
    int _2506 = _2504 + 1;
    int _2508 = _2498 * as_type<int>(_2330);
    int _2510 = _2508 + _2488;
    int _2512 = ~_2492;
    int _2514 = _2512 + 1;
    int _2516 = _2514 + 1;
    float _2518 = fma(_1916, _1916, 1.0);
    int _2520 = _2506;
    if (_2468)
    {
        int _2522 = ~_2490;
        int _2524 = _2522 + 1;
        _2520 = _2524;
    }
    int _2526 = _2520;
    bool _2528 = !_1934;
    int _2530 = _2528 ? 0 : 1;
    int _2532 = _2516 * as_type<int>(_2406);
    int _2534 = _2532 + _2510;
    int _2536 = ~_2480;
    int _2538 = _2536 + 1;
    int _2540 = _2538 + 1;
    float _2542 = rsqrt(_2518);
    int _2544 = abs(_2526);
    bool _2546 = _2354 != 3;
    int _2548 = _2540 * as_type<int>(_2366);
    int _2550 = _2548 + _2500;
    bool _2552 = !_2420;
    int _2554 = _2552 ? 0 : (-1);
    bool _2556 = !_1204;
    int _2558 = _2556 ? 0 : 1;
    int _2560 = abs(_2530);
    bool _2562 = !_2546;
    int _2564 = _2562 ? 0 : (-1);
    int _2566 = abs(_2554);
    int _2568 = abs(_2558);
    int _2570 = ~_2544;
    int _2572 = _2570 + 1;
    int _2574 = _2572 + 1;
    int _2576 = abs(_2564);
    int _2578 = ~_2566;
    int _2580 = _2578 + 1;
    int _2582 = _2580 + 1;
    int _2584 = _2574 * as_type<int>(_2446);
    int _2586 = _2584 + _2550;
    int _2588 = ~_2576;
    int _2590 = _2588 + 1;
    int _2592 = _2590 + 1;
    int _2594 = ~_2560;
    int _2596 = _2594 + 1;
    int _2598 = _2596 + 1;
    int _2600 = _2582 * as_type<int>(_2414);
    int _2602 = _2600 + _2534;
    int _2604 = ~_2568;
    int _2606 = _2604 + 1;
    int _2608 = _2606 + 1;
    int _2610 = _2592 * as_type<int>(_2454);
    int _2612 = _2610 + _2586;
    bool _2614 = !_1686;
    int _2616 = _2614 ? _2424 : (-1);
    int _2618 = _2602 * _2598;
    float _2620 = _1916 * _2542;
    int _2622 = _2612 * _2608;
    bool _2624 = !_1674;
    int _2626 = _2624 ? _2382 : (-1);
    float _2628 = _2258 + _2340;
    float _2630 = -_2258;
    float _2632 = _2620 * _2630;
    int _2634 = _2616 * _2568;
    int _2636 = _2634 + _2622;
    float _2638 = -_2348;
    float _2640 = _2620 * _2638;
    int _2642 = _2626 * _2560;
    int _2644 = _2642 + _2618;
    float _2646 = fma(_2542, _2174, _2632);
    float _2648 = _2318 + _2358;
    float _2650 = -_2318;
    float _2652 = _2620 * _2650;
    float _2654 = fma(_2542, _2170, _2640);
    float _2656 = _2236 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2658 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _2660 = isnan(1.0);
    bool _2662 = _2658 || _2660;
    bool _2664 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _2666 = _2662 || _2664;
    out.m_76.x = _2628;
    out.m_76.y = _2648;
    out.m_76.z = _2432;
    float _2668 = fma(_2542, _2162, _2652);
    float _2670 = _2236 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2672 = _2236 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2674 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2656);
    float _2676 = float(_2644);
    float _2678 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2670);
    float _2680 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2672);
    float _2682 = _2266 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _2684 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2674);
    float _2686 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2678);
    float _2688 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2680);
    float _2690 = fma(_2682, (*spvDescriptorSet0.vp_c12)._m0[4].x, _2048);
    float _2692 = fma(_2682, (*spvDescriptorSet0.vp_c12)._m0[4].y, _2066);
    float _2694 = fma(_2682, (*spvDescriptorSet0.vp_c12)._m0[4].z, _2072);
    float _2696 = float(_2636);
    out.m_78.x = _2646;
    out.m_78.y = _2668;
    out.m_78.z = _2654;
    float _2698 = _2690 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _2700 = _2692 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _2702 = _2694 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _2704 = _2686 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2706 = _2684 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    out.m_80.x = _2676;
    out.m_80.y = _2696;
    float _2708 = _2706 + _2700;
    float _2710 = _2688 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2712 = _2704 + _2698;
    float _2714 = _2710 + _2702;
    float _2716 = _2704;
    float _2718 = _2710;
    float _2720 = _2654;
    float _2722 = _2704;
    float _2724 = _2654;
    float _2726 = _2710;
    float _2728 = _2646;
    float _2730 = _2694;
    float _2740;
    float _2742;
    float _2744;
    float _2746;
    if (!_2666)
    {
        bool _2732 = _2700 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _2734 = !_2732;
        _2736 = _2734;
        if (!_2736)
        {
            float _2738 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _2740 = _2738;
            _2742 = 0.0;
            _2744 = 0.0;
            _2746 = 0.0;
            _2748 = true;
        }
    }
    if ((!_2748) || _2736)
    {
        bool _2786;
        if (!_2736)
        {
            bool _2750 = _2700 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _2752 = isnan(_2700);
            bool _2754 = _2750 || _2752;
            bool _2756 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _2758 = _2754 || _2756;
            bool _2760 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _2762 = !_2758;
            bool _2764 = _2760 && _2762;
            bool _2766 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            float _2768 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_2764)
            {
                _2716 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _2770 = _2716;
            float _2772 = _2770;
            if (_2764)
            {
                _2718 = 0.0;
                _2768 = 0.0;
            }
            float _2774 = _2718;
            float _2776 = _2768;
            _2726 = _2774;
            _2728 = _2776;
            _2742 = _2774;
            _2746 = _2776;
            if (_2764)
            {
                _2720 = 0.0;
            }
            float _2778 = _2720;
            _2724 = _2778;
            _2744 = _2778;
            if (_2764)
            {
                float _2780 = _2770 * 5.0;
                _2772 = _2780;
            }
            float _2782 = _2772;
            bool _2784 = !_2758;
            _2786 = _2784 && _2766;
            _2722 = _2782;
            _2740 = _2782;
        }
        if ((!_2786) || _2736)
        {
            _2736 = false;
            float _2788 = _2722;
            float _2790 = _2724;
            float _2792 = _2726;
            float _2794 = _2728;
            bool _2796 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _2798 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _2800 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _2802 = _2788;
            float _2804 = _2790;
            float _2806 = _2792;
            float _2808 = _2794;
            if (_2796)
            {
                float _2810 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _2802 = _2810;
            }
            float _2812 = _2802;
            if (_2796)
            {
                float _2814 = abs(_2010);
                float _2816 = -_2814;
                float _2818 = _2816 + 1.0;
                _2208 = _2818;
            }
            float _2820 = _2208;
            _2212 = _2820;
            if (_2798)
            {
                float _2822 = abs(_1956);
                float _2824 = -_2822;
                float _2826 = _2824 + 1.0;
                _2210 = _2826;
            }
            float _2828 = _2210;
            _2214 = _2828;
            if (!_2796)
            {
                _2804 = 1.0;
            }
            float _2830 = _2804;
            float _2832 = _2830;
            if (!_2798)
            {
                _2806 = 1.0;
            }
            float _2834 = _2806;
            float _2836 = _2834;
            if (!_2800)
            {
                _2808 = 1.0;
            }
            float _2838 = _2808;
            float _2840 = _2676;
            float _2842 = _2838;
            if (_2798)
            {
                float _2844 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _2840 = _2844;
            }
            float _2846 = _2840;
            float _2848 = _2706;
            if (_2800)
            {
                float _2850 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _2848 = _2850;
            }
            float _2852 = _2848;
            float _2854 = _2812;
            if (_2796)
            {
                float _2856 = _2820 * _2812;
                float _2858 = precise::clamp(_2856, 0.0, 1.0);
                _2832 = _2858;
            }
            float _2860 = _2832;
            if (_2800)
            {
                float _2862 = abs(_2266);
                float _2864 = -_2862;
                float _2866 = _2864 + 1.0;
                _2854 = _2866;
            }
            float _2868 = _2854;
            if (_2798)
            {
                float _2870 = _2828 * _2846;
                float _2872 = precise::clamp(_2870, 0.0, 1.0);
                _2836 = _2872;
            }
            float _2874 = _2836;
            if (_2800)
            {
                float _2876 = _2868 * _2852;
                float _2878 = precise::clamp(_2876, 0.0, 1.0);
                _2842 = _2878;
            }
            float _2880 = _2842;
            float _2882 = _2860 * _2874;
            float _2884 = _2882 * _2880;
            _2740 = _2714;
            _2742 = _2712;
            _2744 = _2708;
            _2746 = _2884;
        }
    }
    _2748 = false;
    float _2886 = _2740;
    float _2888 = _2742;
    float _2890 = _2744;
    float _2892 = _2212;
    float _2894 = _2214;
    float _2896 = _2746;
    float _2898 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2900 = _2886 + _2898;
    float _2902 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2904 = _2888 + _2902;
    float _2906 = _2900 * _2900;
    float _2908 = fma(_2904, _2904, _2906);
    float _2910 = sqrt(_2908);
    bool _2912 = _2910 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _2914 = !_2912;
    float _2916 = _2890;
    float _2918 = _2888;
    float _2920 = _2886;
    float _2922 = _2892;
    float _2924 = _2904;
    float _2926 = _2894;
    if (!_2914)
    {
        float _2928 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2930 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2932 = _2910 + _2930;
        float _2934 = rsqrt(_2908);
        float _2936 = _2932 * _2928;
        float _2938 = _2890 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2940 = _2936 * 0.15915493667125701904296875;
        float _2942 = _2940 * 6.283185482025146484375;
        float _2944 = cos(_2942);
        float _2946 = _2940 * 6.283185482025146484375;
        float _2948 = sin(_2946);
        float _2950 = _2944 + (-1.0);
        float _2952 = fma(_2948, _2938, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2954 = _2950 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2956 = _2934 * _2952;
        float _2958 = fma(_2944, _2890, _2954);
        float _2960 = fma(_2904, _2956, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2962 = fma(_2900, _2956, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2916 = _2958;
        _2918 = _2960;
        _2920 = _2962;
    }
    float _2964 = _2916;
    float _2966 = _2918;
    float _2968 = _2920;
    float _2970 = -_2700;
    float _2972 = _2970 + _2964;
    float _2974 = -_2698;
    float _2976 = _2974 + _2966;
    float _2978 = -_2702;
    float _2980 = _2978 + _2968;
    float _2982 = _2972 * _2972;
    float _2984 = fma(_2976, _2976, _2982);
    float _2986 = fma(_2980, _2980, _2984);
    float _2988 = sqrt(_2986);
    bool _2990 = _2988 > 0.0;
    bool _2992 = !_2990;
    float _2994 = _2988;
    float _2996 = _2966;
    float _2998 = _2968;
    float _3000 = _2964;
    if (!_2992)
    {
        bool _3002 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _3004 = _2690;
        if (_3002)
        {
            float _3006 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _3004 = _3006;
        }
        float _3008 = _3004;
        if (_3002)
        {
            _2922 = _655;
        }
        float _3010 = _2922;
        float _3012 = _3010;
        if (_3002)
        {
            _2924 = _657;
        }
        float _3014 = _2924;
        float _3016 = _3014;
        if (_3002)
        {
            _2994 = _659;
        }
        float _3018 = _2994;
        float _3020 = _3008;
        float _3022 = _3018;
        if (_3002)
        {
            float _3024 = _655 * _3008;
            _2730 = _3024;
        }
        float _3026 = _2730;
        float _3028 = _3026;
        if (_3002)
        {
            float _3030 = _657 * _3008;
            _2926 = _3030;
        }
        float _3032 = _2926;
        float _3034 = _3032;
        if (_3002)
        {
            float _3036 = _659 * _3008;
            _3020 = _3036;
        }
        float _3038 = _3020;
        float _3040 = _3038;
        if (!_3002)
        {
            bool _3042 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _3044 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _3046 = _3042 || _3044;
            bool _3048 = isnan(1.0);
            bool _3050 = _3046 || _3048;
            float _3052 = _119 + 1.0;
            if (!_3050)
            {
                float _3054 = _3052 * _3052;
                float _3056 = _3054 * 0.5;
                _129 = _3056;
            }
            float _3058 = _129;
            float _3060 = _3058;
            if (!_3050)
            {
                float _3062 = _3058 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3060 = _3062;
            }
            float _3064 = _3060;
            bool _3066 = !_3050;
            float _3068 = _3064;
            if (!_3066)
            {
                float _3070 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3072 = log2(_3070);
                float _3074 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3076 = 1.0 + _3074;
                float _3078 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3080 = _3072 * _3052;
                float _3082 = 1.0 / _3076;
                float _3084 = _3078 * 0.693147182464599609375;
                float _3086 = exp2(_3080);
                float _3088 = 1.0 / _3084;
                float _3090 = _3086 + (-1.0);
                float _3092 = -_3090;
                float _3094 = fma(_3092, _3088, _3052);
                float _3096 = _3094 * _3082;
                float _3098 = _3096 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3068 = _3098;
            }
            float _3100 = _3068;
            float _3102 = _3100 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _3104 = _3100 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _3106 = _3102 * _379;
            float _3108 = _3100 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _3110 = _3102 * _357;
            float _3112 = _3102 * _411;
            float _3114 = fma(_3104, _371, _3106);
            float _3116 = _3100;
            if (!_3050)
            {
                _3116 = _3052;
            }
            float _3118 = _3116;
            float _3120 = fma(_3104, _353, _3110);
            float _3122 = fma(_3108, _383, _3114);
            bool _3124 = !_3050;
            float _3126 = _3118;
            if (!_3124)
            {
                float _3128 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3130 = log2(_3128);
                float _3132 = _3130 * _3052;
                float _3134 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3136 = 1.0 + _3134;
                float _3138 = exp2(_3132);
                float _3140 = 1.0 / _3136;
                float _3142 = -_3138;
                float _3144 = _3142 + 1.0;
                float _3146 = _3144 * _3140;
                _3126 = _3146;
            }
            float _3148 = _3126;
            float _3150 = fma(_3104, _407, _3112);
            float _3152 = fma(_3108, _361, _3120);
            float _3154 = fma(_3148, _267, _3122);
            float _3156 = fma(_3108, _415, _3150);
            float _3158 = fma(_3148, _265, _3152);
            float _3160 = -_615;
            float _3162 = _3160 + _3154;
            float _3164 = fma(_3148, _269, _3156);
            float _3166 = -_621;
            float _3168 = _3166 + _3158;
            float _3170 = _3162 * _179;
            float _3172 = _3162 * _173;
            float _3174 = _3162 * _185;
            float _3176 = -_627;
            float _3178 = _3176 + _3164;
            float _3180 = fma(_3168, _177, _3170);
            float _3182 = fma(_3168, _171, _3172);
            float _3184 = fma(_3168, _183, _3174);
            float _3186 = fma(_3178, _181, _3180);
            float _3188 = fma(_3178, _175, _3182);
            float _3190 = fma(_3178, _187, _3184);
            _3016 = _3188;
            _3012 = _3186;
            _3022 = _3190;
            _3028 = _3186;
            _3034 = _3188;
            _3040 = _3190;
        }
        float _3192 = _3016;
        float _3194 = _3012;
        float _3196 = _3022;
        float _3198 = _3028;
        float _3200 = _3034;
        float _3202 = _3040;
        float _3204 = _3192 * _3192;
        float _3206 = rsqrt(_2986);
        float _3208 = fma(_3194, _3194, _3204);
        float _3210 = fma(_3196, _3196, _3208);
        float _3212 = sqrt(_3210);
        float _3214 = _2976 * _3206;
        float _3216 = _2972 * _3206;
        float _3218 = _2980 * _3206;
        bool _3220 = _3212 > 0.0;
        bool _3222 = !_3220;
        _401 = _3212;
        if (!_3222)
        {
            float _3224 = rsqrt(_3210);
            float _3226 = _3224 * _3192;
            float _3228 = _3224 * _3194;
            float _3230 = _3224 * _3196;
            float _3232 = _3216 * _3226;
            float _3234 = fma(_3214, _3228, _3232);
            float _3236 = fma(_3218, _3230, _3234);
            float _3238 = _3236 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3240 = fma(_3198, _3238, _2966);
            float _3242 = fma(_3200, _3238, _2964);
            float _3244 = fma(_3202, _3238, _2968);
            _2996 = _3240;
            _2998 = _3244;
            _3000 = _3242;
            _401 = _3238;
            _403 = _3226;
        }
    }
    float _3246 = _2996;
    float _3248 = _2998;
    float _3250 = _3000;
    float _3252 = _401;
    float _3254 = _403;
    float _3256 = _2700 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _3258 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3260 = isnan(0.5);
    bool _3262 = _3258 || _3260;
    bool _3264 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3266 = _3262 || _3264;
    bool _3268 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3270 = isnan(0.5);
    bool _3272 = _3268 || _3270;
    bool _3274 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3276 = _3272 || _3274;
    float _3278 = fma(_2698, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3256);
    float _3280 = _2700 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3282 = fma(_2702, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3278);
    float _3284 = fma(_2698, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3280);
    float _3286 = _3282 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3288 = fma(_2702, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3284);
    float _3290 = _3252;
    float _3292 = _3254;
    float _3294 = _3246;
    float _3296 = _3282;
    if (_3266)
    {
        _3290 = _3246;
    }
    float _3298 = _3290;
    float _3300 = 1.0 / _3286;
    float _3302 = _3288 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3304 = _3302;
    float _3306 = _3298;
    if (_3266)
    {
        _3292 = _3248;
    }
    float _3308 = _3292;
    float _3310 = _3302 + _3286;
    float _3312 = _3308;
    if (_3266)
    {
        _3304 = _3250;
    }
    float _3314 = _3304;
    float _3316 = _3314;
    if (!_3266)
    {
        float _3318 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3320 = _2700 + _3318;
        float _3322 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3324 = _2698 + _3322;
        float _3326 = -_2698;
        float _3328 = _3326 + _3246;
        float _3330 = -_2700;
        float _3332 = _3330 + _3250;
        float _3334 = _3320 * _3320;
        float _3336 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3338 = _2702 + _3336;
        float _3340 = -_2702;
        float _3342 = _3340 + _3248;
        float _3344 = fma(_3324, _3324, _3334);
        float _3346 = fma(_3338, _3338, _3344);
        float _3348 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3350 = sqrt(_3346);
        float _3352 = precise::min(_3350, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3354 = _3352 * _3348;
        float _3356 = fma(_3328, _3354, _2698);
        float _3358 = fma(_3332, _3354, _2700);
        float _3360 = fma(_3342, _3354, _2702);
        _3316 = _3358;
        _3306 = _3356;
        _3312 = _3360;
        _3294 = _3328;
        _3296 = _3350;
    }
    float _3362 = _3316;
    float _3364 = _3306;
    float _3366 = _3312;
    float _3368 = _3294;
    float _3370 = _3296;
    float _3372 = _3370;
    float _3374 = _3368;
    if (_3276)
    {
        _3372 = 1.0;
    }
    float _3376 = _3372;
    float _3378 = _3310 * _3300;
    float _3380 = _3378 * 0.5;
    float _3382 = _3376;
    if (!_3276)
    {
        float _3384 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3386 = fma(_3380, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3384);
        float _3388 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3390 = _3388 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _3392 = 1.0 / _3386;
        float _3394 = 1.0 / _3390;
        float _3396 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3398 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3400 = fma(_3392, _3396, _3398);
        float _3402 = _3400 * _3394;
        float _3404 = precise::clamp(_3402, 0.0, 1.0);
        _3382 = _3404;
    }
    float _3406 = _3382;
    float _3408 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3410 = _3362 + _3408;
    float _3412 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3414 = _3364 + _3412;
    float _3416 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3418 = _3366 + _3416;
    float _3420 = _3410 * _3410;
    float _3422 = fma(_3414, _3414, _3420);
    float _3424 = fma(_3418, _3418, _3422);
    float _3426 = rsqrt(_3424);
    float _3428 = sqrt(_3424);
    float _3430 = _3426 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3432 = _3414 * _3430;
    float _3434 = _3418 * _3430;
    float _3436 = _3432 * _3432;
    float _3438 = _3434 * _3434;
    float _3440 = _3436 + _3438;
    float _3442 = sqrt(_3440);
    bool _3444 = _3442 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3446 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3448 = _3442 + _3446;
    float _3450 = _3426;
    float _3452 = _3448;
    float _3454 = _3410;
    if (_3444)
    {
        float _3456 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3450 = _3456;
    }
    float _3458 = _3450;
    float _3460 = _3458;
    if (_3444)
    {
        float _3462 = _3448 * _3458;
        _3452 = _3462;
    }
    float _3464 = _3452;
    if (_3444)
    {
        float _3466 = rsqrt(_3440);
        _3460 = _3466;
    }
    float _3468 = _3460;
    float _3470 = _3468;
    if (_3444)
    {
        float _3472 = _3464 * 0.15915493667125701904296875;
        _231 = _3472;
    }
    float _3474 = _231;
    float _3476 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3478 = _3418;
    float _3480 = _3474;
    if (_3444)
    {
        float _3482 = _3474 * 6.283185482025146484375;
        float _3484 = sin(_3482);
        _3478 = _3484;
    }
    float _3486 = _3478;
    float _3488 = precise::max(0.0, _3476);
    float _3490 = _179;
    float _3492 = _3488;
    if (_3444)
    {
        float _3494 = _3474 * 6.283185482025146484375;
        float _3496 = cos(_3494);
        _3490 = _3496;
    }
    float _3498 = _3490;
    float _3500 = -_3430;
    float _3502 = -_3488;
    float _3504 = fma(_3410, _3500, _3502);
    if (_3444)
    {
        float _3506 = _3504 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3454 = _3506;
    }
    float _3508 = _3454;
    float _3510 = _3486;
    float _3512 = _3508;
    if (_3444)
    {
        float _3514 = fma(_3486, _3508, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3510 = _3514;
    }
    float _3516 = _3510;
    float _3518 = _3516;
    if (!_3444)
    {
        _3512 = _3504;
    }
    float _3520 = _3512;
    float _3522 = _3520;
    if (_3444)
    {
        float _3524 = _3468 * _3516;
        _3374 = _3524;
    }
    float _3526 = _3374;
    if (!_3444)
    {
        _3470 = _3432;
    }
    float _3528 = _3470;
    float _3530 = _3528;
    float _3532 = _3498;
    if (_3444)
    {
        float _3534 = _3498 + (-1.0);
        _3492 = _3534;
    }
    float _3536 = _3492;
    float _3538 = _3536;
    if (_3444)
    {
        float _3540 = _3432 * _3526;
        _3530 = _3540;
    }
    float _3542 = _3530;
    if (!_3444)
    {
        _3518 = _3436;
    }
    float _3544 = _3518;
    float _3546 = _3362 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3548 = _3544;
    if (_3444)
    {
        float _3550 = _3536 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3480 = _3550;
    }
    float _3552 = _3480;
    if (!_3444)
    {
        _3538 = _3434;
    }
    float _3554 = _3538;
    float _3556 = _3554;
    if (_3444)
    {
        float _3558 = _3434 * _3526;
        _3556 = _3558;
    }
    float _3560 = _3556;
    if (_3444)
    {
        float _3562 = _3542 * _3542;
        _3548 = _3562;
    }
    float _3564 = _3548;
    if (_3444)
    {
        float _3566 = fma(_3504, _3498, _3552);
        _3522 = _3566;
    }
    float _3568 = _3522;
    if (!_3444)
    {
        _3532 = _3438;
    }
    float _3570 = _3532;
    float _3572 = _3570;
    if (_3444)
    {
        float _3574 = _3560 * _3560;
        _3572 = _3574;
    }
    float _3576 = _3572;
    float _3578 = fma(_3568, _3568, _3564);
    float _3580 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3582 = _3578 + _3576;
    float _3584 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3586 = fma(_3428, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3584);
    float _3588 = precise::clamp(_3586, 0.0, 1.0);
    float _3590 = fma(_3364, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3546);
    float _3592 = _3362 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3594 = rsqrt(_3582);
    float _3596 = -_3588;
    float _3598 = _3596 + 1.0;
    float _3600 = fma(_3366, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3590);
    float _3602 = _3362 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3604 = fma(_3364, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3592);
    float _3606 = _3362 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3608 = _3600 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3610 = fma(_3364, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3602);
    float _3612 = abs(_3598);
    float _3614 = log2(_3612);
    float _3616 = fma(_3366, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3604);
    float _3618 = _3608 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3620 = fma(_3366, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3610);
    float _3622 = fma(_3364, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3606);
    float _3624 = _3616 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3626 = -_3618;
    float _3628 = fma(_3626, _3580, 1.0);
    float _3630 = _3620 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3632 = _3594 * _3542;
    float _3634 = _3624 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3636 = _3594 * _3568;
    float _3638 = fma(_3366, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3622);
    float _3640 = _3632 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3642 = fma(_3630, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3634);
    float _3644 = _3594 * _3560;
    float _3646 = _3638 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3648 = -_3640;
    float _3650 = fma(_3636, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3648);
    float _3652 = _3614 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3654 = fma(_3608, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3642);
    float _3656 = log2(_3628);
    float _3658 = -_3644;
    float _3660 = fma(_3658, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3650);
    float _3662 = _3624 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3664 = fma(_3646, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3654);
    float _3666 = _3624 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3668 = fma(_3660, -0.5, 0.5);
    float _3670 = fma(_3630, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3662);
    float _3672 = fma(_3660, 0.5, 0.5);
    float _3674 = exp2(_3652);
    float _3676 = fma(_3630, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3666);
    float _3678 = _3636 + 1.0;
    float _3680 = fma(_3608, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3670);
    float _3682 = fma(_3608, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3676);
    float _3684 = fma(_3646, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3680);
    float _3686 = 1.0 / _3664;
    float _3688 = fma(_3672, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3690 = _3656 * 0.693147182464599609375;
    float _3692 = fma(_3672, _3688, -0.212114393711090087890625);
    float _3694 = _3690 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3696 = sqrt(_3668);
    float _3698 = -_3636;
    float _3700 = fma(_3674, _3678, _3698);
    float _3702 = fma(_3646, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3682);
    float _3704 = fma(_3672, _3692, 1.570728778839111328125);
    float _3706 = _3684 * _3686;
    float _3708 = _3702 * _3686;
    float _3710 = fma(_3706, 0.5, 0.5);
    float _3712 = fma(_3708, -0.5, 0.5);
    float _3714 = _3696 * 0.636619746685028076171875;
    float3 _9843 = float3(_3710, _3712, _3694);
    float _3716 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9843, float3(0.0), isnan(_9843)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9843, float3(0.0), isnan(_9843)), level(0.0)).x;
    float _3718 = -_3704;
    float _3720 = fma(_3714, _3718, 1.0);
    float _3722 = fma(_3700, 0.5, 0.5);
    float3 _9861 = float3(_3710, _3712, _3694);
    float4 _3725 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9861, float3(0.0), isnan(_9861)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9861, float3(0.0), isnan(_9861)), level(0.0)).xyzw;
    float _3727 = _3725.x;
    float _3729 = _3725.y;
    float _3731 = _3725.z;
    float _3733 = _3725.w;
    float2 _9878 = float2(_3720, _3722);
    float3 _3737 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9878, float2(0.0), isnan(_9878)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9878, float2(0.0), isnan(_9878)), level(0.0)).xyz;
    float _3739 = _3737.x;
    float _3741 = _3737.y;
    float _3743 = _3737.z;
    float _3745 = _2700 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3747 = _2700 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3749 = _2700 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3751 = _2700 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3753 = fma(_2698, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3745);
    float _3755 = fma(_2698, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3747);
    float _3757 = fma(_2698, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3749);
    float _3759 = _3624 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3761 = fma(_2702, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3753);
    float _3763 = fma(_2702, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3755);
    float _3765 = fma(_2698, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3751);
    out.m_82.x = _2698;
    out.m_82.y = _2700;
    out.m_82.z = _2702;
    float _3767 = _3761 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3769 = fma(_2702, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3757);
    float _3771 = _3763 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3773 = fma(_3630, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3759);
    float _3775 = fma(_2702, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3765);
    float _3777 = _3767 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3779 = -_657;
    float _3781 = _3779 + _3362;
    float _3783 = _3767 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3785 = _3769 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3787 = fma(_3771, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3777);
    float _3789 = -_655;
    float _3791 = _3789 + _3364;
    float _3793 = _3767 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3795 = _3767 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    out.m_84.y = 1.0;
    float _3797 = fma(_3771, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3783);
    float _3799 = fma(_3771, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3793);
    float _3801 = fma(_3608, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3773);
    float _3803 = _3781 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _3805 = _3785 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _3807 = _3614 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3809 = -_659;
    float _3811 = _3809 + _3366;
    float _3813 = fma(_3771, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3795);
    float _3815 = _3781 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _3817 = _3781 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _3819 = fma(_3791, (*spvDescriptorSet0.vp_c15)._m0[636].x, _3803);
    float _3821 = _3775 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3823 = _3805 + _3797;
    float _3825 = _3664 * 0.5;
    float _3827 = fma(_3791, (*spvDescriptorSet0.vp_c15)._m0[638].x, _3817);
    float _3829 = exp2(_3807);
    float _3831 = fma(_3821, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3823);
    float _3833 = fma(_3791, (*spvDescriptorSet0.vp_c15)._m0[635].x, _3815);
    float _3835 = fma(_3811, (*spvDescriptorSet0.vp_c15)._m0[638].z, _3827);
    float _3837 = fma(_3785, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3787);
    float _3839 = fma(_3646, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3801);
    float _3841 = fma(_3811, (*spvDescriptorSet0.vp_c15)._m0[635].z, _3833);
    float _3843 = _3835 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _3845 = fma(_3821, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3837);
    float _3847 = fma(_3702, -0.5, _3825);
    float _3849 = _3785 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _3851 = 1.0 / _3831;
    float _3853 = _3841 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _3855 = fma(_3811, (*spvDescriptorSet0.vp_c15)._m0[636].z, _3819);
    float _3857 = _3785 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _3859 = _3849 + _3813;
    float _3861 = -_3829;
    float _3863 = _3861 + 1.0;
    float _3865 = _3839 + _3664;
    out.gl_Position.x = _3684;
    out.gl_Position.y = _3702;
    out.gl_Position.z = _3839;
    out.gl_Position.w = _3664;
    float _3867 = 1.0 / _3843;
    float _3869 = _3863 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3871 = _3684 + _3664;
    out.m_86.x = _3364;
    out.m_86.y = _3362;
    out.m_86.z = _3366;
    float _3873 = _3857 + _3799;
    float _3875 = _3865 * 0.5;
    float _3877 = _3871 * 0.5;
    float _3879 = _3845 * _3851;
    float _3881 = _3855 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _3883 = fma(_3821, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3873);
    float _3885 = fma(_3821, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3859);
    bool _3887 = _3879 > 0.0;
    float _3889 = -_3869;
    float _3891 = _3889 + 1.0;
    out.m_88.x = _3877;
    out.m_88.y = _3847;
    out.m_88.z = _3875;
    out.m_88.w = _3664;
    float _3893 = _3853 * _3867;
    bool _3895 = _3879 < 1.0;
    bool _3897 = _3895 && _3887;
    float _3899 = _3881 * _3867;
    bool _3901 = _3706 > (-1.0);
    bool _3903 = _3901 && _3897;
    bool _3905 = _3708 > (-1.0);
    bool _3907 = _3905 && _3903;
    bool _3909 = _3706 < 1.0;
    bool _3911 = _3909 && _3907;
    float _3913 = _3883 * _3851;
    float _3915 = _3885 * _3851;
    bool _3917 = _3708 < 1.0;
    bool _3919 = _3917 && _3911;
    float _3921 = _3869 * _3716;
    float _3923 = _3733 * _3921;
    float _3925 = _3743 * _3921;
    float _3927 = fma(_3739, _3923, _3727);
    float _3929 = fma(_3741, _3923, _3729);
    float _3931 = _3733 * _3891;
    float _3933 = fma(_3733, _3925, _3731);
    out.m_90.x = _3927;
    out.m_90.y = _3929;
    out.m_90.z = _3933;
    out.m_90.w = _3931;
    bool _3935 = !_3919;
    float _3937 = _3733;
    float _3939 = _3702;
    float _3941 = _3731;
    float _3943 = _3923;
    float _3945 = _3891;
    float _3947 = _3684;
    float _3949 = _3664;
    float _3983;
    if (!_3935)
    {
        float _3951 = -_3915;
        float _3953 = _3708 + _3951;
        float _3955 = -_3913;
        float _3957 = _3706 + _3955;
        float _3959 = _2896 * _3406;
        float _3961 = -_3893;
        float _3963 = _3706 + _3961;
        float _3965 = _3953 * _3953;
        float _3967 = -_3899;
        float _3969 = _3708 + _3967;
        float _3971 = _3959 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
        float _3973 = fma(_3957, _3957, _3965);
        float _3975 = sqrt(_3973);
        bool _3977 = _3975 > 0.0;
        _3941 = _3973;
        _3943 = _3957;
        _3945 = _3975;
        if (!_3977)
        {
            _3937 = _3971;
        }
        float _3979 = _3937;
        bool _3981 = !_3977;
        _3983 = _3979;
        _3985 = _3981;
        if (!_3985)
        {
            float _3987 = _3969 * _3969;
            float _3989 = fma(_3963, _3963, _3987);
            float _3991 = rsqrt(_3973);
            float _3993 = sqrt(_3989);
            float _3995 = _3957 * _3991;
            float _3997 = _3953 * _3991;
            bool _3999 = _3993 > 0.0;
            float _4001 = _3993;
            _3945 = _3991;
            if (!_3999)
            {
                _4001 = _3971;
            }
            float _4003 = _4001;
            bool _4005 = !_3999;
            _3983 = _4003;
            _3985 = _4005;
            if (!_3985)
            {
                float _4007 = _2074 * _3821;
                float _4009 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
                float _4011 = fma(_4007, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3805);
                float _4013 = fma(_4007, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3849);
                float _4015 = fma(_3821, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4011);
                float _4017 = fma(_3821, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4013);
                float _4019 = 1.0 / _4015;
                float _4021 = _4009 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _4023 = fma(_4007, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3857);
                float _4025 = rsqrt(_3989);
                float _4027 = _3969 * _4021;
                float _4029 = fma(_3821, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4023);
                float _4031 = _3963 * _4021;
                float _4033 = _4027 * _4027;
                float _4035 = _4017 * _4019;
                float _4037 = _4029 * _4019;
                float _4039 = fma(_4031, _4031, _4033);
                float _4041 = _4035 * _4035;
                float _4043 = fma(_4037, _4037, _4041);
                float _4045 = sqrt(_4039);
                float _4047 = _3969 * _4025;
                float _4049 = _3963 * _4025;
                float _4051 = _3997 * _4047;
                float _4053 = sqrt(_4043);
                float _4055 = fma(_3995, _4049, _4051);
                float _4057 = precise::min(0.0, _4055);
                float _4059 = _3664 * _4057;
                float _4061 = fma(_4031, _4059, _3684);
                float _4063 = fma(_4045, (*spvDescriptorSet0.vp_c13)._m0[1].x, _4053);
                float _4065 = fma(_4027, _4059, _3702);
                float _4067 = 1.0 / _4063;
                out.gl_Position.x = _4061;
                out.gl_Position.y = _4065;
                float _4069 = _4053 * _4067;
                out.m_84.y = _4069;
                _3939 = _4065;
                _3941 = _4027;
                _3983 = _3971;
                _3943 = _4051;
                _3945 = _4059;
                _3947 = _4061;
                _3985 = true;
            }
        }
    }
    else
    {
        float _4071 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _4071;
        _3983 = 0.0;
        _3947 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    _3985 = false;
    float _4073 = _3939;
    float _4075 = _3941;
    float _4077 = _3983;
    float _4079 = _3943;
    float _4081 = _3945;
    float _4083 = _3947;
    bool _4085 = _3428 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4087 = isnan(_3428);
    bool _4089 = _4085 || _4087;
    bool _4091 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4093 = _4089 || _4091;
    float _4095 = _4079;
    float _4097 = _4075;
    float _4099 = _4081;
    float _4101 = _4073;
    float _4103 = _4083;
    if (!_4093)
    {
        _4095 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4105 = _4095;
    float _4107 = _4105;
    float _4109 = _4105;
    if (!_4093)
    {
        _4097 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4111 = _4097;
    float _4113 = _4111;
    float _4115 = _4111;
    if (!_4093)
    {
        _3949 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4117 = _3949;
    float _4119 = _4117;
    float _4121 = _4117;
    if (!_4093)
    {
        _4099 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4123 = _4099;
    float _4125 = _4123;
    float _4127 = _4123;
    if (!_4093)
    {
        _4101 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4129 = _4101;
    float _4131 = _4129;
    float _4133 = _4129;
    if (!_4093)
    {
        _4103 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4135 = _4103;
    bool _4137 = !_4093;
    float _4139 = _4135;
    float _4141 = _4135;
    if (!_4137)
    {
        bool _4143 = _3428 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4145 = isnan(_3428);
        bool _4147 = _4143 || _4145;
        bool _4149 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4151 = _4147 || _4149;
        if (!_4151)
        {
            float _4153 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4155 = _3428 + _4153;
            float _4157 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4159 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4157;
            float _4161 = 1.0 / _4159;
            float _4163 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4165 = _4163 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4167 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4169 = _4167 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4171 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4173 = _4171 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4175 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4177 = _4175 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4179 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4181 = _4179 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4183 = _4155 * _4161;
            float _4185 = precise::clamp(_4183, 0.0, 1.0);
            float _4187 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4189 = _4187 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4191 = fma(_4185, _4165, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4193 = fma(_4185, _4189, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4195 = fma(_4185, _4169, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4197 = fma(_4185, _4173, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4199 = fma(_4185, _4177, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4201 = fma(_4185, _4181, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4115 = _4193;
            _4133 = _4199;
            _4109 = _4191;
            _4127 = _4197;
            _4121 = _4195;
            _4141 = _4201;
            _4203 = true;
        }
        else
        {
            bool _4205 = _3428 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4207 = isnan(_3428);
            bool _4209 = _4205 || _4207;
            bool _4211 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4213 = _4209 || _4211;
            if (!_4213)
            {
                _4107 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4215 = _4107;
            _4109 = _4215;
            if (!_4213)
            {
                _4113 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4217 = _4113;
            _4115 = _4217;
            if (!_4213)
            {
                _4119 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4219 = _4119;
            _4121 = _4219;
            if (!_4213)
            {
                _4125 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4221 = _4125;
            _4127 = _4221;
            if (!_4213)
            {
                _4131 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4223 = _4131;
            _4133 = _4223;
            if (!_4213)
            {
                _4139 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4225 = _4139;
            bool _4227 = !_4213;
            _4141 = _4225;
            if (!_4227)
            {
                bool _4229 = _3428 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4231 = isnan(_3428);
                bool _4233 = _4229 || _4231;
                bool _4235 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4237 = _4233 || _4235;
                if (!_4237)
                {
                    float _4239 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4241 = _3428 + _4239;
                    float _4243 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4245 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4243;
                    float _4247 = 1.0 / _4245;
                    float _4249 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4251 = _4249 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4253 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4255 = _4253 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4257 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4259 = _4257 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4261 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4263 = _4261 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4265 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4267 = _4265 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4269 = _4241 * _4247;
                    float _4271 = precise::clamp(_4269, 0.0, 1.0);
                    float _4273 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4275 = _4273 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4277 = fma(_4271, _4251, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4279 = fma(_4271, _4275, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4281 = fma(_4271, _4255, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4283 = fma(_4271, _4259, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4285 = fma(_4271, _4263, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4287 = fma(_4271, _4267, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4115 = _4279;
                    _4133 = _4285;
                    _4109 = _4277;
                    _4127 = _4283;
                    _4121 = _4281;
                    _4141 = _4287;
                    _4203 = true;
                }
                else
                {
                    _4115 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4133 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4109 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4127 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4121 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4141 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4203 = false;
    float _4289 = _4115;
    float _4291 = _4133;
    float _4293 = _4109;
    float _4295 = _4127;
    float _4297 = _4121;
    float _4299 = _4141;
    float _4301 = fma(_2648, -0.5, 0.5);
    float _4303 = precise::clamp(_4301, 0.0, 1.0);
    float _4305 = -_4289;
    float _4307 = _4305 + _4291;
    float _4309 = _4077 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4311 = -_4293;
    float _4313 = _4311 + _4295;
    float _4315 = fma(_4303, _4307, _4289);
    out.m_92.x = 0.0;
    float _4317 = -_4297;
    float _4319 = _4317 + _4299;
    float _4321 = fma(_4303, _4313, _4293);
    float _4323 = _4315 * 0.586610972881317138671875;
    out.m_53.x = _4309;
    bool _4325 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4327 = fma(_4303, _4319, _4297);
    float _4329 = fma(_4321, 0.298911988735198974609375, _4323);
    bool _4331 = _3406 > 0.0;
    bool _4333 = isnan(_3406);
    bool _4335 = _4331 || _4333;
    bool _4337 = isnan(0.0);
    bool _4339 = _4335 || _4337;
    float _4341 = fma(_4327, 0.114477999508380889892578125, _4329);
    float _4343 = -_4341;
    float _4345 = _4321 + _4343;
    float _4347 = -_4341;
    float _4349 = _4315 + _4347;
    float _4351 = -_4341;
    float _4353 = _4327 + _4351;
    float _4355 = fma(_4345, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4341);
    float _4357 = fma(_4349, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4341);
    float _4359 = fma(_4353, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4341);
    bool _4361 = !_4325;
    if (!_4361)
    {
        float _4363 = -_3362;
        float _4365 = _4363 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4367 = -_3364;
        float _4369 = _4367 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4371 = -_3366;
        float _4373 = _4371 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4375 = _4365 * _4365;
        float _4377 = fma(_4369, _4369, _4375);
        float _4379 = fma(_4373, _4373, _4377);
        float _4381 = sqrt(_4379);
        float _4383 = rsqrt(_4379);
        float _4385 = -_4381;
        float _4387 = _4385 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4389 = _4387 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4391 = precise::clamp(_4389, 0.0, 1.0);
        float _4393 = _4369 * _4383;
        float _4395 = _4365 * _4383;
        float _4397 = abs(_4391);
        float _4399 = log2(_4397);
        float _4401 = _4373 * _4383;
        float _4403 = _4393 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4405 = _2648 * _4395;
        float _4407 = -_4395;
        float _4409 = -_4403;
        float _4411 = fma(_4407, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4409);
        float _4413 = fma(_2628, _4393, _4405);
        float _4415 = -_4401;
        float _4417 = fma(_4415, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4411);
        float _4419 = fma(_2432, _4401, _4413);
        float _4421 = precise::clamp(_4419, 0.0, 1.0);
        float _4423 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4425 = _4417 + _4423;
        float _4427 = _4399 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4429 = _4425 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4431 = precise::clamp(_4429, 0.0, 1.0);
        float _4433 = exp2(_4427);
        float _4435 = _4433 * _4431;
        float _4437 = _4421 * _4435;
        float _4439 = _4437 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4441 = _4437 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4443 = _4437 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _4439;
        out.m_92.y = _4441;
        out.m_92.z = _4443;
    }
    out.m_94.x = _4355;
    out.m_94.y = _4357;
    out.m_94.z = _4359;
    if (_4339)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _4445 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4445;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

