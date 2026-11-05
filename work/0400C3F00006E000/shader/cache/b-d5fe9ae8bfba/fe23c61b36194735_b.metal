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
    float4 m_84 [[user(locn0)]];
    float4 m_72 [[user(locn1)]];
    float4 m_76 [[user(locn2)]];
    float4 m_88 [[user(locn3)]];
    float4 m_90 [[user(locn4)]];
    float4 m_82 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
    float4 m_92 [[user(locn7)]];
    float4 m_74 [[user(locn8)]];
    float4 m_80 [[user(locn9)]];
    float4 m_70 [[user(locn10)]];
    float4 m_78 [[user(locn11)]];
    float4 m_51 [[user(locn12)]];
    float4 m_55 [[user(locn13)]];
    float4 m_86 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_59 [[attribute(1)]];
    float4 m_57 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_68 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_46 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_66 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3083 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_44.w;
    float _108 = in.m_46.w;
    float _110 = trunc(_106);
    int _113 = int(_110);
    float _115 = -_108;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _117;
    bool _121 = _113 >= 1;
    float _123 = 0.0;
    float _125 = _108;
    float _127 = _117;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _123;
    if (!_121)
    {
        out.m_51.x = 0.0;
    }
    int _131 = 0;
    if (!_121)
    {
        float _133 = _129 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3379 = as_type<float>(_135);
        out.gl_Position.z = _3379;
    }
    if (!_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _139 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_108);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = in.m_53.x;
    float _151 = float(_113);
    float _153 = in.m_53.y;
    bool _155 = _117 >= _151;
    bool _157 = !_147;
    bool _159 = _155 || _157;
    float _161 = in.m_53.z;
    if (_159)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _125;
    if (_159)
    {
        out.m_51.x = 0.0;
    }
    if (_159)
    {
        float _165 = _163 * 5.0;
        _137 = as_type<int>(_165);
    }
    int _167 = _137;
    out.m_55.x = _149;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3442 = as_type<float>(_167);
        out.gl_Position.z = _3442;
    }
    out.m_55.y = _153;
    out.m_55.z = _161;
    if (_159)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _169 = in.m_57.x;
    float _171 = in.m_57.y;
    float _173 = in.m_57.z;
    float _175 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _177 = in.m_59.x;
    float _179 = in.m_59.y;
    float _181 = in.m_59.z;
    float _183 = in.m_61.x;
    float _185 = in.m_61.y;
    float _187 = in.m_61.z;
    float _189 = as_type<float>(int(gl_VertexIndex));
    float _191 = in.m_66.w;
    float _193 = in.m_46.x;
    float _195 = in.m_46.y;
    float _197 = in.m_46.z;
    float _199 = _171 * _171;
    float _201 = _169 * _169;
    float _203 = _173 * _173;
    float _205 = fma(_179, _179, _199);
    float _207 = fma(_177, _177, _201);
    float _209 = fma(_181, _181, _203);
    float _211 = fma(_185, _185, _205);
    float _213 = fma(_183, _183, _207);
    float _215 = fma(_187, _187, _209);
    float _217 = sqrt(_211);
    float _219 = sqrt(_213);
    bool _221 = _217 > 0.0;
    float _223 = sqrt(_215);
    bool _225 = _219 > 0.0;
    float _227 = in.m_44.x;
    float _229 = in.m_44.y;
    float _231 = in.m_44.z;
    int _233 = as_type<int>(_189) & 1;
    bool _235 = _233 != 0;
    int _237 = as_type<int>(_189) & 2;
    bool _239 = _237 != 0;
    float _241 = _217;
    float _243 = _215;
    float _245 = _189;
    float _247 = _171;
    if (_221)
    {
        float _249 = rsqrt(_211);
        _241 = _249;
    }
    float _251 = _241;
    bool _253 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _257 = _253 || _255;
    bool _259 = isnan(1.0);
    bool _261 = _257 || _259;
    float _263 = 0.0;
    if (!_221)
    {
        _263 = 0.0;
    }
    float _265 = _263;
    bool _267 = _223 > 0.0;
    float _269 = 0.0;
    float _271 = _265;
    if (!_221)
    {
        _269 = 0.0;
    }
    float _273 = _269;
    float _275 = _213;
    float _277 = _273;
    if (_225)
    {
        float _279 = rsqrt(_213);
        _275 = _279;
    }
    float _281 = _275;
    float _283 = 0.0;
    if (!_221)
    {
        _283 = 0.0;
    }
    float _285 = _283;
    float _287 = 0.0;
    float _289 = _285;
    if (!_225)
    {
        _287 = 0.0;
    }
    float _291 = _287;
    float _293 = 0.0;
    float _295 = _291;
    if (!_225)
    {
        _293 = 0.0;
    }
    float _297 = _293;
    float _299 = _251;
    float _301 = _297;
    if (_221)
    {
        float _303 = _251 * _179;
        _271 = _303;
    }
    float _305 = _271;
    if (_221)
    {
        float _307 = _251 * _171;
        _277 = _307;
    }
    float _309 = _277;
    if (_221)
    {
        float _311 = _251 * _185;
        _289 = _311;
    }
    float _313 = _289;
    float _315 = _313;
    if (!_261)
    {
        float _317 = _175 * _175;
        float _319 = _317 * 0.5;
        _299 = _319;
    }
    float _321 = _299;
    float _323 = 0.0;
    float _325 = _321;
    if (!_225)
    {
        _323 = 0.0;
    }
    float _327 = _323;
    float _329 = 0.0;
    float _331 = _327;
    if (_267)
    {
        float _333 = rsqrt(_215);
        _329 = _333;
    }
    float _335 = _329;
    bool _337 = !_235;
    float _339 = _337 ? (-0.5) : 0.5;
    if (!_261)
    {
        float _341 = _321 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _325 = _341;
    }
    float _343 = _325;
    float _345 = _343;
    if (_225)
    {
        float _347 = _281 * _177;
        _295 = _347;
    }
    float _349 = _295;
    if (_225)
    {
        float _351 = _281 * _169;
        _301 = _351;
    }
    float _353 = _301;
    if (_225)
    {
        float _355 = _281 * _183;
        _331 = _355;
    }
    float _357 = _331;
    bool _359 = !_239;
    float _361 = _359 ? (-0.5) : 0.5;
    if (!_267)
    {
        _243 = 0.0;
    }
    float _363 = _243;
    bool _365 = !_261;
    float _367 = _363;
    if (!_365)
    {
        float _369 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _371 = log2(_369);
        float _373 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _375 = _373 + 1.0;
        float _377 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _379 = _175 * _371;
        float _381 = 1.0 / _375;
        float _383 = _377 * 0.693147182464599609375;
        float _385 = exp2(_379);
        float _387 = 1.0 / _383;
        float _389 = _385 + (-1.0);
        float _391 = -_389;
        float _393 = fma(_391, _387, _175);
        float _395 = _393 * _381;
        float _397 = _395 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _345 = _397;
        _245 = _383;
    }
    float _399 = _345;
    float _401 = _245;
    float _403 = _399 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _405 = 1.0 / _151;
    float _407 = _401;
    if (_267)
    {
        float _409 = _335 * _173;
        _367 = _409;
    }
    float _411 = _367;
    float _413 = _399 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _415 = _403 * _309;
    float _417 = _403 * _353;
    float _419 = _411;
    if (!_267)
    {
        _407 = 0.0;
    }
    float _421 = _407;
    float _423 = _403 * _411;
    float _425 = _421;
    if (_267)
    {
        float _427 = _335 * _181;
        _425 = _427;
    }
    float _429 = _425;
    float _431 = _399 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _433 = fma(_413, _305, _415);
    float _435 = fma(_413, _349, _417);
    if (!_267)
    {
        _419 = 0.0;
    }
    float _437 = _419;
    float _439 = fma(_413, _429, _423);
    float _441 = fma(_431, _313, _433);
    float _443 = _437;
    if (_267)
    {
        float _445 = _335 * _187;
        _443 = _445;
    }
    float _447 = _443;
    float _449 = fma(_431, _357, _435);
    if (!_261)
    {
        _315 = _175;
    }
    float _451 = _315;
    bool _453 = !_261;
    float _455 = _451;
    if (!_453)
    {
        float _457 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _459 = log2(_457);
        float _461 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _463 = _461 + 1.0;
        float _465 = 1.0 / _463;
        float _467 = _175 * _459;
        float _469 = exp2(_467);
        float _471 = -_469;
        float _473 = _471 + 1.0;
        float _475 = _473 * _465;
        _455 = _475;
    }
    float _477 = _455;
    bool _479 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _481 = fma(_431, _447, _439);
    float _483 = fma(_477, _193, _449);
    float _485 = fma(_477, _195, _441);
    float _487 = _117 * _405;
    float _489 = fma(_477, _197, _481);
    float _491 = fma(_483, _191, _227);
    float _493 = fma(_485, _191, _229);
    float _495 = fma(_489, _191, _231);
    bool _497 = !_479;
    float _499 = _487;
    float _501 = _491;
    if (!_497)
    {
        float _503 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _505 = _149 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _507 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _509 = _507 * _503;
        float _511 = floor(_509);
        float _513 = -_511;
        float _515 = _509 + _513;
        _499 = _515;
    }
    float _517 = _499;
    float _519 = _149 * 2.0;
    float _521 = _149 + _153;
    float _523 = floor(_519);
    float _525 = _521 + (-1.0);
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _529 = _527 != 0;
    float _531 = _161 * 2.0;
    float _533 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _535 = _149 + _161;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _537;
    float _541 = floor(_531);
    float _543 = _535 + (-1.0);
    float _545 = _153 * 2.0;
    float _547 = _149 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _549 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _551 = _523 >= 0.0;
    bool _553 = isnan(_523);
    bool _555 = _551 || _553;
    bool _557 = isnan(0.0);
    bool _559 = _555 || _557;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _563 = _517 + _561;
    float _565 = 1.0 / _539;
    int _567 = as_type<int>(_543);
    if (_529)
    {
        _567 = 0;
    }
    int _569 = _567;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _573 = _569;
    if (!_529)
    {
        _573 = 1;
    }
    int _575 = _573;
    float _577 = in.m_61.w;
    float _579 = -_571;
    float _581 = fma(_547, 2.0, _579);
    float _583 = floor(_545);
    float _585 = _153 + _161;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _591 = _589 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _593 = _541 > 0.0;
    float _595 = _585 + (-1.0);
    bool _597 = _541 >= 0.0;
    bool _599 = isnan(_541);
    bool _601 = _597 || _599;
    bool _603 = isnan(0.0);
    bool _605 = _601 || _603;
    float _607 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _611 = _517 + _609;
    float _613 = _153 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _615 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _617 = int(_615);
    float _619 = _611 * _565;
    int _621 = _559 ? 0 : 1;
    float _623 = fma(_613, -2.0, _587);
    bool _625 = _575 != 1;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _627;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _631;
    float _635 = 1.0 / _591;
    bool _637 = _523 > 0.0;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _639;
    bool _643 = _583 > 0.0;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _647 = _583 >= 0.0;
    bool _649 = isnan(_583);
    bool _651 = _647 || _649;
    bool _653 = isnan(0.0);
    bool _655 = _651 || _653;
    float _657 = fma(_629, _619, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _659 = _605 ? 0 : 1;
    float _661 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _663 = int(_661);
    float _665 = as_type<float>(_575);
    float _667 = as_type<float>(_663);
    if (!_625)
    {
        _665 = _153;
    }
    float _669 = _665;
    float _671 = fma(_633, _619, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _673 = _669;
    if (_625)
    {
        _673 = _149;
    }
    float _675 = _673;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _679 = _517 + _677;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _685 = ~_659;
    int _687 = _685 + 1;
    int _689 = _687 + 1;
    float _691 = 1.0 / _641;
    float _693 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[83].z, _645);
    float _695 = _675;
    int _697 = _689;
    if (!_625)
    {
        _695 = _153;
    }
    float _699 = _695;
    float _701 = _679 * _635;
    float _703 = _699;
    if (!_593)
    {
        int _705 = ~_659;
        int _707 = _705 + 1;
        _697 = _707;
    }
    int _709 = _697;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _713 = _711 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    if (_625)
    {
        _703 = _149;
    }
    float _715 = _703;
    float _717 = fma(_683, _701, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _721 = _719 != 0;
    int _723 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _725 = _723 != 0;
    int _727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _729 = _727 != 0;
    float _731 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _733 = log2(_731);
    float _735 = float(_617);
    float _737 = _715 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _739 = _655 ? 0 : 1;
    float _741 = fma(_713, _701, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _743 = !_725;
    int _745 = _743 ? 0 : 1;
    float _747 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _623);
    bool _749 = !_721;
    int _751 = _749 ? 0 : 1;
    float _753 = _563 * _691;
    bool _755 = !_729;
    int _757 = _755 ? 0 : 1;
    float _759 = 1.0 / _735;
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _763 = _761 != 0;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _767 = _765 != 0;
    int _769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _771 = _769 != 0;
    float _773 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].z, _693);
    int _775 = ~_739;
    int _777 = _775 + 1;
    int _779 = _777 + 1;
    float _781 = float(_663);
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _785 = _779;
    if (!_643)
    {
        int _787 = ~_739;
        int _789 = _787 + 1;
        _785 = _789;
    }
    int _791 = _785;
    if (!_625)
    {
        _667 = _161;
    }
    float _793 = _667;
    bool _795 = !_771;
    int _797 = _795 ? 0 : 1;
    float _799 = 1.0 / _781;
    float _801 = _793;
    if (_625)
    {
        _801 = _153;
    }
    float _803 = _801;
    int _805 = ~_621;
    int _807 = _805 + 1;
    int _809 = _807 + 1;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _813 = _809;
    float _815 = _803;
    if (!_637)
    {
        int _817 = ~_621;
        int _819 = _817 + 1;
        _813 = _819;
    }
    int _821 = _813;
    float _823 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[83].w, _783);
    int _825 = abs(_797);
    float _827 = -_811;
    float _829 = fma(_737, 2.0, _827);
    bool _831 = !_767;
    int _833 = _831 ? 0 : 1;
    float _835 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].w, _823);
    if (!_625)
    {
        _815 = _161;
    }
    float _837 = _815;
    float _839 = -_117;
    float _841 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[81].x, _829);
    float _843 = float(_821);
    float _845 = _837;
    if (_625)
    {
        _845 = _153;
    }
    float _847 = _845;
    float _849 = float(_791);
    float _851 = _733 * _117;
    float _853 = float(_825);
    bool _855 = !_763;
    int _857 = _855 ? 0 : 1;
    float _859 = _853 * _849;
    int _861 = abs(_833);
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _865 = float(_709);
    float _867 = _847 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _869 = _405 * _117;
    float _871 = exp2(_851);
    float _873 = fma(_867, -2.0, _863);
    int _875 = abs(_857);
    float _877 = _859 * (-2.0);
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _881 = 1.0 + _879;
    float _883 = in.m_68.x;
    float _885 = in.m_68.y;
    float _887 = in.m_68.z;
    float _889 = _799 * _117;
    float _891 = float(_875);
    float _893 = 1.0 / _881;
    float _895 = float(_861);
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _899 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _901 = isnan(1.0);
    bool _903 = _899 || _901;
    bool _905 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _907 = _903 || _905;
    float _909 = _891 * _865;
    float _911 = _895 * _843;
    float _913 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[78].w, _897);
    float _915 = _759 * _117;
    float _917 = -_871;
    float _919 = _917 + 1.0;
    bool _921 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _923 = isnan(0.0);
    bool _925 = _921 || _923;
    bool _927 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _929 = _925 || _927;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _933 = _911 * (-2.0);
    float _935 = -_117;
    float _937 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[76].x, _581);
    float _939 = _929 ? _919 : 0.0;
    float _941 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[78].z, _931);
    bool _943 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _945 = isnan(_517);
    bool _947 = _943 || _945;
    bool _949 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _951 = _947 || _949;
    float _953 = float(_951);
    float _955 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _913);
    float _957 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[81].y, _873);
    float _959 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _941);
    if (_907)
    {
        float _961 = _939 * _893;
        _127 = _961;
    }
    float _963 = _127;
    float _965 = fma(_933, _885, _885);
    float _967 = _909 * (-2.0);
    float _969 = fma(_607, _933, _607);
    bool _971 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _973 = isnan(_517);
    bool _975 = _971 || _973;
    bool _977 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _979 = _975 || _977;
    float _981 = float(_979);
    float _983 = _153 + (-0.5);
    float _985 = -_953;
    float _987 = _985 + 1.0;
    float _989 = fma(_533, _967, _533);
    float _991 = fma(_967, _883, _883);
    float _993 = fma(_983, (*spvDescriptorSet0.vp_c9)._m0[196].y, _965);
    bool _995 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _997 = isnan(_517);
    bool _999 = _995 || _997;
    bool _1001 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1003 = _999 || _1001;
    float _1005 = float(_1003);
    float _1007 = _981 * _987;
    float _1009 = -_981;
    float _1011 = _1009 + 1.0;
    float _1013 = fma(_969, _963, _993);
    bool _1015 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1017 = isnan(_517);
    bool _1019 = _1015 || _1017;
    bool _1021 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1023 = _1019 || _1021;
    float _1025 = float(_1023);
    float _1027 = fma(_877, _887, _887);
    float _1029 = _1005 * _1011;
    float _1031 = -_1005;
    float _1033 = _1031 + 1.0;
    float _1035 = _149 + (-0.5);
    float _1037 = _1013 * 0.15915493667125701904296875;
    float _1039 = fma(_549, _877, _549);
    float _1041 = _1025 * _1033;
    float _1043 = fma(_1035, (*spvDescriptorSet0.vp_c9)._m0[196].x, _991);
    float _1045 = _161 + (-0.5);
    float _1047 = -_1025;
    float _1049 = _1047 + 1.0;
    float _1051 = _657 * _1041;
    float _1053 = _671 * _1041;
    float _1055 = fma(_1045, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1027);
    float _1057 = fma(_989, _963, _1043);
    float _1059 = in.m_66.x;
    float _1061 = in.m_66.y;
    float _1063 = fma(_1039, _963, _1055);
    float _1065 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1053);
    float _1067 = _1057 * 0.15915493667125701904296875;
    float _1069 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1069;
    float _1073 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1051);
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1075;
    float _1079 = fma(_741, _1029, _1065);
    float _1081 = fma(_1071, _753, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1083 = fma(_717, _1029, _1073);
    float _1085 = fma(_1077, _753, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1087 = _1063 * 0.15915493667125701904296875;
    float _1089 = _1037 * 6.283185482025146484375;
    float _1091 = sin(_1089);
    float _1093 = fma(_1081, _1007, _1083);
    float _1095 = fma(_1085, _1007, _1079);
    float _1097 = _493 * _185;
    float _1099 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _361);
    float _1101 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1093);
    float _1103 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1095);
    float _1105 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _339);
    float _1107 = _1037 * 6.283185482025146484375;
    float _1109 = cos(_1107);
    float _1111 = fma(_491, _183, _1097);
    float _1113 = _1101 * _1059;
    float _1115 = _1103 * _1061;
    float _1117 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1119 = fma(_495, _187, _1111);
    float _1121 = _1113 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1123 = _1115 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1125 = _1067 * 6.283185482025146484375;
    float _1127 = cos(_1125);
    float _1129 = _1119 + _577;
    float _1131 = _1121 * _1105;
    float _1133 = _1123 * _1099;
    float _1135 = in.m_59.w;
    float _1137 = _1067 * 6.283185482025146484375;
    float _1139 = sin(_1137);
    float _1141 = _1087 * 6.283185482025146484375;
    float _1143 = cos(_1141);
    float _1145 = _1127 * _1109;
    float _1147 = _1127 * _1091;
    float _1149 = _1087 * 6.283185482025146484375;
    float _1151 = sin(_1149);
    float _1153 = _1139 * _1091;
    float _1155 = _1139 * _1109;
    float _1157 = _1127 * _1143;
    float _1159 = _1091 * _1143;
    float _1161 = _1139 * _1143;
    float _1163 = _1109 * _1143;
    float _1165 = _1157 * _1133;
    float _1167 = fma(_1151, _1145, _1153);
    float _1169 = -_1133;
    float _1171 = _1151 * _1169;
    float _1173 = -_1155;
    float _1175 = fma(_1151, _1147, _1173);
    float _1177 = fma(_1151, _1153, _1145);
    float _1179 = fma(_1167, _1131, _1165);
    float _1181 = -_1147;
    float _1183 = fma(_1151, _1155, _1181);
    float _1185 = _1161 * _1133;
    float _1187 = fma(_1163, _1131, _1171);
    float _1189 = fma(_1175, _1117, _1179);
    float _1191 = _493 * _179;
    float _1193 = fma(_1183, _1131, _1185);
    float _1195 = fma(_1159, _1117, _1187);
    float _1197 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1199 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1201 = fma(_1177, _1117, _1193);
    float _1203 = fma(_491, _177, _1191);
    float _1205 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1197);
    float _1207 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1199);
    float _1209 = in.m_57.w;
    float _1211 = fma(_495, _181, _1203);
    float _1213 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1205);
    float _1215 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1207);
    float _1217 = _493 * _171;
    float _1219 = _1211 + _1135;
    float _1221 = _1213 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1223 = _1215 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1225 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1227 = fma(_491, _169, _1217);
    float _1229 = _1129 + _1221;
    float _1231 = _1219 + _1223;
    float _1233 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1225);
    float _1235 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1237 = _1229 + _1235;
    float _1239 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1241 = _1231 + _1239;
    float _1243 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1233);
    float _1245 = _1237 * _1237;
    float _1247 = _1243 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1249 = fma(_1241, _1241, _1245);
    float _1251 = fma(_495, _173, _1227);
    float _1253 = sqrt(_1249);
    float _1255 = _1251 + _1209;
    float _1257 = _1255 + _1247;
    bool _1259 = _1253 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1263 = _1261 != 0;
    int _1265 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1267 = _1265 != 0;
    int _1269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1271 = _1269 != 0;
    int _1273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1275 = _1273 != 0;
    bool _1277 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1279 = isnan(0.5);
    bool _1281 = _1277 || _1279;
    bool _1283 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1285 = _1281 || _1283;
    bool _1287 = !_1267;
    int _1289 = _1287 ? 0 : 1;
    bool _1291 = !_1263;
    int _1293 = _1291 ? 0 : 1;
    bool _1295 = !_1271;
    int _1297 = _1295 ? 0 : 1;
    bool _1299 = !_1275;
    int _1301 = _1299 ? 0 : 1;
    float _1303 = _1247;
    float _1305 = _1249;
    float _1307 = _1241;
    float _1309 = _1237;
    float _1311 = _1201;
    float _1313 = _1209;
    if (!_1259)
    {
        _501 = _1231;
    }
    float _1315 = _501;
    float _1317 = _1315;
    if (!_1259)
    {
        _247 = _1229;
    }
    float _1319 = _247;
    float _1321 = _1319;
    if (!_1259)
    {
        _1303 = _1257;
    }
    float _1323 = _1303;
    bool _1325 = !_1259;
    float _1327 = _1323;
    if (!_1325)
    {
        float _1329 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1331 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1333 = _1253 + _1331;
        float _1335 = _1257 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1337 = rsqrt(_1249);
        float _1339 = _1333 * _1329;
        float _1341 = _1339 * 0.15915493667125701904296875;
        float _1343 = _1341 * 6.283185482025146484375;
        float _1345 = cos(_1343);
        float _1347 = _1341 * 6.283185482025146484375;
        float _1349 = sin(_1347);
        float _1351 = _1345 + (-1.0);
        float _1353 = _1351 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1355 = fma(_1349, _1335, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1357 = fma(_1257, _1345, _1353);
        float _1359 = _1337 * _1355;
        float _1361 = fma(_1241, _1359, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1363 = fma(_1237, _1359, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1317 = _1361;
        _1327 = _1357;
        _1321 = _1363;
        _1305 = _1337;
    }
    float _1365 = _1317;
    float _1367 = _1327;
    float _1369 = _1321;
    float _1371 = _1305;
    float _1373 = _1371;
    if (_1285)
    {
        _1307 = _1365;
    }
    float _1375 = _1307;
    float _1377 = _1375;
    if (_1285)
    {
        _1309 = _1367;
    }
    float _1379 = _1309;
    float _1381 = _1379;
    if (_1285)
    {
        _1373 = _1369;
    }
    float _1383 = _1373;
    float _1385 = _1383;
    if (!_1285)
    {
        float _1387 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1389 = _1255 + _1387;
        float _1391 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1393 = _1219 + _1391;
        float _1395 = -_1219;
        float _1397 = _1395 + _1365;
        float _1399 = -_1255;
        float _1401 = _1399 + _1367;
        float _1403 = _1389 * _1389;
        float _1405 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1407 = _1129 + _1405;
        float _1409 = -_1129;
        float _1411 = _1409 + _1369;
        float _1413 = fma(_1393, _1393, _1403);
        float _1415 = fma(_1407, _1407, _1413);
        float _1417 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1419 = sqrt(_1415);
        float _1421 = precise::min(_1419, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1423 = _1421 * _1417;
        float _1425 = fma(_1397, _1423, _1219);
        float _1427 = fma(_1401, _1423, _1255);
        float _1429 = fma(_1411, _1423, _1129);
        _1381 = _1427;
        _1377 = _1425;
        _1385 = _1429;
    }
    float _1431 = _1381;
    float _1433 = _1377;
    float _1435 = _1385;
    float _1437 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1439 = _1431 + _1437;
    float _1441 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1443 = _1433 + _1441;
    float _1445 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1447 = _1435 + _1445;
    float _1449 = _1439 * _1439;
    float _1451 = fma(_1443, _1443, _1449);
    float _1453 = fma(_1447, _1447, _1451);
    float _1455 = rsqrt(_1453);
    float _1457 = sqrt(_1453);
    float _1459 = _1455 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1461 = _1443 * _1459;
    float _1463 = _1447 * _1459;
    float _1465 = _1461 * _1461;
    float _1467 = _1463 * _1463;
    float _1469 = _1465 + _1467;
    float _1471 = sqrt(_1469);
    bool _1473 = _1471 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1475 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1477 = _1471 + _1475;
    float _1479 = _1451;
    float _1481 = _1469;
    float _1483 = _1477;
    float _1485 = _1439;
    float _1487 = _1461;
    float _1489 = _1463;
    float _1491 = _1467;
    if (_1473)
    {
        float _1493 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1479 = _1493;
    }
    float _1495 = _1479;
    if (_1473)
    {
        float _1497 = rsqrt(_1469);
        _1481 = _1497;
    }
    float _1499 = _1481;
    if (_1473)
    {
        float _1501 = _1477 * _1495;
        _1483 = _1501;
    }
    float _1503 = _1483;
    if (_1473)
    {
        float _1505 = _1503 * 0.15915493667125701904296875;
        _1311 = _1505;
    }
    float _1507 = _1311;
    float _1509 = _1257;
    if (_1473)
    {
        float _1511 = _1507 * 6.283185482025146484375;
        float _1513 = sin(_1511);
        _1509 = _1513;
    }
    float _1515 = _1509;
    float _1517 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1519 = precise::max(0.0, _1517);
    float _1521 = _1495;
    float _1523 = _1519;
    if (_1473)
    {
        float _1525 = _1507 * 6.283185482025146484375;
        float _1527 = cos(_1525);
        _1521 = _1527;
    }
    float _1529 = _1521;
    float _1531 = -_1459;
    float _1533 = -_1519;
    float _1535 = fma(_1439, _1531, _1533);
    if (_1473)
    {
        float _1537 = _1535 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1485 = _1537;
    }
    float _1539 = _1485;
    float _1541 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1543 = fma(_1457, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1541);
    float _1545 = precise::clamp(_1543, 0.0, 1.0);
    float _1547 = _1515;
    float _1549 = _1539;
    if (_1473)
    {
        float _1551 = fma(_1515, _1539, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1547 = _1551;
    }
    float _1553 = _1547;
    float _1555 = _1553;
    if (!_1473)
    {
        _1549 = _1535;
    }
    float _1557 = _1549;
    float _1559 = -_1545;
    float _1561 = _1559 + 1.0;
    float _1563 = _1557;
    if (_1473)
    {
        float _1565 = _1529 + (-1.0);
        _1523 = _1565;
    }
    float _1567 = _1523;
    float _1569 = _1567;
    if (_1473)
    {
        float _1571 = _1499 * _1553;
        _1313 = _1571;
    }
    float _1573 = _1313;
    float _1575 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1473)
    {
        float _1577 = _1567 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1555 = _1577;
    }
    float _1579 = _1555;
    if (_1473)
    {
        float _1581 = _1461 * _1573;
        _1487 = _1581;
    }
    float _1583 = _1487;
    if (!_1473)
    {
        _1569 = _1465;
    }
    float _1585 = _1569;
    float _1587 = _1585;
    if (_1473)
    {
        float _1589 = _1463 * _1573;
        _1489 = _1589;
    }
    float _1591 = _1489;
    if (_1473)
    {
        float _1593 = fma(_1535, _1529, _1579);
        _1563 = _1593;
    }
    float _1595 = _1563;
    if (_1473)
    {
        float _1597 = _1583 * _1583;
        _1587 = _1597;
    }
    float _1599 = _1587;
    float _1601 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1473)
    {
        float _1603 = _1591 * _1591;
        _1491 = _1603;
    }
    float _1605 = _1491;
    float _1607 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1575);
    float _1609 = fma(_1595, _1595, _1599);
    float _1611 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1601);
    float _1613 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1615 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1607);
    float _1617 = _1609 + _1605;
    float _1619 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1621 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1611);
    float _1623 = _1615 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1625 = abs(_1561);
    float _1627 = log2(_1625);
    float _1629 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1619);
    float _1631 = _1621 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1633 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1635 = _1623 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1637 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1629);
    float _1639 = _1623 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1641 = _1631 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1643 = rsqrt(_1617);
    float _1645 = _1637 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1647 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1633);
    float _1649 = -_1641;
    float _1651 = fma(_1649, _1613, 1.0);
    float _1653 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1639);
    float _1655 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1647);
    float _1657 = _1627 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1659 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1653);
    float _1661 = _1655 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1663 = log2(_1651);
    float _1665 = _1643 * _1583;
    float _1667 = _1643 * _1595;
    float _1669 = _1643 * _1591;
    float _1671 = exp2(_1657);
    float _1673 = _1665 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1675 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1659);
    float _1677 = -_1673;
    float _1679 = fma(_1667, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1677);
    float _1681 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1635);
    float _1683 = 1.0 / _1675;
    float _1685 = -_1669;
    float _1687 = fma(_1685, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1679);
    float _1689 = _1623 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1691 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1681);
    float _1693 = _1663 * 0.693147182464599609375;
    float _1695 = fma(_1687, -0.5, 0.5);
    float _1697 = fma(_1687, 0.5, 0.5);
    float _1699 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1689);
    float _1701 = _1667 + 1.0;
    float _1703 = _1693 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1705 = fma(_1697, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1707 = sqrt(_1695);
    float _1709 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1699);
    float _1711 = fma(_1697, _1705, -0.212114393711090087890625);
    float _1713 = -_1667;
    float _1715 = fma(_1671, _1701, _1713);
    float _1717 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1709);
    float _1719 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1691);
    float _1721 = fma(_1697, _1711, 1.570728778839111328125);
    float _1723 = fma(_1715, 0.5, 0.5);
    float _1725 = _1717 * _1683;
    float _1727 = _1719 * _1683;
    float _1729 = fma(_1725, 0.5, 0.5);
    float _1731 = fma(_1727, -0.5, 0.5);
    float _1733 = _1707 * 0.636619746685028076171875;
    float _1735 = -_1721;
    float _1737 = fma(_1733, _1735, 1.0);
    float3 _5870 = float3(_1729, _1731, _1703);
    float _1739 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5870, float3(0.0), isnan(_5870)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5870, float3(0.0), isnan(_5870)), level(0.0)).x;
    float3 _5881 = float3(_1729, _1731, _1703);
    float4 _1742 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5881, float3(0.0), isnan(_5881)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5881, float3(0.0), isnan(_5881)), level(0.0)).xyzw;
    float _1744 = _1742.x;
    float _1746 = _1742.y;
    float _1748 = _1742.z;
    float _1750 = _1742.w;
    float2 _5898 = float2(_1737, _1723);
    float3 _1754 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5898, float2(0.0), isnan(_5898)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5898, float2(0.0), isnan(_5898)), level(0.0)).xyz;
    float _1756 = _1754.x;
    float _1758 = _1754.y;
    float _1760 = _1754.z;
    float _1762 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1764 = int(_1762);
    int _1766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1768 = _1766 != 0;
    float _1770 = -_959;
    float _1772 = _1770 + 1.0;
    bool _1774 = _161 > 0.5;
    float _1776 = -_773;
    float _1778 = _1776 + 1.0;
    bool _1780 = _149 > 0.5;
    float _1782 = -_955;
    float _1784 = _1782 + 1.0;
    int _1786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1788 = _1786 != 0;
    float _1790 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1792 = int(_1790);
    bool _1794 = _153 > 0.5;
    float _1796 = -_835;
    float _1798 = _1796 + 1.0;
    int _1800 = abs(_745);
    out.m_70.x = _1219;
    out.m_70.y = _1255;
    out.m_70.z = _1129;
    int _1802 = abs(_1293);
    float _1804 = _1627 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1806 = 0.0;
    if (_1768)
    {
        _1806 = _149;
    }
    float _1808 = _1806;
    float _1810 = trunc(_889);
    int _1812 = int(_1810);
    float _1814 = float(uint(_1764));
    out.m_72.x = _1433;
    out.m_72.y = _1431;
    out.m_72.z = _1435;
    float _1816 = _1808;
    float _1818 = _1814;
    if (!_1768)
    {
        _1816 = _153;
    }
    float _1820 = _1816;
    int _1822 = ~_1764;
    int _1824 = _1822 + 1;
    int _1826 = abs(_1297);
    float _1828 = 1.0 / _1814;
    float _1830 = float(uint(_1792));
    float _1832 = _1175 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1834 = 1.0 / _1830;
    float _1836 = trunc(_915);
    int _1838 = int(_1836);
    int _1840 = as_type<int>(_1828) + (-2);
    float _1842 = float(uint(_1812));
    if (_1768)
    {
        _1818 = 1.0;
    }
    float _1844 = _1818;
    float _1846 = _1844;
    if (!_1768)
    {
        _1846 = 1.2345600128173828125;
    }
    float _1848 = _1846;
    float _1850 = as_type<float>(_1840) * _1842;
    int _1852 = as_type<int>(_1834) + (-2);
    float _1854 = exp2(_1804);
    int _1856 = ~_1764;
    int _1858 = _1856 + 1;
    float _1860 = _1848 * _1820;
    int _1862 = ~_1792;
    int _1864 = _1862 + 1;
    float _1866 = float(uint(_1838));
    float _1868 = trunc(_1850);
    float _1870 = precise::max(_1868, 0.0);
    uint _1873 = uint(_1870);
    float _1875 = as_type<float>(_1852) * _1866;
    float _1877 = _1866;
    if (_1768)
    {
        _1877 = 1.0;
    }
    float _1879 = _1877;
    float _1881 = _1879;
    if (!_1768)
    {
        _1881 = 7.345489978790283203125;
    }
    float _1883 = _1881;
    float _1885 = floor(_1860);
    float _1887 = -_1854;
    float _1889 = _1887 + 1.0;
    float _1891 = _1883 * _149;
    float _1893 = float(_1812);
    float _1895 = trunc(_1875);
    float _1897 = precise::max(_1895, 0.0);
    uint _1899 = uint(_1897);
    int _1901 = _1858 * int(_1873);
    int _1903 = _1901 + _1812;
    float _1905 = float(uint(_1903));
    float _1907 = floor(_1891);
    float _1909 = -_1885;
    float _1911 = _1860 + _1909;
    float _1913 = float(_1792);
    float _1915 = as_type<float>(_1840) * _1905;
    int _1917 = _1864 * int(_1899);
    int _1919 = _1917 + _1838;
    float _1921 = trunc(_1915);
    float _1923 = precise::max(_1921, 0.0);
    uint _1925 = uint(_1923);
    float _1927 = float(uint(_1919));
    float _1929 = -_1907;
    float _1931 = _1891 + _1929;
    float _1933 = as_type<float>(_1852) * _1927;
    float _1935 = float(_1764);
    bool _1937 = _1893 >= _1935;
    bool _1939 = isnan(_1893);
    bool _1941 = _1937 || _1939;
    bool _1943 = isnan(_1935);
    bool _1945 = _1941 || _1943;
    float _1947 = float(_1945);
    float _1949 = trunc(_1933);
    float _1951 = precise::max(_1949, 0.0);
    uint _1953 = uint(_1951);
    int _1955 = int(_1873) + int(_1925);
    float _1957 = _1931 * _1935;
    int _1959 = ~_1792;
    int _1961 = _1959 + 1;
    float _1963 = _1911 * _1913;
    float _1965 = float(_1838);
    int _1967 = _1824 * _1955;
    int _1969 = _1967 + _1812;
    float _1971 = trunc(_1947);
    int _1973 = int(_1971);
    float _1975 = _1935 * _869;
    float _1977 = _1913 * _869;
    bool _1979 = uint(_1969) >= uint(_1764);
    int _1981 = int(_1899) + int(_1953);
    float _1983 = trunc(_1957);
    int _1985 = int(_1983);
    bool _1987 = !_1979;
    int _1989 = _1987 ? 0 : (-1);
    int _1991 = _1961 * _1981;
    int _1993 = _1991 + _1838;
    int _1995 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1997 = _1995 != 0;
    float _1999 = trunc(_1963);
    int _2001 = int(_1999);
    bool _2003 = uint(_1993) >= uint(_1792);
    int _2005 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2007 = _2005 != 0;
    bool _2009 = _1965 >= _1913;
    bool _2011 = isnan(_1965);
    bool _2013 = _2009 || _2011;
    bool _2015 = isnan(_1913);
    bool _2017 = _2013 || _2015;
    float _2019 = float(_2017);
    bool _2021 = !_2007;
    int _2023 = _2021 ? 0 : 1;
    float _2025 = trunc(_1975);
    int _2027 = int(_2025);
    int _2029 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2031 = _2029 != 0;
    int _2033 = ~_1955;
    int _2035 = _2033 + _1989;
    int _2037 = _2035 + 1;
    bool _2039 = !_2031;
    int _2041 = _2039 ? 0 : 1;
    bool _2043 = !_2003;
    int _2045 = _2043 ? 0 : (-1);
    float _2047 = trunc(_2019);
    int _2049 = int(_2047);
    int _2051 = abs(_2023);
    int _2053 = _1764 * _2037;
    int _2055 = _2053 + _1812;
    int _2057 = ~_1981;
    int _2059 = _2057 + _2045;
    int _2061 = _2059 + 1;
    int _2063 = abs(_2041);
    int _2065 = _1985 * _2051;
    int _2067 = _2065 + _1812;
    bool _2069 = _1764 == 0;
    int _2071 = _1792 * _2061;
    int _2073 = _2071 + _1838;
    float _2075 = trunc(_1977);
    int _2077 = int(_2075);
    int _2079 = ~_1973;
    int _2081 = _2079 + 1;
    int _2083 = _2081 + 1;
    bool _2085 = !_2069;
    int _2087 = _2085 ? _2055 : (-1);
    int _2089 = _2001 * _2063;
    int _2091 = _2089 + _1838;
    bool _2093 = _1792 == 0;
    int _2095 = ~_2049;
    int _2097 = _2095 + 1;
    int _2099 = _2097 + 1;
    int _2101 = _2087 * _2083;
    bool _2103 = !_2093;
    int _2105 = _2103 ? _2073 : (-1);
    int _2107 = _1764 + (-1);
    int _2109 = _1792 + (-1);
    int _2111 = _2105 * _2099;
    int _2113 = _1973 * _2107;
    int _2115 = _2113 + _2101;
    int _2117 = abs(_751);
    int _2119 = _2049 * _2109;
    int _2121 = _2119 + _2111;
    float _2123 = in.m_53.w;
    int _2125 = abs(_1289);
    int _2127 = _2115 * _1800;
    int _2129 = abs(_757);
    int _2131 = _2121 * _2125;
    float _2133 = float(uint(_2067));
    int _2135 = _2027 * _2117;
    int _2137 = _2135 + _2127;
    int _2139 = _2077 * _1802;
    int _2141 = _2139 + _2131;
    bool _2143 = !_1788;
    int _2145 = _2143 ? 0 : 1;
    float _2147 = as_type<float>(_1840) * _2133;
    int _2149 = _2067 * _2129;
    int _2151 = _2149 + _2137;
    float _2153 = -_339;
    int _2155 = _1780 ? as_type<int>(_2153) : as_type<int>(_339);
    int _2157 = abs(_2145);
    int _2159 = _2091 * _1826;
    int _2161 = _2159 + _2141;
    bool _2163 = !_1997;
    float _2165 = _2163 ? _339 : as_type<float>(_2155);
    float _2167 = trunc(_2147);
    float _2169 = precise::max(_2167, 0.0);
    uint _2171 = uint(_2169);
    int _2173 = abs(_1301);
    int _2175 = _1985 * _2157;
    int _2177 = _2175 + _2151;
    float _2179 = float(uint(_2091));
    float _2181 = _2165 + 0.5;
    bool _2183 = _2123 > 0.5;
    int _2185 = _2001 * _2173;
    int _2187 = _2185 + _2161;
    float _2189 = float(uint(_2177));
    float _2191 = as_type<float>(_1852) * _2179;
    float _2193 = fma(_2181, (*spvDescriptorSet0.vp_c9)._m0[80].x, _937);
    int _2195 = ~_1764;
    int _2197 = _2195 + 1;
    float _2199 = trunc(_2191);
    float _2201 = precise::max(_2199, 0.0);
    uint _2203 = uint(_2201);
    float _2205 = float(uint(_2187));
    float _2207 = as_type<float>(_1840) * _2189;
    float _2209 = -_1772;
    float _2211 = fma(_2165, _2209, _2193);
    int _2213 = ~_1792;
    int _2215 = _2213 + 1;
    float _2217 = as_type<float>(_1852) * _2205;
    int _2219 = ~_1792;
    int _2221 = _2219 + 1;
    float _2223 = trunc(_2207);
    float _2225 = precise::max(_2223, 0.0);
    uint _2227 = uint(_2225);
    int _2229 = _2197 * int(_2171);
    int _2231 = _2229 + _2067;
    int _2233 = ~_1764;
    int _2235 = _2233 + 1;
    int _2237 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2239 = _2237 != 0;
    float _2241 = float(uint(_2231));
    float _2243 = trunc(_2217);
    float _2245 = precise::max(_2243, 0.0);
    uint _2247 = uint(_2245);
    int _2249 = _2215 * int(_2203);
    int _2251 = _2249 + _2091;
    float _2253 = -_361;
    int _2255 = _1794 ? as_type<int>(_2253) : as_type<int>(_361);
    float _2257 = as_type<float>(_1840) * _2241;
    float _2259 = -_339;
    int _2261 = _1774 ? as_type<int>(_2259) : as_type<int>(_339);
    float _2263 = float(uint(_2251));
    int _2265 = _2235 * int(_2227);
    int _2267 = _2265 + _2177;
    int _2269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2271 = _2269 != 0;
    float _2273 = trunc(_2257);
    float _2275 = precise::max(_2273, 0.0);
    uint _2277 = uint(_2275);
    int _2279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2281 = _2279 != 0;
    float _2283 = as_type<float>(_1852) * _2263;
    float _2285 = float(uint(_2267));
    float _2287 = -_361;
    int _2289 = _2183 ? as_type<int>(_2287) : as_type<int>(_361);
    int _2291 = _2221 * int(_2247);
    int _2293 = _2291 + _2187;
    bool _2295 = !_2239;
    float _2297 = _2295 ? _339 : as_type<float>(_2261);
    float _2299 = as_type<float>(_1840) * _2285;
    bool _2301 = !_2271;
    float _2303 = _2301 ? _361 : as_type<float>(_2255);
    float _2305 = trunc(_2283);
    float _2307 = precise::max(_2305, 0.0);
    uint _2309 = uint(_2307);
    float _2311 = float(uint(_2293));
    float _2313 = _2297 + 0.5;
    bool _2315 = !_2281;
    float _2317 = _2315 ? _361 : as_type<float>(_2289);
    float _2319 = _2303 + (-0.5);
    int _2321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2323 = _2321 != 0;
    float _2325 = as_type<float>(_1852) * _2311;
    float _2327 = fma(_2313, (*spvDescriptorSet0.vp_c9)._m0[85].x, _841);
    float _2329 = trunc(_2299);
    float _2331 = precise::max(_2329, 0.0);
    uint _2333 = uint(_2331);
    float _2335 = _2317 + (-0.5);
    float _2337 = -_2319;
    float _2339 = -_747;
    float _2341 = fma(_2337, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2339);
    float _2343 = -_1778;
    float _2345 = fma(_2297, _2343, _2327);
    int _2347 = ~_1792;
    int _2349 = _2347 + 1;
    float _2351 = -_2335;
    float _2353 = -_957;
    float _2355 = fma(_2351, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2353);
    float _2357 = fma(_2303, _1784, _2341);
    float _2359 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2361 = trunc(_2325);
    float _2363 = precise::max(_2361, 0.0);
    uint _2365 = uint(_2363);
    float _2367 = fma(_2317, _1798, _2355);
    int _2369 = ~_1764;
    int _2371 = _2369 + 1;
    float _2373 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2377 = _2375 != 0;
    float _2379 = -_1151;
    float _2381 = fma(_2379, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2359);
    out.m_74.x = _2211;
    out.m_74.y = _2357;
    out.m_74.z = _2345;
    out.m_74.w = _2367;
    float _2383 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2385 = int(_2227) + int(_2333);
    int _2387 = int(_2203) + int(_2309);
    float _2389 = -_1151;
    float _2391 = fma(_2389, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2373);
    int _2393 = int(_2171) + int(_2277);
    float _2395 = -_1151;
    float _2397 = fma(_2395, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2383);
    float _2399 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2401 = int(_2247) + int(_2365);
    int _2403 = _2349 * _2387;
    int _2405 = _2403 + _2091;
    float _2407 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2391);
    float _2409 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2399);
    int _2411 = _2371 * _2385;
    int _2413 = _2411 + _2177;
    float _2415 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2381);
    int _2417 = _2349 * _2401;
    int _2419 = _2417 + _2187;
    float _2421 = _1175 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2423 = uint(_2405) >= uint(_1792);
    float _2425 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2427 = uint(_2413) >= uint(_1764);
    float _2429 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2431 = uint(_2419) >= uint(_1792);
    float _2433 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2397);
    bool _2435 = !_2427;
    int _2437 = _2435 ? 0 : (-1);
    float _2439 = _361 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2441 = !_2431;
    int _2443 = _2441 ? 0 : (-1);
    float _2445 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2425);
    int _2447 = ~_2385;
    int _2449 = _2447 + _2437;
    int _2451 = _2449 + 1;
    float _2453 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2429);
    int _2455 = ~_2401;
    int _2457 = _2455 + _2443;
    int _2459 = _2457 + 1;
    float _2461 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1832);
    float _2463 = _1175 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2465 = _1764 * _2451;
    int _2467 = _2465 + _2177;
    int _2469 = ~_1764;
    int _2471 = _2469 + 1;
    int _2473 = _1792 * _2459;
    int _2475 = _2473 + _2187;
    float _2477 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2463);
    float _2479 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2421);
    bool _2481 = !_2069;
    int _2483 = _2481 ? _2467 : (-1);
    float _2485 = _339 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2487 = !_2093;
    int _2489 = _2487 ? _2475 : (-1);
    float _2491 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2477);
    int _2493 = _2483 >> 31;
    int _2495 = _2471 * _2393;
    int _2497 = _2495 + _2067;
    int _2499 = _2489 >> 31;
    float _2501 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2461);
    int _2503 = _2493 & 3;
    float _2505 = fma(_1183, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2453);
    int _2507 = _2499 & 3;
    float _2509 = _2439 * _2415;
    int _2511 = _2483 + _2503;
    float _2513 = _2439 * _2407;
    int _2515 = _2489 + _2507;
    float _2517 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2479);
    int _2519 = _2511 >> 2;
    int _2521 = _2483 & 3;
    bool _2523 = _2521 != 0;
    int _2525 = _2515 >> 2;
    int _2527 = _2519 << 4;
    int _2529 = _2527 + 368;
    bool _2531 = uint(_2497) >= uint(_1764);
    float _2533 = fma(_1183, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2445);
    int _2535 = _2523 ? 0 : 1;
    uint _2537 = uint(int(uint(_2529) >> uint(2)));
    uint _2539 = uint(int(uint(int(_2537)) >> uint(2)));
    int _2541 = int(_2537) & 3;
    float _2543 = (*spvDescriptorSet0.vp_c9)._m0[int(_2539)][_2541];
    int _2545 = int(_2537) + 1;
    uint _2547 = uint(int(uint(_2545) >> uint(2)));
    int _2549 = _2545 & 3;
    float _2551 = (*spvDescriptorSet0.vp_c9)._m0[int(_2547)][_2549];
    int _2553 = _2483 & 3;
    bool _2555 = _2553 != 0;
    float _2557 = fma(_1183, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2409);
    int _2559 = _2525 << 4;
    int _2561 = _2559 + 512;
    float _2563 = fma(_2485, _2533, _2513);
    bool _2565 = !_2531;
    int _2567 = _2565 ? 0 : (-1);
    float _2569 = fma(_2485, _2557, _2509);
    bool _2571 = uint(_2553) >= 2u;
    uint _2573 = uint(int(uint(_2561) >> uint(2)));
    uint _2575 = uint(int(uint(int(_2573)) >> uint(2)));
    int _2577 = int(_2573) & 3;
    float _2579 = (*spvDescriptorSet0.vp_c9)._m0[int(_2575)][_2577];
    int _2581 = int(_2573) + 1;
    uint _2583 = uint(int(uint(_2581) >> uint(2)));
    int _2585 = _2581 & 3;
    float _2587 = (*spvDescriptorSet0.vp_c9)._m0[int(_2583)][_2585];
    bool _2589 = !_2423;
    int _2591 = _2589 ? 0 : (-1);
    out.m_76.x = _2533;
    out.m_76.y = _2557;
    out.m_76.z = _2505;
    bool _2593 = uint(_2553) > 1u;
    int _2595 = _2571 ? 0 : 1;
    bool _2597 = _2553 != 3;
    int _2599 = ~_2393;
    int _2601 = _2599 + _2567;
    int _2603 = _2601 + 1;
    int _2605 = _2529 + 8;
    uint _2607 = uint(int(uint(_2605) >> uint(2)));
    uint _2609 = uint(int(uint(int(_2607)) >> uint(2)));
    int _2611 = int(_2607) & 3;
    float _2613 = (*spvDescriptorSet0.vp_c9)._m0[int(_2609)][_2611];
    int _2615 = int(_2607) + 1;
    uint _2617 = uint(int(uint(_2615) >> uint(2)));
    int _2619 = _2615 & 3;
    float _2621 = (*spvDescriptorSet0.vp_c9)._m0[int(_2617)][_2619];
    int _2623 = ~_2535;
    int _2625 = _2623 + 1;
    int _2627 = _2625 + 1;
    float _2629 = _1623 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2631 = ~_2595;
    int _2633 = _2631 + 1;
    int _2635 = _2633 + 1;
    int _2637 = _1764 * _2603;
    int _2639 = _2637 + _2067;
    int _2641 = _2627;
    int _2643 = _2635;
    if (!_2593)
    {
        int _2645 = ~_2535;
        int _2647 = _2645 + 1;
        _2641 = _2647;
    }
    int _2649 = _2641;
    float _2651 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2629);
    int _2653 = _2489 & 3;
    bool _2655 = _2653 != 0;
    int _2657 = _2561 + 8;
    uint _2659 = uint(int(uint(_2657) >> uint(2)));
    uint _2661 = uint(int(uint(int(_2659)) >> uint(2)));
    int _2663 = int(_2659) & 3;
    float _2665 = (*spvDescriptorSet0.vp_c9)._m0[int(_2661)][_2663];
    int _2667 = int(_2659) + 1;
    uint _2669 = uint(int(uint(_2667) >> uint(2)));
    int _2671 = _2667 & 3;
    float _2673 = (*spvDescriptorSet0.vp_c9)._m0[int(_2669)][_2671];
    if (_2597)
    {
        int _2675 = ~_2595;
        int _2677 = _2675 + 1;
        _2643 = _2677;
    }
    int _2679 = _2643;
    float _2681 = _2439 * _2433;
    bool _2683 = uint(_2653) > 1u;
    float _2685 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2651);
    int _2687 = ~_2387;
    int _2689 = _2687 + _2591;
    int _2691 = _2689 + 1;
    float _2693 = fma(_2485, _2505, _2681);
    bool _2695 = !_2555;
    int _2697 = _2695 ? 0 : 1;
    float _2699 = fma(_2439, _2439, 1.0);
    int _2701 = _2489 & 3;
    bool _2703 = _2701 != 0;
    int _2705 = _1792 * _2691;
    int _2707 = _2705 + _2091;
    bool _2709 = !_2655;
    int _2711 = _2709 ? 0 : 1;
    int _2713 = _2703 ? 0 : 1;
    int _2715 = abs(_2697);
    int _2717 = ~_2713;
    int _2719 = _2717 + 1;
    int _2721 = _2719 + 1;
    int _2723 = _2721;
    if (!_2683)
    {
        int _2725 = ~_2713;
        int _2727 = _2725 + 1;
        _2723 = _2727;
    }
    int _2729 = _2723;
    int _2731 = abs(_2649);
    int _2733 = abs(_2729);
    bool _2735 = _2653 != 3;
    int _2737 = ~_2731;
    int _2739 = _2737 + 1;
    int _2741 = _2739 + 1;
    int _2743 = abs(_2711);
    int _2745 = _2741 * as_type<int>(_2551);
    bool _2747 = uint(_2653) >= 2u;
    int _2749 = abs(_2679);
    int _2751 = ~_2733;
    int _2753 = _2751 + 1;
    int _2755 = _2753 + 1;
    int _2757 = ~_2715;
    int _2759 = _2757 + 1;
    int _2761 = _2759 + 1;
    int _2763 = _2755 * as_type<int>(_2587);
    bool _2765 = _2553 != 3;
    int _2767 = _2747 ? 0 : 1;
    int _2769 = _2761 * as_type<int>(_2543);
    int _2771 = _2769 + _2745;
    int _2773 = ~_2743;
    int _2775 = _2773 + 1;
    int _2777 = _2775 + 1;
    int _2779 = ~_2749;
    int _2781 = _2779 + 1;
    int _2783 = _2781 + 1;
    int _2785 = ~_2767;
    int _2787 = _2785 + 1;
    int _2789 = _2787 + 1;
    int _2791 = _2777 * as_type<int>(_2579);
    int _2793 = _2791 + _2763;
    int _2795 = _2789;
    if (_2735)
    {
        int _2797 = ~_2767;
        int _2799 = _2797 + 1;
        _2795 = _2799;
    }
    int _2801 = _2795;
    int _2803 = _2783 * as_type<int>(_2613);
    int _2805 = _2803 + _2771;
    bool _2807 = !_2323;
    int _2809 = _2807 ? 0 : 1;
    float _2811 = rsqrt(_2699);
    bool _2813 = !_2765;
    int _2815 = _2813 ? 0 : (-1);
    int _2817 = abs(_2801);
    int _2819 = abs(_2809);
    int _2821 = abs(_2815);
    float _2823 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2685);
    int _2825 = ~_2821;
    int _2827 = _2825 + 1;
    int _2829 = _2827 + 1;
    int _2831 = ~_2817;
    int _2833 = _2831 + 1;
    int _2835 = _2833 + 1;
    bool _2837 = _2653 != 3;
    int _2839 = _2829 * as_type<int>(_2621);
    int _2841 = _2839 + _2805;
    bool _2843 = !_2069;
    int _2845 = _2843 ? _2639 : (-1);
    int _2847 = _2835 * as_type<int>(_2665);
    int _2849 = _2847 + _2793;
    int _2851 = ~_2819;
    int _2853 = _2851 + 1;
    int _2855 = _2853 + 1;
    float _2857 = _2439 * _2811;
    bool _2859 = !_2837;
    int _2861 = _2859 ? 0 : (-1);
    float _2863 = _2501 + _2569;
    bool _2865 = !_2377;
    int _2867 = _2865 ? 0 : 1;
    int _2869 = _2841 * _2855;
    int _2871 = abs(_2861);
    float _2873 = _2491 + _2563;
    int _2875 = abs(_2867);
    int _2877 = _2845 * _2819;
    int _2879 = _2877 + _2869;
    float _2881 = -_2491;
    float _2883 = _2857 * _2881;
    float _2885 = -_2501;
    float _2887 = _2857 * _2885;
    int _2889 = ~_2871;
    int _2891 = _2889 + 1;
    int _2893 = _2891 + 1;
    out.gl_Position.x = _1717;
    out.gl_Position.y = _1719;
    out.gl_Position.z = _2823;
    out.gl_Position.w = _1675;
    float _2895 = fma(_2811, _2407, _2883);
    float _2897 = fma(_2811, _2415, _2887);
    float _2899 = _1675 * 0.5;
    int _2901 = _2893 * as_type<int>(_2673);
    int _2903 = _2901 + _2849;
    int _2905 = ~_2875;
    int _2907 = _2905 + 1;
    int _2909 = _2907 + 1;
    float _2911 = _2823 + _1675;
    float _2913 = fma(_1719, -0.5, _2899);
    float _2915 = _1889 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2917 = !_2093;
    int _2919 = _2917 ? _2707 : (-1);
    int _2921 = _2903 * _2909;
    float _2923 = _1717 + _1675;
    float _2925 = _2915 * _1739;
    float _2927 = -_2915;
    float _2929 = _2927 + 1.0;
    int _2931 = _2919 * _2875;
    int _2933 = _2931 + _2921;
    float _2935 = _1750 * _2925;
    float _2937 = _1760 * _2925;
    float _2939 = _2911 * 0.5;
    float _2941 = _2923 * 0.5;
    float _2943 = float(_2879);
    float _2945 = _2517 + _2693;
    float _2947 = float(_2933);
    float _2949 = fma(_1756, _2935, _1744);
    float _2951 = fma(_1758, _2935, _1746);
    float _2953 = _1750 * _2929;
    float _2955 = fma(_1750, _2937, _1748);
    out.m_78.x = _2941;
    out.m_78.y = _2913;
    out.m_78.z = _2939;
    out.m_78.w = _1675;
    bool _2957 = _1457 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2959 = isnan(_1457);
    bool _2961 = _2957 || _2959;
    bool _2963 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2965 = _2961 || _2963;
    float _2967 = -_2517;
    float _2969 = _2857 * _2967;
    out.m_80.x = _2943;
    out.m_80.y = _2947;
    float _2971 = fma(_2811, _2433, _2969);
    out.m_82.x = _2949;
    out.m_82.y = _2951;
    out.m_82.z = _2955;
    out.m_82.w = _2953;
    out.m_84.x = _2873;
    out.m_84.y = _2863;
    out.m_84.z = _2945;
    float _2973 = as_type<float>(_2933);
    float _2975 = _2935;
    float _2977 = _2929;
    float _2979 = _2971;
    float _2981 = _2897;
    float _2983 = _2895;
    if (!_2965)
    {
        _2973 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2985 = _2973;
    out.m_86.x = _2895;
    out.m_86.y = _2897;
    out.m_86.z = _2971;
    float _2987 = _2985;
    float _2989 = _2985;
    if (!_2965)
    {
        _2975 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2991 = _2975;
    float _2993 = _2991;
    float _2995 = _2991;
    if (!_2965)
    {
        _2977 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2997 = _2977;
    float _2999 = _2997;
    float _3001 = _2997;
    if (!_2965)
    {
        _2979 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3003 = _2979;
    float _3005 = _3003;
    float _3007 = _3003;
    if (!_2965)
    {
        _2981 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3009 = _2981;
    float _3011 = _3009;
    float _3013 = _3009;
    if (!_2965)
    {
        _2983 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3015 = _2983;
    bool _3017 = !_2965;
    float _3019 = _3015;
    float _3021 = _3015;
    if (!_3017)
    {
        bool _3023 = _1457 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3025 = isnan(_1457);
        bool _3027 = _3023 || _3025;
        bool _3029 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3031 = _3027 || _3029;
        if (!_3031)
        {
            float _3033 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3035 = _1457 + _3033;
            float _3037 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3039 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3037;
            float _3041 = 1.0 / _3039;
            float _3043 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3045 = _3043 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3047 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3049 = _3047 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3051 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3053 = _3051 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3055 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3057 = _3055 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3059 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3061 = _3059 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3063 = _3035 * _3041;
            float _3065 = precise::clamp(_3063, 0.0, 1.0);
            float _3067 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3069 = _3067 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3071 = fma(_3065, _3045, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3073 = fma(_3065, _3069, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3075 = fma(_3065, _3049, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3077 = fma(_3065, _3053, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3079 = fma(_3065, _3057, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3081 = fma(_3065, _3061, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3007 = _3073;
            _2995 = _3079;
            _2989 = _3071;
            _3021 = _3077;
            _3013 = _3075;
            _3001 = _3081;
            _3083 = true;
        }
        else
        {
            bool _3085 = _1457 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3087 = isnan(_1457);
            bool _3089 = _3085 || _3087;
            bool _3091 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3093 = _3089 || _3091;
            if (!_3093)
            {
                _2987 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3095 = _2987;
            _2989 = _3095;
            if (!_3093)
            {
                _3005 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3097 = _3005;
            _3007 = _3097;
            if (!_3093)
            {
                _3011 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3099 = _3011;
            _3013 = _3099;
            if (!_3093)
            {
                _3019 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3101 = _3019;
            _3021 = _3101;
            if (!_3093)
            {
                _2993 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3103 = _2993;
            _2995 = _3103;
            if (!_3093)
            {
                _2999 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3105 = _2999;
            bool _3107 = !_3093;
            _3001 = _3105;
            if (!_3107)
            {
                bool _3109 = _1457 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3111 = isnan(_1457);
                bool _3113 = _3109 || _3111;
                bool _3115 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3117 = _3113 || _3115;
                if (!_3117)
                {
                    float _3119 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3121 = _1457 + _3119;
                    float _3123 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3125 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3123;
                    float _3127 = 1.0 / _3125;
                    float _3129 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3131 = _3129 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3133 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3135 = _3133 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3137 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3139 = _3137 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3141 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3143 = _3141 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3145 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3147 = _3145 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3149 = _3121 * _3127;
                    float _3151 = precise::clamp(_3149, 0.0, 1.0);
                    float _3153 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3155 = _3153 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3157 = fma(_3151, _3131, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3159 = fma(_3151, _3155, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3161 = fma(_3151, _3135, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3163 = fma(_3151, _3139, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3165 = fma(_3151, _3143, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3167 = fma(_3151, _3147, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3007 = _3159;
                    _2995 = _3165;
                    _2989 = _3157;
                    _3021 = _3163;
                    _3013 = _3161;
                    _3001 = _3167;
                    _3083 = true;
                }
                else
                {
                    _3007 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2995 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2989 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3021 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3013 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3001 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3083 = false;
    float _3169 = _3007;
    float _3171 = _2995;
    float _3173 = _2989;
    float _3175 = _3021;
    float _3177 = _3013;
    float _3179 = _3001;
    float _3181 = fma(_2863, -0.5, 0.5);
    float _3183 = precise::clamp(_3181, 0.0, 1.0);
    float _3185 = -_3169;
    float _3187 = _3185 + _3171;
    float _3189 = -_3173;
    float _3191 = _3189 + _3175;
    float _3193 = -_3177;
    float _3195 = _3193 + _3179;
    bool _3197 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3199 = fma(_3183, _3187, _3169);
    float _3201 = fma(_3183, _3191, _3173);
    float _3203 = fma(_3183, _3195, _3177);
    float _3205 = _3199 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _3207 = fma(_3201, 0.298911988735198974609375, _3205);
    float _3209 = fma(_3203, 0.114477999508380889892578125, _3207);
    out.m_88.x = 0.0;
    float _3211 = -_3209;
    float _3213 = _3201 + _3211;
    float _3215 = -_3209;
    float _3217 = _3199 + _3215;
    float _3219 = -_3209;
    float _3221 = _3203 + _3219;
    float _3223 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3225 = fma(_3213, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3209);
    float _3227 = fma(_3217, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3209);
    float _3229 = fma(_3221, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3209);
    out.m_90.w = _3223;
    out.m_92.x = _3225;
    out.m_92.y = _3227;
    out.m_92.z = _3229;
    if (!_3197)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3231 = -_1431;
    float _3233 = _3231 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3235 = -_1433;
    float _3237 = _3235 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3239 = -_1435;
    float _3241 = _3239 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3243 = _3233 * _3233;
    float _3245 = fma(_3237, _3237, _3243);
    float _3247 = fma(_3241, _3241, _3245);
    float _3249 = sqrt(_3247);
    float _3251 = rsqrt(_3247);
    float _3253 = -_3249;
    float _3255 = _3253 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3257 = _3255 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3259 = precise::clamp(_3257, 0.0, 1.0);
    float _3261 = _3237 * _3251;
    float _3263 = _3233 * _3251;
    float _3265 = abs(_3259);
    float _3267 = log2(_3265);
    float _3269 = _3241 * _3251;
    float _3271 = _3261 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3273 = _2863 * _3263;
    float _3275 = -_3263;
    float _3277 = -_3271;
    float _3279 = fma(_3275, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3277);
    float _3281 = fma(_2873, _3261, _3273);
    float _3283 = -_3269;
    float _3285 = fma(_3283, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3279);
    float _3287 = fma(_2945, _3269, _3281);
    float _3289 = precise::clamp(_3287, 0.0, 1.0);
    float _3291 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3293 = _3285 + _3291;
    float _3295 = _3267 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3297 = _3293 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3299 = precise::clamp(_3297, 0.0, 1.0);
    float _3301 = exp2(_3295);
    float _3303 = _3301 * _3299;
    float _3305 = _3289 * _3303;
    float _3307 = _3305 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3309 = _3305 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3311 = _3305 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_88.x = _3307;
    out.m_88.y = _3309;
    out.m_88.z = _3311;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3083 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_44.w;
    float _108 = in.m_46.w;
    float _110 = trunc(_106);
    int _113 = int(_110);
    float _115 = -_108;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _117;
    bool _121 = _113 >= 1;
    float _123 = 0.0;
    float _125 = _108;
    float _127 = _117;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _123;
    if (!_121)
    {
        out.m_51.x = 0.0;
    }
    int _131 = 0;
    if (!_121)
    {
        float _133 = _129 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3379 = as_type<float>(_135);
        out.gl_Position.z = _3379;
    }
    if (!_121)
    {
        return out;
    }
    bool _139 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_108);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = in.m_53.x;
    float _151 = float(_113);
    float _153 = in.m_53.y;
    bool _155 = _117 >= _151;
    bool _157 = !_147;
    bool _159 = _155 || _157;
    float _161 = in.m_53.z;
    if (_159)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _125;
    if (_159)
    {
        out.m_51.x = 0.0;
    }
    if (_159)
    {
        float _165 = _163 * 5.0;
        _137 = as_type<int>(_165);
    }
    int _167 = _137;
    out.m_55.x = _149;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3442 = as_type<float>(_167);
        out.gl_Position.z = _3442;
    }
    out.m_55.y = _153;
    out.m_55.z = _161;
    if (_159)
    {
        return out;
    }
    float _169 = in.m_57.x;
    float _171 = in.m_57.y;
    float _173 = in.m_57.z;
    float _175 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _177 = in.m_59.x;
    float _179 = in.m_59.y;
    float _181 = in.m_59.z;
    float _183 = in.m_61.x;
    float _185 = in.m_61.y;
    float _187 = in.m_61.z;
    float _189 = as_type<float>(int(gl_VertexIndex));
    float _191 = in.m_66.w;
    float _193 = in.m_46.x;
    float _195 = in.m_46.y;
    float _197 = in.m_46.z;
    float _199 = _171 * _171;
    float _201 = _169 * _169;
    float _203 = _173 * _173;
    float _205 = fma(_179, _179, _199);
    float _207 = fma(_177, _177, _201);
    float _209 = fma(_181, _181, _203);
    float _211 = fma(_185, _185, _205);
    float _213 = fma(_183, _183, _207);
    float _215 = fma(_187, _187, _209);
    float _217 = sqrt(_211);
    float _219 = sqrt(_213);
    bool _221 = _217 > 0.0;
    float _223 = sqrt(_215);
    bool _225 = _219 > 0.0;
    float _227 = in.m_44.x;
    float _229 = in.m_44.y;
    float _231 = in.m_44.z;
    int _233 = as_type<int>(_189) & 1;
    bool _235 = _233 != 0;
    int _237 = as_type<int>(_189) & 2;
    bool _239 = _237 != 0;
    float _241 = _217;
    float _243 = _215;
    float _245 = _189;
    float _247 = _171;
    if (_221)
    {
        float _249 = rsqrt(_211);
        _241 = _249;
    }
    float _251 = _241;
    bool _253 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _257 = _253 || _255;
    bool _259 = isnan(1.0);
    bool _261 = _257 || _259;
    float _263 = 0.0;
    if (!_221)
    {
        _263 = 0.0;
    }
    float _265 = _263;
    bool _267 = _223 > 0.0;
    float _269 = 0.0;
    float _271 = _265;
    if (!_221)
    {
        _269 = 0.0;
    }
    float _273 = _269;
    float _275 = _213;
    float _277 = _273;
    if (_225)
    {
        float _279 = rsqrt(_213);
        _275 = _279;
    }
    float _281 = _275;
    float _283 = 0.0;
    if (!_221)
    {
        _283 = 0.0;
    }
    float _285 = _283;
    float _287 = 0.0;
    float _289 = _285;
    if (!_225)
    {
        _287 = 0.0;
    }
    float _291 = _287;
    float _293 = 0.0;
    float _295 = _291;
    if (!_225)
    {
        _293 = 0.0;
    }
    float _297 = _293;
    float _299 = _251;
    float _301 = _297;
    if (_221)
    {
        float _303 = _251 * _179;
        _271 = _303;
    }
    float _305 = _271;
    if (_221)
    {
        float _307 = _251 * _171;
        _277 = _307;
    }
    float _309 = _277;
    if (_221)
    {
        float _311 = _251 * _185;
        _289 = _311;
    }
    float _313 = _289;
    float _315 = _313;
    if (!_261)
    {
        float _317 = _175 * _175;
        float _319 = _317 * 0.5;
        _299 = _319;
    }
    float _321 = _299;
    float _323 = 0.0;
    float _325 = _321;
    if (!_225)
    {
        _323 = 0.0;
    }
    float _327 = _323;
    float _329 = 0.0;
    float _331 = _327;
    if (_267)
    {
        float _333 = rsqrt(_215);
        _329 = _333;
    }
    float _335 = _329;
    bool _337 = !_235;
    float _339 = _337 ? (-0.5) : 0.5;
    if (!_261)
    {
        float _341 = _321 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _325 = _341;
    }
    float _343 = _325;
    float _345 = _343;
    if (_225)
    {
        float _347 = _281 * _177;
        _295 = _347;
    }
    float _349 = _295;
    if (_225)
    {
        float _351 = _281 * _169;
        _301 = _351;
    }
    float _353 = _301;
    if (_225)
    {
        float _355 = _281 * _183;
        _331 = _355;
    }
    float _357 = _331;
    bool _359 = !_239;
    float _361 = _359 ? (-0.5) : 0.5;
    if (!_267)
    {
        _243 = 0.0;
    }
    float _363 = _243;
    bool _365 = !_261;
    float _367 = _363;
    if (!_365)
    {
        float _369 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _371 = log2(_369);
        float _373 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _375 = _373 + 1.0;
        float _377 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _379 = _175 * _371;
        float _381 = 1.0 / _375;
        float _383 = _377 * 0.693147182464599609375;
        float _385 = exp2(_379);
        float _387 = 1.0 / _383;
        float _389 = _385 + (-1.0);
        float _391 = -_389;
        float _393 = fma(_391, _387, _175);
        float _395 = _393 * _381;
        float _397 = _395 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _345 = _397;
        _245 = _383;
    }
    float _399 = _345;
    float _401 = _245;
    float _403 = _399 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _405 = 1.0 / _151;
    float _407 = _401;
    if (_267)
    {
        float _409 = _335 * _173;
        _367 = _409;
    }
    float _411 = _367;
    float _413 = _399 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _415 = _403 * _309;
    float _417 = _403 * _353;
    float _419 = _411;
    if (!_267)
    {
        _407 = 0.0;
    }
    float _421 = _407;
    float _423 = _403 * _411;
    float _425 = _421;
    if (_267)
    {
        float _427 = _335 * _181;
        _425 = _427;
    }
    float _429 = _425;
    float _431 = _399 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _433 = fma(_413, _305, _415);
    float _435 = fma(_413, _349, _417);
    if (!_267)
    {
        _419 = 0.0;
    }
    float _437 = _419;
    float _439 = fma(_413, _429, _423);
    float _441 = fma(_431, _313, _433);
    float _443 = _437;
    if (_267)
    {
        float _445 = _335 * _187;
        _443 = _445;
    }
    float _447 = _443;
    float _449 = fma(_431, _357, _435);
    if (!_261)
    {
        _315 = _175;
    }
    float _451 = _315;
    bool _453 = !_261;
    float _455 = _451;
    if (!_453)
    {
        float _457 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _459 = log2(_457);
        float _461 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _463 = _461 + 1.0;
        float _465 = 1.0 / _463;
        float _467 = _175 * _459;
        float _469 = exp2(_467);
        float _471 = -_469;
        float _473 = _471 + 1.0;
        float _475 = _473 * _465;
        _455 = _475;
    }
    float _477 = _455;
    bool _479 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _481 = fma(_431, _447, _439);
    float _483 = fma(_477, _193, _449);
    float _485 = fma(_477, _195, _441);
    float _487 = _117 * _405;
    float _489 = fma(_477, _197, _481);
    float _491 = fma(_483, _191, _227);
    float _493 = fma(_485, _191, _229);
    float _495 = fma(_489, _191, _231);
    bool _497 = !_479;
    float _499 = _487;
    float _501 = _491;
    if (!_497)
    {
        float _503 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _505 = _149 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _507 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _509 = _507 * _503;
        float _511 = floor(_509);
        float _513 = -_511;
        float _515 = _509 + _513;
        _499 = _515;
    }
    float _517 = _499;
    float _519 = _149 * 2.0;
    float _521 = _149 + _153;
    float _523 = floor(_519);
    float _525 = _521 + (-1.0);
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _529 = _527 != 0;
    float _531 = _161 * 2.0;
    float _533 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _535 = _149 + _161;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _537;
    float _541 = floor(_531);
    float _543 = _535 + (-1.0);
    float _545 = _153 * 2.0;
    float _547 = _149 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _549 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _551 = _523 >= 0.0;
    bool _553 = isnan(_523);
    bool _555 = _551 || _553;
    bool _557 = isnan(0.0);
    bool _559 = _555 || _557;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _563 = _517 + _561;
    float _565 = 1.0 / _539;
    int _567 = as_type<int>(_543);
    if (_529)
    {
        _567 = 0;
    }
    int _569 = _567;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _573 = _569;
    if (!_529)
    {
        _573 = 1;
    }
    int _575 = _573;
    float _577 = in.m_61.w;
    float _579 = -_571;
    float _581 = fma(_547, 2.0, _579);
    float _583 = floor(_545);
    float _585 = _153 + _161;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _591 = _589 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _593 = _541 > 0.0;
    float _595 = _585 + (-1.0);
    bool _597 = _541 >= 0.0;
    bool _599 = isnan(_541);
    bool _601 = _597 || _599;
    bool _603 = isnan(0.0);
    bool _605 = _601 || _603;
    float _607 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _611 = _517 + _609;
    float _613 = _153 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _615 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _617 = int(_615);
    float _619 = _611 * _565;
    int _621 = _559 ? 0 : 1;
    float _623 = fma(_613, -2.0, _587);
    bool _625 = _575 != 1;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _627;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _631;
    float _635 = 1.0 / _591;
    bool _637 = _523 > 0.0;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _639;
    bool _643 = _583 > 0.0;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _647 = _583 >= 0.0;
    bool _649 = isnan(_583);
    bool _651 = _647 || _649;
    bool _653 = isnan(0.0);
    bool _655 = _651 || _653;
    float _657 = fma(_629, _619, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _659 = _605 ? 0 : 1;
    float _661 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _663 = int(_661);
    float _665 = as_type<float>(_575);
    float _667 = as_type<float>(_663);
    if (!_625)
    {
        _665 = _153;
    }
    float _669 = _665;
    float _671 = fma(_633, _619, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _673 = _669;
    if (_625)
    {
        _673 = _149;
    }
    float _675 = _673;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _679 = _517 + _677;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _685 = ~_659;
    int _687 = _685 + 1;
    int _689 = _687 + 1;
    float _691 = 1.0 / _641;
    float _693 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[83].z, _645);
    float _695 = _675;
    int _697 = _689;
    if (!_625)
    {
        _695 = _153;
    }
    float _699 = _695;
    float _701 = _679 * _635;
    float _703 = _699;
    if (!_593)
    {
        int _705 = ~_659;
        int _707 = _705 + 1;
        _697 = _707;
    }
    int _709 = _697;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _713 = _711 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    if (_625)
    {
        _703 = _149;
    }
    float _715 = _703;
    float _717 = fma(_683, _701, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _721 = _719 != 0;
    int _723 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _725 = _723 != 0;
    int _727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _729 = _727 != 0;
    float _731 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _733 = log2(_731);
    float _735 = float(_617);
    float _737 = _715 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _739 = _655 ? 0 : 1;
    float _741 = fma(_713, _701, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _743 = !_725;
    int _745 = _743 ? 0 : 1;
    float _747 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _623);
    bool _749 = !_721;
    int _751 = _749 ? 0 : 1;
    float _753 = _563 * _691;
    bool _755 = !_729;
    int _757 = _755 ? 0 : 1;
    float _759 = 1.0 / _735;
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _763 = _761 != 0;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _767 = _765 != 0;
    int _769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _771 = _769 != 0;
    float _773 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].z, _693);
    int _775 = ~_739;
    int _777 = _775 + 1;
    int _779 = _777 + 1;
    float _781 = float(_663);
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _785 = _779;
    if (!_643)
    {
        int _787 = ~_739;
        int _789 = _787 + 1;
        _785 = _789;
    }
    int _791 = _785;
    if (!_625)
    {
        _667 = _161;
    }
    float _793 = _667;
    bool _795 = !_771;
    int _797 = _795 ? 0 : 1;
    float _799 = 1.0 / _781;
    float _801 = _793;
    if (_625)
    {
        _801 = _153;
    }
    float _803 = _801;
    int _805 = ~_621;
    int _807 = _805 + 1;
    int _809 = _807 + 1;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _813 = _809;
    float _815 = _803;
    if (!_637)
    {
        int _817 = ~_621;
        int _819 = _817 + 1;
        _813 = _819;
    }
    int _821 = _813;
    float _823 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[83].w, _783);
    int _825 = abs(_797);
    float _827 = -_811;
    float _829 = fma(_737, 2.0, _827);
    bool _831 = !_767;
    int _833 = _831 ? 0 : 1;
    float _835 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].w, _823);
    if (!_625)
    {
        _815 = _161;
    }
    float _837 = _815;
    float _839 = -_117;
    float _841 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[81].x, _829);
    float _843 = float(_821);
    float _845 = _837;
    if (_625)
    {
        _845 = _153;
    }
    float _847 = _845;
    float _849 = float(_791);
    float _851 = _733 * _117;
    float _853 = float(_825);
    bool _855 = !_763;
    int _857 = _855 ? 0 : 1;
    float _859 = _853 * _849;
    int _861 = abs(_833);
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _865 = float(_709);
    float _867 = _847 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _869 = _405 * _117;
    float _871 = exp2(_851);
    float _873 = fma(_867, -2.0, _863);
    int _875 = abs(_857);
    float _877 = _859 * (-2.0);
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _881 = 1.0 + _879;
    float _883 = in.m_68.x;
    float _885 = in.m_68.y;
    float _887 = in.m_68.z;
    float _889 = _799 * _117;
    float _891 = float(_875);
    float _893 = 1.0 / _881;
    float _895 = float(_861);
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _899 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _901 = isnan(1.0);
    bool _903 = _899 || _901;
    bool _905 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _907 = _903 || _905;
    float _909 = _891 * _865;
    float _911 = _895 * _843;
    float _913 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[78].w, _897);
    float _915 = _759 * _117;
    float _917 = -_871;
    float _919 = _917 + 1.0;
    bool _921 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _923 = isnan(0.0);
    bool _925 = _921 || _923;
    bool _927 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _929 = _925 || _927;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _933 = _911 * (-2.0);
    float _935 = -_117;
    float _937 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[76].x, _581);
    float _939 = _929 ? _919 : 0.0;
    float _941 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[78].z, _931);
    bool _943 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _945 = isnan(_517);
    bool _947 = _943 || _945;
    bool _949 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _951 = _947 || _949;
    float _953 = float(_951);
    float _955 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _913);
    float _957 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[81].y, _873);
    float _959 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _941);
    if (_907)
    {
        float _961 = _939 * _893;
        _127 = _961;
    }
    float _963 = _127;
    float _965 = fma(_933, _885, _885);
    float _967 = _909 * (-2.0);
    float _969 = fma(_607, _933, _607);
    bool _971 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _973 = isnan(_517);
    bool _975 = _971 || _973;
    bool _977 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _979 = _975 || _977;
    float _981 = float(_979);
    float _983 = _153 + (-0.5);
    float _985 = -_953;
    float _987 = _985 + 1.0;
    float _989 = fma(_533, _967, _533);
    float _991 = fma(_967, _883, _883);
    float _993 = fma(_983, (*spvDescriptorSet0.vp_c9)._m0[196].y, _965);
    bool _995 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _997 = isnan(_517);
    bool _999 = _995 || _997;
    bool _1001 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1003 = _999 || _1001;
    float _1005 = float(_1003);
    float _1007 = _981 * _987;
    float _1009 = -_981;
    float _1011 = _1009 + 1.0;
    float _1013 = fma(_969, _963, _993);
    bool _1015 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1017 = isnan(_517);
    bool _1019 = _1015 || _1017;
    bool _1021 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1023 = _1019 || _1021;
    float _1025 = float(_1023);
    float _1027 = fma(_877, _887, _887);
    float _1029 = _1005 * _1011;
    float _1031 = -_1005;
    float _1033 = _1031 + 1.0;
    float _1035 = _149 + (-0.5);
    float _1037 = _1013 * 0.15915493667125701904296875;
    float _1039 = fma(_549, _877, _549);
    float _1041 = _1025 * _1033;
    float _1043 = fma(_1035, (*spvDescriptorSet0.vp_c9)._m0[196].x, _991);
    float _1045 = _161 + (-0.5);
    float _1047 = -_1025;
    float _1049 = _1047 + 1.0;
    float _1051 = _657 * _1041;
    float _1053 = _671 * _1041;
    float _1055 = fma(_1045, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1027);
    float _1057 = fma(_989, _963, _1043);
    float _1059 = in.m_66.x;
    float _1061 = in.m_66.y;
    float _1063 = fma(_1039, _963, _1055);
    float _1065 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1053);
    float _1067 = _1057 * 0.15915493667125701904296875;
    float _1069 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1069;
    float _1073 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1051);
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1075;
    float _1079 = fma(_741, _1029, _1065);
    float _1081 = fma(_1071, _753, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1083 = fma(_717, _1029, _1073);
    float _1085 = fma(_1077, _753, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1087 = _1063 * 0.15915493667125701904296875;
    float _1089 = _1037 * 6.283185482025146484375;
    float _1091 = sin(_1089);
    float _1093 = fma(_1081, _1007, _1083);
    float _1095 = fma(_1085, _1007, _1079);
    float _1097 = _493 * _185;
    float _1099 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _361);
    float _1101 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1093);
    float _1103 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1095);
    float _1105 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _339);
    float _1107 = _1037 * 6.283185482025146484375;
    float _1109 = cos(_1107);
    float _1111 = fma(_491, _183, _1097);
    float _1113 = _1101 * _1059;
    float _1115 = _1103 * _1061;
    float _1117 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1119 = fma(_495, _187, _1111);
    float _1121 = _1113 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1123 = _1115 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1125 = _1067 * 6.283185482025146484375;
    float _1127 = cos(_1125);
    float _1129 = _1119 + _577;
    float _1131 = _1121 * _1105;
    float _1133 = _1123 * _1099;
    float _1135 = in.m_59.w;
    float _1137 = _1067 * 6.283185482025146484375;
    float _1139 = sin(_1137);
    float _1141 = _1087 * 6.283185482025146484375;
    float _1143 = cos(_1141);
    float _1145 = _1127 * _1109;
    float _1147 = _1127 * _1091;
    float _1149 = _1087 * 6.283185482025146484375;
    float _1151 = sin(_1149);
    float _1153 = _1139 * _1091;
    float _1155 = _1139 * _1109;
    float _1157 = _1127 * _1143;
    float _1159 = _1091 * _1143;
    float _1161 = _1139 * _1143;
    float _1163 = _1109 * _1143;
    float _1165 = _1157 * _1133;
    float _1167 = fma(_1151, _1145, _1153);
    float _1169 = -_1133;
    float _1171 = _1151 * _1169;
    float _1173 = -_1155;
    float _1175 = fma(_1151, _1147, _1173);
    float _1177 = fma(_1151, _1153, _1145);
    float _1179 = fma(_1167, _1131, _1165);
    float _1181 = -_1147;
    float _1183 = fma(_1151, _1155, _1181);
    float _1185 = _1161 * _1133;
    float _1187 = fma(_1163, _1131, _1171);
    float _1189 = fma(_1175, _1117, _1179);
    float _1191 = _493 * _179;
    float _1193 = fma(_1183, _1131, _1185);
    float _1195 = fma(_1159, _1117, _1187);
    float _1197 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1199 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1201 = fma(_1177, _1117, _1193);
    float _1203 = fma(_491, _177, _1191);
    float _1205 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1197);
    float _1207 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1199);
    float _1209 = in.m_57.w;
    float _1211 = fma(_495, _181, _1203);
    float _1213 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1205);
    float _1215 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1207);
    float _1217 = _493 * _171;
    float _1219 = _1211 + _1135;
    float _1221 = _1213 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1223 = _1215 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1225 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1227 = fma(_491, _169, _1217);
    float _1229 = _1129 + _1221;
    float _1231 = _1219 + _1223;
    float _1233 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1225);
    float _1235 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1237 = _1229 + _1235;
    float _1239 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1241 = _1231 + _1239;
    float _1243 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1233);
    float _1245 = _1237 * _1237;
    float _1247 = _1243 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1249 = fma(_1241, _1241, _1245);
    float _1251 = fma(_495, _173, _1227);
    float _1253 = sqrt(_1249);
    float _1255 = _1251 + _1209;
    float _1257 = _1255 + _1247;
    bool _1259 = _1253 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1263 = _1261 != 0;
    int _1265 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1267 = _1265 != 0;
    int _1269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1271 = _1269 != 0;
    int _1273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1275 = _1273 != 0;
    bool _1277 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1279 = isnan(0.5);
    bool _1281 = _1277 || _1279;
    bool _1283 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1285 = _1281 || _1283;
    bool _1287 = !_1267;
    int _1289 = _1287 ? 0 : 1;
    bool _1291 = !_1263;
    int _1293 = _1291 ? 0 : 1;
    bool _1295 = !_1271;
    int _1297 = _1295 ? 0 : 1;
    bool _1299 = !_1275;
    int _1301 = _1299 ? 0 : 1;
    float _1303 = _1247;
    float _1305 = _1249;
    float _1307 = _1241;
    float _1309 = _1237;
    float _1311 = _1201;
    float _1313 = _1209;
    if (!_1259)
    {
        _501 = _1231;
    }
    float _1315 = _501;
    float _1317 = _1315;
    if (!_1259)
    {
        _247 = _1229;
    }
    float _1319 = _247;
    float _1321 = _1319;
    if (!_1259)
    {
        _1303 = _1257;
    }
    float _1323 = _1303;
    bool _1325 = !_1259;
    float _1327 = _1323;
    if (!_1325)
    {
        float _1329 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1331 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1333 = _1253 + _1331;
        float _1335 = _1257 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1337 = rsqrt(_1249);
        float _1339 = _1333 * _1329;
        float _1341 = _1339 * 0.15915493667125701904296875;
        float _1343 = _1341 * 6.283185482025146484375;
        float _1345 = cos(_1343);
        float _1347 = _1341 * 6.283185482025146484375;
        float _1349 = sin(_1347);
        float _1351 = _1345 + (-1.0);
        float _1353 = _1351 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1355 = fma(_1349, _1335, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1357 = fma(_1257, _1345, _1353);
        float _1359 = _1337 * _1355;
        float _1361 = fma(_1241, _1359, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1363 = fma(_1237, _1359, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1317 = _1361;
        _1327 = _1357;
        _1321 = _1363;
        _1305 = _1337;
    }
    float _1365 = _1317;
    float _1367 = _1327;
    float _1369 = _1321;
    float _1371 = _1305;
    float _1373 = _1371;
    if (_1285)
    {
        _1307 = _1365;
    }
    float _1375 = _1307;
    float _1377 = _1375;
    if (_1285)
    {
        _1309 = _1367;
    }
    float _1379 = _1309;
    float _1381 = _1379;
    if (_1285)
    {
        _1373 = _1369;
    }
    float _1383 = _1373;
    float _1385 = _1383;
    if (!_1285)
    {
        float _1387 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1389 = _1255 + _1387;
        float _1391 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1393 = _1219 + _1391;
        float _1395 = -_1219;
        float _1397 = _1395 + _1365;
        float _1399 = -_1255;
        float _1401 = _1399 + _1367;
        float _1403 = _1389 * _1389;
        float _1405 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1407 = _1129 + _1405;
        float _1409 = -_1129;
        float _1411 = _1409 + _1369;
        float _1413 = fma(_1393, _1393, _1403);
        float _1415 = fma(_1407, _1407, _1413);
        float _1417 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1419 = sqrt(_1415);
        float _1421 = precise::min(_1419, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1423 = _1421 * _1417;
        float _1425 = fma(_1397, _1423, _1219);
        float _1427 = fma(_1401, _1423, _1255);
        float _1429 = fma(_1411, _1423, _1129);
        _1381 = _1427;
        _1377 = _1425;
        _1385 = _1429;
    }
    float _1431 = _1381;
    float _1433 = _1377;
    float _1435 = _1385;
    float _1437 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1439 = _1431 + _1437;
    float _1441 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1443 = _1433 + _1441;
    float _1445 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1447 = _1435 + _1445;
    float _1449 = _1439 * _1439;
    float _1451 = fma(_1443, _1443, _1449);
    float _1453 = fma(_1447, _1447, _1451);
    float _1455 = rsqrt(_1453);
    float _1457 = sqrt(_1453);
    float _1459 = _1455 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1461 = _1443 * _1459;
    float _1463 = _1447 * _1459;
    float _1465 = _1461 * _1461;
    float _1467 = _1463 * _1463;
    float _1469 = _1465 + _1467;
    float _1471 = sqrt(_1469);
    bool _1473 = _1471 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1475 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1477 = _1471 + _1475;
    float _1479 = _1451;
    float _1481 = _1469;
    float _1483 = _1477;
    float _1485 = _1439;
    float _1487 = _1461;
    float _1489 = _1463;
    float _1491 = _1467;
    if (_1473)
    {
        float _1493 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1479 = _1493;
    }
    float _1495 = _1479;
    if (_1473)
    {
        float _1497 = rsqrt(_1469);
        _1481 = _1497;
    }
    float _1499 = _1481;
    if (_1473)
    {
        float _1501 = _1477 * _1495;
        _1483 = _1501;
    }
    float _1503 = _1483;
    if (_1473)
    {
        float _1505 = _1503 * 0.15915493667125701904296875;
        _1311 = _1505;
    }
    float _1507 = _1311;
    float _1509 = _1257;
    if (_1473)
    {
        float _1511 = _1507 * 6.283185482025146484375;
        float _1513 = sin(_1511);
        _1509 = _1513;
    }
    float _1515 = _1509;
    float _1517 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1519 = precise::max(0.0, _1517);
    float _1521 = _1495;
    float _1523 = _1519;
    if (_1473)
    {
        float _1525 = _1507 * 6.283185482025146484375;
        float _1527 = cos(_1525);
        _1521 = _1527;
    }
    float _1529 = _1521;
    float _1531 = -_1459;
    float _1533 = -_1519;
    float _1535 = fma(_1439, _1531, _1533);
    if (_1473)
    {
        float _1537 = _1535 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1485 = _1537;
    }
    float _1539 = _1485;
    float _1541 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1543 = fma(_1457, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1541);
    float _1545 = precise::clamp(_1543, 0.0, 1.0);
    float _1547 = _1515;
    float _1549 = _1539;
    if (_1473)
    {
        float _1551 = fma(_1515, _1539, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1547 = _1551;
    }
    float _1553 = _1547;
    float _1555 = _1553;
    if (!_1473)
    {
        _1549 = _1535;
    }
    float _1557 = _1549;
    float _1559 = -_1545;
    float _1561 = _1559 + 1.0;
    float _1563 = _1557;
    if (_1473)
    {
        float _1565 = _1529 + (-1.0);
        _1523 = _1565;
    }
    float _1567 = _1523;
    float _1569 = _1567;
    if (_1473)
    {
        float _1571 = _1499 * _1553;
        _1313 = _1571;
    }
    float _1573 = _1313;
    float _1575 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1473)
    {
        float _1577 = _1567 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1555 = _1577;
    }
    float _1579 = _1555;
    if (_1473)
    {
        float _1581 = _1461 * _1573;
        _1487 = _1581;
    }
    float _1583 = _1487;
    if (!_1473)
    {
        _1569 = _1465;
    }
    float _1585 = _1569;
    float _1587 = _1585;
    if (_1473)
    {
        float _1589 = _1463 * _1573;
        _1489 = _1589;
    }
    float _1591 = _1489;
    if (_1473)
    {
        float _1593 = fma(_1535, _1529, _1579);
        _1563 = _1593;
    }
    float _1595 = _1563;
    if (_1473)
    {
        float _1597 = _1583 * _1583;
        _1587 = _1597;
    }
    float _1599 = _1587;
    float _1601 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1473)
    {
        float _1603 = _1591 * _1591;
        _1491 = _1603;
    }
    float _1605 = _1491;
    float _1607 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1575);
    float _1609 = fma(_1595, _1595, _1599);
    float _1611 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1601);
    float _1613 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1615 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1607);
    float _1617 = _1609 + _1605;
    float _1619 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1621 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1611);
    float _1623 = _1615 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1625 = abs(_1561);
    float _1627 = log2(_1625);
    float _1629 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1619);
    float _1631 = _1621 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1633 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1635 = _1623 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1637 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1629);
    float _1639 = _1623 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1641 = _1631 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1643 = rsqrt(_1617);
    float _1645 = _1637 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1647 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1633);
    float _1649 = -_1641;
    float _1651 = fma(_1649, _1613, 1.0);
    float _1653 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1639);
    float _1655 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1647);
    float _1657 = _1627 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1659 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1653);
    float _1661 = _1655 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1663 = log2(_1651);
    float _1665 = _1643 * _1583;
    float _1667 = _1643 * _1595;
    float _1669 = _1643 * _1591;
    float _1671 = exp2(_1657);
    float _1673 = _1665 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1675 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1659);
    float _1677 = -_1673;
    float _1679 = fma(_1667, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1677);
    float _1681 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1635);
    float _1683 = 1.0 / _1675;
    float _1685 = -_1669;
    float _1687 = fma(_1685, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1679);
    float _1689 = _1623 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1691 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1681);
    float _1693 = _1663 * 0.693147182464599609375;
    float _1695 = fma(_1687, -0.5, 0.5);
    float _1697 = fma(_1687, 0.5, 0.5);
    float _1699 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1689);
    float _1701 = _1667 + 1.0;
    float _1703 = _1693 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1705 = fma(_1697, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1707 = sqrt(_1695);
    float _1709 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1699);
    float _1711 = fma(_1697, _1705, -0.212114393711090087890625);
    float _1713 = -_1667;
    float _1715 = fma(_1671, _1701, _1713);
    float _1717 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1709);
    float _1719 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1691);
    float _1721 = fma(_1697, _1711, 1.570728778839111328125);
    float _1723 = fma(_1715, 0.5, 0.5);
    float _1725 = _1717 * _1683;
    float _1727 = _1719 * _1683;
    float _1729 = fma(_1725, 0.5, 0.5);
    float _1731 = fma(_1727, -0.5, 0.5);
    float _1733 = _1707 * 0.636619746685028076171875;
    float _1735 = -_1721;
    float _1737 = fma(_1733, _1735, 1.0);
    float3 _5870 = float3(_1729, _1731, _1703);
    float _1739 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5870, float3(0.0), isnan(_5870)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5870, float3(0.0), isnan(_5870)), level(0.0)).x;
    float3 _5881 = float3(_1729, _1731, _1703);
    float4 _1742 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5881, float3(0.0), isnan(_5881)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5881, float3(0.0), isnan(_5881)), level(0.0)).xyzw;
    float _1744 = _1742.x;
    float _1746 = _1742.y;
    float _1748 = _1742.z;
    float _1750 = _1742.w;
    float2 _5898 = float2(_1737, _1723);
    float3 _1754 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5898, float2(0.0), isnan(_5898)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5898, float2(0.0), isnan(_5898)), level(0.0)).xyz;
    float _1756 = _1754.x;
    float _1758 = _1754.y;
    float _1760 = _1754.z;
    float _1762 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1764 = int(_1762);
    int _1766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1768 = _1766 != 0;
    float _1770 = -_959;
    float _1772 = _1770 + 1.0;
    bool _1774 = _161 > 0.5;
    float _1776 = -_773;
    float _1778 = _1776 + 1.0;
    bool _1780 = _149 > 0.5;
    float _1782 = -_955;
    float _1784 = _1782 + 1.0;
    int _1786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1788 = _1786 != 0;
    float _1790 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1792 = int(_1790);
    bool _1794 = _153 > 0.5;
    float _1796 = -_835;
    float _1798 = _1796 + 1.0;
    int _1800 = abs(_745);
    out.m_70.x = _1219;
    out.m_70.y = _1255;
    out.m_70.z = _1129;
    int _1802 = abs(_1293);
    float _1804 = _1627 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1806 = 0.0;
    if (_1768)
    {
        _1806 = _149;
    }
    float _1808 = _1806;
    float _1810 = trunc(_889);
    int _1812 = int(_1810);
    float _1814 = float(uint(_1764));
    out.m_72.x = _1433;
    out.m_72.y = _1431;
    out.m_72.z = _1435;
    float _1816 = _1808;
    float _1818 = _1814;
    if (!_1768)
    {
        _1816 = _153;
    }
    float _1820 = _1816;
    int _1822 = ~_1764;
    int _1824 = _1822 + 1;
    int _1826 = abs(_1297);
    float _1828 = 1.0 / _1814;
    float _1830 = float(uint(_1792));
    float _1832 = _1175 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1834 = 1.0 / _1830;
    float _1836 = trunc(_915);
    int _1838 = int(_1836);
    int _1840 = as_type<int>(_1828) + (-2);
    float _1842 = float(uint(_1812));
    if (_1768)
    {
        _1818 = 1.0;
    }
    float _1844 = _1818;
    float _1846 = _1844;
    if (!_1768)
    {
        _1846 = 1.2345600128173828125;
    }
    float _1848 = _1846;
    float _1850 = as_type<float>(_1840) * _1842;
    int _1852 = as_type<int>(_1834) + (-2);
    float _1854 = exp2(_1804);
    int _1856 = ~_1764;
    int _1858 = _1856 + 1;
    float _1860 = _1848 * _1820;
    int _1862 = ~_1792;
    int _1864 = _1862 + 1;
    float _1866 = float(uint(_1838));
    float _1868 = trunc(_1850);
    float _1870 = precise::max(_1868, 0.0);
    uint _1873 = uint(_1870);
    float _1875 = as_type<float>(_1852) * _1866;
    float _1877 = _1866;
    if (_1768)
    {
        _1877 = 1.0;
    }
    float _1879 = _1877;
    float _1881 = _1879;
    if (!_1768)
    {
        _1881 = 7.345489978790283203125;
    }
    float _1883 = _1881;
    float _1885 = floor(_1860);
    float _1887 = -_1854;
    float _1889 = _1887 + 1.0;
    float _1891 = _1883 * _149;
    float _1893 = float(_1812);
    float _1895 = trunc(_1875);
    float _1897 = precise::max(_1895, 0.0);
    uint _1899 = uint(_1897);
    int _1901 = _1858 * int(_1873);
    int _1903 = _1901 + _1812;
    float _1905 = float(uint(_1903));
    float _1907 = floor(_1891);
    float _1909 = -_1885;
    float _1911 = _1860 + _1909;
    float _1913 = float(_1792);
    float _1915 = as_type<float>(_1840) * _1905;
    int _1917 = _1864 * int(_1899);
    int _1919 = _1917 + _1838;
    float _1921 = trunc(_1915);
    float _1923 = precise::max(_1921, 0.0);
    uint _1925 = uint(_1923);
    float _1927 = float(uint(_1919));
    float _1929 = -_1907;
    float _1931 = _1891 + _1929;
    float _1933 = as_type<float>(_1852) * _1927;
    float _1935 = float(_1764);
    bool _1937 = _1893 >= _1935;
    bool _1939 = isnan(_1893);
    bool _1941 = _1937 || _1939;
    bool _1943 = isnan(_1935);
    bool _1945 = _1941 || _1943;
    float _1947 = float(_1945);
    float _1949 = trunc(_1933);
    float _1951 = precise::max(_1949, 0.0);
    uint _1953 = uint(_1951);
    int _1955 = int(_1873) + int(_1925);
    float _1957 = _1931 * _1935;
    int _1959 = ~_1792;
    int _1961 = _1959 + 1;
    float _1963 = _1911 * _1913;
    float _1965 = float(_1838);
    int _1967 = _1824 * _1955;
    int _1969 = _1967 + _1812;
    float _1971 = trunc(_1947);
    int _1973 = int(_1971);
    float _1975 = _1935 * _869;
    float _1977 = _1913 * _869;
    bool _1979 = uint(_1969) >= uint(_1764);
    int _1981 = int(_1899) + int(_1953);
    float _1983 = trunc(_1957);
    int _1985 = int(_1983);
    bool _1987 = !_1979;
    int _1989 = _1987 ? 0 : (-1);
    int _1991 = _1961 * _1981;
    int _1993 = _1991 + _1838;
    int _1995 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1997 = _1995 != 0;
    float _1999 = trunc(_1963);
    int _2001 = int(_1999);
    bool _2003 = uint(_1993) >= uint(_1792);
    int _2005 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2007 = _2005 != 0;
    bool _2009 = _1965 >= _1913;
    bool _2011 = isnan(_1965);
    bool _2013 = _2009 || _2011;
    bool _2015 = isnan(_1913);
    bool _2017 = _2013 || _2015;
    float _2019 = float(_2017);
    bool _2021 = !_2007;
    int _2023 = _2021 ? 0 : 1;
    float _2025 = trunc(_1975);
    int _2027 = int(_2025);
    int _2029 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2031 = _2029 != 0;
    int _2033 = ~_1955;
    int _2035 = _2033 + _1989;
    int _2037 = _2035 + 1;
    bool _2039 = !_2031;
    int _2041 = _2039 ? 0 : 1;
    bool _2043 = !_2003;
    int _2045 = _2043 ? 0 : (-1);
    float _2047 = trunc(_2019);
    int _2049 = int(_2047);
    int _2051 = abs(_2023);
    int _2053 = _1764 * _2037;
    int _2055 = _2053 + _1812;
    int _2057 = ~_1981;
    int _2059 = _2057 + _2045;
    int _2061 = _2059 + 1;
    int _2063 = abs(_2041);
    int _2065 = _1985 * _2051;
    int _2067 = _2065 + _1812;
    bool _2069 = _1764 == 0;
    int _2071 = _1792 * _2061;
    int _2073 = _2071 + _1838;
    float _2075 = trunc(_1977);
    int _2077 = int(_2075);
    int _2079 = ~_1973;
    int _2081 = _2079 + 1;
    int _2083 = _2081 + 1;
    bool _2085 = !_2069;
    int _2087 = _2085 ? _2055 : (-1);
    int _2089 = _2001 * _2063;
    int _2091 = _2089 + _1838;
    bool _2093 = _1792 == 0;
    int _2095 = ~_2049;
    int _2097 = _2095 + 1;
    int _2099 = _2097 + 1;
    int _2101 = _2087 * _2083;
    bool _2103 = !_2093;
    int _2105 = _2103 ? _2073 : (-1);
    int _2107 = _1764 + (-1);
    int _2109 = _1792 + (-1);
    int _2111 = _2105 * _2099;
    int _2113 = _1973 * _2107;
    int _2115 = _2113 + _2101;
    int _2117 = abs(_751);
    int _2119 = _2049 * _2109;
    int _2121 = _2119 + _2111;
    float _2123 = in.m_53.w;
    int _2125 = abs(_1289);
    int _2127 = _2115 * _1800;
    int _2129 = abs(_757);
    int _2131 = _2121 * _2125;
    float _2133 = float(uint(_2067));
    int _2135 = _2027 * _2117;
    int _2137 = _2135 + _2127;
    int _2139 = _2077 * _1802;
    int _2141 = _2139 + _2131;
    bool _2143 = !_1788;
    int _2145 = _2143 ? 0 : 1;
    float _2147 = as_type<float>(_1840) * _2133;
    int _2149 = _2067 * _2129;
    int _2151 = _2149 + _2137;
    float _2153 = -_339;
    int _2155 = _1780 ? as_type<int>(_2153) : as_type<int>(_339);
    int _2157 = abs(_2145);
    int _2159 = _2091 * _1826;
    int _2161 = _2159 + _2141;
    bool _2163 = !_1997;
    float _2165 = _2163 ? _339 : as_type<float>(_2155);
    float _2167 = trunc(_2147);
    float _2169 = precise::max(_2167, 0.0);
    uint _2171 = uint(_2169);
    int _2173 = abs(_1301);
    int _2175 = _1985 * _2157;
    int _2177 = _2175 + _2151;
    float _2179 = float(uint(_2091));
    float _2181 = _2165 + 0.5;
    bool _2183 = _2123 > 0.5;
    int _2185 = _2001 * _2173;
    int _2187 = _2185 + _2161;
    float _2189 = float(uint(_2177));
    float _2191 = as_type<float>(_1852) * _2179;
    float _2193 = fma(_2181, (*spvDescriptorSet0.vp_c9)._m0[80].x, _937);
    int _2195 = ~_1764;
    int _2197 = _2195 + 1;
    float _2199 = trunc(_2191);
    float _2201 = precise::max(_2199, 0.0);
    uint _2203 = uint(_2201);
    float _2205 = float(uint(_2187));
    float _2207 = as_type<float>(_1840) * _2189;
    float _2209 = -_1772;
    float _2211 = fma(_2165, _2209, _2193);
    int _2213 = ~_1792;
    int _2215 = _2213 + 1;
    float _2217 = as_type<float>(_1852) * _2205;
    int _2219 = ~_1792;
    int _2221 = _2219 + 1;
    float _2223 = trunc(_2207);
    float _2225 = precise::max(_2223, 0.0);
    uint _2227 = uint(_2225);
    int _2229 = _2197 * int(_2171);
    int _2231 = _2229 + _2067;
    int _2233 = ~_1764;
    int _2235 = _2233 + 1;
    int _2237 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2239 = _2237 != 0;
    float _2241 = float(uint(_2231));
    float _2243 = trunc(_2217);
    float _2245 = precise::max(_2243, 0.0);
    uint _2247 = uint(_2245);
    int _2249 = _2215 * int(_2203);
    int _2251 = _2249 + _2091;
    float _2253 = -_361;
    int _2255 = _1794 ? as_type<int>(_2253) : as_type<int>(_361);
    float _2257 = as_type<float>(_1840) * _2241;
    float _2259 = -_339;
    int _2261 = _1774 ? as_type<int>(_2259) : as_type<int>(_339);
    float _2263 = float(uint(_2251));
    int _2265 = _2235 * int(_2227);
    int _2267 = _2265 + _2177;
    int _2269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2271 = _2269 != 0;
    float _2273 = trunc(_2257);
    float _2275 = precise::max(_2273, 0.0);
    uint _2277 = uint(_2275);
    int _2279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2281 = _2279 != 0;
    float _2283 = as_type<float>(_1852) * _2263;
    float _2285 = float(uint(_2267));
    float _2287 = -_361;
    int _2289 = _2183 ? as_type<int>(_2287) : as_type<int>(_361);
    int _2291 = _2221 * int(_2247);
    int _2293 = _2291 + _2187;
    bool _2295 = !_2239;
    float _2297 = _2295 ? _339 : as_type<float>(_2261);
    float _2299 = as_type<float>(_1840) * _2285;
    bool _2301 = !_2271;
    float _2303 = _2301 ? _361 : as_type<float>(_2255);
    float _2305 = trunc(_2283);
    float _2307 = precise::max(_2305, 0.0);
    uint _2309 = uint(_2307);
    float _2311 = float(uint(_2293));
    float _2313 = _2297 + 0.5;
    bool _2315 = !_2281;
    float _2317 = _2315 ? _361 : as_type<float>(_2289);
    float _2319 = _2303 + (-0.5);
    int _2321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2323 = _2321 != 0;
    float _2325 = as_type<float>(_1852) * _2311;
    float _2327 = fma(_2313, (*spvDescriptorSet0.vp_c9)._m0[85].x, _841);
    float _2329 = trunc(_2299);
    float _2331 = precise::max(_2329, 0.0);
    uint _2333 = uint(_2331);
    float _2335 = _2317 + (-0.5);
    float _2337 = -_2319;
    float _2339 = -_747;
    float _2341 = fma(_2337, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2339);
    float _2343 = -_1778;
    float _2345 = fma(_2297, _2343, _2327);
    int _2347 = ~_1792;
    int _2349 = _2347 + 1;
    float _2351 = -_2335;
    float _2353 = -_957;
    float _2355 = fma(_2351, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2353);
    float _2357 = fma(_2303, _1784, _2341);
    float _2359 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2361 = trunc(_2325);
    float _2363 = precise::max(_2361, 0.0);
    uint _2365 = uint(_2363);
    float _2367 = fma(_2317, _1798, _2355);
    int _2369 = ~_1764;
    int _2371 = _2369 + 1;
    float _2373 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2377 = _2375 != 0;
    float _2379 = -_1151;
    float _2381 = fma(_2379, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2359);
    out.m_74.x = _2211;
    out.m_74.y = _2357;
    out.m_74.z = _2345;
    out.m_74.w = _2367;
    float _2383 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2385 = int(_2227) + int(_2333);
    int _2387 = int(_2203) + int(_2309);
    float _2389 = -_1151;
    float _2391 = fma(_2389, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2373);
    int _2393 = int(_2171) + int(_2277);
    float _2395 = -_1151;
    float _2397 = fma(_2395, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2383);
    float _2399 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2401 = int(_2247) + int(_2365);
    int _2403 = _2349 * _2387;
    int _2405 = _2403 + _2091;
    float _2407 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2391);
    float _2409 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2399);
    int _2411 = _2371 * _2385;
    int _2413 = _2411 + _2177;
    float _2415 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2381);
    int _2417 = _2349 * _2401;
    int _2419 = _2417 + _2187;
    float _2421 = _1175 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2423 = uint(_2405) >= uint(_1792);
    float _2425 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2427 = uint(_2413) >= uint(_1764);
    float _2429 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2431 = uint(_2419) >= uint(_1792);
    float _2433 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2397);
    bool _2435 = !_2427;
    int _2437 = _2435 ? 0 : (-1);
    float _2439 = _361 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2441 = !_2431;
    int _2443 = _2441 ? 0 : (-1);
    float _2445 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2425);
    int _2447 = ~_2385;
    int _2449 = _2447 + _2437;
    int _2451 = _2449 + 1;
    float _2453 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2429);
    int _2455 = ~_2401;
    int _2457 = _2455 + _2443;
    int _2459 = _2457 + 1;
    float _2461 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1832);
    float _2463 = _1175 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2465 = _1764 * _2451;
    int _2467 = _2465 + _2177;
    int _2469 = ~_1764;
    int _2471 = _2469 + 1;
    int _2473 = _1792 * _2459;
    int _2475 = _2473 + _2187;
    float _2477 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2463);
    float _2479 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2421);
    bool _2481 = !_2069;
    int _2483 = _2481 ? _2467 : (-1);
    float _2485 = _339 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2487 = !_2093;
    int _2489 = _2487 ? _2475 : (-1);
    float _2491 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2477);
    int _2493 = _2483 >> 31;
    int _2495 = _2471 * _2393;
    int _2497 = _2495 + _2067;
    int _2499 = _2489 >> 31;
    float _2501 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2461);
    int _2503 = _2493 & 3;
    float _2505 = fma(_1183, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2453);
    int _2507 = _2499 & 3;
    float _2509 = _2439 * _2415;
    int _2511 = _2483 + _2503;
    float _2513 = _2439 * _2407;
    int _2515 = _2489 + _2507;
    float _2517 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2479);
    int _2519 = _2511 >> 2;
    int _2521 = _2483 & 3;
    bool _2523 = _2521 != 0;
    int _2525 = _2515 >> 2;
    int _2527 = _2519 << 4;
    int _2529 = _2527 + 368;
    bool _2531 = uint(_2497) >= uint(_1764);
    float _2533 = fma(_1183, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2445);
    int _2535 = _2523 ? 0 : 1;
    uint _2537 = uint(int(uint(_2529) >> uint(2)));
    uint _2539 = uint(int(uint(int(_2537)) >> uint(2)));
    int _2541 = int(_2537) & 3;
    float _2543 = (*spvDescriptorSet0.vp_c9)._m0[int(_2539)][_2541];
    int _2545 = int(_2537) + 1;
    uint _2547 = uint(int(uint(_2545) >> uint(2)));
    int _2549 = _2545 & 3;
    float _2551 = (*spvDescriptorSet0.vp_c9)._m0[int(_2547)][_2549];
    int _2553 = _2483 & 3;
    bool _2555 = _2553 != 0;
    float _2557 = fma(_1183, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2409);
    int _2559 = _2525 << 4;
    int _2561 = _2559 + 512;
    float _2563 = fma(_2485, _2533, _2513);
    bool _2565 = !_2531;
    int _2567 = _2565 ? 0 : (-1);
    float _2569 = fma(_2485, _2557, _2509);
    bool _2571 = uint(_2553) >= 2u;
    uint _2573 = uint(int(uint(_2561) >> uint(2)));
    uint _2575 = uint(int(uint(int(_2573)) >> uint(2)));
    int _2577 = int(_2573) & 3;
    float _2579 = (*spvDescriptorSet0.vp_c9)._m0[int(_2575)][_2577];
    int _2581 = int(_2573) + 1;
    uint _2583 = uint(int(uint(_2581) >> uint(2)));
    int _2585 = _2581 & 3;
    float _2587 = (*spvDescriptorSet0.vp_c9)._m0[int(_2583)][_2585];
    bool _2589 = !_2423;
    int _2591 = _2589 ? 0 : (-1);
    out.m_76.x = _2533;
    out.m_76.y = _2557;
    out.m_76.z = _2505;
    bool _2593 = uint(_2553) > 1u;
    int _2595 = _2571 ? 0 : 1;
    bool _2597 = _2553 != 3;
    int _2599 = ~_2393;
    int _2601 = _2599 + _2567;
    int _2603 = _2601 + 1;
    int _2605 = _2529 + 8;
    uint _2607 = uint(int(uint(_2605) >> uint(2)));
    uint _2609 = uint(int(uint(int(_2607)) >> uint(2)));
    int _2611 = int(_2607) & 3;
    float _2613 = (*spvDescriptorSet0.vp_c9)._m0[int(_2609)][_2611];
    int _2615 = int(_2607) + 1;
    uint _2617 = uint(int(uint(_2615) >> uint(2)));
    int _2619 = _2615 & 3;
    float _2621 = (*spvDescriptorSet0.vp_c9)._m0[int(_2617)][_2619];
    int _2623 = ~_2535;
    int _2625 = _2623 + 1;
    int _2627 = _2625 + 1;
    float _2629 = _1623 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2631 = ~_2595;
    int _2633 = _2631 + 1;
    int _2635 = _2633 + 1;
    int _2637 = _1764 * _2603;
    int _2639 = _2637 + _2067;
    int _2641 = _2627;
    int _2643 = _2635;
    if (!_2593)
    {
        int _2645 = ~_2535;
        int _2647 = _2645 + 1;
        _2641 = _2647;
    }
    int _2649 = _2641;
    float _2651 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2629);
    int _2653 = _2489 & 3;
    bool _2655 = _2653 != 0;
    int _2657 = _2561 + 8;
    uint _2659 = uint(int(uint(_2657) >> uint(2)));
    uint _2661 = uint(int(uint(int(_2659)) >> uint(2)));
    int _2663 = int(_2659) & 3;
    float _2665 = (*spvDescriptorSet0.vp_c9)._m0[int(_2661)][_2663];
    int _2667 = int(_2659) + 1;
    uint _2669 = uint(int(uint(_2667) >> uint(2)));
    int _2671 = _2667 & 3;
    float _2673 = (*spvDescriptorSet0.vp_c9)._m0[int(_2669)][_2671];
    if (_2597)
    {
        int _2675 = ~_2595;
        int _2677 = _2675 + 1;
        _2643 = _2677;
    }
    int _2679 = _2643;
    float _2681 = _2439 * _2433;
    bool _2683 = uint(_2653) > 1u;
    float _2685 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2651);
    int _2687 = ~_2387;
    int _2689 = _2687 + _2591;
    int _2691 = _2689 + 1;
    float _2693 = fma(_2485, _2505, _2681);
    bool _2695 = !_2555;
    int _2697 = _2695 ? 0 : 1;
    float _2699 = fma(_2439, _2439, 1.0);
    int _2701 = _2489 & 3;
    bool _2703 = _2701 != 0;
    int _2705 = _1792 * _2691;
    int _2707 = _2705 + _2091;
    bool _2709 = !_2655;
    int _2711 = _2709 ? 0 : 1;
    int _2713 = _2703 ? 0 : 1;
    int _2715 = abs(_2697);
    int _2717 = ~_2713;
    int _2719 = _2717 + 1;
    int _2721 = _2719 + 1;
    int _2723 = _2721;
    if (!_2683)
    {
        int _2725 = ~_2713;
        int _2727 = _2725 + 1;
        _2723 = _2727;
    }
    int _2729 = _2723;
    int _2731 = abs(_2649);
    int _2733 = abs(_2729);
    bool _2735 = _2653 != 3;
    int _2737 = ~_2731;
    int _2739 = _2737 + 1;
    int _2741 = _2739 + 1;
    int _2743 = abs(_2711);
    int _2745 = _2741 * as_type<int>(_2551);
    bool _2747 = uint(_2653) >= 2u;
    int _2749 = abs(_2679);
    int _2751 = ~_2733;
    int _2753 = _2751 + 1;
    int _2755 = _2753 + 1;
    int _2757 = ~_2715;
    int _2759 = _2757 + 1;
    int _2761 = _2759 + 1;
    int _2763 = _2755 * as_type<int>(_2587);
    bool _2765 = _2553 != 3;
    int _2767 = _2747 ? 0 : 1;
    int _2769 = _2761 * as_type<int>(_2543);
    int _2771 = _2769 + _2745;
    int _2773 = ~_2743;
    int _2775 = _2773 + 1;
    int _2777 = _2775 + 1;
    int _2779 = ~_2749;
    int _2781 = _2779 + 1;
    int _2783 = _2781 + 1;
    int _2785 = ~_2767;
    int _2787 = _2785 + 1;
    int _2789 = _2787 + 1;
    int _2791 = _2777 * as_type<int>(_2579);
    int _2793 = _2791 + _2763;
    int _2795 = _2789;
    if (_2735)
    {
        int _2797 = ~_2767;
        int _2799 = _2797 + 1;
        _2795 = _2799;
    }
    int _2801 = _2795;
    int _2803 = _2783 * as_type<int>(_2613);
    int _2805 = _2803 + _2771;
    bool _2807 = !_2323;
    int _2809 = _2807 ? 0 : 1;
    float _2811 = rsqrt(_2699);
    bool _2813 = !_2765;
    int _2815 = _2813 ? 0 : (-1);
    int _2817 = abs(_2801);
    int _2819 = abs(_2809);
    int _2821 = abs(_2815);
    float _2823 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2685);
    int _2825 = ~_2821;
    int _2827 = _2825 + 1;
    int _2829 = _2827 + 1;
    int _2831 = ~_2817;
    int _2833 = _2831 + 1;
    int _2835 = _2833 + 1;
    bool _2837 = _2653 != 3;
    int _2839 = _2829 * as_type<int>(_2621);
    int _2841 = _2839 + _2805;
    bool _2843 = !_2069;
    int _2845 = _2843 ? _2639 : (-1);
    int _2847 = _2835 * as_type<int>(_2665);
    int _2849 = _2847 + _2793;
    int _2851 = ~_2819;
    int _2853 = _2851 + 1;
    int _2855 = _2853 + 1;
    float _2857 = _2439 * _2811;
    bool _2859 = !_2837;
    int _2861 = _2859 ? 0 : (-1);
    float _2863 = _2501 + _2569;
    bool _2865 = !_2377;
    int _2867 = _2865 ? 0 : 1;
    int _2869 = _2841 * _2855;
    int _2871 = abs(_2861);
    float _2873 = _2491 + _2563;
    int _2875 = abs(_2867);
    int _2877 = _2845 * _2819;
    int _2879 = _2877 + _2869;
    float _2881 = -_2491;
    float _2883 = _2857 * _2881;
    float _2885 = -_2501;
    float _2887 = _2857 * _2885;
    int _2889 = ~_2871;
    int _2891 = _2889 + 1;
    int _2893 = _2891 + 1;
    out.gl_Position.x = _1717;
    out.gl_Position.y = _1719;
    out.gl_Position.z = _2823;
    out.gl_Position.w = _1675;
    float _2895 = fma(_2811, _2407, _2883);
    float _2897 = fma(_2811, _2415, _2887);
    float _2899 = _1675 * 0.5;
    int _2901 = _2893 * as_type<int>(_2673);
    int _2903 = _2901 + _2849;
    int _2905 = ~_2875;
    int _2907 = _2905 + 1;
    int _2909 = _2907 + 1;
    float _2911 = _2823 + _1675;
    float _2913 = fma(_1719, -0.5, _2899);
    float _2915 = _1889 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2917 = !_2093;
    int _2919 = _2917 ? _2707 : (-1);
    int _2921 = _2903 * _2909;
    float _2923 = _1717 + _1675;
    float _2925 = _2915 * _1739;
    float _2927 = -_2915;
    float _2929 = _2927 + 1.0;
    int _2931 = _2919 * _2875;
    int _2933 = _2931 + _2921;
    float _2935 = _1750 * _2925;
    float _2937 = _1760 * _2925;
    float _2939 = _2911 * 0.5;
    float _2941 = _2923 * 0.5;
    float _2943 = float(_2879);
    float _2945 = _2517 + _2693;
    float _2947 = float(_2933);
    float _2949 = fma(_1756, _2935, _1744);
    float _2951 = fma(_1758, _2935, _1746);
    float _2953 = _1750 * _2929;
    float _2955 = fma(_1750, _2937, _1748);
    out.m_78.x = _2941;
    out.m_78.y = _2913;
    out.m_78.z = _2939;
    out.m_78.w = _1675;
    bool _2957 = _1457 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2959 = isnan(_1457);
    bool _2961 = _2957 || _2959;
    bool _2963 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2965 = _2961 || _2963;
    float _2967 = -_2517;
    float _2969 = _2857 * _2967;
    out.m_80.x = _2943;
    out.m_80.y = _2947;
    float _2971 = fma(_2811, _2433, _2969);
    out.m_82.x = _2949;
    out.m_82.y = _2951;
    out.m_82.z = _2955;
    out.m_82.w = _2953;
    out.m_84.x = _2873;
    out.m_84.y = _2863;
    out.m_84.z = _2945;
    float _2973 = as_type<float>(_2933);
    float _2975 = _2935;
    float _2977 = _2929;
    float _2979 = _2971;
    float _2981 = _2897;
    float _2983 = _2895;
    if (!_2965)
    {
        _2973 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2985 = _2973;
    out.m_86.x = _2895;
    out.m_86.y = _2897;
    out.m_86.z = _2971;
    float _2987 = _2985;
    float _2989 = _2985;
    if (!_2965)
    {
        _2975 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2991 = _2975;
    float _2993 = _2991;
    float _2995 = _2991;
    if (!_2965)
    {
        _2977 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2997 = _2977;
    float _2999 = _2997;
    float _3001 = _2997;
    if (!_2965)
    {
        _2979 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3003 = _2979;
    float _3005 = _3003;
    float _3007 = _3003;
    if (!_2965)
    {
        _2981 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3009 = _2981;
    float _3011 = _3009;
    float _3013 = _3009;
    if (!_2965)
    {
        _2983 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3015 = _2983;
    bool _3017 = !_2965;
    float _3019 = _3015;
    float _3021 = _3015;
    if (!_3017)
    {
        bool _3023 = _1457 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3025 = isnan(_1457);
        bool _3027 = _3023 || _3025;
        bool _3029 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3031 = _3027 || _3029;
        if (!_3031)
        {
            float _3033 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3035 = _1457 + _3033;
            float _3037 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3039 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3037;
            float _3041 = 1.0 / _3039;
            float _3043 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3045 = _3043 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3047 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3049 = _3047 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3051 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3053 = _3051 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3055 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3057 = _3055 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3059 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3061 = _3059 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3063 = _3035 * _3041;
            float _3065 = precise::clamp(_3063, 0.0, 1.0);
            float _3067 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3069 = _3067 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3071 = fma(_3065, _3045, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3073 = fma(_3065, _3069, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3075 = fma(_3065, _3049, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3077 = fma(_3065, _3053, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3079 = fma(_3065, _3057, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3081 = fma(_3065, _3061, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3007 = _3073;
            _2995 = _3079;
            _2989 = _3071;
            _3021 = _3077;
            _3013 = _3075;
            _3001 = _3081;
            _3083 = true;
        }
        else
        {
            bool _3085 = _1457 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3087 = isnan(_1457);
            bool _3089 = _3085 || _3087;
            bool _3091 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3093 = _3089 || _3091;
            if (!_3093)
            {
                _2987 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3095 = _2987;
            _2989 = _3095;
            if (!_3093)
            {
                _3005 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3097 = _3005;
            _3007 = _3097;
            if (!_3093)
            {
                _3011 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3099 = _3011;
            _3013 = _3099;
            if (!_3093)
            {
                _3019 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3101 = _3019;
            _3021 = _3101;
            if (!_3093)
            {
                _2993 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3103 = _2993;
            _2995 = _3103;
            if (!_3093)
            {
                _2999 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3105 = _2999;
            bool _3107 = !_3093;
            _3001 = _3105;
            if (!_3107)
            {
                bool _3109 = _1457 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3111 = isnan(_1457);
                bool _3113 = _3109 || _3111;
                bool _3115 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3117 = _3113 || _3115;
                if (!_3117)
                {
                    float _3119 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3121 = _1457 + _3119;
                    float _3123 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3125 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3123;
                    float _3127 = 1.0 / _3125;
                    float _3129 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3131 = _3129 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3133 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3135 = _3133 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3137 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3139 = _3137 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3141 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3143 = _3141 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3145 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3147 = _3145 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3149 = _3121 * _3127;
                    float _3151 = precise::clamp(_3149, 0.0, 1.0);
                    float _3153 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3155 = _3153 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3157 = fma(_3151, _3131, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3159 = fma(_3151, _3155, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3161 = fma(_3151, _3135, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3163 = fma(_3151, _3139, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3165 = fma(_3151, _3143, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3167 = fma(_3151, _3147, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3007 = _3159;
                    _2995 = _3165;
                    _2989 = _3157;
                    _3021 = _3163;
                    _3013 = _3161;
                    _3001 = _3167;
                    _3083 = true;
                }
                else
                {
                    _3007 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2995 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2989 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3021 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3013 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3001 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3083 = false;
    float _3169 = _3007;
    float _3171 = _2995;
    float _3173 = _2989;
    float _3175 = _3021;
    float _3177 = _3013;
    float _3179 = _3001;
    float _3181 = fma(_2863, -0.5, 0.5);
    float _3183 = precise::clamp(_3181, 0.0, 1.0);
    float _3185 = -_3169;
    float _3187 = _3185 + _3171;
    float _3189 = -_3173;
    float _3191 = _3189 + _3175;
    float _3193 = -_3177;
    float _3195 = _3193 + _3179;
    bool _3197 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3199 = fma(_3183, _3187, _3169);
    float _3201 = fma(_3183, _3191, _3173);
    float _3203 = fma(_3183, _3195, _3177);
    float _3205 = _3199 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _3207 = fma(_3201, 0.298911988735198974609375, _3205);
    float _3209 = fma(_3203, 0.114477999508380889892578125, _3207);
    out.m_88.x = 0.0;
    float _3211 = -_3209;
    float _3213 = _3201 + _3211;
    float _3215 = -_3209;
    float _3217 = _3199 + _3215;
    float _3219 = -_3209;
    float _3221 = _3203 + _3219;
    float _3223 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3225 = fma(_3213, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3209);
    float _3227 = fma(_3217, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3209);
    float _3229 = fma(_3221, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3209);
    out.m_90.w = _3223;
    out.m_92.x = _3225;
    out.m_92.y = _3227;
    out.m_92.z = _3229;
    if (!_3197)
    {
        return out;
    }
    float _3231 = -_1431;
    float _3233 = _3231 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3235 = -_1433;
    float _3237 = _3235 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3239 = -_1435;
    float _3241 = _3239 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3243 = _3233 * _3233;
    float _3245 = fma(_3237, _3237, _3243);
    float _3247 = fma(_3241, _3241, _3245);
    float _3249 = sqrt(_3247);
    float _3251 = rsqrt(_3247);
    float _3253 = -_3249;
    float _3255 = _3253 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3257 = _3255 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3259 = precise::clamp(_3257, 0.0, 1.0);
    float _3261 = _3237 * _3251;
    float _3263 = _3233 * _3251;
    float _3265 = abs(_3259);
    float _3267 = log2(_3265);
    float _3269 = _3241 * _3251;
    float _3271 = _3261 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3273 = _2863 * _3263;
    float _3275 = -_3263;
    float _3277 = -_3271;
    float _3279 = fma(_3275, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3277);
    float _3281 = fma(_2873, _3261, _3273);
    float _3283 = -_3269;
    float _3285 = fma(_3283, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3279);
    float _3287 = fma(_2945, _3269, _3281);
    float _3289 = precise::clamp(_3287, 0.0, 1.0);
    float _3291 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3293 = _3285 + _3291;
    float _3295 = _3267 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3297 = _3293 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3299 = precise::clamp(_3297, 0.0, 1.0);
    float _3301 = exp2(_3295);
    float _3303 = _3301 * _3299;
    float _3305 = _3289 * _3303;
    float _3307 = _3305 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3309 = _3305 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3311 = _3305 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_88.x = _3307;
    out.m_88.y = _3309;
    out.m_88.z = _3311;
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
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3083 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_44.w;
    float _108 = in.m_46.w;
    float _110 = trunc(_106);
    int _113 = int(_110);
    float _115 = -_108;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _117;
    bool _121 = _113 >= 1;
    float _123 = 0.0;
    float _125 = _108;
    float _127 = _117;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _123;
    if (!_121)
    {
        out.m_51.x = 0.0;
    }
    int _131 = 0;
    if (!_121)
    {
        float _133 = _129 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3379 = as_type<float>(_135);
        out.gl_Position.z = _3379;
    }
    if (!_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _139 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_108);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = in.m_53.x;
    float _151 = float(_113);
    float _153 = in.m_53.y;
    bool _155 = _117 >= _151;
    bool _157 = !_147;
    bool _159 = _155 || _157;
    float _161 = in.m_53.z;
    if (_159)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _125;
    if (_159)
    {
        out.m_51.x = 0.0;
    }
    if (_159)
    {
        float _165 = _163 * 5.0;
        _137 = as_type<int>(_165);
    }
    int _167 = _137;
    out.m_55.x = _149;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3442 = as_type<float>(_167);
        out.gl_Position.z = _3442;
    }
    out.m_55.y = _153;
    out.m_55.z = _161;
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _169 = in.m_57.x;
    float _171 = in.m_57.y;
    float _173 = in.m_57.z;
    float _175 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _177 = in.m_59.x;
    float _179 = in.m_59.y;
    float _181 = in.m_59.z;
    float _183 = in.m_61.x;
    float _185 = in.m_61.y;
    float _187 = in.m_61.z;
    float _189 = as_type<float>(int(gl_VertexIndex));
    float _191 = in.m_66.w;
    float _193 = in.m_46.x;
    float _195 = in.m_46.y;
    float _197 = in.m_46.z;
    float _199 = _171 * _171;
    float _201 = _169 * _169;
    float _203 = _173 * _173;
    float _205 = fma(_179, _179, _199);
    float _207 = fma(_177, _177, _201);
    float _209 = fma(_181, _181, _203);
    float _211 = fma(_185, _185, _205);
    float _213 = fma(_183, _183, _207);
    float _215 = fma(_187, _187, _209);
    float _217 = sqrt(_211);
    float _219 = sqrt(_213);
    bool _221 = _217 > 0.0;
    float _223 = sqrt(_215);
    bool _225 = _219 > 0.0;
    float _227 = in.m_44.x;
    float _229 = in.m_44.y;
    float _231 = in.m_44.z;
    int _233 = as_type<int>(_189) & 1;
    bool _235 = _233 != 0;
    int _237 = as_type<int>(_189) & 2;
    bool _239 = _237 != 0;
    float _241 = _217;
    float _243 = _215;
    float _245 = _189;
    float _247 = _171;
    if (_221)
    {
        float _249 = rsqrt(_211);
        _241 = _249;
    }
    float _251 = _241;
    bool _253 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _257 = _253 || _255;
    bool _259 = isnan(1.0);
    bool _261 = _257 || _259;
    float _263 = 0.0;
    if (!_221)
    {
        _263 = 0.0;
    }
    float _265 = _263;
    bool _267 = _223 > 0.0;
    float _269 = 0.0;
    float _271 = _265;
    if (!_221)
    {
        _269 = 0.0;
    }
    float _273 = _269;
    float _275 = _213;
    float _277 = _273;
    if (_225)
    {
        float _279 = rsqrt(_213);
        _275 = _279;
    }
    float _281 = _275;
    float _283 = 0.0;
    if (!_221)
    {
        _283 = 0.0;
    }
    float _285 = _283;
    float _287 = 0.0;
    float _289 = _285;
    if (!_225)
    {
        _287 = 0.0;
    }
    float _291 = _287;
    float _293 = 0.0;
    float _295 = _291;
    if (!_225)
    {
        _293 = 0.0;
    }
    float _297 = _293;
    float _299 = _251;
    float _301 = _297;
    if (_221)
    {
        float _303 = _251 * _179;
        _271 = _303;
    }
    float _305 = _271;
    if (_221)
    {
        float _307 = _251 * _171;
        _277 = _307;
    }
    float _309 = _277;
    if (_221)
    {
        float _311 = _251 * _185;
        _289 = _311;
    }
    float _313 = _289;
    float _315 = _313;
    if (!_261)
    {
        float _317 = _175 * _175;
        float _319 = _317 * 0.5;
        _299 = _319;
    }
    float _321 = _299;
    float _323 = 0.0;
    float _325 = _321;
    if (!_225)
    {
        _323 = 0.0;
    }
    float _327 = _323;
    float _329 = 0.0;
    float _331 = _327;
    if (_267)
    {
        float _333 = rsqrt(_215);
        _329 = _333;
    }
    float _335 = _329;
    bool _337 = !_235;
    float _339 = _337 ? (-0.5) : 0.5;
    if (!_261)
    {
        float _341 = _321 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _325 = _341;
    }
    float _343 = _325;
    float _345 = _343;
    if (_225)
    {
        float _347 = _281 * _177;
        _295 = _347;
    }
    float _349 = _295;
    if (_225)
    {
        float _351 = _281 * _169;
        _301 = _351;
    }
    float _353 = _301;
    if (_225)
    {
        float _355 = _281 * _183;
        _331 = _355;
    }
    float _357 = _331;
    bool _359 = !_239;
    float _361 = _359 ? (-0.5) : 0.5;
    if (!_267)
    {
        _243 = 0.0;
    }
    float _363 = _243;
    bool _365 = !_261;
    float _367 = _363;
    if (!_365)
    {
        float _369 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _371 = log2(_369);
        float _373 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _375 = _373 + 1.0;
        float _377 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _379 = _175 * _371;
        float _381 = 1.0 / _375;
        float _383 = _377 * 0.693147182464599609375;
        float _385 = exp2(_379);
        float _387 = 1.0 / _383;
        float _389 = _385 + (-1.0);
        float _391 = -_389;
        float _393 = fma(_391, _387, _175);
        float _395 = _393 * _381;
        float _397 = _395 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _345 = _397;
        _245 = _383;
    }
    float _399 = _345;
    float _401 = _245;
    float _403 = _399 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _405 = 1.0 / _151;
    float _407 = _401;
    if (_267)
    {
        float _409 = _335 * _173;
        _367 = _409;
    }
    float _411 = _367;
    float _413 = _399 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _415 = _403 * _309;
    float _417 = _403 * _353;
    float _419 = _411;
    if (!_267)
    {
        _407 = 0.0;
    }
    float _421 = _407;
    float _423 = _403 * _411;
    float _425 = _421;
    if (_267)
    {
        float _427 = _335 * _181;
        _425 = _427;
    }
    float _429 = _425;
    float _431 = _399 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _433 = fma(_413, _305, _415);
    float _435 = fma(_413, _349, _417);
    if (!_267)
    {
        _419 = 0.0;
    }
    float _437 = _419;
    float _439 = fma(_413, _429, _423);
    float _441 = fma(_431, _313, _433);
    float _443 = _437;
    if (_267)
    {
        float _445 = _335 * _187;
        _443 = _445;
    }
    float _447 = _443;
    float _449 = fma(_431, _357, _435);
    if (!_261)
    {
        _315 = _175;
    }
    float _451 = _315;
    bool _453 = !_261;
    float _455 = _451;
    if (!_453)
    {
        float _457 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _459 = log2(_457);
        float _461 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _463 = _461 + 1.0;
        float _465 = 1.0 / _463;
        float _467 = _175 * _459;
        float _469 = exp2(_467);
        float _471 = -_469;
        float _473 = _471 + 1.0;
        float _475 = _473 * _465;
        _455 = _475;
    }
    float _477 = _455;
    bool _479 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _481 = fma(_431, _447, _439);
    float _483 = fma(_477, _193, _449);
    float _485 = fma(_477, _195, _441);
    float _487 = _117 * _405;
    float _489 = fma(_477, _197, _481);
    float _491 = fma(_483, _191, _227);
    float _493 = fma(_485, _191, _229);
    float _495 = fma(_489, _191, _231);
    bool _497 = !_479;
    float _499 = _487;
    float _501 = _491;
    if (!_497)
    {
        float _503 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _505 = _149 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _507 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _509 = _507 * _503;
        float _511 = floor(_509);
        float _513 = -_511;
        float _515 = _509 + _513;
        _499 = _515;
    }
    float _517 = _499;
    float _519 = _149 * 2.0;
    float _521 = _149 + _153;
    float _523 = floor(_519);
    float _525 = _521 + (-1.0);
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _529 = _527 != 0;
    float _531 = _161 * 2.0;
    float _533 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _535 = _149 + _161;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _537;
    float _541 = floor(_531);
    float _543 = _535 + (-1.0);
    float _545 = _153 * 2.0;
    float _547 = _149 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _549 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _551 = _523 >= 0.0;
    bool _553 = isnan(_523);
    bool _555 = _551 || _553;
    bool _557 = isnan(0.0);
    bool _559 = _555 || _557;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _563 = _517 + _561;
    float _565 = 1.0 / _539;
    int _567 = as_type<int>(_543);
    if (_529)
    {
        _567 = 0;
    }
    int _569 = _567;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _573 = _569;
    if (!_529)
    {
        _573 = 1;
    }
    int _575 = _573;
    float _577 = in.m_61.w;
    float _579 = -_571;
    float _581 = fma(_547, 2.0, _579);
    float _583 = floor(_545);
    float _585 = _153 + _161;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _591 = _589 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _593 = _541 > 0.0;
    float _595 = _585 + (-1.0);
    bool _597 = _541 >= 0.0;
    bool _599 = isnan(_541);
    bool _601 = _597 || _599;
    bool _603 = isnan(0.0);
    bool _605 = _601 || _603;
    float _607 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _611 = _517 + _609;
    float _613 = _153 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _615 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _617 = int(_615);
    float _619 = _611 * _565;
    int _621 = _559 ? 0 : 1;
    float _623 = fma(_613, -2.0, _587);
    bool _625 = _575 != 1;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _627;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _631;
    float _635 = 1.0 / _591;
    bool _637 = _523 > 0.0;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _639;
    bool _643 = _583 > 0.0;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _647 = _583 >= 0.0;
    bool _649 = isnan(_583);
    bool _651 = _647 || _649;
    bool _653 = isnan(0.0);
    bool _655 = _651 || _653;
    float _657 = fma(_629, _619, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _659 = _605 ? 0 : 1;
    float _661 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _663 = int(_661);
    float _665 = as_type<float>(_575);
    float _667 = as_type<float>(_663);
    if (!_625)
    {
        _665 = _153;
    }
    float _669 = _665;
    float _671 = fma(_633, _619, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _673 = _669;
    if (_625)
    {
        _673 = _149;
    }
    float _675 = _673;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _679 = _517 + _677;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _685 = ~_659;
    int _687 = _685 + 1;
    int _689 = _687 + 1;
    float _691 = 1.0 / _641;
    float _693 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[83].z, _645);
    float _695 = _675;
    int _697 = _689;
    if (!_625)
    {
        _695 = _153;
    }
    float _699 = _695;
    float _701 = _679 * _635;
    float _703 = _699;
    if (!_593)
    {
        int _705 = ~_659;
        int _707 = _705 + 1;
        _697 = _707;
    }
    int _709 = _697;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _713 = _711 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    if (_625)
    {
        _703 = _149;
    }
    float _715 = _703;
    float _717 = fma(_683, _701, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _721 = _719 != 0;
    int _723 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _725 = _723 != 0;
    int _727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _729 = _727 != 0;
    float _731 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _733 = log2(_731);
    float _735 = float(_617);
    float _737 = _715 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _739 = _655 ? 0 : 1;
    float _741 = fma(_713, _701, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _743 = !_725;
    int _745 = _743 ? 0 : 1;
    float _747 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _623);
    bool _749 = !_721;
    int _751 = _749 ? 0 : 1;
    float _753 = _563 * _691;
    bool _755 = !_729;
    int _757 = _755 ? 0 : 1;
    float _759 = 1.0 / _735;
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _763 = _761 != 0;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _767 = _765 != 0;
    int _769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _771 = _769 != 0;
    float _773 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].z, _693);
    int _775 = ~_739;
    int _777 = _775 + 1;
    int _779 = _777 + 1;
    float _781 = float(_663);
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _785 = _779;
    if (!_643)
    {
        int _787 = ~_739;
        int _789 = _787 + 1;
        _785 = _789;
    }
    int _791 = _785;
    if (!_625)
    {
        _667 = _161;
    }
    float _793 = _667;
    bool _795 = !_771;
    int _797 = _795 ? 0 : 1;
    float _799 = 1.0 / _781;
    float _801 = _793;
    if (_625)
    {
        _801 = _153;
    }
    float _803 = _801;
    int _805 = ~_621;
    int _807 = _805 + 1;
    int _809 = _807 + 1;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _813 = _809;
    float _815 = _803;
    if (!_637)
    {
        int _817 = ~_621;
        int _819 = _817 + 1;
        _813 = _819;
    }
    int _821 = _813;
    float _823 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[83].w, _783);
    int _825 = abs(_797);
    float _827 = -_811;
    float _829 = fma(_737, 2.0, _827);
    bool _831 = !_767;
    int _833 = _831 ? 0 : 1;
    float _835 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].w, _823);
    if (!_625)
    {
        _815 = _161;
    }
    float _837 = _815;
    float _839 = -_117;
    float _841 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[81].x, _829);
    float _843 = float(_821);
    float _845 = _837;
    if (_625)
    {
        _845 = _153;
    }
    float _847 = _845;
    float _849 = float(_791);
    float _851 = _733 * _117;
    float _853 = float(_825);
    bool _855 = !_763;
    int _857 = _855 ? 0 : 1;
    float _859 = _853 * _849;
    int _861 = abs(_833);
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _865 = float(_709);
    float _867 = _847 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _869 = _405 * _117;
    float _871 = exp2(_851);
    float _873 = fma(_867, -2.0, _863);
    int _875 = abs(_857);
    float _877 = _859 * (-2.0);
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _881 = 1.0 + _879;
    float _883 = in.m_68.x;
    float _885 = in.m_68.y;
    float _887 = in.m_68.z;
    float _889 = _799 * _117;
    float _891 = float(_875);
    float _893 = 1.0 / _881;
    float _895 = float(_861);
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _899 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _901 = isnan(1.0);
    bool _903 = _899 || _901;
    bool _905 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _907 = _903 || _905;
    float _909 = _891 * _865;
    float _911 = _895 * _843;
    float _913 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[78].w, _897);
    float _915 = _759 * _117;
    float _917 = -_871;
    float _919 = _917 + 1.0;
    bool _921 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _923 = isnan(0.0);
    bool _925 = _921 || _923;
    bool _927 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _929 = _925 || _927;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _933 = _911 * (-2.0);
    float _935 = -_117;
    float _937 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[76].x, _581);
    float _939 = _929 ? _919 : 0.0;
    float _941 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[78].z, _931);
    bool _943 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _945 = isnan(_517);
    bool _947 = _943 || _945;
    bool _949 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _951 = _947 || _949;
    float _953 = float(_951);
    float _955 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _913);
    float _957 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[81].y, _873);
    float _959 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _941);
    if (_907)
    {
        float _961 = _939 * _893;
        _127 = _961;
    }
    float _963 = _127;
    float _965 = fma(_933, _885, _885);
    float _967 = _909 * (-2.0);
    float _969 = fma(_607, _933, _607);
    bool _971 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _973 = isnan(_517);
    bool _975 = _971 || _973;
    bool _977 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _979 = _975 || _977;
    float _981 = float(_979);
    float _983 = _153 + (-0.5);
    float _985 = -_953;
    float _987 = _985 + 1.0;
    float _989 = fma(_533, _967, _533);
    float _991 = fma(_967, _883, _883);
    float _993 = fma(_983, (*spvDescriptorSet0.vp_c9)._m0[196].y, _965);
    bool _995 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _997 = isnan(_517);
    bool _999 = _995 || _997;
    bool _1001 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1003 = _999 || _1001;
    float _1005 = float(_1003);
    float _1007 = _981 * _987;
    float _1009 = -_981;
    float _1011 = _1009 + 1.0;
    float _1013 = fma(_969, _963, _993);
    bool _1015 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1017 = isnan(_517);
    bool _1019 = _1015 || _1017;
    bool _1021 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1023 = _1019 || _1021;
    float _1025 = float(_1023);
    float _1027 = fma(_877, _887, _887);
    float _1029 = _1005 * _1011;
    float _1031 = -_1005;
    float _1033 = _1031 + 1.0;
    float _1035 = _149 + (-0.5);
    float _1037 = _1013 * 0.15915493667125701904296875;
    float _1039 = fma(_549, _877, _549);
    float _1041 = _1025 * _1033;
    float _1043 = fma(_1035, (*spvDescriptorSet0.vp_c9)._m0[196].x, _991);
    float _1045 = _161 + (-0.5);
    float _1047 = -_1025;
    float _1049 = _1047 + 1.0;
    float _1051 = _657 * _1041;
    float _1053 = _671 * _1041;
    float _1055 = fma(_1045, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1027);
    float _1057 = fma(_989, _963, _1043);
    float _1059 = in.m_66.x;
    float _1061 = in.m_66.y;
    float _1063 = fma(_1039, _963, _1055);
    float _1065 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1053);
    float _1067 = _1057 * 0.15915493667125701904296875;
    float _1069 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1069;
    float _1073 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1051);
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1075;
    float _1079 = fma(_741, _1029, _1065);
    float _1081 = fma(_1071, _753, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1083 = fma(_717, _1029, _1073);
    float _1085 = fma(_1077, _753, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1087 = _1063 * 0.15915493667125701904296875;
    float _1089 = _1037 * 6.283185482025146484375;
    float _1091 = sin(_1089);
    float _1093 = fma(_1081, _1007, _1083);
    float _1095 = fma(_1085, _1007, _1079);
    float _1097 = _493 * _185;
    float _1099 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _361);
    float _1101 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1093);
    float _1103 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1095);
    float _1105 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _339);
    float _1107 = _1037 * 6.283185482025146484375;
    float _1109 = cos(_1107);
    float _1111 = fma(_491, _183, _1097);
    float _1113 = _1101 * _1059;
    float _1115 = _1103 * _1061;
    float _1117 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1119 = fma(_495, _187, _1111);
    float _1121 = _1113 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1123 = _1115 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1125 = _1067 * 6.283185482025146484375;
    float _1127 = cos(_1125);
    float _1129 = _1119 + _577;
    float _1131 = _1121 * _1105;
    float _1133 = _1123 * _1099;
    float _1135 = in.m_59.w;
    float _1137 = _1067 * 6.283185482025146484375;
    float _1139 = sin(_1137);
    float _1141 = _1087 * 6.283185482025146484375;
    float _1143 = cos(_1141);
    float _1145 = _1127 * _1109;
    float _1147 = _1127 * _1091;
    float _1149 = _1087 * 6.283185482025146484375;
    float _1151 = sin(_1149);
    float _1153 = _1139 * _1091;
    float _1155 = _1139 * _1109;
    float _1157 = _1127 * _1143;
    float _1159 = _1091 * _1143;
    float _1161 = _1139 * _1143;
    float _1163 = _1109 * _1143;
    float _1165 = _1157 * _1133;
    float _1167 = fma(_1151, _1145, _1153);
    float _1169 = -_1133;
    float _1171 = _1151 * _1169;
    float _1173 = -_1155;
    float _1175 = fma(_1151, _1147, _1173);
    float _1177 = fma(_1151, _1153, _1145);
    float _1179 = fma(_1167, _1131, _1165);
    float _1181 = -_1147;
    float _1183 = fma(_1151, _1155, _1181);
    float _1185 = _1161 * _1133;
    float _1187 = fma(_1163, _1131, _1171);
    float _1189 = fma(_1175, _1117, _1179);
    float _1191 = _493 * _179;
    float _1193 = fma(_1183, _1131, _1185);
    float _1195 = fma(_1159, _1117, _1187);
    float _1197 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1199 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1201 = fma(_1177, _1117, _1193);
    float _1203 = fma(_491, _177, _1191);
    float _1205 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1197);
    float _1207 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1199);
    float _1209 = in.m_57.w;
    float _1211 = fma(_495, _181, _1203);
    float _1213 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1205);
    float _1215 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1207);
    float _1217 = _493 * _171;
    float _1219 = _1211 + _1135;
    float _1221 = _1213 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1223 = _1215 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1225 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1227 = fma(_491, _169, _1217);
    float _1229 = _1129 + _1221;
    float _1231 = _1219 + _1223;
    float _1233 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1225);
    float _1235 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1237 = _1229 + _1235;
    float _1239 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1241 = _1231 + _1239;
    float _1243 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1233);
    float _1245 = _1237 * _1237;
    float _1247 = _1243 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1249 = fma(_1241, _1241, _1245);
    float _1251 = fma(_495, _173, _1227);
    float _1253 = sqrt(_1249);
    float _1255 = _1251 + _1209;
    float _1257 = _1255 + _1247;
    bool _1259 = _1253 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1263 = _1261 != 0;
    int _1265 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1267 = _1265 != 0;
    int _1269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1271 = _1269 != 0;
    int _1273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1275 = _1273 != 0;
    bool _1277 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1279 = isnan(0.5);
    bool _1281 = _1277 || _1279;
    bool _1283 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1285 = _1281 || _1283;
    bool _1287 = !_1267;
    int _1289 = _1287 ? 0 : 1;
    bool _1291 = !_1263;
    int _1293 = _1291 ? 0 : 1;
    bool _1295 = !_1271;
    int _1297 = _1295 ? 0 : 1;
    bool _1299 = !_1275;
    int _1301 = _1299 ? 0 : 1;
    float _1303 = _1247;
    float _1305 = _1249;
    float _1307 = _1241;
    float _1309 = _1237;
    float _1311 = _1201;
    float _1313 = _1209;
    if (!_1259)
    {
        _501 = _1231;
    }
    float _1315 = _501;
    float _1317 = _1315;
    if (!_1259)
    {
        _247 = _1229;
    }
    float _1319 = _247;
    float _1321 = _1319;
    if (!_1259)
    {
        _1303 = _1257;
    }
    float _1323 = _1303;
    bool _1325 = !_1259;
    float _1327 = _1323;
    if (!_1325)
    {
        float _1329 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1331 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1333 = _1253 + _1331;
        float _1335 = _1257 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1337 = rsqrt(_1249);
        float _1339 = _1333 * _1329;
        float _1341 = _1339 * 0.15915493667125701904296875;
        float _1343 = _1341 * 6.283185482025146484375;
        float _1345 = cos(_1343);
        float _1347 = _1341 * 6.283185482025146484375;
        float _1349 = sin(_1347);
        float _1351 = _1345 + (-1.0);
        float _1353 = _1351 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1355 = fma(_1349, _1335, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1357 = fma(_1257, _1345, _1353);
        float _1359 = _1337 * _1355;
        float _1361 = fma(_1241, _1359, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1363 = fma(_1237, _1359, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1317 = _1361;
        _1327 = _1357;
        _1321 = _1363;
        _1305 = _1337;
    }
    float _1365 = _1317;
    float _1367 = _1327;
    float _1369 = _1321;
    float _1371 = _1305;
    float _1373 = _1371;
    if (_1285)
    {
        _1307 = _1365;
    }
    float _1375 = _1307;
    float _1377 = _1375;
    if (_1285)
    {
        _1309 = _1367;
    }
    float _1379 = _1309;
    float _1381 = _1379;
    if (_1285)
    {
        _1373 = _1369;
    }
    float _1383 = _1373;
    float _1385 = _1383;
    if (!_1285)
    {
        float _1387 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1389 = _1255 + _1387;
        float _1391 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1393 = _1219 + _1391;
        float _1395 = -_1219;
        float _1397 = _1395 + _1365;
        float _1399 = -_1255;
        float _1401 = _1399 + _1367;
        float _1403 = _1389 * _1389;
        float _1405 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1407 = _1129 + _1405;
        float _1409 = -_1129;
        float _1411 = _1409 + _1369;
        float _1413 = fma(_1393, _1393, _1403);
        float _1415 = fma(_1407, _1407, _1413);
        float _1417 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1419 = sqrt(_1415);
        float _1421 = precise::min(_1419, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1423 = _1421 * _1417;
        float _1425 = fma(_1397, _1423, _1219);
        float _1427 = fma(_1401, _1423, _1255);
        float _1429 = fma(_1411, _1423, _1129);
        _1381 = _1427;
        _1377 = _1425;
        _1385 = _1429;
    }
    float _1431 = _1381;
    float _1433 = _1377;
    float _1435 = _1385;
    float _1437 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1439 = _1431 + _1437;
    float _1441 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1443 = _1433 + _1441;
    float _1445 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1447 = _1435 + _1445;
    float _1449 = _1439 * _1439;
    float _1451 = fma(_1443, _1443, _1449);
    float _1453 = fma(_1447, _1447, _1451);
    float _1455 = rsqrt(_1453);
    float _1457 = sqrt(_1453);
    float _1459 = _1455 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1461 = _1443 * _1459;
    float _1463 = _1447 * _1459;
    float _1465 = _1461 * _1461;
    float _1467 = _1463 * _1463;
    float _1469 = _1465 + _1467;
    float _1471 = sqrt(_1469);
    bool _1473 = _1471 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1475 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1477 = _1471 + _1475;
    float _1479 = _1451;
    float _1481 = _1469;
    float _1483 = _1477;
    float _1485 = _1439;
    float _1487 = _1461;
    float _1489 = _1463;
    float _1491 = _1467;
    if (_1473)
    {
        float _1493 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1479 = _1493;
    }
    float _1495 = _1479;
    if (_1473)
    {
        float _1497 = rsqrt(_1469);
        _1481 = _1497;
    }
    float _1499 = _1481;
    if (_1473)
    {
        float _1501 = _1477 * _1495;
        _1483 = _1501;
    }
    float _1503 = _1483;
    if (_1473)
    {
        float _1505 = _1503 * 0.15915493667125701904296875;
        _1311 = _1505;
    }
    float _1507 = _1311;
    float _1509 = _1257;
    if (_1473)
    {
        float _1511 = _1507 * 6.283185482025146484375;
        float _1513 = sin(_1511);
        _1509 = _1513;
    }
    float _1515 = _1509;
    float _1517 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1519 = precise::max(0.0, _1517);
    float _1521 = _1495;
    float _1523 = _1519;
    if (_1473)
    {
        float _1525 = _1507 * 6.283185482025146484375;
        float _1527 = cos(_1525);
        _1521 = _1527;
    }
    float _1529 = _1521;
    float _1531 = -_1459;
    float _1533 = -_1519;
    float _1535 = fma(_1439, _1531, _1533);
    if (_1473)
    {
        float _1537 = _1535 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1485 = _1537;
    }
    float _1539 = _1485;
    float _1541 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1543 = fma(_1457, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1541);
    float _1545 = precise::clamp(_1543, 0.0, 1.0);
    float _1547 = _1515;
    float _1549 = _1539;
    if (_1473)
    {
        float _1551 = fma(_1515, _1539, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1547 = _1551;
    }
    float _1553 = _1547;
    float _1555 = _1553;
    if (!_1473)
    {
        _1549 = _1535;
    }
    float _1557 = _1549;
    float _1559 = -_1545;
    float _1561 = _1559 + 1.0;
    float _1563 = _1557;
    if (_1473)
    {
        float _1565 = _1529 + (-1.0);
        _1523 = _1565;
    }
    float _1567 = _1523;
    float _1569 = _1567;
    if (_1473)
    {
        float _1571 = _1499 * _1553;
        _1313 = _1571;
    }
    float _1573 = _1313;
    float _1575 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1473)
    {
        float _1577 = _1567 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1555 = _1577;
    }
    float _1579 = _1555;
    if (_1473)
    {
        float _1581 = _1461 * _1573;
        _1487 = _1581;
    }
    float _1583 = _1487;
    if (!_1473)
    {
        _1569 = _1465;
    }
    float _1585 = _1569;
    float _1587 = _1585;
    if (_1473)
    {
        float _1589 = _1463 * _1573;
        _1489 = _1589;
    }
    float _1591 = _1489;
    if (_1473)
    {
        float _1593 = fma(_1535, _1529, _1579);
        _1563 = _1593;
    }
    float _1595 = _1563;
    if (_1473)
    {
        float _1597 = _1583 * _1583;
        _1587 = _1597;
    }
    float _1599 = _1587;
    float _1601 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1473)
    {
        float _1603 = _1591 * _1591;
        _1491 = _1603;
    }
    float _1605 = _1491;
    float _1607 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1575);
    float _1609 = fma(_1595, _1595, _1599);
    float _1611 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1601);
    float _1613 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1615 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1607);
    float _1617 = _1609 + _1605;
    float _1619 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1621 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1611);
    float _1623 = _1615 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1625 = abs(_1561);
    float _1627 = log2(_1625);
    float _1629 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1619);
    float _1631 = _1621 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1633 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1635 = _1623 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1637 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1629);
    float _1639 = _1623 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1641 = _1631 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1643 = rsqrt(_1617);
    float _1645 = _1637 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1647 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1633);
    float _1649 = -_1641;
    float _1651 = fma(_1649, _1613, 1.0);
    float _1653 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1639);
    float _1655 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1647);
    float _1657 = _1627 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1659 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1653);
    float _1661 = _1655 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1663 = log2(_1651);
    float _1665 = _1643 * _1583;
    float _1667 = _1643 * _1595;
    float _1669 = _1643 * _1591;
    float _1671 = exp2(_1657);
    float _1673 = _1665 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1675 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1659);
    float _1677 = -_1673;
    float _1679 = fma(_1667, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1677);
    float _1681 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1635);
    float _1683 = 1.0 / _1675;
    float _1685 = -_1669;
    float _1687 = fma(_1685, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1679);
    float _1689 = _1623 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1691 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1681);
    float _1693 = _1663 * 0.693147182464599609375;
    float _1695 = fma(_1687, -0.5, 0.5);
    float _1697 = fma(_1687, 0.5, 0.5);
    float _1699 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1689);
    float _1701 = _1667 + 1.0;
    float _1703 = _1693 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1705 = fma(_1697, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1707 = sqrt(_1695);
    float _1709 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1699);
    float _1711 = fma(_1697, _1705, -0.212114393711090087890625);
    float _1713 = -_1667;
    float _1715 = fma(_1671, _1701, _1713);
    float _1717 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1709);
    float _1719 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1691);
    float _1721 = fma(_1697, _1711, 1.570728778839111328125);
    float _1723 = fma(_1715, 0.5, 0.5);
    float _1725 = _1717 * _1683;
    float _1727 = _1719 * _1683;
    float _1729 = fma(_1725, 0.5, 0.5);
    float _1731 = fma(_1727, -0.5, 0.5);
    float _1733 = _1707 * 0.636619746685028076171875;
    float _1735 = -_1721;
    float _1737 = fma(_1733, _1735, 1.0);
    float3 _5870 = float3(_1729, _1731, _1703);
    float _1739 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5870, float3(0.0), isnan(_5870)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5870, float3(0.0), isnan(_5870)), level(0.0)).x;
    float3 _5881 = float3(_1729, _1731, _1703);
    float4 _1742 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5881, float3(0.0), isnan(_5881)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5881, float3(0.0), isnan(_5881)), level(0.0)).xyzw;
    float _1744 = _1742.x;
    float _1746 = _1742.y;
    float _1748 = _1742.z;
    float _1750 = _1742.w;
    float2 _5898 = float2(_1737, _1723);
    float3 _1754 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5898, float2(0.0), isnan(_5898)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5898, float2(0.0), isnan(_5898)), level(0.0)).xyz;
    float _1756 = _1754.x;
    float _1758 = _1754.y;
    float _1760 = _1754.z;
    float _1762 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1764 = int(_1762);
    int _1766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1768 = _1766 != 0;
    float _1770 = -_959;
    float _1772 = _1770 + 1.0;
    bool _1774 = _161 > 0.5;
    float _1776 = -_773;
    float _1778 = _1776 + 1.0;
    bool _1780 = _149 > 0.5;
    float _1782 = -_955;
    float _1784 = _1782 + 1.0;
    int _1786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1788 = _1786 != 0;
    float _1790 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1792 = int(_1790);
    bool _1794 = _153 > 0.5;
    float _1796 = -_835;
    float _1798 = _1796 + 1.0;
    int _1800 = abs(_745);
    out.m_70.x = _1219;
    out.m_70.y = _1255;
    out.m_70.z = _1129;
    int _1802 = abs(_1293);
    float _1804 = _1627 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1806 = 0.0;
    if (_1768)
    {
        _1806 = _149;
    }
    float _1808 = _1806;
    float _1810 = trunc(_889);
    int _1812 = int(_1810);
    float _1814 = float(uint(_1764));
    out.m_72.x = _1433;
    out.m_72.y = _1431;
    out.m_72.z = _1435;
    float _1816 = _1808;
    float _1818 = _1814;
    if (!_1768)
    {
        _1816 = _153;
    }
    float _1820 = _1816;
    int _1822 = ~_1764;
    int _1824 = _1822 + 1;
    int _1826 = abs(_1297);
    float _1828 = 1.0 / _1814;
    float _1830 = float(uint(_1792));
    float _1832 = _1175 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1834 = 1.0 / _1830;
    float _1836 = trunc(_915);
    int _1838 = int(_1836);
    int _1840 = as_type<int>(_1828) + (-2);
    float _1842 = float(uint(_1812));
    if (_1768)
    {
        _1818 = 1.0;
    }
    float _1844 = _1818;
    float _1846 = _1844;
    if (!_1768)
    {
        _1846 = 1.2345600128173828125;
    }
    float _1848 = _1846;
    float _1850 = as_type<float>(_1840) * _1842;
    int _1852 = as_type<int>(_1834) + (-2);
    float _1854 = exp2(_1804);
    int _1856 = ~_1764;
    int _1858 = _1856 + 1;
    float _1860 = _1848 * _1820;
    int _1862 = ~_1792;
    int _1864 = _1862 + 1;
    float _1866 = float(uint(_1838));
    float _1868 = trunc(_1850);
    float _1870 = precise::max(_1868, 0.0);
    uint _1873 = uint(_1870);
    float _1875 = as_type<float>(_1852) * _1866;
    float _1877 = _1866;
    if (_1768)
    {
        _1877 = 1.0;
    }
    float _1879 = _1877;
    float _1881 = _1879;
    if (!_1768)
    {
        _1881 = 7.345489978790283203125;
    }
    float _1883 = _1881;
    float _1885 = floor(_1860);
    float _1887 = -_1854;
    float _1889 = _1887 + 1.0;
    float _1891 = _1883 * _149;
    float _1893 = float(_1812);
    float _1895 = trunc(_1875);
    float _1897 = precise::max(_1895, 0.0);
    uint _1899 = uint(_1897);
    int _1901 = _1858 * int(_1873);
    int _1903 = _1901 + _1812;
    float _1905 = float(uint(_1903));
    float _1907 = floor(_1891);
    float _1909 = -_1885;
    float _1911 = _1860 + _1909;
    float _1913 = float(_1792);
    float _1915 = as_type<float>(_1840) * _1905;
    int _1917 = _1864 * int(_1899);
    int _1919 = _1917 + _1838;
    float _1921 = trunc(_1915);
    float _1923 = precise::max(_1921, 0.0);
    uint _1925 = uint(_1923);
    float _1927 = float(uint(_1919));
    float _1929 = -_1907;
    float _1931 = _1891 + _1929;
    float _1933 = as_type<float>(_1852) * _1927;
    float _1935 = float(_1764);
    bool _1937 = _1893 >= _1935;
    bool _1939 = isnan(_1893);
    bool _1941 = _1937 || _1939;
    bool _1943 = isnan(_1935);
    bool _1945 = _1941 || _1943;
    float _1947 = float(_1945);
    float _1949 = trunc(_1933);
    float _1951 = precise::max(_1949, 0.0);
    uint _1953 = uint(_1951);
    int _1955 = int(_1873) + int(_1925);
    float _1957 = _1931 * _1935;
    int _1959 = ~_1792;
    int _1961 = _1959 + 1;
    float _1963 = _1911 * _1913;
    float _1965 = float(_1838);
    int _1967 = _1824 * _1955;
    int _1969 = _1967 + _1812;
    float _1971 = trunc(_1947);
    int _1973 = int(_1971);
    float _1975 = _1935 * _869;
    float _1977 = _1913 * _869;
    bool _1979 = uint(_1969) >= uint(_1764);
    int _1981 = int(_1899) + int(_1953);
    float _1983 = trunc(_1957);
    int _1985 = int(_1983);
    bool _1987 = !_1979;
    int _1989 = _1987 ? 0 : (-1);
    int _1991 = _1961 * _1981;
    int _1993 = _1991 + _1838;
    int _1995 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1997 = _1995 != 0;
    float _1999 = trunc(_1963);
    int _2001 = int(_1999);
    bool _2003 = uint(_1993) >= uint(_1792);
    int _2005 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2007 = _2005 != 0;
    bool _2009 = _1965 >= _1913;
    bool _2011 = isnan(_1965);
    bool _2013 = _2009 || _2011;
    bool _2015 = isnan(_1913);
    bool _2017 = _2013 || _2015;
    float _2019 = float(_2017);
    bool _2021 = !_2007;
    int _2023 = _2021 ? 0 : 1;
    float _2025 = trunc(_1975);
    int _2027 = int(_2025);
    int _2029 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2031 = _2029 != 0;
    int _2033 = ~_1955;
    int _2035 = _2033 + _1989;
    int _2037 = _2035 + 1;
    bool _2039 = !_2031;
    int _2041 = _2039 ? 0 : 1;
    bool _2043 = !_2003;
    int _2045 = _2043 ? 0 : (-1);
    float _2047 = trunc(_2019);
    int _2049 = int(_2047);
    int _2051 = abs(_2023);
    int _2053 = _1764 * _2037;
    int _2055 = _2053 + _1812;
    int _2057 = ~_1981;
    int _2059 = _2057 + _2045;
    int _2061 = _2059 + 1;
    int _2063 = abs(_2041);
    int _2065 = _1985 * _2051;
    int _2067 = _2065 + _1812;
    bool _2069 = _1764 == 0;
    int _2071 = _1792 * _2061;
    int _2073 = _2071 + _1838;
    float _2075 = trunc(_1977);
    int _2077 = int(_2075);
    int _2079 = ~_1973;
    int _2081 = _2079 + 1;
    int _2083 = _2081 + 1;
    bool _2085 = !_2069;
    int _2087 = _2085 ? _2055 : (-1);
    int _2089 = _2001 * _2063;
    int _2091 = _2089 + _1838;
    bool _2093 = _1792 == 0;
    int _2095 = ~_2049;
    int _2097 = _2095 + 1;
    int _2099 = _2097 + 1;
    int _2101 = _2087 * _2083;
    bool _2103 = !_2093;
    int _2105 = _2103 ? _2073 : (-1);
    int _2107 = _1764 + (-1);
    int _2109 = _1792 + (-1);
    int _2111 = _2105 * _2099;
    int _2113 = _1973 * _2107;
    int _2115 = _2113 + _2101;
    int _2117 = abs(_751);
    int _2119 = _2049 * _2109;
    int _2121 = _2119 + _2111;
    float _2123 = in.m_53.w;
    int _2125 = abs(_1289);
    int _2127 = _2115 * _1800;
    int _2129 = abs(_757);
    int _2131 = _2121 * _2125;
    float _2133 = float(uint(_2067));
    int _2135 = _2027 * _2117;
    int _2137 = _2135 + _2127;
    int _2139 = _2077 * _1802;
    int _2141 = _2139 + _2131;
    bool _2143 = !_1788;
    int _2145 = _2143 ? 0 : 1;
    float _2147 = as_type<float>(_1840) * _2133;
    int _2149 = _2067 * _2129;
    int _2151 = _2149 + _2137;
    float _2153 = -_339;
    int _2155 = _1780 ? as_type<int>(_2153) : as_type<int>(_339);
    int _2157 = abs(_2145);
    int _2159 = _2091 * _1826;
    int _2161 = _2159 + _2141;
    bool _2163 = !_1997;
    float _2165 = _2163 ? _339 : as_type<float>(_2155);
    float _2167 = trunc(_2147);
    float _2169 = precise::max(_2167, 0.0);
    uint _2171 = uint(_2169);
    int _2173 = abs(_1301);
    int _2175 = _1985 * _2157;
    int _2177 = _2175 + _2151;
    float _2179 = float(uint(_2091));
    float _2181 = _2165 + 0.5;
    bool _2183 = _2123 > 0.5;
    int _2185 = _2001 * _2173;
    int _2187 = _2185 + _2161;
    float _2189 = float(uint(_2177));
    float _2191 = as_type<float>(_1852) * _2179;
    float _2193 = fma(_2181, (*spvDescriptorSet0.vp_c9)._m0[80].x, _937);
    int _2195 = ~_1764;
    int _2197 = _2195 + 1;
    float _2199 = trunc(_2191);
    float _2201 = precise::max(_2199, 0.0);
    uint _2203 = uint(_2201);
    float _2205 = float(uint(_2187));
    float _2207 = as_type<float>(_1840) * _2189;
    float _2209 = -_1772;
    float _2211 = fma(_2165, _2209, _2193);
    int _2213 = ~_1792;
    int _2215 = _2213 + 1;
    float _2217 = as_type<float>(_1852) * _2205;
    int _2219 = ~_1792;
    int _2221 = _2219 + 1;
    float _2223 = trunc(_2207);
    float _2225 = precise::max(_2223, 0.0);
    uint _2227 = uint(_2225);
    int _2229 = _2197 * int(_2171);
    int _2231 = _2229 + _2067;
    int _2233 = ~_1764;
    int _2235 = _2233 + 1;
    int _2237 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2239 = _2237 != 0;
    float _2241 = float(uint(_2231));
    float _2243 = trunc(_2217);
    float _2245 = precise::max(_2243, 0.0);
    uint _2247 = uint(_2245);
    int _2249 = _2215 * int(_2203);
    int _2251 = _2249 + _2091;
    float _2253 = -_361;
    int _2255 = _1794 ? as_type<int>(_2253) : as_type<int>(_361);
    float _2257 = as_type<float>(_1840) * _2241;
    float _2259 = -_339;
    int _2261 = _1774 ? as_type<int>(_2259) : as_type<int>(_339);
    float _2263 = float(uint(_2251));
    int _2265 = _2235 * int(_2227);
    int _2267 = _2265 + _2177;
    int _2269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2271 = _2269 != 0;
    float _2273 = trunc(_2257);
    float _2275 = precise::max(_2273, 0.0);
    uint _2277 = uint(_2275);
    int _2279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2281 = _2279 != 0;
    float _2283 = as_type<float>(_1852) * _2263;
    float _2285 = float(uint(_2267));
    float _2287 = -_361;
    int _2289 = _2183 ? as_type<int>(_2287) : as_type<int>(_361);
    int _2291 = _2221 * int(_2247);
    int _2293 = _2291 + _2187;
    bool _2295 = !_2239;
    float _2297 = _2295 ? _339 : as_type<float>(_2261);
    float _2299 = as_type<float>(_1840) * _2285;
    bool _2301 = !_2271;
    float _2303 = _2301 ? _361 : as_type<float>(_2255);
    float _2305 = trunc(_2283);
    float _2307 = precise::max(_2305, 0.0);
    uint _2309 = uint(_2307);
    float _2311 = float(uint(_2293));
    float _2313 = _2297 + 0.5;
    bool _2315 = !_2281;
    float _2317 = _2315 ? _361 : as_type<float>(_2289);
    float _2319 = _2303 + (-0.5);
    int _2321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2323 = _2321 != 0;
    float _2325 = as_type<float>(_1852) * _2311;
    float _2327 = fma(_2313, (*spvDescriptorSet0.vp_c9)._m0[85].x, _841);
    float _2329 = trunc(_2299);
    float _2331 = precise::max(_2329, 0.0);
    uint _2333 = uint(_2331);
    float _2335 = _2317 + (-0.5);
    float _2337 = -_2319;
    float _2339 = -_747;
    float _2341 = fma(_2337, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2339);
    float _2343 = -_1778;
    float _2345 = fma(_2297, _2343, _2327);
    int _2347 = ~_1792;
    int _2349 = _2347 + 1;
    float _2351 = -_2335;
    float _2353 = -_957;
    float _2355 = fma(_2351, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2353);
    float _2357 = fma(_2303, _1784, _2341);
    float _2359 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2361 = trunc(_2325);
    float _2363 = precise::max(_2361, 0.0);
    uint _2365 = uint(_2363);
    float _2367 = fma(_2317, _1798, _2355);
    int _2369 = ~_1764;
    int _2371 = _2369 + 1;
    float _2373 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2377 = _2375 != 0;
    float _2379 = -_1151;
    float _2381 = fma(_2379, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2359);
    out.m_74.x = _2211;
    out.m_74.y = _2357;
    out.m_74.z = _2345;
    out.m_74.w = _2367;
    float _2383 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2385 = int(_2227) + int(_2333);
    int _2387 = int(_2203) + int(_2309);
    float _2389 = -_1151;
    float _2391 = fma(_2389, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2373);
    int _2393 = int(_2171) + int(_2277);
    float _2395 = -_1151;
    float _2397 = fma(_2395, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2383);
    float _2399 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2401 = int(_2247) + int(_2365);
    int _2403 = _2349 * _2387;
    int _2405 = _2403 + _2091;
    float _2407 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2391);
    float _2409 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2399);
    int _2411 = _2371 * _2385;
    int _2413 = _2411 + _2177;
    float _2415 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2381);
    int _2417 = _2349 * _2401;
    int _2419 = _2417 + _2187;
    float _2421 = _1175 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2423 = uint(_2405) >= uint(_1792);
    float _2425 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2427 = uint(_2413) >= uint(_1764);
    float _2429 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2431 = uint(_2419) >= uint(_1792);
    float _2433 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2397);
    bool _2435 = !_2427;
    int _2437 = _2435 ? 0 : (-1);
    float _2439 = _361 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2441 = !_2431;
    int _2443 = _2441 ? 0 : (-1);
    float _2445 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2425);
    int _2447 = ~_2385;
    int _2449 = _2447 + _2437;
    int _2451 = _2449 + 1;
    float _2453 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2429);
    int _2455 = ~_2401;
    int _2457 = _2455 + _2443;
    int _2459 = _2457 + 1;
    float _2461 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1832);
    float _2463 = _1175 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2465 = _1764 * _2451;
    int _2467 = _2465 + _2177;
    int _2469 = ~_1764;
    int _2471 = _2469 + 1;
    int _2473 = _1792 * _2459;
    int _2475 = _2473 + _2187;
    float _2477 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2463);
    float _2479 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2421);
    bool _2481 = !_2069;
    int _2483 = _2481 ? _2467 : (-1);
    float _2485 = _339 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2487 = !_2093;
    int _2489 = _2487 ? _2475 : (-1);
    float _2491 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2477);
    int _2493 = _2483 >> 31;
    int _2495 = _2471 * _2393;
    int _2497 = _2495 + _2067;
    int _2499 = _2489 >> 31;
    float _2501 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2461);
    int _2503 = _2493 & 3;
    float _2505 = fma(_1183, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2453);
    int _2507 = _2499 & 3;
    float _2509 = _2439 * _2415;
    int _2511 = _2483 + _2503;
    float _2513 = _2439 * _2407;
    int _2515 = _2489 + _2507;
    float _2517 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2479);
    int _2519 = _2511 >> 2;
    int _2521 = _2483 & 3;
    bool _2523 = _2521 != 0;
    int _2525 = _2515 >> 2;
    int _2527 = _2519 << 4;
    int _2529 = _2527 + 368;
    bool _2531 = uint(_2497) >= uint(_1764);
    float _2533 = fma(_1183, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2445);
    int _2535 = _2523 ? 0 : 1;
    uint _2537 = uint(int(uint(_2529) >> uint(2)));
    uint _2539 = uint(int(uint(int(_2537)) >> uint(2)));
    int _2541 = int(_2537) & 3;
    float _2543 = (*spvDescriptorSet0.vp_c9)._m0[int(_2539)][_2541];
    int _2545 = int(_2537) + 1;
    uint _2547 = uint(int(uint(_2545) >> uint(2)));
    int _2549 = _2545 & 3;
    float _2551 = (*spvDescriptorSet0.vp_c9)._m0[int(_2547)][_2549];
    int _2553 = _2483 & 3;
    bool _2555 = _2553 != 0;
    float _2557 = fma(_1183, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2409);
    int _2559 = _2525 << 4;
    int _2561 = _2559 + 512;
    float _2563 = fma(_2485, _2533, _2513);
    bool _2565 = !_2531;
    int _2567 = _2565 ? 0 : (-1);
    float _2569 = fma(_2485, _2557, _2509);
    bool _2571 = uint(_2553) >= 2u;
    uint _2573 = uint(int(uint(_2561) >> uint(2)));
    uint _2575 = uint(int(uint(int(_2573)) >> uint(2)));
    int _2577 = int(_2573) & 3;
    float _2579 = (*spvDescriptorSet0.vp_c9)._m0[int(_2575)][_2577];
    int _2581 = int(_2573) + 1;
    uint _2583 = uint(int(uint(_2581) >> uint(2)));
    int _2585 = _2581 & 3;
    float _2587 = (*spvDescriptorSet0.vp_c9)._m0[int(_2583)][_2585];
    bool _2589 = !_2423;
    int _2591 = _2589 ? 0 : (-1);
    out.m_76.x = _2533;
    out.m_76.y = _2557;
    out.m_76.z = _2505;
    bool _2593 = uint(_2553) > 1u;
    int _2595 = _2571 ? 0 : 1;
    bool _2597 = _2553 != 3;
    int _2599 = ~_2393;
    int _2601 = _2599 + _2567;
    int _2603 = _2601 + 1;
    int _2605 = _2529 + 8;
    uint _2607 = uint(int(uint(_2605) >> uint(2)));
    uint _2609 = uint(int(uint(int(_2607)) >> uint(2)));
    int _2611 = int(_2607) & 3;
    float _2613 = (*spvDescriptorSet0.vp_c9)._m0[int(_2609)][_2611];
    int _2615 = int(_2607) + 1;
    uint _2617 = uint(int(uint(_2615) >> uint(2)));
    int _2619 = _2615 & 3;
    float _2621 = (*spvDescriptorSet0.vp_c9)._m0[int(_2617)][_2619];
    int _2623 = ~_2535;
    int _2625 = _2623 + 1;
    int _2627 = _2625 + 1;
    float _2629 = _1623 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2631 = ~_2595;
    int _2633 = _2631 + 1;
    int _2635 = _2633 + 1;
    int _2637 = _1764 * _2603;
    int _2639 = _2637 + _2067;
    int _2641 = _2627;
    int _2643 = _2635;
    if (!_2593)
    {
        int _2645 = ~_2535;
        int _2647 = _2645 + 1;
        _2641 = _2647;
    }
    int _2649 = _2641;
    float _2651 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2629);
    int _2653 = _2489 & 3;
    bool _2655 = _2653 != 0;
    int _2657 = _2561 + 8;
    uint _2659 = uint(int(uint(_2657) >> uint(2)));
    uint _2661 = uint(int(uint(int(_2659)) >> uint(2)));
    int _2663 = int(_2659) & 3;
    float _2665 = (*spvDescriptorSet0.vp_c9)._m0[int(_2661)][_2663];
    int _2667 = int(_2659) + 1;
    uint _2669 = uint(int(uint(_2667) >> uint(2)));
    int _2671 = _2667 & 3;
    float _2673 = (*spvDescriptorSet0.vp_c9)._m0[int(_2669)][_2671];
    if (_2597)
    {
        int _2675 = ~_2595;
        int _2677 = _2675 + 1;
        _2643 = _2677;
    }
    int _2679 = _2643;
    float _2681 = _2439 * _2433;
    bool _2683 = uint(_2653) > 1u;
    float _2685 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2651);
    int _2687 = ~_2387;
    int _2689 = _2687 + _2591;
    int _2691 = _2689 + 1;
    float _2693 = fma(_2485, _2505, _2681);
    bool _2695 = !_2555;
    int _2697 = _2695 ? 0 : 1;
    float _2699 = fma(_2439, _2439, 1.0);
    int _2701 = _2489 & 3;
    bool _2703 = _2701 != 0;
    int _2705 = _1792 * _2691;
    int _2707 = _2705 + _2091;
    bool _2709 = !_2655;
    int _2711 = _2709 ? 0 : 1;
    int _2713 = _2703 ? 0 : 1;
    int _2715 = abs(_2697);
    int _2717 = ~_2713;
    int _2719 = _2717 + 1;
    int _2721 = _2719 + 1;
    int _2723 = _2721;
    if (!_2683)
    {
        int _2725 = ~_2713;
        int _2727 = _2725 + 1;
        _2723 = _2727;
    }
    int _2729 = _2723;
    int _2731 = abs(_2649);
    int _2733 = abs(_2729);
    bool _2735 = _2653 != 3;
    int _2737 = ~_2731;
    int _2739 = _2737 + 1;
    int _2741 = _2739 + 1;
    int _2743 = abs(_2711);
    int _2745 = _2741 * as_type<int>(_2551);
    bool _2747 = uint(_2653) >= 2u;
    int _2749 = abs(_2679);
    int _2751 = ~_2733;
    int _2753 = _2751 + 1;
    int _2755 = _2753 + 1;
    int _2757 = ~_2715;
    int _2759 = _2757 + 1;
    int _2761 = _2759 + 1;
    int _2763 = _2755 * as_type<int>(_2587);
    bool _2765 = _2553 != 3;
    int _2767 = _2747 ? 0 : 1;
    int _2769 = _2761 * as_type<int>(_2543);
    int _2771 = _2769 + _2745;
    int _2773 = ~_2743;
    int _2775 = _2773 + 1;
    int _2777 = _2775 + 1;
    int _2779 = ~_2749;
    int _2781 = _2779 + 1;
    int _2783 = _2781 + 1;
    int _2785 = ~_2767;
    int _2787 = _2785 + 1;
    int _2789 = _2787 + 1;
    int _2791 = _2777 * as_type<int>(_2579);
    int _2793 = _2791 + _2763;
    int _2795 = _2789;
    if (_2735)
    {
        int _2797 = ~_2767;
        int _2799 = _2797 + 1;
        _2795 = _2799;
    }
    int _2801 = _2795;
    int _2803 = _2783 * as_type<int>(_2613);
    int _2805 = _2803 + _2771;
    bool _2807 = !_2323;
    int _2809 = _2807 ? 0 : 1;
    float _2811 = rsqrt(_2699);
    bool _2813 = !_2765;
    int _2815 = _2813 ? 0 : (-1);
    int _2817 = abs(_2801);
    int _2819 = abs(_2809);
    int _2821 = abs(_2815);
    float _2823 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2685);
    int _2825 = ~_2821;
    int _2827 = _2825 + 1;
    int _2829 = _2827 + 1;
    int _2831 = ~_2817;
    int _2833 = _2831 + 1;
    int _2835 = _2833 + 1;
    bool _2837 = _2653 != 3;
    int _2839 = _2829 * as_type<int>(_2621);
    int _2841 = _2839 + _2805;
    bool _2843 = !_2069;
    int _2845 = _2843 ? _2639 : (-1);
    int _2847 = _2835 * as_type<int>(_2665);
    int _2849 = _2847 + _2793;
    int _2851 = ~_2819;
    int _2853 = _2851 + 1;
    int _2855 = _2853 + 1;
    float _2857 = _2439 * _2811;
    bool _2859 = !_2837;
    int _2861 = _2859 ? 0 : (-1);
    float _2863 = _2501 + _2569;
    bool _2865 = !_2377;
    int _2867 = _2865 ? 0 : 1;
    int _2869 = _2841 * _2855;
    int _2871 = abs(_2861);
    float _2873 = _2491 + _2563;
    int _2875 = abs(_2867);
    int _2877 = _2845 * _2819;
    int _2879 = _2877 + _2869;
    float _2881 = -_2491;
    float _2883 = _2857 * _2881;
    float _2885 = -_2501;
    float _2887 = _2857 * _2885;
    int _2889 = ~_2871;
    int _2891 = _2889 + 1;
    int _2893 = _2891 + 1;
    out.gl_Position.x = _1717;
    out.gl_Position.y = _1719;
    out.gl_Position.z = _2823;
    out.gl_Position.w = _1675;
    float _2895 = fma(_2811, _2407, _2883);
    float _2897 = fma(_2811, _2415, _2887);
    float _2899 = _1675 * 0.5;
    int _2901 = _2893 * as_type<int>(_2673);
    int _2903 = _2901 + _2849;
    int _2905 = ~_2875;
    int _2907 = _2905 + 1;
    int _2909 = _2907 + 1;
    float _2911 = _2823 + _1675;
    float _2913 = fma(_1719, -0.5, _2899);
    float _2915 = _1889 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2917 = !_2093;
    int _2919 = _2917 ? _2707 : (-1);
    int _2921 = _2903 * _2909;
    float _2923 = _1717 + _1675;
    float _2925 = _2915 * _1739;
    float _2927 = -_2915;
    float _2929 = _2927 + 1.0;
    int _2931 = _2919 * _2875;
    int _2933 = _2931 + _2921;
    float _2935 = _1750 * _2925;
    float _2937 = _1760 * _2925;
    float _2939 = _2911 * 0.5;
    float _2941 = _2923 * 0.5;
    float _2943 = float(_2879);
    float _2945 = _2517 + _2693;
    float _2947 = float(_2933);
    float _2949 = fma(_1756, _2935, _1744);
    float _2951 = fma(_1758, _2935, _1746);
    float _2953 = _1750 * _2929;
    float _2955 = fma(_1750, _2937, _1748);
    out.m_78.x = _2941;
    out.m_78.y = _2913;
    out.m_78.z = _2939;
    out.m_78.w = _1675;
    bool _2957 = _1457 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2959 = isnan(_1457);
    bool _2961 = _2957 || _2959;
    bool _2963 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2965 = _2961 || _2963;
    float _2967 = -_2517;
    float _2969 = _2857 * _2967;
    out.m_80.x = _2943;
    out.m_80.y = _2947;
    float _2971 = fma(_2811, _2433, _2969);
    out.m_82.x = _2949;
    out.m_82.y = _2951;
    out.m_82.z = _2955;
    out.m_82.w = _2953;
    out.m_84.x = _2873;
    out.m_84.y = _2863;
    out.m_84.z = _2945;
    float _2973 = as_type<float>(_2933);
    float _2975 = _2935;
    float _2977 = _2929;
    float _2979 = _2971;
    float _2981 = _2897;
    float _2983 = _2895;
    if (!_2965)
    {
        _2973 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2985 = _2973;
    out.m_86.x = _2895;
    out.m_86.y = _2897;
    out.m_86.z = _2971;
    float _2987 = _2985;
    float _2989 = _2985;
    if (!_2965)
    {
        _2975 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2991 = _2975;
    float _2993 = _2991;
    float _2995 = _2991;
    if (!_2965)
    {
        _2977 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2997 = _2977;
    float _2999 = _2997;
    float _3001 = _2997;
    if (!_2965)
    {
        _2979 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3003 = _2979;
    float _3005 = _3003;
    float _3007 = _3003;
    if (!_2965)
    {
        _2981 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3009 = _2981;
    float _3011 = _3009;
    float _3013 = _3009;
    if (!_2965)
    {
        _2983 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3015 = _2983;
    bool _3017 = !_2965;
    float _3019 = _3015;
    float _3021 = _3015;
    if (!_3017)
    {
        bool _3023 = _1457 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3025 = isnan(_1457);
        bool _3027 = _3023 || _3025;
        bool _3029 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3031 = _3027 || _3029;
        if (!_3031)
        {
            float _3033 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3035 = _1457 + _3033;
            float _3037 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3039 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3037;
            float _3041 = 1.0 / _3039;
            float _3043 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3045 = _3043 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3047 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3049 = _3047 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3051 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3053 = _3051 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3055 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3057 = _3055 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3059 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3061 = _3059 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3063 = _3035 * _3041;
            float _3065 = precise::clamp(_3063, 0.0, 1.0);
            float _3067 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3069 = _3067 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3071 = fma(_3065, _3045, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3073 = fma(_3065, _3069, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3075 = fma(_3065, _3049, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3077 = fma(_3065, _3053, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3079 = fma(_3065, _3057, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3081 = fma(_3065, _3061, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3007 = _3073;
            _2995 = _3079;
            _2989 = _3071;
            _3021 = _3077;
            _3013 = _3075;
            _3001 = _3081;
            _3083 = true;
        }
        else
        {
            bool _3085 = _1457 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3087 = isnan(_1457);
            bool _3089 = _3085 || _3087;
            bool _3091 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3093 = _3089 || _3091;
            if (!_3093)
            {
                _2987 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3095 = _2987;
            _2989 = _3095;
            if (!_3093)
            {
                _3005 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3097 = _3005;
            _3007 = _3097;
            if (!_3093)
            {
                _3011 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3099 = _3011;
            _3013 = _3099;
            if (!_3093)
            {
                _3019 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3101 = _3019;
            _3021 = _3101;
            if (!_3093)
            {
                _2993 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3103 = _2993;
            _2995 = _3103;
            if (!_3093)
            {
                _2999 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3105 = _2999;
            bool _3107 = !_3093;
            _3001 = _3105;
            if (!_3107)
            {
                bool _3109 = _1457 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3111 = isnan(_1457);
                bool _3113 = _3109 || _3111;
                bool _3115 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3117 = _3113 || _3115;
                if (!_3117)
                {
                    float _3119 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3121 = _1457 + _3119;
                    float _3123 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3125 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3123;
                    float _3127 = 1.0 / _3125;
                    float _3129 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3131 = _3129 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3133 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3135 = _3133 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3137 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3139 = _3137 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3141 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3143 = _3141 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3145 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3147 = _3145 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3149 = _3121 * _3127;
                    float _3151 = precise::clamp(_3149, 0.0, 1.0);
                    float _3153 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3155 = _3153 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3157 = fma(_3151, _3131, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3159 = fma(_3151, _3155, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3161 = fma(_3151, _3135, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3163 = fma(_3151, _3139, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3165 = fma(_3151, _3143, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3167 = fma(_3151, _3147, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3007 = _3159;
                    _2995 = _3165;
                    _2989 = _3157;
                    _3021 = _3163;
                    _3013 = _3161;
                    _3001 = _3167;
                    _3083 = true;
                }
                else
                {
                    _3007 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2995 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2989 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3021 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3013 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3001 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3083 = false;
    float _3169 = _3007;
    float _3171 = _2995;
    float _3173 = _2989;
    float _3175 = _3021;
    float _3177 = _3013;
    float _3179 = _3001;
    float _3181 = fma(_2863, -0.5, 0.5);
    float _3183 = precise::clamp(_3181, 0.0, 1.0);
    float _3185 = -_3169;
    float _3187 = _3185 + _3171;
    float _3189 = -_3173;
    float _3191 = _3189 + _3175;
    float _3193 = -_3177;
    float _3195 = _3193 + _3179;
    bool _3197 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3199 = fma(_3183, _3187, _3169);
    float _3201 = fma(_3183, _3191, _3173);
    float _3203 = fma(_3183, _3195, _3177);
    float _3205 = _3199 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _3207 = fma(_3201, 0.298911988735198974609375, _3205);
    float _3209 = fma(_3203, 0.114477999508380889892578125, _3207);
    out.m_88.x = 0.0;
    float _3211 = -_3209;
    float _3213 = _3201 + _3211;
    float _3215 = -_3209;
    float _3217 = _3199 + _3215;
    float _3219 = -_3209;
    float _3221 = _3203 + _3219;
    float _3223 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3225 = fma(_3213, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3209);
    float _3227 = fma(_3217, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3209);
    float _3229 = fma(_3221, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3209);
    out.m_90.w = _3223;
    out.m_92.x = _3225;
    out.m_92.y = _3227;
    out.m_92.z = _3229;
    if (!_3197)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3231 = -_1431;
    float _3233 = _3231 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3235 = -_1433;
    float _3237 = _3235 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3239 = -_1435;
    float _3241 = _3239 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3243 = _3233 * _3233;
    float _3245 = fma(_3237, _3237, _3243);
    float _3247 = fma(_3241, _3241, _3245);
    float _3249 = sqrt(_3247);
    float _3251 = rsqrt(_3247);
    float _3253 = -_3249;
    float _3255 = _3253 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3257 = _3255 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3259 = precise::clamp(_3257, 0.0, 1.0);
    float _3261 = _3237 * _3251;
    float _3263 = _3233 * _3251;
    float _3265 = abs(_3259);
    float _3267 = log2(_3265);
    float _3269 = _3241 * _3251;
    float _3271 = _3261 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3273 = _2863 * _3263;
    float _3275 = -_3263;
    float _3277 = -_3271;
    float _3279 = fma(_3275, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3277);
    float _3281 = fma(_2873, _3261, _3273);
    float _3283 = -_3269;
    float _3285 = fma(_3283, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3279);
    float _3287 = fma(_2945, _3269, _3281);
    float _3289 = precise::clamp(_3287, 0.0, 1.0);
    float _3291 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3293 = _3285 + _3291;
    float _3295 = _3267 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3297 = _3293 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3299 = precise::clamp(_3297, 0.0, 1.0);
    float _3301 = exp2(_3295);
    float _3303 = _3301 * _3299;
    float _3305 = _3289 * _3303;
    float _3307 = _3305 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3309 = _3305 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3311 = _3305 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_88.x = _3307;
    out.m_88.y = _3309;
    out.m_88.z = _3311;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

