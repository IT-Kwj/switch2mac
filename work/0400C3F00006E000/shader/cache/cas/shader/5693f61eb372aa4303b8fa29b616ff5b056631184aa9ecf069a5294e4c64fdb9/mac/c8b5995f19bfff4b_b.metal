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
    float4 m_80 [[user(locn0)]];
    float4 m_86 [[user(locn1)]];
    float4 m_74 [[user(locn2)]];
    float4 m_92 [[user(locn3)]];
    float4 m_84 [[user(locn4)]];
    float4 m_90 [[user(locn5)]];
    float4 m_51 [[user(locn6)]];
    float4 m_94 [[user(locn7)]];
    float4 m_72 [[user(locn8)]];
    float4 m_78 [[user(locn9)]];
    float4 m_82 [[user(locn10)]];
    float4 m_88 [[user(locn11)]];
    float4 m_53 [[user(locn12)]];
    float4 m_57 [[user(locn13)]];
    float4 m_76 [[user(locn14)]];
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
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3863 = false;
    bool _3643 = false;
    bool _2728 = false;
    bool _2716 = false;
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
        float _4173 = as_type<float>(_137);
        out.gl_Position.z = _4173;
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
        float _4236 = as_type<float>(_169);
        out.gl_Position.z = _4236;
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
    float _177 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _179 = in.m_61.x;
    float _181 = in.m_61.y;
    float _183 = in.m_61.z;
    float _185 = in.m_63.x;
    float _187 = in.m_63.y;
    float _189 = in.m_63.z;
    float _191 = in.m_48.x;
    float _193 = in.m_48.y;
    float _195 = in.m_48.z;
    float _197 = _171 * _171;
    float _199 = _173 * _173;
    float _201 = fma(_179, _179, _197);
    float _203 = fma(_181, _181, _199);
    float _205 = fma(_185, _185, _201);
    float _207 = _175 * _175;
    float _209 = fma(_187, _187, _203);
    float _211 = sqrt(_205);
    float _213 = fma(_183, _183, _207);
    float _215 = fma(_189, _189, _213);
    float _217 = sqrt(_209);
    float _219 = sqrt(_215);
    bool _221 = _211 > 0.0;
    float _223 = as_type<float>(int(gl_VertexIndex));
    bool _225 = _217 > 0.0;
    float _227 = _205;
    if (_221)
    {
        float _229 = rsqrt(_205);
        _227 = _229;
    }
    float _231 = _227;
    float _233 = 0.0;
    if (!_221)
    {
        _233 = 0.0;
    }
    float _235 = _233;
    bool _237 = _219 > 0.0;
    float _239 = 0.0;
    float _241 = _219;
    float _243 = _235;
    if (!_221)
    {
        _239 = 0.0;
    }
    float _245 = _239;
    float _247 = 0.0;
    float _249 = _245;
    if (!_225)
    {
        _247 = 0.0;
    }
    float _251 = _247;
    float _253 = 0.0;
    float _255 = _251;
    if (_225)
    {
        float _257 = rsqrt(_209);
        _253 = _257;
    }
    float _259 = _253;
    float _261 = 0.0;
    if (!_225)
    {
        _261 = 0.0;
    }
    float _263 = _261;
    float _265 = _263;
    if (!_225)
    {
        _241 = 0.0;
    }
    float _267 = _241;
    int _269 = as_type<int>(_223) & 1;
    bool _271 = _269 != 0;
    int _273 = as_type<int>(_223) & 2;
    bool _275 = _273 != 0;
    bool _277 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _281 = _277 || _279;
    bool _283 = isnan(1.0);
    bool _285 = _281 || _283;
    float _287 = _215;
    float _289 = _223;
    float _291 = _267;
    if (_237)
    {
        float _293 = rsqrt(_215);
        _287 = _293;
    }
    float _295 = _287;
    if (!_221)
    {
        _289 = 0.0;
    }
    float _297 = _289;
    float _299 = _297;
    float _301 = _231;
    if (_221)
    {
        float _303 = _231 * _179;
        _243 = _303;
    }
    float _305 = _243;
    if (_221)
    {
        float _307 = _231 * _171;
        _249 = _307;
    }
    float _309 = _249;
    if (_221)
    {
        float _311 = _231 * _185;
        _299 = _311;
    }
    float _313 = _299;
    float _315 = 0.0;
    if (!_237)
    {
        _315 = 0.0;
    }
    float _317 = _315;
    float _319 = _259;
    float _321 = _317;
    if (_225)
    {
        float _323 = _259 * _181;
        _255 = _323;
    }
    float _325 = _255;
    if (_225)
    {
        float _327 = _259 * _173;
        _265 = _327;
    }
    float _329 = _265;
    if (_225)
    {
        float _331 = _259 * _187;
        _291 = _331;
    }
    float _333 = _291;
    if (!_237)
    {
        _319 = 0.0;
    }
    float _335 = _319;
    float _337 = 0.0;
    float _339 = _335;
    if (!_285)
    {
        float _341 = _177 * _177;
        float _343 = _341 * 0.5;
        _337 = _343;
    }
    float _345 = _337;
    float _347 = _345;
    if (!_237)
    {
        _301 = 0.0;
    }
    float _349 = _301;
    bool _351 = !_271;
    float _353 = _351 ? (-0.5) : 0.5;
    float _355 = _349;
    if (_237)
    {
        float _357 = _295 * _183;
        _339 = _357;
    }
    float _359 = _339;
    if (_237)
    {
        float _361 = _295 * _175;
        _321 = _361;
    }
    float _363 = _321;
    if (_237)
    {
        float _365 = _295 * _189;
        _355 = _365;
    }
    float _367 = _355;
    bool _369 = !_275;
    float _371 = _369 ? (-0.5) : 0.5;
    float _373 = _367;
    if (!_285)
    {
        float _375 = _345 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _347 = _375;
    }
    float _377 = _347;
    bool _379 = !_285;
    float _381 = _377;
    float _383 = 0.0;
    float _385 = 0.0;
    if (!_379)
    {
        float _387 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _389 = log2(_387);
        float _391 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _393 = _391 + 1.0;
        float _395 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _397 = _177 * _389;
        float _399 = 1.0 / _393;
        float _401 = _395 * 0.693147182464599609375;
        float _403 = exp2(_397);
        float _405 = 1.0 / _401;
        float _407 = _403 + (-1.0);
        float _409 = -_407;
        float _411 = fma(_409, _405, _177);
        float _413 = _411 * _399;
        float _415 = _413 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _381 = _415;
        _383 = _413;
        _385 = _399;
    }
    float _417 = _381;
    float _419 = _383;
    float _421 = _385;
    float _423 = _417 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _425 = _421;
    float _427 = _419;
    if (!_285)
    {
        _425 = _177;
    }
    float _429 = _425;
    bool _431 = !_285;
    float _433 = _429;
    if (!_431)
    {
        float _435 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _437 = log2(_435);
        float _439 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _441 = _439 + 1.0;
        float _443 = 1.0 / _441;
        float _445 = _177 * _437;
        float _447 = exp2(_445);
        float _449 = -_447;
        float _451 = _449 + 1.0;
        float _453 = _451 * _443;
        _427 = _443;
        _433 = _453;
    }
    float _455 = _427;
    float _457 = _433;
    float _459 = _417 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _461 = _423 * _309;
    float _463 = _423 * _329;
    float _465 = _423 * _363;
    float _467 = _455;
    if (!_285)
    {
        float _469 = _119 * _119;
        float _471 = _469 * 0.5;
        _467 = _471;
    }
    float _473 = _467;
    float _475 = fma(_459, _305, _461);
    float _477 = fma(_459, _325, _463);
    float _479 = fma(_459, _359, _465);
    float _481 = _473;
    float _483 = _479;
    if (!_285)
    {
        float _485 = _473 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _481 = _485;
    }
    float _487 = _481;
    bool _489 = !_285;
    float _491 = _487;
    if (!_489)
    {
        float _493 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _495 = log2(_493);
        float _497 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _499 = _497 + 1.0;
        float _501 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _503 = _119 * _495;
        float _505 = 1.0 / _499;
        float _507 = _501 * 0.693147182464599609375;
        float _509 = exp2(_503);
        float _511 = 1.0 / _507;
        float _513 = _509 + (-1.0);
        float _515 = -_513;
        float _517 = fma(_515, _511, _119);
        float _519 = _517 * _505;
        float _521 = _519 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _491 = _521;
    }
    float _523 = _491;
    float _525 = in.m_68.w;
    float _527 = _523 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _529 = _417 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _531 = in.m_46.x;
    float _533 = in.m_46.y;
    float _535 = in.m_46.z;
    float _537 = _527 * _329;
    float _539 = _523 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _541 = _527 * _363;
    float _543 = _527 * _309;
    float _545 = _523 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _547 = fma(_539, _325, _537);
    float _549 = fma(_529, _313, _475);
    float _551 = fma(_539, _359, _541);
    float _553 = fma(_529, _333, _477);
    float _555 = fma(_529, _367, _479);
    float _557 = fma(_539, _305, _543);
    float _559 = fma(_545, _333, _547);
    float _561 = fma(_545, _367, _551);
    float _563 = fma(_457, _191, _549);
    float _565 = fma(_457, _193, _553);
    float _567 = fma(_457, _195, _555);
    float _569 = fma(_545, _313, _557);
    float _571 = _543;
    if (!_285)
    {
        _373 = _119;
    }
    float _573 = _373;
    bool _575 = !_285;
    float _577 = _573;
    if (!_575)
    {
        float _579 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _581 = log2(_579);
        float _583 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _585 = _583 + 1.0;
        float _587 = 1.0 / _585;
        float _589 = _119 * _581;
        float _591 = exp2(_589);
        float _593 = -_591;
        float _595 = _593 + 1.0;
        float _597 = _595 * _587;
        _577 = _597;
    }
    float _599 = _577;
    float _601 = fma(_599, _193, _559);
    float _603 = 1.0 / _153;
    bool _605 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _607 = fma(_599, _191, _569);
    float _609 = -_601;
    float _611 = _565 + _609;
    float _613 = fma(_599, _195, _561);
    float _615 = fma(_563, _525, _531);
    float _617 = -_607;
    float _619 = _563 + _617;
    float _621 = _611 * _181;
    float _623 = _611 * _173;
    float _625 = _611 * _187;
    float _627 = -_613;
    float _629 = _567 + _627;
    float _631 = fma(_619, _179, _621);
    float _633 = fma(_619, _171, _623);
    float _635 = fma(_619, _185, _625);
    float _637 = fma(_565, _525, _533);
    float _639 = fma(_629, _183, _631);
    float _641 = fma(_629, _175, _633);
    float _643 = fma(_567, _525, _535);
    float _645 = fma(_629, _189, _635);
    float _647 = _119 * _603;
    bool _649 = !_605;
    float _651 = _647;
    if (!_649)
    {
        float _653 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _655 = _151 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _657 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _659 = _657 * _653;
        float _661 = floor(_659);
        float _663 = -_661;
        float _665 = _659 + _663;
        _651 = _665;
    }
    float _667 = _651;
    float _669 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _671 = int(_669);
    float _673 = _637 * _181;
    float _675 = _637 * _173;
    float _677 = _637 * _187;
    float _679 = _151 * 2.0;
    float _681 = fma(_615, _179, _673);
    float _683 = fma(_615, _171, _675);
    float _685 = fma(_615, _185, _677);
    float _687 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _689 = int(_687);
    float _691 = _163 * 2.0;
    float _693 = in.m_55.w;
    float _695 = fma(_643, _189, _685);
    float _697 = _151 + _163;
    float _699 = float(_671);
    float _701 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _703 = int(_701);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _705;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _711 = _709 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _713 = in.m_63.w;
    float _715 = _697 + (-1.0);
    float _717 = _155 + _163;
    float _719 = float(_689);
    float _721 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _723 = int(_721);
    float _725 = _717 + (-1.0);
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _727;
    float _731 = float(uint(_703));
    float _733 = 1.0 / _699;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _735;
    float _739 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _741 = 1.0 / _719;
    float _743 = float(uint(_723));
    float _745 = _695 + _713;
    int _747 = ~_723;
    int _749 = _747 + 1;
    float _751 = _733 * _119;
    float _753 = 1.0 / _731;
    float _755 = _155 * 2.0;
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _759 = _757 != 0;
    float _761 = _741 * _119;
    float _763 = 1.0 / _743;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _767 = _765 != 0;
    int _769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _771 = _769 != 0;
    int _773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _775 = _773 != 0;
    bool _777 = _151 > 0.5;
    int _779 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _781 = _779 != 0;
    float _783 = -_353;
    int _785 = _777 ? as_type<int>(_783) : as_type<int>(_353);
    float _787 = trunc(_751);
    int _789 = int(_787);
    int _791 = as_type<int>(_753) + (-2);
    bool _793 = !_781;
    float _795 = _793 ? _353 : as_type<float>(_785);
    bool _797 = !_771;
    int _799 = _797 ? 0 : 1;
    bool _801 = !_775;
    int _803 = _801 ? 0 : 1;
    float _805 = trunc(_761);
    int _807 = int(_805);
    int _809 = as_type<int>(_763) + (-2);
    bool _811 = !_767;
    int _813 = _811 ? 0 : 1;
    bool _815 = _163 > 0.5;
    bool _817 = _155 > 0.5;
    float _819 = floor(_679);
    float _821 = float(uint(_789));
    float _823 = -_371;
    int _825 = _817 ? as_type<int>(_823) : as_type<int>(_371);
    int _827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _829 = _827 != 0;
    float _831 = as_type<float>(_809) * _821;
    float _833 = 0.0;
    int _835 = _825;
    if (_759)
    {
        _833 = 1.0;
    }
    float _837 = _833;
    float _839 = floor(_755);
    float _841 = float(uint(_807));
    float _843 = 0.0;
    float _845 = _837;
    if (_759)
    {
        _843 = _151;
    }
    float _847 = _843;
    float _849 = 0.0;
    float _851 = _847;
    if (_759)
    {
        _849 = 1.0;
    }
    float _853 = _849;
    float _855 = as_type<float>(_791) * _841;
    float _857 = _853;
    if (!_759)
    {
        _845 = 7.345489978790283203125;
    }
    float _859 = _845;
    float _861 = trunc(_831);
    float _863 = precise::max(_861, 0.0);
    uint _866 = uint(_863);
    float _868 = -_353;
    int _870 = _815 ? as_type<int>(_868) : as_type<int>(_353);
    bool _872 = _819 > 0.0;
    bool _874 = _819 >= 0.0;
    bool _876 = isnan(_819);
    bool _878 = _874 || _876;
    bool _880 = isnan(0.0);
    bool _882 = _878 || _880;
    int _884 = ~_703;
    int _886 = _884 + 1;
    float _888 = trunc(_855);
    float _890 = precise::max(_888, 0.0);
    uint _892 = uint(_890);
    bool _894 = _839 > 0.0;
    if (!_759)
    {
        _851 = _155;
    }
    float _896 = _851;
    if (!_759)
    {
        _857 = 1.2345600128173828125;
    }
    float _898 = _857;
    int _900 = abs(_799);
    int _902 = _749 * int(_866);
    int _904 = _902 + _789;
    int _906 = ~_703;
    int _908 = _906 + 1;
    float _910 = floor(_691);
    float _912 = _896 * _898;
    bool _914 = _667 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _916 = isnan(_667);
    bool _918 = _914 || _916;
    bool _920 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _922 = _918 || _920;
    float _924 = float(_922);
    float _926 = float(uint(_904));
    int _928 = _908 * int(_892);
    int _930 = _928 + _807;
    float _932 = -_924;
    float _934 = _932 + 1.0;
    float _936 = 1.0 / _707;
    float _938 = as_type<float>(_809) * _926;
    int _940 = abs(_803);
    float _942 = float(uint(_930));
    float _944 = trunc(_938);
    float _946 = precise::max(_944, 0.0);
    uint _948 = uint(_946);
    float _950 = as_type<float>(_791) * _942;
    int _952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _954 = _952 != 0;
    int _956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _958 = _956 != 0;
    bool _960 = !_954;
    int _962 = _960 ? 0 : 1;
    float _964 = trunc(_950);
    float _966 = precise::max(_964, 0.0);
    uint _968 = uint(_966);
    bool _970 = _839 >= 0.0;
    bool _972 = isnan(_839);
    bool _974 = _970 || _972;
    bool _976 = isnan(0.0);
    bool _978 = _974 || _976;
    bool _980 = !_958;
    float _982 = _980 ? _371 : as_type<float>(_825);
    int _984 = _882 ? 0 : 1;
    int _986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _988 = _986 != 0;
    float _990 = 1.0 / _711;
    int _992 = _978 ? 0 : 1;
    if (_759)
    {
        _835 = 0;
    }
    int _994 = _835;
    bool _996 = _910 > 0.0;
    int _998 = _994;
    if (!_759)
    {
        _998 = 1;
    }
    int _1000 = _998;
    float _1002 = 1.0 / _729;
    int _1004 = ~_984;
    int _1006 = _1004 + 1;
    int _1008 = _1006 + 1;
    int _1010 = ~_992;
    int _1012 = _1010 + 1;
    int _1014 = _1012 + 1;
    int _1016 = int(_892) + int(_968);
    bool _1018 = !_988;
    float _1020 = _1018 ? _353 : as_type<float>(_870);
    int _1022 = _1008;
    int _1024 = _1014;
    if (!_872)
    {
        int _1026 = ~_984;
        int _1028 = _1026 + 1;
        _1022 = _1028;
    }
    int _1030 = _1022;
    if (!_894)
    {
        int _1032 = ~_992;
        int _1034 = _1032 + 1;
        _1024 = _1034;
    }
    int _1036 = _1024;
    int _1038 = int(_866) + int(_948);
    float _1040 = _151 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1042 = _910 >= 0.0;
    bool _1044 = isnan(_910);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan(0.0);
    bool _1050 = _1046 || _1048;
    int _1052 = _886 * _1016;
    int _1054 = _1052 + _807;
    bool _1056 = _1000 != 1;
    int _1058 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1060 = _1058 != 0;
    int _1062 = ~_723;
    int _1064 = _1062 + 1;
    bool _1066 = _693 > 0.5;
    bool _1068 = !_829;
    int _1070 = _1068 ? 0 : 1;
    int _1072 = _1064 * _1038;
    int _1074 = _1072 + _789;
    bool _1076 = !_1060;
    int _1078 = _1076 ? 0 : 1;
    float _1080 = -_371;
    int _1082 = _1066 ? as_type<int>(_1080) : as_type<int>(_371);
    int _1084 = _1050 ? 0 : 1;
    int _1086 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1088 = _1086 != 0;
    int _1090 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1092 = _1090 != 0;
    int _1094 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1096 = _1094 != 0;
    int _1098 = ~_1084;
    int _1100 = _1098 + 1;
    int _1102 = _1100 + 1;
    int _1104 = _1102;
    float _1106 = as_type<float>(_1054);
    if (!_996)
    {
        int _1108 = ~_1084;
        int _1110 = _1108 + 1;
        _1104 = _1110;
    }
    int _1112 = _1104;
    bool _1114 = !_1092;
    int _1116 = _1114 ? 0 : 1;
    bool _1118 = uint(_1054) >= uint(_703);
    bool _1120 = uint(_1074) >= uint(_723);
    int _1122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1124 = _1122 != 0;
    if (!_1056)
    {
        _571 = _155;
    }
    float _1126 = _571;
    float _1128 = _1126;
    if (!_1056)
    {
        _483 = _155;
    }
    float _1130 = _483;
    float _1132 = 0.0;
    float _1134 = _1130;
    if (!_1056)
    {
        _1132 = _163;
    }
    float _1136 = _1132;
    float _1138 = _1136;
    if (!_1056)
    {
        _1106 = _163;
    }
    float _1140 = _1106;
    float _1142 = _1140;
    if (_1056)
    {
        _1128 = _151;
    }
    float _1144 = _1128;
    if (_1056)
    {
        _1134 = _151;
    }
    float _1146 = _1134;
    if (_1056)
    {
        _1138 = _155;
    }
    float _1148 = _1138;
    float _1150 = _1144 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1056)
    {
        _1142 = _155;
    }
    float _1152 = _1142;
    bool _1154 = !_1118;
    int _1156 = _1154 ? 0 : (-1);
    bool _1158 = !_1120;
    int _1160 = _1158 ? 0 : (-1);
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1164 = _1162 != 0;
    int _1166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1168 = _1166 != 0;
    int _1170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1172 = _1170 != 0;
    int _1174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1176 = _1174 != 0;
    float _1178 = fma(_643, _183, _681);
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1182 = fma(_643, _175, _683);
    float _1184 = in.m_61.w;
    float _1186 = -_1180;
    float _1188 = fma(_1040, 2.0, _1186);
    float _1190 = _151 + _155;
    float _1192 = in.m_59.w;
    float _1194 = _155 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1198 = _1190 + (-1.0);
    float _1200 = -_119;
    float _1202 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1188);
    bool _1204 = !_1088;
    int _1206 = _1204 ? 0 : 1;
    float _1208 = fma(_1194, -2.0, _1196);
    float _1210 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1212 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1216 = _667 + _1214;
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1220 = _667 + _1218;
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1224 = _667 + _1222;
    bool _1226 = !_1096;
    int _1228 = _1226 ? 0 : 1;
    float _1230 = _1216 * _936;
    float _1232 = _1220 * _990;
    float _1234 = _1224 * _1002;
    float _1236 = _1178 + _1184;
    int _1238 = abs(_1116);
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1240;
    float _1244 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1246 = _1244 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1248 = _1182 + _1192;
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1252 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1250;
    float _1254 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1256 = _1254 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1258;
    float _1262 = _1248 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _1264 = fma(_1252, _1230, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1266 = fma(_1242, _1230, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _1268 = _667 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1270 = isnan(_667);
    bool _1272 = _1268 || _1270;
    bool _1274 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1276 = _1272 || _1274;
    float _1278 = float(_1276);
    float _1280 = fma(_1256, _1232, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _1282 = _667 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1284 = isnan(_667);
    bool _1286 = _1282 || _1284;
    bool _1288 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1290 = _1286 || _1288;
    float _1292 = float(_1290);
    float _1294 = _859 * _151;
    float _1296 = fma(_1246, _1232, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1298 = -_1278;
    float _1300 = _1298 + 1.0;
    bool _1302 = _667 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1304 = isnan(_667);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1310 = _1306 || _1308;
    float _1312 = float(_1310);
    float _1314 = floor(_1294);
    float _1316 = -_1292;
    float _1318 = _1316 + 1.0;
    float _1320 = _924 * _1300;
    float _1322 = _1292 * _934;
    float _1324 = fma(_1260, _1234, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1326 = _1312 * _1318;
    float _1328 = fma(_737, _1234, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1330 = -_1312;
    float _1332 = _1330 + 1.0;
    float _1334 = floor(_912);
    float _1336 = _795 + 0.5;
    float _1338 = _1264 * _1326;
    float _1340 = _1266 * _1326;
    float _1342 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1208);
    float _1344 = _982 + (-0.5);
    float _1346 = _1236 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _1348 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1202);
    float _1350 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1338);
    float _1352 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1340);
    float _1354 = -_1344;
    float _1356 = -_1342;
    float _1358 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1356);
    float _1360 = -_1314;
    float _1362 = _1294 + _1360;
    float _1364 = fma(_1280, _1322, _1350);
    float _1366 = fma(_1296, _1322, _1352);
    float _1368 = float(_807);
    float _1370 = _603 * _119;
    float _1372 = -_1334;
    float _1374 = _912 + _1372;
    float _1376 = _1262 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _1378 = float(_723);
    float _1380 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1382 = log2(_1380);
    float _1384 = float(_789);
    float _1386 = fma(_1346, (*spvDescriptorSet0.vp_c12)._m0[6].x, _1376);
    float _1388 = float(_703);
    float _1390 = _1262 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _1392 = _1262 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    bool _1394 = _1368 >= _1388;
    bool _1396 = isnan(_1368);
    bool _1398 = _1394 || _1396;
    bool _1400 = isnan(_1388);
    bool _1402 = _1398 || _1400;
    float _1404 = float(_1402);
    float _1406 = _1362 * _1388;
    float _1408 = _1388 * _1370;
    float _1410 = _1378 * _1370;
    bool _1412 = _1384 >= _1378;
    bool _1414 = isnan(_1384);
    bool _1416 = _1412 || _1414;
    bool _1418 = isnan(_1378);
    bool _1420 = _1416 || _1418;
    float _1422 = float(_1420);
    float _1424 = _1374 * _1378;
    float _1426 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1428 = fma(_1324, _1320, _1364);
    float _1430 = fma(_1328, _1320, _1366);
    float _1432 = fma(_1346, (*spvDescriptorSet0.vp_c12)._m0[6].y, _1390);
    float _1434 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1426);
    float _1436 = fma(_1346, (*spvDescriptorSet0.vp_c12)._m0[6].z, _1392);
    float _1438 = _1382 * _119;
    float _1440 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    int _1442 = abs(_1206);
    float _1444 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1446 = _745 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _1448 = float(_1112);
    float _1450 = fma(_1278, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1428);
    float _1452 = -_1444;
    float _1454 = fma(_1150, 2.0, _1452);
    int _1456 = abs(_1228);
    float _1458 = exp2(_1438);
    float _1460 = float(_1030);
    float _1462 = fma(_1446, (*spvDescriptorSet0.vp_c12)._m0[8].x, _1386);
    float _1464 = fma(_1446, (*spvDescriptorSet0.vp_c12)._m0[8].y, _1432);
    float _1466 = float(_1442);
    float _1468 = fma(_1446, (*spvDescriptorSet0.vp_c12)._m0[8].z, _1436);
    float _1470 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1472 = float(_1238);
    float _1474 = _1466 * _1448;
    float _1476 = _1462 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _1478 = _1148 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1480 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1482 = _1472 * _1460;
    float _1484 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1486 = 1.0 + _1484;
    float _1488 = _1476 * _1440;
    float _1490 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1492 = fma(_1478, -2.0, _1480);
    float _1494 = _1468 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _1496 = _1464 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _1498 = fma(_1278, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1430);
    bool _1500 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1502 = isnan(0.0);
    bool _1504 = _1500 || _1502;
    bool _1506 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1508 = _1504 || _1506;
    float _1510 = _1474 * (-2.0);
    float _1512 = 1.0 / _1486;
    float _1514 = -_119;
    float _1516 = fma(_1514, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1454);
    float _1518 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1434);
    float _1520 = float(_1036);
    float _1522 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1524 = float(_1456);
    float _1526 = _1496 * _1490;
    float _1528 = -_1458;
    float _1530 = _1528 + 1.0;
    float _1532 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1534 = !_1124;
    float _1536 = _1534 ? _371 : as_type<float>(_1082);
    float _1538 = trunc(_1424);
    int _1540 = int(_1538);
    float _1542 = in.m_70.x;
    float _1544 = in.m_70.y;
    float _1546 = in.m_70.z;
    float _1548 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1532);
    float _1550 = _1494 * _1470;
    float _1552 = _1508 ? _1530 : 0.0;
    float _1554 = in.m_68.x;
    float _1556 = in.m_68.y;
    bool _1558 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1560 = isnan(1.0);
    bool _1562 = _1558 || _1560;
    bool _1564 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1566 = _1562 || _1564;
    float _1568 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1570 = trunc(_1404);
    int _1572 = int(_1570);
    float _1574 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1522);
    float _1576 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1492);
    float _1578 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1568);
    float _1580 = fma(_1210, _1510, _1210);
    float _1582 = _163 + (-0.5);
    int _1584 = ~_1016;
    int _1586 = _1584 + _1156;
    int _1588 = _1586 + 1;
    float _1590 = _1524 * _1520;
    float _1592 = trunc(_1422);
    int _1594 = int(_1592);
    int _1596 = abs(_1078);
    float _1598 = _1020 + 0.5;
    int _1600 = ~_1038;
    int _1602 = _1600 + _1160;
    int _1604 = _1602 + 1;
    float _1606 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1578);
    float _1608 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1548);
    float _1610 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1574);
    if (_1566)
    {
        float _1612 = _1552 * _1512;
        _129 = _1612;
    }
    float _1614 = _129;
    float _1616 = trunc(_1406);
    int _1618 = int(_1616);
    int _1620 = _703 * _1588;
    int _1622 = _1620 + _807;
    float _1624 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1516);
    int _1626 = _1540 * _1596;
    int _1628 = _1626 + _789;
    bool _1630 = _703 == 0;
    float _1632 = _1450 * _1554;
    int _1634 = abs(_962);
    int _1636 = _723 * _1604;
    int _1638 = _1636 + _789;
    float _1640 = _1590 * (-2.0);
    bool _1642 = !_1168;
    int _1644 = _1642 ? 0 : 1;
    float _1646 = _1482 * (-2.0);
    bool _1648 = _723 == 0;
    float _1650 = fma(_1510, _1542, _1542);
    int _1652 = ~_1572;
    int _1654 = _1652 + 1;
    int _1656 = _1654 + 1;
    float _1658 = fma(_1212, _1640, _1212);
    bool _1660 = !_1630;
    int _1662 = _1660 ? _1622 : (-1);
    float _1664 = _1536 + (-0.5);
    float _1666 = fma(_739, _1646, _739);
    float _1668 = _151 + (-0.5);
    int _1670 = ~_1594;
    int _1672 = _1670 + 1;
    int _1674 = _1672 + 1;
    float _1676 = trunc(_1408);
    int _1678 = int(_1676);
    bool _1680 = !_1648;
    int _1682 = _1680 ? _1638 : (-1);
    float _1684 = fma(_1646, _1544, _1544);
    float _1686 = _155 + (-0.5);
    int _1688 = _1618 * _1634;
    int _1690 = _1688 + _807;
    float _1692 = -_1664;
    float _1694 = -_1576;
    float _1696 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1694);
    int _1698 = _1662 * _1656;
    int _1700 = _703 + (-1);
    float _1702 = fma(_1640, _1546, _1546);
    int _1704 = _723 + (-1);
    float _1706 = fma(_1686, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1684);
    int _1708 = _1682 * _1674;
    float _1710 = trunc(_1410);
    int _1712 = int(_1710);
    int _1714 = abs(_813);
    float _1716 = fma(_1668, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1650);
    int _1718 = abs(_1644);
    float _1720 = fma(_1582, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1702);
    int _1722 = _1572 * _1700;
    int _1724 = _1722 + _1698;
    float _1726 = fma(_1666, _1614, _1706);
    int _1728 = _1594 * _1704;
    int _1730 = _1728 + _1708;
    bool _1732 = !_1164;
    int _1734 = _1732 ? 0 : 1;
    float _1736 = fma(_1580, _1614, _1716);
    int _1738 = _1724 * _900;
    float _1740 = fma(_1658, _1614, _1720);
    int _1742 = _1730 * _1718;
    bool _1744 = !_1172;
    int _1746 = _1744 ? 0 : 1;
    float _1748 = _1726 * 0.15915493667125701904296875;
    int _1750 = abs(_1734);
    int _1752 = _1678 * _1714;
    int _1754 = _1752 + _1738;
    float _1756 = fma(_1488, 0.5, 0.5);
    int _1758 = abs(_1070);
    float _1760 = -_1606;
    float _1762 = _1760 + 1.0;
    int _1764 = abs(_1746);
    int _1766 = _1690 * _940;
    int _1768 = _1766 + _1754;
    float _1770 = floor(_1756);
    bool _1772 = !_1176;
    int _1774 = _1772 ? 0 : 1;
    int _1776 = _1618 * _1758;
    int _1778 = _1776 + _1768;
    float _1780 = float(uint(_1690));
    int _1782 = _1712 * _1750;
    int _1784 = _1782 + _1742;
    float _1786 = -_1608;
    float _1788 = _1786 + 1.0;
    int _1790 = abs(_1774);
    float _1792 = as_type<float>(_791) * _1780;
    float _1794 = float(uint(_1628));
    int _1796 = _1628 * _1764;
    int _1798 = _1796 + _1784;
    float _1800 = fma(_982, _1788, _1358);
    float _1802 = float(uint(_1778));
    float _1804 = trunc(_1792);
    float _1806 = precise::max(_1804, 0.0);
    uint _1808 = uint(_1806);
    float _1810 = as_type<float>(_809) * _1794;
    int _1812 = _1540 * _1790;
    int _1814 = _1812 + _1798;
    int _1816 = ~_703;
    int _1818 = _1816 + 1;
    float _1820 = as_type<float>(_791) * _1802;
    float _1822 = -_1762;
    float _1824 = fma(_795, _1822, _1348);
    float _1826 = _1498 * _1556;
    float _1828 = float(uint(_1814));
    float _1830 = trunc(_1810);
    float _1832 = precise::max(_1830, 0.0);
    uint _1834 = uint(_1832);
    int _1836 = ~_703;
    int _1838 = _1836 + 1;
    float _1840 = fma(_1526, 0.5, 0.5);
    float _1842 = _1736 * 0.15915493667125701904296875;
    float _1844 = as_type<float>(_809) * _1828;
    int _1846 = ~_723;
    int _1848 = _1846 + 1;
    float _1850 = fma(_1550, 0.5, 0.5);
    float _1852 = _1740 * 0.15915493667125701904296875;
    float _1854 = trunc(_1820);
    float _1856 = precise::max(_1854, 0.0);
    uint _1858 = uint(_1856);
    int _1860 = _1818 * int(_1808);
    int _1862 = _1860 + _1690;
    float _1864 = -_1610;
    float _1866 = _1864 + 1.0;
    float _1868 = -_1770;
    float _1870 = _1756 + _1868;
    float _1872 = _1826 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1874 = _1632 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1876 = float(uint(_1862));
    float _1878 = trunc(_1844);
    float _1880 = precise::max(_1878, 0.0);
    uint _1882 = uint(_1880);
    int _1884 = ~_723;
    int _1886 = _1884 + 1;
    int _1888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1890 = _1888 != 0;
    int _1892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1894 = _1892 != 0;
    int _1896 = _1886 * int(_1834);
    int _1898 = _1896 + _1628;
    bool _1900 = !_1890;
    int _1902 = _1900 ? 0 : 1;
    float _1904 = _1748 * 6.283185482025146484375;
    float _1906 = sin(_1904);
    float _1908 = float(uint(_1898));
    float _1910 = _1748 * 6.283185482025146484375;
    float _1912 = cos(_1910);
    int _1914 = _1848 * int(_1882);
    int _1916 = _1914 + _1814;
    float _1918 = as_type<float>(_809) * _1908;
    float _1920 = floor(_1840);
    float _1922 = as_type<float>(_791) * _1876;
    int _1924 = _1838 * int(_1858);
    int _1926 = _1924 + _1778;
    float _1928 = float(uint(_1916));
    float _1930 = float(uint(_1926));
    float _1932 = _1842 * 6.283185482025146484375;
    float _1934 = sin(_1932);
    float _1936 = as_type<float>(_809) * _1928;
    float _1938 = as_type<float>(_791) * _1930;
    float _1940 = _1842 * 6.283185482025146484375;
    float _1942 = cos(_1940);
    float _1944 = -_1920;
    float _1946 = _1840 + _1944;
    float _1948 = fma(_1946, 2.0, -1.0);
    float _1950 = floor(_1850);
    float _1952 = -_1518;
    float _1954 = _1952 + 1.0;
    float _1956 = -_1866;
    float _1958 = fma(_1020, _1956, _1624);
    float _1960 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _371);
    float _1962 = _1934 * _1906;
    float _1964 = fma(_1536, _1954, _1696);
    float _1966 = _1934 * _1912;
    float _1968 = _1872 * _1960;
    float _1970 = _1852 * 6.283185482025146484375;
    float _1972 = cos(_1970);
    float _1974 = _1942 * _1912;
    out.m_72.x = _1824;
    out.m_72.y = _1800;
    out.m_72.z = _1958;
    out.m_72.w = _1964;
    float _1976 = fma(_1870, 2.0, -1.0);
    float _1978 = _1852 * 6.283185482025146484375;
    float _1980 = sin(_1978);
    float _1982 = -_1950;
    float _1984 = _1850 + _1982;
    float _1986 = trunc(_1922);
    float _1988 = precise::max(_1986, 0.0);
    uint _1990 = uint(_1988);
    float _1992 = _1934 * _1972;
    float _1994 = _1942 * _1906;
    float _1996 = _1942 * _1972;
    float _1998 = _1948 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _2000 = _1912 * _1972;
    float _2002 = _1906 * _1972;
    float _2004 = _1996 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2006 = trunc(_1918);
    float _2008 = precise::max(_2006, 0.0);
    uint _2010 = uint(_2008);
    float _2012 = _1998 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _2014 = _1998 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _2016 = -_1980;
    float _2018 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2004);
    float _2020 = _1998 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _2022 = trunc(_1938);
    float _2024 = precise::max(_2022, 0.0);
    uint _2026 = uint(_2024);
    float _2028 = -_1994;
    float _2030 = fma(_1980, _1966, _2028);
    float _2032 = -_1966;
    float _2034 = fma(_1980, _1994, _2032);
    float _2036 = fma(_1980, _1974, _1962);
    int _2038 = int(_1808) + int(_1990);
    float _2040 = fma(_1980, _1962, _1974);
    float _2042 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _353);
    float _2044 = trunc(_1936);
    float _2046 = precise::max(_2044, 0.0);
    uint _2048 = uint(_2046);
    float _2050 = _1976 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    int _2052 = int(_1834) + int(_2010);
    float _2054 = _1874 * _2042;
    int _2056 = ~_703;
    int _2058 = _2056 + 1;
    float _2060 = fma(_2050, (*spvDescriptorSet0.vp_c12)._m0[2].x, _2012);
    int _2062 = ~_723;
    int _2064 = _2062 + 1;
    float _2066 = -_1968;
    float _2068 = _1980 * _2066;
    int _2070 = int(_1858) + int(_2026);
    float _2072 = _1996 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2074 = fma(_2050, (*spvDescriptorSet0.vp_c12)._m0[2].y, _2014);
    float _2076 = fma(_2000, _2054, _2068);
    float _2078 = fma(_2050, (*spvDescriptorSet0.vp_c12)._m0[2].z, _2020);
    int _2080 = _2058 * _2070;
    int _2082 = _2080 + _1778;
    float _2084 = -_1980;
    float _2086 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2072);
    int _2088 = int(_1882) + int(_2048);
    float _2090 = _1996 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2092 = _1996 * _1968;
    float _2094 = _1992 * _1968;
    bool _2096 = uint(_2082) >= uint(_703);
    float _2098 = -_1980;
    float _2100 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2090);
    float _2102 = fma(_2036, _2054, _2092);
    float _2104 = fma(_2030, _2054, _2094);
    int _2106 = _2064 * _2088;
    int _2108 = _2106 + _1814;
    bool _2110 = !_2096;
    int _2112 = _2110 ? 0 : (-1);
    float _2114 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2018);
    float _2116 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2086);
    float _2118 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _2120 = uint(_2108) >= uint(_723);
    float _2122 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2100);
    int _2124 = ~_2070;
    int _2126 = _2124 + _2112;
    int _2128 = _2126 + 1;
    float _2130 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2132 = !_2120;
    int _2134 = _2132 ? 0 : (-1);
    float _2136 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2138 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2140 = _703 * _2128;
    int _2142 = _2140 + _1778;
    int _2144 = ~_2088;
    int _2146 = _2144 + _2134;
    int _2148 = _2146 + 1;
    float _2150 = fma(_2002, _2118, _2076);
    float _2152 = _2034 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2154 = _2034 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2156 = _2034 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2158 = !_1630;
    int _2160 = _2158 ? _2142 : (-1);
    float _2162 = fma(_2000, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2130);
    float _2164 = fma(_2000, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2136);
    float _2166 = fma(_2000, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2138);
    float _2168 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2152);
    float _2170 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2154);
    float _2172 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2156);
    int _2174 = _723 * _2148;
    int _2176 = _2174 + _1814;
    float _2178 = fma(_2034, _2118, _2102);
    int _2180 = _2160 >> 31;
    float _2182 = fma(_2040, _2118, _2104);
    int _2184 = ~_703;
    int _2186 = _2184 + 1;
    float _2188 = _353 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2190 = _2160 & 3;
    bool _2192 = _2190 != 0;
    float _2194 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2170);
    int _2196 = _2180 & 3;
    float _2198 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2168);
    bool _2200 = !_1648;
    int _2202 = _2200 ? _2176 : (-1);
    float _2204 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2172);
    bool _2206 = uint(_2190) > 1u;
    int _2208 = _2202 >> 31;
    int _2210 = _2186 * _2038;
    int _2212 = _2210 + _1690;
    int _2214 = _2160 & 3;
    bool _2216 = _2214 != 0;
    int _2218 = _2160 + _2196;
    int _2220 = _2208 & 3;
    int _2222 = _2216 ? 0 : 1;
    bool _2224 = uint(_2212) >= uint(_703);
    int _2226 = ~_723;
    int _2228 = _2226 + 1;
    int _2230 = _2202 + _2220;
    int _2232 = ~_2222;
    int _2234 = _2232 + 1;
    int _2236 = _2234 + 1;
    int _2238 = _2228 * _2052;
    int _2240 = _2238 + _1628;
    int _2242 = _2218 >> 2;
    int _2244 = _2236;
    float _2246 = _1976;
    float _2248 = _1948;
    float _2250 = _2182;
    float _2252 = _2122;
    if (!_2206)
    {
        int _2254 = ~_2222;
        int _2256 = _2254 + 1;
        _2244 = _2256;
    }
    int _2258 = _2244;
    int _2260 = _2230 >> 2;
    bool _2262 = uint(_2190) >= 2u;
    int _2264 = _2242 << 4;
    int _2266 = _2264 + 368;
    float _2268 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2162);
    int _2270 = _2260 << 4;
    int _2272 = _2270 + 512;
    float _2274 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2164);
    int _2276 = _2262 ? 0 : 1;
    uint _2278 = uint(int(uint(_2266) >> uint(2)));
    uint _2280 = uint(int(uint(int(_2278)) >> uint(2)));
    int _2282 = int(_2278) & 3;
    float _2284 = (*spvDescriptorSet0.vp_c9)._m0[int(_2280)][_2282];
    int _2286 = int(_2278) + 1;
    uint _2288 = uint(int(uint(_2286) >> uint(2)));
    int _2290 = _2286 & 3;
    float _2292 = (*spvDescriptorSet0.vp_c9)._m0[int(_2288)][_2290];
    bool _2294 = uint(_2240) >= uint(_723);
    float _2296 = _371 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2298 = !_2224;
    int _2300 = _2298 ? 0 : (-1);
    float _2302 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2166);
    bool _2304 = _2190 != 3;
    float _2306 = _2296 * _2114;
    int _2308 = ~_2038;
    int _2310 = _2308 + _2300;
    int _2312 = _2310 + 1;
    uint _2314 = uint(int(uint(_2272) >> uint(2)));
    uint _2316 = uint(int(uint(int(_2314)) >> uint(2)));
    int _2318 = int(_2314) & 3;
    float _2320 = (*spvDescriptorSet0.vp_c9)._m0[int(_2316)][_2318];
    int _2322 = int(_2314) + 1;
    uint _2324 = uint(int(uint(_2322) >> uint(2)));
    int _2326 = _2322 & 3;
    float _2328 = (*spvDescriptorSet0.vp_c9)._m0[int(_2324)][_2326];
    bool _2330 = !_2294;
    int _2332 = _2330 ? 0 : (-1);
    float _2334 = _2296 * _2116;
    int _2336 = ~_2276;
    int _2338 = _2336 + 1;
    int _2340 = _2338 + 1;
    float _2342 = fma(_2188, _2268, _2306);
    int _2344 = ~_2052;
    int _2346 = _2344 + _2332;
    int _2348 = _2346 + 1;
    out.m_74.x = _2268;
    out.m_74.y = _2274;
    out.m_74.z = _2302;
    float _2350 = fma(_2188, _2274, _2334);
    int _2352 = _2266 + 8;
    uint _2354 = uint(int(uint(_2352) >> uint(2)));
    uint _2356 = uint(int(uint(int(_2354)) >> uint(2)));
    int _2358 = int(_2354) & 3;
    float _2360 = (*spvDescriptorSet0.vp_c9)._m0[int(_2356)][_2358];
    int _2362 = int(_2354) + 1;
    uint _2364 = uint(int(uint(_2362) >> uint(2)));
    int _2366 = _2362 & 3;
    float _2368 = (*spvDescriptorSet0.vp_c9)._m0[int(_2364)][_2366];
    bool _2370 = !_2192;
    int _2372 = _2370 ? 0 : 1;
    int _2374 = _723 * _2348;
    int _2376 = _2374 + _1628;
    int _2378 = _2340;
    if (_2304)
    {
        int _2380 = ~_2276;
        int _2382 = _2380 + 1;
        _2378 = _2382;
    }
    int _2384 = _2378;
    int _2386 = _703 * _2312;
    int _2388 = _2386 + _1690;
    int _2390 = _2202 & 3;
    bool _2392 = _2390 != 0;
    float _2394 = _2296 * _2122;
    int _2396 = _2202 & 3;
    bool _2398 = _2396 != 0;
    bool _2400 = uint(_2390) > 1u;
    int _2402 = _2272 + 8;
    uint _2404 = uint(int(uint(_2402) >> uint(2)));
    uint _2406 = uint(int(uint(int(_2404)) >> uint(2)));
    int _2408 = int(_2404) & 3;
    float _2410 = (*spvDescriptorSet0.vp_c9)._m0[int(_2406)][_2408];
    int _2412 = int(_2404) + 1;
    uint _2414 = uint(int(uint(_2412) >> uint(2)));
    int _2416 = _2412 & 3;
    float _2418 = (*spvDescriptorSet0.vp_c9)._m0[int(_2414)][_2416];
    int _2420 = _2398 ? 0 : 1;
    float _2422 = fma(_2188, _2302, _2394);
    bool _2424 = !_2392;
    int _2426 = _2424 ? 0 : 1;
    int _2428 = ~_2420;
    int _2430 = _2428 + 1;
    int _2432 = _2430 + 1;
    float _2434 = _2204 + _2422;
    int _2436 = abs(_2258);
    int _2438 = abs(_2372);
    bool _2440 = uint(_2390) >= 2u;
    int _2442 = _2432;
    if (!_2400)
    {
        int _2444 = ~_2420;
        int _2446 = _2444 + 1;
        _2442 = _2446;
    }
    int _2448 = _2442;
    bool _2450 = _2390 != 3;
    int _2452 = abs(_2448);
    int _2454 = abs(_2426);
    int _2456 = ~_2436;
    int _2458 = _2456 + 1;
    int _2460 = _2458 + 1;
    int _2462 = ~_2452;
    int _2464 = _2462 + 1;
    int _2466 = _2464 + 1;
    int _2468 = _2460 * as_type<int>(_2292);
    int _2470 = _2440 ? 0 : 1;
    int _2472 = abs(_2384);
    int _2474 = _2466 * as_type<int>(_2328);
    int _2476 = ~_2438;
    int _2478 = _2476 + 1;
    int _2480 = _2478 + 1;
    int _2482 = ~_2454;
    int _2484 = _2482 + 1;
    int _2486 = _2484 + 1;
    int _2488 = ~_2470;
    int _2490 = _2488 + 1;
    int _2492 = _2490 + 1;
    int _2494 = _2480 * as_type<int>(_2284);
    int _2496 = _2494 + _2468;
    bool _2498 = _2390 != 3;
    int _2500 = _2486 * as_type<int>(_2320);
    int _2502 = _2500 + _2474;
    int _2504 = _2492;
    if (_2450)
    {
        int _2506 = ~_2470;
        int _2508 = _2506 + 1;
        _2504 = _2508;
    }
    int _2510 = _2504;
    float _2512 = fma(_2296, _2296, 1.0);
    int _2514 = ~_2472;
    int _2516 = _2514 + 1;
    int _2518 = _2516 + 1;
    bool _2520 = _2190 != 3;
    float _2522 = rsqrt(_2512);
    bool _2524 = !_2498;
    int _2526 = _2524 ? 0 : (-1);
    int _2528 = _2518 * as_type<int>(_2360);
    int _2530 = _2528 + _2496;
    int _2532 = abs(_2510);
    bool _2534 = !_2520;
    int _2536 = _2534 ? 0 : (-1);
    int _2538 = abs(_1902);
    bool _2540 = !_1894;
    int _2542 = _2540 ? 0 : 1;
    int _2544 = abs(_2526);
    int _2546 = abs(_2536);
    int _2548 = abs(_2542);
    int _2550 = ~_2532;
    int _2552 = _2550 + 1;
    int _2554 = _2552 + 1;
    int _2556 = ~_2546;
    int _2558 = _2556 + 1;
    int _2560 = _2558 + 1;
    int _2562 = _2554 * as_type<int>(_2410);
    int _2564 = _2562 + _2502;
    int _2566 = _2560 * as_type<int>(_2368);
    int _2568 = _2566 + _2530;
    int _2570 = ~_2544;
    int _2572 = _2570 + 1;
    int _2574 = _2572 + 1;
    int _2576 = ~_2538;
    int _2578 = _2576 + 1;
    int _2580 = _2578 + 1;
    int _2582 = ~_2548;
    int _2584 = _2582 + 1;
    int _2586 = _2584 + 1;
    int _2588 = _2574 * as_type<int>(_2418);
    int _2590 = _2588 + _2564;
    bool _2592 = !_1630;
    int _2594 = _2592 ? _2388 : (-1);
    int _2596 = _2568 * _2580;
    bool _2598 = !_1648;
    int _2600 = _2598 ? _2376 : (-1);
    float _2602 = _2296 * _2522;
    int _2604 = _2590 * _2586;
    bool _2606 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _2608 = isnan(1.0);
    bool _2610 = _2606 || _2608;
    bool _2612 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _2614 = _2610 || _2612;
    int _2616 = _2594 * _2538;
    int _2618 = _2616 + _2596;
    float _2620 = -_2198;
    float _2622 = _2602 * _2620;
    float _2624 = -_2194;
    float _2626 = _2602 * _2624;
    float _2628 = -_2204;
    float _2630 = _2602 * _2628;
    int _2632 = _2600 * _2548;
    int _2634 = _2632 + _2604;
    float _2636 = fma(_2522, _2114, _2622);
    float _2638 = fma(_2522, _2116, _2626);
    float _2640 = fma(_2522, _2122, _2630);
    float _2642 = _2198 + _2342;
    float _2644 = _2194 + _2350;
    float _2646 = float(_2618);
    float _2648 = _2178 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2650 = float(_2634);
    out.m_76.x = _2636;
    out.m_76.y = _2638;
    out.m_76.z = _2640;
    float _2652 = _2178 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2654 = fma(_1984, 2.0, -1.0);
    float _2656 = _2178 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_78.x = _2646;
    out.m_78.y = _2650;
    float _2658 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2648);
    float _2660 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2652);
    float _2662 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2656);
    out.m_80.x = _2642;
    out.m_80.y = _2644;
    out.m_80.z = _2434;
    float _2664 = _2654 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _2666 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2658);
    float _2668 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2660);
    float _2670 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2662);
    float _2672 = fma(_2664, (*spvDescriptorSet0.vp_c12)._m0[4].x, _2060);
    float _2674 = fma(_2664, (*spvDescriptorSet0.vp_c12)._m0[4].y, _2074);
    float _2676 = fma(_2664, (*spvDescriptorSet0.vp_c12)._m0[4].z, _2078);
    float _2678 = _2666 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2680 = _2672 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _2682 = _2674 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _2684 = _2676 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _2686 = _2668 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2688 = _2670 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2690 = _2678 + _2680;
    float _2692 = _2686 + _2682;
    float _2694 = _2688 + _2684;
    float _2696 = as_type<float>(_2538);
    float _2698 = _2646;
    float _2700 = _2650;
    float _2702 = _2668;
    float _2704 = _2686;
    float _2706 = _2668;
    float _2708 = _2638;
    float _2710 = _2636;
    float _2720;
    float _2722;
    float _2724;
    float _2726;
    if (!_2614)
    {
        bool _2712 = _2682 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _2714 = !_2712;
        _2716 = _2714;
        if (!_2716)
        {
            float _2718 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _2720 = _2718;
            _2722 = 0.0;
            _2724 = 0.0;
            _2726 = 0.0;
            _2728 = true;
        }
    }
    if ((!_2728) || _2716)
    {
        bool _2764;
        if (!_2716)
        {
            bool _2730 = _2682 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _2732 = isnan(_2682);
            bool _2734 = _2730 || _2732;
            bool _2736 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _2738 = _2734 || _2736;
            bool _2740 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _2742 = !_2738;
            bool _2744 = _2740 && _2742;
            bool _2746 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            _2704 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_2744)
            {
                _2696 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _2748 = _2696;
            float _2750 = _2748;
            if (_2744)
            {
                _2698 = 0.0;
                _2700 = 0.0;
            }
            float _2752 = _2698;
            float _2754 = _2700;
            _2722 = _2752;
            _2724 = _2754;
            if (_2744)
            {
                _2702 = 0.0;
            }
            float _2756 = _2702;
            _2706 = _2756;
            _2726 = _2756;
            if (_2744)
            {
                float _2758 = _2748 * 5.0;
                _2750 = _2758;
            }
            float _2760 = _2750;
            bool _2762 = !_2738;
            _2764 = _2762 && _2746;
            _2720 = _2760;
        }
        if ((!_2764) || _2716)
        {
            _2716 = false;
            float _2766 = _2704;
            float _2768 = _2706;
            bool _2770 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _2772 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _2774 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _2776 = _2678;
            float _2778 = _2766;
            float _2780 = _2768;
            _2720 = _2694;
            _2722 = _2690;
            _2724 = _2692;
            if (_2770)
            {
                float _2782 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _2776 = _2782;
            }
            float _2784 = _2776;
            if (_2770)
            {
                float _2786 = abs(_1976);
                float _2788 = -_2786;
                float _2790 = _2788 + 1.0;
                _2246 = _2790;
            }
            float _2792 = _2246;
            if (_2772)
            {
                float _2794 = abs(_1948);
                float _2796 = -_2794;
                float _2798 = _2796 + 1.0;
                _2248 = _2798;
            }
            float _2800 = _2248;
            if (!_2770)
            {
                _2708 = 1.0;
            }
            float _2802 = _2708;
            float _2804 = _2802;
            if (_2774)
            {
                float _2806 = abs(_2654);
                float _2808 = -_2806;
                float _2810 = _2808 + 1.0;
                _2710 = _2810;
            }
            float _2812 = _2710;
            if (!_2772)
            {
                _2778 = 1.0;
            }
            float _2814 = _2778;
            float _2816 = _2814;
            if (!_2774)
            {
                _2780 = 1.0;
            }
            float _2818 = _2780;
            float _2820 = _2640;
            float _2822 = _2818;
            if (_2772)
            {
                float _2824 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _2820 = _2824;
            }
            float _2826 = _2820;
            float _2828 = _2194;
            if (_2774)
            {
                float _2830 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _2828 = _2830;
            }
            float _2832 = _2828;
            if (_2770)
            {
                float _2834 = _2792 * _2784;
                float _2836 = precise::clamp(_2834, 0.0, 1.0);
                _2804 = _2836;
            }
            float _2838 = _2804;
            if (_2772)
            {
                float _2840 = _2800 * _2826;
                float _2842 = precise::clamp(_2840, 0.0, 1.0);
                _2816 = _2842;
            }
            float _2844 = _2816;
            float _2846 = _2838 * _2844;
            if (_2774)
            {
                float _2848 = _2812 * _2832;
                float _2850 = precise::clamp(_2848, 0.0, 1.0);
                _2822 = _2850;
            }
            float _2852 = _2822;
            float _2854 = _2846 * _2852;
            _2726 = _2854;
        }
    }
    _2728 = false;
    float _2856 = _2720;
    float _2858 = _2722;
    float _2860 = _2724;
    float _2862 = _2726;
    float _2864 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2866 = _2856 + _2864;
    float _2868 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2870 = _2858 + _2868;
    float _2872 = _2682 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2874 = _2866 * _2866;
    bool _2876 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2878 = isnan(0.5);
    bool _2880 = _2876 || _2878;
    bool _2882 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2884 = _2880 || _2882;
    float _2886 = fma(_2680, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2872);
    bool _2888 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2890 = isnan(0.5);
    bool _2892 = _2888 || _2890;
    bool _2894 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2896 = _2892 || _2894;
    float _2898 = fma(_2870, _2870, _2874);
    float _2900 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2886);
    float _2902 = _2682 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2904 = sqrt(_2898);
    float _2906 = _2900 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2908 = fma(_2680, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2902);
    float _2910 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2908);
    float _2912 = 1.0 / _2906;
    float _2914 = _2910 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2916 = _2914 + _2906;
    bool _2918 = _2904 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2920 = _2916 * _2912;
    float _2922 = _2920 * 0.5;
    bool _2924 = !_2918;
    float _2926 = _2858;
    float _2928 = _2860;
    float _2930 = _2856;
    float _2932 = _2912;
    float _2934 = _2866;
    if (!_2924)
    {
        float _2936 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2938 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2940 = _2904 + _2938;
        float _2942 = _2860 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2944 = rsqrt(_2898);
        float _2946 = _2940 * _2936;
        float _2948 = _2946 * 0.15915493667125701904296875;
        float _2950 = _2948 * 6.283185482025146484375;
        float _2952 = cos(_2950);
        float _2954 = _2948 * 6.283185482025146484375;
        float _2956 = sin(_2954);
        float _2958 = _2952 + (-1.0);
        float _2960 = _2958 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2962 = fma(_2956, _2942, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2964 = fma(_2952, _2860, _2960);
        float _2966 = _2944 * _2962;
        float _2968 = fma(_2870, _2966, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2970 = fma(_2866, _2966, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2926 = _2968;
        _2928 = _2964;
        _2930 = _2970;
        _2932 = _2966;
    }
    float _2972 = _2926;
    float _2974 = _2928;
    float _2976 = _2930;
    float _2978 = _2932;
    float _2980 = _2974;
    float _2982 = _2972;
    float _2984 = _2976;
    float _2986 = _2978;
    if (_2896)
    {
        _2250 = 1.0;
    }
    float _2988 = _2250;
    float _2990 = _2988;
    if (!_2884)
    {
        float _2992 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2994 = _2682 + _2992;
        float _2996 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2998 = _2680 + _2996;
        float _3000 = _2994 * _2994;
        float _3002 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3004 = _2684 + _3002;
        float _3006 = fma(_2998, _2998, _3000);
        float _3008 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3010 = fma(_3004, _3004, _3006);
        float _3012 = -_2680;
        float _3014 = _3012 + _2972;
        float _3016 = sqrt(_3010);
        float _3018 = precise::min(_3016, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3020 = _3018 * _3008;
        float _3022 = -_2682;
        float _3024 = _3022 + _2974;
        float _3026 = -_2684;
        float _3028 = _3026 + _2976;
        float _3030 = fma(_3014, _3020, _2680);
        float _3032 = fma(_3024, _3020, _2682);
        float _3034 = fma(_3028, _3020, _2684);
        _2980 = _3032;
        _2982 = _3030;
        _2984 = _3034;
        _2986 = _3020;
    }
    float _3036 = _2980;
    float _3038 = _2982;
    float _3040 = _2984;
    float _3042 = _2986;
    if (!_2896)
    {
        float _3044 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3046 = fma(_2922, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3044);
        float _3048 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3050 = _3048 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _3052 = 1.0 / _3046;
        float _3054 = 1.0 / _3050;
        float _3056 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3058 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3060 = fma(_3052, _3056, _3058);
        float _3062 = _3060 * _3054;
        float _3064 = precise::clamp(_3062, 0.0, 1.0);
        _2990 = _3064;
    }
    float _3066 = _2990;
    float _3068 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3070 = _3036 + _3068;
    float _3072 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3074 = _3038 + _3072;
    float _3076 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3078 = _3040 + _3076;
    float _3080 = _3070 * _3070;
    float _3082 = fma(_3074, _3074, _3080);
    float _3084 = fma(_3078, _3078, _3082);
    float _3086 = rsqrt(_3084);
    float _3088 = sqrt(_3084);
    float _3090 = _3086 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3092 = _3074 * _3090;
    float _3094 = _3078 * _3090;
    float _3096 = _3092 * _3092;
    float _3098 = _3094 * _3094;
    float _3100 = _3096 + _3098;
    float _3102 = sqrt(_3100);
    bool _3104 = _3102 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3106 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3108 = _3102 + _3106;
    float _3110 = _3086;
    float _3112 = _3108;
    float _3114 = _3070;
    float _3116 = _3092;
    if (_3104)
    {
        float _3118 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3110 = _3118;
    }
    float _3120 = _3110;
    float _3122 = _3120;
    if (_3104)
    {
        float _3124 = _3108 * _3120;
        _3112 = _3124;
    }
    float _3126 = _3112;
    if (_3104)
    {
        float _3128 = rsqrt(_3100);
        _3122 = _3128;
    }
    float _3130 = _3122;
    float _3132 = _3130;
    if (_3104)
    {
        float _3134 = _3126 * 0.15915493667125701904296875;
        _2934 = _3134;
    }
    float _3136 = _2934;
    float _3138 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3140 = _3078;
    if (_3104)
    {
        float _3142 = _3136 * 6.283185482025146484375;
        float _3144 = sin(_3142);
        _3140 = _3144;
    }
    float _3146 = _3140;
    float _3148 = precise::max(0.0, _3138);
    float _3150 = _3042;
    float _3152 = _3148;
    if (_3104)
    {
        float _3154 = _3136 * 6.283185482025146484375;
        float _3156 = cos(_3154);
        _3150 = _3156;
    }
    float _3158 = _3150;
    float _3160 = -_3090;
    float _3162 = -_3148;
    float _3164 = fma(_3070, _3160, _3162);
    if (_3104)
    {
        float _3166 = _3164 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3114 = _3166;
    }
    float _3168 = _3114;
    float _3170 = _3146;
    float _3172 = _3168;
    if (_3104)
    {
        float _3174 = fma(_3146, _3168, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3170 = _3174;
    }
    float _3176 = _3170;
    float _3178 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3180 = _3176;
    if (_3104)
    {
        float _3182 = _3130 * _3176;
        _2252 = _3182;
    }
    float _3184 = _2252;
    if (!_3104)
    {
        _3132 = _3164;
    }
    float _3186 = _3132;
    float _3188 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3178);
    float _3190 = _3186;
    if (_3104)
    {
        float _3192 = _3158 + (-1.0);
        _3152 = _3192;
    }
    float _3194 = _3152;
    float _3196 = _3194;
    if (_3104)
    {
        float _3198 = _3092 * _3184;
        _3116 = _3198;
    }
    float _3200 = _3116;
    if (!_3104)
    {
        _3180 = _3094;
    }
    float _3202 = _3180;
    float _3204 = _3202;
    if (_3104)
    {
        float _3206 = _3094 * _3184;
        _3204 = _3206;
    }
    float _3208 = _3204;
    if (_3104)
    {
        float _3210 = _3194 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3172 = _3210;
    }
    float _3212 = _3172;
    float _3214 = _3212;
    if (!_3104)
    {
        _3196 = _3096;
    }
    float _3216 = _3196;
    float _3218 = _3216;
    if (_3104)
    {
        float _3220 = _3200 * _3200;
        _3218 = _3220;
    }
    float _3222 = _3218;
    float _3224 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_3104)
    {
        float _3226 = fma(_3164, _3158, _3212);
        _3190 = _3226;
    }
    float _3228 = _3190;
    if (!_3104)
    {
        _3214 = _3098;
    }
    float _3230 = _3214;
    float _3232 = _3230;
    if (_3104)
    {
        float _3234 = _3208 * _3208;
        _3232 = _3234;
    }
    float _3236 = _3232;
    float _3238 = fma(_3228, _3228, _3222);
    float _3240 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3224);
    float _3242 = _3238 + _3236;
    float _3244 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3246 = fma(_3088, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3244);
    float _3248 = precise::clamp(_3246, 0.0, 1.0);
    float _3250 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3252 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3188);
    float _3254 = rsqrt(_3242);
    float _3256 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3258 = -_3248;
    float _3260 = _3258 + 1.0;
    float _3262 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3250);
    float _3264 = _3252 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3266 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3256);
    float _3268 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3270 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3240);
    float _3272 = abs(_3260);
    float _3274 = log2(_3272);
    float _3276 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3262);
    float _3278 = _3264 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3280 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3266);
    float _3282 = _3276 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3284 = -_3278;
    float _3286 = fma(_3284, _3268, 1.0);
    float _3288 = _3280 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3290 = _3270 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3292 = _3254 * _3200;
    float _3294 = _3282 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3296 = _3254 * _3228;
    float _3298 = _3254 * _3208;
    float _3300 = _3292 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3302 = fma(_3288, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3294);
    float _3304 = log2(_3286);
    float _3306 = _3274 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3308 = -_3300;
    float _3310 = fma(_3296, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3308);
    float _3312 = fma(_3264, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3302);
    float _3314 = _3296 + 1.0;
    float _3316 = -_3298;
    float _3318 = fma(_3316, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3310);
    float _3320 = fma(_3290, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3312);
    float _3322 = _3282 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3324 = _3282 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3326 = fma(_3318, -0.5, 0.5);
    float _3328 = 1.0 / _3320;
    float _3330 = fma(_3318, 0.5, 0.5);
    float _3332 = fma(_3288, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3322);
    float _3334 = fma(_3288, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3324);
    float _3336 = fma(_3330, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3338 = fma(_3264, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3332);
    float _3340 = fma(_3264, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3334);
    float _3342 = exp2(_3306);
    float _3344 = fma(_3330, _3336, -0.212114393711090087890625);
    float _3346 = fma(_3290, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3338);
    float _3348 = fma(_3290, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3340);
    float _3350 = _3304 * 0.693147182464599609375;
    float _3352 = fma(_3330, _3344, 1.570728778839111328125);
    float _3354 = sqrt(_3326);
    float _3356 = _3346 * _3328;
    float _3358 = _3348 * _3328;
    float _3360 = _3350 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3362 = fma(_3356, 0.5, 0.5);
    float _3364 = fma(_3358, -0.5, 0.5);
    float _3366 = -_3296;
    float _3368 = fma(_3342, _3314, _3366);
    float _3370 = fma(_3368, 0.5, 0.5);
    float _3372 = _3354 * 0.636619746685028076171875;
    float _3374 = -_3352;
    float _3376 = fma(_3372, _3374, 1.0);
    float3 _9041 = float3(_3362, _3364, _3360);
    float _3378 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9041, float3(0.0), isnan(_9041)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9041, float3(0.0), isnan(_9041)), level(0.0)).x;
    float3 _9052 = float3(_3362, _3364, _3360);
    float4 _3381 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9052, float3(0.0), isnan(_9052)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9052, float3(0.0), isnan(_9052)), level(0.0)).xyzw;
    float _3383 = _3381.x;
    float _3385 = _3381.y;
    float _3387 = _3381.z;
    float _3389 = _3381.w;
    float2 _9069 = float2(_3376, _3370);
    float3 _3393 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9069, float2(0.0), isnan(_9069)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9069, float2(0.0), isnan(_9069)), level(0.0)).xyz;
    float _3395 = _3393.x;
    float _3397 = _3393.y;
    float _3399 = _3393.z;
    float _3401 = _2682 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3403 = _2682 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3405 = _2682 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3407 = _2682 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3409 = fma(_2680, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3401);
    float _3411 = fma(_2680, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3403);
    out.m_82.x = _2680;
    out.m_82.y = _2682;
    out.m_82.z = _2684;
    float _3413 = fma(_2680, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3405);
    float _3415 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3409);
    float _3417 = fma(_2680, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3407);
    out.m_84.y = 1.0;
    float _3419 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3411);
    float _3421 = _3415 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3423 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3413);
    float _3425 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3417);
    float _3427 = _3419 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3429 = -_645;
    float _3431 = _3429 + _3040;
    float _3433 = _3282 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3435 = -_641;
    float _3437 = _3435 + _3036;
    float _3439 = -_639;
    float _3441 = _3439 + _3038;
    float _3443 = _3421 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3445 = _3421 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3447 = _3437 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _3449 = _3421 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3451 = _3421 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3453 = _3423 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3455 = fma(_3441, (*spvDescriptorSet0.vp_c15)._m0[638].x, _3447);
    float _3457 = fma(_3427, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3443);
    float _3459 = fma(_3427, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3445);
    float _3461 = fma(_3427, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3449);
    float _3463 = fma(_3427, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3451);
    float _3465 = fma(_3431, (*spvDescriptorSet0.vp_c15)._m0[638].z, _3455);
    float _3467 = _3437 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _3469 = _3437 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _3471 = _3453 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _3473 = _3465 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _3475 = fma(_3288, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3433);
    float _3477 = _3425 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3479 = _3471 + _3463;
    float _3481 = _3274 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3483 = fma(_3264, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3475);
    float _3485 = 1.0 / _3473;
    float _3487 = fma(_3477, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3479);
    float _3489 = fma(_3441, (*spvDescriptorSet0.vp_c15)._m0[635].x, _3467);
    float _3491 = fma(_3441, (*spvDescriptorSet0.vp_c15)._m0[636].x, _3469);
    float _3493 = fma(_3453, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3461);
    float _3495 = fma(_3290, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3483);
    float _3497 = fma(_3431, (*spvDescriptorSet0.vp_c15)._m0[635].z, _3489);
    float _3499 = _3453 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _3501 = exp2(_3481);
    float _3503 = fma(_3477, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3493);
    float _3505 = fma(_3431, (*spvDescriptorSet0.vp_c15)._m0[636].z, _3491);
    float _3507 = _3497 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _3509 = _3499 + _3457;
    float _3511 = _3320 * 0.5;
    float _3513 = _3505 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _3515 = _3453 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _3517 = 1.0 / _3487;
    float _3519 = _3507 * _3485;
    out.gl_Position.x = _3346;
    out.gl_Position.y = _3348;
    out.gl_Position.z = _3495;
    out.gl_Position.w = _3320;
    float _3521 = _3495 + _3320;
    float _3523 = _3346 + _3320;
    float _3525 = fma(_3477, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3509);
    float _3527 = fma(_3348, -0.5, _3511);
    float _3529 = _3513 * _3485;
    float _3531 = -_3501;
    float _3533 = _3531 + 1.0;
    float _3535 = _3515 + _3459;
    float _3537 = _3521 * 0.5;
    float _3539 = _3533 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3541 = _3523 * 0.5;
    out.m_86.x = _3038;
    out.m_86.y = _3036;
    out.m_86.z = _3040;
    float _3543 = fma(_3477, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3535);
    float _3545 = _3503 * _3517;
    float _3547 = _3525 * _3517;
    out.m_88.x = _3541;
    out.m_88.y = _3527;
    out.m_88.z = _3537;
    out.m_88.w = _3320;
    bool _3549 = _3545 > 0.0;
    bool _3551 = _3545 < 1.0;
    bool _3553 = _3551 && _3549;
    bool _3555 = _3356 > (-1.0);
    bool _3557 = _3555 && _3553;
    bool _3559 = _3358 > (-1.0);
    bool _3561 = _3559 && _3557;
    bool _3563 = _3356 < 1.0;
    bool _3565 = _3563 && _3561;
    bool _3567 = _3358 < 1.0;
    bool _3569 = _3567 && _3565;
    float _3571 = _3539 * _3378;
    float _3573 = _3543 * _3517;
    float _3575 = _3389 * _3571;
    float _3577 = _3399 * _3571;
    float _3579 = -_3539;
    float _3581 = _3579 + 1.0;
    float _3583 = fma(_3395, _3575, _3383);
    float _3585 = fma(_3397, _3575, _3385);
    float _3587 = _3389 * _3581;
    float _3589 = fma(_3389, _3577, _3387);
    out.m_90.x = _3583;
    out.m_90.y = _3585;
    out.m_90.z = _3589;
    out.m_90.w = _3587;
    bool _3591 = !_3569;
    float _3593 = _3581;
    float _3595 = _3587;
    float _3597 = _3346;
    float _3599 = _3589;
    float _3629;
    float _3631;
    float _3633;
    float _3641;
    if (!_3591)
    {
        float _3601 = -_3573;
        float _3603 = _3358 + _3601;
        float _3605 = -_3547;
        float _3607 = _3356 + _3605;
        float _3609 = _2862 * _3066;
        float _3611 = -_3519;
        float _3613 = _3356 + _3611;
        float _3615 = _3603 * _3603;
        float _3617 = -_3529;
        float _3619 = _3358 + _3617;
        float _3621 = _3609 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
        float _3623 = fma(_3607, _3607, _3615);
        float _3625 = sqrt(_3623);
        bool _3627 = _3625 > 0.0;
        _3629 = _3607;
        _3631 = _3623;
        _3633 = _3625;
        if (!_3627)
        {
            _3593 = _3621;
        }
        float _3635 = _3593;
        bool _3637 = !_3627;
        float _3639 = _3635;
        _3641 = _3635;
        _3643 = _3637;
        if (!_3643)
        {
            float _3645 = _3619 * _3619;
            float _3647 = fma(_3613, _3613, _3645);
            float _3649 = rsqrt(_3623);
            float _3651 = sqrt(_3647);
            float _3653 = _3607 * _3649;
            float _3655 = _3603 * _3649;
            bool _3657 = _3651 > 0.0;
            _3599 = _3651;
            _3633 = _3649;
            if (!_3657)
            {
                _3639 = _3621;
            }
            float _3659 = _3639;
            bool _3661 = !_3657;
            _3641 = _3659;
            _3643 = _3661;
            if (!_3643)
            {
                float _3663 = _1874 * _3477;
                float _3665 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
                float _3667 = fma(_3663, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3471);
                float _3669 = fma(_3663, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3515);
                float _3671 = fma(_3663, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3499);
                float _3673 = fma(_3477, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3667);
                float _3675 = fma(_3477, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3669);
                float _3677 = fma(_3477, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3671);
                float _3679 = rsqrt(_3647);
                float _3681 = _3665 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _3683 = 1.0 / _3673;
                float _3685 = _3619 * _3681;
                float _3687 = _3613 * _3681;
                float _3689 = _3685 * _3685;
                float _3691 = fma(_3687, _3687, _3689);
                float _3693 = _3619 * _3679;
                float _3695 = _3613 * _3679;
                float _3697 = _3655 * _3693;
                float _3699 = _3675 * _3683;
                float _3701 = _3677 * _3683;
                float _3703 = sqrt(_3691);
                float _3705 = fma(_3653, _3695, _3697);
                float _3707 = _3699 * _3699;
                float _3709 = fma(_3701, _3701, _3707);
                float _3711 = precise::min(0.0, _3705);
                float _3713 = sqrt(_3709);
                float _3715 = _3320 * _3711;
                float _3717 = fma(_3687, _3715, _3346);
                float _3719 = fma(_3685, _3715, _3348);
                out.gl_Position.x = _3717;
                out.gl_Position.y = _3719;
                float _3721 = fma(_3703, (*spvDescriptorSet0.vp_c13)._m0[1].x, _3713);
                float _3723 = 1.0 / _3721;
                float _3725 = _3713 * _3723;
                out.m_84.y = _3725;
                _3629 = _3715;
                _3595 = _3703;
                _3641 = _3621;
                _3597 = _3717;
                _3631 = _3687;
                _3599 = _3685;
                _3633 = _3725;
                _3643 = true;
            }
        }
    }
    else
    {
        float _3727 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _3727;
        _3629 = 0.0;
        _3641 = 0.0;
        _3631 = 0.0;
        _3599 = _3727;
        _3633 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    _3643 = false;
    float _3729 = _3629;
    float _3731 = _3595;
    float _3733 = _3641;
    float _3735 = _3597;
    float _3737 = _3631;
    float _3739 = _3599;
    float _3741 = _3633;
    bool _3743 = _3088 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3745 = isnan(_3088);
    bool _3747 = _3743 || _3745;
    bool _3749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3751 = _3747 || _3749;
    float _3753 = _3735;
    float _3755 = _3731;
    float _3757 = _3739;
    float _3759 = _3737;
    float _3761 = _3729;
    float _3763 = _3741;
    if (!_3751)
    {
        _3753 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3765 = _3753;
    float _3767 = _3765;
    float _3769 = _3765;
    if (!_3751)
    {
        _3755 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3771 = _3755;
    float _3773 = _3771;
    float _3775 = _3771;
    if (!_3751)
    {
        _3757 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3777 = _3757;
    float _3779 = _3777;
    float _3781 = _3777;
    if (!_3751)
    {
        _3759 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3783 = _3759;
    float _3785 = _3783;
    float _3787 = _3783;
    if (!_3751)
    {
        _3761 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3789 = _3761;
    float _3791 = _3789;
    float _3793 = _3789;
    if (!_3751)
    {
        _3763 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3795 = _3763;
    bool _3797 = !_3751;
    float _3799 = _3795;
    float _3801 = _3795;
    if (!_3797)
    {
        bool _3803 = _3088 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3805 = isnan(_3088);
        bool _3807 = _3803 || _3805;
        bool _3809 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3811 = _3807 || _3809;
        if (!_3811)
        {
            float _3813 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3815 = _3088 + _3813;
            float _3817 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3819 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3817;
            float _3821 = 1.0 / _3819;
            float _3823 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3825 = _3823 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3827 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3829 = _3827 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3831 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3833 = _3831 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3835 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3837 = _3835 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3839 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3841 = _3839 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3843 = _3815 * _3821;
            float _3845 = precise::clamp(_3843, 0.0, 1.0);
            float _3847 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3849 = _3847 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3851 = fma(_3845, _3825, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3853 = fma(_3845, _3849, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3855 = fma(_3845, _3829, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3857 = fma(_3845, _3833, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3859 = fma(_3845, _3837, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3861 = fma(_3845, _3841, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3775 = _3853;
            _3793 = _3859;
            _3769 = _3851;
            _3787 = _3857;
            _3781 = _3855;
            _3801 = _3861;
            _3863 = true;
        }
        else
        {
            bool _3865 = _3088 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3867 = isnan(_3088);
            bool _3869 = _3865 || _3867;
            bool _3871 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3873 = _3869 || _3871;
            if (!_3873)
            {
                _3767 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3875 = _3767;
            _3769 = _3875;
            if (!_3873)
            {
                _3773 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3877 = _3773;
            _3775 = _3877;
            if (!_3873)
            {
                _3779 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3879 = _3779;
            _3781 = _3879;
            if (!_3873)
            {
                _3785 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3881 = _3785;
            _3787 = _3881;
            if (!_3873)
            {
                _3791 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3883 = _3791;
            _3793 = _3883;
            if (!_3873)
            {
                _3799 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3885 = _3799;
            bool _3887 = !_3873;
            _3801 = _3885;
            if (!_3887)
            {
                bool _3889 = _3088 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3891 = isnan(_3088);
                bool _3893 = _3889 || _3891;
                bool _3895 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3897 = _3893 || _3895;
                if (!_3897)
                {
                    float _3899 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3901 = _3088 + _3899;
                    float _3903 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3905 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3903;
                    float _3907 = 1.0 / _3905;
                    float _3909 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3911 = _3909 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3913 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3915 = _3913 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3917 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3919 = _3917 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3921 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3923 = _3921 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3925 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3927 = _3925 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3929 = _3901 * _3907;
                    float _3931 = precise::clamp(_3929, 0.0, 1.0);
                    float _3933 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3935 = _3933 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3937 = fma(_3931, _3911, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3939 = fma(_3931, _3935, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3941 = fma(_3931, _3915, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3943 = fma(_3931, _3919, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3945 = fma(_3931, _3923, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3947 = fma(_3931, _3927, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3775 = _3939;
                    _3793 = _3945;
                    _3769 = _3937;
                    _3787 = _3943;
                    _3781 = _3941;
                    _3801 = _3947;
                    _3863 = true;
                }
                else
                {
                    _3775 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3793 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3769 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3787 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3781 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3801 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3863 = false;
    float _3949 = _3775;
    float _3951 = _3793;
    float _3953 = _3769;
    float _3955 = _3787;
    float _3957 = _3781;
    float _3959 = _3801;
    float _3961 = fma(_2644, -0.5, 0.5);
    float _3963 = precise::clamp(_3961, 0.0, 1.0);
    float _3965 = -_3949;
    float _3967 = _3965 + _3951;
    float _3969 = _3733 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3971 = -_3953;
    float _3973 = _3971 + _3955;
    float _3975 = fma(_3963, _3967, _3949);
    out.m_92.x = 0.0;
    float _3977 = -_3957;
    float _3979 = _3977 + _3959;
    float _3981 = fma(_3963, _3973, _3953);
    float _3983 = _3975 * 0.586610972881317138671875;
    out.m_53.x = _3969;
    bool _3985 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3987 = fma(_3963, _3979, _3957);
    float _3989 = fma(_3981, 0.298911988735198974609375, _3983);
    bool _3991 = _3066 > 0.0;
    bool _3993 = isnan(_3066);
    bool _3995 = _3991 || _3993;
    bool _3997 = isnan(0.0);
    bool _3999 = _3995 || _3997;
    float _4001 = fma(_3987, 0.114477999508380889892578125, _3989);
    float _4003 = -_4001;
    float _4005 = _3981 + _4003;
    float _4007 = -_4001;
    float _4009 = _3975 + _4007;
    float _4011 = -_4001;
    float _4013 = _3987 + _4011;
    float _4015 = fma(_4005, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4001);
    float _4017 = fma(_4009, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4001);
    float _4019 = fma(_4013, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4001);
    bool _4021 = !_3985;
    if (!_4021)
    {
        float _4023 = -_3036;
        float _4025 = _4023 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4027 = -_3038;
        float _4029 = _4027 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4031 = -_3040;
        float _4033 = _4031 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4035 = _4025 * _4025;
        float _4037 = fma(_4029, _4029, _4035);
        float _4039 = fma(_4033, _4033, _4037);
        float _4041 = sqrt(_4039);
        float _4043 = rsqrt(_4039);
        float _4045 = -_4041;
        float _4047 = _4045 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4049 = _4047 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4051 = precise::clamp(_4049, 0.0, 1.0);
        float _4053 = _4029 * _4043;
        float _4055 = _4025 * _4043;
        float _4057 = abs(_4051);
        float _4059 = log2(_4057);
        float _4061 = _4033 * _4043;
        float _4063 = _4053 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4065 = _2644 * _4055;
        float _4067 = -_4055;
        float _4069 = -_4063;
        float _4071 = fma(_4067, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4069);
        float _4073 = fma(_2642, _4053, _4065);
        float _4075 = -_4061;
        float _4077 = fma(_4075, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4071);
        float _4079 = fma(_2434, _4061, _4073);
        float _4081 = precise::clamp(_4079, 0.0, 1.0);
        float _4083 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4085 = _4077 + _4083;
        float _4087 = _4059 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4089 = _4085 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4091 = precise::clamp(_4089, 0.0, 1.0);
        float _4093 = exp2(_4087);
        float _4095 = _4093 * _4091;
        float _4097 = _4081 * _4095;
        float _4099 = _4097 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4101 = _4097 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4103 = _4097 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _4099;
        out.m_92.y = _4101;
        out.m_92.z = _4103;
    }
    out.m_94.x = _4015;
    out.m_94.y = _4017;
    out.m_94.z = _4019;
    if (_3999)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _4105 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4105;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3863 = false;
    bool _3643 = false;
    bool _2728 = false;
    bool _2716 = false;
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
        float _4173 = as_type<float>(_137);
        out.gl_Position.z = _4173;
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
        float _4236 = as_type<float>(_169);
        out.gl_Position.z = _4236;
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
    float _177 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _179 = in.m_61.x;
    float _181 = in.m_61.y;
    float _183 = in.m_61.z;
    float _185 = in.m_63.x;
    float _187 = in.m_63.y;
    float _189 = in.m_63.z;
    float _191 = in.m_48.x;
    float _193 = in.m_48.y;
    float _195 = in.m_48.z;
    float _197 = _171 * _171;
    float _199 = _173 * _173;
    float _201 = fma(_179, _179, _197);
    float _203 = fma(_181, _181, _199);
    float _205 = fma(_185, _185, _201);
    float _207 = _175 * _175;
    float _209 = fma(_187, _187, _203);
    float _211 = sqrt(_205);
    float _213 = fma(_183, _183, _207);
    float _215 = fma(_189, _189, _213);
    float _217 = sqrt(_209);
    float _219 = sqrt(_215);
    bool _221 = _211 > 0.0;
    float _223 = as_type<float>(int(gl_VertexIndex));
    bool _225 = _217 > 0.0;
    float _227 = _205;
    if (_221)
    {
        float _229 = rsqrt(_205);
        _227 = _229;
    }
    float _231 = _227;
    float _233 = 0.0;
    if (!_221)
    {
        _233 = 0.0;
    }
    float _235 = _233;
    bool _237 = _219 > 0.0;
    float _239 = 0.0;
    float _241 = _219;
    float _243 = _235;
    if (!_221)
    {
        _239 = 0.0;
    }
    float _245 = _239;
    float _247 = 0.0;
    float _249 = _245;
    if (!_225)
    {
        _247 = 0.0;
    }
    float _251 = _247;
    float _253 = 0.0;
    float _255 = _251;
    if (_225)
    {
        float _257 = rsqrt(_209);
        _253 = _257;
    }
    float _259 = _253;
    float _261 = 0.0;
    if (!_225)
    {
        _261 = 0.0;
    }
    float _263 = _261;
    float _265 = _263;
    if (!_225)
    {
        _241 = 0.0;
    }
    float _267 = _241;
    int _269 = as_type<int>(_223) & 1;
    bool _271 = _269 != 0;
    int _273 = as_type<int>(_223) & 2;
    bool _275 = _273 != 0;
    bool _277 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _281 = _277 || _279;
    bool _283 = isnan(1.0);
    bool _285 = _281 || _283;
    float _287 = _215;
    float _289 = _223;
    float _291 = _267;
    if (_237)
    {
        float _293 = rsqrt(_215);
        _287 = _293;
    }
    float _295 = _287;
    if (!_221)
    {
        _289 = 0.0;
    }
    float _297 = _289;
    float _299 = _297;
    float _301 = _231;
    if (_221)
    {
        float _303 = _231 * _179;
        _243 = _303;
    }
    float _305 = _243;
    if (_221)
    {
        float _307 = _231 * _171;
        _249 = _307;
    }
    float _309 = _249;
    if (_221)
    {
        float _311 = _231 * _185;
        _299 = _311;
    }
    float _313 = _299;
    float _315 = 0.0;
    if (!_237)
    {
        _315 = 0.0;
    }
    float _317 = _315;
    float _319 = _259;
    float _321 = _317;
    if (_225)
    {
        float _323 = _259 * _181;
        _255 = _323;
    }
    float _325 = _255;
    if (_225)
    {
        float _327 = _259 * _173;
        _265 = _327;
    }
    float _329 = _265;
    if (_225)
    {
        float _331 = _259 * _187;
        _291 = _331;
    }
    float _333 = _291;
    if (!_237)
    {
        _319 = 0.0;
    }
    float _335 = _319;
    float _337 = 0.0;
    float _339 = _335;
    if (!_285)
    {
        float _341 = _177 * _177;
        float _343 = _341 * 0.5;
        _337 = _343;
    }
    float _345 = _337;
    float _347 = _345;
    if (!_237)
    {
        _301 = 0.0;
    }
    float _349 = _301;
    bool _351 = !_271;
    float _353 = _351 ? (-0.5) : 0.5;
    float _355 = _349;
    if (_237)
    {
        float _357 = _295 * _183;
        _339 = _357;
    }
    float _359 = _339;
    if (_237)
    {
        float _361 = _295 * _175;
        _321 = _361;
    }
    float _363 = _321;
    if (_237)
    {
        float _365 = _295 * _189;
        _355 = _365;
    }
    float _367 = _355;
    bool _369 = !_275;
    float _371 = _369 ? (-0.5) : 0.5;
    float _373 = _367;
    if (!_285)
    {
        float _375 = _345 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _347 = _375;
    }
    float _377 = _347;
    bool _379 = !_285;
    float _381 = _377;
    float _383 = 0.0;
    float _385 = 0.0;
    if (!_379)
    {
        float _387 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _389 = log2(_387);
        float _391 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _393 = _391 + 1.0;
        float _395 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _397 = _177 * _389;
        float _399 = 1.0 / _393;
        float _401 = _395 * 0.693147182464599609375;
        float _403 = exp2(_397);
        float _405 = 1.0 / _401;
        float _407 = _403 + (-1.0);
        float _409 = -_407;
        float _411 = fma(_409, _405, _177);
        float _413 = _411 * _399;
        float _415 = _413 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _381 = _415;
        _383 = _413;
        _385 = _399;
    }
    float _417 = _381;
    float _419 = _383;
    float _421 = _385;
    float _423 = _417 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _425 = _421;
    float _427 = _419;
    if (!_285)
    {
        _425 = _177;
    }
    float _429 = _425;
    bool _431 = !_285;
    float _433 = _429;
    if (!_431)
    {
        float _435 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _437 = log2(_435);
        float _439 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _441 = _439 + 1.0;
        float _443 = 1.0 / _441;
        float _445 = _177 * _437;
        float _447 = exp2(_445);
        float _449 = -_447;
        float _451 = _449 + 1.0;
        float _453 = _451 * _443;
        _427 = _443;
        _433 = _453;
    }
    float _455 = _427;
    float _457 = _433;
    float _459 = _417 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _461 = _423 * _309;
    float _463 = _423 * _329;
    float _465 = _423 * _363;
    float _467 = _455;
    if (!_285)
    {
        float _469 = _119 * _119;
        float _471 = _469 * 0.5;
        _467 = _471;
    }
    float _473 = _467;
    float _475 = fma(_459, _305, _461);
    float _477 = fma(_459, _325, _463);
    float _479 = fma(_459, _359, _465);
    float _481 = _473;
    float _483 = _479;
    if (!_285)
    {
        float _485 = _473 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _481 = _485;
    }
    float _487 = _481;
    bool _489 = !_285;
    float _491 = _487;
    if (!_489)
    {
        float _493 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _495 = log2(_493);
        float _497 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _499 = _497 + 1.0;
        float _501 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _503 = _119 * _495;
        float _505 = 1.0 / _499;
        float _507 = _501 * 0.693147182464599609375;
        float _509 = exp2(_503);
        float _511 = 1.0 / _507;
        float _513 = _509 + (-1.0);
        float _515 = -_513;
        float _517 = fma(_515, _511, _119);
        float _519 = _517 * _505;
        float _521 = _519 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _491 = _521;
    }
    float _523 = _491;
    float _525 = in.m_68.w;
    float _527 = _523 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _529 = _417 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _531 = in.m_46.x;
    float _533 = in.m_46.y;
    float _535 = in.m_46.z;
    float _537 = _527 * _329;
    float _539 = _523 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _541 = _527 * _363;
    float _543 = _527 * _309;
    float _545 = _523 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _547 = fma(_539, _325, _537);
    float _549 = fma(_529, _313, _475);
    float _551 = fma(_539, _359, _541);
    float _553 = fma(_529, _333, _477);
    float _555 = fma(_529, _367, _479);
    float _557 = fma(_539, _305, _543);
    float _559 = fma(_545, _333, _547);
    float _561 = fma(_545, _367, _551);
    float _563 = fma(_457, _191, _549);
    float _565 = fma(_457, _193, _553);
    float _567 = fma(_457, _195, _555);
    float _569 = fma(_545, _313, _557);
    float _571 = _543;
    if (!_285)
    {
        _373 = _119;
    }
    float _573 = _373;
    bool _575 = !_285;
    float _577 = _573;
    if (!_575)
    {
        float _579 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _581 = log2(_579);
        float _583 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _585 = _583 + 1.0;
        float _587 = 1.0 / _585;
        float _589 = _119 * _581;
        float _591 = exp2(_589);
        float _593 = -_591;
        float _595 = _593 + 1.0;
        float _597 = _595 * _587;
        _577 = _597;
    }
    float _599 = _577;
    float _601 = fma(_599, _193, _559);
    float _603 = 1.0 / _153;
    bool _605 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _607 = fma(_599, _191, _569);
    float _609 = -_601;
    float _611 = _565 + _609;
    float _613 = fma(_599, _195, _561);
    float _615 = fma(_563, _525, _531);
    float _617 = -_607;
    float _619 = _563 + _617;
    float _621 = _611 * _181;
    float _623 = _611 * _173;
    float _625 = _611 * _187;
    float _627 = -_613;
    float _629 = _567 + _627;
    float _631 = fma(_619, _179, _621);
    float _633 = fma(_619, _171, _623);
    float _635 = fma(_619, _185, _625);
    float _637 = fma(_565, _525, _533);
    float _639 = fma(_629, _183, _631);
    float _641 = fma(_629, _175, _633);
    float _643 = fma(_567, _525, _535);
    float _645 = fma(_629, _189, _635);
    float _647 = _119 * _603;
    bool _649 = !_605;
    float _651 = _647;
    if (!_649)
    {
        float _653 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _655 = _151 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _657 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _659 = _657 * _653;
        float _661 = floor(_659);
        float _663 = -_661;
        float _665 = _659 + _663;
        _651 = _665;
    }
    float _667 = _651;
    float _669 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _671 = int(_669);
    float _673 = _637 * _181;
    float _675 = _637 * _173;
    float _677 = _637 * _187;
    float _679 = _151 * 2.0;
    float _681 = fma(_615, _179, _673);
    float _683 = fma(_615, _171, _675);
    float _685 = fma(_615, _185, _677);
    float _687 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _689 = int(_687);
    float _691 = _163 * 2.0;
    float _693 = in.m_55.w;
    float _695 = fma(_643, _189, _685);
    float _697 = _151 + _163;
    float _699 = float(_671);
    float _701 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _703 = int(_701);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _705;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _711 = _709 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _713 = in.m_63.w;
    float _715 = _697 + (-1.0);
    float _717 = _155 + _163;
    float _719 = float(_689);
    float _721 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _723 = int(_721);
    float _725 = _717 + (-1.0);
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _727;
    float _731 = float(uint(_703));
    float _733 = 1.0 / _699;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _735;
    float _739 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _741 = 1.0 / _719;
    float _743 = float(uint(_723));
    float _745 = _695 + _713;
    int _747 = ~_723;
    int _749 = _747 + 1;
    float _751 = _733 * _119;
    float _753 = 1.0 / _731;
    float _755 = _155 * 2.0;
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _759 = _757 != 0;
    float _761 = _741 * _119;
    float _763 = 1.0 / _743;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _767 = _765 != 0;
    int _769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _771 = _769 != 0;
    int _773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _775 = _773 != 0;
    bool _777 = _151 > 0.5;
    int _779 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _781 = _779 != 0;
    float _783 = -_353;
    int _785 = _777 ? as_type<int>(_783) : as_type<int>(_353);
    float _787 = trunc(_751);
    int _789 = int(_787);
    int _791 = as_type<int>(_753) + (-2);
    bool _793 = !_781;
    float _795 = _793 ? _353 : as_type<float>(_785);
    bool _797 = !_771;
    int _799 = _797 ? 0 : 1;
    bool _801 = !_775;
    int _803 = _801 ? 0 : 1;
    float _805 = trunc(_761);
    int _807 = int(_805);
    int _809 = as_type<int>(_763) + (-2);
    bool _811 = !_767;
    int _813 = _811 ? 0 : 1;
    bool _815 = _163 > 0.5;
    bool _817 = _155 > 0.5;
    float _819 = floor(_679);
    float _821 = float(uint(_789));
    float _823 = -_371;
    int _825 = _817 ? as_type<int>(_823) : as_type<int>(_371);
    int _827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _829 = _827 != 0;
    float _831 = as_type<float>(_809) * _821;
    float _833 = 0.0;
    int _835 = _825;
    if (_759)
    {
        _833 = 1.0;
    }
    float _837 = _833;
    float _839 = floor(_755);
    float _841 = float(uint(_807));
    float _843 = 0.0;
    float _845 = _837;
    if (_759)
    {
        _843 = _151;
    }
    float _847 = _843;
    float _849 = 0.0;
    float _851 = _847;
    if (_759)
    {
        _849 = 1.0;
    }
    float _853 = _849;
    float _855 = as_type<float>(_791) * _841;
    float _857 = _853;
    if (!_759)
    {
        _845 = 7.345489978790283203125;
    }
    float _859 = _845;
    float _861 = trunc(_831);
    float _863 = precise::max(_861, 0.0);
    uint _866 = uint(_863);
    float _868 = -_353;
    int _870 = _815 ? as_type<int>(_868) : as_type<int>(_353);
    bool _872 = _819 > 0.0;
    bool _874 = _819 >= 0.0;
    bool _876 = isnan(_819);
    bool _878 = _874 || _876;
    bool _880 = isnan(0.0);
    bool _882 = _878 || _880;
    int _884 = ~_703;
    int _886 = _884 + 1;
    float _888 = trunc(_855);
    float _890 = precise::max(_888, 0.0);
    uint _892 = uint(_890);
    bool _894 = _839 > 0.0;
    if (!_759)
    {
        _851 = _155;
    }
    float _896 = _851;
    if (!_759)
    {
        _857 = 1.2345600128173828125;
    }
    float _898 = _857;
    int _900 = abs(_799);
    int _902 = _749 * int(_866);
    int _904 = _902 + _789;
    int _906 = ~_703;
    int _908 = _906 + 1;
    float _910 = floor(_691);
    float _912 = _896 * _898;
    bool _914 = _667 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _916 = isnan(_667);
    bool _918 = _914 || _916;
    bool _920 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _922 = _918 || _920;
    float _924 = float(_922);
    float _926 = float(uint(_904));
    int _928 = _908 * int(_892);
    int _930 = _928 + _807;
    float _932 = -_924;
    float _934 = _932 + 1.0;
    float _936 = 1.0 / _707;
    float _938 = as_type<float>(_809) * _926;
    int _940 = abs(_803);
    float _942 = float(uint(_930));
    float _944 = trunc(_938);
    float _946 = precise::max(_944, 0.0);
    uint _948 = uint(_946);
    float _950 = as_type<float>(_791) * _942;
    int _952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _954 = _952 != 0;
    int _956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _958 = _956 != 0;
    bool _960 = !_954;
    int _962 = _960 ? 0 : 1;
    float _964 = trunc(_950);
    float _966 = precise::max(_964, 0.0);
    uint _968 = uint(_966);
    bool _970 = _839 >= 0.0;
    bool _972 = isnan(_839);
    bool _974 = _970 || _972;
    bool _976 = isnan(0.0);
    bool _978 = _974 || _976;
    bool _980 = !_958;
    float _982 = _980 ? _371 : as_type<float>(_825);
    int _984 = _882 ? 0 : 1;
    int _986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _988 = _986 != 0;
    float _990 = 1.0 / _711;
    int _992 = _978 ? 0 : 1;
    if (_759)
    {
        _835 = 0;
    }
    int _994 = _835;
    bool _996 = _910 > 0.0;
    int _998 = _994;
    if (!_759)
    {
        _998 = 1;
    }
    int _1000 = _998;
    float _1002 = 1.0 / _729;
    int _1004 = ~_984;
    int _1006 = _1004 + 1;
    int _1008 = _1006 + 1;
    int _1010 = ~_992;
    int _1012 = _1010 + 1;
    int _1014 = _1012 + 1;
    int _1016 = int(_892) + int(_968);
    bool _1018 = !_988;
    float _1020 = _1018 ? _353 : as_type<float>(_870);
    int _1022 = _1008;
    int _1024 = _1014;
    if (!_872)
    {
        int _1026 = ~_984;
        int _1028 = _1026 + 1;
        _1022 = _1028;
    }
    int _1030 = _1022;
    if (!_894)
    {
        int _1032 = ~_992;
        int _1034 = _1032 + 1;
        _1024 = _1034;
    }
    int _1036 = _1024;
    int _1038 = int(_866) + int(_948);
    float _1040 = _151 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1042 = _910 >= 0.0;
    bool _1044 = isnan(_910);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan(0.0);
    bool _1050 = _1046 || _1048;
    int _1052 = _886 * _1016;
    int _1054 = _1052 + _807;
    bool _1056 = _1000 != 1;
    int _1058 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1060 = _1058 != 0;
    int _1062 = ~_723;
    int _1064 = _1062 + 1;
    bool _1066 = _693 > 0.5;
    bool _1068 = !_829;
    int _1070 = _1068 ? 0 : 1;
    int _1072 = _1064 * _1038;
    int _1074 = _1072 + _789;
    bool _1076 = !_1060;
    int _1078 = _1076 ? 0 : 1;
    float _1080 = -_371;
    int _1082 = _1066 ? as_type<int>(_1080) : as_type<int>(_371);
    int _1084 = _1050 ? 0 : 1;
    int _1086 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1088 = _1086 != 0;
    int _1090 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1092 = _1090 != 0;
    int _1094 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1096 = _1094 != 0;
    int _1098 = ~_1084;
    int _1100 = _1098 + 1;
    int _1102 = _1100 + 1;
    int _1104 = _1102;
    float _1106 = as_type<float>(_1054);
    if (!_996)
    {
        int _1108 = ~_1084;
        int _1110 = _1108 + 1;
        _1104 = _1110;
    }
    int _1112 = _1104;
    bool _1114 = !_1092;
    int _1116 = _1114 ? 0 : 1;
    bool _1118 = uint(_1054) >= uint(_703);
    bool _1120 = uint(_1074) >= uint(_723);
    int _1122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1124 = _1122 != 0;
    if (!_1056)
    {
        _571 = _155;
    }
    float _1126 = _571;
    float _1128 = _1126;
    if (!_1056)
    {
        _483 = _155;
    }
    float _1130 = _483;
    float _1132 = 0.0;
    float _1134 = _1130;
    if (!_1056)
    {
        _1132 = _163;
    }
    float _1136 = _1132;
    float _1138 = _1136;
    if (!_1056)
    {
        _1106 = _163;
    }
    float _1140 = _1106;
    float _1142 = _1140;
    if (_1056)
    {
        _1128 = _151;
    }
    float _1144 = _1128;
    if (_1056)
    {
        _1134 = _151;
    }
    float _1146 = _1134;
    if (_1056)
    {
        _1138 = _155;
    }
    float _1148 = _1138;
    float _1150 = _1144 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1056)
    {
        _1142 = _155;
    }
    float _1152 = _1142;
    bool _1154 = !_1118;
    int _1156 = _1154 ? 0 : (-1);
    bool _1158 = !_1120;
    int _1160 = _1158 ? 0 : (-1);
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1164 = _1162 != 0;
    int _1166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1168 = _1166 != 0;
    int _1170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1172 = _1170 != 0;
    int _1174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1176 = _1174 != 0;
    float _1178 = fma(_643, _183, _681);
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1182 = fma(_643, _175, _683);
    float _1184 = in.m_61.w;
    float _1186 = -_1180;
    float _1188 = fma(_1040, 2.0, _1186);
    float _1190 = _151 + _155;
    float _1192 = in.m_59.w;
    float _1194 = _155 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1198 = _1190 + (-1.0);
    float _1200 = -_119;
    float _1202 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1188);
    bool _1204 = !_1088;
    int _1206 = _1204 ? 0 : 1;
    float _1208 = fma(_1194, -2.0, _1196);
    float _1210 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1212 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1216 = _667 + _1214;
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1220 = _667 + _1218;
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1224 = _667 + _1222;
    bool _1226 = !_1096;
    int _1228 = _1226 ? 0 : 1;
    float _1230 = _1216 * _936;
    float _1232 = _1220 * _990;
    float _1234 = _1224 * _1002;
    float _1236 = _1178 + _1184;
    int _1238 = abs(_1116);
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1240;
    float _1244 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1246 = _1244 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1248 = _1182 + _1192;
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1252 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1250;
    float _1254 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1256 = _1254 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1258;
    float _1262 = _1248 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _1264 = fma(_1252, _1230, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1266 = fma(_1242, _1230, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _1268 = _667 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1270 = isnan(_667);
    bool _1272 = _1268 || _1270;
    bool _1274 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1276 = _1272 || _1274;
    float _1278 = float(_1276);
    float _1280 = fma(_1256, _1232, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _1282 = _667 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1284 = isnan(_667);
    bool _1286 = _1282 || _1284;
    bool _1288 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1290 = _1286 || _1288;
    float _1292 = float(_1290);
    float _1294 = _859 * _151;
    float _1296 = fma(_1246, _1232, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1298 = -_1278;
    float _1300 = _1298 + 1.0;
    bool _1302 = _667 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1304 = isnan(_667);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1310 = _1306 || _1308;
    float _1312 = float(_1310);
    float _1314 = floor(_1294);
    float _1316 = -_1292;
    float _1318 = _1316 + 1.0;
    float _1320 = _924 * _1300;
    float _1322 = _1292 * _934;
    float _1324 = fma(_1260, _1234, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1326 = _1312 * _1318;
    float _1328 = fma(_737, _1234, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1330 = -_1312;
    float _1332 = _1330 + 1.0;
    float _1334 = floor(_912);
    float _1336 = _795 + 0.5;
    float _1338 = _1264 * _1326;
    float _1340 = _1266 * _1326;
    float _1342 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1208);
    float _1344 = _982 + (-0.5);
    float _1346 = _1236 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _1348 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1202);
    float _1350 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1338);
    float _1352 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1340);
    float _1354 = -_1344;
    float _1356 = -_1342;
    float _1358 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1356);
    float _1360 = -_1314;
    float _1362 = _1294 + _1360;
    float _1364 = fma(_1280, _1322, _1350);
    float _1366 = fma(_1296, _1322, _1352);
    float _1368 = float(_807);
    float _1370 = _603 * _119;
    float _1372 = -_1334;
    float _1374 = _912 + _1372;
    float _1376 = _1262 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _1378 = float(_723);
    float _1380 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1382 = log2(_1380);
    float _1384 = float(_789);
    float _1386 = fma(_1346, (*spvDescriptorSet0.vp_c12)._m0[6].x, _1376);
    float _1388 = float(_703);
    float _1390 = _1262 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _1392 = _1262 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    bool _1394 = _1368 >= _1388;
    bool _1396 = isnan(_1368);
    bool _1398 = _1394 || _1396;
    bool _1400 = isnan(_1388);
    bool _1402 = _1398 || _1400;
    float _1404 = float(_1402);
    float _1406 = _1362 * _1388;
    float _1408 = _1388 * _1370;
    float _1410 = _1378 * _1370;
    bool _1412 = _1384 >= _1378;
    bool _1414 = isnan(_1384);
    bool _1416 = _1412 || _1414;
    bool _1418 = isnan(_1378);
    bool _1420 = _1416 || _1418;
    float _1422 = float(_1420);
    float _1424 = _1374 * _1378;
    float _1426 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1428 = fma(_1324, _1320, _1364);
    float _1430 = fma(_1328, _1320, _1366);
    float _1432 = fma(_1346, (*spvDescriptorSet0.vp_c12)._m0[6].y, _1390);
    float _1434 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1426);
    float _1436 = fma(_1346, (*spvDescriptorSet0.vp_c12)._m0[6].z, _1392);
    float _1438 = _1382 * _119;
    float _1440 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    int _1442 = abs(_1206);
    float _1444 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1446 = _745 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _1448 = float(_1112);
    float _1450 = fma(_1278, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1428);
    float _1452 = -_1444;
    float _1454 = fma(_1150, 2.0, _1452);
    int _1456 = abs(_1228);
    float _1458 = exp2(_1438);
    float _1460 = float(_1030);
    float _1462 = fma(_1446, (*spvDescriptorSet0.vp_c12)._m0[8].x, _1386);
    float _1464 = fma(_1446, (*spvDescriptorSet0.vp_c12)._m0[8].y, _1432);
    float _1466 = float(_1442);
    float _1468 = fma(_1446, (*spvDescriptorSet0.vp_c12)._m0[8].z, _1436);
    float _1470 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1472 = float(_1238);
    float _1474 = _1466 * _1448;
    float _1476 = _1462 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _1478 = _1148 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1480 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1482 = _1472 * _1460;
    float _1484 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1486 = 1.0 + _1484;
    float _1488 = _1476 * _1440;
    float _1490 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1492 = fma(_1478, -2.0, _1480);
    float _1494 = _1468 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _1496 = _1464 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _1498 = fma(_1278, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1430);
    bool _1500 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1502 = isnan(0.0);
    bool _1504 = _1500 || _1502;
    bool _1506 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1508 = _1504 || _1506;
    float _1510 = _1474 * (-2.0);
    float _1512 = 1.0 / _1486;
    float _1514 = -_119;
    float _1516 = fma(_1514, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1454);
    float _1518 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1434);
    float _1520 = float(_1036);
    float _1522 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1524 = float(_1456);
    float _1526 = _1496 * _1490;
    float _1528 = -_1458;
    float _1530 = _1528 + 1.0;
    float _1532 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1534 = !_1124;
    float _1536 = _1534 ? _371 : as_type<float>(_1082);
    float _1538 = trunc(_1424);
    int _1540 = int(_1538);
    float _1542 = in.m_70.x;
    float _1544 = in.m_70.y;
    float _1546 = in.m_70.z;
    float _1548 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1532);
    float _1550 = _1494 * _1470;
    float _1552 = _1508 ? _1530 : 0.0;
    float _1554 = in.m_68.x;
    float _1556 = in.m_68.y;
    bool _1558 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1560 = isnan(1.0);
    bool _1562 = _1558 || _1560;
    bool _1564 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1566 = _1562 || _1564;
    float _1568 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1570 = trunc(_1404);
    int _1572 = int(_1570);
    float _1574 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1522);
    float _1576 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1492);
    float _1578 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1568);
    float _1580 = fma(_1210, _1510, _1210);
    float _1582 = _163 + (-0.5);
    int _1584 = ~_1016;
    int _1586 = _1584 + _1156;
    int _1588 = _1586 + 1;
    float _1590 = _1524 * _1520;
    float _1592 = trunc(_1422);
    int _1594 = int(_1592);
    int _1596 = abs(_1078);
    float _1598 = _1020 + 0.5;
    int _1600 = ~_1038;
    int _1602 = _1600 + _1160;
    int _1604 = _1602 + 1;
    float _1606 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1578);
    float _1608 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1548);
    float _1610 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1574);
    if (_1566)
    {
        float _1612 = _1552 * _1512;
        _129 = _1612;
    }
    float _1614 = _129;
    float _1616 = trunc(_1406);
    int _1618 = int(_1616);
    int _1620 = _703 * _1588;
    int _1622 = _1620 + _807;
    float _1624 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1516);
    int _1626 = _1540 * _1596;
    int _1628 = _1626 + _789;
    bool _1630 = _703 == 0;
    float _1632 = _1450 * _1554;
    int _1634 = abs(_962);
    int _1636 = _723 * _1604;
    int _1638 = _1636 + _789;
    float _1640 = _1590 * (-2.0);
    bool _1642 = !_1168;
    int _1644 = _1642 ? 0 : 1;
    float _1646 = _1482 * (-2.0);
    bool _1648 = _723 == 0;
    float _1650 = fma(_1510, _1542, _1542);
    int _1652 = ~_1572;
    int _1654 = _1652 + 1;
    int _1656 = _1654 + 1;
    float _1658 = fma(_1212, _1640, _1212);
    bool _1660 = !_1630;
    int _1662 = _1660 ? _1622 : (-1);
    float _1664 = _1536 + (-0.5);
    float _1666 = fma(_739, _1646, _739);
    float _1668 = _151 + (-0.5);
    int _1670 = ~_1594;
    int _1672 = _1670 + 1;
    int _1674 = _1672 + 1;
    float _1676 = trunc(_1408);
    int _1678 = int(_1676);
    bool _1680 = !_1648;
    int _1682 = _1680 ? _1638 : (-1);
    float _1684 = fma(_1646, _1544, _1544);
    float _1686 = _155 + (-0.5);
    int _1688 = _1618 * _1634;
    int _1690 = _1688 + _807;
    float _1692 = -_1664;
    float _1694 = -_1576;
    float _1696 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1694);
    int _1698 = _1662 * _1656;
    int _1700 = _703 + (-1);
    float _1702 = fma(_1640, _1546, _1546);
    int _1704 = _723 + (-1);
    float _1706 = fma(_1686, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1684);
    int _1708 = _1682 * _1674;
    float _1710 = trunc(_1410);
    int _1712 = int(_1710);
    int _1714 = abs(_813);
    float _1716 = fma(_1668, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1650);
    int _1718 = abs(_1644);
    float _1720 = fma(_1582, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1702);
    int _1722 = _1572 * _1700;
    int _1724 = _1722 + _1698;
    float _1726 = fma(_1666, _1614, _1706);
    int _1728 = _1594 * _1704;
    int _1730 = _1728 + _1708;
    bool _1732 = !_1164;
    int _1734 = _1732 ? 0 : 1;
    float _1736 = fma(_1580, _1614, _1716);
    int _1738 = _1724 * _900;
    float _1740 = fma(_1658, _1614, _1720);
    int _1742 = _1730 * _1718;
    bool _1744 = !_1172;
    int _1746 = _1744 ? 0 : 1;
    float _1748 = _1726 * 0.15915493667125701904296875;
    int _1750 = abs(_1734);
    int _1752 = _1678 * _1714;
    int _1754 = _1752 + _1738;
    float _1756 = fma(_1488, 0.5, 0.5);
    int _1758 = abs(_1070);
    float _1760 = -_1606;
    float _1762 = _1760 + 1.0;
    int _1764 = abs(_1746);
    int _1766 = _1690 * _940;
    int _1768 = _1766 + _1754;
    float _1770 = floor(_1756);
    bool _1772 = !_1176;
    int _1774 = _1772 ? 0 : 1;
    int _1776 = _1618 * _1758;
    int _1778 = _1776 + _1768;
    float _1780 = float(uint(_1690));
    int _1782 = _1712 * _1750;
    int _1784 = _1782 + _1742;
    float _1786 = -_1608;
    float _1788 = _1786 + 1.0;
    int _1790 = abs(_1774);
    float _1792 = as_type<float>(_791) * _1780;
    float _1794 = float(uint(_1628));
    int _1796 = _1628 * _1764;
    int _1798 = _1796 + _1784;
    float _1800 = fma(_982, _1788, _1358);
    float _1802 = float(uint(_1778));
    float _1804 = trunc(_1792);
    float _1806 = precise::max(_1804, 0.0);
    uint _1808 = uint(_1806);
    float _1810 = as_type<float>(_809) * _1794;
    int _1812 = _1540 * _1790;
    int _1814 = _1812 + _1798;
    int _1816 = ~_703;
    int _1818 = _1816 + 1;
    float _1820 = as_type<float>(_791) * _1802;
    float _1822 = -_1762;
    float _1824 = fma(_795, _1822, _1348);
    float _1826 = _1498 * _1556;
    float _1828 = float(uint(_1814));
    float _1830 = trunc(_1810);
    float _1832 = precise::max(_1830, 0.0);
    uint _1834 = uint(_1832);
    int _1836 = ~_703;
    int _1838 = _1836 + 1;
    float _1840 = fma(_1526, 0.5, 0.5);
    float _1842 = _1736 * 0.15915493667125701904296875;
    float _1844 = as_type<float>(_809) * _1828;
    int _1846 = ~_723;
    int _1848 = _1846 + 1;
    float _1850 = fma(_1550, 0.5, 0.5);
    float _1852 = _1740 * 0.15915493667125701904296875;
    float _1854 = trunc(_1820);
    float _1856 = precise::max(_1854, 0.0);
    uint _1858 = uint(_1856);
    int _1860 = _1818 * int(_1808);
    int _1862 = _1860 + _1690;
    float _1864 = -_1610;
    float _1866 = _1864 + 1.0;
    float _1868 = -_1770;
    float _1870 = _1756 + _1868;
    float _1872 = _1826 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1874 = _1632 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1876 = float(uint(_1862));
    float _1878 = trunc(_1844);
    float _1880 = precise::max(_1878, 0.0);
    uint _1882 = uint(_1880);
    int _1884 = ~_723;
    int _1886 = _1884 + 1;
    int _1888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1890 = _1888 != 0;
    int _1892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1894 = _1892 != 0;
    int _1896 = _1886 * int(_1834);
    int _1898 = _1896 + _1628;
    bool _1900 = !_1890;
    int _1902 = _1900 ? 0 : 1;
    float _1904 = _1748 * 6.283185482025146484375;
    float _1906 = sin(_1904);
    float _1908 = float(uint(_1898));
    float _1910 = _1748 * 6.283185482025146484375;
    float _1912 = cos(_1910);
    int _1914 = _1848 * int(_1882);
    int _1916 = _1914 + _1814;
    float _1918 = as_type<float>(_809) * _1908;
    float _1920 = floor(_1840);
    float _1922 = as_type<float>(_791) * _1876;
    int _1924 = _1838 * int(_1858);
    int _1926 = _1924 + _1778;
    float _1928 = float(uint(_1916));
    float _1930 = float(uint(_1926));
    float _1932 = _1842 * 6.283185482025146484375;
    float _1934 = sin(_1932);
    float _1936 = as_type<float>(_809) * _1928;
    float _1938 = as_type<float>(_791) * _1930;
    float _1940 = _1842 * 6.283185482025146484375;
    float _1942 = cos(_1940);
    float _1944 = -_1920;
    float _1946 = _1840 + _1944;
    float _1948 = fma(_1946, 2.0, -1.0);
    float _1950 = floor(_1850);
    float _1952 = -_1518;
    float _1954 = _1952 + 1.0;
    float _1956 = -_1866;
    float _1958 = fma(_1020, _1956, _1624);
    float _1960 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _371);
    float _1962 = _1934 * _1906;
    float _1964 = fma(_1536, _1954, _1696);
    float _1966 = _1934 * _1912;
    float _1968 = _1872 * _1960;
    float _1970 = _1852 * 6.283185482025146484375;
    float _1972 = cos(_1970);
    float _1974 = _1942 * _1912;
    out.m_72.x = _1824;
    out.m_72.y = _1800;
    out.m_72.z = _1958;
    out.m_72.w = _1964;
    float _1976 = fma(_1870, 2.0, -1.0);
    float _1978 = _1852 * 6.283185482025146484375;
    float _1980 = sin(_1978);
    float _1982 = -_1950;
    float _1984 = _1850 + _1982;
    float _1986 = trunc(_1922);
    float _1988 = precise::max(_1986, 0.0);
    uint _1990 = uint(_1988);
    float _1992 = _1934 * _1972;
    float _1994 = _1942 * _1906;
    float _1996 = _1942 * _1972;
    float _1998 = _1948 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _2000 = _1912 * _1972;
    float _2002 = _1906 * _1972;
    float _2004 = _1996 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2006 = trunc(_1918);
    float _2008 = precise::max(_2006, 0.0);
    uint _2010 = uint(_2008);
    float _2012 = _1998 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _2014 = _1998 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _2016 = -_1980;
    float _2018 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2004);
    float _2020 = _1998 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _2022 = trunc(_1938);
    float _2024 = precise::max(_2022, 0.0);
    uint _2026 = uint(_2024);
    float _2028 = -_1994;
    float _2030 = fma(_1980, _1966, _2028);
    float _2032 = -_1966;
    float _2034 = fma(_1980, _1994, _2032);
    float _2036 = fma(_1980, _1974, _1962);
    int _2038 = int(_1808) + int(_1990);
    float _2040 = fma(_1980, _1962, _1974);
    float _2042 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _353);
    float _2044 = trunc(_1936);
    float _2046 = precise::max(_2044, 0.0);
    uint _2048 = uint(_2046);
    float _2050 = _1976 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    int _2052 = int(_1834) + int(_2010);
    float _2054 = _1874 * _2042;
    int _2056 = ~_703;
    int _2058 = _2056 + 1;
    float _2060 = fma(_2050, (*spvDescriptorSet0.vp_c12)._m0[2].x, _2012);
    int _2062 = ~_723;
    int _2064 = _2062 + 1;
    float _2066 = -_1968;
    float _2068 = _1980 * _2066;
    int _2070 = int(_1858) + int(_2026);
    float _2072 = _1996 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2074 = fma(_2050, (*spvDescriptorSet0.vp_c12)._m0[2].y, _2014);
    float _2076 = fma(_2000, _2054, _2068);
    float _2078 = fma(_2050, (*spvDescriptorSet0.vp_c12)._m0[2].z, _2020);
    int _2080 = _2058 * _2070;
    int _2082 = _2080 + _1778;
    float _2084 = -_1980;
    float _2086 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2072);
    int _2088 = int(_1882) + int(_2048);
    float _2090 = _1996 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2092 = _1996 * _1968;
    float _2094 = _1992 * _1968;
    bool _2096 = uint(_2082) >= uint(_703);
    float _2098 = -_1980;
    float _2100 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2090);
    float _2102 = fma(_2036, _2054, _2092);
    float _2104 = fma(_2030, _2054, _2094);
    int _2106 = _2064 * _2088;
    int _2108 = _2106 + _1814;
    bool _2110 = !_2096;
    int _2112 = _2110 ? 0 : (-1);
    float _2114 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2018);
    float _2116 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2086);
    float _2118 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _2120 = uint(_2108) >= uint(_723);
    float _2122 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2100);
    int _2124 = ~_2070;
    int _2126 = _2124 + _2112;
    int _2128 = _2126 + 1;
    float _2130 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2132 = !_2120;
    int _2134 = _2132 ? 0 : (-1);
    float _2136 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2138 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2140 = _703 * _2128;
    int _2142 = _2140 + _1778;
    int _2144 = ~_2088;
    int _2146 = _2144 + _2134;
    int _2148 = _2146 + 1;
    float _2150 = fma(_2002, _2118, _2076);
    float _2152 = _2034 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2154 = _2034 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2156 = _2034 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2158 = !_1630;
    int _2160 = _2158 ? _2142 : (-1);
    float _2162 = fma(_2000, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2130);
    float _2164 = fma(_2000, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2136);
    float _2166 = fma(_2000, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2138);
    float _2168 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2152);
    float _2170 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2154);
    float _2172 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2156);
    int _2174 = _723 * _2148;
    int _2176 = _2174 + _1814;
    float _2178 = fma(_2034, _2118, _2102);
    int _2180 = _2160 >> 31;
    float _2182 = fma(_2040, _2118, _2104);
    int _2184 = ~_703;
    int _2186 = _2184 + 1;
    float _2188 = _353 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2190 = _2160 & 3;
    bool _2192 = _2190 != 0;
    float _2194 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2170);
    int _2196 = _2180 & 3;
    float _2198 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2168);
    bool _2200 = !_1648;
    int _2202 = _2200 ? _2176 : (-1);
    float _2204 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2172);
    bool _2206 = uint(_2190) > 1u;
    int _2208 = _2202 >> 31;
    int _2210 = _2186 * _2038;
    int _2212 = _2210 + _1690;
    int _2214 = _2160 & 3;
    bool _2216 = _2214 != 0;
    int _2218 = _2160 + _2196;
    int _2220 = _2208 & 3;
    int _2222 = _2216 ? 0 : 1;
    bool _2224 = uint(_2212) >= uint(_703);
    int _2226 = ~_723;
    int _2228 = _2226 + 1;
    int _2230 = _2202 + _2220;
    int _2232 = ~_2222;
    int _2234 = _2232 + 1;
    int _2236 = _2234 + 1;
    int _2238 = _2228 * _2052;
    int _2240 = _2238 + _1628;
    int _2242 = _2218 >> 2;
    int _2244 = _2236;
    float _2246 = _1976;
    float _2248 = _1948;
    float _2250 = _2182;
    float _2252 = _2122;
    if (!_2206)
    {
        int _2254 = ~_2222;
        int _2256 = _2254 + 1;
        _2244 = _2256;
    }
    int _2258 = _2244;
    int _2260 = _2230 >> 2;
    bool _2262 = uint(_2190) >= 2u;
    int _2264 = _2242 << 4;
    int _2266 = _2264 + 368;
    float _2268 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2162);
    int _2270 = _2260 << 4;
    int _2272 = _2270 + 512;
    float _2274 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2164);
    int _2276 = _2262 ? 0 : 1;
    uint _2278 = uint(int(uint(_2266) >> uint(2)));
    uint _2280 = uint(int(uint(int(_2278)) >> uint(2)));
    int _2282 = int(_2278) & 3;
    float _2284 = (*spvDescriptorSet0.vp_c9)._m0[int(_2280)][_2282];
    int _2286 = int(_2278) + 1;
    uint _2288 = uint(int(uint(_2286) >> uint(2)));
    int _2290 = _2286 & 3;
    float _2292 = (*spvDescriptorSet0.vp_c9)._m0[int(_2288)][_2290];
    bool _2294 = uint(_2240) >= uint(_723);
    float _2296 = _371 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2298 = !_2224;
    int _2300 = _2298 ? 0 : (-1);
    float _2302 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2166);
    bool _2304 = _2190 != 3;
    float _2306 = _2296 * _2114;
    int _2308 = ~_2038;
    int _2310 = _2308 + _2300;
    int _2312 = _2310 + 1;
    uint _2314 = uint(int(uint(_2272) >> uint(2)));
    uint _2316 = uint(int(uint(int(_2314)) >> uint(2)));
    int _2318 = int(_2314) & 3;
    float _2320 = (*spvDescriptorSet0.vp_c9)._m0[int(_2316)][_2318];
    int _2322 = int(_2314) + 1;
    uint _2324 = uint(int(uint(_2322) >> uint(2)));
    int _2326 = _2322 & 3;
    float _2328 = (*spvDescriptorSet0.vp_c9)._m0[int(_2324)][_2326];
    bool _2330 = !_2294;
    int _2332 = _2330 ? 0 : (-1);
    float _2334 = _2296 * _2116;
    int _2336 = ~_2276;
    int _2338 = _2336 + 1;
    int _2340 = _2338 + 1;
    float _2342 = fma(_2188, _2268, _2306);
    int _2344 = ~_2052;
    int _2346 = _2344 + _2332;
    int _2348 = _2346 + 1;
    out.m_74.x = _2268;
    out.m_74.y = _2274;
    out.m_74.z = _2302;
    float _2350 = fma(_2188, _2274, _2334);
    int _2352 = _2266 + 8;
    uint _2354 = uint(int(uint(_2352) >> uint(2)));
    uint _2356 = uint(int(uint(int(_2354)) >> uint(2)));
    int _2358 = int(_2354) & 3;
    float _2360 = (*spvDescriptorSet0.vp_c9)._m0[int(_2356)][_2358];
    int _2362 = int(_2354) + 1;
    uint _2364 = uint(int(uint(_2362) >> uint(2)));
    int _2366 = _2362 & 3;
    float _2368 = (*spvDescriptorSet0.vp_c9)._m0[int(_2364)][_2366];
    bool _2370 = !_2192;
    int _2372 = _2370 ? 0 : 1;
    int _2374 = _723 * _2348;
    int _2376 = _2374 + _1628;
    int _2378 = _2340;
    if (_2304)
    {
        int _2380 = ~_2276;
        int _2382 = _2380 + 1;
        _2378 = _2382;
    }
    int _2384 = _2378;
    int _2386 = _703 * _2312;
    int _2388 = _2386 + _1690;
    int _2390 = _2202 & 3;
    bool _2392 = _2390 != 0;
    float _2394 = _2296 * _2122;
    int _2396 = _2202 & 3;
    bool _2398 = _2396 != 0;
    bool _2400 = uint(_2390) > 1u;
    int _2402 = _2272 + 8;
    uint _2404 = uint(int(uint(_2402) >> uint(2)));
    uint _2406 = uint(int(uint(int(_2404)) >> uint(2)));
    int _2408 = int(_2404) & 3;
    float _2410 = (*spvDescriptorSet0.vp_c9)._m0[int(_2406)][_2408];
    int _2412 = int(_2404) + 1;
    uint _2414 = uint(int(uint(_2412) >> uint(2)));
    int _2416 = _2412 & 3;
    float _2418 = (*spvDescriptorSet0.vp_c9)._m0[int(_2414)][_2416];
    int _2420 = _2398 ? 0 : 1;
    float _2422 = fma(_2188, _2302, _2394);
    bool _2424 = !_2392;
    int _2426 = _2424 ? 0 : 1;
    int _2428 = ~_2420;
    int _2430 = _2428 + 1;
    int _2432 = _2430 + 1;
    float _2434 = _2204 + _2422;
    int _2436 = abs(_2258);
    int _2438 = abs(_2372);
    bool _2440 = uint(_2390) >= 2u;
    int _2442 = _2432;
    if (!_2400)
    {
        int _2444 = ~_2420;
        int _2446 = _2444 + 1;
        _2442 = _2446;
    }
    int _2448 = _2442;
    bool _2450 = _2390 != 3;
    int _2452 = abs(_2448);
    int _2454 = abs(_2426);
    int _2456 = ~_2436;
    int _2458 = _2456 + 1;
    int _2460 = _2458 + 1;
    int _2462 = ~_2452;
    int _2464 = _2462 + 1;
    int _2466 = _2464 + 1;
    int _2468 = _2460 * as_type<int>(_2292);
    int _2470 = _2440 ? 0 : 1;
    int _2472 = abs(_2384);
    int _2474 = _2466 * as_type<int>(_2328);
    int _2476 = ~_2438;
    int _2478 = _2476 + 1;
    int _2480 = _2478 + 1;
    int _2482 = ~_2454;
    int _2484 = _2482 + 1;
    int _2486 = _2484 + 1;
    int _2488 = ~_2470;
    int _2490 = _2488 + 1;
    int _2492 = _2490 + 1;
    int _2494 = _2480 * as_type<int>(_2284);
    int _2496 = _2494 + _2468;
    bool _2498 = _2390 != 3;
    int _2500 = _2486 * as_type<int>(_2320);
    int _2502 = _2500 + _2474;
    int _2504 = _2492;
    if (_2450)
    {
        int _2506 = ~_2470;
        int _2508 = _2506 + 1;
        _2504 = _2508;
    }
    int _2510 = _2504;
    float _2512 = fma(_2296, _2296, 1.0);
    int _2514 = ~_2472;
    int _2516 = _2514 + 1;
    int _2518 = _2516 + 1;
    bool _2520 = _2190 != 3;
    float _2522 = rsqrt(_2512);
    bool _2524 = !_2498;
    int _2526 = _2524 ? 0 : (-1);
    int _2528 = _2518 * as_type<int>(_2360);
    int _2530 = _2528 + _2496;
    int _2532 = abs(_2510);
    bool _2534 = !_2520;
    int _2536 = _2534 ? 0 : (-1);
    int _2538 = abs(_1902);
    bool _2540 = !_1894;
    int _2542 = _2540 ? 0 : 1;
    int _2544 = abs(_2526);
    int _2546 = abs(_2536);
    int _2548 = abs(_2542);
    int _2550 = ~_2532;
    int _2552 = _2550 + 1;
    int _2554 = _2552 + 1;
    int _2556 = ~_2546;
    int _2558 = _2556 + 1;
    int _2560 = _2558 + 1;
    int _2562 = _2554 * as_type<int>(_2410);
    int _2564 = _2562 + _2502;
    int _2566 = _2560 * as_type<int>(_2368);
    int _2568 = _2566 + _2530;
    int _2570 = ~_2544;
    int _2572 = _2570 + 1;
    int _2574 = _2572 + 1;
    int _2576 = ~_2538;
    int _2578 = _2576 + 1;
    int _2580 = _2578 + 1;
    int _2582 = ~_2548;
    int _2584 = _2582 + 1;
    int _2586 = _2584 + 1;
    int _2588 = _2574 * as_type<int>(_2418);
    int _2590 = _2588 + _2564;
    bool _2592 = !_1630;
    int _2594 = _2592 ? _2388 : (-1);
    int _2596 = _2568 * _2580;
    bool _2598 = !_1648;
    int _2600 = _2598 ? _2376 : (-1);
    float _2602 = _2296 * _2522;
    int _2604 = _2590 * _2586;
    bool _2606 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _2608 = isnan(1.0);
    bool _2610 = _2606 || _2608;
    bool _2612 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _2614 = _2610 || _2612;
    int _2616 = _2594 * _2538;
    int _2618 = _2616 + _2596;
    float _2620 = -_2198;
    float _2622 = _2602 * _2620;
    float _2624 = -_2194;
    float _2626 = _2602 * _2624;
    float _2628 = -_2204;
    float _2630 = _2602 * _2628;
    int _2632 = _2600 * _2548;
    int _2634 = _2632 + _2604;
    float _2636 = fma(_2522, _2114, _2622);
    float _2638 = fma(_2522, _2116, _2626);
    float _2640 = fma(_2522, _2122, _2630);
    float _2642 = _2198 + _2342;
    float _2644 = _2194 + _2350;
    float _2646 = float(_2618);
    float _2648 = _2178 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2650 = float(_2634);
    out.m_76.x = _2636;
    out.m_76.y = _2638;
    out.m_76.z = _2640;
    float _2652 = _2178 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2654 = fma(_1984, 2.0, -1.0);
    float _2656 = _2178 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_78.x = _2646;
    out.m_78.y = _2650;
    float _2658 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2648);
    float _2660 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2652);
    float _2662 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2656);
    out.m_80.x = _2642;
    out.m_80.y = _2644;
    out.m_80.z = _2434;
    float _2664 = _2654 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _2666 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2658);
    float _2668 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2660);
    float _2670 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2662);
    float _2672 = fma(_2664, (*spvDescriptorSet0.vp_c12)._m0[4].x, _2060);
    float _2674 = fma(_2664, (*spvDescriptorSet0.vp_c12)._m0[4].y, _2074);
    float _2676 = fma(_2664, (*spvDescriptorSet0.vp_c12)._m0[4].z, _2078);
    float _2678 = _2666 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2680 = _2672 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _2682 = _2674 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _2684 = _2676 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _2686 = _2668 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2688 = _2670 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2690 = _2678 + _2680;
    float _2692 = _2686 + _2682;
    float _2694 = _2688 + _2684;
    float _2696 = as_type<float>(_2538);
    float _2698 = _2646;
    float _2700 = _2650;
    float _2702 = _2668;
    float _2704 = _2686;
    float _2706 = _2668;
    float _2708 = _2638;
    float _2710 = _2636;
    float _2720;
    float _2722;
    float _2724;
    float _2726;
    if (!_2614)
    {
        bool _2712 = _2682 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _2714 = !_2712;
        _2716 = _2714;
        if (!_2716)
        {
            float _2718 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _2720 = _2718;
            _2722 = 0.0;
            _2724 = 0.0;
            _2726 = 0.0;
            _2728 = true;
        }
    }
    if ((!_2728) || _2716)
    {
        bool _2764;
        if (!_2716)
        {
            bool _2730 = _2682 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _2732 = isnan(_2682);
            bool _2734 = _2730 || _2732;
            bool _2736 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _2738 = _2734 || _2736;
            bool _2740 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _2742 = !_2738;
            bool _2744 = _2740 && _2742;
            bool _2746 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            _2704 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_2744)
            {
                _2696 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _2748 = _2696;
            float _2750 = _2748;
            if (_2744)
            {
                _2698 = 0.0;
                _2700 = 0.0;
            }
            float _2752 = _2698;
            float _2754 = _2700;
            _2722 = _2752;
            _2724 = _2754;
            if (_2744)
            {
                _2702 = 0.0;
            }
            float _2756 = _2702;
            _2706 = _2756;
            _2726 = _2756;
            if (_2744)
            {
                float _2758 = _2748 * 5.0;
                _2750 = _2758;
            }
            float _2760 = _2750;
            bool _2762 = !_2738;
            _2764 = _2762 && _2746;
            _2720 = _2760;
        }
        if ((!_2764) || _2716)
        {
            _2716 = false;
            float _2766 = _2704;
            float _2768 = _2706;
            bool _2770 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _2772 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _2774 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _2776 = _2678;
            float _2778 = _2766;
            float _2780 = _2768;
            _2720 = _2694;
            _2722 = _2690;
            _2724 = _2692;
            if (_2770)
            {
                float _2782 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _2776 = _2782;
            }
            float _2784 = _2776;
            if (_2770)
            {
                float _2786 = abs(_1976);
                float _2788 = -_2786;
                float _2790 = _2788 + 1.0;
                _2246 = _2790;
            }
            float _2792 = _2246;
            if (_2772)
            {
                float _2794 = abs(_1948);
                float _2796 = -_2794;
                float _2798 = _2796 + 1.0;
                _2248 = _2798;
            }
            float _2800 = _2248;
            if (!_2770)
            {
                _2708 = 1.0;
            }
            float _2802 = _2708;
            float _2804 = _2802;
            if (_2774)
            {
                float _2806 = abs(_2654);
                float _2808 = -_2806;
                float _2810 = _2808 + 1.0;
                _2710 = _2810;
            }
            float _2812 = _2710;
            if (!_2772)
            {
                _2778 = 1.0;
            }
            float _2814 = _2778;
            float _2816 = _2814;
            if (!_2774)
            {
                _2780 = 1.0;
            }
            float _2818 = _2780;
            float _2820 = _2640;
            float _2822 = _2818;
            if (_2772)
            {
                float _2824 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _2820 = _2824;
            }
            float _2826 = _2820;
            float _2828 = _2194;
            if (_2774)
            {
                float _2830 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _2828 = _2830;
            }
            float _2832 = _2828;
            if (_2770)
            {
                float _2834 = _2792 * _2784;
                float _2836 = precise::clamp(_2834, 0.0, 1.0);
                _2804 = _2836;
            }
            float _2838 = _2804;
            if (_2772)
            {
                float _2840 = _2800 * _2826;
                float _2842 = precise::clamp(_2840, 0.0, 1.0);
                _2816 = _2842;
            }
            float _2844 = _2816;
            float _2846 = _2838 * _2844;
            if (_2774)
            {
                float _2848 = _2812 * _2832;
                float _2850 = precise::clamp(_2848, 0.0, 1.0);
                _2822 = _2850;
            }
            float _2852 = _2822;
            float _2854 = _2846 * _2852;
            _2726 = _2854;
        }
    }
    _2728 = false;
    float _2856 = _2720;
    float _2858 = _2722;
    float _2860 = _2724;
    float _2862 = _2726;
    float _2864 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2866 = _2856 + _2864;
    float _2868 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2870 = _2858 + _2868;
    float _2872 = _2682 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2874 = _2866 * _2866;
    bool _2876 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2878 = isnan(0.5);
    bool _2880 = _2876 || _2878;
    bool _2882 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2884 = _2880 || _2882;
    float _2886 = fma(_2680, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2872);
    bool _2888 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2890 = isnan(0.5);
    bool _2892 = _2888 || _2890;
    bool _2894 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2896 = _2892 || _2894;
    float _2898 = fma(_2870, _2870, _2874);
    float _2900 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2886);
    float _2902 = _2682 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2904 = sqrt(_2898);
    float _2906 = _2900 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2908 = fma(_2680, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2902);
    float _2910 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2908);
    float _2912 = 1.0 / _2906;
    float _2914 = _2910 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2916 = _2914 + _2906;
    bool _2918 = _2904 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2920 = _2916 * _2912;
    float _2922 = _2920 * 0.5;
    bool _2924 = !_2918;
    float _2926 = _2858;
    float _2928 = _2860;
    float _2930 = _2856;
    float _2932 = _2912;
    float _2934 = _2866;
    if (!_2924)
    {
        float _2936 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2938 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2940 = _2904 + _2938;
        float _2942 = _2860 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2944 = rsqrt(_2898);
        float _2946 = _2940 * _2936;
        float _2948 = _2946 * 0.15915493667125701904296875;
        float _2950 = _2948 * 6.283185482025146484375;
        float _2952 = cos(_2950);
        float _2954 = _2948 * 6.283185482025146484375;
        float _2956 = sin(_2954);
        float _2958 = _2952 + (-1.0);
        float _2960 = _2958 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2962 = fma(_2956, _2942, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2964 = fma(_2952, _2860, _2960);
        float _2966 = _2944 * _2962;
        float _2968 = fma(_2870, _2966, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2970 = fma(_2866, _2966, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2926 = _2968;
        _2928 = _2964;
        _2930 = _2970;
        _2932 = _2966;
    }
    float _2972 = _2926;
    float _2974 = _2928;
    float _2976 = _2930;
    float _2978 = _2932;
    float _2980 = _2974;
    float _2982 = _2972;
    float _2984 = _2976;
    float _2986 = _2978;
    if (_2896)
    {
        _2250 = 1.0;
    }
    float _2988 = _2250;
    float _2990 = _2988;
    if (!_2884)
    {
        float _2992 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2994 = _2682 + _2992;
        float _2996 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2998 = _2680 + _2996;
        float _3000 = _2994 * _2994;
        float _3002 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3004 = _2684 + _3002;
        float _3006 = fma(_2998, _2998, _3000);
        float _3008 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3010 = fma(_3004, _3004, _3006);
        float _3012 = -_2680;
        float _3014 = _3012 + _2972;
        float _3016 = sqrt(_3010);
        float _3018 = precise::min(_3016, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3020 = _3018 * _3008;
        float _3022 = -_2682;
        float _3024 = _3022 + _2974;
        float _3026 = -_2684;
        float _3028 = _3026 + _2976;
        float _3030 = fma(_3014, _3020, _2680);
        float _3032 = fma(_3024, _3020, _2682);
        float _3034 = fma(_3028, _3020, _2684);
        _2980 = _3032;
        _2982 = _3030;
        _2984 = _3034;
        _2986 = _3020;
    }
    float _3036 = _2980;
    float _3038 = _2982;
    float _3040 = _2984;
    float _3042 = _2986;
    if (!_2896)
    {
        float _3044 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3046 = fma(_2922, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3044);
        float _3048 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3050 = _3048 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _3052 = 1.0 / _3046;
        float _3054 = 1.0 / _3050;
        float _3056 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3058 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3060 = fma(_3052, _3056, _3058);
        float _3062 = _3060 * _3054;
        float _3064 = precise::clamp(_3062, 0.0, 1.0);
        _2990 = _3064;
    }
    float _3066 = _2990;
    float _3068 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3070 = _3036 + _3068;
    float _3072 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3074 = _3038 + _3072;
    float _3076 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3078 = _3040 + _3076;
    float _3080 = _3070 * _3070;
    float _3082 = fma(_3074, _3074, _3080);
    float _3084 = fma(_3078, _3078, _3082);
    float _3086 = rsqrt(_3084);
    float _3088 = sqrt(_3084);
    float _3090 = _3086 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3092 = _3074 * _3090;
    float _3094 = _3078 * _3090;
    float _3096 = _3092 * _3092;
    float _3098 = _3094 * _3094;
    float _3100 = _3096 + _3098;
    float _3102 = sqrt(_3100);
    bool _3104 = _3102 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3106 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3108 = _3102 + _3106;
    float _3110 = _3086;
    float _3112 = _3108;
    float _3114 = _3070;
    float _3116 = _3092;
    if (_3104)
    {
        float _3118 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3110 = _3118;
    }
    float _3120 = _3110;
    float _3122 = _3120;
    if (_3104)
    {
        float _3124 = _3108 * _3120;
        _3112 = _3124;
    }
    float _3126 = _3112;
    if (_3104)
    {
        float _3128 = rsqrt(_3100);
        _3122 = _3128;
    }
    float _3130 = _3122;
    float _3132 = _3130;
    if (_3104)
    {
        float _3134 = _3126 * 0.15915493667125701904296875;
        _2934 = _3134;
    }
    float _3136 = _2934;
    float _3138 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3140 = _3078;
    if (_3104)
    {
        float _3142 = _3136 * 6.283185482025146484375;
        float _3144 = sin(_3142);
        _3140 = _3144;
    }
    float _3146 = _3140;
    float _3148 = precise::max(0.0, _3138);
    float _3150 = _3042;
    float _3152 = _3148;
    if (_3104)
    {
        float _3154 = _3136 * 6.283185482025146484375;
        float _3156 = cos(_3154);
        _3150 = _3156;
    }
    float _3158 = _3150;
    float _3160 = -_3090;
    float _3162 = -_3148;
    float _3164 = fma(_3070, _3160, _3162);
    if (_3104)
    {
        float _3166 = _3164 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3114 = _3166;
    }
    float _3168 = _3114;
    float _3170 = _3146;
    float _3172 = _3168;
    if (_3104)
    {
        float _3174 = fma(_3146, _3168, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3170 = _3174;
    }
    float _3176 = _3170;
    float _3178 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3180 = _3176;
    if (_3104)
    {
        float _3182 = _3130 * _3176;
        _2252 = _3182;
    }
    float _3184 = _2252;
    if (!_3104)
    {
        _3132 = _3164;
    }
    float _3186 = _3132;
    float _3188 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3178);
    float _3190 = _3186;
    if (_3104)
    {
        float _3192 = _3158 + (-1.0);
        _3152 = _3192;
    }
    float _3194 = _3152;
    float _3196 = _3194;
    if (_3104)
    {
        float _3198 = _3092 * _3184;
        _3116 = _3198;
    }
    float _3200 = _3116;
    if (!_3104)
    {
        _3180 = _3094;
    }
    float _3202 = _3180;
    float _3204 = _3202;
    if (_3104)
    {
        float _3206 = _3094 * _3184;
        _3204 = _3206;
    }
    float _3208 = _3204;
    if (_3104)
    {
        float _3210 = _3194 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3172 = _3210;
    }
    float _3212 = _3172;
    float _3214 = _3212;
    if (!_3104)
    {
        _3196 = _3096;
    }
    float _3216 = _3196;
    float _3218 = _3216;
    if (_3104)
    {
        float _3220 = _3200 * _3200;
        _3218 = _3220;
    }
    float _3222 = _3218;
    float _3224 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_3104)
    {
        float _3226 = fma(_3164, _3158, _3212);
        _3190 = _3226;
    }
    float _3228 = _3190;
    if (!_3104)
    {
        _3214 = _3098;
    }
    float _3230 = _3214;
    float _3232 = _3230;
    if (_3104)
    {
        float _3234 = _3208 * _3208;
        _3232 = _3234;
    }
    float _3236 = _3232;
    float _3238 = fma(_3228, _3228, _3222);
    float _3240 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3224);
    float _3242 = _3238 + _3236;
    float _3244 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3246 = fma(_3088, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3244);
    float _3248 = precise::clamp(_3246, 0.0, 1.0);
    float _3250 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3252 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3188);
    float _3254 = rsqrt(_3242);
    float _3256 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3258 = -_3248;
    float _3260 = _3258 + 1.0;
    float _3262 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3250);
    float _3264 = _3252 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3266 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3256);
    float _3268 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3270 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3240);
    float _3272 = abs(_3260);
    float _3274 = log2(_3272);
    float _3276 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3262);
    float _3278 = _3264 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3280 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3266);
    float _3282 = _3276 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3284 = -_3278;
    float _3286 = fma(_3284, _3268, 1.0);
    float _3288 = _3280 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3290 = _3270 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3292 = _3254 * _3200;
    float _3294 = _3282 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3296 = _3254 * _3228;
    float _3298 = _3254 * _3208;
    float _3300 = _3292 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3302 = fma(_3288, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3294);
    float _3304 = log2(_3286);
    float _3306 = _3274 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3308 = -_3300;
    float _3310 = fma(_3296, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3308);
    float _3312 = fma(_3264, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3302);
    float _3314 = _3296 + 1.0;
    float _3316 = -_3298;
    float _3318 = fma(_3316, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3310);
    float _3320 = fma(_3290, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3312);
    float _3322 = _3282 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3324 = _3282 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3326 = fma(_3318, -0.5, 0.5);
    float _3328 = 1.0 / _3320;
    float _3330 = fma(_3318, 0.5, 0.5);
    float _3332 = fma(_3288, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3322);
    float _3334 = fma(_3288, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3324);
    float _3336 = fma(_3330, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3338 = fma(_3264, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3332);
    float _3340 = fma(_3264, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3334);
    float _3342 = exp2(_3306);
    float _3344 = fma(_3330, _3336, -0.212114393711090087890625);
    float _3346 = fma(_3290, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3338);
    float _3348 = fma(_3290, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3340);
    float _3350 = _3304 * 0.693147182464599609375;
    float _3352 = fma(_3330, _3344, 1.570728778839111328125);
    float _3354 = sqrt(_3326);
    float _3356 = _3346 * _3328;
    float _3358 = _3348 * _3328;
    float _3360 = _3350 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3362 = fma(_3356, 0.5, 0.5);
    float _3364 = fma(_3358, -0.5, 0.5);
    float _3366 = -_3296;
    float _3368 = fma(_3342, _3314, _3366);
    float _3370 = fma(_3368, 0.5, 0.5);
    float _3372 = _3354 * 0.636619746685028076171875;
    float _3374 = -_3352;
    float _3376 = fma(_3372, _3374, 1.0);
    float3 _9041 = float3(_3362, _3364, _3360);
    float _3378 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9041, float3(0.0), isnan(_9041)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9041, float3(0.0), isnan(_9041)), level(0.0)).x;
    float3 _9052 = float3(_3362, _3364, _3360);
    float4 _3381 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9052, float3(0.0), isnan(_9052)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9052, float3(0.0), isnan(_9052)), level(0.0)).xyzw;
    float _3383 = _3381.x;
    float _3385 = _3381.y;
    float _3387 = _3381.z;
    float _3389 = _3381.w;
    float2 _9069 = float2(_3376, _3370);
    float3 _3393 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9069, float2(0.0), isnan(_9069)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9069, float2(0.0), isnan(_9069)), level(0.0)).xyz;
    float _3395 = _3393.x;
    float _3397 = _3393.y;
    float _3399 = _3393.z;
    float _3401 = _2682 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3403 = _2682 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3405 = _2682 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3407 = _2682 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3409 = fma(_2680, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3401);
    float _3411 = fma(_2680, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3403);
    out.m_82.x = _2680;
    out.m_82.y = _2682;
    out.m_82.z = _2684;
    float _3413 = fma(_2680, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3405);
    float _3415 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3409);
    float _3417 = fma(_2680, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3407);
    out.m_84.y = 1.0;
    float _3419 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3411);
    float _3421 = _3415 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3423 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3413);
    float _3425 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3417);
    float _3427 = _3419 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3429 = -_645;
    float _3431 = _3429 + _3040;
    float _3433 = _3282 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3435 = -_641;
    float _3437 = _3435 + _3036;
    float _3439 = -_639;
    float _3441 = _3439 + _3038;
    float _3443 = _3421 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3445 = _3421 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3447 = _3437 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _3449 = _3421 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3451 = _3421 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3453 = _3423 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3455 = fma(_3441, (*spvDescriptorSet0.vp_c15)._m0[638].x, _3447);
    float _3457 = fma(_3427, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3443);
    float _3459 = fma(_3427, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3445);
    float _3461 = fma(_3427, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3449);
    float _3463 = fma(_3427, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3451);
    float _3465 = fma(_3431, (*spvDescriptorSet0.vp_c15)._m0[638].z, _3455);
    float _3467 = _3437 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _3469 = _3437 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _3471 = _3453 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _3473 = _3465 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _3475 = fma(_3288, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3433);
    float _3477 = _3425 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3479 = _3471 + _3463;
    float _3481 = _3274 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3483 = fma(_3264, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3475);
    float _3485 = 1.0 / _3473;
    float _3487 = fma(_3477, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3479);
    float _3489 = fma(_3441, (*spvDescriptorSet0.vp_c15)._m0[635].x, _3467);
    float _3491 = fma(_3441, (*spvDescriptorSet0.vp_c15)._m0[636].x, _3469);
    float _3493 = fma(_3453, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3461);
    float _3495 = fma(_3290, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3483);
    float _3497 = fma(_3431, (*spvDescriptorSet0.vp_c15)._m0[635].z, _3489);
    float _3499 = _3453 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _3501 = exp2(_3481);
    float _3503 = fma(_3477, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3493);
    float _3505 = fma(_3431, (*spvDescriptorSet0.vp_c15)._m0[636].z, _3491);
    float _3507 = _3497 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _3509 = _3499 + _3457;
    float _3511 = _3320 * 0.5;
    float _3513 = _3505 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _3515 = _3453 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _3517 = 1.0 / _3487;
    float _3519 = _3507 * _3485;
    out.gl_Position.x = _3346;
    out.gl_Position.y = _3348;
    out.gl_Position.z = _3495;
    out.gl_Position.w = _3320;
    float _3521 = _3495 + _3320;
    float _3523 = _3346 + _3320;
    float _3525 = fma(_3477, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3509);
    float _3527 = fma(_3348, -0.5, _3511);
    float _3529 = _3513 * _3485;
    float _3531 = -_3501;
    float _3533 = _3531 + 1.0;
    float _3535 = _3515 + _3459;
    float _3537 = _3521 * 0.5;
    float _3539 = _3533 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3541 = _3523 * 0.5;
    out.m_86.x = _3038;
    out.m_86.y = _3036;
    out.m_86.z = _3040;
    float _3543 = fma(_3477, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3535);
    float _3545 = _3503 * _3517;
    float _3547 = _3525 * _3517;
    out.m_88.x = _3541;
    out.m_88.y = _3527;
    out.m_88.z = _3537;
    out.m_88.w = _3320;
    bool _3549 = _3545 > 0.0;
    bool _3551 = _3545 < 1.0;
    bool _3553 = _3551 && _3549;
    bool _3555 = _3356 > (-1.0);
    bool _3557 = _3555 && _3553;
    bool _3559 = _3358 > (-1.0);
    bool _3561 = _3559 && _3557;
    bool _3563 = _3356 < 1.0;
    bool _3565 = _3563 && _3561;
    bool _3567 = _3358 < 1.0;
    bool _3569 = _3567 && _3565;
    float _3571 = _3539 * _3378;
    float _3573 = _3543 * _3517;
    float _3575 = _3389 * _3571;
    float _3577 = _3399 * _3571;
    float _3579 = -_3539;
    float _3581 = _3579 + 1.0;
    float _3583 = fma(_3395, _3575, _3383);
    float _3585 = fma(_3397, _3575, _3385);
    float _3587 = _3389 * _3581;
    float _3589 = fma(_3389, _3577, _3387);
    out.m_90.x = _3583;
    out.m_90.y = _3585;
    out.m_90.z = _3589;
    out.m_90.w = _3587;
    bool _3591 = !_3569;
    float _3593 = _3581;
    float _3595 = _3587;
    float _3597 = _3346;
    float _3599 = _3589;
    float _3629;
    float _3631;
    float _3633;
    float _3641;
    if (!_3591)
    {
        float _3601 = -_3573;
        float _3603 = _3358 + _3601;
        float _3605 = -_3547;
        float _3607 = _3356 + _3605;
        float _3609 = _2862 * _3066;
        float _3611 = -_3519;
        float _3613 = _3356 + _3611;
        float _3615 = _3603 * _3603;
        float _3617 = -_3529;
        float _3619 = _3358 + _3617;
        float _3621 = _3609 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
        float _3623 = fma(_3607, _3607, _3615);
        float _3625 = sqrt(_3623);
        bool _3627 = _3625 > 0.0;
        _3629 = _3607;
        _3631 = _3623;
        _3633 = _3625;
        if (!_3627)
        {
            _3593 = _3621;
        }
        float _3635 = _3593;
        bool _3637 = !_3627;
        float _3639 = _3635;
        _3641 = _3635;
        _3643 = _3637;
        if (!_3643)
        {
            float _3645 = _3619 * _3619;
            float _3647 = fma(_3613, _3613, _3645);
            float _3649 = rsqrt(_3623);
            float _3651 = sqrt(_3647);
            float _3653 = _3607 * _3649;
            float _3655 = _3603 * _3649;
            bool _3657 = _3651 > 0.0;
            _3599 = _3651;
            _3633 = _3649;
            if (!_3657)
            {
                _3639 = _3621;
            }
            float _3659 = _3639;
            bool _3661 = !_3657;
            _3641 = _3659;
            _3643 = _3661;
            if (!_3643)
            {
                float _3663 = _1874 * _3477;
                float _3665 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
                float _3667 = fma(_3663, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3471);
                float _3669 = fma(_3663, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3515);
                float _3671 = fma(_3663, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3499);
                float _3673 = fma(_3477, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3667);
                float _3675 = fma(_3477, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3669);
                float _3677 = fma(_3477, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3671);
                float _3679 = rsqrt(_3647);
                float _3681 = _3665 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _3683 = 1.0 / _3673;
                float _3685 = _3619 * _3681;
                float _3687 = _3613 * _3681;
                float _3689 = _3685 * _3685;
                float _3691 = fma(_3687, _3687, _3689);
                float _3693 = _3619 * _3679;
                float _3695 = _3613 * _3679;
                float _3697 = _3655 * _3693;
                float _3699 = _3675 * _3683;
                float _3701 = _3677 * _3683;
                float _3703 = sqrt(_3691);
                float _3705 = fma(_3653, _3695, _3697);
                float _3707 = _3699 * _3699;
                float _3709 = fma(_3701, _3701, _3707);
                float _3711 = precise::min(0.0, _3705);
                float _3713 = sqrt(_3709);
                float _3715 = _3320 * _3711;
                float _3717 = fma(_3687, _3715, _3346);
                float _3719 = fma(_3685, _3715, _3348);
                out.gl_Position.x = _3717;
                out.gl_Position.y = _3719;
                float _3721 = fma(_3703, (*spvDescriptorSet0.vp_c13)._m0[1].x, _3713);
                float _3723 = 1.0 / _3721;
                float _3725 = _3713 * _3723;
                out.m_84.y = _3725;
                _3629 = _3715;
                _3595 = _3703;
                _3641 = _3621;
                _3597 = _3717;
                _3631 = _3687;
                _3599 = _3685;
                _3633 = _3725;
                _3643 = true;
            }
        }
    }
    else
    {
        float _3727 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _3727;
        _3629 = 0.0;
        _3641 = 0.0;
        _3631 = 0.0;
        _3599 = _3727;
        _3633 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    _3643 = false;
    float _3729 = _3629;
    float _3731 = _3595;
    float _3733 = _3641;
    float _3735 = _3597;
    float _3737 = _3631;
    float _3739 = _3599;
    float _3741 = _3633;
    bool _3743 = _3088 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3745 = isnan(_3088);
    bool _3747 = _3743 || _3745;
    bool _3749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3751 = _3747 || _3749;
    float _3753 = _3735;
    float _3755 = _3731;
    float _3757 = _3739;
    float _3759 = _3737;
    float _3761 = _3729;
    float _3763 = _3741;
    if (!_3751)
    {
        _3753 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3765 = _3753;
    float _3767 = _3765;
    float _3769 = _3765;
    if (!_3751)
    {
        _3755 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3771 = _3755;
    float _3773 = _3771;
    float _3775 = _3771;
    if (!_3751)
    {
        _3757 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3777 = _3757;
    float _3779 = _3777;
    float _3781 = _3777;
    if (!_3751)
    {
        _3759 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3783 = _3759;
    float _3785 = _3783;
    float _3787 = _3783;
    if (!_3751)
    {
        _3761 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3789 = _3761;
    float _3791 = _3789;
    float _3793 = _3789;
    if (!_3751)
    {
        _3763 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3795 = _3763;
    bool _3797 = !_3751;
    float _3799 = _3795;
    float _3801 = _3795;
    if (!_3797)
    {
        bool _3803 = _3088 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3805 = isnan(_3088);
        bool _3807 = _3803 || _3805;
        bool _3809 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3811 = _3807 || _3809;
        if (!_3811)
        {
            float _3813 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3815 = _3088 + _3813;
            float _3817 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3819 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3817;
            float _3821 = 1.0 / _3819;
            float _3823 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3825 = _3823 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3827 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3829 = _3827 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3831 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3833 = _3831 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3835 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3837 = _3835 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3839 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3841 = _3839 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3843 = _3815 * _3821;
            float _3845 = precise::clamp(_3843, 0.0, 1.0);
            float _3847 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3849 = _3847 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3851 = fma(_3845, _3825, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3853 = fma(_3845, _3849, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3855 = fma(_3845, _3829, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3857 = fma(_3845, _3833, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3859 = fma(_3845, _3837, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3861 = fma(_3845, _3841, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3775 = _3853;
            _3793 = _3859;
            _3769 = _3851;
            _3787 = _3857;
            _3781 = _3855;
            _3801 = _3861;
            _3863 = true;
        }
        else
        {
            bool _3865 = _3088 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3867 = isnan(_3088);
            bool _3869 = _3865 || _3867;
            bool _3871 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3873 = _3869 || _3871;
            if (!_3873)
            {
                _3767 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3875 = _3767;
            _3769 = _3875;
            if (!_3873)
            {
                _3773 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3877 = _3773;
            _3775 = _3877;
            if (!_3873)
            {
                _3779 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3879 = _3779;
            _3781 = _3879;
            if (!_3873)
            {
                _3785 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3881 = _3785;
            _3787 = _3881;
            if (!_3873)
            {
                _3791 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3883 = _3791;
            _3793 = _3883;
            if (!_3873)
            {
                _3799 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3885 = _3799;
            bool _3887 = !_3873;
            _3801 = _3885;
            if (!_3887)
            {
                bool _3889 = _3088 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3891 = isnan(_3088);
                bool _3893 = _3889 || _3891;
                bool _3895 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3897 = _3893 || _3895;
                if (!_3897)
                {
                    float _3899 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3901 = _3088 + _3899;
                    float _3903 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3905 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3903;
                    float _3907 = 1.0 / _3905;
                    float _3909 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3911 = _3909 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3913 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3915 = _3913 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3917 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3919 = _3917 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3921 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3923 = _3921 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3925 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3927 = _3925 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3929 = _3901 * _3907;
                    float _3931 = precise::clamp(_3929, 0.0, 1.0);
                    float _3933 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3935 = _3933 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3937 = fma(_3931, _3911, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3939 = fma(_3931, _3935, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3941 = fma(_3931, _3915, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3943 = fma(_3931, _3919, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3945 = fma(_3931, _3923, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3947 = fma(_3931, _3927, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3775 = _3939;
                    _3793 = _3945;
                    _3769 = _3937;
                    _3787 = _3943;
                    _3781 = _3941;
                    _3801 = _3947;
                    _3863 = true;
                }
                else
                {
                    _3775 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3793 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3769 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3787 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3781 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3801 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3863 = false;
    float _3949 = _3775;
    float _3951 = _3793;
    float _3953 = _3769;
    float _3955 = _3787;
    float _3957 = _3781;
    float _3959 = _3801;
    float _3961 = fma(_2644, -0.5, 0.5);
    float _3963 = precise::clamp(_3961, 0.0, 1.0);
    float _3965 = -_3949;
    float _3967 = _3965 + _3951;
    float _3969 = _3733 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3971 = -_3953;
    float _3973 = _3971 + _3955;
    float _3975 = fma(_3963, _3967, _3949);
    out.m_92.x = 0.0;
    float _3977 = -_3957;
    float _3979 = _3977 + _3959;
    float _3981 = fma(_3963, _3973, _3953);
    float _3983 = _3975 * 0.586610972881317138671875;
    out.m_53.x = _3969;
    bool _3985 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3987 = fma(_3963, _3979, _3957);
    float _3989 = fma(_3981, 0.298911988735198974609375, _3983);
    bool _3991 = _3066 > 0.0;
    bool _3993 = isnan(_3066);
    bool _3995 = _3991 || _3993;
    bool _3997 = isnan(0.0);
    bool _3999 = _3995 || _3997;
    float _4001 = fma(_3987, 0.114477999508380889892578125, _3989);
    float _4003 = -_4001;
    float _4005 = _3981 + _4003;
    float _4007 = -_4001;
    float _4009 = _3975 + _4007;
    float _4011 = -_4001;
    float _4013 = _3987 + _4011;
    float _4015 = fma(_4005, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4001);
    float _4017 = fma(_4009, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4001);
    float _4019 = fma(_4013, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4001);
    bool _4021 = !_3985;
    if (!_4021)
    {
        float _4023 = -_3036;
        float _4025 = _4023 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4027 = -_3038;
        float _4029 = _4027 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4031 = -_3040;
        float _4033 = _4031 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4035 = _4025 * _4025;
        float _4037 = fma(_4029, _4029, _4035);
        float _4039 = fma(_4033, _4033, _4037);
        float _4041 = sqrt(_4039);
        float _4043 = rsqrt(_4039);
        float _4045 = -_4041;
        float _4047 = _4045 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4049 = _4047 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4051 = precise::clamp(_4049, 0.0, 1.0);
        float _4053 = _4029 * _4043;
        float _4055 = _4025 * _4043;
        float _4057 = abs(_4051);
        float _4059 = log2(_4057);
        float _4061 = _4033 * _4043;
        float _4063 = _4053 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4065 = _2644 * _4055;
        float _4067 = -_4055;
        float _4069 = -_4063;
        float _4071 = fma(_4067, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4069);
        float _4073 = fma(_2642, _4053, _4065);
        float _4075 = -_4061;
        float _4077 = fma(_4075, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4071);
        float _4079 = fma(_2434, _4061, _4073);
        float _4081 = precise::clamp(_4079, 0.0, 1.0);
        float _4083 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4085 = _4077 + _4083;
        float _4087 = _4059 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4089 = _4085 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4091 = precise::clamp(_4089, 0.0, 1.0);
        float _4093 = exp2(_4087);
        float _4095 = _4093 * _4091;
        float _4097 = _4081 * _4095;
        float _4099 = _4097 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4101 = _4097 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4103 = _4097 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _4099;
        out.m_92.y = _4101;
        out.m_92.z = _4103;
    }
    out.m_94.x = _4015;
    out.m_94.y = _4017;
    out.m_94.z = _4019;
    if (_3999)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _4105 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4105;
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
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3863 = false;
    bool _3643 = false;
    bool _2728 = false;
    bool _2716 = false;
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
        float _4173 = as_type<float>(_137);
        out.gl_Position.z = _4173;
    }
    if (!_123)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _4236 = as_type<float>(_169);
        out.gl_Position.z = _4236;
    }
    out.m_57.y = _155;
    out.m_57.z = _163;
    if (_161)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _171 = in.m_59.x;
    float _173 = in.m_59.y;
    float _175 = in.m_59.z;
    float _177 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _179 = in.m_61.x;
    float _181 = in.m_61.y;
    float _183 = in.m_61.z;
    float _185 = in.m_63.x;
    float _187 = in.m_63.y;
    float _189 = in.m_63.z;
    float _191 = in.m_48.x;
    float _193 = in.m_48.y;
    float _195 = in.m_48.z;
    float _197 = _171 * _171;
    float _199 = _173 * _173;
    float _201 = fma(_179, _179, _197);
    float _203 = fma(_181, _181, _199);
    float _205 = fma(_185, _185, _201);
    float _207 = _175 * _175;
    float _209 = fma(_187, _187, _203);
    float _211 = sqrt(_205);
    float _213 = fma(_183, _183, _207);
    float _215 = fma(_189, _189, _213);
    float _217 = sqrt(_209);
    float _219 = sqrt(_215);
    bool _221 = _211 > 0.0;
    float _223 = as_type<float>(int(gl_VertexIndex));
    bool _225 = _217 > 0.0;
    float _227 = _205;
    if (_221)
    {
        float _229 = rsqrt(_205);
        _227 = _229;
    }
    float _231 = _227;
    float _233 = 0.0;
    if (!_221)
    {
        _233 = 0.0;
    }
    float _235 = _233;
    bool _237 = _219 > 0.0;
    float _239 = 0.0;
    float _241 = _219;
    float _243 = _235;
    if (!_221)
    {
        _239 = 0.0;
    }
    float _245 = _239;
    float _247 = 0.0;
    float _249 = _245;
    if (!_225)
    {
        _247 = 0.0;
    }
    float _251 = _247;
    float _253 = 0.0;
    float _255 = _251;
    if (_225)
    {
        float _257 = rsqrt(_209);
        _253 = _257;
    }
    float _259 = _253;
    float _261 = 0.0;
    if (!_225)
    {
        _261 = 0.0;
    }
    float _263 = _261;
    float _265 = _263;
    if (!_225)
    {
        _241 = 0.0;
    }
    float _267 = _241;
    int _269 = as_type<int>(_223) & 1;
    bool _271 = _269 != 0;
    int _273 = as_type<int>(_223) & 2;
    bool _275 = _273 != 0;
    bool _277 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _281 = _277 || _279;
    bool _283 = isnan(1.0);
    bool _285 = _281 || _283;
    float _287 = _215;
    float _289 = _223;
    float _291 = _267;
    if (_237)
    {
        float _293 = rsqrt(_215);
        _287 = _293;
    }
    float _295 = _287;
    if (!_221)
    {
        _289 = 0.0;
    }
    float _297 = _289;
    float _299 = _297;
    float _301 = _231;
    if (_221)
    {
        float _303 = _231 * _179;
        _243 = _303;
    }
    float _305 = _243;
    if (_221)
    {
        float _307 = _231 * _171;
        _249 = _307;
    }
    float _309 = _249;
    if (_221)
    {
        float _311 = _231 * _185;
        _299 = _311;
    }
    float _313 = _299;
    float _315 = 0.0;
    if (!_237)
    {
        _315 = 0.0;
    }
    float _317 = _315;
    float _319 = _259;
    float _321 = _317;
    if (_225)
    {
        float _323 = _259 * _181;
        _255 = _323;
    }
    float _325 = _255;
    if (_225)
    {
        float _327 = _259 * _173;
        _265 = _327;
    }
    float _329 = _265;
    if (_225)
    {
        float _331 = _259 * _187;
        _291 = _331;
    }
    float _333 = _291;
    if (!_237)
    {
        _319 = 0.0;
    }
    float _335 = _319;
    float _337 = 0.0;
    float _339 = _335;
    if (!_285)
    {
        float _341 = _177 * _177;
        float _343 = _341 * 0.5;
        _337 = _343;
    }
    float _345 = _337;
    float _347 = _345;
    if (!_237)
    {
        _301 = 0.0;
    }
    float _349 = _301;
    bool _351 = !_271;
    float _353 = _351 ? (-0.5) : 0.5;
    float _355 = _349;
    if (_237)
    {
        float _357 = _295 * _183;
        _339 = _357;
    }
    float _359 = _339;
    if (_237)
    {
        float _361 = _295 * _175;
        _321 = _361;
    }
    float _363 = _321;
    if (_237)
    {
        float _365 = _295 * _189;
        _355 = _365;
    }
    float _367 = _355;
    bool _369 = !_275;
    float _371 = _369 ? (-0.5) : 0.5;
    float _373 = _367;
    if (!_285)
    {
        float _375 = _345 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _347 = _375;
    }
    float _377 = _347;
    bool _379 = !_285;
    float _381 = _377;
    float _383 = 0.0;
    float _385 = 0.0;
    if (!_379)
    {
        float _387 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _389 = log2(_387);
        float _391 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _393 = _391 + 1.0;
        float _395 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _397 = _177 * _389;
        float _399 = 1.0 / _393;
        float _401 = _395 * 0.693147182464599609375;
        float _403 = exp2(_397);
        float _405 = 1.0 / _401;
        float _407 = _403 + (-1.0);
        float _409 = -_407;
        float _411 = fma(_409, _405, _177);
        float _413 = _411 * _399;
        float _415 = _413 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _381 = _415;
        _383 = _413;
        _385 = _399;
    }
    float _417 = _381;
    float _419 = _383;
    float _421 = _385;
    float _423 = _417 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _425 = _421;
    float _427 = _419;
    if (!_285)
    {
        _425 = _177;
    }
    float _429 = _425;
    bool _431 = !_285;
    float _433 = _429;
    if (!_431)
    {
        float _435 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _437 = log2(_435);
        float _439 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _441 = _439 + 1.0;
        float _443 = 1.0 / _441;
        float _445 = _177 * _437;
        float _447 = exp2(_445);
        float _449 = -_447;
        float _451 = _449 + 1.0;
        float _453 = _451 * _443;
        _427 = _443;
        _433 = _453;
    }
    float _455 = _427;
    float _457 = _433;
    float _459 = _417 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _461 = _423 * _309;
    float _463 = _423 * _329;
    float _465 = _423 * _363;
    float _467 = _455;
    if (!_285)
    {
        float _469 = _119 * _119;
        float _471 = _469 * 0.5;
        _467 = _471;
    }
    float _473 = _467;
    float _475 = fma(_459, _305, _461);
    float _477 = fma(_459, _325, _463);
    float _479 = fma(_459, _359, _465);
    float _481 = _473;
    float _483 = _479;
    if (!_285)
    {
        float _485 = _473 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _481 = _485;
    }
    float _487 = _481;
    bool _489 = !_285;
    float _491 = _487;
    if (!_489)
    {
        float _493 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _495 = log2(_493);
        float _497 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _499 = _497 + 1.0;
        float _501 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _503 = _119 * _495;
        float _505 = 1.0 / _499;
        float _507 = _501 * 0.693147182464599609375;
        float _509 = exp2(_503);
        float _511 = 1.0 / _507;
        float _513 = _509 + (-1.0);
        float _515 = -_513;
        float _517 = fma(_515, _511, _119);
        float _519 = _517 * _505;
        float _521 = _519 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _491 = _521;
    }
    float _523 = _491;
    float _525 = in.m_68.w;
    float _527 = _523 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _529 = _417 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _531 = in.m_46.x;
    float _533 = in.m_46.y;
    float _535 = in.m_46.z;
    float _537 = _527 * _329;
    float _539 = _523 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _541 = _527 * _363;
    float _543 = _527 * _309;
    float _545 = _523 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _547 = fma(_539, _325, _537);
    float _549 = fma(_529, _313, _475);
    float _551 = fma(_539, _359, _541);
    float _553 = fma(_529, _333, _477);
    float _555 = fma(_529, _367, _479);
    float _557 = fma(_539, _305, _543);
    float _559 = fma(_545, _333, _547);
    float _561 = fma(_545, _367, _551);
    float _563 = fma(_457, _191, _549);
    float _565 = fma(_457, _193, _553);
    float _567 = fma(_457, _195, _555);
    float _569 = fma(_545, _313, _557);
    float _571 = _543;
    if (!_285)
    {
        _373 = _119;
    }
    float _573 = _373;
    bool _575 = !_285;
    float _577 = _573;
    if (!_575)
    {
        float _579 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _581 = log2(_579);
        float _583 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _585 = _583 + 1.0;
        float _587 = 1.0 / _585;
        float _589 = _119 * _581;
        float _591 = exp2(_589);
        float _593 = -_591;
        float _595 = _593 + 1.0;
        float _597 = _595 * _587;
        _577 = _597;
    }
    float _599 = _577;
    float _601 = fma(_599, _193, _559);
    float _603 = 1.0 / _153;
    bool _605 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _607 = fma(_599, _191, _569);
    float _609 = -_601;
    float _611 = _565 + _609;
    float _613 = fma(_599, _195, _561);
    float _615 = fma(_563, _525, _531);
    float _617 = -_607;
    float _619 = _563 + _617;
    float _621 = _611 * _181;
    float _623 = _611 * _173;
    float _625 = _611 * _187;
    float _627 = -_613;
    float _629 = _567 + _627;
    float _631 = fma(_619, _179, _621);
    float _633 = fma(_619, _171, _623);
    float _635 = fma(_619, _185, _625);
    float _637 = fma(_565, _525, _533);
    float _639 = fma(_629, _183, _631);
    float _641 = fma(_629, _175, _633);
    float _643 = fma(_567, _525, _535);
    float _645 = fma(_629, _189, _635);
    float _647 = _119 * _603;
    bool _649 = !_605;
    float _651 = _647;
    if (!_649)
    {
        float _653 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _655 = _151 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _657 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _659 = _657 * _653;
        float _661 = floor(_659);
        float _663 = -_661;
        float _665 = _659 + _663;
        _651 = _665;
    }
    float _667 = _651;
    float _669 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _671 = int(_669);
    float _673 = _637 * _181;
    float _675 = _637 * _173;
    float _677 = _637 * _187;
    float _679 = _151 * 2.0;
    float _681 = fma(_615, _179, _673);
    float _683 = fma(_615, _171, _675);
    float _685 = fma(_615, _185, _677);
    float _687 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _689 = int(_687);
    float _691 = _163 * 2.0;
    float _693 = in.m_55.w;
    float _695 = fma(_643, _189, _685);
    float _697 = _151 + _163;
    float _699 = float(_671);
    float _701 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _703 = int(_701);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _705;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _711 = _709 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _713 = in.m_63.w;
    float _715 = _697 + (-1.0);
    float _717 = _155 + _163;
    float _719 = float(_689);
    float _721 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _723 = int(_721);
    float _725 = _717 + (-1.0);
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _727;
    float _731 = float(uint(_703));
    float _733 = 1.0 / _699;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _735;
    float _739 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _741 = 1.0 / _719;
    float _743 = float(uint(_723));
    float _745 = _695 + _713;
    int _747 = ~_723;
    int _749 = _747 + 1;
    float _751 = _733 * _119;
    float _753 = 1.0 / _731;
    float _755 = _155 * 2.0;
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _759 = _757 != 0;
    float _761 = _741 * _119;
    float _763 = 1.0 / _743;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _767 = _765 != 0;
    int _769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _771 = _769 != 0;
    int _773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _775 = _773 != 0;
    bool _777 = _151 > 0.5;
    int _779 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _781 = _779 != 0;
    float _783 = -_353;
    int _785 = _777 ? as_type<int>(_783) : as_type<int>(_353);
    float _787 = trunc(_751);
    int _789 = int(_787);
    int _791 = as_type<int>(_753) + (-2);
    bool _793 = !_781;
    float _795 = _793 ? _353 : as_type<float>(_785);
    bool _797 = !_771;
    int _799 = _797 ? 0 : 1;
    bool _801 = !_775;
    int _803 = _801 ? 0 : 1;
    float _805 = trunc(_761);
    int _807 = int(_805);
    int _809 = as_type<int>(_763) + (-2);
    bool _811 = !_767;
    int _813 = _811 ? 0 : 1;
    bool _815 = _163 > 0.5;
    bool _817 = _155 > 0.5;
    float _819 = floor(_679);
    float _821 = float(uint(_789));
    float _823 = -_371;
    int _825 = _817 ? as_type<int>(_823) : as_type<int>(_371);
    int _827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _829 = _827 != 0;
    float _831 = as_type<float>(_809) * _821;
    float _833 = 0.0;
    int _835 = _825;
    if (_759)
    {
        _833 = 1.0;
    }
    float _837 = _833;
    float _839 = floor(_755);
    float _841 = float(uint(_807));
    float _843 = 0.0;
    float _845 = _837;
    if (_759)
    {
        _843 = _151;
    }
    float _847 = _843;
    float _849 = 0.0;
    float _851 = _847;
    if (_759)
    {
        _849 = 1.0;
    }
    float _853 = _849;
    float _855 = as_type<float>(_791) * _841;
    float _857 = _853;
    if (!_759)
    {
        _845 = 7.345489978790283203125;
    }
    float _859 = _845;
    float _861 = trunc(_831);
    float _863 = precise::max(_861, 0.0);
    uint _866 = uint(_863);
    float _868 = -_353;
    int _870 = _815 ? as_type<int>(_868) : as_type<int>(_353);
    bool _872 = _819 > 0.0;
    bool _874 = _819 >= 0.0;
    bool _876 = isnan(_819);
    bool _878 = _874 || _876;
    bool _880 = isnan(0.0);
    bool _882 = _878 || _880;
    int _884 = ~_703;
    int _886 = _884 + 1;
    float _888 = trunc(_855);
    float _890 = precise::max(_888, 0.0);
    uint _892 = uint(_890);
    bool _894 = _839 > 0.0;
    if (!_759)
    {
        _851 = _155;
    }
    float _896 = _851;
    if (!_759)
    {
        _857 = 1.2345600128173828125;
    }
    float _898 = _857;
    int _900 = abs(_799);
    int _902 = _749 * int(_866);
    int _904 = _902 + _789;
    int _906 = ~_703;
    int _908 = _906 + 1;
    float _910 = floor(_691);
    float _912 = _896 * _898;
    bool _914 = _667 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _916 = isnan(_667);
    bool _918 = _914 || _916;
    bool _920 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _922 = _918 || _920;
    float _924 = float(_922);
    float _926 = float(uint(_904));
    int _928 = _908 * int(_892);
    int _930 = _928 + _807;
    float _932 = -_924;
    float _934 = _932 + 1.0;
    float _936 = 1.0 / _707;
    float _938 = as_type<float>(_809) * _926;
    int _940 = abs(_803);
    float _942 = float(uint(_930));
    float _944 = trunc(_938);
    float _946 = precise::max(_944, 0.0);
    uint _948 = uint(_946);
    float _950 = as_type<float>(_791) * _942;
    int _952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _954 = _952 != 0;
    int _956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _958 = _956 != 0;
    bool _960 = !_954;
    int _962 = _960 ? 0 : 1;
    float _964 = trunc(_950);
    float _966 = precise::max(_964, 0.0);
    uint _968 = uint(_966);
    bool _970 = _839 >= 0.0;
    bool _972 = isnan(_839);
    bool _974 = _970 || _972;
    bool _976 = isnan(0.0);
    bool _978 = _974 || _976;
    bool _980 = !_958;
    float _982 = _980 ? _371 : as_type<float>(_825);
    int _984 = _882 ? 0 : 1;
    int _986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _988 = _986 != 0;
    float _990 = 1.0 / _711;
    int _992 = _978 ? 0 : 1;
    if (_759)
    {
        _835 = 0;
    }
    int _994 = _835;
    bool _996 = _910 > 0.0;
    int _998 = _994;
    if (!_759)
    {
        _998 = 1;
    }
    int _1000 = _998;
    float _1002 = 1.0 / _729;
    int _1004 = ~_984;
    int _1006 = _1004 + 1;
    int _1008 = _1006 + 1;
    int _1010 = ~_992;
    int _1012 = _1010 + 1;
    int _1014 = _1012 + 1;
    int _1016 = int(_892) + int(_968);
    bool _1018 = !_988;
    float _1020 = _1018 ? _353 : as_type<float>(_870);
    int _1022 = _1008;
    int _1024 = _1014;
    if (!_872)
    {
        int _1026 = ~_984;
        int _1028 = _1026 + 1;
        _1022 = _1028;
    }
    int _1030 = _1022;
    if (!_894)
    {
        int _1032 = ~_992;
        int _1034 = _1032 + 1;
        _1024 = _1034;
    }
    int _1036 = _1024;
    int _1038 = int(_866) + int(_948);
    float _1040 = _151 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1042 = _910 >= 0.0;
    bool _1044 = isnan(_910);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan(0.0);
    bool _1050 = _1046 || _1048;
    int _1052 = _886 * _1016;
    int _1054 = _1052 + _807;
    bool _1056 = _1000 != 1;
    int _1058 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1060 = _1058 != 0;
    int _1062 = ~_723;
    int _1064 = _1062 + 1;
    bool _1066 = _693 > 0.5;
    bool _1068 = !_829;
    int _1070 = _1068 ? 0 : 1;
    int _1072 = _1064 * _1038;
    int _1074 = _1072 + _789;
    bool _1076 = !_1060;
    int _1078 = _1076 ? 0 : 1;
    float _1080 = -_371;
    int _1082 = _1066 ? as_type<int>(_1080) : as_type<int>(_371);
    int _1084 = _1050 ? 0 : 1;
    int _1086 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1088 = _1086 != 0;
    int _1090 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1092 = _1090 != 0;
    int _1094 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1096 = _1094 != 0;
    int _1098 = ~_1084;
    int _1100 = _1098 + 1;
    int _1102 = _1100 + 1;
    int _1104 = _1102;
    float _1106 = as_type<float>(_1054);
    if (!_996)
    {
        int _1108 = ~_1084;
        int _1110 = _1108 + 1;
        _1104 = _1110;
    }
    int _1112 = _1104;
    bool _1114 = !_1092;
    int _1116 = _1114 ? 0 : 1;
    bool _1118 = uint(_1054) >= uint(_703);
    bool _1120 = uint(_1074) >= uint(_723);
    int _1122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1124 = _1122 != 0;
    if (!_1056)
    {
        _571 = _155;
    }
    float _1126 = _571;
    float _1128 = _1126;
    if (!_1056)
    {
        _483 = _155;
    }
    float _1130 = _483;
    float _1132 = 0.0;
    float _1134 = _1130;
    if (!_1056)
    {
        _1132 = _163;
    }
    float _1136 = _1132;
    float _1138 = _1136;
    if (!_1056)
    {
        _1106 = _163;
    }
    float _1140 = _1106;
    float _1142 = _1140;
    if (_1056)
    {
        _1128 = _151;
    }
    float _1144 = _1128;
    if (_1056)
    {
        _1134 = _151;
    }
    float _1146 = _1134;
    if (_1056)
    {
        _1138 = _155;
    }
    float _1148 = _1138;
    float _1150 = _1144 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1056)
    {
        _1142 = _155;
    }
    float _1152 = _1142;
    bool _1154 = !_1118;
    int _1156 = _1154 ? 0 : (-1);
    bool _1158 = !_1120;
    int _1160 = _1158 ? 0 : (-1);
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1164 = _1162 != 0;
    int _1166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1168 = _1166 != 0;
    int _1170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1172 = _1170 != 0;
    int _1174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1176 = _1174 != 0;
    float _1178 = fma(_643, _183, _681);
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1182 = fma(_643, _175, _683);
    float _1184 = in.m_61.w;
    float _1186 = -_1180;
    float _1188 = fma(_1040, 2.0, _1186);
    float _1190 = _151 + _155;
    float _1192 = in.m_59.w;
    float _1194 = _155 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1198 = _1190 + (-1.0);
    float _1200 = -_119;
    float _1202 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1188);
    bool _1204 = !_1088;
    int _1206 = _1204 ? 0 : 1;
    float _1208 = fma(_1194, -2.0, _1196);
    float _1210 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1212 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1216 = _667 + _1214;
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1220 = _667 + _1218;
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1224 = _667 + _1222;
    bool _1226 = !_1096;
    int _1228 = _1226 ? 0 : 1;
    float _1230 = _1216 * _936;
    float _1232 = _1220 * _990;
    float _1234 = _1224 * _1002;
    float _1236 = _1178 + _1184;
    int _1238 = abs(_1116);
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1240;
    float _1244 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1246 = _1244 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1248 = _1182 + _1192;
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1252 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1250;
    float _1254 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1256 = _1254 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1258;
    float _1262 = _1248 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _1264 = fma(_1252, _1230, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1266 = fma(_1242, _1230, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _1268 = _667 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1270 = isnan(_667);
    bool _1272 = _1268 || _1270;
    bool _1274 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1276 = _1272 || _1274;
    float _1278 = float(_1276);
    float _1280 = fma(_1256, _1232, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _1282 = _667 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1284 = isnan(_667);
    bool _1286 = _1282 || _1284;
    bool _1288 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1290 = _1286 || _1288;
    float _1292 = float(_1290);
    float _1294 = _859 * _151;
    float _1296 = fma(_1246, _1232, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1298 = -_1278;
    float _1300 = _1298 + 1.0;
    bool _1302 = _667 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1304 = isnan(_667);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1310 = _1306 || _1308;
    float _1312 = float(_1310);
    float _1314 = floor(_1294);
    float _1316 = -_1292;
    float _1318 = _1316 + 1.0;
    float _1320 = _924 * _1300;
    float _1322 = _1292 * _934;
    float _1324 = fma(_1260, _1234, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1326 = _1312 * _1318;
    float _1328 = fma(_737, _1234, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1330 = -_1312;
    float _1332 = _1330 + 1.0;
    float _1334 = floor(_912);
    float _1336 = _795 + 0.5;
    float _1338 = _1264 * _1326;
    float _1340 = _1266 * _1326;
    float _1342 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1208);
    float _1344 = _982 + (-0.5);
    float _1346 = _1236 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _1348 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1202);
    float _1350 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1338);
    float _1352 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1340);
    float _1354 = -_1344;
    float _1356 = -_1342;
    float _1358 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1356);
    float _1360 = -_1314;
    float _1362 = _1294 + _1360;
    float _1364 = fma(_1280, _1322, _1350);
    float _1366 = fma(_1296, _1322, _1352);
    float _1368 = float(_807);
    float _1370 = _603 * _119;
    float _1372 = -_1334;
    float _1374 = _912 + _1372;
    float _1376 = _1262 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _1378 = float(_723);
    float _1380 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1382 = log2(_1380);
    float _1384 = float(_789);
    float _1386 = fma(_1346, (*spvDescriptorSet0.vp_c12)._m0[6].x, _1376);
    float _1388 = float(_703);
    float _1390 = _1262 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _1392 = _1262 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    bool _1394 = _1368 >= _1388;
    bool _1396 = isnan(_1368);
    bool _1398 = _1394 || _1396;
    bool _1400 = isnan(_1388);
    bool _1402 = _1398 || _1400;
    float _1404 = float(_1402);
    float _1406 = _1362 * _1388;
    float _1408 = _1388 * _1370;
    float _1410 = _1378 * _1370;
    bool _1412 = _1384 >= _1378;
    bool _1414 = isnan(_1384);
    bool _1416 = _1412 || _1414;
    bool _1418 = isnan(_1378);
    bool _1420 = _1416 || _1418;
    float _1422 = float(_1420);
    float _1424 = _1374 * _1378;
    float _1426 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1428 = fma(_1324, _1320, _1364);
    float _1430 = fma(_1328, _1320, _1366);
    float _1432 = fma(_1346, (*spvDescriptorSet0.vp_c12)._m0[6].y, _1390);
    float _1434 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1426);
    float _1436 = fma(_1346, (*spvDescriptorSet0.vp_c12)._m0[6].z, _1392);
    float _1438 = _1382 * _119;
    float _1440 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    int _1442 = abs(_1206);
    float _1444 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1446 = _745 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _1448 = float(_1112);
    float _1450 = fma(_1278, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1428);
    float _1452 = -_1444;
    float _1454 = fma(_1150, 2.0, _1452);
    int _1456 = abs(_1228);
    float _1458 = exp2(_1438);
    float _1460 = float(_1030);
    float _1462 = fma(_1446, (*spvDescriptorSet0.vp_c12)._m0[8].x, _1386);
    float _1464 = fma(_1446, (*spvDescriptorSet0.vp_c12)._m0[8].y, _1432);
    float _1466 = float(_1442);
    float _1468 = fma(_1446, (*spvDescriptorSet0.vp_c12)._m0[8].z, _1436);
    float _1470 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1472 = float(_1238);
    float _1474 = _1466 * _1448;
    float _1476 = _1462 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _1478 = _1148 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1480 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1482 = _1472 * _1460;
    float _1484 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1486 = 1.0 + _1484;
    float _1488 = _1476 * _1440;
    float _1490 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1492 = fma(_1478, -2.0, _1480);
    float _1494 = _1468 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _1496 = _1464 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _1498 = fma(_1278, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1430);
    bool _1500 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1502 = isnan(0.0);
    bool _1504 = _1500 || _1502;
    bool _1506 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1508 = _1504 || _1506;
    float _1510 = _1474 * (-2.0);
    float _1512 = 1.0 / _1486;
    float _1514 = -_119;
    float _1516 = fma(_1514, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1454);
    float _1518 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1434);
    float _1520 = float(_1036);
    float _1522 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1524 = float(_1456);
    float _1526 = _1496 * _1490;
    float _1528 = -_1458;
    float _1530 = _1528 + 1.0;
    float _1532 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1534 = !_1124;
    float _1536 = _1534 ? _371 : as_type<float>(_1082);
    float _1538 = trunc(_1424);
    int _1540 = int(_1538);
    float _1542 = in.m_70.x;
    float _1544 = in.m_70.y;
    float _1546 = in.m_70.z;
    float _1548 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1532);
    float _1550 = _1494 * _1470;
    float _1552 = _1508 ? _1530 : 0.0;
    float _1554 = in.m_68.x;
    float _1556 = in.m_68.y;
    bool _1558 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1560 = isnan(1.0);
    bool _1562 = _1558 || _1560;
    bool _1564 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1566 = _1562 || _1564;
    float _1568 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1570 = trunc(_1404);
    int _1572 = int(_1570);
    float _1574 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1522);
    float _1576 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1492);
    float _1578 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1568);
    float _1580 = fma(_1210, _1510, _1210);
    float _1582 = _163 + (-0.5);
    int _1584 = ~_1016;
    int _1586 = _1584 + _1156;
    int _1588 = _1586 + 1;
    float _1590 = _1524 * _1520;
    float _1592 = trunc(_1422);
    int _1594 = int(_1592);
    int _1596 = abs(_1078);
    float _1598 = _1020 + 0.5;
    int _1600 = ~_1038;
    int _1602 = _1600 + _1160;
    int _1604 = _1602 + 1;
    float _1606 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1578);
    float _1608 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1548);
    float _1610 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1574);
    if (_1566)
    {
        float _1612 = _1552 * _1512;
        _129 = _1612;
    }
    float _1614 = _129;
    float _1616 = trunc(_1406);
    int _1618 = int(_1616);
    int _1620 = _703 * _1588;
    int _1622 = _1620 + _807;
    float _1624 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1516);
    int _1626 = _1540 * _1596;
    int _1628 = _1626 + _789;
    bool _1630 = _703 == 0;
    float _1632 = _1450 * _1554;
    int _1634 = abs(_962);
    int _1636 = _723 * _1604;
    int _1638 = _1636 + _789;
    float _1640 = _1590 * (-2.0);
    bool _1642 = !_1168;
    int _1644 = _1642 ? 0 : 1;
    float _1646 = _1482 * (-2.0);
    bool _1648 = _723 == 0;
    float _1650 = fma(_1510, _1542, _1542);
    int _1652 = ~_1572;
    int _1654 = _1652 + 1;
    int _1656 = _1654 + 1;
    float _1658 = fma(_1212, _1640, _1212);
    bool _1660 = !_1630;
    int _1662 = _1660 ? _1622 : (-1);
    float _1664 = _1536 + (-0.5);
    float _1666 = fma(_739, _1646, _739);
    float _1668 = _151 + (-0.5);
    int _1670 = ~_1594;
    int _1672 = _1670 + 1;
    int _1674 = _1672 + 1;
    float _1676 = trunc(_1408);
    int _1678 = int(_1676);
    bool _1680 = !_1648;
    int _1682 = _1680 ? _1638 : (-1);
    float _1684 = fma(_1646, _1544, _1544);
    float _1686 = _155 + (-0.5);
    int _1688 = _1618 * _1634;
    int _1690 = _1688 + _807;
    float _1692 = -_1664;
    float _1694 = -_1576;
    float _1696 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1694);
    int _1698 = _1662 * _1656;
    int _1700 = _703 + (-1);
    float _1702 = fma(_1640, _1546, _1546);
    int _1704 = _723 + (-1);
    float _1706 = fma(_1686, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1684);
    int _1708 = _1682 * _1674;
    float _1710 = trunc(_1410);
    int _1712 = int(_1710);
    int _1714 = abs(_813);
    float _1716 = fma(_1668, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1650);
    int _1718 = abs(_1644);
    float _1720 = fma(_1582, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1702);
    int _1722 = _1572 * _1700;
    int _1724 = _1722 + _1698;
    float _1726 = fma(_1666, _1614, _1706);
    int _1728 = _1594 * _1704;
    int _1730 = _1728 + _1708;
    bool _1732 = !_1164;
    int _1734 = _1732 ? 0 : 1;
    float _1736 = fma(_1580, _1614, _1716);
    int _1738 = _1724 * _900;
    float _1740 = fma(_1658, _1614, _1720);
    int _1742 = _1730 * _1718;
    bool _1744 = !_1172;
    int _1746 = _1744 ? 0 : 1;
    float _1748 = _1726 * 0.15915493667125701904296875;
    int _1750 = abs(_1734);
    int _1752 = _1678 * _1714;
    int _1754 = _1752 + _1738;
    float _1756 = fma(_1488, 0.5, 0.5);
    int _1758 = abs(_1070);
    float _1760 = -_1606;
    float _1762 = _1760 + 1.0;
    int _1764 = abs(_1746);
    int _1766 = _1690 * _940;
    int _1768 = _1766 + _1754;
    float _1770 = floor(_1756);
    bool _1772 = !_1176;
    int _1774 = _1772 ? 0 : 1;
    int _1776 = _1618 * _1758;
    int _1778 = _1776 + _1768;
    float _1780 = float(uint(_1690));
    int _1782 = _1712 * _1750;
    int _1784 = _1782 + _1742;
    float _1786 = -_1608;
    float _1788 = _1786 + 1.0;
    int _1790 = abs(_1774);
    float _1792 = as_type<float>(_791) * _1780;
    float _1794 = float(uint(_1628));
    int _1796 = _1628 * _1764;
    int _1798 = _1796 + _1784;
    float _1800 = fma(_982, _1788, _1358);
    float _1802 = float(uint(_1778));
    float _1804 = trunc(_1792);
    float _1806 = precise::max(_1804, 0.0);
    uint _1808 = uint(_1806);
    float _1810 = as_type<float>(_809) * _1794;
    int _1812 = _1540 * _1790;
    int _1814 = _1812 + _1798;
    int _1816 = ~_703;
    int _1818 = _1816 + 1;
    float _1820 = as_type<float>(_791) * _1802;
    float _1822 = -_1762;
    float _1824 = fma(_795, _1822, _1348);
    float _1826 = _1498 * _1556;
    float _1828 = float(uint(_1814));
    float _1830 = trunc(_1810);
    float _1832 = precise::max(_1830, 0.0);
    uint _1834 = uint(_1832);
    int _1836 = ~_703;
    int _1838 = _1836 + 1;
    float _1840 = fma(_1526, 0.5, 0.5);
    float _1842 = _1736 * 0.15915493667125701904296875;
    float _1844 = as_type<float>(_809) * _1828;
    int _1846 = ~_723;
    int _1848 = _1846 + 1;
    float _1850 = fma(_1550, 0.5, 0.5);
    float _1852 = _1740 * 0.15915493667125701904296875;
    float _1854 = trunc(_1820);
    float _1856 = precise::max(_1854, 0.0);
    uint _1858 = uint(_1856);
    int _1860 = _1818 * int(_1808);
    int _1862 = _1860 + _1690;
    float _1864 = -_1610;
    float _1866 = _1864 + 1.0;
    float _1868 = -_1770;
    float _1870 = _1756 + _1868;
    float _1872 = _1826 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1874 = _1632 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1876 = float(uint(_1862));
    float _1878 = trunc(_1844);
    float _1880 = precise::max(_1878, 0.0);
    uint _1882 = uint(_1880);
    int _1884 = ~_723;
    int _1886 = _1884 + 1;
    int _1888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1890 = _1888 != 0;
    int _1892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1894 = _1892 != 0;
    int _1896 = _1886 * int(_1834);
    int _1898 = _1896 + _1628;
    bool _1900 = !_1890;
    int _1902 = _1900 ? 0 : 1;
    float _1904 = _1748 * 6.283185482025146484375;
    float _1906 = sin(_1904);
    float _1908 = float(uint(_1898));
    float _1910 = _1748 * 6.283185482025146484375;
    float _1912 = cos(_1910);
    int _1914 = _1848 * int(_1882);
    int _1916 = _1914 + _1814;
    float _1918 = as_type<float>(_809) * _1908;
    float _1920 = floor(_1840);
    float _1922 = as_type<float>(_791) * _1876;
    int _1924 = _1838 * int(_1858);
    int _1926 = _1924 + _1778;
    float _1928 = float(uint(_1916));
    float _1930 = float(uint(_1926));
    float _1932 = _1842 * 6.283185482025146484375;
    float _1934 = sin(_1932);
    float _1936 = as_type<float>(_809) * _1928;
    float _1938 = as_type<float>(_791) * _1930;
    float _1940 = _1842 * 6.283185482025146484375;
    float _1942 = cos(_1940);
    float _1944 = -_1920;
    float _1946 = _1840 + _1944;
    float _1948 = fma(_1946, 2.0, -1.0);
    float _1950 = floor(_1850);
    float _1952 = -_1518;
    float _1954 = _1952 + 1.0;
    float _1956 = -_1866;
    float _1958 = fma(_1020, _1956, _1624);
    float _1960 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _371);
    float _1962 = _1934 * _1906;
    float _1964 = fma(_1536, _1954, _1696);
    float _1966 = _1934 * _1912;
    float _1968 = _1872 * _1960;
    float _1970 = _1852 * 6.283185482025146484375;
    float _1972 = cos(_1970);
    float _1974 = _1942 * _1912;
    out.m_72.x = _1824;
    out.m_72.y = _1800;
    out.m_72.z = _1958;
    out.m_72.w = _1964;
    float _1976 = fma(_1870, 2.0, -1.0);
    float _1978 = _1852 * 6.283185482025146484375;
    float _1980 = sin(_1978);
    float _1982 = -_1950;
    float _1984 = _1850 + _1982;
    float _1986 = trunc(_1922);
    float _1988 = precise::max(_1986, 0.0);
    uint _1990 = uint(_1988);
    float _1992 = _1934 * _1972;
    float _1994 = _1942 * _1906;
    float _1996 = _1942 * _1972;
    float _1998 = _1948 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _2000 = _1912 * _1972;
    float _2002 = _1906 * _1972;
    float _2004 = _1996 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2006 = trunc(_1918);
    float _2008 = precise::max(_2006, 0.0);
    uint _2010 = uint(_2008);
    float _2012 = _1998 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _2014 = _1998 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _2016 = -_1980;
    float _2018 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2004);
    float _2020 = _1998 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _2022 = trunc(_1938);
    float _2024 = precise::max(_2022, 0.0);
    uint _2026 = uint(_2024);
    float _2028 = -_1994;
    float _2030 = fma(_1980, _1966, _2028);
    float _2032 = -_1966;
    float _2034 = fma(_1980, _1994, _2032);
    float _2036 = fma(_1980, _1974, _1962);
    int _2038 = int(_1808) + int(_1990);
    float _2040 = fma(_1980, _1962, _1974);
    float _2042 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _353);
    float _2044 = trunc(_1936);
    float _2046 = precise::max(_2044, 0.0);
    uint _2048 = uint(_2046);
    float _2050 = _1976 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    int _2052 = int(_1834) + int(_2010);
    float _2054 = _1874 * _2042;
    int _2056 = ~_703;
    int _2058 = _2056 + 1;
    float _2060 = fma(_2050, (*spvDescriptorSet0.vp_c12)._m0[2].x, _2012);
    int _2062 = ~_723;
    int _2064 = _2062 + 1;
    float _2066 = -_1968;
    float _2068 = _1980 * _2066;
    int _2070 = int(_1858) + int(_2026);
    float _2072 = _1996 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2074 = fma(_2050, (*spvDescriptorSet0.vp_c12)._m0[2].y, _2014);
    float _2076 = fma(_2000, _2054, _2068);
    float _2078 = fma(_2050, (*spvDescriptorSet0.vp_c12)._m0[2].z, _2020);
    int _2080 = _2058 * _2070;
    int _2082 = _2080 + _1778;
    float _2084 = -_1980;
    float _2086 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2072);
    int _2088 = int(_1882) + int(_2048);
    float _2090 = _1996 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2092 = _1996 * _1968;
    float _2094 = _1992 * _1968;
    bool _2096 = uint(_2082) >= uint(_703);
    float _2098 = -_1980;
    float _2100 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2090);
    float _2102 = fma(_2036, _2054, _2092);
    float _2104 = fma(_2030, _2054, _2094);
    int _2106 = _2064 * _2088;
    int _2108 = _2106 + _1814;
    bool _2110 = !_2096;
    int _2112 = _2110 ? 0 : (-1);
    float _2114 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2018);
    float _2116 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2086);
    float _2118 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _2120 = uint(_2108) >= uint(_723);
    float _2122 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2100);
    int _2124 = ~_2070;
    int _2126 = _2124 + _2112;
    int _2128 = _2126 + 1;
    float _2130 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2132 = !_2120;
    int _2134 = _2132 ? 0 : (-1);
    float _2136 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2138 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2140 = _703 * _2128;
    int _2142 = _2140 + _1778;
    int _2144 = ~_2088;
    int _2146 = _2144 + _2134;
    int _2148 = _2146 + 1;
    float _2150 = fma(_2002, _2118, _2076);
    float _2152 = _2034 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2154 = _2034 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2156 = _2034 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2158 = !_1630;
    int _2160 = _2158 ? _2142 : (-1);
    float _2162 = fma(_2000, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2130);
    float _2164 = fma(_2000, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2136);
    float _2166 = fma(_2000, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2138);
    float _2168 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2152);
    float _2170 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2154);
    float _2172 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2156);
    int _2174 = _723 * _2148;
    int _2176 = _2174 + _1814;
    float _2178 = fma(_2034, _2118, _2102);
    int _2180 = _2160 >> 31;
    float _2182 = fma(_2040, _2118, _2104);
    int _2184 = ~_703;
    int _2186 = _2184 + 1;
    float _2188 = _353 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2190 = _2160 & 3;
    bool _2192 = _2190 != 0;
    float _2194 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2170);
    int _2196 = _2180 & 3;
    float _2198 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2168);
    bool _2200 = !_1648;
    int _2202 = _2200 ? _2176 : (-1);
    float _2204 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2172);
    bool _2206 = uint(_2190) > 1u;
    int _2208 = _2202 >> 31;
    int _2210 = _2186 * _2038;
    int _2212 = _2210 + _1690;
    int _2214 = _2160 & 3;
    bool _2216 = _2214 != 0;
    int _2218 = _2160 + _2196;
    int _2220 = _2208 & 3;
    int _2222 = _2216 ? 0 : 1;
    bool _2224 = uint(_2212) >= uint(_703);
    int _2226 = ~_723;
    int _2228 = _2226 + 1;
    int _2230 = _2202 + _2220;
    int _2232 = ~_2222;
    int _2234 = _2232 + 1;
    int _2236 = _2234 + 1;
    int _2238 = _2228 * _2052;
    int _2240 = _2238 + _1628;
    int _2242 = _2218 >> 2;
    int _2244 = _2236;
    float _2246 = _1976;
    float _2248 = _1948;
    float _2250 = _2182;
    float _2252 = _2122;
    if (!_2206)
    {
        int _2254 = ~_2222;
        int _2256 = _2254 + 1;
        _2244 = _2256;
    }
    int _2258 = _2244;
    int _2260 = _2230 >> 2;
    bool _2262 = uint(_2190) >= 2u;
    int _2264 = _2242 << 4;
    int _2266 = _2264 + 368;
    float _2268 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2162);
    int _2270 = _2260 << 4;
    int _2272 = _2270 + 512;
    float _2274 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2164);
    int _2276 = _2262 ? 0 : 1;
    uint _2278 = uint(int(uint(_2266) >> uint(2)));
    uint _2280 = uint(int(uint(int(_2278)) >> uint(2)));
    int _2282 = int(_2278) & 3;
    float _2284 = (*spvDescriptorSet0.vp_c9)._m0[int(_2280)][_2282];
    int _2286 = int(_2278) + 1;
    uint _2288 = uint(int(uint(_2286) >> uint(2)));
    int _2290 = _2286 & 3;
    float _2292 = (*spvDescriptorSet0.vp_c9)._m0[int(_2288)][_2290];
    bool _2294 = uint(_2240) >= uint(_723);
    float _2296 = _371 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2298 = !_2224;
    int _2300 = _2298 ? 0 : (-1);
    float _2302 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2166);
    bool _2304 = _2190 != 3;
    float _2306 = _2296 * _2114;
    int _2308 = ~_2038;
    int _2310 = _2308 + _2300;
    int _2312 = _2310 + 1;
    uint _2314 = uint(int(uint(_2272) >> uint(2)));
    uint _2316 = uint(int(uint(int(_2314)) >> uint(2)));
    int _2318 = int(_2314) & 3;
    float _2320 = (*spvDescriptorSet0.vp_c9)._m0[int(_2316)][_2318];
    int _2322 = int(_2314) + 1;
    uint _2324 = uint(int(uint(_2322) >> uint(2)));
    int _2326 = _2322 & 3;
    float _2328 = (*spvDescriptorSet0.vp_c9)._m0[int(_2324)][_2326];
    bool _2330 = !_2294;
    int _2332 = _2330 ? 0 : (-1);
    float _2334 = _2296 * _2116;
    int _2336 = ~_2276;
    int _2338 = _2336 + 1;
    int _2340 = _2338 + 1;
    float _2342 = fma(_2188, _2268, _2306);
    int _2344 = ~_2052;
    int _2346 = _2344 + _2332;
    int _2348 = _2346 + 1;
    out.m_74.x = _2268;
    out.m_74.y = _2274;
    out.m_74.z = _2302;
    float _2350 = fma(_2188, _2274, _2334);
    int _2352 = _2266 + 8;
    uint _2354 = uint(int(uint(_2352) >> uint(2)));
    uint _2356 = uint(int(uint(int(_2354)) >> uint(2)));
    int _2358 = int(_2354) & 3;
    float _2360 = (*spvDescriptorSet0.vp_c9)._m0[int(_2356)][_2358];
    int _2362 = int(_2354) + 1;
    uint _2364 = uint(int(uint(_2362) >> uint(2)));
    int _2366 = _2362 & 3;
    float _2368 = (*spvDescriptorSet0.vp_c9)._m0[int(_2364)][_2366];
    bool _2370 = !_2192;
    int _2372 = _2370 ? 0 : 1;
    int _2374 = _723 * _2348;
    int _2376 = _2374 + _1628;
    int _2378 = _2340;
    if (_2304)
    {
        int _2380 = ~_2276;
        int _2382 = _2380 + 1;
        _2378 = _2382;
    }
    int _2384 = _2378;
    int _2386 = _703 * _2312;
    int _2388 = _2386 + _1690;
    int _2390 = _2202 & 3;
    bool _2392 = _2390 != 0;
    float _2394 = _2296 * _2122;
    int _2396 = _2202 & 3;
    bool _2398 = _2396 != 0;
    bool _2400 = uint(_2390) > 1u;
    int _2402 = _2272 + 8;
    uint _2404 = uint(int(uint(_2402) >> uint(2)));
    uint _2406 = uint(int(uint(int(_2404)) >> uint(2)));
    int _2408 = int(_2404) & 3;
    float _2410 = (*spvDescriptorSet0.vp_c9)._m0[int(_2406)][_2408];
    int _2412 = int(_2404) + 1;
    uint _2414 = uint(int(uint(_2412) >> uint(2)));
    int _2416 = _2412 & 3;
    float _2418 = (*spvDescriptorSet0.vp_c9)._m0[int(_2414)][_2416];
    int _2420 = _2398 ? 0 : 1;
    float _2422 = fma(_2188, _2302, _2394);
    bool _2424 = !_2392;
    int _2426 = _2424 ? 0 : 1;
    int _2428 = ~_2420;
    int _2430 = _2428 + 1;
    int _2432 = _2430 + 1;
    float _2434 = _2204 + _2422;
    int _2436 = abs(_2258);
    int _2438 = abs(_2372);
    bool _2440 = uint(_2390) >= 2u;
    int _2442 = _2432;
    if (!_2400)
    {
        int _2444 = ~_2420;
        int _2446 = _2444 + 1;
        _2442 = _2446;
    }
    int _2448 = _2442;
    bool _2450 = _2390 != 3;
    int _2452 = abs(_2448);
    int _2454 = abs(_2426);
    int _2456 = ~_2436;
    int _2458 = _2456 + 1;
    int _2460 = _2458 + 1;
    int _2462 = ~_2452;
    int _2464 = _2462 + 1;
    int _2466 = _2464 + 1;
    int _2468 = _2460 * as_type<int>(_2292);
    int _2470 = _2440 ? 0 : 1;
    int _2472 = abs(_2384);
    int _2474 = _2466 * as_type<int>(_2328);
    int _2476 = ~_2438;
    int _2478 = _2476 + 1;
    int _2480 = _2478 + 1;
    int _2482 = ~_2454;
    int _2484 = _2482 + 1;
    int _2486 = _2484 + 1;
    int _2488 = ~_2470;
    int _2490 = _2488 + 1;
    int _2492 = _2490 + 1;
    int _2494 = _2480 * as_type<int>(_2284);
    int _2496 = _2494 + _2468;
    bool _2498 = _2390 != 3;
    int _2500 = _2486 * as_type<int>(_2320);
    int _2502 = _2500 + _2474;
    int _2504 = _2492;
    if (_2450)
    {
        int _2506 = ~_2470;
        int _2508 = _2506 + 1;
        _2504 = _2508;
    }
    int _2510 = _2504;
    float _2512 = fma(_2296, _2296, 1.0);
    int _2514 = ~_2472;
    int _2516 = _2514 + 1;
    int _2518 = _2516 + 1;
    bool _2520 = _2190 != 3;
    float _2522 = rsqrt(_2512);
    bool _2524 = !_2498;
    int _2526 = _2524 ? 0 : (-1);
    int _2528 = _2518 * as_type<int>(_2360);
    int _2530 = _2528 + _2496;
    int _2532 = abs(_2510);
    bool _2534 = !_2520;
    int _2536 = _2534 ? 0 : (-1);
    int _2538 = abs(_1902);
    bool _2540 = !_1894;
    int _2542 = _2540 ? 0 : 1;
    int _2544 = abs(_2526);
    int _2546 = abs(_2536);
    int _2548 = abs(_2542);
    int _2550 = ~_2532;
    int _2552 = _2550 + 1;
    int _2554 = _2552 + 1;
    int _2556 = ~_2546;
    int _2558 = _2556 + 1;
    int _2560 = _2558 + 1;
    int _2562 = _2554 * as_type<int>(_2410);
    int _2564 = _2562 + _2502;
    int _2566 = _2560 * as_type<int>(_2368);
    int _2568 = _2566 + _2530;
    int _2570 = ~_2544;
    int _2572 = _2570 + 1;
    int _2574 = _2572 + 1;
    int _2576 = ~_2538;
    int _2578 = _2576 + 1;
    int _2580 = _2578 + 1;
    int _2582 = ~_2548;
    int _2584 = _2582 + 1;
    int _2586 = _2584 + 1;
    int _2588 = _2574 * as_type<int>(_2418);
    int _2590 = _2588 + _2564;
    bool _2592 = !_1630;
    int _2594 = _2592 ? _2388 : (-1);
    int _2596 = _2568 * _2580;
    bool _2598 = !_1648;
    int _2600 = _2598 ? _2376 : (-1);
    float _2602 = _2296 * _2522;
    int _2604 = _2590 * _2586;
    bool _2606 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _2608 = isnan(1.0);
    bool _2610 = _2606 || _2608;
    bool _2612 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _2614 = _2610 || _2612;
    int _2616 = _2594 * _2538;
    int _2618 = _2616 + _2596;
    float _2620 = -_2198;
    float _2622 = _2602 * _2620;
    float _2624 = -_2194;
    float _2626 = _2602 * _2624;
    float _2628 = -_2204;
    float _2630 = _2602 * _2628;
    int _2632 = _2600 * _2548;
    int _2634 = _2632 + _2604;
    float _2636 = fma(_2522, _2114, _2622);
    float _2638 = fma(_2522, _2116, _2626);
    float _2640 = fma(_2522, _2122, _2630);
    float _2642 = _2198 + _2342;
    float _2644 = _2194 + _2350;
    float _2646 = float(_2618);
    float _2648 = _2178 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2650 = float(_2634);
    out.m_76.x = _2636;
    out.m_76.y = _2638;
    out.m_76.z = _2640;
    float _2652 = _2178 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2654 = fma(_1984, 2.0, -1.0);
    float _2656 = _2178 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_78.x = _2646;
    out.m_78.y = _2650;
    float _2658 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2648);
    float _2660 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2652);
    float _2662 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2656);
    out.m_80.x = _2642;
    out.m_80.y = _2644;
    out.m_80.z = _2434;
    float _2664 = _2654 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _2666 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2658);
    float _2668 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2660);
    float _2670 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2662);
    float _2672 = fma(_2664, (*spvDescriptorSet0.vp_c12)._m0[4].x, _2060);
    float _2674 = fma(_2664, (*spvDescriptorSet0.vp_c12)._m0[4].y, _2074);
    float _2676 = fma(_2664, (*spvDescriptorSet0.vp_c12)._m0[4].z, _2078);
    float _2678 = _2666 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2680 = _2672 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _2682 = _2674 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _2684 = _2676 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _2686 = _2668 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2688 = _2670 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2690 = _2678 + _2680;
    float _2692 = _2686 + _2682;
    float _2694 = _2688 + _2684;
    float _2696 = as_type<float>(_2538);
    float _2698 = _2646;
    float _2700 = _2650;
    float _2702 = _2668;
    float _2704 = _2686;
    float _2706 = _2668;
    float _2708 = _2638;
    float _2710 = _2636;
    float _2720;
    float _2722;
    float _2724;
    float _2726;
    if (!_2614)
    {
        bool _2712 = _2682 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _2714 = !_2712;
        _2716 = _2714;
        if (!_2716)
        {
            float _2718 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _2720 = _2718;
            _2722 = 0.0;
            _2724 = 0.0;
            _2726 = 0.0;
            _2728 = true;
        }
    }
    if ((!_2728) || _2716)
    {
        bool _2764;
        if (!_2716)
        {
            bool _2730 = _2682 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _2732 = isnan(_2682);
            bool _2734 = _2730 || _2732;
            bool _2736 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _2738 = _2734 || _2736;
            bool _2740 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _2742 = !_2738;
            bool _2744 = _2740 && _2742;
            bool _2746 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            _2704 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_2744)
            {
                _2696 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _2748 = _2696;
            float _2750 = _2748;
            if (_2744)
            {
                _2698 = 0.0;
                _2700 = 0.0;
            }
            float _2752 = _2698;
            float _2754 = _2700;
            _2722 = _2752;
            _2724 = _2754;
            if (_2744)
            {
                _2702 = 0.0;
            }
            float _2756 = _2702;
            _2706 = _2756;
            _2726 = _2756;
            if (_2744)
            {
                float _2758 = _2748 * 5.0;
                _2750 = _2758;
            }
            float _2760 = _2750;
            bool _2762 = !_2738;
            _2764 = _2762 && _2746;
            _2720 = _2760;
        }
        if ((!_2764) || _2716)
        {
            _2716 = false;
            float _2766 = _2704;
            float _2768 = _2706;
            bool _2770 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _2772 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _2774 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _2776 = _2678;
            float _2778 = _2766;
            float _2780 = _2768;
            _2720 = _2694;
            _2722 = _2690;
            _2724 = _2692;
            if (_2770)
            {
                float _2782 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _2776 = _2782;
            }
            float _2784 = _2776;
            if (_2770)
            {
                float _2786 = abs(_1976);
                float _2788 = -_2786;
                float _2790 = _2788 + 1.0;
                _2246 = _2790;
            }
            float _2792 = _2246;
            if (_2772)
            {
                float _2794 = abs(_1948);
                float _2796 = -_2794;
                float _2798 = _2796 + 1.0;
                _2248 = _2798;
            }
            float _2800 = _2248;
            if (!_2770)
            {
                _2708 = 1.0;
            }
            float _2802 = _2708;
            float _2804 = _2802;
            if (_2774)
            {
                float _2806 = abs(_2654);
                float _2808 = -_2806;
                float _2810 = _2808 + 1.0;
                _2710 = _2810;
            }
            float _2812 = _2710;
            if (!_2772)
            {
                _2778 = 1.0;
            }
            float _2814 = _2778;
            float _2816 = _2814;
            if (!_2774)
            {
                _2780 = 1.0;
            }
            float _2818 = _2780;
            float _2820 = _2640;
            float _2822 = _2818;
            if (_2772)
            {
                float _2824 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _2820 = _2824;
            }
            float _2826 = _2820;
            float _2828 = _2194;
            if (_2774)
            {
                float _2830 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _2828 = _2830;
            }
            float _2832 = _2828;
            if (_2770)
            {
                float _2834 = _2792 * _2784;
                float _2836 = precise::clamp(_2834, 0.0, 1.0);
                _2804 = _2836;
            }
            float _2838 = _2804;
            if (_2772)
            {
                float _2840 = _2800 * _2826;
                float _2842 = precise::clamp(_2840, 0.0, 1.0);
                _2816 = _2842;
            }
            float _2844 = _2816;
            float _2846 = _2838 * _2844;
            if (_2774)
            {
                float _2848 = _2812 * _2832;
                float _2850 = precise::clamp(_2848, 0.0, 1.0);
                _2822 = _2850;
            }
            float _2852 = _2822;
            float _2854 = _2846 * _2852;
            _2726 = _2854;
        }
    }
    _2728 = false;
    float _2856 = _2720;
    float _2858 = _2722;
    float _2860 = _2724;
    float _2862 = _2726;
    float _2864 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2866 = _2856 + _2864;
    float _2868 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2870 = _2858 + _2868;
    float _2872 = _2682 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2874 = _2866 * _2866;
    bool _2876 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2878 = isnan(0.5);
    bool _2880 = _2876 || _2878;
    bool _2882 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2884 = _2880 || _2882;
    float _2886 = fma(_2680, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2872);
    bool _2888 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2890 = isnan(0.5);
    bool _2892 = _2888 || _2890;
    bool _2894 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2896 = _2892 || _2894;
    float _2898 = fma(_2870, _2870, _2874);
    float _2900 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2886);
    float _2902 = _2682 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2904 = sqrt(_2898);
    float _2906 = _2900 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2908 = fma(_2680, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2902);
    float _2910 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2908);
    float _2912 = 1.0 / _2906;
    float _2914 = _2910 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2916 = _2914 + _2906;
    bool _2918 = _2904 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2920 = _2916 * _2912;
    float _2922 = _2920 * 0.5;
    bool _2924 = !_2918;
    float _2926 = _2858;
    float _2928 = _2860;
    float _2930 = _2856;
    float _2932 = _2912;
    float _2934 = _2866;
    if (!_2924)
    {
        float _2936 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2938 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2940 = _2904 + _2938;
        float _2942 = _2860 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2944 = rsqrt(_2898);
        float _2946 = _2940 * _2936;
        float _2948 = _2946 * 0.15915493667125701904296875;
        float _2950 = _2948 * 6.283185482025146484375;
        float _2952 = cos(_2950);
        float _2954 = _2948 * 6.283185482025146484375;
        float _2956 = sin(_2954);
        float _2958 = _2952 + (-1.0);
        float _2960 = _2958 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2962 = fma(_2956, _2942, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2964 = fma(_2952, _2860, _2960);
        float _2966 = _2944 * _2962;
        float _2968 = fma(_2870, _2966, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2970 = fma(_2866, _2966, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2926 = _2968;
        _2928 = _2964;
        _2930 = _2970;
        _2932 = _2966;
    }
    float _2972 = _2926;
    float _2974 = _2928;
    float _2976 = _2930;
    float _2978 = _2932;
    float _2980 = _2974;
    float _2982 = _2972;
    float _2984 = _2976;
    float _2986 = _2978;
    if (_2896)
    {
        _2250 = 1.0;
    }
    float _2988 = _2250;
    float _2990 = _2988;
    if (!_2884)
    {
        float _2992 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2994 = _2682 + _2992;
        float _2996 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2998 = _2680 + _2996;
        float _3000 = _2994 * _2994;
        float _3002 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3004 = _2684 + _3002;
        float _3006 = fma(_2998, _2998, _3000);
        float _3008 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3010 = fma(_3004, _3004, _3006);
        float _3012 = -_2680;
        float _3014 = _3012 + _2972;
        float _3016 = sqrt(_3010);
        float _3018 = precise::min(_3016, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3020 = _3018 * _3008;
        float _3022 = -_2682;
        float _3024 = _3022 + _2974;
        float _3026 = -_2684;
        float _3028 = _3026 + _2976;
        float _3030 = fma(_3014, _3020, _2680);
        float _3032 = fma(_3024, _3020, _2682);
        float _3034 = fma(_3028, _3020, _2684);
        _2980 = _3032;
        _2982 = _3030;
        _2984 = _3034;
        _2986 = _3020;
    }
    float _3036 = _2980;
    float _3038 = _2982;
    float _3040 = _2984;
    float _3042 = _2986;
    if (!_2896)
    {
        float _3044 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3046 = fma(_2922, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3044);
        float _3048 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3050 = _3048 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _3052 = 1.0 / _3046;
        float _3054 = 1.0 / _3050;
        float _3056 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3058 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3060 = fma(_3052, _3056, _3058);
        float _3062 = _3060 * _3054;
        float _3064 = precise::clamp(_3062, 0.0, 1.0);
        _2990 = _3064;
    }
    float _3066 = _2990;
    float _3068 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3070 = _3036 + _3068;
    float _3072 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3074 = _3038 + _3072;
    float _3076 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3078 = _3040 + _3076;
    float _3080 = _3070 * _3070;
    float _3082 = fma(_3074, _3074, _3080);
    float _3084 = fma(_3078, _3078, _3082);
    float _3086 = rsqrt(_3084);
    float _3088 = sqrt(_3084);
    float _3090 = _3086 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3092 = _3074 * _3090;
    float _3094 = _3078 * _3090;
    float _3096 = _3092 * _3092;
    float _3098 = _3094 * _3094;
    float _3100 = _3096 + _3098;
    float _3102 = sqrt(_3100);
    bool _3104 = _3102 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3106 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3108 = _3102 + _3106;
    float _3110 = _3086;
    float _3112 = _3108;
    float _3114 = _3070;
    float _3116 = _3092;
    if (_3104)
    {
        float _3118 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3110 = _3118;
    }
    float _3120 = _3110;
    float _3122 = _3120;
    if (_3104)
    {
        float _3124 = _3108 * _3120;
        _3112 = _3124;
    }
    float _3126 = _3112;
    if (_3104)
    {
        float _3128 = rsqrt(_3100);
        _3122 = _3128;
    }
    float _3130 = _3122;
    float _3132 = _3130;
    if (_3104)
    {
        float _3134 = _3126 * 0.15915493667125701904296875;
        _2934 = _3134;
    }
    float _3136 = _2934;
    float _3138 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3140 = _3078;
    if (_3104)
    {
        float _3142 = _3136 * 6.283185482025146484375;
        float _3144 = sin(_3142);
        _3140 = _3144;
    }
    float _3146 = _3140;
    float _3148 = precise::max(0.0, _3138);
    float _3150 = _3042;
    float _3152 = _3148;
    if (_3104)
    {
        float _3154 = _3136 * 6.283185482025146484375;
        float _3156 = cos(_3154);
        _3150 = _3156;
    }
    float _3158 = _3150;
    float _3160 = -_3090;
    float _3162 = -_3148;
    float _3164 = fma(_3070, _3160, _3162);
    if (_3104)
    {
        float _3166 = _3164 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3114 = _3166;
    }
    float _3168 = _3114;
    float _3170 = _3146;
    float _3172 = _3168;
    if (_3104)
    {
        float _3174 = fma(_3146, _3168, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3170 = _3174;
    }
    float _3176 = _3170;
    float _3178 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3180 = _3176;
    if (_3104)
    {
        float _3182 = _3130 * _3176;
        _2252 = _3182;
    }
    float _3184 = _2252;
    if (!_3104)
    {
        _3132 = _3164;
    }
    float _3186 = _3132;
    float _3188 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3178);
    float _3190 = _3186;
    if (_3104)
    {
        float _3192 = _3158 + (-1.0);
        _3152 = _3192;
    }
    float _3194 = _3152;
    float _3196 = _3194;
    if (_3104)
    {
        float _3198 = _3092 * _3184;
        _3116 = _3198;
    }
    float _3200 = _3116;
    if (!_3104)
    {
        _3180 = _3094;
    }
    float _3202 = _3180;
    float _3204 = _3202;
    if (_3104)
    {
        float _3206 = _3094 * _3184;
        _3204 = _3206;
    }
    float _3208 = _3204;
    if (_3104)
    {
        float _3210 = _3194 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3172 = _3210;
    }
    float _3212 = _3172;
    float _3214 = _3212;
    if (!_3104)
    {
        _3196 = _3096;
    }
    float _3216 = _3196;
    float _3218 = _3216;
    if (_3104)
    {
        float _3220 = _3200 * _3200;
        _3218 = _3220;
    }
    float _3222 = _3218;
    float _3224 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_3104)
    {
        float _3226 = fma(_3164, _3158, _3212);
        _3190 = _3226;
    }
    float _3228 = _3190;
    if (!_3104)
    {
        _3214 = _3098;
    }
    float _3230 = _3214;
    float _3232 = _3230;
    if (_3104)
    {
        float _3234 = _3208 * _3208;
        _3232 = _3234;
    }
    float _3236 = _3232;
    float _3238 = fma(_3228, _3228, _3222);
    float _3240 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3224);
    float _3242 = _3238 + _3236;
    float _3244 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3246 = fma(_3088, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3244);
    float _3248 = precise::clamp(_3246, 0.0, 1.0);
    float _3250 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3252 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3188);
    float _3254 = rsqrt(_3242);
    float _3256 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3258 = -_3248;
    float _3260 = _3258 + 1.0;
    float _3262 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3250);
    float _3264 = _3252 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3266 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3256);
    float _3268 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3270 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3240);
    float _3272 = abs(_3260);
    float _3274 = log2(_3272);
    float _3276 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3262);
    float _3278 = _3264 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3280 = fma(_3040, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3266);
    float _3282 = _3276 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3284 = -_3278;
    float _3286 = fma(_3284, _3268, 1.0);
    float _3288 = _3280 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3290 = _3270 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3292 = _3254 * _3200;
    float _3294 = _3282 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3296 = _3254 * _3228;
    float _3298 = _3254 * _3208;
    float _3300 = _3292 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3302 = fma(_3288, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3294);
    float _3304 = log2(_3286);
    float _3306 = _3274 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3308 = -_3300;
    float _3310 = fma(_3296, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3308);
    float _3312 = fma(_3264, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3302);
    float _3314 = _3296 + 1.0;
    float _3316 = -_3298;
    float _3318 = fma(_3316, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3310);
    float _3320 = fma(_3290, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3312);
    float _3322 = _3282 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3324 = _3282 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3326 = fma(_3318, -0.5, 0.5);
    float _3328 = 1.0 / _3320;
    float _3330 = fma(_3318, 0.5, 0.5);
    float _3332 = fma(_3288, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3322);
    float _3334 = fma(_3288, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3324);
    float _3336 = fma(_3330, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3338 = fma(_3264, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3332);
    float _3340 = fma(_3264, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3334);
    float _3342 = exp2(_3306);
    float _3344 = fma(_3330, _3336, -0.212114393711090087890625);
    float _3346 = fma(_3290, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3338);
    float _3348 = fma(_3290, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3340);
    float _3350 = _3304 * 0.693147182464599609375;
    float _3352 = fma(_3330, _3344, 1.570728778839111328125);
    float _3354 = sqrt(_3326);
    float _3356 = _3346 * _3328;
    float _3358 = _3348 * _3328;
    float _3360 = _3350 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3362 = fma(_3356, 0.5, 0.5);
    float _3364 = fma(_3358, -0.5, 0.5);
    float _3366 = -_3296;
    float _3368 = fma(_3342, _3314, _3366);
    float _3370 = fma(_3368, 0.5, 0.5);
    float _3372 = _3354 * 0.636619746685028076171875;
    float _3374 = -_3352;
    float _3376 = fma(_3372, _3374, 1.0);
    float3 _9041 = float3(_3362, _3364, _3360);
    float _3378 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9041, float3(0.0), isnan(_9041)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9041, float3(0.0), isnan(_9041)), level(0.0)).x;
    float3 _9052 = float3(_3362, _3364, _3360);
    float4 _3381 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9052, float3(0.0), isnan(_9052)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9052, float3(0.0), isnan(_9052)), level(0.0)).xyzw;
    float _3383 = _3381.x;
    float _3385 = _3381.y;
    float _3387 = _3381.z;
    float _3389 = _3381.w;
    float2 _9069 = float2(_3376, _3370);
    float3 _3393 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9069, float2(0.0), isnan(_9069)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9069, float2(0.0), isnan(_9069)), level(0.0)).xyz;
    float _3395 = _3393.x;
    float _3397 = _3393.y;
    float _3399 = _3393.z;
    float _3401 = _2682 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3403 = _2682 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3405 = _2682 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3407 = _2682 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3409 = fma(_2680, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3401);
    float _3411 = fma(_2680, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3403);
    out.m_82.x = _2680;
    out.m_82.y = _2682;
    out.m_82.z = _2684;
    float _3413 = fma(_2680, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3405);
    float _3415 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3409);
    float _3417 = fma(_2680, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3407);
    out.m_84.y = 1.0;
    float _3419 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3411);
    float _3421 = _3415 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3423 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3413);
    float _3425 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3417);
    float _3427 = _3419 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3429 = -_645;
    float _3431 = _3429 + _3040;
    float _3433 = _3282 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3435 = -_641;
    float _3437 = _3435 + _3036;
    float _3439 = -_639;
    float _3441 = _3439 + _3038;
    float _3443 = _3421 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3445 = _3421 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3447 = _3437 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _3449 = _3421 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3451 = _3421 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3453 = _3423 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3455 = fma(_3441, (*spvDescriptorSet0.vp_c15)._m0[638].x, _3447);
    float _3457 = fma(_3427, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3443);
    float _3459 = fma(_3427, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3445);
    float _3461 = fma(_3427, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3449);
    float _3463 = fma(_3427, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3451);
    float _3465 = fma(_3431, (*spvDescriptorSet0.vp_c15)._m0[638].z, _3455);
    float _3467 = _3437 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _3469 = _3437 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _3471 = _3453 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _3473 = _3465 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _3475 = fma(_3288, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3433);
    float _3477 = _3425 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3479 = _3471 + _3463;
    float _3481 = _3274 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3483 = fma(_3264, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3475);
    float _3485 = 1.0 / _3473;
    float _3487 = fma(_3477, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3479);
    float _3489 = fma(_3441, (*spvDescriptorSet0.vp_c15)._m0[635].x, _3467);
    float _3491 = fma(_3441, (*spvDescriptorSet0.vp_c15)._m0[636].x, _3469);
    float _3493 = fma(_3453, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3461);
    float _3495 = fma(_3290, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3483);
    float _3497 = fma(_3431, (*spvDescriptorSet0.vp_c15)._m0[635].z, _3489);
    float _3499 = _3453 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _3501 = exp2(_3481);
    float _3503 = fma(_3477, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3493);
    float _3505 = fma(_3431, (*spvDescriptorSet0.vp_c15)._m0[636].z, _3491);
    float _3507 = _3497 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _3509 = _3499 + _3457;
    float _3511 = _3320 * 0.5;
    float _3513 = _3505 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _3515 = _3453 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _3517 = 1.0 / _3487;
    float _3519 = _3507 * _3485;
    out.gl_Position.x = _3346;
    out.gl_Position.y = _3348;
    out.gl_Position.z = _3495;
    out.gl_Position.w = _3320;
    float _3521 = _3495 + _3320;
    float _3523 = _3346 + _3320;
    float _3525 = fma(_3477, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3509);
    float _3527 = fma(_3348, -0.5, _3511);
    float _3529 = _3513 * _3485;
    float _3531 = -_3501;
    float _3533 = _3531 + 1.0;
    float _3535 = _3515 + _3459;
    float _3537 = _3521 * 0.5;
    float _3539 = _3533 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3541 = _3523 * 0.5;
    out.m_86.x = _3038;
    out.m_86.y = _3036;
    out.m_86.z = _3040;
    float _3543 = fma(_3477, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3535);
    float _3545 = _3503 * _3517;
    float _3547 = _3525 * _3517;
    out.m_88.x = _3541;
    out.m_88.y = _3527;
    out.m_88.z = _3537;
    out.m_88.w = _3320;
    bool _3549 = _3545 > 0.0;
    bool _3551 = _3545 < 1.0;
    bool _3553 = _3551 && _3549;
    bool _3555 = _3356 > (-1.0);
    bool _3557 = _3555 && _3553;
    bool _3559 = _3358 > (-1.0);
    bool _3561 = _3559 && _3557;
    bool _3563 = _3356 < 1.0;
    bool _3565 = _3563 && _3561;
    bool _3567 = _3358 < 1.0;
    bool _3569 = _3567 && _3565;
    float _3571 = _3539 * _3378;
    float _3573 = _3543 * _3517;
    float _3575 = _3389 * _3571;
    float _3577 = _3399 * _3571;
    float _3579 = -_3539;
    float _3581 = _3579 + 1.0;
    float _3583 = fma(_3395, _3575, _3383);
    float _3585 = fma(_3397, _3575, _3385);
    float _3587 = _3389 * _3581;
    float _3589 = fma(_3389, _3577, _3387);
    out.m_90.x = _3583;
    out.m_90.y = _3585;
    out.m_90.z = _3589;
    out.m_90.w = _3587;
    bool _3591 = !_3569;
    float _3593 = _3581;
    float _3595 = _3587;
    float _3597 = _3346;
    float _3599 = _3589;
    float _3629;
    float _3631;
    float _3633;
    float _3641;
    if (!_3591)
    {
        float _3601 = -_3573;
        float _3603 = _3358 + _3601;
        float _3605 = -_3547;
        float _3607 = _3356 + _3605;
        float _3609 = _2862 * _3066;
        float _3611 = -_3519;
        float _3613 = _3356 + _3611;
        float _3615 = _3603 * _3603;
        float _3617 = -_3529;
        float _3619 = _3358 + _3617;
        float _3621 = _3609 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
        float _3623 = fma(_3607, _3607, _3615);
        float _3625 = sqrt(_3623);
        bool _3627 = _3625 > 0.0;
        _3629 = _3607;
        _3631 = _3623;
        _3633 = _3625;
        if (!_3627)
        {
            _3593 = _3621;
        }
        float _3635 = _3593;
        bool _3637 = !_3627;
        float _3639 = _3635;
        _3641 = _3635;
        _3643 = _3637;
        if (!_3643)
        {
            float _3645 = _3619 * _3619;
            float _3647 = fma(_3613, _3613, _3645);
            float _3649 = rsqrt(_3623);
            float _3651 = sqrt(_3647);
            float _3653 = _3607 * _3649;
            float _3655 = _3603 * _3649;
            bool _3657 = _3651 > 0.0;
            _3599 = _3651;
            _3633 = _3649;
            if (!_3657)
            {
                _3639 = _3621;
            }
            float _3659 = _3639;
            bool _3661 = !_3657;
            _3641 = _3659;
            _3643 = _3661;
            if (!_3643)
            {
                float _3663 = _1874 * _3477;
                float _3665 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
                float _3667 = fma(_3663, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3471);
                float _3669 = fma(_3663, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3515);
                float _3671 = fma(_3663, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3499);
                float _3673 = fma(_3477, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3667);
                float _3675 = fma(_3477, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3669);
                float _3677 = fma(_3477, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3671);
                float _3679 = rsqrt(_3647);
                float _3681 = _3665 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _3683 = 1.0 / _3673;
                float _3685 = _3619 * _3681;
                float _3687 = _3613 * _3681;
                float _3689 = _3685 * _3685;
                float _3691 = fma(_3687, _3687, _3689);
                float _3693 = _3619 * _3679;
                float _3695 = _3613 * _3679;
                float _3697 = _3655 * _3693;
                float _3699 = _3675 * _3683;
                float _3701 = _3677 * _3683;
                float _3703 = sqrt(_3691);
                float _3705 = fma(_3653, _3695, _3697);
                float _3707 = _3699 * _3699;
                float _3709 = fma(_3701, _3701, _3707);
                float _3711 = precise::min(0.0, _3705);
                float _3713 = sqrt(_3709);
                float _3715 = _3320 * _3711;
                float _3717 = fma(_3687, _3715, _3346);
                float _3719 = fma(_3685, _3715, _3348);
                out.gl_Position.x = _3717;
                out.gl_Position.y = _3719;
                float _3721 = fma(_3703, (*spvDescriptorSet0.vp_c13)._m0[1].x, _3713);
                float _3723 = 1.0 / _3721;
                float _3725 = _3713 * _3723;
                out.m_84.y = _3725;
                _3629 = _3715;
                _3595 = _3703;
                _3641 = _3621;
                _3597 = _3717;
                _3631 = _3687;
                _3599 = _3685;
                _3633 = _3725;
                _3643 = true;
            }
        }
    }
    else
    {
        float _3727 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _3727;
        _3629 = 0.0;
        _3641 = 0.0;
        _3631 = 0.0;
        _3599 = _3727;
        _3633 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    _3643 = false;
    float _3729 = _3629;
    float _3731 = _3595;
    float _3733 = _3641;
    float _3735 = _3597;
    float _3737 = _3631;
    float _3739 = _3599;
    float _3741 = _3633;
    bool _3743 = _3088 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3745 = isnan(_3088);
    bool _3747 = _3743 || _3745;
    bool _3749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3751 = _3747 || _3749;
    float _3753 = _3735;
    float _3755 = _3731;
    float _3757 = _3739;
    float _3759 = _3737;
    float _3761 = _3729;
    float _3763 = _3741;
    if (!_3751)
    {
        _3753 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3765 = _3753;
    float _3767 = _3765;
    float _3769 = _3765;
    if (!_3751)
    {
        _3755 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3771 = _3755;
    float _3773 = _3771;
    float _3775 = _3771;
    if (!_3751)
    {
        _3757 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3777 = _3757;
    float _3779 = _3777;
    float _3781 = _3777;
    if (!_3751)
    {
        _3759 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3783 = _3759;
    float _3785 = _3783;
    float _3787 = _3783;
    if (!_3751)
    {
        _3761 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3789 = _3761;
    float _3791 = _3789;
    float _3793 = _3789;
    if (!_3751)
    {
        _3763 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3795 = _3763;
    bool _3797 = !_3751;
    float _3799 = _3795;
    float _3801 = _3795;
    if (!_3797)
    {
        bool _3803 = _3088 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3805 = isnan(_3088);
        bool _3807 = _3803 || _3805;
        bool _3809 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3811 = _3807 || _3809;
        if (!_3811)
        {
            float _3813 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3815 = _3088 + _3813;
            float _3817 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3819 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3817;
            float _3821 = 1.0 / _3819;
            float _3823 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3825 = _3823 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3827 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3829 = _3827 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3831 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3833 = _3831 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3835 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3837 = _3835 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3839 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3841 = _3839 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3843 = _3815 * _3821;
            float _3845 = precise::clamp(_3843, 0.0, 1.0);
            float _3847 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3849 = _3847 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3851 = fma(_3845, _3825, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3853 = fma(_3845, _3849, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3855 = fma(_3845, _3829, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3857 = fma(_3845, _3833, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3859 = fma(_3845, _3837, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3861 = fma(_3845, _3841, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3775 = _3853;
            _3793 = _3859;
            _3769 = _3851;
            _3787 = _3857;
            _3781 = _3855;
            _3801 = _3861;
            _3863 = true;
        }
        else
        {
            bool _3865 = _3088 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3867 = isnan(_3088);
            bool _3869 = _3865 || _3867;
            bool _3871 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3873 = _3869 || _3871;
            if (!_3873)
            {
                _3767 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3875 = _3767;
            _3769 = _3875;
            if (!_3873)
            {
                _3773 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3877 = _3773;
            _3775 = _3877;
            if (!_3873)
            {
                _3779 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3879 = _3779;
            _3781 = _3879;
            if (!_3873)
            {
                _3785 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3881 = _3785;
            _3787 = _3881;
            if (!_3873)
            {
                _3791 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3883 = _3791;
            _3793 = _3883;
            if (!_3873)
            {
                _3799 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3885 = _3799;
            bool _3887 = !_3873;
            _3801 = _3885;
            if (!_3887)
            {
                bool _3889 = _3088 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3891 = isnan(_3088);
                bool _3893 = _3889 || _3891;
                bool _3895 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3897 = _3893 || _3895;
                if (!_3897)
                {
                    float _3899 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3901 = _3088 + _3899;
                    float _3903 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3905 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3903;
                    float _3907 = 1.0 / _3905;
                    float _3909 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3911 = _3909 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3913 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3915 = _3913 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3917 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3919 = _3917 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3921 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3923 = _3921 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3925 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3927 = _3925 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3929 = _3901 * _3907;
                    float _3931 = precise::clamp(_3929, 0.0, 1.0);
                    float _3933 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3935 = _3933 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3937 = fma(_3931, _3911, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3939 = fma(_3931, _3935, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3941 = fma(_3931, _3915, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3943 = fma(_3931, _3919, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3945 = fma(_3931, _3923, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3947 = fma(_3931, _3927, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3775 = _3939;
                    _3793 = _3945;
                    _3769 = _3937;
                    _3787 = _3943;
                    _3781 = _3941;
                    _3801 = _3947;
                    _3863 = true;
                }
                else
                {
                    _3775 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3793 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3769 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3787 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3781 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3801 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3863 = false;
    float _3949 = _3775;
    float _3951 = _3793;
    float _3953 = _3769;
    float _3955 = _3787;
    float _3957 = _3781;
    float _3959 = _3801;
    float _3961 = fma(_2644, -0.5, 0.5);
    float _3963 = precise::clamp(_3961, 0.0, 1.0);
    float _3965 = -_3949;
    float _3967 = _3965 + _3951;
    float _3969 = _3733 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3971 = -_3953;
    float _3973 = _3971 + _3955;
    float _3975 = fma(_3963, _3967, _3949);
    out.m_92.x = 0.0;
    float _3977 = -_3957;
    float _3979 = _3977 + _3959;
    float _3981 = fma(_3963, _3973, _3953);
    float _3983 = _3975 * 0.586610972881317138671875;
    out.m_53.x = _3969;
    bool _3985 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3987 = fma(_3963, _3979, _3957);
    float _3989 = fma(_3981, 0.298911988735198974609375, _3983);
    bool _3991 = _3066 > 0.0;
    bool _3993 = isnan(_3066);
    bool _3995 = _3991 || _3993;
    bool _3997 = isnan(0.0);
    bool _3999 = _3995 || _3997;
    float _4001 = fma(_3987, 0.114477999508380889892578125, _3989);
    float _4003 = -_4001;
    float _4005 = _3981 + _4003;
    float _4007 = -_4001;
    float _4009 = _3975 + _4007;
    float _4011 = -_4001;
    float _4013 = _3987 + _4011;
    float _4015 = fma(_4005, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4001);
    float _4017 = fma(_4009, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4001);
    float _4019 = fma(_4013, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4001);
    bool _4021 = !_3985;
    if (!_4021)
    {
        float _4023 = -_3036;
        float _4025 = _4023 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4027 = -_3038;
        float _4029 = _4027 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4031 = -_3040;
        float _4033 = _4031 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4035 = _4025 * _4025;
        float _4037 = fma(_4029, _4029, _4035);
        float _4039 = fma(_4033, _4033, _4037);
        float _4041 = sqrt(_4039);
        float _4043 = rsqrt(_4039);
        float _4045 = -_4041;
        float _4047 = _4045 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4049 = _4047 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4051 = precise::clamp(_4049, 0.0, 1.0);
        float _4053 = _4029 * _4043;
        float _4055 = _4025 * _4043;
        float _4057 = abs(_4051);
        float _4059 = log2(_4057);
        float _4061 = _4033 * _4043;
        float _4063 = _4053 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4065 = _2644 * _4055;
        float _4067 = -_4055;
        float _4069 = -_4063;
        float _4071 = fma(_4067, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4069);
        float _4073 = fma(_2642, _4053, _4065);
        float _4075 = -_4061;
        float _4077 = fma(_4075, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4071);
        float _4079 = fma(_2434, _4061, _4073);
        float _4081 = precise::clamp(_4079, 0.0, 1.0);
        float _4083 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4085 = _4077 + _4083;
        float _4087 = _4059 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4089 = _4085 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4091 = precise::clamp(_4089, 0.0, 1.0);
        float _4093 = exp2(_4087);
        float _4095 = _4093 * _4091;
        float _4097 = _4081 * _4095;
        float _4099 = _4097 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4101 = _4097 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4103 = _4097 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _4099;
        out.m_92.y = _4101;
        out.m_92.z = _4103;
    }
    out.m_94.x = _4015;
    out.m_94.y = _4017;
    out.m_94.z = _4019;
    if (_3999)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _4105 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4105;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

