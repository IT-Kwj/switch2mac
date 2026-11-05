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
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_60 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_66 [[user(locn2)]];
    float4 m_74 [[user(locn3)]];
    float4 m_86 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_68 [[user(locn6)]];
    float4 m_78 [[user(locn7)]];
    float4 m_76 [[user(locn8)]];
    float4 m_72 [[user(locn9)]];
    float4 m_84 [[user(locn10)]];
    float4 m_80 [[user(locn11)]];
    float4 m_82 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_70 [[attribute(0)]];
    float4 m_64 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_56 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4711 = false;
    bool _693 = false;
    bool _579 = false;
    bool _201 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_46.w;
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
        out.m_49.x = 0.0;
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
        float _5010 = as_type<float>(_121);
        out.gl_Position.z = _5010;
    }
    if (!_109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_51.w;
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
        out.m_49.x = 0.0;
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
        float _5080 = as_type<float>(_159);
        out.gl_Position.z = _5080;
    }
    if (_151)
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
        float _183 = in.m_56.x;
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
    float _213 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _217 = _215 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _221 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _225 = _223 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _227 = 1.0 / _213;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _229;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _235 = _233 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _237 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _239 = isnan(_209);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = 1.0 / _217;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _253 = _209 + _251;
    bool _255 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _257 = 1.0 / _221;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _261 = _209 + _259;
    float _263 = _253 * _227;
    bool _265 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _267 = isnan(_209);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    bool _277 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _279 = isnan(_209);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = 1.0 / _225;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _291;
    float _295 = _261 * _249;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _299 = _209 + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _303 = _209 + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _307 = _209 + _305;
    float _309 = 1.0 / _231;
    float _311 = _299 * _257;
    float _313 = -_275;
    float _315 = _313 + 1.0;
    float _317 = _287 * _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _319;
    float _323 = 1.0 / _293;
    float _325 = _303 * _289;
    bool _327 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _329 = isnan(_209);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _341 = _209 + _339;
    float _343 = fma(_321, _263, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _345 = 1.0 / _235;
    float _347 = _307 * _309;
    float _349 = -_287;
    float _351 = _349 + 1.0;
    bool _353 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _355 = isnan(_209);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = _341 * _323;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _369 = _209 + _367;
    float _371 = _337 * _351;
    float _373 = -_337;
    float _375 = _373 + 1.0;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _377;
    float _381 = _363 * _375;
    float _383 = _369 * _345;
    bool _385 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _387 = isnan(_209);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = -_363;
    float _399 = _397 + 1.0;
    float _401 = fma(_379, _263, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _403 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _405 = isnan(_209);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = -_395;
    float _417 = _415 + 1.0;
    float _419 = _395 * _399;
    bool _421 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _423 = isnan(_209);
    bool _425 = _421 || _423;
    bool _427 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _429 = _425 || _427;
    float _431 = float(_429);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _437 = _247 * _417;
    float _439 = -_247;
    float _441 = _439 + 1.0;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _443;
    float _447 = -_431;
    float _449 = _447 + 1.0;
    float _451 = fma(_435, _295, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _453 = _431 * _441;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _459 = _413 * _449;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _461;
    float _465 = fma(_445, _311, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _467 = fma(_457, _295, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _469 = _401 * _459;
    float _471 = _343 * _459;
    float _473 = fma(_463, _311, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _477 = _475 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _483 = -_413;
    float _485 = _483 + 1.0;
    float _487 = fma(_477, _325, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _489 = fma(_481, _325, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _491 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[143].x, _469);
    float _493 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[143].y, _471);
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _499;
    float _503 = fma(_451, _453, _491);
    float _505 = fma(_467, _453, _493);
    float _507 = fma(_497, _347, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _509 = fma(_501, _347, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _519 = fma(_473, _437, _503);
    float _521 = fma(_465, _437, _505);
    float _523 = fma(_513, _383, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _525 = fma(_517, _383, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _527 = fma(_487, _419, _519);
    float _529 = fma(_489, _419, _521);
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _535;
    float _539 = fma(_507, _381, _527);
    float _541 = fma(_509, _381, _529);
    float _543 = fma(_533, _365, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _545 = fma(_537, _365, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _547 = fma(_523, _371, _539);
    float _549 = fma(_525, _371, _541);
    float _551 = fma(_543, _317, _547);
    float _553 = fma(_545, _317, _549);
    float _555 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[150].x, _551);
    float _557 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[150].y, _553);
    bool _559 = !_255;
    float _577;
    if (!_559)
    {
        float _561 = in.m_56.x;
        float _563 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _565 = _561 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _567 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _569 = _567 * _563;
        float _571 = floor(_569);
        float _573 = -_571;
        float _575 = _569 + _573;
        _577 = _575;
        _579 = true;
    }
    else
    {
        float _581 = float(_105);
        float _583 = 1.0 / _581;
        float _585 = _139 * _583;
        _577 = _585;
    }
    _579 = false;
    float _587 = _577;
    bool _589 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _591 = isnan(_587);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _597 = _593 || _595;
    float _599 = float(_597);
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _605 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _607 = isnan(_587);
    bool _609 = _605 || _607;
    bool _611 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _613 = _609 || _611;
    float _615 = float(_613);
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _617;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _623 = _587 + _621;
    float _625 = -_599;
    float _627 = _625 + 1.0;
    bool _629 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _631 = 1.0 / _603;
    float _633 = _615 * _627;
    float _635 = -_615;
    float _637 = _635 + 1.0;
    float _639 = _619 * _631;
    float _641 = fma(_639, _623, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _643 = _641 * _633;
    float _645 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[115].x, _643);
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _653 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[116].x, _645);
    float _655 = _647 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _657 = _649 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _659 = _651 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _661 = _653 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _663 = in.m_58.x;
    float _665 = in.m_58.y;
    out.m_60.x = _655;
    out.m_60.y = _657;
    out.m_60.z = _659;
    out.m_60.w = _661;
    float _667 = _557 * _665;
    float _669 = _555 * _663;
    bool _671 = !_629;
    float _673 = _661;
    float _691;
    if (!_671)
    {
        float _675 = in.m_56.x;
        float _677 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _679 = _675 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _681 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[11].w, _139);
        float _683 = _681 * _677;
        float _685 = floor(_683);
        float _687 = -_685;
        float _689 = _683 + _687;
        _691 = _689;
        _693 = true;
    }
    else
    {
        float _695 = float(_105);
        float _697 = 1.0 / _695;
        float _699 = _139 * _697;
        _691 = _699;
    }
    _693 = false;
    float _701 = _691;
    float _703 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _705 = int(_703);
    float _707 = float(_105);
    float _709 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _711 = int(_709);
    float _713 = float(_705);
    float _715 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _717 = int(_715);
    float _719 = float(uint(_711));
    float _721 = 1.0 / _713;
    int _723 = ~_711;
    int _725 = _723 + 1;
    int _727 = ~_711;
    int _729 = _727 + 1;
    float _731 = float(_711);
    bool _733 = _711 == 0;
    float _735 = 1.0 / _719;
    float _737 = float(_717);
    float _739 = _721 * _139;
    float _741 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _743 = int(_741);
    int _745 = as_type<int>(_735) + (-2);
    float _747 = trunc(_739);
    int _749 = int(_747);
    float _751 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _753 = int(_751);
    float _755 = float(uint(_743));
    float _757 = float(uint(_749));
    float _759 = 1.0 / _737;
    float _761 = as_type<float>(_745) * _757;
    float _763 = trunc(_761);
    float _765 = precise::max(_763, 0.0);
    uint _768 = uint(_765);
    float _770 = 1.0 / _755;
    float _772 = float(_753);
    float _774 = _759 * _139;
    int _776 = _725 * int(_768);
    int _778 = _776 + _749;
    float _780 = 1.0 / _772;
    float _782 = float(uint(_778));
    float _784 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _786 = int(_784);
    float _788 = as_type<float>(_745) * _782;
    int _790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _792 = _790 != 0;
    float _794 = trunc(_788);
    float _796 = precise::max(_794, 0.0);
    uint _798 = uint(_796);
    float _800 = in.m_56.x;
    float _802 = in.m_56.y;
    float _804 = in.m_56.z;
    float _806 = in.m_56.w;
    float _808 = _780 * _139;
    float _810 = 1.0 / _707;
    float _812 = float(uint(_786));
    int _814 = 0;
    if (_792)
    {
        _814 = 0;
    }
    int _816 = _814;
    int _818 = 0;
    int _820 = _816;
    if (_792)
    {
        _818 = 0;
    }
    int _822 = _818;
    float _824 = 0.0;
    int _826 = _822;
    if (_792)
    {
        _824 = 1.0;
    }
    float _828 = _824;
    float _830 = trunc(_774);
    int _832 = int(_830);
    int _834 = int(_768) + int(_798);
    float _836 = _828;
    if (_792)
    {
        _673 = 1.0;
    }
    float _838 = _673;
    int _840 = _729 * _834;
    int _842 = _840 + _749;
    float _844 = trunc(_808);
    int _846 = int(_844);
    float _848 = as_type<float>(_729);
    float _850 = _838;
    if (_792)
    {
        float _852 = in.m_56.x;
        _848 = _852;
    }
    float _854 = _848;
    bool _856 = _802 > 0.5;
    bool _858 = uint(_842) >= uint(_711);
    float _860 = float(_749);
    float _862 = 1.0 / _812;
    bool _864 = _804 > 0.5;
    bool _866 = _860 >= _731;
    bool _868 = isnan(_860);
    bool _870 = _866 || _868;
    bool _872 = isnan(_731);
    bool _874 = _870 || _872;
    float _876 = float(_874);
    int _878 = as_type<int>(_770) + (-2);
    float _880 = trunc(_876);
    int _882 = int(_880);
    bool _884 = !_858;
    float _886 = _884 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    int _888 = ~_834;
    int _890 = _888 + as_type<int>(_886);
    int _892 = _890 + 1;
    float _894 = _886;
    if (_792)
    {
        _894 = 1.0;
    }
    float _896 = _894;
    float _898 = -_175;
    int _900 = _856 ? as_type<int>(_898) : as_type<int>(_175);
    float _902 = 0.0;
    float _904 = _896;
    float _906 = _854;
    if (_792)
    {
        _902 = _854;
    }
    float _908 = _902;
    float _910 = _908;
    if (!_792)
    {
        float _912 = in.m_56.z;
        float _914 = in.m_56.y;
        _904 = 7.345489978790283203125;
        _910 = _914;
        _836 = 1.2345600128173828125;
        _906 = _912;
        _850 = 5.839270114898681640625;
        _820 = 1;
        _826 = 2;
    }
    float _916 = _904;
    float _918 = _910;
    float _920 = _836;
    float _922 = _906;
    float _924 = _850;
    int _926 = _820;
    int _928 = _826;
    float _930 = _916 * _800;
    int _932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _934 = _932 != 0;
    int _936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _938 = _936 != 0;
    int _940 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _942 = _940 != 0;
    float _944 = _918 * _920;
    float _946 = -_179;
    int _948 = _864 ? as_type<int>(_946) : as_type<int>(_179);
    float _950 = floor(_930);
    float _952 = float(uint(_832));
    float _954 = _810 * _139;
    int _956 = as_type<int>(_862) + (-2);
    int _958 = _711 * _892;
    int _960 = _958 + _749;
    bool _962 = !_938;
    float _964 = _962 ? _175 : as_type<float>(_900);
    float _966 = as_type<float>(_878) * _952;
    bool _968 = !_942;
    float _970 = _968 ? _179 : as_type<float>(_948);
    float _972 = _922 * _924;
    int _974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _976 = _974 != 0;
    int _978 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _980 = _978 != 0;
    int _982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _984 = _982 != 0;
    float _986 = trunc(_966);
    float _988 = precise::max(_986, 0.0);
    uint _990 = uint(_988);
    int _992 = ~_882;
    int _994 = _992 + 1;
    int _996 = _994 + 1;
    float _998 = _802 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1000 = !_733;
    int _1002 = _1000 ? _960 : (-1);
    bool _1004 = !_980;
    int _1006 = _1004 ? 0 : 1;
    float _1008 = -_950;
    float _1010 = _930 + _1008;
    int _1012 = _711 + (-1);
    int _1014 = _1002 * _996;
    int _1016 = abs(_1006);
    float _1018 = _1010 * _731;
    float _1020 = float(uint(_846));
    int _1022 = _882 * _1012;
    int _1024 = _1022 + _1014;
    int _1026 = ~_743;
    int _1028 = _1026 + 1;
    float _1030 = as_type<float>(_956) * _1020;
    int _1032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1034 = _1032 != 0;
    int _1036 = _1024 * _1016;
    float _1038 = _731 * _954;
    float _1040 = trunc(_1030);
    float _1042 = precise::max(_1040, 0.0);
    uint _1044 = uint(_1042);
    bool _1046 = !_1034;
    int _1048 = _1046 ? 0 : 1;
    int _1050 = _1028 * int(_990);
    int _1052 = _1050 + _832;
    int _1054 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1056 = _1054 != 0;
    int _1058 = abs(_1048);
    float _1060 = trunc(_1018);
    int _1062 = int(_1060);
    float _1064 = float(uint(_1052));
    bool _1066 = !_976;
    int _1068 = _1066 ? 0 : 1;
    bool _1070 = !_984;
    int _1072 = _1070 ? 0 : 1;
    float _1074 = as_type<float>(_878) * _1064;
    int _1076 = abs(_1068);
    float _1078 = trunc(_1038);
    int _1080 = int(_1078);
    int _1082 = ~_786;
    int _1084 = _1082 + 1;
    bool _1086 = !_1056;
    int _1088 = _1086 ? 0 : 1;
    int _1090 = abs(_1072);
    int _1092 = _1062 * _1058;
    int _1094 = _1092 + _749;
    int _1096 = _1084 * int(_1044);
    int _1098 = _1096 + _846;
    int _1100 = abs(_1088);
    float _1102 = trunc(_1074);
    float _1104 = precise::max(_1102, 0.0);
    uint _1106 = uint(_1104);
    bool _1108 = _806 > 0.5;
    float _1110 = float(_832);
    int _1112 = _1080 * _1076;
    int _1114 = _1112 + _1036;
    float _1116 = float(uint(_1098));
    int _1118 = _1094 * _1090;
    int _1120 = _1118 + _1114;
    float _1122 = floor(_944);
    int _1124 = ~_743;
    int _1126 = _1124 + 1;
    int _1128 = _1062 * _1100;
    int _1130 = _1128 + _1120;
    float _1132 = as_type<float>(_956) * _1116;
    int _1134 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1136 = _1134 != 0;
    int _1138 = int(_990) + int(_1106);
    float _1140 = trunc(_1132);
    float _1142 = precise::max(_1140, 0.0);
    uint _1144 = uint(_1142);
    float _1146 = float(uint(_1130));
    float _1148 = -_179;
    int _1150 = _1108 ? as_type<int>(_1148) : as_type<int>(_179);
    int _1152 = _1126 * _1138;
    int _1154 = _1152 + _832;
    int _1156 = ~_786;
    int _1158 = _1156 + 1;
    float _1160 = as_type<float>(_745) * _1146;
    float _1162 = float(_743);
    float _1164 = -_1122;
    float _1166 = _944 + _1164;
    bool _1168 = uint(_1154) >= uint(_743);
    float _1170 = floor(_972);
    bool _1172 = _1110 >= _1162;
    bool _1174 = isnan(_1110);
    bool _1176 = _1172 || _1174;
    bool _1178 = isnan(_1162);
    bool _1180 = _1176 || _1178;
    float _1182 = float(_1180);
    int _1184 = ~_711;
    int _1186 = _1184 + 1;
    bool _1188 = !_1136;
    int _1190 = _1188 ? 0 : 1;
    int _1192 = int(_1044) + int(_1144);
    float _1194 = trunc(_1160);
    float _1196 = precise::max(_1194, 0.0);
    uint _1198 = uint(_1196);
    bool _1200 = !_934;
    float _1202 = _1200 ? _179 : as_type<float>(_1150);
    float _1204 = _1166 * _1162;
    bool _1206 = !_1168;
    int _1208 = _1206 ? 0 : (-1);
    int _1210 = _1158 * _1192;
    int _1212 = _1210 + _846;
    int _1214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1216 = _1214 != 0;
    int _1218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1220 = _1218 != 0;
    int _1222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1224 = _1222 != 0;
    int _1226 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1228 = _1226 != 0;
    float _1230 = _1162 * _954;
    int _1232 = ~_1138;
    int _1234 = _1232 + _1208;
    int _1236 = _1234 + 1;
    float _1238 = trunc(_1182);
    int _1240 = int(_1238);
    float _1242 = -_1170;
    float _1244 = _972 + _1242;
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1248 = _1186 * int(_1198);
    int _1250 = _1248 + _1130;
    bool _1252 = !_1220;
    int _1254 = _1252 ? 0 : 1;
    float _1256 = trunc(_1230);
    int _1258 = int(_1256);
    bool _1260 = uint(_1212) >= uint(_786);
    int _1262 = _743 * _1236;
    int _1264 = _1262 + _832;
    float _1266 = float(uint(_1250));
    bool _1268 = !_1260;
    int _1270 = _1268 ? 0 : (-1);
    bool _1272 = _743 == 0;
    float _1274 = as_type<float>(_745) * _1266;
    int _1276 = ~_1240;
    int _1278 = _1276 + 1;
    int _1280 = _1278 + 1;
    float _1282 = trunc(_1204);
    int _1284 = int(_1282);
    bool _1286 = !_1272;
    int _1288 = _1286 ? _1264 : (-1);
    int _1290 = abs(_1190);
    int _1292 = _743 + (-1);
    int _1294 = _1288 * _1280;
    int _1296 = abs(_1254);
    float _1298 = trunc(_1274);
    float _1300 = precise::max(_1298, 0.0);
    uint _1302 = uint(_1300);
    int _1304 = ~_1192;
    int _1306 = _1304 + _1270;
    int _1308 = _1306 + 1;
    int _1310 = _1240 * _1292;
    int _1312 = _1310 + _1294;
    bool _1314 = !_1216;
    int _1316 = _1314 ? 0 : 1;
    float _1318 = float(_786);
    int _1320 = abs(_1316);
    int _1322 = _1284 * _1290;
    int _1324 = _1322 + _832;
    float _1326 = _1244 * _1318;
    float _1328 = float(_846);
    float _1330 = _1318 * _954;
    int _1332 = ~_711;
    int _1334 = _1332 + 1;
    int _1336 = _1312 * _1296;
    bool _1338 = !_1224;
    int _1340 = _1338 ? 0 : 1;
    int _1342 = int(_1198) + int(_1302);
    int _1344 = _1258 * _1320;
    int _1346 = _1344 + _1336;
    int _1348 = ~_711;
    int _1350 = _1348 + 1;
    int _1352 = abs(_1340);
    bool _1354 = !_1228;
    int _1356 = _1354 ? 0 : 1;
    int _1358 = _1350 * _1342;
    int _1360 = _1358 + _1130;
    bool _1362 = _1328 >= _1318;
    bool _1364 = isnan(_1328);
    bool _1366 = _1362 || _1364;
    bool _1368 = isnan(_1318);
    bool _1370 = _1366 || _1368;
    float _1372 = float(_1370);
    int _1374 = _1324 * _1352;
    int _1376 = _1374 + _1346;
    float _1378 = float(uint(_1094));
    bool _1380 = uint(_1360) >= uint(_711);
    int _1382 = abs(_1356);
    float _1384 = trunc(_1372);
    int _1386 = int(_1384);
    float _1388 = as_type<float>(_745) * _1378;
    bool _1390 = !_1380;
    int _1392 = _1390 ? 0 : (-1);
    int _1394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1396 = _1394 != 0;
    int _1398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1400 = _1398 != 0;
    int _1402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1404 = _1402 != 0;
    int _1406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1408 = _1406 != 0;
    int _1410 = _1284 * _1382;
    int _1412 = _1410 + _1376;
    float _1414 = trunc(_1388);
    float _1416 = precise::max(_1414, 0.0);
    uint _1418 = uint(_1416);
    int _1420 = _786 * _1308;
    int _1422 = _1420 + _846;
    bool _1424 = !_1408;
    int _1426 = _1424 ? 0 : 1;
    bool _1428 = _786 == 0;
    int _1430 = abs(_1426);
    float _1432 = trunc(_1326);
    int _1434 = int(_1432);
    int _1436 = ~_1386;
    int _1438 = _1436 + 1;
    int _1440 = _1438 + 1;
    bool _1442 = !_1428;
    int _1444 = _1442 ? _1422 : (-1);
    bool _1446 = !_1400;
    int _1448 = _1446 ? 0 : 1;
    int _1450 = ~_1342;
    int _1452 = _1450 + _1392;
    int _1454 = _1452 + 1;
    int _1456 = _1444 * _1440;
    float _1458 = float(uint(_1412));
    int _1460 = _1334 * int(_1418);
    int _1462 = _1460 + _1094;
    int _1464 = _786 + (-1);
    int _1466 = _711 * _1454;
    int _1468 = _1466 + _1130;
    int _1470 = abs(_1448);
    float _1472 = as_type<float>(_878) * _1458;
    float _1474 = float(uint(_1462));
    int _1476 = _1386 * _1464;
    int _1478 = _1476 + _1456;
    int _1480 = ~_743;
    int _1482 = _1480 + 1;
    bool _1484 = _711 == 0;
    float _1486 = trunc(_1472);
    float _1488 = precise::max(_1486, 0.0);
    uint _1490 = uint(_1488);
    float _1492 = as_type<float>(_745) * _1474;
    int _1494 = _1478 * _1470;
    bool _1496 = !_1396;
    int _1498 = _1496 ? 0 : 1;
    bool _1500 = !_1484;
    int _1502 = _1500 ? _1468 : (-1);
    float _1504 = trunc(_1330);
    int _1506 = int(_1504);
    int _1508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1510 = _1508 != 0;
    int _1512 = _1434 * _1430;
    int _1514 = _1512 + _846;
    int _1516 = abs(_1498);
    int _1518 = _1502 & 3;
    bool _1520 = _1518 != 0;
    int _1522 = _1482 * int(_1490);
    int _1524 = _1522 + _1412;
    float _1526 = trunc(_1492);
    float _1528 = precise::max(_1526, 0.0);
    uint _1530 = uint(_1528);
    bool _1532 = !_1404;
    int _1534 = _1532 ? 0 : 1;
    int _1536 = _1520 ? 0 : 1;
    float _1538 = float(uint(_1524));
    bool _1540 = !_1510;
    int _1542 = _1540 ? 0 : 1;
    int _1544 = _1502 & 3;
    bool _1546 = _1544 != 0;
    float _1548 = as_type<float>(_878) * _1538;
    int _1550 = abs(_1534);
    bool _1552 = uint(_1544) > 1u;
    float _1554 = trunc(_1548);
    float _1556 = precise::max(_1554, 0.0);
    uint _1558 = uint(_1556);
    int _1560 = abs(_1542);
    int _1562 = _1506 * _1516;
    int _1564 = _1562 + _1494;
    int _1566 = int(_1418) + int(_1530);
    int _1568 = _1514 * _1550;
    int _1570 = _1568 + _1564;
    int _1572 = ~_711;
    int _1574 = _1572 + 1;
    int _1576 = ~_1536;
    int _1578 = _1576 + 1;
    int _1580 = _1578 + 1;
    int _1582 = _1434 * _1560;
    int _1584 = _1582 + _1570;
    int _1586 = _1580;
    if (!_1552)
    {
        int _1588 = ~_1536;
        int _1590 = _1588 + 1;
        _1586 = _1590;
    }
    int _1592 = _1586;
    int _1594 = _1574 * _1566;
    int _1596 = _1594 + _1094;
    bool _1598 = uint(_1544) >= 2u;
    float _1600 = float(uint(_1584));
    int _1602 = ~_743;
    int _1604 = _1602 + 1;
    int _1606 = int(_1490) + int(_1558);
    float _1608 = as_type<float>(_956) * _1600;
    int _1610 = _1598 ? 0 : 1;
    bool _1612 = uint(_1596) >= uint(_711);
    int _1614 = _1604 * _1606;
    int _1616 = _1614 + _1412;
    float _1618 = float(uint(_1324));
    float _1620 = trunc(_1608);
    float _1622 = precise::max(_1620, 0.0);
    uint _1624 = uint(_1622);
    bool _1626 = !_1612;
    int _1628 = _1626 ? 0 : (-1);
    bool _1630 = uint(_1616) >= uint(_743);
    float _1632 = as_type<float>(_878) * _1618;
    int _1634 = ~_1566;
    int _1636 = _1634 + _1628;
    int _1638 = _1636 + 1;
    bool _1640 = !_1630;
    int _1642 = _1640 ? 0 : (-1);
    float _1644 = trunc(_1632);
    float _1646 = precise::max(_1644, 0.0);
    uint _1648 = uint(_1646);
    int _1650 = ~_786;
    int _1652 = _1650 + 1;
    int _1654 = _711 * _1638;
    int _1656 = _1654 + _1094;
    bool _1658 = _1544 != 3;
    int _1660 = ~_1606;
    int _1662 = _1660 + _1642;
    int _1664 = _1662 + 1;
    float _1666 = float(uint(_1514));
    int _1668 = _1652 * int(_1624);
    int _1670 = _1668 + _1584;
    int _1672 = ~_743;
    int _1674 = _1672 + 1;
    int _1676 = _743 * _1664;
    int _1678 = _1676 + _1412;
    int _1680 = ~_1610;
    int _1682 = _1680 + 1;
    int _1684 = _1682 + 1;
    float _1686 = as_type<float>(_956) * _1666;
    float _1688 = float(uint(_1670));
    int _1690 = _1684;
    if (_1658)
    {
        int _1692 = ~_1610;
        int _1694 = _1692 + 1;
        _1690 = _1694;
    }
    int _1696 = _1690;
    float _1698 = trunc(_1686);
    float _1700 = precise::max(_1698, 0.0);
    uint _1702 = uint(_1700);
    int _1704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1706 = _1704 != 0;
    float _1708 = as_type<float>(_956) * _1688;
    bool _1710 = !_1272;
    int _1712 = _1710 ? _1678 : (-1);
    bool _1714 = !_1706;
    int _1716 = _1714 ? 0 : 1;
    int _1718 = _1674 * int(_1648);
    int _1720 = _1718 + _1324;
    int _1722 = _1712 & 3;
    bool _1724 = _1722 != 0;
    float _1726 = trunc(_1708);
    float _1728 = precise::max(_1726, 0.0);
    uint _1730 = uint(_1728);
    int _1732 = _1712 & 3;
    bool _1734 = _1732 != 0;
    bool _1736 = !_1484;
    int _1738 = _1736 ? _1656 : (-1);
    int _1740 = _1724 ? 0 : 1;
    bool _1742 = uint(_1732) > 1u;
    float _1744 = float(uint(_1720));
    int _1746 = ~_786;
    int _1748 = _1746 + 1;
    int _1750 = ~_1740;
    int _1752 = _1750 + 1;
    int _1754 = _1752 + 1;
    float _1756 = as_type<float>(_878) * _1744;
    int _1758 = ~_786;
    int _1760 = _1758 + 1;
    float _1762 = trunc(_1756);
    float _1764 = precise::max(_1762, 0.0);
    uint _1766 = uint(_1764);
    int _1768 = int(_1624) + int(_1730);
    int _1770 = _1748 * int(_1702);
    int _1772 = _1770 + _1514;
    int _1774 = _1754;
    if (!_1742)
    {
        int _1776 = ~_1740;
        int _1778 = _1776 + 1;
        _1774 = _1778;
    }
    int _1780 = _1774;
    bool _1782 = uint(_1732) >= 2u;
    float _1784 = float(uint(_1772));
    int _1786 = _1782 ? 0 : 1;
    bool _1788 = _1732 != 3;
    float _1790 = as_type<float>(_956) * _1784;
    int _1792 = _1760 * _1768;
    int _1794 = _1792 + _1584;
    int _1796 = ~_743;
    int _1798 = _1796 + 1;
    int _1800 = ~_1786;
    int _1802 = _1800 + 1;
    int _1804 = _1802 + 1;
    int _1806 = int(_1648) + int(_1766);
    float _1808 = trunc(_1790);
    float _1810 = precise::max(_1808, 0.0);
    uint _1812 = uint(_1810);
    bool _1814 = !_1734;
    int _1816 = _1814 ? 0 : 1;
    int _1818 = _1804;
    if (_1788)
    {
        int _1820 = ~_1786;
        int _1822 = _1820 + 1;
        _1818 = _1822;
    }
    int _1824 = _1818;
    int _1826 = _1798 * _1806;
    int _1828 = _1826 + _1324;
    bool _1830 = uint(_1794) >= uint(_786);
    int _1832 = ~_786;
    int _1834 = _1832 + 1;
    bool _1836 = !_1830;
    int _1838 = _1836 ? 0 : (-1);
    bool _1840 = uint(_1828) >= uint(_743);
    int _1842 = ~_1768;
    int _1844 = _1842 + _1838;
    int _1846 = _1844 + 1;
    bool _1848 = !_1840;
    int _1850 = _1848 ? 0 : (-1);
    int _1852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1854 = _1852 != 0;
    int _1856 = _786 * _1846;
    int _1858 = _1856 + _1584;
    int _1860 = int(_1702) + int(_1812);
    int _1862 = _1502 >> 31;
    bool _1864 = !_1428;
    int _1866 = _1864 ? _1858 : (-1);
    int _1868 = _1834 * _1860;
    int _1870 = _1868 + _1514;
    bool _1872 = !_1854;
    int _1874 = _1872 ? 0 : 1;
    int _1876 = _1712 >> 31;
    int _1878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1880 = _1878 != 0;
    bool _1882 = !_1546;
    int _1884 = _1882 ? 0 : 1;
    int _1886 = _1866 & 3;
    bool _1888 = _1886 != 0;
    int _1890 = _1866 >> 31;
    int _1892 = _1862 & 3;
    int _1894 = _1876 & 3;
    bool _1896 = !_1880;
    int _1898 = _1896 ? 0 : 1;
    bool _1900 = uint(_1886) > 1u;
    int _1902 = _1890 & 3;
    int _1904 = _1502 + _1892;
    int _1906 = _1712 + _1894;
    int _1908 = _1866 & 3;
    bool _1910 = _1908 != 0;
    int _1912 = _1866 + _1902;
    int _1914 = _1904 >> 2;
    int _1916 = _1906 >> 2;
    int _1918 = _1910 ? 0 : 1;
    int _1920 = _1914 << 4;
    int _1922 = _1920 + 368;
    int _1924 = _1916 << 4;
    int _1926 = _1924 + 512;
    int _1928 = ~_1918;
    int _1930 = _1928 + 1;
    int _1932 = _1930 + 1;
    int _1934 = _1912 >> 2;
    int _1936 = _1932;
    if (!_1900)
    {
        int _1938 = ~_1918;
        int _1940 = _1938 + 1;
        _1936 = _1940;
    }
    int _1942 = _1936;
    uint _1944 = uint(int(uint(_1922) >> uint(2)));
    uint _1946 = uint(int(uint(int(_1944)) >> uint(2)));
    int _1948 = int(_1944) & 3;
    float _1950 = (*spvDescriptorSet0.vp_c9)._m0[int(_1946)][_1948];
    int _1952 = int(_1944) + 1;
    uint _1954 = uint(int(uint(_1952) >> uint(2)));
    int _1956 = _1952 & 3;
    float _1958 = (*spvDescriptorSet0.vp_c9)._m0[int(_1954)][_1956];
    int _1960 = _1934 << 4;
    int _1962 = _1960 + 656;
    bool _1964 = uint(_1870) >= uint(_786);
    int _1966 = ~_1806;
    int _1968 = _1966 + _1850;
    int _1970 = _1968 + 1;
    bool _1972 = !_1964;
    int _1974 = _1972 ? 0 : (-1);
    uint _1976 = uint(int(uint(_1926) >> uint(2)));
    uint _1978 = uint(int(uint(int(_1976)) >> uint(2)));
    int _1980 = int(_1976) & 3;
    float _1982 = (*spvDescriptorSet0.vp_c9)._m0[int(_1978)][_1980];
    int _1984 = int(_1976) + 1;
    uint _1986 = uint(int(uint(_1984) >> uint(2)));
    int _1988 = _1984 & 3;
    float _1990 = (*spvDescriptorSet0.vp_c9)._m0[int(_1986)][_1988];
    int _1992 = ~_1860;
    int _1994 = _1992 + _1974;
    int _1996 = _1994 + 1;
    float _1998 = _800 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _2000 = uint(_1886) >= 2u;
    float _2002 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2004 = _1544 != 3;
    uint _2006 = uint(int(uint(_1962) >> uint(2)));
    uint _2008 = uint(int(uint(int(_2006)) >> uint(2)));
    int _2010 = int(_2006) & 3;
    float _2012 = (*spvDescriptorSet0.vp_c9)._m0[int(_2008)][_2010];
    int _2014 = int(_2006) + 1;
    uint _2016 = uint(int(uint(_2014) >> uint(2)));
    int _2018 = _2014 & 3;
    float _2020 = (*spvDescriptorSet0.vp_c9)._m0[int(_2016)][_2018];
    int _2022 = _2000 ? 0 : 1;
    float _2024 = -_2002;
    float _2026 = fma(_1998, 2.0, _2024);
    int _2028 = _743 * _1970;
    int _2030 = _2028 + _1324;
    bool _2032 = _1732 != 3;
    int _2034 = _786 * _1996;
    int _2036 = _2034 + _1514;
    int _2038 = abs(_1592);
    float _2040 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2042 = int(_2040);
    int _2044 = _1926 + 8;
    uint _2046 = uint(int(uint(_2044) >> uint(2)));
    uint _2048 = uint(int(uint(int(_2046)) >> uint(2)));
    int _2050 = int(_2046) & 3;
    float _2052 = (*spvDescriptorSet0.vp_c9)._m0[int(_2048)][_2050];
    int _2054 = int(_2046) + 1;
    uint _2056 = uint(int(uint(_2054) >> uint(2)));
    int _2058 = _2054 & 3;
    float _2060 = (*spvDescriptorSet0.vp_c9)._m0[int(_2056)][_2058];
    int _2062 = abs(_1780);
    float _2064 = -_139;
    float _2066 = fma(_2064, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2026);
    int _2068 = abs(_1884);
    int _2070 = ~_2038;
    int _2072 = _2070 + 1;
    int _2074 = _2072 + 1;
    int _2076 = abs(_1942);
    int _2078 = _1962 + 8;
    uint _2080 = uint(int(uint(_2078) >> uint(2)));
    uint _2082 = uint(int(uint(int(_2080)) >> uint(2)));
    int _2084 = int(_2080) & 3;
    float _2086 = (*spvDescriptorSet0.vp_c9)._m0[int(_2082)][_2084];
    int _2088 = int(_2080) + 1;
    uint _2090 = uint(int(uint(_2088) >> uint(2)));
    int _2092 = _2088 & 3;
    float _2094 = (*spvDescriptorSet0.vp_c9)._m0[int(_2090)][_2092];
    int _2096 = ~_2062;
    int _2098 = _2096 + 1;
    int _2100 = _2098 + 1;
    bool _2102 = !_1888;
    int _2104 = _2102 ? 0 : 1;
    bool _2106 = _1886 != 3;
    int _2108 = _1922 + 8;
    uint _2110 = uint(int(uint(_2108) >> uint(2)));
    uint _2112 = uint(int(uint(int(_2110)) >> uint(2)));
    int _2114 = int(_2110) & 3;
    float _2116 = (*spvDescriptorSet0.vp_c9)._m0[int(_2112)][_2114];
    int _2118 = int(_2110) + 1;
    uint _2120 = uint(int(uint(_2118) >> uint(2)));
    int _2122 = _2118 & 3;
    float _2124 = (*spvDescriptorSet0.vp_c9)._m0[int(_2120)][_2122];
    int _2126 = ~_2068;
    int _2128 = _2126 + 1;
    int _2130 = _2128 + 1;
    int _2132 = abs(_2104);
    float _2134 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2136 = int(_2134);
    int _2138 = ~_2076;
    int _2140 = _2138 + 1;
    int _2142 = _2140 + 1;
    int _2144 = _2074 * as_type<int>(_1958);
    int _2146 = ~_2022;
    int _2148 = _2146 + 1;
    int _2150 = _2148 + 1;
    bool _2152 = !_2004;
    int _2154 = _2152 ? 0 : (-1);
    int _2156 = _2130 * as_type<int>(_1950);
    int _2158 = _2156 + _2144;
    int _2160 = abs(_1816);
    int _2162 = abs(_1696);
    int _2164 = _2100 * as_type<int>(_1990);
    int _2166 = ~_2160;
    int _2168 = _2166 + 1;
    int _2170 = _2168 + 1;
    int _2172 = _2150;
    if (_2106)
    {
        int _2174 = ~_2022;
        int _2176 = _2174 + 1;
        _2172 = _2176;
    }
    int _2178 = _2172;
    float _2180 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2182 = _2180 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2184 = abs(_1824);
    int _2186 = _2142 * as_type<int>(_2020);
    int _2188 = _2170 * as_type<int>(_1982);
    int _2190 = _2188 + _2164;
    float _2192 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2194 = int(_2192);
    int _2196 = ~_2132;
    int _2198 = _2196 + 1;
    int _2200 = _2198 + 1;
    bool _2202 = !_2032;
    int _2204 = _2202 ? 0 : (-1);
    int _2206 = _2200 * as_type<int>(_2012);
    int _2208 = _2206 + _2186;
    bool _2210 = _1886 != 3;
    float _2212 = 1.0 / _2182;
    int _2214 = ~_2184;
    int _2216 = _2214 + 1;
    int _2218 = _2216 + 1;
    int _2220 = abs(_2204);
    int _2222 = abs(_2178);
    int _2224 = _2218 * as_type<int>(_2052);
    int _2226 = _2224 + _2190;
    bool _2228 = !_2210;
    int _2230 = _2228 ? 0 : (-1);
    int _2232 = ~_2220;
    int _2234 = _2232 + 1;
    int _2236 = _2234 + 1;
    int _2238 = ~_2222;
    int _2240 = _2238 + 1;
    int _2242 = _2240 + 1;
    int _2244 = ~_2162;
    int _2246 = _2244 + 1;
    int _2248 = _2246 + 1;
    int _2250 = _2236 * as_type<int>(_2060);
    int _2252 = _2250 + _2226;
    int _2254 = abs(_2154);
    int _2256 = _2242 * as_type<int>(_2086);
    int _2258 = _2256 + _2208;
    int _2260 = abs(_2230);
    int _2262 = _2248 * as_type<int>(_2116);
    int _2264 = _2262 + _2158;
    int _2266 = abs(_1716);
    float _2268 = float(uint(_2042));
    int _2270 = abs(_1874);
    int _2272 = ~_2254;
    int _2274 = _2272 + 1;
    int _2276 = _2274 + 1;
    float _2278 = 1.0 / _2268;
    int _2280 = ~_2260;
    int _2282 = _2280 + 1;
    int _2284 = _2282 + 1;
    int _2286 = _2276 * as_type<int>(_2124);
    int _2288 = _2286 + _2264;
    int _2290 = abs(_1898);
    float _2292 = _800 * 2.0;
    int _2294 = ~_2266;
    int _2296 = _2294 + 1;
    int _2298 = _2296 + 1;
    int _2300 = _2284 * as_type<int>(_2094);
    int _2302 = _2300 + _2258;
    float _2304 = float(uint(_2194));
    float _2306 = in.m_46.x;
    float _2308 = in.m_46.y;
    float _2310 = in.m_46.z;
    int _2312 = ~_2270;
    int _2314 = _2312 + 1;
    int _2316 = _2314 + 1;
    int _2318 = _2288 * _2298;
    int _2320 = abs(_2136);
    float _2322 = floor(_2292);
    int _2324 = ~_2290;
    int _2326 = _2324 + 1;
    int _2328 = _2326 + 1;
    int _2330 = _1738 * _2266;
    int _2332 = _2330 + _2318;
    int _2334 = abs(_2042);
    int _2336 = _2252 * _2316;
    int _2338 = _2302 * _2328;
    bool _2340 = !_1272;
    int _2342 = _2340 ? _2030 : (-1);
    float _2344 = 1.0 / _2304;
    bool _2346 = !_1428;
    int _2348 = _2346 ? _2036 : (-1);
    int _2350 = as_type<int>(_2278) + (-2);
    int _2352 = _2342 * _2270;
    int _2354 = _2352 + _2336;
    float _2356 = float(uint(_2332));
    int _2358 = _2348 * _2290;
    int _2360 = _2358 + _2338;
    float _2362 = float(uint(_2334));
    float _2364 = float(uint(_2136));
    float _2366 = as_type<float>(_2350) * _2356;
    float _2368 = float(uint(_2360));
    float _2370 = _2308 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2372 = 1.0 / _2362;
    float _2374 = _2308 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2376 = _2308 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2378 = _800 + _802;
    int _2380 = as_type<int>(_2344) + (-2);
    int _2382 = abs(_2332);
    float _2384 = _2378 + (-1.0);
    float _2386 = 1.0 / _2364;
    float _2388 = fma(_2306, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2370);
    float _2390 = as_type<float>(_2380) * _2368;
    float _2392 = float(uint(_2320));
    float _2394 = fma(_2306, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2374);
    int _2396 = ~_2042;
    int _2398 = _2396 + 1;
    float _2400 = fma(_2306, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2376);
    float _2402 = trunc(_2366);
    float _2404 = precise::max(_2402, 0.0);
    uint _2406 = uint(_2404);
    int _2408 = abs(_2194);
    float _2410 = fma(_2310, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2394);
    int _2412 = as_type<int>(_2372) + (-2);
    float _2414 = fma(_2310, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2388);
    float _2416 = float(uint(_2382));
    float _2418 = fma(_2310, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2400);
    float _2420 = float(uint(_2354));
    float _2422 = 1.0 / _2392;
    int _2424 = as_type<int>(_2386) + (-2);
    float _2426 = as_type<float>(_2412) * _2416;
    float _2428 = _2414 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2430 = float(uint(_2408));
    float _2432 = as_type<float>(_2424) * _2420;
    int _2434 = _2398 * int(_2406);
    int _2436 = _2434 + _2332;
    float _2438 = fma(_2384, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2442 = _2440 != 0;
    float _2444 = trunc(_2426);
    float _2446 = precise::max(_2444, 0.0);
    uint _2448 = uint(_2446);
    float _2450 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2452 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2450;
    float _2454 = float(uint(_2436));
    int _2456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2458 = _2456 != 0;
    float _2460 = _2452 * _2212;
    int _2462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2464 = _2462 != 0;
    float _2466 = as_type<float>(_2350) * _2454;
    float _2468 = 1.0 / _2430;
    int _2470 = abs(_2354);
    float _2472 = fma(_998, -2.0, _1246);
    int _2474 = as_type<int>(_2422) + (-2);
    float _2476 = _802 + _804;
    float _2478 = float(uint(_2470));
    int _2480 = ~_2334;
    int _2482 = _2480 + 1;
    float _2484 = trunc(_2432);
    float _2486 = precise::max(_2484, 0.0);
    uint _2488 = uint(_2486);
    int _2490 = abs(_2360);
    float _2492 = as_type<float>(_2474) * _2478;
    int _2494 = ~_2136;
    int _2496 = _2494 + 1;
    int _2498 = _2482 * int(_2448);
    int _2500 = _2498 + _2382;
    float _2502 = _2476 + (-1.0);
    float _2504 = float(uint(_2490));
    float _2506 = trunc(_2390);
    float _2508 = precise::max(_2506, 0.0);
    uint _2510 = uint(_2508);
    int _2512 = as_type<int>(_2468) + (-2);
    float _2514 = float(uint(_2500));
    float _2516 = as_type<float>(_2512) * _2504;
    bool _2518 = _802 > 0.5;
    float _2520 = trunc(_2466);
    float _2522 = precise::max(_2520, 0.0);
    uint _2524 = uint(_2522);
    float _2526 = fma(_2502, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2528 = as_type<float>(_2412) * _2514;
    int _2530 = ~_2042;
    int _2532 = _2530 + 1;
    bool _2534 = _2322 >= 0.0;
    bool _2536 = isnan(_2322);
    bool _2538 = _2534 || _2536;
    bool _2540 = isnan(0.0);
    bool _2542 = _2538 || _2540;
    float _2544 = trunc(_2492);
    float _2546 = precise::max(_2544, 0.0);
    uint _2548 = uint(_2546);
    int _2550 = _2496 * int(_2488);
    int _2552 = _2550 + _2354;
    int _2554 = ~_2408;
    int _2556 = _2554 + 1;
    float _2558 = float(uint(_2552));
    float _2560 = trunc(_2516);
    float _2562 = precise::max(_2560, 0.0);
    uint _2564 = uint(_2562);
    int _2566 = int(_2406) + int(_2524);
    int _2568 = ~_2320;
    int _2570 = _2568 + 1;
    float _2572 = as_type<float>(_2424) * _2558;
    int _2574 = ~_2194;
    int _2576 = _2574 + 1;
    int _2578 = _2532 * _2566;
    int _2580 = _2578 + _2332;
    float _2582 = -_179;
    int _2584 = _2518 ? as_type<int>(_2582) : as_type<int>(_179);
    float _2586 = trunc(_2528);
    float _2588 = precise::max(_2586, 0.0);
    uint _2590 = uint(_2588);
    int _2592 = _2570 * int(_2548);
    int _2594 = _2592 + _2470;
    int _2596 = ~_2334;
    int _2598 = _2596 + 1;
    bool _2600 = uint(_2580) >= uint(_2042);
    int _2602 = _2576 * int(_2510);
    int _2604 = _2602 + _2360;
    float _2606 = float(uint(_2594));
    float _2608 = trunc(_2572);
    float _2610 = precise::max(_2608, 0.0);
    uint _2612 = uint(_2610);
    bool _2614 = !_2600;
    int _2616 = _2614 ? 0 : (-1);
    int _2618 = _2556 * int(_2564);
    int _2620 = _2618 + _2490;
    bool _2622 = _926 != 1;
    float _2624 = as_type<float>(_2474) * _2606;
    float _2626 = float(uint(_2604));
    float _2628 = float(uint(_2620));
    int _2630 = int(_2448) + int(_2590);
    float _2632 = as_type<float>(_2380) * _2626;
    float _2634 = trunc(_2624);
    float _2636 = precise::max(_2634, 0.0);
    uint _2638 = uint(_2636);
    int _2640 = ~_2136;
    int _2642 = _2640 + 1;
    int _2644 = int(_2488) + int(_2612);
    float _2646 = as_type<float>(_2512) * _2628;
    bool _2648 = _804 > 0.5;
    float _2650 = trunc(_2632);
    float _2652 = precise::max(_2650, 0.0);
    uint _2654 = uint(_2652);
    int _2656 = ~_2566;
    int _2658 = _2656 + _2616;
    int _2660 = _2658 + 1;
    int _2662 = _2598 * _2630;
    int _2664 = _2662 + _2382;
    float _2666 = -_175;
    int _2668 = _2648 ? as_type<int>(_2666) : as_type<int>(_175);
    int _2670 = _2042 * _2660;
    int _2672 = _2670 + _2332;
    bool _2674 = !_2442;
    float _2676 = _2674 ? _179 : as_type<float>(_2584);
    int _2678 = _2642 * _2644;
    int _2680 = _2678 + _2354;
    bool _2682 = _2042 == 0;
    bool _2684 = uint(_2664) >= uint(_2334);
    bool _2686 = !_2458;
    float _2688 = _2686 ? _175 : as_type<float>(_2668);
    float _2690 = trunc(_2646);
    float _2692 = precise::max(_2690, 0.0);
    uint _2694 = uint(_2692);
    bool _2696 = _928 != 2;
    bool _2698 = !_2682;
    int _2700 = _2698 ? _2672 : (-1);
    bool _2702 = uint(_2680) >= uint(_2136);
    int _2704 = ~_2320;
    int _2706 = _2704 + 1;
    int _2708 = int(_2548) + int(_2638);
    int _2710 = _2332 ^ _2042;
    int _2712 = ~_2194;
    int _2714 = _2712 + 1;
    int _2716 = int(_2510) + int(_2654);
    int _2718 = _2706 * _2708;
    int _2720 = _2718 + _2470;
    bool _2722 = _2042 == 0;
    int _2724 = ~_2408;
    int _2726 = _2724 + 1;
    int _2728 = _2714 * _2716;
    int _2730 = _2728 + _2360;
    bool _2732 = !_2702;
    int _2734 = _2732 ? 0 : (-1);
    bool _2736 = uint(_2720) >= uint(_2320);
    int _2738 = int(_2564) + int(_2694);
    float _2740 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2742 = !_2736;
    int _2744 = _2742 ? 0 : (-1);
    bool _2746 = !_2684;
    float _2748 = _2746 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    int _2750 = ~_2644;
    int _2752 = _2750 + _2734;
    int _2754 = _2752 + 1;
    bool _2756 = uint(_2730) >= uint(_2194);
    int _2758 = _2726 * _2738;
    int _2760 = _2758 + _2490;
    bool _2762 = _800 > 0.5;
    int _2764 = _2136 * _2754;
    int _2766 = _2764 + _2354;
    bool _2768 = !_2756;
    int _2770 = _2768 ? 0 : (-1);
    float _2772 = -_175;
    int _2774 = _2762 ? as_type<int>(_2772) : as_type<int>(_175);
    bool _2776 = _2136 == 0;
    float _2778 = _2740 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2780 = uint(_2760) >= uint(_2408);
    int _2782 = ~_2716;
    int _2784 = _2782 + _2770;
    int _2786 = _2784 + 1;
    float _2788 = _802 * 2.0;
    bool _2790 = !_2776;
    int _2792 = _2790 ? _2766 : (-1);
    bool _2794 = _2136 == 0;
    int _2796 = _2194 * _2786;
    int _2798 = _2796 + _2360;
    int _2800 = _2354 ^ _2136;
    float _2802 = floor(_2788);
    int _2804 = ~_2744;
    int _2806 = _2708 + _2804;
    int _2808 = _2806 + 1;
    float _2810 = _804 * 2.0;
    float _2812 = as_type<float>(_2716);
    float _2814 = _2748;
    float _2816 = as_type<float>(_2564);
    float _2818 = as_type<float>(_2638);
    float _2820 = as_type<float>(_2808);
    float _2822 = as_type<float>(_2598);
    if (!_2622)
    {
        _2812 = _802;
    }
    float _2824 = _2812;
    int _2826 = ~as_type<int>(_2748);
    int _2828 = _2630 + _2826;
    int _2830 = _2828 + 1;
    float _2832 = _2824;
    if (!_2622)
    {
        _2814 = _2824;
    }
    float _2834 = _2814;
    float _2836 = floor(_2810);
    float _2838 = _2834;
    if (!_2622)
    {
        _2816 = _804;
    }
    float _2840 = _2816;
    float _2842 = _2840;
    if (!_2622)
    {
        _2818 = _804;
    }
    float _2844 = _2818;
    uint _2846 = uint(int(uint(_2710) >> uint(31)));
    uint _2848 = uint(int(uint(_2800) >> uint(31)));
    float _2850 = _2844;
    float _2852 = as_type<float>(_2848);
    if (_2622)
    {
        _2838 = _800;
    }
    float _2854 = _2838;
    if (_2622)
    {
        _2832 = _800;
    }
    float _2856 = _2832;
    if (_2622)
    {
        _2842 = _802;
    }
    float _2858 = _2842;
    float _2860 = _2854 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2622)
    {
        _2850 = _802;
    }
    float _2862 = _2850;
    bool _2864 = _2194 == 0;
    int _2866 = ~int(_2846);
    int _2868 = _2866 + 1;
    int _2870 = ~int(_2848);
    int _2872 = _2870 + 1;
    bool _2874 = !_2780;
    int _2876 = _2874 ? 0 : (-1);
    bool _2878 = !_2864;
    int _2880 = _2878 ? _2798 : (-1);
    bool _2882 = _2802 > 0.0;
    bool _2884 = _2802 >= 0.0;
    bool _2886 = isnan(_2802);
    bool _2888 = _2884 || _2886;
    bool _2890 = isnan(0.0);
    bool _2892 = _2888 || _2890;
    int _2894 = _2830 ^ _2868;
    int _2896 = _2808 ^ _2872;
    int _2898 = ~_2868;
    int _2900 = _2898 + _2894;
    int _2902 = _2900 + 1;
    int _2904 = ~_2872;
    int _2906 = _2904 + _2896;
    int _2908 = _2906 + 1;
    bool _2910 = _701 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2912 = isnan(_701);
    bool _2914 = _2910 || _2912;
    bool _2916 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2918 = _2914 || _2916;
    float _2920 = float(_2918);
    bool _2922 = !_2464;
    float _2924 = _2922 ? _175 : as_type<float>(_2774);
    if (_2696)
    {
        _2820 = _800;
    }
    float _2926 = _2820;
    float _2928 = -_2920;
    float _2930 = _2928 + 1.0;
    float _2932 = _2926;
    if (_2696)
    {
        _2852 = _802;
    }
    float _2934 = _2852;
    bool _2936 = !_2722;
    int _2938 = _2936 ? _2902 : (-1);
    float _2940 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2942 = _701 + _2940;
    bool _2944 = !_2794;
    int _2946 = _2944 ? _2908 : (-1);
    float _2948 = _2934;
    if (!_2696)
    {
        _2932 = _804;
    }
    float _2950 = _2932;
    float _2952 = fma(_2460, _2942, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (!_2696)
    {
        _2948 = _800;
    }
    float _2954 = _2948;
    float _2956 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2958 = _2428 + _2956;
    int _2960 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2962 = _2960 != 0;
    int _2964 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2966 = _2964 != 0;
    int _2968 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2970 = _2968 != 0;
    bool _2972 = _2836 >= 0.0;
    bool _2974 = isnan(_2836);
    bool _2976 = _2972 || _2974;
    bool _2978 = isnan(0.0);
    bool _2980 = _2976 || _2978;
    bool _2982 = _701 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2984 = isnan(_701);
    bool _2986 = _2982 || _2984;
    bool _2988 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2990 = _2986 || _2988;
    float _2992 = float(_2990);
    int _2994 = _2542 ? 0 : 1;
    bool _2996 = _2836 > 0.0;
    float _2998 = _2410 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _3000 = _2980 ? 0 : 1;
    float _3002 = _2992 * _2930;
    bool _3004 = _2194 == 0;
    float _3006 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3008 = _2998 + _3006;
    int _3010 = _2360 ^ _2194;
    float _3012 = _2952 * _3002;
    int _3014 = ~_2876;
    int _3016 = _2738 + _3014;
    int _3018 = _3016 + 1;
    float _3020 = _2418 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    uint _3022 = uint(int(uint(_3010) >> uint(31)));
    float _3024 = _3008 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3026 = -_2992;
    float _3028 = _3026 + 1.0;
    float _3030 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3032 = _3020 + _3030;
    int _3034 = ~int(_3022);
    int _3036 = _3034 + 1;
    float _3038 = fma(_2958, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3024);
    float _3040 = fma(_3028, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3012);
    int _3042 = ~_3000;
    int _3044 = _3042 + 1;
    int _3046 = _3044 + 1;
    float _3048 = _2950 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _3050 = fma(_3032, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3038);
    int _3052 = _3018 ^ _3036;
    float _3054 = fma(_2920, (*spvDescriptorSet0.vp_c9)._m0[132].x, _3040);
    int _3056 = _3046;
    if (!_2996)
    {
        int _3058 = ~_3000;
        int _3060 = _3058 + 1;
        _3056 = _3060;
    }
    int _3062 = _3056;
    float _3064 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3066 = ~_3036;
    int _3068 = _3066 + _3052;
    int _3070 = _3068 + 1;
    float _3072 = _3054 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _3074 = _3050 >= 0.0;
    float _3076 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _3078 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3080 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3082 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3084 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3086 = _3078 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3088 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _3090 = _3080 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3092 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3094 = _3082 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3096 = -_3088;
    float _3098 = fma(_3048, 2.0, _3096);
    float _3100 = fma(_2856, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3084);
    float _3102 = fma(_2862, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3092);
    float _3104 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    out.m_62.x = _3086;
    out.m_62.y = _3090;
    out.m_62.z = _3094;
    out.m_62.w = _3072;
    float _3106 = float(_2700);
    float _3108 = _3064 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[82].x);
    if (_3074)
    {
        _2822 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3112 = _2822;
    float _3114 = _3076 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3116 = fma(_2778, _3106, _2066);
    float _3118 = float(_2880);
    float _3120 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3122 = float(_2792);
    float _3124 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3100);
    float _3126 = float(_2938);
    float _3128 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3130 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3132 = _2858 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_3074)
    {
        float _3134 = _3112 * 5.0;
        _3110 = as_type<int>(_3134);
    }
    int _3136 = _3110;
    float _3138 = -_3128;
    float _3140 = fma(_2860, 2.0, _3138);
    float _3142 = _2954 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3146 = fma(_3132, -2.0, _3130);
    float _3148 = _3104 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3150 = -_139;
    float _3152 = fma(_3150, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3098);
    float _3154 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_3074)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9343 = as_type<float>(_3136);
        out.gl_Position.z = _9343;
    }
    float _3156 = -_139;
    float _3158 = fma(_3156, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3140);
    float _3160 = fma(_3148, _3118, _3152);
    float _3162 = fma(_3142, -2.0, _3154);
    float _3164 = _2924 + 0.5;
    float _3166 = fma(_3108, _3122, _3158);
    float _3168 = float(_2946);
    float _3170 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3146);
    float _3172 = fma(_2778, _3164, _3116);
    bool _3174 = !_3004;
    int _3176 = _3174 ? _3070 : (-1);
    float _3178 = _3120 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3180 = _3144 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3182 = _964 + 0.5;
    float _3184 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2472);
    float _3186 = _2676 + (-0.5);
    float _3188 = -_3170;
    float _3190 = fma(_3180, _3168, _3188);
    float _3192 = fma(_3148, _3182, _3160);
    float _3194 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3162);
    float _3196 = -_3184;
    float _3198 = fma(_3114, _3126, _3196);
    float _3200 = _1202 + (-0.5);
    float _3202 = float(_3176);
    float _3204 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3206 = -_3114;
    float _3208 = fma(_3206, _3186, _3198);
    float _3210 = -_3180;
    float _3212 = fma(_3210, _3200, _3190);
    float _3214 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3216 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3204);
    float _3218 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3220 = log2(_3218);
    float _3222 = -_3194;
    float _3224 = fma(_3178, _3202, _3222);
    float _3226 = _970 + (-0.5);
    float _3228 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3214);
    float _3230 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3216);
    float _3232 = _2688 + 0.5;
    float _3234 = -_3178;
    float _3236 = fma(_3234, _3226, _3224);
    float _3238 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3228);
    float _3240 = -_3230;
    float _3242 = _3240 + 1.0;
    float _3244 = fma(_3108, _3232, _3166);
    float _3246 = -_3124;
    float _3248 = _3246 + 1.0;
    float _3250 = -_3238;
    float _3252 = _3250 + 1.0;
    float _3254 = -_3242;
    float _3256 = fma(_2924, _3254, _3172);
    float _3258 = -_3248;
    float _3260 = fma(_2688, _3258, _3244);
    float _3262 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3264 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3266 = _3220 * _139;
    float _3268 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3102);
    float _3270 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3262);
    float _3272 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3264);
    float _3274 = fma(_2676, _3252, _3208);
    float _3276 = _3008 * _3008;
    float _3278 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3270);
    float _3280 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3272);
    float _3282 = -_3268;
    float _3284 = _3282 + 1.0;
    float _3286 = fma(_2958, _2958, _3276);
    float _3288 = -_3278;
    float _3290 = _3288 + 1.0;
    float _3292 = -_3280;
    float _3294 = _3292 + 1.0;
    float _3296 = fma(_1202, _3284, _3212);
    float _3298 = -_3290;
    float _3300 = fma(_964, _3298, _3192);
    float _3302 = fma(_970, _3294, _3236);
    float _3304 = fma(_3032, _3032, _3286);
    float _3306 = in.m_64.x;
    float _3308 = in.m_64.y;
    float _3310 = in.m_64.z;
    bool _3312 = !_2966;
    int _3314 = _3312 ? 0 : 1;
    float _3316 = exp2(_3266);
    bool _3318 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3320 = isnan(1.0);
    bool _3322 = _3318 || _3320;
    bool _3324 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3326 = _3322 || _3324;
    float _3328 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3330 = 1.0 + _3328;
    out.m_66.x = _3256;
    out.m_66.y = _3274;
    out.m_66.z = _3260;
    out.m_66.w = _3296;
    bool _3332 = !_2970;
    int _3334 = _3332 ? 0 : 1;
    bool _3336 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3338 = isnan(0.0);
    bool _3340 = _3336 || _3338;
    bool _3342 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3344 = _3340 || _3342;
    out.m_68.x = _3300;
    out.m_68.y = _3302;
    float _3346 = rsqrt(_3304);
    int _3348 = ~_2994;
    int _3350 = _3348 + 1;
    int _3352 = _3350 + 1;
    int _3354 = _3352;
    if (_3074)
    {
        out.m_49.x = 0.0;
    }
    float _3356 = float(_3062);
    float _3358 = 1.0 / _3330;
    float _3360 = -_3316;
    float _3362 = _3360 + 1.0;
    bool _3364 = !_2962;
    int _3366 = _3364 ? 0 : 1;
    float _3368 = _3008 * _3346;
    float _3370 = _2958 * _3346;
    float _3372 = _3032 * _3346;
    float _3374 = _3372;
    if (_3074)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3376 = -_3368;
    float _3378 = fma(_3376, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2998);
    float _3380 = -_3370;
    float _3382 = fma(_3380, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2428);
    int _3384 = abs(_3366);
    float _3386 = -_3368;
    float _3388 = fma(_3386, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3008);
    float _3390 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3392 = _3378 + _3390;
    float _3394 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3396 = _3382 + _3394;
    float _3398 = -_3372;
    float _3400 = fma(_3398, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3020);
    float _3402 = _3388 * _3388;
    float _3404 = _3392 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _3406 = _2322 > 0.0;
    float _3408 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3410 = _3400 + _3408;
    int _3412 = abs(_3314);
    float _3414 = fma(_3396, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3404);
    float _3416 = float(_3384);
    float _3418 = -_3370;
    float _3420 = fma(_3418, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2958);
    float _3422 = _3344 ? _3362 : 0.0;
    float _3424 = fma(_3410, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3414);
    float _3426 = -_3372;
    float _3428 = fma(_3426, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3032);
    float _3430 = _3416 * _3356;
    float _3432 = fma(_3420, _3420, _3402);
    float _3434 = _3402;
    float _3436 = _3382;
    if (_3326)
    {
        float _3438 = _3422 * _3358;
        _141 = _3438;
    }
    float _3440 = _141;
    bool _3442 = _3424 >= 0.0;
    float _3444 = _3430 * (-2.0);
    float _3446 = _800 + (-0.5);
    if (!_3406)
    {
        int _3448 = ~_2994;
        int _3450 = _3448 + 1;
        _3354 = _3450;
    }
    int _3452 = _3354;
    float _3454 = fma(_3444, _3306, _3306);
    float _3456 = fma(_2438, _3444, _2438);
    float _3458 = float(_3412);
    float _3460 = fma(_3428, _3428, _3432);
    float _3462 = fma(_3446, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3454);
    float _3464 = float(_3452);
    float _3466 = _802 + (-0.5);
    int _3468 = _2892 ? 0 : 1;
    float _3470 = fma(_3456, _3440, _3462);
    if (_3442)
    {
        _3434 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3472 = _3434;
    float _3474 = _3458 * _3464;
    float _3476 = sqrt(_3460);
    float _3478 = _3470 * 0.15915493667125701904296875;
    int _3480 = ~_3468;
    int _3482 = _3480 + 1;
    int _3484 = _3482 + 1;
    float _3486 = _3474 * (-2.0);
    int _3488 = as_type<int>(_3472);
    int _3490 = _3484;
    if (_3442)
    {
        float _3492 = _3472 * 5.0;
        _3488 = as_type<int>(_3492);
    }
    int _3494 = _3488;
    if (_3442)
    {
        out.m_49.x = 0.0;
    }
    if (!_2882)
    {
        int _3496 = ~_3468;
        int _3498 = _3496 + 1;
        _3490 = _3498;
    }
    int _3500 = _3490;
    float _3502 = _3478 * 6.283185482025146484375;
    float _3504 = sin(_3502);
    float _3506 = fma(_2526, _3486, _2526);
    if (_3442)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9906 = as_type<float>(_3494);
        out.gl_Position.z = _9906;
    }
    float _3508 = fma(_3486, _3308, _3308);
    int _3510 = abs(_3334);
    if (_3442)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3512 = -_2998;
    float _3514 = _3512 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3516 = -_2428;
    float _3518 = _3516 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3520 = float(_3500);
    float _3522 = _3514 * _3514;
    float _3524 = float(_3510);
    float _3526 = -_3020;
    float _3528 = _3526 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3530 = _800 + _804;
    float _3532 = fma(_3518, _3518, _3522);
    float _3534 = fma(_3466, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3508);
    float _3536 = _3524 * _3520;
    float _3538 = _3530 + (-1.0);
    float _3540 = fma(_3528, _3528, _3532);
    float _3542 = _3536 * (-2.0);
    float _3544 = _804 + (-0.5);
    float _3546 = _3478 * 6.283185482025146484375;
    float _3548 = cos(_3546);
    float _3550 = fma(_3506, _3440, _3534);
    float _3552 = fma(_3538, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3554 = fma(_3542, _3310, _3310);
    float _3556 = _667 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3558 = _3550 * 0.15915493667125701904296875;
    float _3560 = fma(_3552, _3542, _3552);
    float _3562 = fma(_3544, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3554);
    float _3564 = rsqrt(_3540);
    float _3566 = _669 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3568 = fma(_3560, _3440, _3562);
    bool _3570 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3572 = isnan(0.5);
    bool _3574 = _3570 || _3572;
    bool _3576 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3578 = _3574 || _3576;
    bool _3580 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3582 = isnan(0.5);
    bool _3584 = _3580 || _3582;
    bool _3586 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3588 = _3584 || _3586;
    float _3590 = _3568 * 0.15915493667125701904296875;
    float _3592 = _3558 * 6.283185482025146484375;
    float _3594 = sin(_3592);
    float _3596 = _3518 * _3564;
    float _3598 = _3528 * _3564;
    float _3600 = _3514 * _3564;
    float _3602 = _3558 * 6.283185482025146484375;
    float _3604 = cos(_3602);
    float _3606 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3608 = _3596 * _3606;
    float _3610 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3612 = _3598 * _3610;
    float _3614 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3616 = _3600 * _3614;
    float _3618 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _179);
    float _3620 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3622 = -_3608;
    float _3624 = fma(_3598, _3620, _3622);
    float _3626 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3628 = -_3612;
    float _3630 = fma(_3600, _3626, _3628);
    float _3632 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3634 = -_3616;
    float _3636 = fma(_3596, _3632, _3634);
    float _3638 = _3346 * _3476;
    float _3640 = _3624 * _3624;
    float _3642 = _3590 * 6.283185482025146484375;
    float _3644 = sin(_3642);
    float _3646 = _3504 * _3594;
    float _3648 = _3638 * _3556;
    float _3650 = fma(_3630, _3630, _3640);
    float _3652 = _3638 * _3566;
    float _3654 = _3548 * _3604;
    float _3656 = fma(_3636, _3636, _3650);
    float _3658 = _3590 * 6.283185482025146484375;
    float _3660 = cos(_3658);
    float _3662 = _3618 * _3648;
    float _3664 = _3504 * _3604;
    float _3666 = rsqrt(_3656);
    float _3668 = fma(_3644, _3654, _3646);
    float _3670 = fma(_3644, _3646, _3654);
    float _3672 = _3548 * _3594;
    float _3674 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _175);
    float _3676 = -_3672;
    float _3678 = fma(_3644, _3664, _3676);
    float _3680 = _3548 * _3660;
    float _3682 = _3674 * _3652;
    float _3684 = _3604 * _3660;
    float _3686 = _3504 * _3660;
    float _3688 = _3680 * _3662;
    float _3690 = _3594 * _3660;
    float _3692 = -_3664;
    float _3694 = fma(_3644, _3672, _3692);
    float _3696 = _3638 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3698 = _3696 * 0.5;
    float _3700 = _3630 * _3666;
    float _3702 = _3624 * _3666;
    float _3704 = -_3662;
    float _3706 = _3644 * _3704;
    float _3708 = fma(_3668, _3682, _3688);
    float _3710 = _3600 * _3700;
    float _3712 = _3636 * _3666;
    float _3714 = _3686 * _3662;
    float _3716 = fma(_3684, _3682, _3706);
    float _3718 = fma(_3694, _3698, _3708);
    float _3720 = _3598 * _3702;
    float _3722 = -_3710;
    float _3724 = fma(_3596, _3702, _3722);
    float _3726 = fma(_3678, _3682, _3714);
    float _3728 = fma(_3690, _3698, _3716);
    float _3730 = -_3720;
    float _3732 = fma(_3600, _3712, _3730);
    float _3734 = _3724 * _3718;
    float _3736 = fma(_3670, _3698, _3726);
    float _3738 = _3378 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3740 = _3732 * _3718;
    float _3742 = fma(_3712, _3728, _3734);
    float _3744 = _3378 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3746 = fma(_3382, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3738);
    float _3748 = fma(_3700, _3728, _3740);
    float _3750 = fma(_3598, _3736, _3742);
    float _3752 = fma(_3382, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3744);
    float _3754 = fma(_3400, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3746);
    float _3756 = fma(_3596, _3736, _3748);
    float _3758 = _3020 + _3750;
    float _3760 = fma(_3400, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3752);
    float _3762 = _3754 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3764 = _2428 + _3756;
    float _3766 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3768 = _3758 + _3766;
    float _3770 = _3760 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3772 = 1.0 / _3762;
    float _3774 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3776 = _3764 + _3774;
    float _3778 = _3768 * _3768;
    float _3780 = _3596 * _3712;
    float _3782 = _3770 + _3762;
    float _3784 = fma(_3776, _3776, _3778);
    float _3786 = -_3780;
    float _3788 = fma(_3598, _3700, _3786);
    float _3790 = sqrt(_3784);
    float _3792 = _3788 * _3718;
    float _3794 = fma(_3702, _3728, _3792);
    float _3796 = _3782 * _3772;
    float _3798 = _3796 * 0.5;
    float _3800 = fma(_3600, _3736, _3794);
    float _3802 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3804 = fma(_3798, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3802);
    float _3806 = _2998 + _3800;
    float _3808 = 1.0 / _3804;
    bool _3810 = _3790 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3812 = _3736;
    float _3814 = _3792;
    float _3816 = _3758;
    float _3818 = _3728;
    float _3820 = _3790;
    if (!_3810)
    {
        _3812 = _3764;
    }
    float _3822 = _3812;
    float _3824 = _3822;
    if (!_3810)
    {
        _3814 = _3806;
    }
    float _3826 = _3814;
    bool _3828 = !_3810;
    float _3830 = _3826;
    if (!_3828)
    {
        float _3832 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3834 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3836 = _3790 + _3834;
        float _3838 = _3806 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3840 = rsqrt(_3784);
        float _3842 = _3836 * _3832;
        float _3844 = _3842 * 0.15915493667125701904296875;
        float _3846 = _3844 * 6.283185482025146484375;
        float _3848 = cos(_3846);
        float _3850 = _3844 * 6.283185482025146484375;
        float _3852 = sin(_3850);
        float _3854 = _3848 + (-1.0);
        float _3856 = fma(_3852, _3838, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3858 = _3854 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3860 = _3840 * _3856;
        float _3862 = fma(_3806, _3848, _3858);
        float _3864 = fma(_3776, _3860, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3866 = fma(_3768, _3860, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3830 = _3862;
        _3824 = _3864;
        _3816 = _3866;
        _3818 = _3852;
        _3820 = _3844;
    }
    float _3868 = _3830;
    float _3870 = _3824;
    float _3872 = _3816;
    float _3874 = _3818;
    float _3876 = _3820;
    float _3878 = -_3368;
    float _3880 = fma(_3878, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3868);
    float _3882 = -_3370;
    float _3884 = fma(_3882, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3870);
    float _3886 = -_3372;
    float _3888 = fma(_3886, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3872);
    float _3890 = _3876;
    float _3892 = _3884;
    float _3894 = _3888;
    float _3896 = _3874;
    float _3898 = _3870;
    if (_3588)
    {
        _3890 = 1.0;
    }
    float _3900 = _3890;
    float _3902 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3904 = _3808 * _3902;
    float _3906 = _3900;
    if (_3578)
    {
        _3374 = _3880;
    }
    float _3908 = _3374;
    float _3910 = _3908;
    if (!_3578)
    {
        float _3912 = _3392 * _3392;
        float _3914 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3916 = -_3020;
        float _3918 = _3916 + _3872;
        float _3920 = -_2998;
        float _3922 = _3920 + _3868;
        float _3924 = fma(_3396, _3396, _3912);
        float _3926 = -_2428;
        float _3928 = _3926 + _3870;
        float _3930 = fma(_3410, _3410, _3924);
        float _3932 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3934 = sqrt(_3930);
        float _3936 = 1.0 / _3638;
        float _3938 = _3932 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3940 = precise::min(_3934, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3942 = _3940 * _3914;
        float _3944 = _3942 * _3936;
        float _3946 = _3938 * _3944;
        float _3948 = _3918 * _3944;
        float _3950 = fma(_3922, _3946, _3378);
        float _3952 = fma(_3928, _3946, _3382);
        float _3954 = fma(_3938, _3948, _3400);
        _3910 = _3950;
        _3892 = _3952;
        _3894 = _3954;
        _3896 = _3912;
        _3898 = _3928;
    }
    float _3956 = _3910;
    float _3958 = _3892;
    float _3960 = _3894;
    float _3962 = _3896;
    float _3964 = _3898;
    float _3966 = _3962;
    float _3968 = _3964;
    if (!_3588)
    {
        float _3970 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3972 = _3970 * 0.15915493667125701904296875;
        float _3974 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3976 = _3972 * 6.283185482025146484375;
        float _3978 = cos(_3976);
        float _3980 = _3974 * 0.15915493667125701904296875;
        float _3982 = _3972 * 6.283185482025146484375;
        float _3984 = sin(_3982);
        float _3986 = 1.0 / _3978;
        float _3988 = _3980 * 6.283185482025146484375;
        float _3990 = cos(_3988);
        float _3992 = _3984 * _3986;
        float _3994 = _3980 * 6.283185482025146484375;
        float _3996 = sin(_3994);
        float _3998 = _3990 * _3992;
        float _4000 = 1.0 / _3998;
        float _4002 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4004 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4002;
        float _4006 = 1.0 / _4004;
        float _4008 = _3996 * _4000;
        float _4010 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4012 = fma(_3904, _4008, _4010);
        float _4014 = _4012 * _4006;
        float _4016 = precise::clamp(_4014, 0.0, 1.0);
        _3966 = _3980;
        _3968 = _4012;
        _3906 = _4016;
    }
    float _4018 = _3966;
    float _4020 = _3968;
    float _4022 = _3906;
    float _4024 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4026 = _3956 + _4024;
    float _4028 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4030 = _3958 + _4028;
    float _4032 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4034 = _3960 + _4032;
    float _4036 = _4026 * _4026;
    float _4038 = fma(_4030, _4030, _4036);
    float _4040 = fma(_4034, _4034, _4038);
    float _4042 = rsqrt(_4040);
    float _4044 = sqrt(_4040);
    float _4046 = _4042 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4048 = _4030 * _4046;
    float _4050 = _4034 * _4046;
    float _4052 = _4048 * _4048;
    float _4054 = _4050 * _4050;
    float _4056 = _4052 + _4054;
    float _4058 = sqrt(_4056);
    bool _4060 = _4058 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4062 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4064 = _4058 + _4062;
    float _4066 = _4042;
    float _4068 = _4064;
    float _4070 = _4018;
    float _4072 = _4026;
    float _4074 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _4076 = _4048;
    if (_4060)
    {
        float _4078 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4066 = _4078;
    }
    float _4080 = _4066;
    float _4082 = _4080;
    if (_4060)
    {
        float _4084 = _4064 * _4080;
        _4068 = _4084;
    }
    float _4086 = _4068;
    if (_4060)
    {
        float _4088 = rsqrt(_4056);
        _4082 = _4088;
    }
    float _4090 = _4082;
    float _4092 = _4090;
    if (_4060)
    {
        float _4094 = _4086 * 0.15915493667125701904296875;
        _4070 = _4094;
    }
    float _4096 = _4070;
    float _4098 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4100 = _4034;
    float _4102 = _4096;
    if (_4060)
    {
        float _4104 = _4096 * 6.283185482025146484375;
        float _4106 = sin(_4104);
        _4100 = _4106;
    }
    float _4108 = _4100;
    float _4110 = precise::max(0.0, _4098);
    float _4112 = _4020;
    if (_4060)
    {
        float _4114 = _4096 * 6.283185482025146484375;
        float _4116 = cos(_4114);
        _4112 = _4116;
    }
    float _4118 = _4112;
    float _4120 = -_4046;
    float _4122 = -_4110;
    float _4124 = fma(_4026, _4120, _4122);
    float _4126 = fma(_3382, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_4060)
    {
        float _4128 = _4124 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4072 = _4128;
    }
    float _4130 = _4072;
    float _4132 = _4108;
    float _4134 = _4130;
    if (_4060)
    {
        float _4136 = fma(_4108, _4130, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4132 = _4136;
    }
    float _4138 = _4132;
    float _4140 = _4138;
    if (!_4060)
    {
        _4102 = _4050;
    }
    float _4142 = _4102;
    float _4144 = _4142;
    if (_4060)
    {
        float _4146 = _4090 * _4138;
        _4074 = _4146;
    }
    float _4148 = _4074;
    if (!_4060)
    {
        _4092 = _4124;
    }
    float _4150 = _4092;
    float _4152 = _4150;
    float _4154 = _4118;
    if (_4060)
    {
        float _4156 = _4118 + (-1.0);
        _4134 = _4156;
    }
    float _4158 = _4134;
    if (_4060)
    {
        float _4160 = _4048 * _4148;
        _4076 = _4160;
    }
    float _4162 = _4076;
    if (!_4060)
    {
        _4140 = _4052;
    }
    float _4164 = _4140;
    float _4166 = _4164;
    if (_4060)
    {
        float _4168 = _4050 * _4148;
        _4144 = _4168;
    }
    float _4170 = _4144;
    if (_4060)
    {
        float _4172 = _4158 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3436 = _4172;
    }
    float _4174 = _3436;
    if (_4060)
    {
        float _4176 = _4162 * _4162;
        _4166 = _4176;
    }
    float _4178 = _4166;
    float _4180 = _3956 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_4060)
    {
        float _4182 = fma(_4124, _4118, _4174);
        _4152 = _4182;
    }
    float _4184 = _4152;
    if (!_4060)
    {
        _4154 = _4054;
    }
    float _4186 = _4154;
    float _4188 = _4186;
    if (_4060)
    {
        float _4190 = _4170 * _4170;
        _4188 = _4190;
    }
    float _4192 = _4188;
    float _4194 = fma(_4184, _4184, _4178);
    float _4196 = fma(_3958, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4180);
    float _4198 = floor(_4126);
    float _4200 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4202 = _4194 + _4192;
    float _4204 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4206 = fma(_4044, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4204);
    float _4208 = precise::clamp(_4206, 0.0, 1.0);
    float _4210 = fma(_3960, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4196);
    float _4212 = _3956 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4214 = -_4208;
    float _4216 = _4214 + 1.0;
    float _4218 = rsqrt(_4202);
    float _4220 = _4210 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4222 = fma(_3958, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4212);
    float _4224 = fma(_3400, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4226 = _3956 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4228 = abs(_4216);
    float _4230 = log2(_4228);
    float _4232 = _3956 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4234 = _4220 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4236 = fma(_3958, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4226);
    float _4238 = fma(_3960, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4222);
    float _4240 = fma(_3958, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4232);
    float _4242 = -_4234;
    float _4244 = fma(_4242, _4200, 1.0);
    float _4246 = fma(_3960, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4236);
    float _4248 = _4218 * _4162;
    float _4250 = fma(_3960, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4240);
    float _4252 = _4218 * _4184;
    float _4254 = _4246 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4256 = _4248 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4258 = _4250 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4260 = _4218 * _4170;
    float _4262 = floor(_4224);
    float _4264 = -_4256;
    float _4266 = fma(_4252, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4264);
    float _4268 = _4258 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4270 = _4230 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4272 = _4238 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4274 = -_4260;
    float _4276 = fma(_4274, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4266);
    float _4278 = fma(_4254, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4268);
    float _4280 = -_4198;
    float _4282 = _4126 + _4280;
    float _4284 = exp2(_4270);
    float _4286 = fma(_4276, -0.5, 0.5);
    float _4288 = fma(_4220, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4278);
    float _4290 = _4258 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4292 = _4252 + 1.0;
    float _4294 = fma(_4272, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4288);
    float _4296 = fma(_4254, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4290);
    float _4298 = log2(_4244);
    float _4300 = -_4262;
    float _4302 = _4224 + _4300;
    float _4304 = fma(_4220, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4296);
    float _4306 = 1.0 / _4294;
    float _4308 = fma(_4276, 0.5, 0.5);
    float _4310 = _4258 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4312 = fma(_4308, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4314 = fma(_4254, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4310);
    float _4316 = -_4252;
    float _4318 = fma(_4284, _4292, _4316);
    float _4320 = sqrt(_4286);
    float _4322 = fma(_4308, _4312, -0.212114393711090087890625);
    float _4324 = fma(_4220, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4314);
    float _4326 = fma(_4272, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4304);
    float _4328 = _4298 * 0.693147182464599609375;
    float _4330 = fma(_4308, _4322, 1.570728778839111328125);
    float _4332 = fma(_4272, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4324);
    float2 _11205 = float2(_4282, _4302);
    float _4334 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11205, float2(0.0), isnan(_11205)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11205, float2(0.0), isnan(_11205)), level(0.0)).x;
    float _4336 = _4326 * _4306;
    float _4338 = _4328 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4340 = _4332 * _4306;
    float _4342 = fma(_4318, 0.5, 0.5);
    float _4344 = fma(_4336, 0.5, 0.5);
    float _4346 = fma(_4340, -0.5, 0.5);
    float _4348 = _4320 * 0.636619746685028076171875;
    float3 _11235 = float3(_4344, _4346, _4338);
    float _4350 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11235, float3(0.0), isnan(_11235)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11235, float3(0.0), isnan(_11235)), level(0.0)).x;
    float3 _11246 = float3(_4344, _4346, _4338);
    float4 _4353 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11246, float3(0.0), isnan(_11246)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11246, float3(0.0), isnan(_11246)), level(0.0)).xyzw;
    float _4355 = _4353.x;
    float _4357 = _4353.y;
    float _4359 = _4353.z;
    float _4361 = _4353.w;
    float _4363 = -_4330;
    float _4365 = fma(_4348, _4363, 1.0);
    float2 _11267 = float2(_4365, _4342);
    float3 _4369 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11267, float2(0.0), isnan(_11267)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11267, float2(0.0), isnan(_11267)), level(0.0)).xyz;
    float _4371 = _4369.x;
    float _4373 = _4369.y;
    float _4375 = _4369.z;
    float _4377 = abs(_3904);
    float _4379 = log2(_4377);
    float _4381 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4383 = _175 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _4385 = _4044 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4387 = isnan(_4044);
    bool _4389 = _4385 || _4387;
    bool _4391 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4393 = _4389 || _4391;
    float _4395 = _4379 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4397 = exp2(_4395);
    float _4399 = _3668 * _3732;
    float _4401 = _3694 * _3788;
    float _4403 = fma(_3684, _3700, _4399);
    float _4405 = fma(_3678, _3596, _4403);
    float _4407 = fma(_4397, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4409 = precise::clamp(_4407, 0.0, 1.0);
    float _4411 = _3680 * _3788;
    float _4413 = fma(_4409, -2.0, 3.0);
    float _4415 = _4409 * _4409;
    float _4417 = _3668 * _3788;
    float _4419 = _3668 * _3724;
    float _4421 = _3694 * _3732;
    float _4423 = _4415 * _4413;
    float _4425 = _3680 * _3732;
    float _4427 = _3680 * _3724;
    float _4429 = fma(_3684, _3712, _4419);
    float _4431 = fma(_4381, _4381, 1.0);
    float _4433 = _3694 * _3724;
    float _4435 = -_3644;
    float _4437 = fma(_4435, _3712, _4427);
    float _4439 = fma(_3690, _3700, _4421);
    float _4441 = fma(_3684, _3702, _4417);
    float _4443 = -_3644;
    float _4445 = fma(_4443, _3702, _4411);
    float _4447 = rsqrt(_4431);
    float _4449 = fma(_3690, _3702, _4401);
    float _4451 = fma(_3690, _3712, _4433);
    float _4453 = -_3644;
    float _4455 = fma(_4453, _3700, _4425);
    float _4457 = fma(_3670, _3596, _4439);
    float _4459 = _4230 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4461 = -_4423;
    float _4463 = _4461 + 1.0;
    float _4465 = fma(_3686, _3596, _4455);
    float _4467 = fma(_3686, _3600, _4445);
    float _4469 = _4258 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4471 = fma(_4463, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4423);
    float _4473 = exp2(_4459);
    bool _4475 = _3904 <= 8000.0;
    bool _4477 = isnan(_3904);
    bool _4479 = _4475 || _4477;
    bool _4481 = isnan(8000.0);
    bool _4483 = _4479 || _4481;
    float _4485 = float(_4483);
    float _4487 = fma(_4254, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4469);
    float _4489 = fma(_3670, _3600, _4449);
    float _4491 = fma(_3678, _3600, _4441);
    float _4493 = in.m_70.x;
    float _4495 = _4381 * _4465;
    float _4497 = fma(_3686, _3598, _4437);
    float _4499 = fma(_3670, _3598, _4451);
    float _4501 = _4381 * _4447;
    float _4503 = fma(_4220, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4487);
    float _4505 = fma(_3678, _3598, _4429);
    float _4507 = fma(_4383, _4405, _4495);
    float _4509 = -_4457;
    float _4511 = _4501 * _4509;
    float _4513 = fma(_4272, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4503);
    float _4515 = _4381 * _4467;
    float _4517 = _4485 * _4471;
    out.m_72.x = _4405;
    out.m_72.y = _4491;
    out.m_72.z = _4505;
    float _4519 = -_4489;
    float _4521 = _4501 * _4519;
    float _4523 = fma(_4447, _4465, _4511);
    float _4525 = _4381 * _4497;
    float _4527 = -_4499;
    float _4529 = _4501 * _4527;
    float _4531 = -_4473;
    float _4533 = _4531 + 1.0;
    float _4535 = fma(_4447, _4467, _4521);
    float _4537 = _4513 + _4294;
    float _4539 = _4326 + _4294;
    float _4541 = fma(_4447, _4497, _4529);
    float _4543 = _4537 * 0.5;
    float _4545 = _4294 * 0.5;
    float _4547 = fma(_4383, _4491, _4515);
    float _4549 = _4517 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4551 = fma(_4383, _4505, _4525);
    float _4553 = fma(_4332, -0.5, _4545);
    float _4555 = _4457 + _4507;
    float _4557 = _4533 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4559 = _4539 * 0.5;
    out.gl_Position.x = _4326;
    out.gl_Position.y = _4332;
    out.gl_Position.z = _4513;
    out.gl_Position.w = _4294;
    float _4561 = _4489 + _4547;
    float _4563 = _4499 + _4551;
    out.m_74.x = _4559;
    out.m_74.y = _4553;
    out.m_74.z = _4543;
    out.m_74.w = _4294;
    out.m_76.x = _4555;
    out.m_76.y = _4561;
    out.m_76.z = _4563;
    out.m_78.x = _4523;
    out.m_78.y = _4535;
    out.m_78.z = _4541;
    float _4565 = -_4557;
    float _4567 = _4565 + 1.0;
    float _4569 = _4294;
    float _4571 = _4513;
    float _4573 = _4332;
    float _4575 = _4535;
    float _4577 = _4523;
    float _4579 = _4567;
    if (!_4393)
    {
        _4569 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4581 = _4569;
    float _4583 = _4581;
    float _4585 = _4581;
    if (!_4393)
    {
        _4571 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4587 = _4571;
    float _4589 = _4587;
    float _4591 = _4587;
    if (!_4393)
    {
        _4573 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4593 = _4573;
    float _4595 = _4022 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4597 = _4593;
    float _4599 = _4593;
    if (!_4393)
    {
        _4575 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4601 = _4575;
    float _4603 = _4601;
    float _4605 = _4601;
    if (!_4393)
    {
        _4577 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4607 = _4577;
    float _4609 = -_4334;
    float _4611 = _4609 + 1.0;
    float _4613 = _4611 * _4549;
    float _4615 = precise::clamp(_4613, 0.0, 1.0);
    float _4617 = -_4615;
    float _4619 = fma(_4617, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4621 = _4557 * _4350;
    float _4623 = _4619 * _4493;
    float _4625 = _4361 * _4567;
    float _4627 = _4607;
    float _4629 = _4607;
    if (!_4393)
    {
        _4579 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4631 = _4579;
    float _4633 = _4361 * _4621;
    float _4635 = _4623 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4637 = _4375 * _4621;
    float _4639 = fma(_4371, _4633, _4355);
    float _4641 = fma(_4373, _4633, _4357);
    out.m_80.x = _4635;
    float _4643 = fma(_4361, _4637, _4359);
    out.m_82.x = _4639;
    out.m_82.y = _4641;
    out.m_82.z = _4643;
    out.m_82.w = _4625;
    bool _4645 = !_4393;
    float _4647 = _4631;
    float _4649 = _4631;
    if (!_4645)
    {
        bool _4651 = _4044 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4653 = isnan(_4044);
        bool _4655 = _4651 || _4653;
        bool _4657 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4659 = _4655 || _4657;
        if (!_4659)
        {
            float _4661 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4663 = _4044 + _4661;
            float _4665 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4667 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4665;
            float _4669 = 1.0 / _4667;
            float _4671 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4673 = _4671 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4675 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4677 = _4675 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4679 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4681 = _4679 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4683 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4685 = _4683 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4687 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4689 = _4687 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4691 = _4663 * _4669;
            float _4693 = precise::clamp(_4691, 0.0, 1.0);
            float _4695 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4697 = _4695 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4699 = fma(_4693, _4673, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4701 = fma(_4693, _4697, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4703 = fma(_4693, _4677, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4705 = fma(_4693, _4681, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4707 = fma(_4693, _4685, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4709 = fma(_4693, _4689, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4629 = _4701;
            _4599 = _4707;
            _4605 = _4699;
            _4591 = _4705;
            _4585 = _4703;
            _4649 = _4709;
            _4711 = true;
        }
        else
        {
            bool _4713 = _4044 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4715 = isnan(_4044);
            bool _4717 = _4713 || _4715;
            bool _4719 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4721 = _4717 || _4719;
            if (!_4721)
            {
                _4603 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4723 = _4603;
            _4605 = _4723;
            if (!_4721)
            {
                _4627 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4725 = _4627;
            _4629 = _4725;
            if (!_4721)
            {
                _4583 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4727 = _4583;
            _4585 = _4727;
            if (!_4721)
            {
                _4589 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4729 = _4589;
            _4591 = _4729;
            if (!_4721)
            {
                _4597 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4731 = _4597;
            _4599 = _4731;
            if (!_4721)
            {
                _4647 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4733 = _4647;
            bool _4735 = !_4721;
            _4649 = _4733;
            if (!_4735)
            {
                bool _4737 = _4044 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4739 = isnan(_4044);
                bool _4741 = _4737 || _4739;
                bool _4743 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4745 = _4741 || _4743;
                if (!_4745)
                {
                    float _4747 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4749 = _4044 + _4747;
                    float _4751 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4753 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4751;
                    float _4755 = 1.0 / _4753;
                    float _4757 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4759 = _4757 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4761 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4763 = _4761 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4765 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4767 = _4765 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4769 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4771 = _4769 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4773 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4775 = _4773 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4777 = _4749 * _4755;
                    float _4779 = precise::clamp(_4777, 0.0, 1.0);
                    float _4781 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4783 = _4781 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4785 = fma(_4779, _4759, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4787 = fma(_4779, _4783, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4789 = fma(_4779, _4763, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4791 = fma(_4779, _4767, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4793 = fma(_4779, _4771, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4795 = fma(_4779, _4775, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4629 = _4787;
                    _4599 = _4793;
                    _4605 = _4785;
                    _4591 = _4791;
                    _4585 = _4789;
                    _4649 = _4795;
                    _4711 = true;
                }
                else
                {
                    _4629 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4599 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4605 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4591 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4585 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4649 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4711 = false;
    float _4797 = _4629;
    float _4799 = _4599;
    float _4801 = _4605;
    float _4803 = _4591;
    float _4805 = _4585;
    float _4807 = _4649;
    float _4809 = fma(_4561, -0.5, 0.5);
    float _4811 = precise::clamp(_4809, 0.0, 1.0);
    float _4813 = -_4797;
    float _4815 = _4813 + _4799;
    float _4817 = -_4801;
    float _4819 = _4817 + _4803;
    out.m_84.x = 0.0;
    float _4821 = fma(_4811, _4815, _4797);
    float _4823 = -_4805;
    float _4825 = _4823 + _4807;
    float _4827 = fma(_4811, _4819, _4801);
    float _4829 = _4821 * 0.586610972881317138671875;
    bool _4831 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4833 = fma(_4811, _4825, _4805);
    float _4835 = _4595 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4837 = fma(_4827, 0.298911988735198974609375, _4829);
    bool _4839 = _4022 > 0.0;
    bool _4841 = isnan(_4022);
    bool _4843 = _4839 || _4841;
    bool _4845 = isnan(0.0);
    bool _4847 = _4843 || _4845;
    float _4849 = fma(_4833, 0.114477999508380889892578125, _4837);
    out.m_49.x = _4835;
    float _4851 = -_4849;
    float _4853 = _4827 + _4851;
    float _4855 = -_4849;
    float _4857 = _4821 + _4855;
    float _4859 = -_4849;
    float _4861 = _4833 + _4859;
    float _4863 = fma(_4853, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4849);
    float _4865 = fma(_4857, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4849);
    float _4867 = fma(_4861, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4849);
    bool _4869 = !_4831;
    if (!_4869)
    {
        float _4871 = -_3956;
        float _4873 = _4871 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4875 = -_3958;
        float _4877 = _4875 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4879 = -_3960;
        float _4881 = _4879 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4883 = _4873 * _4873;
        float _4885 = fma(_4877, _4877, _4883);
        float _4887 = fma(_4881, _4881, _4885);
        float _4889 = sqrt(_4887);
        float _4891 = rsqrt(_4887);
        float _4893 = -_4889;
        float _4895 = _4893 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4897 = _4895 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4899 = precise::clamp(_4897, 0.0, 1.0);
        float _4901 = _4877 * _4891;
        float _4903 = _4873 * _4891;
        float _4905 = abs(_4899);
        float _4907 = log2(_4905);
        float _4909 = _4881 * _4891;
        float _4911 = _4901 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4913 = _4561 * _4903;
        float _4915 = -_4903;
        float _4917 = -_4911;
        float _4919 = fma(_4915, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4917);
        float _4921 = fma(_4555, _4901, _4913);
        float _4923 = -_4909;
        float _4925 = fma(_4923, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4919);
        float _4927 = fma(_4563, _4909, _4921);
        float _4929 = precise::clamp(_4927, 0.0, 1.0);
        float _4931 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4933 = _4925 + _4931;
        float _4935 = _4907 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4937 = _4933 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4939 = precise::clamp(_4937, 0.0, 1.0);
        float _4941 = exp2(_4935);
        float _4943 = _4941 * _4939;
        float _4945 = _4929 * _4943;
        float _4947 = _4945 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4949 = _4945 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4951 = _4945 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _4947;
        out.m_84.y = _4949;
        out.m_84.z = _4951;
    }
    out.m_86.x = _4863;
    out.m_86.y = _4865;
    out.m_86.z = _4867;
    if (_4847)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4953 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4953;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4711 = false;
    bool _693 = false;
    bool _579 = false;
    bool _201 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_46.w;
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
        out.m_49.x = 0.0;
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
        float _5010 = as_type<float>(_121);
        out.gl_Position.z = _5010;
    }
    if (!_109)
    {
        return out;
    }
    float _125 = in.m_51.w;
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
        out.m_49.x = 0.0;
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
        float _5080 = as_type<float>(_159);
        out.gl_Position.z = _5080;
    }
    if (_151)
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
        float _183 = in.m_56.x;
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
    float _213 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _217 = _215 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _221 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _225 = _223 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _227 = 1.0 / _213;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _229;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _235 = _233 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _237 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _239 = isnan(_209);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = 1.0 / _217;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _253 = _209 + _251;
    bool _255 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _257 = 1.0 / _221;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _261 = _209 + _259;
    float _263 = _253 * _227;
    bool _265 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _267 = isnan(_209);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    bool _277 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _279 = isnan(_209);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = 1.0 / _225;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _291;
    float _295 = _261 * _249;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _299 = _209 + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _303 = _209 + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _307 = _209 + _305;
    float _309 = 1.0 / _231;
    float _311 = _299 * _257;
    float _313 = -_275;
    float _315 = _313 + 1.0;
    float _317 = _287 * _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _319;
    float _323 = 1.0 / _293;
    float _325 = _303 * _289;
    bool _327 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _329 = isnan(_209);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _341 = _209 + _339;
    float _343 = fma(_321, _263, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _345 = 1.0 / _235;
    float _347 = _307 * _309;
    float _349 = -_287;
    float _351 = _349 + 1.0;
    bool _353 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _355 = isnan(_209);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = _341 * _323;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _369 = _209 + _367;
    float _371 = _337 * _351;
    float _373 = -_337;
    float _375 = _373 + 1.0;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _377;
    float _381 = _363 * _375;
    float _383 = _369 * _345;
    bool _385 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _387 = isnan(_209);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = -_363;
    float _399 = _397 + 1.0;
    float _401 = fma(_379, _263, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _403 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _405 = isnan(_209);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = -_395;
    float _417 = _415 + 1.0;
    float _419 = _395 * _399;
    bool _421 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _423 = isnan(_209);
    bool _425 = _421 || _423;
    bool _427 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _429 = _425 || _427;
    float _431 = float(_429);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _437 = _247 * _417;
    float _439 = -_247;
    float _441 = _439 + 1.0;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _443;
    float _447 = -_431;
    float _449 = _447 + 1.0;
    float _451 = fma(_435, _295, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _453 = _431 * _441;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _459 = _413 * _449;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _461;
    float _465 = fma(_445, _311, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _467 = fma(_457, _295, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _469 = _401 * _459;
    float _471 = _343 * _459;
    float _473 = fma(_463, _311, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _477 = _475 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _483 = -_413;
    float _485 = _483 + 1.0;
    float _487 = fma(_477, _325, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _489 = fma(_481, _325, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _491 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[143].x, _469);
    float _493 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[143].y, _471);
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _499;
    float _503 = fma(_451, _453, _491);
    float _505 = fma(_467, _453, _493);
    float _507 = fma(_497, _347, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _509 = fma(_501, _347, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _519 = fma(_473, _437, _503);
    float _521 = fma(_465, _437, _505);
    float _523 = fma(_513, _383, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _525 = fma(_517, _383, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _527 = fma(_487, _419, _519);
    float _529 = fma(_489, _419, _521);
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _535;
    float _539 = fma(_507, _381, _527);
    float _541 = fma(_509, _381, _529);
    float _543 = fma(_533, _365, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _545 = fma(_537, _365, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _547 = fma(_523, _371, _539);
    float _549 = fma(_525, _371, _541);
    float _551 = fma(_543, _317, _547);
    float _553 = fma(_545, _317, _549);
    float _555 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[150].x, _551);
    float _557 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[150].y, _553);
    bool _559 = !_255;
    float _577;
    if (!_559)
    {
        float _561 = in.m_56.x;
        float _563 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _565 = _561 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _567 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _569 = _567 * _563;
        float _571 = floor(_569);
        float _573 = -_571;
        float _575 = _569 + _573;
        _577 = _575;
        _579 = true;
    }
    else
    {
        float _581 = float(_105);
        float _583 = 1.0 / _581;
        float _585 = _139 * _583;
        _577 = _585;
    }
    _579 = false;
    float _587 = _577;
    bool _589 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _591 = isnan(_587);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _597 = _593 || _595;
    float _599 = float(_597);
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _605 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _607 = isnan(_587);
    bool _609 = _605 || _607;
    bool _611 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _613 = _609 || _611;
    float _615 = float(_613);
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _617;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _623 = _587 + _621;
    float _625 = -_599;
    float _627 = _625 + 1.0;
    bool _629 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _631 = 1.0 / _603;
    float _633 = _615 * _627;
    float _635 = -_615;
    float _637 = _635 + 1.0;
    float _639 = _619 * _631;
    float _641 = fma(_639, _623, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _643 = _641 * _633;
    float _645 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[115].x, _643);
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _653 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[116].x, _645);
    float _655 = _647 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _657 = _649 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _659 = _651 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _661 = _653 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _663 = in.m_58.x;
    float _665 = in.m_58.y;
    out.m_60.x = _655;
    out.m_60.y = _657;
    out.m_60.z = _659;
    out.m_60.w = _661;
    float _667 = _557 * _665;
    float _669 = _555 * _663;
    bool _671 = !_629;
    float _673 = _661;
    float _691;
    if (!_671)
    {
        float _675 = in.m_56.x;
        float _677 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _679 = _675 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _681 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[11].w, _139);
        float _683 = _681 * _677;
        float _685 = floor(_683);
        float _687 = -_685;
        float _689 = _683 + _687;
        _691 = _689;
        _693 = true;
    }
    else
    {
        float _695 = float(_105);
        float _697 = 1.0 / _695;
        float _699 = _139 * _697;
        _691 = _699;
    }
    _693 = false;
    float _701 = _691;
    float _703 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _705 = int(_703);
    float _707 = float(_105);
    float _709 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _711 = int(_709);
    float _713 = float(_705);
    float _715 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _717 = int(_715);
    float _719 = float(uint(_711));
    float _721 = 1.0 / _713;
    int _723 = ~_711;
    int _725 = _723 + 1;
    int _727 = ~_711;
    int _729 = _727 + 1;
    float _731 = float(_711);
    bool _733 = _711 == 0;
    float _735 = 1.0 / _719;
    float _737 = float(_717);
    float _739 = _721 * _139;
    float _741 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _743 = int(_741);
    int _745 = as_type<int>(_735) + (-2);
    float _747 = trunc(_739);
    int _749 = int(_747);
    float _751 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _753 = int(_751);
    float _755 = float(uint(_743));
    float _757 = float(uint(_749));
    float _759 = 1.0 / _737;
    float _761 = as_type<float>(_745) * _757;
    float _763 = trunc(_761);
    float _765 = precise::max(_763, 0.0);
    uint _768 = uint(_765);
    float _770 = 1.0 / _755;
    float _772 = float(_753);
    float _774 = _759 * _139;
    int _776 = _725 * int(_768);
    int _778 = _776 + _749;
    float _780 = 1.0 / _772;
    float _782 = float(uint(_778));
    float _784 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _786 = int(_784);
    float _788 = as_type<float>(_745) * _782;
    int _790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _792 = _790 != 0;
    float _794 = trunc(_788);
    float _796 = precise::max(_794, 0.0);
    uint _798 = uint(_796);
    float _800 = in.m_56.x;
    float _802 = in.m_56.y;
    float _804 = in.m_56.z;
    float _806 = in.m_56.w;
    float _808 = _780 * _139;
    float _810 = 1.0 / _707;
    float _812 = float(uint(_786));
    int _814 = 0;
    if (_792)
    {
        _814 = 0;
    }
    int _816 = _814;
    int _818 = 0;
    int _820 = _816;
    if (_792)
    {
        _818 = 0;
    }
    int _822 = _818;
    float _824 = 0.0;
    int _826 = _822;
    if (_792)
    {
        _824 = 1.0;
    }
    float _828 = _824;
    float _830 = trunc(_774);
    int _832 = int(_830);
    int _834 = int(_768) + int(_798);
    float _836 = _828;
    if (_792)
    {
        _673 = 1.0;
    }
    float _838 = _673;
    int _840 = _729 * _834;
    int _842 = _840 + _749;
    float _844 = trunc(_808);
    int _846 = int(_844);
    float _848 = as_type<float>(_729);
    float _850 = _838;
    if (_792)
    {
        float _852 = in.m_56.x;
        _848 = _852;
    }
    float _854 = _848;
    bool _856 = _802 > 0.5;
    bool _858 = uint(_842) >= uint(_711);
    float _860 = float(_749);
    float _862 = 1.0 / _812;
    bool _864 = _804 > 0.5;
    bool _866 = _860 >= _731;
    bool _868 = isnan(_860);
    bool _870 = _866 || _868;
    bool _872 = isnan(_731);
    bool _874 = _870 || _872;
    float _876 = float(_874);
    int _878 = as_type<int>(_770) + (-2);
    float _880 = trunc(_876);
    int _882 = int(_880);
    bool _884 = !_858;
    float _886 = _884 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    int _888 = ~_834;
    int _890 = _888 + as_type<int>(_886);
    int _892 = _890 + 1;
    float _894 = _886;
    if (_792)
    {
        _894 = 1.0;
    }
    float _896 = _894;
    float _898 = -_175;
    int _900 = _856 ? as_type<int>(_898) : as_type<int>(_175);
    float _902 = 0.0;
    float _904 = _896;
    float _906 = _854;
    if (_792)
    {
        _902 = _854;
    }
    float _908 = _902;
    float _910 = _908;
    if (!_792)
    {
        float _912 = in.m_56.z;
        float _914 = in.m_56.y;
        _904 = 7.345489978790283203125;
        _910 = _914;
        _836 = 1.2345600128173828125;
        _906 = _912;
        _850 = 5.839270114898681640625;
        _820 = 1;
        _826 = 2;
    }
    float _916 = _904;
    float _918 = _910;
    float _920 = _836;
    float _922 = _906;
    float _924 = _850;
    int _926 = _820;
    int _928 = _826;
    float _930 = _916 * _800;
    int _932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _934 = _932 != 0;
    int _936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _938 = _936 != 0;
    int _940 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _942 = _940 != 0;
    float _944 = _918 * _920;
    float _946 = -_179;
    int _948 = _864 ? as_type<int>(_946) : as_type<int>(_179);
    float _950 = floor(_930);
    float _952 = float(uint(_832));
    float _954 = _810 * _139;
    int _956 = as_type<int>(_862) + (-2);
    int _958 = _711 * _892;
    int _960 = _958 + _749;
    bool _962 = !_938;
    float _964 = _962 ? _175 : as_type<float>(_900);
    float _966 = as_type<float>(_878) * _952;
    bool _968 = !_942;
    float _970 = _968 ? _179 : as_type<float>(_948);
    float _972 = _922 * _924;
    int _974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _976 = _974 != 0;
    int _978 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _980 = _978 != 0;
    int _982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _984 = _982 != 0;
    float _986 = trunc(_966);
    float _988 = precise::max(_986, 0.0);
    uint _990 = uint(_988);
    int _992 = ~_882;
    int _994 = _992 + 1;
    int _996 = _994 + 1;
    float _998 = _802 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1000 = !_733;
    int _1002 = _1000 ? _960 : (-1);
    bool _1004 = !_980;
    int _1006 = _1004 ? 0 : 1;
    float _1008 = -_950;
    float _1010 = _930 + _1008;
    int _1012 = _711 + (-1);
    int _1014 = _1002 * _996;
    int _1016 = abs(_1006);
    float _1018 = _1010 * _731;
    float _1020 = float(uint(_846));
    int _1022 = _882 * _1012;
    int _1024 = _1022 + _1014;
    int _1026 = ~_743;
    int _1028 = _1026 + 1;
    float _1030 = as_type<float>(_956) * _1020;
    int _1032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1034 = _1032 != 0;
    int _1036 = _1024 * _1016;
    float _1038 = _731 * _954;
    float _1040 = trunc(_1030);
    float _1042 = precise::max(_1040, 0.0);
    uint _1044 = uint(_1042);
    bool _1046 = !_1034;
    int _1048 = _1046 ? 0 : 1;
    int _1050 = _1028 * int(_990);
    int _1052 = _1050 + _832;
    int _1054 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1056 = _1054 != 0;
    int _1058 = abs(_1048);
    float _1060 = trunc(_1018);
    int _1062 = int(_1060);
    float _1064 = float(uint(_1052));
    bool _1066 = !_976;
    int _1068 = _1066 ? 0 : 1;
    bool _1070 = !_984;
    int _1072 = _1070 ? 0 : 1;
    float _1074 = as_type<float>(_878) * _1064;
    int _1076 = abs(_1068);
    float _1078 = trunc(_1038);
    int _1080 = int(_1078);
    int _1082 = ~_786;
    int _1084 = _1082 + 1;
    bool _1086 = !_1056;
    int _1088 = _1086 ? 0 : 1;
    int _1090 = abs(_1072);
    int _1092 = _1062 * _1058;
    int _1094 = _1092 + _749;
    int _1096 = _1084 * int(_1044);
    int _1098 = _1096 + _846;
    int _1100 = abs(_1088);
    float _1102 = trunc(_1074);
    float _1104 = precise::max(_1102, 0.0);
    uint _1106 = uint(_1104);
    bool _1108 = _806 > 0.5;
    float _1110 = float(_832);
    int _1112 = _1080 * _1076;
    int _1114 = _1112 + _1036;
    float _1116 = float(uint(_1098));
    int _1118 = _1094 * _1090;
    int _1120 = _1118 + _1114;
    float _1122 = floor(_944);
    int _1124 = ~_743;
    int _1126 = _1124 + 1;
    int _1128 = _1062 * _1100;
    int _1130 = _1128 + _1120;
    float _1132 = as_type<float>(_956) * _1116;
    int _1134 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1136 = _1134 != 0;
    int _1138 = int(_990) + int(_1106);
    float _1140 = trunc(_1132);
    float _1142 = precise::max(_1140, 0.0);
    uint _1144 = uint(_1142);
    float _1146 = float(uint(_1130));
    float _1148 = -_179;
    int _1150 = _1108 ? as_type<int>(_1148) : as_type<int>(_179);
    int _1152 = _1126 * _1138;
    int _1154 = _1152 + _832;
    int _1156 = ~_786;
    int _1158 = _1156 + 1;
    float _1160 = as_type<float>(_745) * _1146;
    float _1162 = float(_743);
    float _1164 = -_1122;
    float _1166 = _944 + _1164;
    bool _1168 = uint(_1154) >= uint(_743);
    float _1170 = floor(_972);
    bool _1172 = _1110 >= _1162;
    bool _1174 = isnan(_1110);
    bool _1176 = _1172 || _1174;
    bool _1178 = isnan(_1162);
    bool _1180 = _1176 || _1178;
    float _1182 = float(_1180);
    int _1184 = ~_711;
    int _1186 = _1184 + 1;
    bool _1188 = !_1136;
    int _1190 = _1188 ? 0 : 1;
    int _1192 = int(_1044) + int(_1144);
    float _1194 = trunc(_1160);
    float _1196 = precise::max(_1194, 0.0);
    uint _1198 = uint(_1196);
    bool _1200 = !_934;
    float _1202 = _1200 ? _179 : as_type<float>(_1150);
    float _1204 = _1166 * _1162;
    bool _1206 = !_1168;
    int _1208 = _1206 ? 0 : (-1);
    int _1210 = _1158 * _1192;
    int _1212 = _1210 + _846;
    int _1214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1216 = _1214 != 0;
    int _1218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1220 = _1218 != 0;
    int _1222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1224 = _1222 != 0;
    int _1226 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1228 = _1226 != 0;
    float _1230 = _1162 * _954;
    int _1232 = ~_1138;
    int _1234 = _1232 + _1208;
    int _1236 = _1234 + 1;
    float _1238 = trunc(_1182);
    int _1240 = int(_1238);
    float _1242 = -_1170;
    float _1244 = _972 + _1242;
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1248 = _1186 * int(_1198);
    int _1250 = _1248 + _1130;
    bool _1252 = !_1220;
    int _1254 = _1252 ? 0 : 1;
    float _1256 = trunc(_1230);
    int _1258 = int(_1256);
    bool _1260 = uint(_1212) >= uint(_786);
    int _1262 = _743 * _1236;
    int _1264 = _1262 + _832;
    float _1266 = float(uint(_1250));
    bool _1268 = !_1260;
    int _1270 = _1268 ? 0 : (-1);
    bool _1272 = _743 == 0;
    float _1274 = as_type<float>(_745) * _1266;
    int _1276 = ~_1240;
    int _1278 = _1276 + 1;
    int _1280 = _1278 + 1;
    float _1282 = trunc(_1204);
    int _1284 = int(_1282);
    bool _1286 = !_1272;
    int _1288 = _1286 ? _1264 : (-1);
    int _1290 = abs(_1190);
    int _1292 = _743 + (-1);
    int _1294 = _1288 * _1280;
    int _1296 = abs(_1254);
    float _1298 = trunc(_1274);
    float _1300 = precise::max(_1298, 0.0);
    uint _1302 = uint(_1300);
    int _1304 = ~_1192;
    int _1306 = _1304 + _1270;
    int _1308 = _1306 + 1;
    int _1310 = _1240 * _1292;
    int _1312 = _1310 + _1294;
    bool _1314 = !_1216;
    int _1316 = _1314 ? 0 : 1;
    float _1318 = float(_786);
    int _1320 = abs(_1316);
    int _1322 = _1284 * _1290;
    int _1324 = _1322 + _832;
    float _1326 = _1244 * _1318;
    float _1328 = float(_846);
    float _1330 = _1318 * _954;
    int _1332 = ~_711;
    int _1334 = _1332 + 1;
    int _1336 = _1312 * _1296;
    bool _1338 = !_1224;
    int _1340 = _1338 ? 0 : 1;
    int _1342 = int(_1198) + int(_1302);
    int _1344 = _1258 * _1320;
    int _1346 = _1344 + _1336;
    int _1348 = ~_711;
    int _1350 = _1348 + 1;
    int _1352 = abs(_1340);
    bool _1354 = !_1228;
    int _1356 = _1354 ? 0 : 1;
    int _1358 = _1350 * _1342;
    int _1360 = _1358 + _1130;
    bool _1362 = _1328 >= _1318;
    bool _1364 = isnan(_1328);
    bool _1366 = _1362 || _1364;
    bool _1368 = isnan(_1318);
    bool _1370 = _1366 || _1368;
    float _1372 = float(_1370);
    int _1374 = _1324 * _1352;
    int _1376 = _1374 + _1346;
    float _1378 = float(uint(_1094));
    bool _1380 = uint(_1360) >= uint(_711);
    int _1382 = abs(_1356);
    float _1384 = trunc(_1372);
    int _1386 = int(_1384);
    float _1388 = as_type<float>(_745) * _1378;
    bool _1390 = !_1380;
    int _1392 = _1390 ? 0 : (-1);
    int _1394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1396 = _1394 != 0;
    int _1398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1400 = _1398 != 0;
    int _1402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1404 = _1402 != 0;
    int _1406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1408 = _1406 != 0;
    int _1410 = _1284 * _1382;
    int _1412 = _1410 + _1376;
    float _1414 = trunc(_1388);
    float _1416 = precise::max(_1414, 0.0);
    uint _1418 = uint(_1416);
    int _1420 = _786 * _1308;
    int _1422 = _1420 + _846;
    bool _1424 = !_1408;
    int _1426 = _1424 ? 0 : 1;
    bool _1428 = _786 == 0;
    int _1430 = abs(_1426);
    float _1432 = trunc(_1326);
    int _1434 = int(_1432);
    int _1436 = ~_1386;
    int _1438 = _1436 + 1;
    int _1440 = _1438 + 1;
    bool _1442 = !_1428;
    int _1444 = _1442 ? _1422 : (-1);
    bool _1446 = !_1400;
    int _1448 = _1446 ? 0 : 1;
    int _1450 = ~_1342;
    int _1452 = _1450 + _1392;
    int _1454 = _1452 + 1;
    int _1456 = _1444 * _1440;
    float _1458 = float(uint(_1412));
    int _1460 = _1334 * int(_1418);
    int _1462 = _1460 + _1094;
    int _1464 = _786 + (-1);
    int _1466 = _711 * _1454;
    int _1468 = _1466 + _1130;
    int _1470 = abs(_1448);
    float _1472 = as_type<float>(_878) * _1458;
    float _1474 = float(uint(_1462));
    int _1476 = _1386 * _1464;
    int _1478 = _1476 + _1456;
    int _1480 = ~_743;
    int _1482 = _1480 + 1;
    bool _1484 = _711 == 0;
    float _1486 = trunc(_1472);
    float _1488 = precise::max(_1486, 0.0);
    uint _1490 = uint(_1488);
    float _1492 = as_type<float>(_745) * _1474;
    int _1494 = _1478 * _1470;
    bool _1496 = !_1396;
    int _1498 = _1496 ? 0 : 1;
    bool _1500 = !_1484;
    int _1502 = _1500 ? _1468 : (-1);
    float _1504 = trunc(_1330);
    int _1506 = int(_1504);
    int _1508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1510 = _1508 != 0;
    int _1512 = _1434 * _1430;
    int _1514 = _1512 + _846;
    int _1516 = abs(_1498);
    int _1518 = _1502 & 3;
    bool _1520 = _1518 != 0;
    int _1522 = _1482 * int(_1490);
    int _1524 = _1522 + _1412;
    float _1526 = trunc(_1492);
    float _1528 = precise::max(_1526, 0.0);
    uint _1530 = uint(_1528);
    bool _1532 = !_1404;
    int _1534 = _1532 ? 0 : 1;
    int _1536 = _1520 ? 0 : 1;
    float _1538 = float(uint(_1524));
    bool _1540 = !_1510;
    int _1542 = _1540 ? 0 : 1;
    int _1544 = _1502 & 3;
    bool _1546 = _1544 != 0;
    float _1548 = as_type<float>(_878) * _1538;
    int _1550 = abs(_1534);
    bool _1552 = uint(_1544) > 1u;
    float _1554 = trunc(_1548);
    float _1556 = precise::max(_1554, 0.0);
    uint _1558 = uint(_1556);
    int _1560 = abs(_1542);
    int _1562 = _1506 * _1516;
    int _1564 = _1562 + _1494;
    int _1566 = int(_1418) + int(_1530);
    int _1568 = _1514 * _1550;
    int _1570 = _1568 + _1564;
    int _1572 = ~_711;
    int _1574 = _1572 + 1;
    int _1576 = ~_1536;
    int _1578 = _1576 + 1;
    int _1580 = _1578 + 1;
    int _1582 = _1434 * _1560;
    int _1584 = _1582 + _1570;
    int _1586 = _1580;
    if (!_1552)
    {
        int _1588 = ~_1536;
        int _1590 = _1588 + 1;
        _1586 = _1590;
    }
    int _1592 = _1586;
    int _1594 = _1574 * _1566;
    int _1596 = _1594 + _1094;
    bool _1598 = uint(_1544) >= 2u;
    float _1600 = float(uint(_1584));
    int _1602 = ~_743;
    int _1604 = _1602 + 1;
    int _1606 = int(_1490) + int(_1558);
    float _1608 = as_type<float>(_956) * _1600;
    int _1610 = _1598 ? 0 : 1;
    bool _1612 = uint(_1596) >= uint(_711);
    int _1614 = _1604 * _1606;
    int _1616 = _1614 + _1412;
    float _1618 = float(uint(_1324));
    float _1620 = trunc(_1608);
    float _1622 = precise::max(_1620, 0.0);
    uint _1624 = uint(_1622);
    bool _1626 = !_1612;
    int _1628 = _1626 ? 0 : (-1);
    bool _1630 = uint(_1616) >= uint(_743);
    float _1632 = as_type<float>(_878) * _1618;
    int _1634 = ~_1566;
    int _1636 = _1634 + _1628;
    int _1638 = _1636 + 1;
    bool _1640 = !_1630;
    int _1642 = _1640 ? 0 : (-1);
    float _1644 = trunc(_1632);
    float _1646 = precise::max(_1644, 0.0);
    uint _1648 = uint(_1646);
    int _1650 = ~_786;
    int _1652 = _1650 + 1;
    int _1654 = _711 * _1638;
    int _1656 = _1654 + _1094;
    bool _1658 = _1544 != 3;
    int _1660 = ~_1606;
    int _1662 = _1660 + _1642;
    int _1664 = _1662 + 1;
    float _1666 = float(uint(_1514));
    int _1668 = _1652 * int(_1624);
    int _1670 = _1668 + _1584;
    int _1672 = ~_743;
    int _1674 = _1672 + 1;
    int _1676 = _743 * _1664;
    int _1678 = _1676 + _1412;
    int _1680 = ~_1610;
    int _1682 = _1680 + 1;
    int _1684 = _1682 + 1;
    float _1686 = as_type<float>(_956) * _1666;
    float _1688 = float(uint(_1670));
    int _1690 = _1684;
    if (_1658)
    {
        int _1692 = ~_1610;
        int _1694 = _1692 + 1;
        _1690 = _1694;
    }
    int _1696 = _1690;
    float _1698 = trunc(_1686);
    float _1700 = precise::max(_1698, 0.0);
    uint _1702 = uint(_1700);
    int _1704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1706 = _1704 != 0;
    float _1708 = as_type<float>(_956) * _1688;
    bool _1710 = !_1272;
    int _1712 = _1710 ? _1678 : (-1);
    bool _1714 = !_1706;
    int _1716 = _1714 ? 0 : 1;
    int _1718 = _1674 * int(_1648);
    int _1720 = _1718 + _1324;
    int _1722 = _1712 & 3;
    bool _1724 = _1722 != 0;
    float _1726 = trunc(_1708);
    float _1728 = precise::max(_1726, 0.0);
    uint _1730 = uint(_1728);
    int _1732 = _1712 & 3;
    bool _1734 = _1732 != 0;
    bool _1736 = !_1484;
    int _1738 = _1736 ? _1656 : (-1);
    int _1740 = _1724 ? 0 : 1;
    bool _1742 = uint(_1732) > 1u;
    float _1744 = float(uint(_1720));
    int _1746 = ~_786;
    int _1748 = _1746 + 1;
    int _1750 = ~_1740;
    int _1752 = _1750 + 1;
    int _1754 = _1752 + 1;
    float _1756 = as_type<float>(_878) * _1744;
    int _1758 = ~_786;
    int _1760 = _1758 + 1;
    float _1762 = trunc(_1756);
    float _1764 = precise::max(_1762, 0.0);
    uint _1766 = uint(_1764);
    int _1768 = int(_1624) + int(_1730);
    int _1770 = _1748 * int(_1702);
    int _1772 = _1770 + _1514;
    int _1774 = _1754;
    if (!_1742)
    {
        int _1776 = ~_1740;
        int _1778 = _1776 + 1;
        _1774 = _1778;
    }
    int _1780 = _1774;
    bool _1782 = uint(_1732) >= 2u;
    float _1784 = float(uint(_1772));
    int _1786 = _1782 ? 0 : 1;
    bool _1788 = _1732 != 3;
    float _1790 = as_type<float>(_956) * _1784;
    int _1792 = _1760 * _1768;
    int _1794 = _1792 + _1584;
    int _1796 = ~_743;
    int _1798 = _1796 + 1;
    int _1800 = ~_1786;
    int _1802 = _1800 + 1;
    int _1804 = _1802 + 1;
    int _1806 = int(_1648) + int(_1766);
    float _1808 = trunc(_1790);
    float _1810 = precise::max(_1808, 0.0);
    uint _1812 = uint(_1810);
    bool _1814 = !_1734;
    int _1816 = _1814 ? 0 : 1;
    int _1818 = _1804;
    if (_1788)
    {
        int _1820 = ~_1786;
        int _1822 = _1820 + 1;
        _1818 = _1822;
    }
    int _1824 = _1818;
    int _1826 = _1798 * _1806;
    int _1828 = _1826 + _1324;
    bool _1830 = uint(_1794) >= uint(_786);
    int _1832 = ~_786;
    int _1834 = _1832 + 1;
    bool _1836 = !_1830;
    int _1838 = _1836 ? 0 : (-1);
    bool _1840 = uint(_1828) >= uint(_743);
    int _1842 = ~_1768;
    int _1844 = _1842 + _1838;
    int _1846 = _1844 + 1;
    bool _1848 = !_1840;
    int _1850 = _1848 ? 0 : (-1);
    int _1852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1854 = _1852 != 0;
    int _1856 = _786 * _1846;
    int _1858 = _1856 + _1584;
    int _1860 = int(_1702) + int(_1812);
    int _1862 = _1502 >> 31;
    bool _1864 = !_1428;
    int _1866 = _1864 ? _1858 : (-1);
    int _1868 = _1834 * _1860;
    int _1870 = _1868 + _1514;
    bool _1872 = !_1854;
    int _1874 = _1872 ? 0 : 1;
    int _1876 = _1712 >> 31;
    int _1878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1880 = _1878 != 0;
    bool _1882 = !_1546;
    int _1884 = _1882 ? 0 : 1;
    int _1886 = _1866 & 3;
    bool _1888 = _1886 != 0;
    int _1890 = _1866 >> 31;
    int _1892 = _1862 & 3;
    int _1894 = _1876 & 3;
    bool _1896 = !_1880;
    int _1898 = _1896 ? 0 : 1;
    bool _1900 = uint(_1886) > 1u;
    int _1902 = _1890 & 3;
    int _1904 = _1502 + _1892;
    int _1906 = _1712 + _1894;
    int _1908 = _1866 & 3;
    bool _1910 = _1908 != 0;
    int _1912 = _1866 + _1902;
    int _1914 = _1904 >> 2;
    int _1916 = _1906 >> 2;
    int _1918 = _1910 ? 0 : 1;
    int _1920 = _1914 << 4;
    int _1922 = _1920 + 368;
    int _1924 = _1916 << 4;
    int _1926 = _1924 + 512;
    int _1928 = ~_1918;
    int _1930 = _1928 + 1;
    int _1932 = _1930 + 1;
    int _1934 = _1912 >> 2;
    int _1936 = _1932;
    if (!_1900)
    {
        int _1938 = ~_1918;
        int _1940 = _1938 + 1;
        _1936 = _1940;
    }
    int _1942 = _1936;
    uint _1944 = uint(int(uint(_1922) >> uint(2)));
    uint _1946 = uint(int(uint(int(_1944)) >> uint(2)));
    int _1948 = int(_1944) & 3;
    float _1950 = (*spvDescriptorSet0.vp_c9)._m0[int(_1946)][_1948];
    int _1952 = int(_1944) + 1;
    uint _1954 = uint(int(uint(_1952) >> uint(2)));
    int _1956 = _1952 & 3;
    float _1958 = (*spvDescriptorSet0.vp_c9)._m0[int(_1954)][_1956];
    int _1960 = _1934 << 4;
    int _1962 = _1960 + 656;
    bool _1964 = uint(_1870) >= uint(_786);
    int _1966 = ~_1806;
    int _1968 = _1966 + _1850;
    int _1970 = _1968 + 1;
    bool _1972 = !_1964;
    int _1974 = _1972 ? 0 : (-1);
    uint _1976 = uint(int(uint(_1926) >> uint(2)));
    uint _1978 = uint(int(uint(int(_1976)) >> uint(2)));
    int _1980 = int(_1976) & 3;
    float _1982 = (*spvDescriptorSet0.vp_c9)._m0[int(_1978)][_1980];
    int _1984 = int(_1976) + 1;
    uint _1986 = uint(int(uint(_1984) >> uint(2)));
    int _1988 = _1984 & 3;
    float _1990 = (*spvDescriptorSet0.vp_c9)._m0[int(_1986)][_1988];
    int _1992 = ~_1860;
    int _1994 = _1992 + _1974;
    int _1996 = _1994 + 1;
    float _1998 = _800 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _2000 = uint(_1886) >= 2u;
    float _2002 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2004 = _1544 != 3;
    uint _2006 = uint(int(uint(_1962) >> uint(2)));
    uint _2008 = uint(int(uint(int(_2006)) >> uint(2)));
    int _2010 = int(_2006) & 3;
    float _2012 = (*spvDescriptorSet0.vp_c9)._m0[int(_2008)][_2010];
    int _2014 = int(_2006) + 1;
    uint _2016 = uint(int(uint(_2014) >> uint(2)));
    int _2018 = _2014 & 3;
    float _2020 = (*spvDescriptorSet0.vp_c9)._m0[int(_2016)][_2018];
    int _2022 = _2000 ? 0 : 1;
    float _2024 = -_2002;
    float _2026 = fma(_1998, 2.0, _2024);
    int _2028 = _743 * _1970;
    int _2030 = _2028 + _1324;
    bool _2032 = _1732 != 3;
    int _2034 = _786 * _1996;
    int _2036 = _2034 + _1514;
    int _2038 = abs(_1592);
    float _2040 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2042 = int(_2040);
    int _2044 = _1926 + 8;
    uint _2046 = uint(int(uint(_2044) >> uint(2)));
    uint _2048 = uint(int(uint(int(_2046)) >> uint(2)));
    int _2050 = int(_2046) & 3;
    float _2052 = (*spvDescriptorSet0.vp_c9)._m0[int(_2048)][_2050];
    int _2054 = int(_2046) + 1;
    uint _2056 = uint(int(uint(_2054) >> uint(2)));
    int _2058 = _2054 & 3;
    float _2060 = (*spvDescriptorSet0.vp_c9)._m0[int(_2056)][_2058];
    int _2062 = abs(_1780);
    float _2064 = -_139;
    float _2066 = fma(_2064, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2026);
    int _2068 = abs(_1884);
    int _2070 = ~_2038;
    int _2072 = _2070 + 1;
    int _2074 = _2072 + 1;
    int _2076 = abs(_1942);
    int _2078 = _1962 + 8;
    uint _2080 = uint(int(uint(_2078) >> uint(2)));
    uint _2082 = uint(int(uint(int(_2080)) >> uint(2)));
    int _2084 = int(_2080) & 3;
    float _2086 = (*spvDescriptorSet0.vp_c9)._m0[int(_2082)][_2084];
    int _2088 = int(_2080) + 1;
    uint _2090 = uint(int(uint(_2088) >> uint(2)));
    int _2092 = _2088 & 3;
    float _2094 = (*spvDescriptorSet0.vp_c9)._m0[int(_2090)][_2092];
    int _2096 = ~_2062;
    int _2098 = _2096 + 1;
    int _2100 = _2098 + 1;
    bool _2102 = !_1888;
    int _2104 = _2102 ? 0 : 1;
    bool _2106 = _1886 != 3;
    int _2108 = _1922 + 8;
    uint _2110 = uint(int(uint(_2108) >> uint(2)));
    uint _2112 = uint(int(uint(int(_2110)) >> uint(2)));
    int _2114 = int(_2110) & 3;
    float _2116 = (*spvDescriptorSet0.vp_c9)._m0[int(_2112)][_2114];
    int _2118 = int(_2110) + 1;
    uint _2120 = uint(int(uint(_2118) >> uint(2)));
    int _2122 = _2118 & 3;
    float _2124 = (*spvDescriptorSet0.vp_c9)._m0[int(_2120)][_2122];
    int _2126 = ~_2068;
    int _2128 = _2126 + 1;
    int _2130 = _2128 + 1;
    int _2132 = abs(_2104);
    float _2134 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2136 = int(_2134);
    int _2138 = ~_2076;
    int _2140 = _2138 + 1;
    int _2142 = _2140 + 1;
    int _2144 = _2074 * as_type<int>(_1958);
    int _2146 = ~_2022;
    int _2148 = _2146 + 1;
    int _2150 = _2148 + 1;
    bool _2152 = !_2004;
    int _2154 = _2152 ? 0 : (-1);
    int _2156 = _2130 * as_type<int>(_1950);
    int _2158 = _2156 + _2144;
    int _2160 = abs(_1816);
    int _2162 = abs(_1696);
    int _2164 = _2100 * as_type<int>(_1990);
    int _2166 = ~_2160;
    int _2168 = _2166 + 1;
    int _2170 = _2168 + 1;
    int _2172 = _2150;
    if (_2106)
    {
        int _2174 = ~_2022;
        int _2176 = _2174 + 1;
        _2172 = _2176;
    }
    int _2178 = _2172;
    float _2180 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2182 = _2180 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2184 = abs(_1824);
    int _2186 = _2142 * as_type<int>(_2020);
    int _2188 = _2170 * as_type<int>(_1982);
    int _2190 = _2188 + _2164;
    float _2192 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2194 = int(_2192);
    int _2196 = ~_2132;
    int _2198 = _2196 + 1;
    int _2200 = _2198 + 1;
    bool _2202 = !_2032;
    int _2204 = _2202 ? 0 : (-1);
    int _2206 = _2200 * as_type<int>(_2012);
    int _2208 = _2206 + _2186;
    bool _2210 = _1886 != 3;
    float _2212 = 1.0 / _2182;
    int _2214 = ~_2184;
    int _2216 = _2214 + 1;
    int _2218 = _2216 + 1;
    int _2220 = abs(_2204);
    int _2222 = abs(_2178);
    int _2224 = _2218 * as_type<int>(_2052);
    int _2226 = _2224 + _2190;
    bool _2228 = !_2210;
    int _2230 = _2228 ? 0 : (-1);
    int _2232 = ~_2220;
    int _2234 = _2232 + 1;
    int _2236 = _2234 + 1;
    int _2238 = ~_2222;
    int _2240 = _2238 + 1;
    int _2242 = _2240 + 1;
    int _2244 = ~_2162;
    int _2246 = _2244 + 1;
    int _2248 = _2246 + 1;
    int _2250 = _2236 * as_type<int>(_2060);
    int _2252 = _2250 + _2226;
    int _2254 = abs(_2154);
    int _2256 = _2242 * as_type<int>(_2086);
    int _2258 = _2256 + _2208;
    int _2260 = abs(_2230);
    int _2262 = _2248 * as_type<int>(_2116);
    int _2264 = _2262 + _2158;
    int _2266 = abs(_1716);
    float _2268 = float(uint(_2042));
    int _2270 = abs(_1874);
    int _2272 = ~_2254;
    int _2274 = _2272 + 1;
    int _2276 = _2274 + 1;
    float _2278 = 1.0 / _2268;
    int _2280 = ~_2260;
    int _2282 = _2280 + 1;
    int _2284 = _2282 + 1;
    int _2286 = _2276 * as_type<int>(_2124);
    int _2288 = _2286 + _2264;
    int _2290 = abs(_1898);
    float _2292 = _800 * 2.0;
    int _2294 = ~_2266;
    int _2296 = _2294 + 1;
    int _2298 = _2296 + 1;
    int _2300 = _2284 * as_type<int>(_2094);
    int _2302 = _2300 + _2258;
    float _2304 = float(uint(_2194));
    float _2306 = in.m_46.x;
    float _2308 = in.m_46.y;
    float _2310 = in.m_46.z;
    int _2312 = ~_2270;
    int _2314 = _2312 + 1;
    int _2316 = _2314 + 1;
    int _2318 = _2288 * _2298;
    int _2320 = abs(_2136);
    float _2322 = floor(_2292);
    int _2324 = ~_2290;
    int _2326 = _2324 + 1;
    int _2328 = _2326 + 1;
    int _2330 = _1738 * _2266;
    int _2332 = _2330 + _2318;
    int _2334 = abs(_2042);
    int _2336 = _2252 * _2316;
    int _2338 = _2302 * _2328;
    bool _2340 = !_1272;
    int _2342 = _2340 ? _2030 : (-1);
    float _2344 = 1.0 / _2304;
    bool _2346 = !_1428;
    int _2348 = _2346 ? _2036 : (-1);
    int _2350 = as_type<int>(_2278) + (-2);
    int _2352 = _2342 * _2270;
    int _2354 = _2352 + _2336;
    float _2356 = float(uint(_2332));
    int _2358 = _2348 * _2290;
    int _2360 = _2358 + _2338;
    float _2362 = float(uint(_2334));
    float _2364 = float(uint(_2136));
    float _2366 = as_type<float>(_2350) * _2356;
    float _2368 = float(uint(_2360));
    float _2370 = _2308 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2372 = 1.0 / _2362;
    float _2374 = _2308 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2376 = _2308 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2378 = _800 + _802;
    int _2380 = as_type<int>(_2344) + (-2);
    int _2382 = abs(_2332);
    float _2384 = _2378 + (-1.0);
    float _2386 = 1.0 / _2364;
    float _2388 = fma(_2306, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2370);
    float _2390 = as_type<float>(_2380) * _2368;
    float _2392 = float(uint(_2320));
    float _2394 = fma(_2306, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2374);
    int _2396 = ~_2042;
    int _2398 = _2396 + 1;
    float _2400 = fma(_2306, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2376);
    float _2402 = trunc(_2366);
    float _2404 = precise::max(_2402, 0.0);
    uint _2406 = uint(_2404);
    int _2408 = abs(_2194);
    float _2410 = fma(_2310, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2394);
    int _2412 = as_type<int>(_2372) + (-2);
    float _2414 = fma(_2310, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2388);
    float _2416 = float(uint(_2382));
    float _2418 = fma(_2310, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2400);
    float _2420 = float(uint(_2354));
    float _2422 = 1.0 / _2392;
    int _2424 = as_type<int>(_2386) + (-2);
    float _2426 = as_type<float>(_2412) * _2416;
    float _2428 = _2414 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2430 = float(uint(_2408));
    float _2432 = as_type<float>(_2424) * _2420;
    int _2434 = _2398 * int(_2406);
    int _2436 = _2434 + _2332;
    float _2438 = fma(_2384, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2442 = _2440 != 0;
    float _2444 = trunc(_2426);
    float _2446 = precise::max(_2444, 0.0);
    uint _2448 = uint(_2446);
    float _2450 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2452 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2450;
    float _2454 = float(uint(_2436));
    int _2456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2458 = _2456 != 0;
    float _2460 = _2452 * _2212;
    int _2462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2464 = _2462 != 0;
    float _2466 = as_type<float>(_2350) * _2454;
    float _2468 = 1.0 / _2430;
    int _2470 = abs(_2354);
    float _2472 = fma(_998, -2.0, _1246);
    int _2474 = as_type<int>(_2422) + (-2);
    float _2476 = _802 + _804;
    float _2478 = float(uint(_2470));
    int _2480 = ~_2334;
    int _2482 = _2480 + 1;
    float _2484 = trunc(_2432);
    float _2486 = precise::max(_2484, 0.0);
    uint _2488 = uint(_2486);
    int _2490 = abs(_2360);
    float _2492 = as_type<float>(_2474) * _2478;
    int _2494 = ~_2136;
    int _2496 = _2494 + 1;
    int _2498 = _2482 * int(_2448);
    int _2500 = _2498 + _2382;
    float _2502 = _2476 + (-1.0);
    float _2504 = float(uint(_2490));
    float _2506 = trunc(_2390);
    float _2508 = precise::max(_2506, 0.0);
    uint _2510 = uint(_2508);
    int _2512 = as_type<int>(_2468) + (-2);
    float _2514 = float(uint(_2500));
    float _2516 = as_type<float>(_2512) * _2504;
    bool _2518 = _802 > 0.5;
    float _2520 = trunc(_2466);
    float _2522 = precise::max(_2520, 0.0);
    uint _2524 = uint(_2522);
    float _2526 = fma(_2502, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2528 = as_type<float>(_2412) * _2514;
    int _2530 = ~_2042;
    int _2532 = _2530 + 1;
    bool _2534 = _2322 >= 0.0;
    bool _2536 = isnan(_2322);
    bool _2538 = _2534 || _2536;
    bool _2540 = isnan(0.0);
    bool _2542 = _2538 || _2540;
    float _2544 = trunc(_2492);
    float _2546 = precise::max(_2544, 0.0);
    uint _2548 = uint(_2546);
    int _2550 = _2496 * int(_2488);
    int _2552 = _2550 + _2354;
    int _2554 = ~_2408;
    int _2556 = _2554 + 1;
    float _2558 = float(uint(_2552));
    float _2560 = trunc(_2516);
    float _2562 = precise::max(_2560, 0.0);
    uint _2564 = uint(_2562);
    int _2566 = int(_2406) + int(_2524);
    int _2568 = ~_2320;
    int _2570 = _2568 + 1;
    float _2572 = as_type<float>(_2424) * _2558;
    int _2574 = ~_2194;
    int _2576 = _2574 + 1;
    int _2578 = _2532 * _2566;
    int _2580 = _2578 + _2332;
    float _2582 = -_179;
    int _2584 = _2518 ? as_type<int>(_2582) : as_type<int>(_179);
    float _2586 = trunc(_2528);
    float _2588 = precise::max(_2586, 0.0);
    uint _2590 = uint(_2588);
    int _2592 = _2570 * int(_2548);
    int _2594 = _2592 + _2470;
    int _2596 = ~_2334;
    int _2598 = _2596 + 1;
    bool _2600 = uint(_2580) >= uint(_2042);
    int _2602 = _2576 * int(_2510);
    int _2604 = _2602 + _2360;
    float _2606 = float(uint(_2594));
    float _2608 = trunc(_2572);
    float _2610 = precise::max(_2608, 0.0);
    uint _2612 = uint(_2610);
    bool _2614 = !_2600;
    int _2616 = _2614 ? 0 : (-1);
    int _2618 = _2556 * int(_2564);
    int _2620 = _2618 + _2490;
    bool _2622 = _926 != 1;
    float _2624 = as_type<float>(_2474) * _2606;
    float _2626 = float(uint(_2604));
    float _2628 = float(uint(_2620));
    int _2630 = int(_2448) + int(_2590);
    float _2632 = as_type<float>(_2380) * _2626;
    float _2634 = trunc(_2624);
    float _2636 = precise::max(_2634, 0.0);
    uint _2638 = uint(_2636);
    int _2640 = ~_2136;
    int _2642 = _2640 + 1;
    int _2644 = int(_2488) + int(_2612);
    float _2646 = as_type<float>(_2512) * _2628;
    bool _2648 = _804 > 0.5;
    float _2650 = trunc(_2632);
    float _2652 = precise::max(_2650, 0.0);
    uint _2654 = uint(_2652);
    int _2656 = ~_2566;
    int _2658 = _2656 + _2616;
    int _2660 = _2658 + 1;
    int _2662 = _2598 * _2630;
    int _2664 = _2662 + _2382;
    float _2666 = -_175;
    int _2668 = _2648 ? as_type<int>(_2666) : as_type<int>(_175);
    int _2670 = _2042 * _2660;
    int _2672 = _2670 + _2332;
    bool _2674 = !_2442;
    float _2676 = _2674 ? _179 : as_type<float>(_2584);
    int _2678 = _2642 * _2644;
    int _2680 = _2678 + _2354;
    bool _2682 = _2042 == 0;
    bool _2684 = uint(_2664) >= uint(_2334);
    bool _2686 = !_2458;
    float _2688 = _2686 ? _175 : as_type<float>(_2668);
    float _2690 = trunc(_2646);
    float _2692 = precise::max(_2690, 0.0);
    uint _2694 = uint(_2692);
    bool _2696 = _928 != 2;
    bool _2698 = !_2682;
    int _2700 = _2698 ? _2672 : (-1);
    bool _2702 = uint(_2680) >= uint(_2136);
    int _2704 = ~_2320;
    int _2706 = _2704 + 1;
    int _2708 = int(_2548) + int(_2638);
    int _2710 = _2332 ^ _2042;
    int _2712 = ~_2194;
    int _2714 = _2712 + 1;
    int _2716 = int(_2510) + int(_2654);
    int _2718 = _2706 * _2708;
    int _2720 = _2718 + _2470;
    bool _2722 = _2042 == 0;
    int _2724 = ~_2408;
    int _2726 = _2724 + 1;
    int _2728 = _2714 * _2716;
    int _2730 = _2728 + _2360;
    bool _2732 = !_2702;
    int _2734 = _2732 ? 0 : (-1);
    bool _2736 = uint(_2720) >= uint(_2320);
    int _2738 = int(_2564) + int(_2694);
    float _2740 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2742 = !_2736;
    int _2744 = _2742 ? 0 : (-1);
    bool _2746 = !_2684;
    float _2748 = _2746 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    int _2750 = ~_2644;
    int _2752 = _2750 + _2734;
    int _2754 = _2752 + 1;
    bool _2756 = uint(_2730) >= uint(_2194);
    int _2758 = _2726 * _2738;
    int _2760 = _2758 + _2490;
    bool _2762 = _800 > 0.5;
    int _2764 = _2136 * _2754;
    int _2766 = _2764 + _2354;
    bool _2768 = !_2756;
    int _2770 = _2768 ? 0 : (-1);
    float _2772 = -_175;
    int _2774 = _2762 ? as_type<int>(_2772) : as_type<int>(_175);
    bool _2776 = _2136 == 0;
    float _2778 = _2740 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2780 = uint(_2760) >= uint(_2408);
    int _2782 = ~_2716;
    int _2784 = _2782 + _2770;
    int _2786 = _2784 + 1;
    float _2788 = _802 * 2.0;
    bool _2790 = !_2776;
    int _2792 = _2790 ? _2766 : (-1);
    bool _2794 = _2136 == 0;
    int _2796 = _2194 * _2786;
    int _2798 = _2796 + _2360;
    int _2800 = _2354 ^ _2136;
    float _2802 = floor(_2788);
    int _2804 = ~_2744;
    int _2806 = _2708 + _2804;
    int _2808 = _2806 + 1;
    float _2810 = _804 * 2.0;
    float _2812 = as_type<float>(_2716);
    float _2814 = _2748;
    float _2816 = as_type<float>(_2564);
    float _2818 = as_type<float>(_2638);
    float _2820 = as_type<float>(_2808);
    float _2822 = as_type<float>(_2598);
    if (!_2622)
    {
        _2812 = _802;
    }
    float _2824 = _2812;
    int _2826 = ~as_type<int>(_2748);
    int _2828 = _2630 + _2826;
    int _2830 = _2828 + 1;
    float _2832 = _2824;
    if (!_2622)
    {
        _2814 = _2824;
    }
    float _2834 = _2814;
    float _2836 = floor(_2810);
    float _2838 = _2834;
    if (!_2622)
    {
        _2816 = _804;
    }
    float _2840 = _2816;
    float _2842 = _2840;
    if (!_2622)
    {
        _2818 = _804;
    }
    float _2844 = _2818;
    uint _2846 = uint(int(uint(_2710) >> uint(31)));
    uint _2848 = uint(int(uint(_2800) >> uint(31)));
    float _2850 = _2844;
    float _2852 = as_type<float>(_2848);
    if (_2622)
    {
        _2838 = _800;
    }
    float _2854 = _2838;
    if (_2622)
    {
        _2832 = _800;
    }
    float _2856 = _2832;
    if (_2622)
    {
        _2842 = _802;
    }
    float _2858 = _2842;
    float _2860 = _2854 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2622)
    {
        _2850 = _802;
    }
    float _2862 = _2850;
    bool _2864 = _2194 == 0;
    int _2866 = ~int(_2846);
    int _2868 = _2866 + 1;
    int _2870 = ~int(_2848);
    int _2872 = _2870 + 1;
    bool _2874 = !_2780;
    int _2876 = _2874 ? 0 : (-1);
    bool _2878 = !_2864;
    int _2880 = _2878 ? _2798 : (-1);
    bool _2882 = _2802 > 0.0;
    bool _2884 = _2802 >= 0.0;
    bool _2886 = isnan(_2802);
    bool _2888 = _2884 || _2886;
    bool _2890 = isnan(0.0);
    bool _2892 = _2888 || _2890;
    int _2894 = _2830 ^ _2868;
    int _2896 = _2808 ^ _2872;
    int _2898 = ~_2868;
    int _2900 = _2898 + _2894;
    int _2902 = _2900 + 1;
    int _2904 = ~_2872;
    int _2906 = _2904 + _2896;
    int _2908 = _2906 + 1;
    bool _2910 = _701 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2912 = isnan(_701);
    bool _2914 = _2910 || _2912;
    bool _2916 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2918 = _2914 || _2916;
    float _2920 = float(_2918);
    bool _2922 = !_2464;
    float _2924 = _2922 ? _175 : as_type<float>(_2774);
    if (_2696)
    {
        _2820 = _800;
    }
    float _2926 = _2820;
    float _2928 = -_2920;
    float _2930 = _2928 + 1.0;
    float _2932 = _2926;
    if (_2696)
    {
        _2852 = _802;
    }
    float _2934 = _2852;
    bool _2936 = !_2722;
    int _2938 = _2936 ? _2902 : (-1);
    float _2940 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2942 = _701 + _2940;
    bool _2944 = !_2794;
    int _2946 = _2944 ? _2908 : (-1);
    float _2948 = _2934;
    if (!_2696)
    {
        _2932 = _804;
    }
    float _2950 = _2932;
    float _2952 = fma(_2460, _2942, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (!_2696)
    {
        _2948 = _800;
    }
    float _2954 = _2948;
    float _2956 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2958 = _2428 + _2956;
    int _2960 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2962 = _2960 != 0;
    int _2964 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2966 = _2964 != 0;
    int _2968 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2970 = _2968 != 0;
    bool _2972 = _2836 >= 0.0;
    bool _2974 = isnan(_2836);
    bool _2976 = _2972 || _2974;
    bool _2978 = isnan(0.0);
    bool _2980 = _2976 || _2978;
    bool _2982 = _701 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2984 = isnan(_701);
    bool _2986 = _2982 || _2984;
    bool _2988 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2990 = _2986 || _2988;
    float _2992 = float(_2990);
    int _2994 = _2542 ? 0 : 1;
    bool _2996 = _2836 > 0.0;
    float _2998 = _2410 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _3000 = _2980 ? 0 : 1;
    float _3002 = _2992 * _2930;
    bool _3004 = _2194 == 0;
    float _3006 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3008 = _2998 + _3006;
    int _3010 = _2360 ^ _2194;
    float _3012 = _2952 * _3002;
    int _3014 = ~_2876;
    int _3016 = _2738 + _3014;
    int _3018 = _3016 + 1;
    float _3020 = _2418 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    uint _3022 = uint(int(uint(_3010) >> uint(31)));
    float _3024 = _3008 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3026 = -_2992;
    float _3028 = _3026 + 1.0;
    float _3030 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3032 = _3020 + _3030;
    int _3034 = ~int(_3022);
    int _3036 = _3034 + 1;
    float _3038 = fma(_2958, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3024);
    float _3040 = fma(_3028, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3012);
    int _3042 = ~_3000;
    int _3044 = _3042 + 1;
    int _3046 = _3044 + 1;
    float _3048 = _2950 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _3050 = fma(_3032, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3038);
    int _3052 = _3018 ^ _3036;
    float _3054 = fma(_2920, (*spvDescriptorSet0.vp_c9)._m0[132].x, _3040);
    int _3056 = _3046;
    if (!_2996)
    {
        int _3058 = ~_3000;
        int _3060 = _3058 + 1;
        _3056 = _3060;
    }
    int _3062 = _3056;
    float _3064 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3066 = ~_3036;
    int _3068 = _3066 + _3052;
    int _3070 = _3068 + 1;
    float _3072 = _3054 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _3074 = _3050 >= 0.0;
    float _3076 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _3078 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3080 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3082 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3084 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3086 = _3078 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3088 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _3090 = _3080 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3092 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3094 = _3082 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3096 = -_3088;
    float _3098 = fma(_3048, 2.0, _3096);
    float _3100 = fma(_2856, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3084);
    float _3102 = fma(_2862, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3092);
    float _3104 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    out.m_62.x = _3086;
    out.m_62.y = _3090;
    out.m_62.z = _3094;
    out.m_62.w = _3072;
    float _3106 = float(_2700);
    float _3108 = _3064 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[82].x);
    if (_3074)
    {
        _2822 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3112 = _2822;
    float _3114 = _3076 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3116 = fma(_2778, _3106, _2066);
    float _3118 = float(_2880);
    float _3120 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3122 = float(_2792);
    float _3124 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3100);
    float _3126 = float(_2938);
    float _3128 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3130 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3132 = _2858 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_3074)
    {
        float _3134 = _3112 * 5.0;
        _3110 = as_type<int>(_3134);
    }
    int _3136 = _3110;
    float _3138 = -_3128;
    float _3140 = fma(_2860, 2.0, _3138);
    float _3142 = _2954 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3146 = fma(_3132, -2.0, _3130);
    float _3148 = _3104 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3150 = -_139;
    float _3152 = fma(_3150, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3098);
    float _3154 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_3074)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9343 = as_type<float>(_3136);
        out.gl_Position.z = _9343;
    }
    float _3156 = -_139;
    float _3158 = fma(_3156, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3140);
    float _3160 = fma(_3148, _3118, _3152);
    float _3162 = fma(_3142, -2.0, _3154);
    float _3164 = _2924 + 0.5;
    float _3166 = fma(_3108, _3122, _3158);
    float _3168 = float(_2946);
    float _3170 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3146);
    float _3172 = fma(_2778, _3164, _3116);
    bool _3174 = !_3004;
    int _3176 = _3174 ? _3070 : (-1);
    float _3178 = _3120 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3180 = _3144 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3182 = _964 + 0.5;
    float _3184 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2472);
    float _3186 = _2676 + (-0.5);
    float _3188 = -_3170;
    float _3190 = fma(_3180, _3168, _3188);
    float _3192 = fma(_3148, _3182, _3160);
    float _3194 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3162);
    float _3196 = -_3184;
    float _3198 = fma(_3114, _3126, _3196);
    float _3200 = _1202 + (-0.5);
    float _3202 = float(_3176);
    float _3204 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3206 = -_3114;
    float _3208 = fma(_3206, _3186, _3198);
    float _3210 = -_3180;
    float _3212 = fma(_3210, _3200, _3190);
    float _3214 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3216 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3204);
    float _3218 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3220 = log2(_3218);
    float _3222 = -_3194;
    float _3224 = fma(_3178, _3202, _3222);
    float _3226 = _970 + (-0.5);
    float _3228 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3214);
    float _3230 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3216);
    float _3232 = _2688 + 0.5;
    float _3234 = -_3178;
    float _3236 = fma(_3234, _3226, _3224);
    float _3238 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3228);
    float _3240 = -_3230;
    float _3242 = _3240 + 1.0;
    float _3244 = fma(_3108, _3232, _3166);
    float _3246 = -_3124;
    float _3248 = _3246 + 1.0;
    float _3250 = -_3238;
    float _3252 = _3250 + 1.0;
    float _3254 = -_3242;
    float _3256 = fma(_2924, _3254, _3172);
    float _3258 = -_3248;
    float _3260 = fma(_2688, _3258, _3244);
    float _3262 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3264 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3266 = _3220 * _139;
    float _3268 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3102);
    float _3270 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3262);
    float _3272 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3264);
    float _3274 = fma(_2676, _3252, _3208);
    float _3276 = _3008 * _3008;
    float _3278 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3270);
    float _3280 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3272);
    float _3282 = -_3268;
    float _3284 = _3282 + 1.0;
    float _3286 = fma(_2958, _2958, _3276);
    float _3288 = -_3278;
    float _3290 = _3288 + 1.0;
    float _3292 = -_3280;
    float _3294 = _3292 + 1.0;
    float _3296 = fma(_1202, _3284, _3212);
    float _3298 = -_3290;
    float _3300 = fma(_964, _3298, _3192);
    float _3302 = fma(_970, _3294, _3236);
    float _3304 = fma(_3032, _3032, _3286);
    float _3306 = in.m_64.x;
    float _3308 = in.m_64.y;
    float _3310 = in.m_64.z;
    bool _3312 = !_2966;
    int _3314 = _3312 ? 0 : 1;
    float _3316 = exp2(_3266);
    bool _3318 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3320 = isnan(1.0);
    bool _3322 = _3318 || _3320;
    bool _3324 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3326 = _3322 || _3324;
    float _3328 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3330 = 1.0 + _3328;
    out.m_66.x = _3256;
    out.m_66.y = _3274;
    out.m_66.z = _3260;
    out.m_66.w = _3296;
    bool _3332 = !_2970;
    int _3334 = _3332 ? 0 : 1;
    bool _3336 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3338 = isnan(0.0);
    bool _3340 = _3336 || _3338;
    bool _3342 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3344 = _3340 || _3342;
    out.m_68.x = _3300;
    out.m_68.y = _3302;
    float _3346 = rsqrt(_3304);
    int _3348 = ~_2994;
    int _3350 = _3348 + 1;
    int _3352 = _3350 + 1;
    int _3354 = _3352;
    if (_3074)
    {
        out.m_49.x = 0.0;
    }
    float _3356 = float(_3062);
    float _3358 = 1.0 / _3330;
    float _3360 = -_3316;
    float _3362 = _3360 + 1.0;
    bool _3364 = !_2962;
    int _3366 = _3364 ? 0 : 1;
    float _3368 = _3008 * _3346;
    float _3370 = _2958 * _3346;
    float _3372 = _3032 * _3346;
    float _3374 = _3372;
    if (_3074)
    {
        return out;
    }
    float _3376 = -_3368;
    float _3378 = fma(_3376, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2998);
    float _3380 = -_3370;
    float _3382 = fma(_3380, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2428);
    int _3384 = abs(_3366);
    float _3386 = -_3368;
    float _3388 = fma(_3386, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3008);
    float _3390 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3392 = _3378 + _3390;
    float _3394 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3396 = _3382 + _3394;
    float _3398 = -_3372;
    float _3400 = fma(_3398, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3020);
    float _3402 = _3388 * _3388;
    float _3404 = _3392 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _3406 = _2322 > 0.0;
    float _3408 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3410 = _3400 + _3408;
    int _3412 = abs(_3314);
    float _3414 = fma(_3396, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3404);
    float _3416 = float(_3384);
    float _3418 = -_3370;
    float _3420 = fma(_3418, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2958);
    float _3422 = _3344 ? _3362 : 0.0;
    float _3424 = fma(_3410, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3414);
    float _3426 = -_3372;
    float _3428 = fma(_3426, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3032);
    float _3430 = _3416 * _3356;
    float _3432 = fma(_3420, _3420, _3402);
    float _3434 = _3402;
    float _3436 = _3382;
    if (_3326)
    {
        float _3438 = _3422 * _3358;
        _141 = _3438;
    }
    float _3440 = _141;
    bool _3442 = _3424 >= 0.0;
    float _3444 = _3430 * (-2.0);
    float _3446 = _800 + (-0.5);
    if (!_3406)
    {
        int _3448 = ~_2994;
        int _3450 = _3448 + 1;
        _3354 = _3450;
    }
    int _3452 = _3354;
    float _3454 = fma(_3444, _3306, _3306);
    float _3456 = fma(_2438, _3444, _2438);
    float _3458 = float(_3412);
    float _3460 = fma(_3428, _3428, _3432);
    float _3462 = fma(_3446, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3454);
    float _3464 = float(_3452);
    float _3466 = _802 + (-0.5);
    int _3468 = _2892 ? 0 : 1;
    float _3470 = fma(_3456, _3440, _3462);
    if (_3442)
    {
        _3434 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3472 = _3434;
    float _3474 = _3458 * _3464;
    float _3476 = sqrt(_3460);
    float _3478 = _3470 * 0.15915493667125701904296875;
    int _3480 = ~_3468;
    int _3482 = _3480 + 1;
    int _3484 = _3482 + 1;
    float _3486 = _3474 * (-2.0);
    int _3488 = as_type<int>(_3472);
    int _3490 = _3484;
    if (_3442)
    {
        float _3492 = _3472 * 5.0;
        _3488 = as_type<int>(_3492);
    }
    int _3494 = _3488;
    if (_3442)
    {
        out.m_49.x = 0.0;
    }
    if (!_2882)
    {
        int _3496 = ~_3468;
        int _3498 = _3496 + 1;
        _3490 = _3498;
    }
    int _3500 = _3490;
    float _3502 = _3478 * 6.283185482025146484375;
    float _3504 = sin(_3502);
    float _3506 = fma(_2526, _3486, _2526);
    if (_3442)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9906 = as_type<float>(_3494);
        out.gl_Position.z = _9906;
    }
    float _3508 = fma(_3486, _3308, _3308);
    int _3510 = abs(_3334);
    if (_3442)
    {
        return out;
    }
    float _3512 = -_2998;
    float _3514 = _3512 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3516 = -_2428;
    float _3518 = _3516 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3520 = float(_3500);
    float _3522 = _3514 * _3514;
    float _3524 = float(_3510);
    float _3526 = -_3020;
    float _3528 = _3526 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3530 = _800 + _804;
    float _3532 = fma(_3518, _3518, _3522);
    float _3534 = fma(_3466, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3508);
    float _3536 = _3524 * _3520;
    float _3538 = _3530 + (-1.0);
    float _3540 = fma(_3528, _3528, _3532);
    float _3542 = _3536 * (-2.0);
    float _3544 = _804 + (-0.5);
    float _3546 = _3478 * 6.283185482025146484375;
    float _3548 = cos(_3546);
    float _3550 = fma(_3506, _3440, _3534);
    float _3552 = fma(_3538, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3554 = fma(_3542, _3310, _3310);
    float _3556 = _667 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3558 = _3550 * 0.15915493667125701904296875;
    float _3560 = fma(_3552, _3542, _3552);
    float _3562 = fma(_3544, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3554);
    float _3564 = rsqrt(_3540);
    float _3566 = _669 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3568 = fma(_3560, _3440, _3562);
    bool _3570 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3572 = isnan(0.5);
    bool _3574 = _3570 || _3572;
    bool _3576 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3578 = _3574 || _3576;
    bool _3580 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3582 = isnan(0.5);
    bool _3584 = _3580 || _3582;
    bool _3586 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3588 = _3584 || _3586;
    float _3590 = _3568 * 0.15915493667125701904296875;
    float _3592 = _3558 * 6.283185482025146484375;
    float _3594 = sin(_3592);
    float _3596 = _3518 * _3564;
    float _3598 = _3528 * _3564;
    float _3600 = _3514 * _3564;
    float _3602 = _3558 * 6.283185482025146484375;
    float _3604 = cos(_3602);
    float _3606 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3608 = _3596 * _3606;
    float _3610 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3612 = _3598 * _3610;
    float _3614 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3616 = _3600 * _3614;
    float _3618 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _179);
    float _3620 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3622 = -_3608;
    float _3624 = fma(_3598, _3620, _3622);
    float _3626 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3628 = -_3612;
    float _3630 = fma(_3600, _3626, _3628);
    float _3632 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3634 = -_3616;
    float _3636 = fma(_3596, _3632, _3634);
    float _3638 = _3346 * _3476;
    float _3640 = _3624 * _3624;
    float _3642 = _3590 * 6.283185482025146484375;
    float _3644 = sin(_3642);
    float _3646 = _3504 * _3594;
    float _3648 = _3638 * _3556;
    float _3650 = fma(_3630, _3630, _3640);
    float _3652 = _3638 * _3566;
    float _3654 = _3548 * _3604;
    float _3656 = fma(_3636, _3636, _3650);
    float _3658 = _3590 * 6.283185482025146484375;
    float _3660 = cos(_3658);
    float _3662 = _3618 * _3648;
    float _3664 = _3504 * _3604;
    float _3666 = rsqrt(_3656);
    float _3668 = fma(_3644, _3654, _3646);
    float _3670 = fma(_3644, _3646, _3654);
    float _3672 = _3548 * _3594;
    float _3674 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _175);
    float _3676 = -_3672;
    float _3678 = fma(_3644, _3664, _3676);
    float _3680 = _3548 * _3660;
    float _3682 = _3674 * _3652;
    float _3684 = _3604 * _3660;
    float _3686 = _3504 * _3660;
    float _3688 = _3680 * _3662;
    float _3690 = _3594 * _3660;
    float _3692 = -_3664;
    float _3694 = fma(_3644, _3672, _3692);
    float _3696 = _3638 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3698 = _3696 * 0.5;
    float _3700 = _3630 * _3666;
    float _3702 = _3624 * _3666;
    float _3704 = -_3662;
    float _3706 = _3644 * _3704;
    float _3708 = fma(_3668, _3682, _3688);
    float _3710 = _3600 * _3700;
    float _3712 = _3636 * _3666;
    float _3714 = _3686 * _3662;
    float _3716 = fma(_3684, _3682, _3706);
    float _3718 = fma(_3694, _3698, _3708);
    float _3720 = _3598 * _3702;
    float _3722 = -_3710;
    float _3724 = fma(_3596, _3702, _3722);
    float _3726 = fma(_3678, _3682, _3714);
    float _3728 = fma(_3690, _3698, _3716);
    float _3730 = -_3720;
    float _3732 = fma(_3600, _3712, _3730);
    float _3734 = _3724 * _3718;
    float _3736 = fma(_3670, _3698, _3726);
    float _3738 = _3378 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3740 = _3732 * _3718;
    float _3742 = fma(_3712, _3728, _3734);
    float _3744 = _3378 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3746 = fma(_3382, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3738);
    float _3748 = fma(_3700, _3728, _3740);
    float _3750 = fma(_3598, _3736, _3742);
    float _3752 = fma(_3382, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3744);
    float _3754 = fma(_3400, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3746);
    float _3756 = fma(_3596, _3736, _3748);
    float _3758 = _3020 + _3750;
    float _3760 = fma(_3400, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3752);
    float _3762 = _3754 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3764 = _2428 + _3756;
    float _3766 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3768 = _3758 + _3766;
    float _3770 = _3760 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3772 = 1.0 / _3762;
    float _3774 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3776 = _3764 + _3774;
    float _3778 = _3768 * _3768;
    float _3780 = _3596 * _3712;
    float _3782 = _3770 + _3762;
    float _3784 = fma(_3776, _3776, _3778);
    float _3786 = -_3780;
    float _3788 = fma(_3598, _3700, _3786);
    float _3790 = sqrt(_3784);
    float _3792 = _3788 * _3718;
    float _3794 = fma(_3702, _3728, _3792);
    float _3796 = _3782 * _3772;
    float _3798 = _3796 * 0.5;
    float _3800 = fma(_3600, _3736, _3794);
    float _3802 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3804 = fma(_3798, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3802);
    float _3806 = _2998 + _3800;
    float _3808 = 1.0 / _3804;
    bool _3810 = _3790 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3812 = _3736;
    float _3814 = _3792;
    float _3816 = _3758;
    float _3818 = _3728;
    float _3820 = _3790;
    if (!_3810)
    {
        _3812 = _3764;
    }
    float _3822 = _3812;
    float _3824 = _3822;
    if (!_3810)
    {
        _3814 = _3806;
    }
    float _3826 = _3814;
    bool _3828 = !_3810;
    float _3830 = _3826;
    if (!_3828)
    {
        float _3832 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3834 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3836 = _3790 + _3834;
        float _3838 = _3806 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3840 = rsqrt(_3784);
        float _3842 = _3836 * _3832;
        float _3844 = _3842 * 0.15915493667125701904296875;
        float _3846 = _3844 * 6.283185482025146484375;
        float _3848 = cos(_3846);
        float _3850 = _3844 * 6.283185482025146484375;
        float _3852 = sin(_3850);
        float _3854 = _3848 + (-1.0);
        float _3856 = fma(_3852, _3838, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3858 = _3854 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3860 = _3840 * _3856;
        float _3862 = fma(_3806, _3848, _3858);
        float _3864 = fma(_3776, _3860, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3866 = fma(_3768, _3860, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3830 = _3862;
        _3824 = _3864;
        _3816 = _3866;
        _3818 = _3852;
        _3820 = _3844;
    }
    float _3868 = _3830;
    float _3870 = _3824;
    float _3872 = _3816;
    float _3874 = _3818;
    float _3876 = _3820;
    float _3878 = -_3368;
    float _3880 = fma(_3878, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3868);
    float _3882 = -_3370;
    float _3884 = fma(_3882, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3870);
    float _3886 = -_3372;
    float _3888 = fma(_3886, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3872);
    float _3890 = _3876;
    float _3892 = _3884;
    float _3894 = _3888;
    float _3896 = _3874;
    float _3898 = _3870;
    if (_3588)
    {
        _3890 = 1.0;
    }
    float _3900 = _3890;
    float _3902 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3904 = _3808 * _3902;
    float _3906 = _3900;
    if (_3578)
    {
        _3374 = _3880;
    }
    float _3908 = _3374;
    float _3910 = _3908;
    if (!_3578)
    {
        float _3912 = _3392 * _3392;
        float _3914 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3916 = -_3020;
        float _3918 = _3916 + _3872;
        float _3920 = -_2998;
        float _3922 = _3920 + _3868;
        float _3924 = fma(_3396, _3396, _3912);
        float _3926 = -_2428;
        float _3928 = _3926 + _3870;
        float _3930 = fma(_3410, _3410, _3924);
        float _3932 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3934 = sqrt(_3930);
        float _3936 = 1.0 / _3638;
        float _3938 = _3932 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3940 = precise::min(_3934, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3942 = _3940 * _3914;
        float _3944 = _3942 * _3936;
        float _3946 = _3938 * _3944;
        float _3948 = _3918 * _3944;
        float _3950 = fma(_3922, _3946, _3378);
        float _3952 = fma(_3928, _3946, _3382);
        float _3954 = fma(_3938, _3948, _3400);
        _3910 = _3950;
        _3892 = _3952;
        _3894 = _3954;
        _3896 = _3912;
        _3898 = _3928;
    }
    float _3956 = _3910;
    float _3958 = _3892;
    float _3960 = _3894;
    float _3962 = _3896;
    float _3964 = _3898;
    float _3966 = _3962;
    float _3968 = _3964;
    if (!_3588)
    {
        float _3970 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3972 = _3970 * 0.15915493667125701904296875;
        float _3974 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3976 = _3972 * 6.283185482025146484375;
        float _3978 = cos(_3976);
        float _3980 = _3974 * 0.15915493667125701904296875;
        float _3982 = _3972 * 6.283185482025146484375;
        float _3984 = sin(_3982);
        float _3986 = 1.0 / _3978;
        float _3988 = _3980 * 6.283185482025146484375;
        float _3990 = cos(_3988);
        float _3992 = _3984 * _3986;
        float _3994 = _3980 * 6.283185482025146484375;
        float _3996 = sin(_3994);
        float _3998 = _3990 * _3992;
        float _4000 = 1.0 / _3998;
        float _4002 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4004 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4002;
        float _4006 = 1.0 / _4004;
        float _4008 = _3996 * _4000;
        float _4010 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4012 = fma(_3904, _4008, _4010);
        float _4014 = _4012 * _4006;
        float _4016 = precise::clamp(_4014, 0.0, 1.0);
        _3966 = _3980;
        _3968 = _4012;
        _3906 = _4016;
    }
    float _4018 = _3966;
    float _4020 = _3968;
    float _4022 = _3906;
    float _4024 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4026 = _3956 + _4024;
    float _4028 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4030 = _3958 + _4028;
    float _4032 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4034 = _3960 + _4032;
    float _4036 = _4026 * _4026;
    float _4038 = fma(_4030, _4030, _4036);
    float _4040 = fma(_4034, _4034, _4038);
    float _4042 = rsqrt(_4040);
    float _4044 = sqrt(_4040);
    float _4046 = _4042 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4048 = _4030 * _4046;
    float _4050 = _4034 * _4046;
    float _4052 = _4048 * _4048;
    float _4054 = _4050 * _4050;
    float _4056 = _4052 + _4054;
    float _4058 = sqrt(_4056);
    bool _4060 = _4058 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4062 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4064 = _4058 + _4062;
    float _4066 = _4042;
    float _4068 = _4064;
    float _4070 = _4018;
    float _4072 = _4026;
    float _4074 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _4076 = _4048;
    if (_4060)
    {
        float _4078 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4066 = _4078;
    }
    float _4080 = _4066;
    float _4082 = _4080;
    if (_4060)
    {
        float _4084 = _4064 * _4080;
        _4068 = _4084;
    }
    float _4086 = _4068;
    if (_4060)
    {
        float _4088 = rsqrt(_4056);
        _4082 = _4088;
    }
    float _4090 = _4082;
    float _4092 = _4090;
    if (_4060)
    {
        float _4094 = _4086 * 0.15915493667125701904296875;
        _4070 = _4094;
    }
    float _4096 = _4070;
    float _4098 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4100 = _4034;
    float _4102 = _4096;
    if (_4060)
    {
        float _4104 = _4096 * 6.283185482025146484375;
        float _4106 = sin(_4104);
        _4100 = _4106;
    }
    float _4108 = _4100;
    float _4110 = precise::max(0.0, _4098);
    float _4112 = _4020;
    if (_4060)
    {
        float _4114 = _4096 * 6.283185482025146484375;
        float _4116 = cos(_4114);
        _4112 = _4116;
    }
    float _4118 = _4112;
    float _4120 = -_4046;
    float _4122 = -_4110;
    float _4124 = fma(_4026, _4120, _4122);
    float _4126 = fma(_3382, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_4060)
    {
        float _4128 = _4124 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4072 = _4128;
    }
    float _4130 = _4072;
    float _4132 = _4108;
    float _4134 = _4130;
    if (_4060)
    {
        float _4136 = fma(_4108, _4130, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4132 = _4136;
    }
    float _4138 = _4132;
    float _4140 = _4138;
    if (!_4060)
    {
        _4102 = _4050;
    }
    float _4142 = _4102;
    float _4144 = _4142;
    if (_4060)
    {
        float _4146 = _4090 * _4138;
        _4074 = _4146;
    }
    float _4148 = _4074;
    if (!_4060)
    {
        _4092 = _4124;
    }
    float _4150 = _4092;
    float _4152 = _4150;
    float _4154 = _4118;
    if (_4060)
    {
        float _4156 = _4118 + (-1.0);
        _4134 = _4156;
    }
    float _4158 = _4134;
    if (_4060)
    {
        float _4160 = _4048 * _4148;
        _4076 = _4160;
    }
    float _4162 = _4076;
    if (!_4060)
    {
        _4140 = _4052;
    }
    float _4164 = _4140;
    float _4166 = _4164;
    if (_4060)
    {
        float _4168 = _4050 * _4148;
        _4144 = _4168;
    }
    float _4170 = _4144;
    if (_4060)
    {
        float _4172 = _4158 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3436 = _4172;
    }
    float _4174 = _3436;
    if (_4060)
    {
        float _4176 = _4162 * _4162;
        _4166 = _4176;
    }
    float _4178 = _4166;
    float _4180 = _3956 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_4060)
    {
        float _4182 = fma(_4124, _4118, _4174);
        _4152 = _4182;
    }
    float _4184 = _4152;
    if (!_4060)
    {
        _4154 = _4054;
    }
    float _4186 = _4154;
    float _4188 = _4186;
    if (_4060)
    {
        float _4190 = _4170 * _4170;
        _4188 = _4190;
    }
    float _4192 = _4188;
    float _4194 = fma(_4184, _4184, _4178);
    float _4196 = fma(_3958, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4180);
    float _4198 = floor(_4126);
    float _4200 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4202 = _4194 + _4192;
    float _4204 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4206 = fma(_4044, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4204);
    float _4208 = precise::clamp(_4206, 0.0, 1.0);
    float _4210 = fma(_3960, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4196);
    float _4212 = _3956 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4214 = -_4208;
    float _4216 = _4214 + 1.0;
    float _4218 = rsqrt(_4202);
    float _4220 = _4210 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4222 = fma(_3958, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4212);
    float _4224 = fma(_3400, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4226 = _3956 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4228 = abs(_4216);
    float _4230 = log2(_4228);
    float _4232 = _3956 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4234 = _4220 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4236 = fma(_3958, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4226);
    float _4238 = fma(_3960, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4222);
    float _4240 = fma(_3958, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4232);
    float _4242 = -_4234;
    float _4244 = fma(_4242, _4200, 1.0);
    float _4246 = fma(_3960, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4236);
    float _4248 = _4218 * _4162;
    float _4250 = fma(_3960, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4240);
    float _4252 = _4218 * _4184;
    float _4254 = _4246 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4256 = _4248 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4258 = _4250 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4260 = _4218 * _4170;
    float _4262 = floor(_4224);
    float _4264 = -_4256;
    float _4266 = fma(_4252, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4264);
    float _4268 = _4258 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4270 = _4230 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4272 = _4238 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4274 = -_4260;
    float _4276 = fma(_4274, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4266);
    float _4278 = fma(_4254, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4268);
    float _4280 = -_4198;
    float _4282 = _4126 + _4280;
    float _4284 = exp2(_4270);
    float _4286 = fma(_4276, -0.5, 0.5);
    float _4288 = fma(_4220, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4278);
    float _4290 = _4258 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4292 = _4252 + 1.0;
    float _4294 = fma(_4272, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4288);
    float _4296 = fma(_4254, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4290);
    float _4298 = log2(_4244);
    float _4300 = -_4262;
    float _4302 = _4224 + _4300;
    float _4304 = fma(_4220, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4296);
    float _4306 = 1.0 / _4294;
    float _4308 = fma(_4276, 0.5, 0.5);
    float _4310 = _4258 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4312 = fma(_4308, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4314 = fma(_4254, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4310);
    float _4316 = -_4252;
    float _4318 = fma(_4284, _4292, _4316);
    float _4320 = sqrt(_4286);
    float _4322 = fma(_4308, _4312, -0.212114393711090087890625);
    float _4324 = fma(_4220, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4314);
    float _4326 = fma(_4272, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4304);
    float _4328 = _4298 * 0.693147182464599609375;
    float _4330 = fma(_4308, _4322, 1.570728778839111328125);
    float _4332 = fma(_4272, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4324);
    float2 _11205 = float2(_4282, _4302);
    float _4334 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11205, float2(0.0), isnan(_11205)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11205, float2(0.0), isnan(_11205)), level(0.0)).x;
    float _4336 = _4326 * _4306;
    float _4338 = _4328 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4340 = _4332 * _4306;
    float _4342 = fma(_4318, 0.5, 0.5);
    float _4344 = fma(_4336, 0.5, 0.5);
    float _4346 = fma(_4340, -0.5, 0.5);
    float _4348 = _4320 * 0.636619746685028076171875;
    float3 _11235 = float3(_4344, _4346, _4338);
    float _4350 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11235, float3(0.0), isnan(_11235)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11235, float3(0.0), isnan(_11235)), level(0.0)).x;
    float3 _11246 = float3(_4344, _4346, _4338);
    float4 _4353 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11246, float3(0.0), isnan(_11246)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11246, float3(0.0), isnan(_11246)), level(0.0)).xyzw;
    float _4355 = _4353.x;
    float _4357 = _4353.y;
    float _4359 = _4353.z;
    float _4361 = _4353.w;
    float _4363 = -_4330;
    float _4365 = fma(_4348, _4363, 1.0);
    float2 _11267 = float2(_4365, _4342);
    float3 _4369 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11267, float2(0.0), isnan(_11267)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11267, float2(0.0), isnan(_11267)), level(0.0)).xyz;
    float _4371 = _4369.x;
    float _4373 = _4369.y;
    float _4375 = _4369.z;
    float _4377 = abs(_3904);
    float _4379 = log2(_4377);
    float _4381 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4383 = _175 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _4385 = _4044 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4387 = isnan(_4044);
    bool _4389 = _4385 || _4387;
    bool _4391 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4393 = _4389 || _4391;
    float _4395 = _4379 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4397 = exp2(_4395);
    float _4399 = _3668 * _3732;
    float _4401 = _3694 * _3788;
    float _4403 = fma(_3684, _3700, _4399);
    float _4405 = fma(_3678, _3596, _4403);
    float _4407 = fma(_4397, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4409 = precise::clamp(_4407, 0.0, 1.0);
    float _4411 = _3680 * _3788;
    float _4413 = fma(_4409, -2.0, 3.0);
    float _4415 = _4409 * _4409;
    float _4417 = _3668 * _3788;
    float _4419 = _3668 * _3724;
    float _4421 = _3694 * _3732;
    float _4423 = _4415 * _4413;
    float _4425 = _3680 * _3732;
    float _4427 = _3680 * _3724;
    float _4429 = fma(_3684, _3712, _4419);
    float _4431 = fma(_4381, _4381, 1.0);
    float _4433 = _3694 * _3724;
    float _4435 = -_3644;
    float _4437 = fma(_4435, _3712, _4427);
    float _4439 = fma(_3690, _3700, _4421);
    float _4441 = fma(_3684, _3702, _4417);
    float _4443 = -_3644;
    float _4445 = fma(_4443, _3702, _4411);
    float _4447 = rsqrt(_4431);
    float _4449 = fma(_3690, _3702, _4401);
    float _4451 = fma(_3690, _3712, _4433);
    float _4453 = -_3644;
    float _4455 = fma(_4453, _3700, _4425);
    float _4457 = fma(_3670, _3596, _4439);
    float _4459 = _4230 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4461 = -_4423;
    float _4463 = _4461 + 1.0;
    float _4465 = fma(_3686, _3596, _4455);
    float _4467 = fma(_3686, _3600, _4445);
    float _4469 = _4258 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4471 = fma(_4463, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4423);
    float _4473 = exp2(_4459);
    bool _4475 = _3904 <= 8000.0;
    bool _4477 = isnan(_3904);
    bool _4479 = _4475 || _4477;
    bool _4481 = isnan(8000.0);
    bool _4483 = _4479 || _4481;
    float _4485 = float(_4483);
    float _4487 = fma(_4254, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4469);
    float _4489 = fma(_3670, _3600, _4449);
    float _4491 = fma(_3678, _3600, _4441);
    float _4493 = in.m_70.x;
    float _4495 = _4381 * _4465;
    float _4497 = fma(_3686, _3598, _4437);
    float _4499 = fma(_3670, _3598, _4451);
    float _4501 = _4381 * _4447;
    float _4503 = fma(_4220, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4487);
    float _4505 = fma(_3678, _3598, _4429);
    float _4507 = fma(_4383, _4405, _4495);
    float _4509 = -_4457;
    float _4511 = _4501 * _4509;
    float _4513 = fma(_4272, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4503);
    float _4515 = _4381 * _4467;
    float _4517 = _4485 * _4471;
    out.m_72.x = _4405;
    out.m_72.y = _4491;
    out.m_72.z = _4505;
    float _4519 = -_4489;
    float _4521 = _4501 * _4519;
    float _4523 = fma(_4447, _4465, _4511);
    float _4525 = _4381 * _4497;
    float _4527 = -_4499;
    float _4529 = _4501 * _4527;
    float _4531 = -_4473;
    float _4533 = _4531 + 1.0;
    float _4535 = fma(_4447, _4467, _4521);
    float _4537 = _4513 + _4294;
    float _4539 = _4326 + _4294;
    float _4541 = fma(_4447, _4497, _4529);
    float _4543 = _4537 * 0.5;
    float _4545 = _4294 * 0.5;
    float _4547 = fma(_4383, _4491, _4515);
    float _4549 = _4517 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4551 = fma(_4383, _4505, _4525);
    float _4553 = fma(_4332, -0.5, _4545);
    float _4555 = _4457 + _4507;
    float _4557 = _4533 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4559 = _4539 * 0.5;
    out.gl_Position.x = _4326;
    out.gl_Position.y = _4332;
    out.gl_Position.z = _4513;
    out.gl_Position.w = _4294;
    float _4561 = _4489 + _4547;
    float _4563 = _4499 + _4551;
    out.m_74.x = _4559;
    out.m_74.y = _4553;
    out.m_74.z = _4543;
    out.m_74.w = _4294;
    out.m_76.x = _4555;
    out.m_76.y = _4561;
    out.m_76.z = _4563;
    out.m_78.x = _4523;
    out.m_78.y = _4535;
    out.m_78.z = _4541;
    float _4565 = -_4557;
    float _4567 = _4565 + 1.0;
    float _4569 = _4294;
    float _4571 = _4513;
    float _4573 = _4332;
    float _4575 = _4535;
    float _4577 = _4523;
    float _4579 = _4567;
    if (!_4393)
    {
        _4569 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4581 = _4569;
    float _4583 = _4581;
    float _4585 = _4581;
    if (!_4393)
    {
        _4571 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4587 = _4571;
    float _4589 = _4587;
    float _4591 = _4587;
    if (!_4393)
    {
        _4573 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4593 = _4573;
    float _4595 = _4022 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4597 = _4593;
    float _4599 = _4593;
    if (!_4393)
    {
        _4575 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4601 = _4575;
    float _4603 = _4601;
    float _4605 = _4601;
    if (!_4393)
    {
        _4577 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4607 = _4577;
    float _4609 = -_4334;
    float _4611 = _4609 + 1.0;
    float _4613 = _4611 * _4549;
    float _4615 = precise::clamp(_4613, 0.0, 1.0);
    float _4617 = -_4615;
    float _4619 = fma(_4617, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4621 = _4557 * _4350;
    float _4623 = _4619 * _4493;
    float _4625 = _4361 * _4567;
    float _4627 = _4607;
    float _4629 = _4607;
    if (!_4393)
    {
        _4579 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4631 = _4579;
    float _4633 = _4361 * _4621;
    float _4635 = _4623 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4637 = _4375 * _4621;
    float _4639 = fma(_4371, _4633, _4355);
    float _4641 = fma(_4373, _4633, _4357);
    out.m_80.x = _4635;
    float _4643 = fma(_4361, _4637, _4359);
    out.m_82.x = _4639;
    out.m_82.y = _4641;
    out.m_82.z = _4643;
    out.m_82.w = _4625;
    bool _4645 = !_4393;
    float _4647 = _4631;
    float _4649 = _4631;
    if (!_4645)
    {
        bool _4651 = _4044 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4653 = isnan(_4044);
        bool _4655 = _4651 || _4653;
        bool _4657 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4659 = _4655 || _4657;
        if (!_4659)
        {
            float _4661 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4663 = _4044 + _4661;
            float _4665 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4667 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4665;
            float _4669 = 1.0 / _4667;
            float _4671 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4673 = _4671 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4675 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4677 = _4675 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4679 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4681 = _4679 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4683 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4685 = _4683 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4687 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4689 = _4687 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4691 = _4663 * _4669;
            float _4693 = precise::clamp(_4691, 0.0, 1.0);
            float _4695 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4697 = _4695 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4699 = fma(_4693, _4673, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4701 = fma(_4693, _4697, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4703 = fma(_4693, _4677, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4705 = fma(_4693, _4681, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4707 = fma(_4693, _4685, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4709 = fma(_4693, _4689, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4629 = _4701;
            _4599 = _4707;
            _4605 = _4699;
            _4591 = _4705;
            _4585 = _4703;
            _4649 = _4709;
            _4711 = true;
        }
        else
        {
            bool _4713 = _4044 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4715 = isnan(_4044);
            bool _4717 = _4713 || _4715;
            bool _4719 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4721 = _4717 || _4719;
            if (!_4721)
            {
                _4603 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4723 = _4603;
            _4605 = _4723;
            if (!_4721)
            {
                _4627 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4725 = _4627;
            _4629 = _4725;
            if (!_4721)
            {
                _4583 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4727 = _4583;
            _4585 = _4727;
            if (!_4721)
            {
                _4589 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4729 = _4589;
            _4591 = _4729;
            if (!_4721)
            {
                _4597 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4731 = _4597;
            _4599 = _4731;
            if (!_4721)
            {
                _4647 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4733 = _4647;
            bool _4735 = !_4721;
            _4649 = _4733;
            if (!_4735)
            {
                bool _4737 = _4044 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4739 = isnan(_4044);
                bool _4741 = _4737 || _4739;
                bool _4743 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4745 = _4741 || _4743;
                if (!_4745)
                {
                    float _4747 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4749 = _4044 + _4747;
                    float _4751 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4753 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4751;
                    float _4755 = 1.0 / _4753;
                    float _4757 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4759 = _4757 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4761 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4763 = _4761 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4765 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4767 = _4765 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4769 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4771 = _4769 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4773 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4775 = _4773 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4777 = _4749 * _4755;
                    float _4779 = precise::clamp(_4777, 0.0, 1.0);
                    float _4781 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4783 = _4781 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4785 = fma(_4779, _4759, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4787 = fma(_4779, _4783, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4789 = fma(_4779, _4763, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4791 = fma(_4779, _4767, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4793 = fma(_4779, _4771, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4795 = fma(_4779, _4775, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4629 = _4787;
                    _4599 = _4793;
                    _4605 = _4785;
                    _4591 = _4791;
                    _4585 = _4789;
                    _4649 = _4795;
                    _4711 = true;
                }
                else
                {
                    _4629 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4599 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4605 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4591 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4585 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4649 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4711 = false;
    float _4797 = _4629;
    float _4799 = _4599;
    float _4801 = _4605;
    float _4803 = _4591;
    float _4805 = _4585;
    float _4807 = _4649;
    float _4809 = fma(_4561, -0.5, 0.5);
    float _4811 = precise::clamp(_4809, 0.0, 1.0);
    float _4813 = -_4797;
    float _4815 = _4813 + _4799;
    float _4817 = -_4801;
    float _4819 = _4817 + _4803;
    out.m_84.x = 0.0;
    float _4821 = fma(_4811, _4815, _4797);
    float _4823 = -_4805;
    float _4825 = _4823 + _4807;
    float _4827 = fma(_4811, _4819, _4801);
    float _4829 = _4821 * 0.586610972881317138671875;
    bool _4831 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4833 = fma(_4811, _4825, _4805);
    float _4835 = _4595 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4837 = fma(_4827, 0.298911988735198974609375, _4829);
    bool _4839 = _4022 > 0.0;
    bool _4841 = isnan(_4022);
    bool _4843 = _4839 || _4841;
    bool _4845 = isnan(0.0);
    bool _4847 = _4843 || _4845;
    float _4849 = fma(_4833, 0.114477999508380889892578125, _4837);
    out.m_49.x = _4835;
    float _4851 = -_4849;
    float _4853 = _4827 + _4851;
    float _4855 = -_4849;
    float _4857 = _4821 + _4855;
    float _4859 = -_4849;
    float _4861 = _4833 + _4859;
    float _4863 = fma(_4853, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4849);
    float _4865 = fma(_4857, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4849);
    float _4867 = fma(_4861, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4849);
    bool _4869 = !_4831;
    if (!_4869)
    {
        float _4871 = -_3956;
        float _4873 = _4871 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4875 = -_3958;
        float _4877 = _4875 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4879 = -_3960;
        float _4881 = _4879 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4883 = _4873 * _4873;
        float _4885 = fma(_4877, _4877, _4883);
        float _4887 = fma(_4881, _4881, _4885);
        float _4889 = sqrt(_4887);
        float _4891 = rsqrt(_4887);
        float _4893 = -_4889;
        float _4895 = _4893 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4897 = _4895 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4899 = precise::clamp(_4897, 0.0, 1.0);
        float _4901 = _4877 * _4891;
        float _4903 = _4873 * _4891;
        float _4905 = abs(_4899);
        float _4907 = log2(_4905);
        float _4909 = _4881 * _4891;
        float _4911 = _4901 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4913 = _4561 * _4903;
        float _4915 = -_4903;
        float _4917 = -_4911;
        float _4919 = fma(_4915, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4917);
        float _4921 = fma(_4555, _4901, _4913);
        float _4923 = -_4909;
        float _4925 = fma(_4923, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4919);
        float _4927 = fma(_4563, _4909, _4921);
        float _4929 = precise::clamp(_4927, 0.0, 1.0);
        float _4931 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4933 = _4925 + _4931;
        float _4935 = _4907 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4937 = _4933 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4939 = precise::clamp(_4937, 0.0, 1.0);
        float _4941 = exp2(_4935);
        float _4943 = _4941 * _4939;
        float _4945 = _4929 * _4943;
        float _4947 = _4945 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4949 = _4945 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4951 = _4945 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _4947;
        out.m_84.y = _4949;
        out.m_84.z = _4951;
    }
    out.m_86.x = _4863;
    out.m_86.y = _4865;
    out.m_86.z = _4867;
    if (_4847)
    {
        return out;
    }
    float _4953 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4953;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4711 = false;
    bool _693 = false;
    bool _579 = false;
    bool _201 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_46.w;
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
        out.m_49.x = 0.0;
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
        float _5010 = as_type<float>(_121);
        out.gl_Position.z = _5010;
    }
    if (!_109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_51.w;
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
        out.m_49.x = 0.0;
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
        float _5080 = as_type<float>(_159);
        out.gl_Position.z = _5080;
    }
    if (_151)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _183 = in.m_56.x;
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
    float _213 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _217 = _215 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _221 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _225 = _223 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _227 = 1.0 / _213;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _229;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _235 = _233 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _237 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _239 = isnan(_209);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = 1.0 / _217;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _253 = _209 + _251;
    bool _255 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _257 = 1.0 / _221;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _261 = _209 + _259;
    float _263 = _253 * _227;
    bool _265 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _267 = isnan(_209);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    bool _277 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _279 = isnan(_209);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = 1.0 / _225;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _291;
    float _295 = _261 * _249;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _299 = _209 + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _303 = _209 + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _307 = _209 + _305;
    float _309 = 1.0 / _231;
    float _311 = _299 * _257;
    float _313 = -_275;
    float _315 = _313 + 1.0;
    float _317 = _287 * _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _319;
    float _323 = 1.0 / _293;
    float _325 = _303 * _289;
    bool _327 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _329 = isnan(_209);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _341 = _209 + _339;
    float _343 = fma(_321, _263, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _345 = 1.0 / _235;
    float _347 = _307 * _309;
    float _349 = -_287;
    float _351 = _349 + 1.0;
    bool _353 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _355 = isnan(_209);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = _341 * _323;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _369 = _209 + _367;
    float _371 = _337 * _351;
    float _373 = -_337;
    float _375 = _373 + 1.0;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _377;
    float _381 = _363 * _375;
    float _383 = _369 * _345;
    bool _385 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _387 = isnan(_209);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = -_363;
    float _399 = _397 + 1.0;
    float _401 = fma(_379, _263, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _403 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _405 = isnan(_209);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = -_395;
    float _417 = _415 + 1.0;
    float _419 = _395 * _399;
    bool _421 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _423 = isnan(_209);
    bool _425 = _421 || _423;
    bool _427 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _429 = _425 || _427;
    float _431 = float(_429);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _437 = _247 * _417;
    float _439 = -_247;
    float _441 = _439 + 1.0;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _443;
    float _447 = -_431;
    float _449 = _447 + 1.0;
    float _451 = fma(_435, _295, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _453 = _431 * _441;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _459 = _413 * _449;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _461;
    float _465 = fma(_445, _311, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _467 = fma(_457, _295, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _469 = _401 * _459;
    float _471 = _343 * _459;
    float _473 = fma(_463, _311, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _477 = _475 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _483 = -_413;
    float _485 = _483 + 1.0;
    float _487 = fma(_477, _325, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _489 = fma(_481, _325, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _491 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[143].x, _469);
    float _493 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[143].y, _471);
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _499;
    float _503 = fma(_451, _453, _491);
    float _505 = fma(_467, _453, _493);
    float _507 = fma(_497, _347, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _509 = fma(_501, _347, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _519 = fma(_473, _437, _503);
    float _521 = fma(_465, _437, _505);
    float _523 = fma(_513, _383, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _525 = fma(_517, _383, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _527 = fma(_487, _419, _519);
    float _529 = fma(_489, _419, _521);
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _535;
    float _539 = fma(_507, _381, _527);
    float _541 = fma(_509, _381, _529);
    float _543 = fma(_533, _365, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _545 = fma(_537, _365, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _547 = fma(_523, _371, _539);
    float _549 = fma(_525, _371, _541);
    float _551 = fma(_543, _317, _547);
    float _553 = fma(_545, _317, _549);
    float _555 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[150].x, _551);
    float _557 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[150].y, _553);
    bool _559 = !_255;
    float _577;
    if (!_559)
    {
        float _561 = in.m_56.x;
        float _563 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _565 = _561 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _567 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _569 = _567 * _563;
        float _571 = floor(_569);
        float _573 = -_571;
        float _575 = _569 + _573;
        _577 = _575;
        _579 = true;
    }
    else
    {
        float _581 = float(_105);
        float _583 = 1.0 / _581;
        float _585 = _139 * _583;
        _577 = _585;
    }
    _579 = false;
    float _587 = _577;
    bool _589 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _591 = isnan(_587);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _597 = _593 || _595;
    float _599 = float(_597);
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _605 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _607 = isnan(_587);
    bool _609 = _605 || _607;
    bool _611 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _613 = _609 || _611;
    float _615 = float(_613);
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _617;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _623 = _587 + _621;
    float _625 = -_599;
    float _627 = _625 + 1.0;
    bool _629 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _631 = 1.0 / _603;
    float _633 = _615 * _627;
    float _635 = -_615;
    float _637 = _635 + 1.0;
    float _639 = _619 * _631;
    float _641 = fma(_639, _623, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _643 = _641 * _633;
    float _645 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[115].x, _643);
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _653 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[116].x, _645);
    float _655 = _647 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _657 = _649 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _659 = _651 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _661 = _653 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _663 = in.m_58.x;
    float _665 = in.m_58.y;
    out.m_60.x = _655;
    out.m_60.y = _657;
    out.m_60.z = _659;
    out.m_60.w = _661;
    float _667 = _557 * _665;
    float _669 = _555 * _663;
    bool _671 = !_629;
    float _673 = _661;
    float _691;
    if (!_671)
    {
        float _675 = in.m_56.x;
        float _677 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _679 = _675 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _681 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[11].w, _139);
        float _683 = _681 * _677;
        float _685 = floor(_683);
        float _687 = -_685;
        float _689 = _683 + _687;
        _691 = _689;
        _693 = true;
    }
    else
    {
        float _695 = float(_105);
        float _697 = 1.0 / _695;
        float _699 = _139 * _697;
        _691 = _699;
    }
    _693 = false;
    float _701 = _691;
    float _703 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _705 = int(_703);
    float _707 = float(_105);
    float _709 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _711 = int(_709);
    float _713 = float(_705);
    float _715 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _717 = int(_715);
    float _719 = float(uint(_711));
    float _721 = 1.0 / _713;
    int _723 = ~_711;
    int _725 = _723 + 1;
    int _727 = ~_711;
    int _729 = _727 + 1;
    float _731 = float(_711);
    bool _733 = _711 == 0;
    float _735 = 1.0 / _719;
    float _737 = float(_717);
    float _739 = _721 * _139;
    float _741 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _743 = int(_741);
    int _745 = as_type<int>(_735) + (-2);
    float _747 = trunc(_739);
    int _749 = int(_747);
    float _751 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _753 = int(_751);
    float _755 = float(uint(_743));
    float _757 = float(uint(_749));
    float _759 = 1.0 / _737;
    float _761 = as_type<float>(_745) * _757;
    float _763 = trunc(_761);
    float _765 = precise::max(_763, 0.0);
    uint _768 = uint(_765);
    float _770 = 1.0 / _755;
    float _772 = float(_753);
    float _774 = _759 * _139;
    int _776 = _725 * int(_768);
    int _778 = _776 + _749;
    float _780 = 1.0 / _772;
    float _782 = float(uint(_778));
    float _784 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _786 = int(_784);
    float _788 = as_type<float>(_745) * _782;
    int _790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _792 = _790 != 0;
    float _794 = trunc(_788);
    float _796 = precise::max(_794, 0.0);
    uint _798 = uint(_796);
    float _800 = in.m_56.x;
    float _802 = in.m_56.y;
    float _804 = in.m_56.z;
    float _806 = in.m_56.w;
    float _808 = _780 * _139;
    float _810 = 1.0 / _707;
    float _812 = float(uint(_786));
    int _814 = 0;
    if (_792)
    {
        _814 = 0;
    }
    int _816 = _814;
    int _818 = 0;
    int _820 = _816;
    if (_792)
    {
        _818 = 0;
    }
    int _822 = _818;
    float _824 = 0.0;
    int _826 = _822;
    if (_792)
    {
        _824 = 1.0;
    }
    float _828 = _824;
    float _830 = trunc(_774);
    int _832 = int(_830);
    int _834 = int(_768) + int(_798);
    float _836 = _828;
    if (_792)
    {
        _673 = 1.0;
    }
    float _838 = _673;
    int _840 = _729 * _834;
    int _842 = _840 + _749;
    float _844 = trunc(_808);
    int _846 = int(_844);
    float _848 = as_type<float>(_729);
    float _850 = _838;
    if (_792)
    {
        float _852 = in.m_56.x;
        _848 = _852;
    }
    float _854 = _848;
    bool _856 = _802 > 0.5;
    bool _858 = uint(_842) >= uint(_711);
    float _860 = float(_749);
    float _862 = 1.0 / _812;
    bool _864 = _804 > 0.5;
    bool _866 = _860 >= _731;
    bool _868 = isnan(_860);
    bool _870 = _866 || _868;
    bool _872 = isnan(_731);
    bool _874 = _870 || _872;
    float _876 = float(_874);
    int _878 = as_type<int>(_770) + (-2);
    float _880 = trunc(_876);
    int _882 = int(_880);
    bool _884 = !_858;
    float _886 = _884 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    int _888 = ~_834;
    int _890 = _888 + as_type<int>(_886);
    int _892 = _890 + 1;
    float _894 = _886;
    if (_792)
    {
        _894 = 1.0;
    }
    float _896 = _894;
    float _898 = -_175;
    int _900 = _856 ? as_type<int>(_898) : as_type<int>(_175);
    float _902 = 0.0;
    float _904 = _896;
    float _906 = _854;
    if (_792)
    {
        _902 = _854;
    }
    float _908 = _902;
    float _910 = _908;
    if (!_792)
    {
        float _912 = in.m_56.z;
        float _914 = in.m_56.y;
        _904 = 7.345489978790283203125;
        _910 = _914;
        _836 = 1.2345600128173828125;
        _906 = _912;
        _850 = 5.839270114898681640625;
        _820 = 1;
        _826 = 2;
    }
    float _916 = _904;
    float _918 = _910;
    float _920 = _836;
    float _922 = _906;
    float _924 = _850;
    int _926 = _820;
    int _928 = _826;
    float _930 = _916 * _800;
    int _932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _934 = _932 != 0;
    int _936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _938 = _936 != 0;
    int _940 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _942 = _940 != 0;
    float _944 = _918 * _920;
    float _946 = -_179;
    int _948 = _864 ? as_type<int>(_946) : as_type<int>(_179);
    float _950 = floor(_930);
    float _952 = float(uint(_832));
    float _954 = _810 * _139;
    int _956 = as_type<int>(_862) + (-2);
    int _958 = _711 * _892;
    int _960 = _958 + _749;
    bool _962 = !_938;
    float _964 = _962 ? _175 : as_type<float>(_900);
    float _966 = as_type<float>(_878) * _952;
    bool _968 = !_942;
    float _970 = _968 ? _179 : as_type<float>(_948);
    float _972 = _922 * _924;
    int _974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _976 = _974 != 0;
    int _978 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _980 = _978 != 0;
    int _982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _984 = _982 != 0;
    float _986 = trunc(_966);
    float _988 = precise::max(_986, 0.0);
    uint _990 = uint(_988);
    int _992 = ~_882;
    int _994 = _992 + 1;
    int _996 = _994 + 1;
    float _998 = _802 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1000 = !_733;
    int _1002 = _1000 ? _960 : (-1);
    bool _1004 = !_980;
    int _1006 = _1004 ? 0 : 1;
    float _1008 = -_950;
    float _1010 = _930 + _1008;
    int _1012 = _711 + (-1);
    int _1014 = _1002 * _996;
    int _1016 = abs(_1006);
    float _1018 = _1010 * _731;
    float _1020 = float(uint(_846));
    int _1022 = _882 * _1012;
    int _1024 = _1022 + _1014;
    int _1026 = ~_743;
    int _1028 = _1026 + 1;
    float _1030 = as_type<float>(_956) * _1020;
    int _1032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1034 = _1032 != 0;
    int _1036 = _1024 * _1016;
    float _1038 = _731 * _954;
    float _1040 = trunc(_1030);
    float _1042 = precise::max(_1040, 0.0);
    uint _1044 = uint(_1042);
    bool _1046 = !_1034;
    int _1048 = _1046 ? 0 : 1;
    int _1050 = _1028 * int(_990);
    int _1052 = _1050 + _832;
    int _1054 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1056 = _1054 != 0;
    int _1058 = abs(_1048);
    float _1060 = trunc(_1018);
    int _1062 = int(_1060);
    float _1064 = float(uint(_1052));
    bool _1066 = !_976;
    int _1068 = _1066 ? 0 : 1;
    bool _1070 = !_984;
    int _1072 = _1070 ? 0 : 1;
    float _1074 = as_type<float>(_878) * _1064;
    int _1076 = abs(_1068);
    float _1078 = trunc(_1038);
    int _1080 = int(_1078);
    int _1082 = ~_786;
    int _1084 = _1082 + 1;
    bool _1086 = !_1056;
    int _1088 = _1086 ? 0 : 1;
    int _1090 = abs(_1072);
    int _1092 = _1062 * _1058;
    int _1094 = _1092 + _749;
    int _1096 = _1084 * int(_1044);
    int _1098 = _1096 + _846;
    int _1100 = abs(_1088);
    float _1102 = trunc(_1074);
    float _1104 = precise::max(_1102, 0.0);
    uint _1106 = uint(_1104);
    bool _1108 = _806 > 0.5;
    float _1110 = float(_832);
    int _1112 = _1080 * _1076;
    int _1114 = _1112 + _1036;
    float _1116 = float(uint(_1098));
    int _1118 = _1094 * _1090;
    int _1120 = _1118 + _1114;
    float _1122 = floor(_944);
    int _1124 = ~_743;
    int _1126 = _1124 + 1;
    int _1128 = _1062 * _1100;
    int _1130 = _1128 + _1120;
    float _1132 = as_type<float>(_956) * _1116;
    int _1134 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1136 = _1134 != 0;
    int _1138 = int(_990) + int(_1106);
    float _1140 = trunc(_1132);
    float _1142 = precise::max(_1140, 0.0);
    uint _1144 = uint(_1142);
    float _1146 = float(uint(_1130));
    float _1148 = -_179;
    int _1150 = _1108 ? as_type<int>(_1148) : as_type<int>(_179);
    int _1152 = _1126 * _1138;
    int _1154 = _1152 + _832;
    int _1156 = ~_786;
    int _1158 = _1156 + 1;
    float _1160 = as_type<float>(_745) * _1146;
    float _1162 = float(_743);
    float _1164 = -_1122;
    float _1166 = _944 + _1164;
    bool _1168 = uint(_1154) >= uint(_743);
    float _1170 = floor(_972);
    bool _1172 = _1110 >= _1162;
    bool _1174 = isnan(_1110);
    bool _1176 = _1172 || _1174;
    bool _1178 = isnan(_1162);
    bool _1180 = _1176 || _1178;
    float _1182 = float(_1180);
    int _1184 = ~_711;
    int _1186 = _1184 + 1;
    bool _1188 = !_1136;
    int _1190 = _1188 ? 0 : 1;
    int _1192 = int(_1044) + int(_1144);
    float _1194 = trunc(_1160);
    float _1196 = precise::max(_1194, 0.0);
    uint _1198 = uint(_1196);
    bool _1200 = !_934;
    float _1202 = _1200 ? _179 : as_type<float>(_1150);
    float _1204 = _1166 * _1162;
    bool _1206 = !_1168;
    int _1208 = _1206 ? 0 : (-1);
    int _1210 = _1158 * _1192;
    int _1212 = _1210 + _846;
    int _1214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1216 = _1214 != 0;
    int _1218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1220 = _1218 != 0;
    int _1222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1224 = _1222 != 0;
    int _1226 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1228 = _1226 != 0;
    float _1230 = _1162 * _954;
    int _1232 = ~_1138;
    int _1234 = _1232 + _1208;
    int _1236 = _1234 + 1;
    float _1238 = trunc(_1182);
    int _1240 = int(_1238);
    float _1242 = -_1170;
    float _1244 = _972 + _1242;
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1248 = _1186 * int(_1198);
    int _1250 = _1248 + _1130;
    bool _1252 = !_1220;
    int _1254 = _1252 ? 0 : 1;
    float _1256 = trunc(_1230);
    int _1258 = int(_1256);
    bool _1260 = uint(_1212) >= uint(_786);
    int _1262 = _743 * _1236;
    int _1264 = _1262 + _832;
    float _1266 = float(uint(_1250));
    bool _1268 = !_1260;
    int _1270 = _1268 ? 0 : (-1);
    bool _1272 = _743 == 0;
    float _1274 = as_type<float>(_745) * _1266;
    int _1276 = ~_1240;
    int _1278 = _1276 + 1;
    int _1280 = _1278 + 1;
    float _1282 = trunc(_1204);
    int _1284 = int(_1282);
    bool _1286 = !_1272;
    int _1288 = _1286 ? _1264 : (-1);
    int _1290 = abs(_1190);
    int _1292 = _743 + (-1);
    int _1294 = _1288 * _1280;
    int _1296 = abs(_1254);
    float _1298 = trunc(_1274);
    float _1300 = precise::max(_1298, 0.0);
    uint _1302 = uint(_1300);
    int _1304 = ~_1192;
    int _1306 = _1304 + _1270;
    int _1308 = _1306 + 1;
    int _1310 = _1240 * _1292;
    int _1312 = _1310 + _1294;
    bool _1314 = !_1216;
    int _1316 = _1314 ? 0 : 1;
    float _1318 = float(_786);
    int _1320 = abs(_1316);
    int _1322 = _1284 * _1290;
    int _1324 = _1322 + _832;
    float _1326 = _1244 * _1318;
    float _1328 = float(_846);
    float _1330 = _1318 * _954;
    int _1332 = ~_711;
    int _1334 = _1332 + 1;
    int _1336 = _1312 * _1296;
    bool _1338 = !_1224;
    int _1340 = _1338 ? 0 : 1;
    int _1342 = int(_1198) + int(_1302);
    int _1344 = _1258 * _1320;
    int _1346 = _1344 + _1336;
    int _1348 = ~_711;
    int _1350 = _1348 + 1;
    int _1352 = abs(_1340);
    bool _1354 = !_1228;
    int _1356 = _1354 ? 0 : 1;
    int _1358 = _1350 * _1342;
    int _1360 = _1358 + _1130;
    bool _1362 = _1328 >= _1318;
    bool _1364 = isnan(_1328);
    bool _1366 = _1362 || _1364;
    bool _1368 = isnan(_1318);
    bool _1370 = _1366 || _1368;
    float _1372 = float(_1370);
    int _1374 = _1324 * _1352;
    int _1376 = _1374 + _1346;
    float _1378 = float(uint(_1094));
    bool _1380 = uint(_1360) >= uint(_711);
    int _1382 = abs(_1356);
    float _1384 = trunc(_1372);
    int _1386 = int(_1384);
    float _1388 = as_type<float>(_745) * _1378;
    bool _1390 = !_1380;
    int _1392 = _1390 ? 0 : (-1);
    int _1394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1396 = _1394 != 0;
    int _1398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1400 = _1398 != 0;
    int _1402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1404 = _1402 != 0;
    int _1406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1408 = _1406 != 0;
    int _1410 = _1284 * _1382;
    int _1412 = _1410 + _1376;
    float _1414 = trunc(_1388);
    float _1416 = precise::max(_1414, 0.0);
    uint _1418 = uint(_1416);
    int _1420 = _786 * _1308;
    int _1422 = _1420 + _846;
    bool _1424 = !_1408;
    int _1426 = _1424 ? 0 : 1;
    bool _1428 = _786 == 0;
    int _1430 = abs(_1426);
    float _1432 = trunc(_1326);
    int _1434 = int(_1432);
    int _1436 = ~_1386;
    int _1438 = _1436 + 1;
    int _1440 = _1438 + 1;
    bool _1442 = !_1428;
    int _1444 = _1442 ? _1422 : (-1);
    bool _1446 = !_1400;
    int _1448 = _1446 ? 0 : 1;
    int _1450 = ~_1342;
    int _1452 = _1450 + _1392;
    int _1454 = _1452 + 1;
    int _1456 = _1444 * _1440;
    float _1458 = float(uint(_1412));
    int _1460 = _1334 * int(_1418);
    int _1462 = _1460 + _1094;
    int _1464 = _786 + (-1);
    int _1466 = _711 * _1454;
    int _1468 = _1466 + _1130;
    int _1470 = abs(_1448);
    float _1472 = as_type<float>(_878) * _1458;
    float _1474 = float(uint(_1462));
    int _1476 = _1386 * _1464;
    int _1478 = _1476 + _1456;
    int _1480 = ~_743;
    int _1482 = _1480 + 1;
    bool _1484 = _711 == 0;
    float _1486 = trunc(_1472);
    float _1488 = precise::max(_1486, 0.0);
    uint _1490 = uint(_1488);
    float _1492 = as_type<float>(_745) * _1474;
    int _1494 = _1478 * _1470;
    bool _1496 = !_1396;
    int _1498 = _1496 ? 0 : 1;
    bool _1500 = !_1484;
    int _1502 = _1500 ? _1468 : (-1);
    float _1504 = trunc(_1330);
    int _1506 = int(_1504);
    int _1508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1510 = _1508 != 0;
    int _1512 = _1434 * _1430;
    int _1514 = _1512 + _846;
    int _1516 = abs(_1498);
    int _1518 = _1502 & 3;
    bool _1520 = _1518 != 0;
    int _1522 = _1482 * int(_1490);
    int _1524 = _1522 + _1412;
    float _1526 = trunc(_1492);
    float _1528 = precise::max(_1526, 0.0);
    uint _1530 = uint(_1528);
    bool _1532 = !_1404;
    int _1534 = _1532 ? 0 : 1;
    int _1536 = _1520 ? 0 : 1;
    float _1538 = float(uint(_1524));
    bool _1540 = !_1510;
    int _1542 = _1540 ? 0 : 1;
    int _1544 = _1502 & 3;
    bool _1546 = _1544 != 0;
    float _1548 = as_type<float>(_878) * _1538;
    int _1550 = abs(_1534);
    bool _1552 = uint(_1544) > 1u;
    float _1554 = trunc(_1548);
    float _1556 = precise::max(_1554, 0.0);
    uint _1558 = uint(_1556);
    int _1560 = abs(_1542);
    int _1562 = _1506 * _1516;
    int _1564 = _1562 + _1494;
    int _1566 = int(_1418) + int(_1530);
    int _1568 = _1514 * _1550;
    int _1570 = _1568 + _1564;
    int _1572 = ~_711;
    int _1574 = _1572 + 1;
    int _1576 = ~_1536;
    int _1578 = _1576 + 1;
    int _1580 = _1578 + 1;
    int _1582 = _1434 * _1560;
    int _1584 = _1582 + _1570;
    int _1586 = _1580;
    if (!_1552)
    {
        int _1588 = ~_1536;
        int _1590 = _1588 + 1;
        _1586 = _1590;
    }
    int _1592 = _1586;
    int _1594 = _1574 * _1566;
    int _1596 = _1594 + _1094;
    bool _1598 = uint(_1544) >= 2u;
    float _1600 = float(uint(_1584));
    int _1602 = ~_743;
    int _1604 = _1602 + 1;
    int _1606 = int(_1490) + int(_1558);
    float _1608 = as_type<float>(_956) * _1600;
    int _1610 = _1598 ? 0 : 1;
    bool _1612 = uint(_1596) >= uint(_711);
    int _1614 = _1604 * _1606;
    int _1616 = _1614 + _1412;
    float _1618 = float(uint(_1324));
    float _1620 = trunc(_1608);
    float _1622 = precise::max(_1620, 0.0);
    uint _1624 = uint(_1622);
    bool _1626 = !_1612;
    int _1628 = _1626 ? 0 : (-1);
    bool _1630 = uint(_1616) >= uint(_743);
    float _1632 = as_type<float>(_878) * _1618;
    int _1634 = ~_1566;
    int _1636 = _1634 + _1628;
    int _1638 = _1636 + 1;
    bool _1640 = !_1630;
    int _1642 = _1640 ? 0 : (-1);
    float _1644 = trunc(_1632);
    float _1646 = precise::max(_1644, 0.0);
    uint _1648 = uint(_1646);
    int _1650 = ~_786;
    int _1652 = _1650 + 1;
    int _1654 = _711 * _1638;
    int _1656 = _1654 + _1094;
    bool _1658 = _1544 != 3;
    int _1660 = ~_1606;
    int _1662 = _1660 + _1642;
    int _1664 = _1662 + 1;
    float _1666 = float(uint(_1514));
    int _1668 = _1652 * int(_1624);
    int _1670 = _1668 + _1584;
    int _1672 = ~_743;
    int _1674 = _1672 + 1;
    int _1676 = _743 * _1664;
    int _1678 = _1676 + _1412;
    int _1680 = ~_1610;
    int _1682 = _1680 + 1;
    int _1684 = _1682 + 1;
    float _1686 = as_type<float>(_956) * _1666;
    float _1688 = float(uint(_1670));
    int _1690 = _1684;
    if (_1658)
    {
        int _1692 = ~_1610;
        int _1694 = _1692 + 1;
        _1690 = _1694;
    }
    int _1696 = _1690;
    float _1698 = trunc(_1686);
    float _1700 = precise::max(_1698, 0.0);
    uint _1702 = uint(_1700);
    int _1704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1706 = _1704 != 0;
    float _1708 = as_type<float>(_956) * _1688;
    bool _1710 = !_1272;
    int _1712 = _1710 ? _1678 : (-1);
    bool _1714 = !_1706;
    int _1716 = _1714 ? 0 : 1;
    int _1718 = _1674 * int(_1648);
    int _1720 = _1718 + _1324;
    int _1722 = _1712 & 3;
    bool _1724 = _1722 != 0;
    float _1726 = trunc(_1708);
    float _1728 = precise::max(_1726, 0.0);
    uint _1730 = uint(_1728);
    int _1732 = _1712 & 3;
    bool _1734 = _1732 != 0;
    bool _1736 = !_1484;
    int _1738 = _1736 ? _1656 : (-1);
    int _1740 = _1724 ? 0 : 1;
    bool _1742 = uint(_1732) > 1u;
    float _1744 = float(uint(_1720));
    int _1746 = ~_786;
    int _1748 = _1746 + 1;
    int _1750 = ~_1740;
    int _1752 = _1750 + 1;
    int _1754 = _1752 + 1;
    float _1756 = as_type<float>(_878) * _1744;
    int _1758 = ~_786;
    int _1760 = _1758 + 1;
    float _1762 = trunc(_1756);
    float _1764 = precise::max(_1762, 0.0);
    uint _1766 = uint(_1764);
    int _1768 = int(_1624) + int(_1730);
    int _1770 = _1748 * int(_1702);
    int _1772 = _1770 + _1514;
    int _1774 = _1754;
    if (!_1742)
    {
        int _1776 = ~_1740;
        int _1778 = _1776 + 1;
        _1774 = _1778;
    }
    int _1780 = _1774;
    bool _1782 = uint(_1732) >= 2u;
    float _1784 = float(uint(_1772));
    int _1786 = _1782 ? 0 : 1;
    bool _1788 = _1732 != 3;
    float _1790 = as_type<float>(_956) * _1784;
    int _1792 = _1760 * _1768;
    int _1794 = _1792 + _1584;
    int _1796 = ~_743;
    int _1798 = _1796 + 1;
    int _1800 = ~_1786;
    int _1802 = _1800 + 1;
    int _1804 = _1802 + 1;
    int _1806 = int(_1648) + int(_1766);
    float _1808 = trunc(_1790);
    float _1810 = precise::max(_1808, 0.0);
    uint _1812 = uint(_1810);
    bool _1814 = !_1734;
    int _1816 = _1814 ? 0 : 1;
    int _1818 = _1804;
    if (_1788)
    {
        int _1820 = ~_1786;
        int _1822 = _1820 + 1;
        _1818 = _1822;
    }
    int _1824 = _1818;
    int _1826 = _1798 * _1806;
    int _1828 = _1826 + _1324;
    bool _1830 = uint(_1794) >= uint(_786);
    int _1832 = ~_786;
    int _1834 = _1832 + 1;
    bool _1836 = !_1830;
    int _1838 = _1836 ? 0 : (-1);
    bool _1840 = uint(_1828) >= uint(_743);
    int _1842 = ~_1768;
    int _1844 = _1842 + _1838;
    int _1846 = _1844 + 1;
    bool _1848 = !_1840;
    int _1850 = _1848 ? 0 : (-1);
    int _1852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1854 = _1852 != 0;
    int _1856 = _786 * _1846;
    int _1858 = _1856 + _1584;
    int _1860 = int(_1702) + int(_1812);
    int _1862 = _1502 >> 31;
    bool _1864 = !_1428;
    int _1866 = _1864 ? _1858 : (-1);
    int _1868 = _1834 * _1860;
    int _1870 = _1868 + _1514;
    bool _1872 = !_1854;
    int _1874 = _1872 ? 0 : 1;
    int _1876 = _1712 >> 31;
    int _1878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1880 = _1878 != 0;
    bool _1882 = !_1546;
    int _1884 = _1882 ? 0 : 1;
    int _1886 = _1866 & 3;
    bool _1888 = _1886 != 0;
    int _1890 = _1866 >> 31;
    int _1892 = _1862 & 3;
    int _1894 = _1876 & 3;
    bool _1896 = !_1880;
    int _1898 = _1896 ? 0 : 1;
    bool _1900 = uint(_1886) > 1u;
    int _1902 = _1890 & 3;
    int _1904 = _1502 + _1892;
    int _1906 = _1712 + _1894;
    int _1908 = _1866 & 3;
    bool _1910 = _1908 != 0;
    int _1912 = _1866 + _1902;
    int _1914 = _1904 >> 2;
    int _1916 = _1906 >> 2;
    int _1918 = _1910 ? 0 : 1;
    int _1920 = _1914 << 4;
    int _1922 = _1920 + 368;
    int _1924 = _1916 << 4;
    int _1926 = _1924 + 512;
    int _1928 = ~_1918;
    int _1930 = _1928 + 1;
    int _1932 = _1930 + 1;
    int _1934 = _1912 >> 2;
    int _1936 = _1932;
    if (!_1900)
    {
        int _1938 = ~_1918;
        int _1940 = _1938 + 1;
        _1936 = _1940;
    }
    int _1942 = _1936;
    uint _1944 = uint(int(uint(_1922) >> uint(2)));
    uint _1946 = uint(int(uint(int(_1944)) >> uint(2)));
    int _1948 = int(_1944) & 3;
    float _1950 = (*spvDescriptorSet0.vp_c9)._m0[int(_1946)][_1948];
    int _1952 = int(_1944) + 1;
    uint _1954 = uint(int(uint(_1952) >> uint(2)));
    int _1956 = _1952 & 3;
    float _1958 = (*spvDescriptorSet0.vp_c9)._m0[int(_1954)][_1956];
    int _1960 = _1934 << 4;
    int _1962 = _1960 + 656;
    bool _1964 = uint(_1870) >= uint(_786);
    int _1966 = ~_1806;
    int _1968 = _1966 + _1850;
    int _1970 = _1968 + 1;
    bool _1972 = !_1964;
    int _1974 = _1972 ? 0 : (-1);
    uint _1976 = uint(int(uint(_1926) >> uint(2)));
    uint _1978 = uint(int(uint(int(_1976)) >> uint(2)));
    int _1980 = int(_1976) & 3;
    float _1982 = (*spvDescriptorSet0.vp_c9)._m0[int(_1978)][_1980];
    int _1984 = int(_1976) + 1;
    uint _1986 = uint(int(uint(_1984) >> uint(2)));
    int _1988 = _1984 & 3;
    float _1990 = (*spvDescriptorSet0.vp_c9)._m0[int(_1986)][_1988];
    int _1992 = ~_1860;
    int _1994 = _1992 + _1974;
    int _1996 = _1994 + 1;
    float _1998 = _800 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _2000 = uint(_1886) >= 2u;
    float _2002 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2004 = _1544 != 3;
    uint _2006 = uint(int(uint(_1962) >> uint(2)));
    uint _2008 = uint(int(uint(int(_2006)) >> uint(2)));
    int _2010 = int(_2006) & 3;
    float _2012 = (*spvDescriptorSet0.vp_c9)._m0[int(_2008)][_2010];
    int _2014 = int(_2006) + 1;
    uint _2016 = uint(int(uint(_2014) >> uint(2)));
    int _2018 = _2014 & 3;
    float _2020 = (*spvDescriptorSet0.vp_c9)._m0[int(_2016)][_2018];
    int _2022 = _2000 ? 0 : 1;
    float _2024 = -_2002;
    float _2026 = fma(_1998, 2.0, _2024);
    int _2028 = _743 * _1970;
    int _2030 = _2028 + _1324;
    bool _2032 = _1732 != 3;
    int _2034 = _786 * _1996;
    int _2036 = _2034 + _1514;
    int _2038 = abs(_1592);
    float _2040 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2042 = int(_2040);
    int _2044 = _1926 + 8;
    uint _2046 = uint(int(uint(_2044) >> uint(2)));
    uint _2048 = uint(int(uint(int(_2046)) >> uint(2)));
    int _2050 = int(_2046) & 3;
    float _2052 = (*spvDescriptorSet0.vp_c9)._m0[int(_2048)][_2050];
    int _2054 = int(_2046) + 1;
    uint _2056 = uint(int(uint(_2054) >> uint(2)));
    int _2058 = _2054 & 3;
    float _2060 = (*spvDescriptorSet0.vp_c9)._m0[int(_2056)][_2058];
    int _2062 = abs(_1780);
    float _2064 = -_139;
    float _2066 = fma(_2064, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2026);
    int _2068 = abs(_1884);
    int _2070 = ~_2038;
    int _2072 = _2070 + 1;
    int _2074 = _2072 + 1;
    int _2076 = abs(_1942);
    int _2078 = _1962 + 8;
    uint _2080 = uint(int(uint(_2078) >> uint(2)));
    uint _2082 = uint(int(uint(int(_2080)) >> uint(2)));
    int _2084 = int(_2080) & 3;
    float _2086 = (*spvDescriptorSet0.vp_c9)._m0[int(_2082)][_2084];
    int _2088 = int(_2080) + 1;
    uint _2090 = uint(int(uint(_2088) >> uint(2)));
    int _2092 = _2088 & 3;
    float _2094 = (*spvDescriptorSet0.vp_c9)._m0[int(_2090)][_2092];
    int _2096 = ~_2062;
    int _2098 = _2096 + 1;
    int _2100 = _2098 + 1;
    bool _2102 = !_1888;
    int _2104 = _2102 ? 0 : 1;
    bool _2106 = _1886 != 3;
    int _2108 = _1922 + 8;
    uint _2110 = uint(int(uint(_2108) >> uint(2)));
    uint _2112 = uint(int(uint(int(_2110)) >> uint(2)));
    int _2114 = int(_2110) & 3;
    float _2116 = (*spvDescriptorSet0.vp_c9)._m0[int(_2112)][_2114];
    int _2118 = int(_2110) + 1;
    uint _2120 = uint(int(uint(_2118) >> uint(2)));
    int _2122 = _2118 & 3;
    float _2124 = (*spvDescriptorSet0.vp_c9)._m0[int(_2120)][_2122];
    int _2126 = ~_2068;
    int _2128 = _2126 + 1;
    int _2130 = _2128 + 1;
    int _2132 = abs(_2104);
    float _2134 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2136 = int(_2134);
    int _2138 = ~_2076;
    int _2140 = _2138 + 1;
    int _2142 = _2140 + 1;
    int _2144 = _2074 * as_type<int>(_1958);
    int _2146 = ~_2022;
    int _2148 = _2146 + 1;
    int _2150 = _2148 + 1;
    bool _2152 = !_2004;
    int _2154 = _2152 ? 0 : (-1);
    int _2156 = _2130 * as_type<int>(_1950);
    int _2158 = _2156 + _2144;
    int _2160 = abs(_1816);
    int _2162 = abs(_1696);
    int _2164 = _2100 * as_type<int>(_1990);
    int _2166 = ~_2160;
    int _2168 = _2166 + 1;
    int _2170 = _2168 + 1;
    int _2172 = _2150;
    if (_2106)
    {
        int _2174 = ~_2022;
        int _2176 = _2174 + 1;
        _2172 = _2176;
    }
    int _2178 = _2172;
    float _2180 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2182 = _2180 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2184 = abs(_1824);
    int _2186 = _2142 * as_type<int>(_2020);
    int _2188 = _2170 * as_type<int>(_1982);
    int _2190 = _2188 + _2164;
    float _2192 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2194 = int(_2192);
    int _2196 = ~_2132;
    int _2198 = _2196 + 1;
    int _2200 = _2198 + 1;
    bool _2202 = !_2032;
    int _2204 = _2202 ? 0 : (-1);
    int _2206 = _2200 * as_type<int>(_2012);
    int _2208 = _2206 + _2186;
    bool _2210 = _1886 != 3;
    float _2212 = 1.0 / _2182;
    int _2214 = ~_2184;
    int _2216 = _2214 + 1;
    int _2218 = _2216 + 1;
    int _2220 = abs(_2204);
    int _2222 = abs(_2178);
    int _2224 = _2218 * as_type<int>(_2052);
    int _2226 = _2224 + _2190;
    bool _2228 = !_2210;
    int _2230 = _2228 ? 0 : (-1);
    int _2232 = ~_2220;
    int _2234 = _2232 + 1;
    int _2236 = _2234 + 1;
    int _2238 = ~_2222;
    int _2240 = _2238 + 1;
    int _2242 = _2240 + 1;
    int _2244 = ~_2162;
    int _2246 = _2244 + 1;
    int _2248 = _2246 + 1;
    int _2250 = _2236 * as_type<int>(_2060);
    int _2252 = _2250 + _2226;
    int _2254 = abs(_2154);
    int _2256 = _2242 * as_type<int>(_2086);
    int _2258 = _2256 + _2208;
    int _2260 = abs(_2230);
    int _2262 = _2248 * as_type<int>(_2116);
    int _2264 = _2262 + _2158;
    int _2266 = abs(_1716);
    float _2268 = float(uint(_2042));
    int _2270 = abs(_1874);
    int _2272 = ~_2254;
    int _2274 = _2272 + 1;
    int _2276 = _2274 + 1;
    float _2278 = 1.0 / _2268;
    int _2280 = ~_2260;
    int _2282 = _2280 + 1;
    int _2284 = _2282 + 1;
    int _2286 = _2276 * as_type<int>(_2124);
    int _2288 = _2286 + _2264;
    int _2290 = abs(_1898);
    float _2292 = _800 * 2.0;
    int _2294 = ~_2266;
    int _2296 = _2294 + 1;
    int _2298 = _2296 + 1;
    int _2300 = _2284 * as_type<int>(_2094);
    int _2302 = _2300 + _2258;
    float _2304 = float(uint(_2194));
    float _2306 = in.m_46.x;
    float _2308 = in.m_46.y;
    float _2310 = in.m_46.z;
    int _2312 = ~_2270;
    int _2314 = _2312 + 1;
    int _2316 = _2314 + 1;
    int _2318 = _2288 * _2298;
    int _2320 = abs(_2136);
    float _2322 = floor(_2292);
    int _2324 = ~_2290;
    int _2326 = _2324 + 1;
    int _2328 = _2326 + 1;
    int _2330 = _1738 * _2266;
    int _2332 = _2330 + _2318;
    int _2334 = abs(_2042);
    int _2336 = _2252 * _2316;
    int _2338 = _2302 * _2328;
    bool _2340 = !_1272;
    int _2342 = _2340 ? _2030 : (-1);
    float _2344 = 1.0 / _2304;
    bool _2346 = !_1428;
    int _2348 = _2346 ? _2036 : (-1);
    int _2350 = as_type<int>(_2278) + (-2);
    int _2352 = _2342 * _2270;
    int _2354 = _2352 + _2336;
    float _2356 = float(uint(_2332));
    int _2358 = _2348 * _2290;
    int _2360 = _2358 + _2338;
    float _2362 = float(uint(_2334));
    float _2364 = float(uint(_2136));
    float _2366 = as_type<float>(_2350) * _2356;
    float _2368 = float(uint(_2360));
    float _2370 = _2308 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2372 = 1.0 / _2362;
    float _2374 = _2308 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2376 = _2308 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2378 = _800 + _802;
    int _2380 = as_type<int>(_2344) + (-2);
    int _2382 = abs(_2332);
    float _2384 = _2378 + (-1.0);
    float _2386 = 1.0 / _2364;
    float _2388 = fma(_2306, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2370);
    float _2390 = as_type<float>(_2380) * _2368;
    float _2392 = float(uint(_2320));
    float _2394 = fma(_2306, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2374);
    int _2396 = ~_2042;
    int _2398 = _2396 + 1;
    float _2400 = fma(_2306, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2376);
    float _2402 = trunc(_2366);
    float _2404 = precise::max(_2402, 0.0);
    uint _2406 = uint(_2404);
    int _2408 = abs(_2194);
    float _2410 = fma(_2310, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2394);
    int _2412 = as_type<int>(_2372) + (-2);
    float _2414 = fma(_2310, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2388);
    float _2416 = float(uint(_2382));
    float _2418 = fma(_2310, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2400);
    float _2420 = float(uint(_2354));
    float _2422 = 1.0 / _2392;
    int _2424 = as_type<int>(_2386) + (-2);
    float _2426 = as_type<float>(_2412) * _2416;
    float _2428 = _2414 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2430 = float(uint(_2408));
    float _2432 = as_type<float>(_2424) * _2420;
    int _2434 = _2398 * int(_2406);
    int _2436 = _2434 + _2332;
    float _2438 = fma(_2384, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2442 = _2440 != 0;
    float _2444 = trunc(_2426);
    float _2446 = precise::max(_2444, 0.0);
    uint _2448 = uint(_2446);
    float _2450 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2452 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2450;
    float _2454 = float(uint(_2436));
    int _2456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2458 = _2456 != 0;
    float _2460 = _2452 * _2212;
    int _2462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2464 = _2462 != 0;
    float _2466 = as_type<float>(_2350) * _2454;
    float _2468 = 1.0 / _2430;
    int _2470 = abs(_2354);
    float _2472 = fma(_998, -2.0, _1246);
    int _2474 = as_type<int>(_2422) + (-2);
    float _2476 = _802 + _804;
    float _2478 = float(uint(_2470));
    int _2480 = ~_2334;
    int _2482 = _2480 + 1;
    float _2484 = trunc(_2432);
    float _2486 = precise::max(_2484, 0.0);
    uint _2488 = uint(_2486);
    int _2490 = abs(_2360);
    float _2492 = as_type<float>(_2474) * _2478;
    int _2494 = ~_2136;
    int _2496 = _2494 + 1;
    int _2498 = _2482 * int(_2448);
    int _2500 = _2498 + _2382;
    float _2502 = _2476 + (-1.0);
    float _2504 = float(uint(_2490));
    float _2506 = trunc(_2390);
    float _2508 = precise::max(_2506, 0.0);
    uint _2510 = uint(_2508);
    int _2512 = as_type<int>(_2468) + (-2);
    float _2514 = float(uint(_2500));
    float _2516 = as_type<float>(_2512) * _2504;
    bool _2518 = _802 > 0.5;
    float _2520 = trunc(_2466);
    float _2522 = precise::max(_2520, 0.0);
    uint _2524 = uint(_2522);
    float _2526 = fma(_2502, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2528 = as_type<float>(_2412) * _2514;
    int _2530 = ~_2042;
    int _2532 = _2530 + 1;
    bool _2534 = _2322 >= 0.0;
    bool _2536 = isnan(_2322);
    bool _2538 = _2534 || _2536;
    bool _2540 = isnan(0.0);
    bool _2542 = _2538 || _2540;
    float _2544 = trunc(_2492);
    float _2546 = precise::max(_2544, 0.0);
    uint _2548 = uint(_2546);
    int _2550 = _2496 * int(_2488);
    int _2552 = _2550 + _2354;
    int _2554 = ~_2408;
    int _2556 = _2554 + 1;
    float _2558 = float(uint(_2552));
    float _2560 = trunc(_2516);
    float _2562 = precise::max(_2560, 0.0);
    uint _2564 = uint(_2562);
    int _2566 = int(_2406) + int(_2524);
    int _2568 = ~_2320;
    int _2570 = _2568 + 1;
    float _2572 = as_type<float>(_2424) * _2558;
    int _2574 = ~_2194;
    int _2576 = _2574 + 1;
    int _2578 = _2532 * _2566;
    int _2580 = _2578 + _2332;
    float _2582 = -_179;
    int _2584 = _2518 ? as_type<int>(_2582) : as_type<int>(_179);
    float _2586 = trunc(_2528);
    float _2588 = precise::max(_2586, 0.0);
    uint _2590 = uint(_2588);
    int _2592 = _2570 * int(_2548);
    int _2594 = _2592 + _2470;
    int _2596 = ~_2334;
    int _2598 = _2596 + 1;
    bool _2600 = uint(_2580) >= uint(_2042);
    int _2602 = _2576 * int(_2510);
    int _2604 = _2602 + _2360;
    float _2606 = float(uint(_2594));
    float _2608 = trunc(_2572);
    float _2610 = precise::max(_2608, 0.0);
    uint _2612 = uint(_2610);
    bool _2614 = !_2600;
    int _2616 = _2614 ? 0 : (-1);
    int _2618 = _2556 * int(_2564);
    int _2620 = _2618 + _2490;
    bool _2622 = _926 != 1;
    float _2624 = as_type<float>(_2474) * _2606;
    float _2626 = float(uint(_2604));
    float _2628 = float(uint(_2620));
    int _2630 = int(_2448) + int(_2590);
    float _2632 = as_type<float>(_2380) * _2626;
    float _2634 = trunc(_2624);
    float _2636 = precise::max(_2634, 0.0);
    uint _2638 = uint(_2636);
    int _2640 = ~_2136;
    int _2642 = _2640 + 1;
    int _2644 = int(_2488) + int(_2612);
    float _2646 = as_type<float>(_2512) * _2628;
    bool _2648 = _804 > 0.5;
    float _2650 = trunc(_2632);
    float _2652 = precise::max(_2650, 0.0);
    uint _2654 = uint(_2652);
    int _2656 = ~_2566;
    int _2658 = _2656 + _2616;
    int _2660 = _2658 + 1;
    int _2662 = _2598 * _2630;
    int _2664 = _2662 + _2382;
    float _2666 = -_175;
    int _2668 = _2648 ? as_type<int>(_2666) : as_type<int>(_175);
    int _2670 = _2042 * _2660;
    int _2672 = _2670 + _2332;
    bool _2674 = !_2442;
    float _2676 = _2674 ? _179 : as_type<float>(_2584);
    int _2678 = _2642 * _2644;
    int _2680 = _2678 + _2354;
    bool _2682 = _2042 == 0;
    bool _2684 = uint(_2664) >= uint(_2334);
    bool _2686 = !_2458;
    float _2688 = _2686 ? _175 : as_type<float>(_2668);
    float _2690 = trunc(_2646);
    float _2692 = precise::max(_2690, 0.0);
    uint _2694 = uint(_2692);
    bool _2696 = _928 != 2;
    bool _2698 = !_2682;
    int _2700 = _2698 ? _2672 : (-1);
    bool _2702 = uint(_2680) >= uint(_2136);
    int _2704 = ~_2320;
    int _2706 = _2704 + 1;
    int _2708 = int(_2548) + int(_2638);
    int _2710 = _2332 ^ _2042;
    int _2712 = ~_2194;
    int _2714 = _2712 + 1;
    int _2716 = int(_2510) + int(_2654);
    int _2718 = _2706 * _2708;
    int _2720 = _2718 + _2470;
    bool _2722 = _2042 == 0;
    int _2724 = ~_2408;
    int _2726 = _2724 + 1;
    int _2728 = _2714 * _2716;
    int _2730 = _2728 + _2360;
    bool _2732 = !_2702;
    int _2734 = _2732 ? 0 : (-1);
    bool _2736 = uint(_2720) >= uint(_2320);
    int _2738 = int(_2564) + int(_2694);
    float _2740 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2742 = !_2736;
    int _2744 = _2742 ? 0 : (-1);
    bool _2746 = !_2684;
    float _2748 = _2746 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    int _2750 = ~_2644;
    int _2752 = _2750 + _2734;
    int _2754 = _2752 + 1;
    bool _2756 = uint(_2730) >= uint(_2194);
    int _2758 = _2726 * _2738;
    int _2760 = _2758 + _2490;
    bool _2762 = _800 > 0.5;
    int _2764 = _2136 * _2754;
    int _2766 = _2764 + _2354;
    bool _2768 = !_2756;
    int _2770 = _2768 ? 0 : (-1);
    float _2772 = -_175;
    int _2774 = _2762 ? as_type<int>(_2772) : as_type<int>(_175);
    bool _2776 = _2136 == 0;
    float _2778 = _2740 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2780 = uint(_2760) >= uint(_2408);
    int _2782 = ~_2716;
    int _2784 = _2782 + _2770;
    int _2786 = _2784 + 1;
    float _2788 = _802 * 2.0;
    bool _2790 = !_2776;
    int _2792 = _2790 ? _2766 : (-1);
    bool _2794 = _2136 == 0;
    int _2796 = _2194 * _2786;
    int _2798 = _2796 + _2360;
    int _2800 = _2354 ^ _2136;
    float _2802 = floor(_2788);
    int _2804 = ~_2744;
    int _2806 = _2708 + _2804;
    int _2808 = _2806 + 1;
    float _2810 = _804 * 2.0;
    float _2812 = as_type<float>(_2716);
    float _2814 = _2748;
    float _2816 = as_type<float>(_2564);
    float _2818 = as_type<float>(_2638);
    float _2820 = as_type<float>(_2808);
    float _2822 = as_type<float>(_2598);
    if (!_2622)
    {
        _2812 = _802;
    }
    float _2824 = _2812;
    int _2826 = ~as_type<int>(_2748);
    int _2828 = _2630 + _2826;
    int _2830 = _2828 + 1;
    float _2832 = _2824;
    if (!_2622)
    {
        _2814 = _2824;
    }
    float _2834 = _2814;
    float _2836 = floor(_2810);
    float _2838 = _2834;
    if (!_2622)
    {
        _2816 = _804;
    }
    float _2840 = _2816;
    float _2842 = _2840;
    if (!_2622)
    {
        _2818 = _804;
    }
    float _2844 = _2818;
    uint _2846 = uint(int(uint(_2710) >> uint(31)));
    uint _2848 = uint(int(uint(_2800) >> uint(31)));
    float _2850 = _2844;
    float _2852 = as_type<float>(_2848);
    if (_2622)
    {
        _2838 = _800;
    }
    float _2854 = _2838;
    if (_2622)
    {
        _2832 = _800;
    }
    float _2856 = _2832;
    if (_2622)
    {
        _2842 = _802;
    }
    float _2858 = _2842;
    float _2860 = _2854 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2622)
    {
        _2850 = _802;
    }
    float _2862 = _2850;
    bool _2864 = _2194 == 0;
    int _2866 = ~int(_2846);
    int _2868 = _2866 + 1;
    int _2870 = ~int(_2848);
    int _2872 = _2870 + 1;
    bool _2874 = !_2780;
    int _2876 = _2874 ? 0 : (-1);
    bool _2878 = !_2864;
    int _2880 = _2878 ? _2798 : (-1);
    bool _2882 = _2802 > 0.0;
    bool _2884 = _2802 >= 0.0;
    bool _2886 = isnan(_2802);
    bool _2888 = _2884 || _2886;
    bool _2890 = isnan(0.0);
    bool _2892 = _2888 || _2890;
    int _2894 = _2830 ^ _2868;
    int _2896 = _2808 ^ _2872;
    int _2898 = ~_2868;
    int _2900 = _2898 + _2894;
    int _2902 = _2900 + 1;
    int _2904 = ~_2872;
    int _2906 = _2904 + _2896;
    int _2908 = _2906 + 1;
    bool _2910 = _701 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2912 = isnan(_701);
    bool _2914 = _2910 || _2912;
    bool _2916 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2918 = _2914 || _2916;
    float _2920 = float(_2918);
    bool _2922 = !_2464;
    float _2924 = _2922 ? _175 : as_type<float>(_2774);
    if (_2696)
    {
        _2820 = _800;
    }
    float _2926 = _2820;
    float _2928 = -_2920;
    float _2930 = _2928 + 1.0;
    float _2932 = _2926;
    if (_2696)
    {
        _2852 = _802;
    }
    float _2934 = _2852;
    bool _2936 = !_2722;
    int _2938 = _2936 ? _2902 : (-1);
    float _2940 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2942 = _701 + _2940;
    bool _2944 = !_2794;
    int _2946 = _2944 ? _2908 : (-1);
    float _2948 = _2934;
    if (!_2696)
    {
        _2932 = _804;
    }
    float _2950 = _2932;
    float _2952 = fma(_2460, _2942, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (!_2696)
    {
        _2948 = _800;
    }
    float _2954 = _2948;
    float _2956 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2958 = _2428 + _2956;
    int _2960 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2962 = _2960 != 0;
    int _2964 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2966 = _2964 != 0;
    int _2968 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2970 = _2968 != 0;
    bool _2972 = _2836 >= 0.0;
    bool _2974 = isnan(_2836);
    bool _2976 = _2972 || _2974;
    bool _2978 = isnan(0.0);
    bool _2980 = _2976 || _2978;
    bool _2982 = _701 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2984 = isnan(_701);
    bool _2986 = _2982 || _2984;
    bool _2988 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2990 = _2986 || _2988;
    float _2992 = float(_2990);
    int _2994 = _2542 ? 0 : 1;
    bool _2996 = _2836 > 0.0;
    float _2998 = _2410 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _3000 = _2980 ? 0 : 1;
    float _3002 = _2992 * _2930;
    bool _3004 = _2194 == 0;
    float _3006 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3008 = _2998 + _3006;
    int _3010 = _2360 ^ _2194;
    float _3012 = _2952 * _3002;
    int _3014 = ~_2876;
    int _3016 = _2738 + _3014;
    int _3018 = _3016 + 1;
    float _3020 = _2418 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    uint _3022 = uint(int(uint(_3010) >> uint(31)));
    float _3024 = _3008 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3026 = -_2992;
    float _3028 = _3026 + 1.0;
    float _3030 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3032 = _3020 + _3030;
    int _3034 = ~int(_3022);
    int _3036 = _3034 + 1;
    float _3038 = fma(_2958, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3024);
    float _3040 = fma(_3028, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3012);
    int _3042 = ~_3000;
    int _3044 = _3042 + 1;
    int _3046 = _3044 + 1;
    float _3048 = _2950 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _3050 = fma(_3032, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3038);
    int _3052 = _3018 ^ _3036;
    float _3054 = fma(_2920, (*spvDescriptorSet0.vp_c9)._m0[132].x, _3040);
    int _3056 = _3046;
    if (!_2996)
    {
        int _3058 = ~_3000;
        int _3060 = _3058 + 1;
        _3056 = _3060;
    }
    int _3062 = _3056;
    float _3064 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3066 = ~_3036;
    int _3068 = _3066 + _3052;
    int _3070 = _3068 + 1;
    float _3072 = _3054 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _3074 = _3050 >= 0.0;
    float _3076 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _3078 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3080 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3082 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3084 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3086 = _3078 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3088 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _3090 = _3080 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3092 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3094 = _3082 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3096 = -_3088;
    float _3098 = fma(_3048, 2.0, _3096);
    float _3100 = fma(_2856, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3084);
    float _3102 = fma(_2862, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3092);
    float _3104 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    out.m_62.x = _3086;
    out.m_62.y = _3090;
    out.m_62.z = _3094;
    out.m_62.w = _3072;
    float _3106 = float(_2700);
    float _3108 = _3064 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[82].x);
    if (_3074)
    {
        _2822 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3112 = _2822;
    float _3114 = _3076 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3116 = fma(_2778, _3106, _2066);
    float _3118 = float(_2880);
    float _3120 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3122 = float(_2792);
    float _3124 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3100);
    float _3126 = float(_2938);
    float _3128 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3130 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3132 = _2858 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_3074)
    {
        float _3134 = _3112 * 5.0;
        _3110 = as_type<int>(_3134);
    }
    int _3136 = _3110;
    float _3138 = -_3128;
    float _3140 = fma(_2860, 2.0, _3138);
    float _3142 = _2954 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3146 = fma(_3132, -2.0, _3130);
    float _3148 = _3104 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3150 = -_139;
    float _3152 = fma(_3150, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3098);
    float _3154 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_3074)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9343 = as_type<float>(_3136);
        out.gl_Position.z = _9343;
    }
    float _3156 = -_139;
    float _3158 = fma(_3156, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3140);
    float _3160 = fma(_3148, _3118, _3152);
    float _3162 = fma(_3142, -2.0, _3154);
    float _3164 = _2924 + 0.5;
    float _3166 = fma(_3108, _3122, _3158);
    float _3168 = float(_2946);
    float _3170 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3146);
    float _3172 = fma(_2778, _3164, _3116);
    bool _3174 = !_3004;
    int _3176 = _3174 ? _3070 : (-1);
    float _3178 = _3120 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3180 = _3144 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3182 = _964 + 0.5;
    float _3184 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2472);
    float _3186 = _2676 + (-0.5);
    float _3188 = -_3170;
    float _3190 = fma(_3180, _3168, _3188);
    float _3192 = fma(_3148, _3182, _3160);
    float _3194 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3162);
    float _3196 = -_3184;
    float _3198 = fma(_3114, _3126, _3196);
    float _3200 = _1202 + (-0.5);
    float _3202 = float(_3176);
    float _3204 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3206 = -_3114;
    float _3208 = fma(_3206, _3186, _3198);
    float _3210 = -_3180;
    float _3212 = fma(_3210, _3200, _3190);
    float _3214 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3216 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3204);
    float _3218 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3220 = log2(_3218);
    float _3222 = -_3194;
    float _3224 = fma(_3178, _3202, _3222);
    float _3226 = _970 + (-0.5);
    float _3228 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3214);
    float _3230 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3216);
    float _3232 = _2688 + 0.5;
    float _3234 = -_3178;
    float _3236 = fma(_3234, _3226, _3224);
    float _3238 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3228);
    float _3240 = -_3230;
    float _3242 = _3240 + 1.0;
    float _3244 = fma(_3108, _3232, _3166);
    float _3246 = -_3124;
    float _3248 = _3246 + 1.0;
    float _3250 = -_3238;
    float _3252 = _3250 + 1.0;
    float _3254 = -_3242;
    float _3256 = fma(_2924, _3254, _3172);
    float _3258 = -_3248;
    float _3260 = fma(_2688, _3258, _3244);
    float _3262 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3264 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3266 = _3220 * _139;
    float _3268 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3102);
    float _3270 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3262);
    float _3272 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3264);
    float _3274 = fma(_2676, _3252, _3208);
    float _3276 = _3008 * _3008;
    float _3278 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3270);
    float _3280 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3272);
    float _3282 = -_3268;
    float _3284 = _3282 + 1.0;
    float _3286 = fma(_2958, _2958, _3276);
    float _3288 = -_3278;
    float _3290 = _3288 + 1.0;
    float _3292 = -_3280;
    float _3294 = _3292 + 1.0;
    float _3296 = fma(_1202, _3284, _3212);
    float _3298 = -_3290;
    float _3300 = fma(_964, _3298, _3192);
    float _3302 = fma(_970, _3294, _3236);
    float _3304 = fma(_3032, _3032, _3286);
    float _3306 = in.m_64.x;
    float _3308 = in.m_64.y;
    float _3310 = in.m_64.z;
    bool _3312 = !_2966;
    int _3314 = _3312 ? 0 : 1;
    float _3316 = exp2(_3266);
    bool _3318 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3320 = isnan(1.0);
    bool _3322 = _3318 || _3320;
    bool _3324 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3326 = _3322 || _3324;
    float _3328 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3330 = 1.0 + _3328;
    out.m_66.x = _3256;
    out.m_66.y = _3274;
    out.m_66.z = _3260;
    out.m_66.w = _3296;
    bool _3332 = !_2970;
    int _3334 = _3332 ? 0 : 1;
    bool _3336 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3338 = isnan(0.0);
    bool _3340 = _3336 || _3338;
    bool _3342 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3344 = _3340 || _3342;
    out.m_68.x = _3300;
    out.m_68.y = _3302;
    float _3346 = rsqrt(_3304);
    int _3348 = ~_2994;
    int _3350 = _3348 + 1;
    int _3352 = _3350 + 1;
    int _3354 = _3352;
    if (_3074)
    {
        out.m_49.x = 0.0;
    }
    float _3356 = float(_3062);
    float _3358 = 1.0 / _3330;
    float _3360 = -_3316;
    float _3362 = _3360 + 1.0;
    bool _3364 = !_2962;
    int _3366 = _3364 ? 0 : 1;
    float _3368 = _3008 * _3346;
    float _3370 = _2958 * _3346;
    float _3372 = _3032 * _3346;
    float _3374 = _3372;
    if (_3074)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3376 = -_3368;
    float _3378 = fma(_3376, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2998);
    float _3380 = -_3370;
    float _3382 = fma(_3380, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2428);
    int _3384 = abs(_3366);
    float _3386 = -_3368;
    float _3388 = fma(_3386, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3008);
    float _3390 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3392 = _3378 + _3390;
    float _3394 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3396 = _3382 + _3394;
    float _3398 = -_3372;
    float _3400 = fma(_3398, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3020);
    float _3402 = _3388 * _3388;
    float _3404 = _3392 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _3406 = _2322 > 0.0;
    float _3408 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3410 = _3400 + _3408;
    int _3412 = abs(_3314);
    float _3414 = fma(_3396, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3404);
    float _3416 = float(_3384);
    float _3418 = -_3370;
    float _3420 = fma(_3418, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2958);
    float _3422 = _3344 ? _3362 : 0.0;
    float _3424 = fma(_3410, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3414);
    float _3426 = -_3372;
    float _3428 = fma(_3426, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3032);
    float _3430 = _3416 * _3356;
    float _3432 = fma(_3420, _3420, _3402);
    float _3434 = _3402;
    float _3436 = _3382;
    if (_3326)
    {
        float _3438 = _3422 * _3358;
        _141 = _3438;
    }
    float _3440 = _141;
    bool _3442 = _3424 >= 0.0;
    float _3444 = _3430 * (-2.0);
    float _3446 = _800 + (-0.5);
    if (!_3406)
    {
        int _3448 = ~_2994;
        int _3450 = _3448 + 1;
        _3354 = _3450;
    }
    int _3452 = _3354;
    float _3454 = fma(_3444, _3306, _3306);
    float _3456 = fma(_2438, _3444, _2438);
    float _3458 = float(_3412);
    float _3460 = fma(_3428, _3428, _3432);
    float _3462 = fma(_3446, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3454);
    float _3464 = float(_3452);
    float _3466 = _802 + (-0.5);
    int _3468 = _2892 ? 0 : 1;
    float _3470 = fma(_3456, _3440, _3462);
    if (_3442)
    {
        _3434 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3472 = _3434;
    float _3474 = _3458 * _3464;
    float _3476 = sqrt(_3460);
    float _3478 = _3470 * 0.15915493667125701904296875;
    int _3480 = ~_3468;
    int _3482 = _3480 + 1;
    int _3484 = _3482 + 1;
    float _3486 = _3474 * (-2.0);
    int _3488 = as_type<int>(_3472);
    int _3490 = _3484;
    if (_3442)
    {
        float _3492 = _3472 * 5.0;
        _3488 = as_type<int>(_3492);
    }
    int _3494 = _3488;
    if (_3442)
    {
        out.m_49.x = 0.0;
    }
    if (!_2882)
    {
        int _3496 = ~_3468;
        int _3498 = _3496 + 1;
        _3490 = _3498;
    }
    int _3500 = _3490;
    float _3502 = _3478 * 6.283185482025146484375;
    float _3504 = sin(_3502);
    float _3506 = fma(_2526, _3486, _2526);
    if (_3442)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9906 = as_type<float>(_3494);
        out.gl_Position.z = _9906;
    }
    float _3508 = fma(_3486, _3308, _3308);
    int _3510 = abs(_3334);
    if (_3442)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3512 = -_2998;
    float _3514 = _3512 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3516 = -_2428;
    float _3518 = _3516 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3520 = float(_3500);
    float _3522 = _3514 * _3514;
    float _3524 = float(_3510);
    float _3526 = -_3020;
    float _3528 = _3526 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3530 = _800 + _804;
    float _3532 = fma(_3518, _3518, _3522);
    float _3534 = fma(_3466, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3508);
    float _3536 = _3524 * _3520;
    float _3538 = _3530 + (-1.0);
    float _3540 = fma(_3528, _3528, _3532);
    float _3542 = _3536 * (-2.0);
    float _3544 = _804 + (-0.5);
    float _3546 = _3478 * 6.283185482025146484375;
    float _3548 = cos(_3546);
    float _3550 = fma(_3506, _3440, _3534);
    float _3552 = fma(_3538, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3554 = fma(_3542, _3310, _3310);
    float _3556 = _667 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3558 = _3550 * 0.15915493667125701904296875;
    float _3560 = fma(_3552, _3542, _3552);
    float _3562 = fma(_3544, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3554);
    float _3564 = rsqrt(_3540);
    float _3566 = _669 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3568 = fma(_3560, _3440, _3562);
    bool _3570 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3572 = isnan(0.5);
    bool _3574 = _3570 || _3572;
    bool _3576 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3578 = _3574 || _3576;
    bool _3580 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3582 = isnan(0.5);
    bool _3584 = _3580 || _3582;
    bool _3586 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3588 = _3584 || _3586;
    float _3590 = _3568 * 0.15915493667125701904296875;
    float _3592 = _3558 * 6.283185482025146484375;
    float _3594 = sin(_3592);
    float _3596 = _3518 * _3564;
    float _3598 = _3528 * _3564;
    float _3600 = _3514 * _3564;
    float _3602 = _3558 * 6.283185482025146484375;
    float _3604 = cos(_3602);
    float _3606 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3608 = _3596 * _3606;
    float _3610 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3612 = _3598 * _3610;
    float _3614 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3616 = _3600 * _3614;
    float _3618 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _179);
    float _3620 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3622 = -_3608;
    float _3624 = fma(_3598, _3620, _3622);
    float _3626 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3628 = -_3612;
    float _3630 = fma(_3600, _3626, _3628);
    float _3632 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3634 = -_3616;
    float _3636 = fma(_3596, _3632, _3634);
    float _3638 = _3346 * _3476;
    float _3640 = _3624 * _3624;
    float _3642 = _3590 * 6.283185482025146484375;
    float _3644 = sin(_3642);
    float _3646 = _3504 * _3594;
    float _3648 = _3638 * _3556;
    float _3650 = fma(_3630, _3630, _3640);
    float _3652 = _3638 * _3566;
    float _3654 = _3548 * _3604;
    float _3656 = fma(_3636, _3636, _3650);
    float _3658 = _3590 * 6.283185482025146484375;
    float _3660 = cos(_3658);
    float _3662 = _3618 * _3648;
    float _3664 = _3504 * _3604;
    float _3666 = rsqrt(_3656);
    float _3668 = fma(_3644, _3654, _3646);
    float _3670 = fma(_3644, _3646, _3654);
    float _3672 = _3548 * _3594;
    float _3674 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _175);
    float _3676 = -_3672;
    float _3678 = fma(_3644, _3664, _3676);
    float _3680 = _3548 * _3660;
    float _3682 = _3674 * _3652;
    float _3684 = _3604 * _3660;
    float _3686 = _3504 * _3660;
    float _3688 = _3680 * _3662;
    float _3690 = _3594 * _3660;
    float _3692 = -_3664;
    float _3694 = fma(_3644, _3672, _3692);
    float _3696 = _3638 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3698 = _3696 * 0.5;
    float _3700 = _3630 * _3666;
    float _3702 = _3624 * _3666;
    float _3704 = -_3662;
    float _3706 = _3644 * _3704;
    float _3708 = fma(_3668, _3682, _3688);
    float _3710 = _3600 * _3700;
    float _3712 = _3636 * _3666;
    float _3714 = _3686 * _3662;
    float _3716 = fma(_3684, _3682, _3706);
    float _3718 = fma(_3694, _3698, _3708);
    float _3720 = _3598 * _3702;
    float _3722 = -_3710;
    float _3724 = fma(_3596, _3702, _3722);
    float _3726 = fma(_3678, _3682, _3714);
    float _3728 = fma(_3690, _3698, _3716);
    float _3730 = -_3720;
    float _3732 = fma(_3600, _3712, _3730);
    float _3734 = _3724 * _3718;
    float _3736 = fma(_3670, _3698, _3726);
    float _3738 = _3378 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3740 = _3732 * _3718;
    float _3742 = fma(_3712, _3728, _3734);
    float _3744 = _3378 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3746 = fma(_3382, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3738);
    float _3748 = fma(_3700, _3728, _3740);
    float _3750 = fma(_3598, _3736, _3742);
    float _3752 = fma(_3382, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3744);
    float _3754 = fma(_3400, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3746);
    float _3756 = fma(_3596, _3736, _3748);
    float _3758 = _3020 + _3750;
    float _3760 = fma(_3400, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3752);
    float _3762 = _3754 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3764 = _2428 + _3756;
    float _3766 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3768 = _3758 + _3766;
    float _3770 = _3760 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3772 = 1.0 / _3762;
    float _3774 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3776 = _3764 + _3774;
    float _3778 = _3768 * _3768;
    float _3780 = _3596 * _3712;
    float _3782 = _3770 + _3762;
    float _3784 = fma(_3776, _3776, _3778);
    float _3786 = -_3780;
    float _3788 = fma(_3598, _3700, _3786);
    float _3790 = sqrt(_3784);
    float _3792 = _3788 * _3718;
    float _3794 = fma(_3702, _3728, _3792);
    float _3796 = _3782 * _3772;
    float _3798 = _3796 * 0.5;
    float _3800 = fma(_3600, _3736, _3794);
    float _3802 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3804 = fma(_3798, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3802);
    float _3806 = _2998 + _3800;
    float _3808 = 1.0 / _3804;
    bool _3810 = _3790 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3812 = _3736;
    float _3814 = _3792;
    float _3816 = _3758;
    float _3818 = _3728;
    float _3820 = _3790;
    if (!_3810)
    {
        _3812 = _3764;
    }
    float _3822 = _3812;
    float _3824 = _3822;
    if (!_3810)
    {
        _3814 = _3806;
    }
    float _3826 = _3814;
    bool _3828 = !_3810;
    float _3830 = _3826;
    if (!_3828)
    {
        float _3832 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3834 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3836 = _3790 + _3834;
        float _3838 = _3806 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3840 = rsqrt(_3784);
        float _3842 = _3836 * _3832;
        float _3844 = _3842 * 0.15915493667125701904296875;
        float _3846 = _3844 * 6.283185482025146484375;
        float _3848 = cos(_3846);
        float _3850 = _3844 * 6.283185482025146484375;
        float _3852 = sin(_3850);
        float _3854 = _3848 + (-1.0);
        float _3856 = fma(_3852, _3838, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3858 = _3854 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3860 = _3840 * _3856;
        float _3862 = fma(_3806, _3848, _3858);
        float _3864 = fma(_3776, _3860, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3866 = fma(_3768, _3860, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3830 = _3862;
        _3824 = _3864;
        _3816 = _3866;
        _3818 = _3852;
        _3820 = _3844;
    }
    float _3868 = _3830;
    float _3870 = _3824;
    float _3872 = _3816;
    float _3874 = _3818;
    float _3876 = _3820;
    float _3878 = -_3368;
    float _3880 = fma(_3878, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3868);
    float _3882 = -_3370;
    float _3884 = fma(_3882, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3870);
    float _3886 = -_3372;
    float _3888 = fma(_3886, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3872);
    float _3890 = _3876;
    float _3892 = _3884;
    float _3894 = _3888;
    float _3896 = _3874;
    float _3898 = _3870;
    if (_3588)
    {
        _3890 = 1.0;
    }
    float _3900 = _3890;
    float _3902 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3904 = _3808 * _3902;
    float _3906 = _3900;
    if (_3578)
    {
        _3374 = _3880;
    }
    float _3908 = _3374;
    float _3910 = _3908;
    if (!_3578)
    {
        float _3912 = _3392 * _3392;
        float _3914 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3916 = -_3020;
        float _3918 = _3916 + _3872;
        float _3920 = -_2998;
        float _3922 = _3920 + _3868;
        float _3924 = fma(_3396, _3396, _3912);
        float _3926 = -_2428;
        float _3928 = _3926 + _3870;
        float _3930 = fma(_3410, _3410, _3924);
        float _3932 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3934 = sqrt(_3930);
        float _3936 = 1.0 / _3638;
        float _3938 = _3932 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3940 = precise::min(_3934, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3942 = _3940 * _3914;
        float _3944 = _3942 * _3936;
        float _3946 = _3938 * _3944;
        float _3948 = _3918 * _3944;
        float _3950 = fma(_3922, _3946, _3378);
        float _3952 = fma(_3928, _3946, _3382);
        float _3954 = fma(_3938, _3948, _3400);
        _3910 = _3950;
        _3892 = _3952;
        _3894 = _3954;
        _3896 = _3912;
        _3898 = _3928;
    }
    float _3956 = _3910;
    float _3958 = _3892;
    float _3960 = _3894;
    float _3962 = _3896;
    float _3964 = _3898;
    float _3966 = _3962;
    float _3968 = _3964;
    if (!_3588)
    {
        float _3970 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3972 = _3970 * 0.15915493667125701904296875;
        float _3974 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3976 = _3972 * 6.283185482025146484375;
        float _3978 = cos(_3976);
        float _3980 = _3974 * 0.15915493667125701904296875;
        float _3982 = _3972 * 6.283185482025146484375;
        float _3984 = sin(_3982);
        float _3986 = 1.0 / _3978;
        float _3988 = _3980 * 6.283185482025146484375;
        float _3990 = cos(_3988);
        float _3992 = _3984 * _3986;
        float _3994 = _3980 * 6.283185482025146484375;
        float _3996 = sin(_3994);
        float _3998 = _3990 * _3992;
        float _4000 = 1.0 / _3998;
        float _4002 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4004 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4002;
        float _4006 = 1.0 / _4004;
        float _4008 = _3996 * _4000;
        float _4010 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4012 = fma(_3904, _4008, _4010);
        float _4014 = _4012 * _4006;
        float _4016 = precise::clamp(_4014, 0.0, 1.0);
        _3966 = _3980;
        _3968 = _4012;
        _3906 = _4016;
    }
    float _4018 = _3966;
    float _4020 = _3968;
    float _4022 = _3906;
    float _4024 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4026 = _3956 + _4024;
    float _4028 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4030 = _3958 + _4028;
    float _4032 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4034 = _3960 + _4032;
    float _4036 = _4026 * _4026;
    float _4038 = fma(_4030, _4030, _4036);
    float _4040 = fma(_4034, _4034, _4038);
    float _4042 = rsqrt(_4040);
    float _4044 = sqrt(_4040);
    float _4046 = _4042 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4048 = _4030 * _4046;
    float _4050 = _4034 * _4046;
    float _4052 = _4048 * _4048;
    float _4054 = _4050 * _4050;
    float _4056 = _4052 + _4054;
    float _4058 = sqrt(_4056);
    bool _4060 = _4058 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4062 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4064 = _4058 + _4062;
    float _4066 = _4042;
    float _4068 = _4064;
    float _4070 = _4018;
    float _4072 = _4026;
    float _4074 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _4076 = _4048;
    if (_4060)
    {
        float _4078 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4066 = _4078;
    }
    float _4080 = _4066;
    float _4082 = _4080;
    if (_4060)
    {
        float _4084 = _4064 * _4080;
        _4068 = _4084;
    }
    float _4086 = _4068;
    if (_4060)
    {
        float _4088 = rsqrt(_4056);
        _4082 = _4088;
    }
    float _4090 = _4082;
    float _4092 = _4090;
    if (_4060)
    {
        float _4094 = _4086 * 0.15915493667125701904296875;
        _4070 = _4094;
    }
    float _4096 = _4070;
    float _4098 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4100 = _4034;
    float _4102 = _4096;
    if (_4060)
    {
        float _4104 = _4096 * 6.283185482025146484375;
        float _4106 = sin(_4104);
        _4100 = _4106;
    }
    float _4108 = _4100;
    float _4110 = precise::max(0.0, _4098);
    float _4112 = _4020;
    if (_4060)
    {
        float _4114 = _4096 * 6.283185482025146484375;
        float _4116 = cos(_4114);
        _4112 = _4116;
    }
    float _4118 = _4112;
    float _4120 = -_4046;
    float _4122 = -_4110;
    float _4124 = fma(_4026, _4120, _4122);
    float _4126 = fma(_3382, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_4060)
    {
        float _4128 = _4124 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4072 = _4128;
    }
    float _4130 = _4072;
    float _4132 = _4108;
    float _4134 = _4130;
    if (_4060)
    {
        float _4136 = fma(_4108, _4130, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4132 = _4136;
    }
    float _4138 = _4132;
    float _4140 = _4138;
    if (!_4060)
    {
        _4102 = _4050;
    }
    float _4142 = _4102;
    float _4144 = _4142;
    if (_4060)
    {
        float _4146 = _4090 * _4138;
        _4074 = _4146;
    }
    float _4148 = _4074;
    if (!_4060)
    {
        _4092 = _4124;
    }
    float _4150 = _4092;
    float _4152 = _4150;
    float _4154 = _4118;
    if (_4060)
    {
        float _4156 = _4118 + (-1.0);
        _4134 = _4156;
    }
    float _4158 = _4134;
    if (_4060)
    {
        float _4160 = _4048 * _4148;
        _4076 = _4160;
    }
    float _4162 = _4076;
    if (!_4060)
    {
        _4140 = _4052;
    }
    float _4164 = _4140;
    float _4166 = _4164;
    if (_4060)
    {
        float _4168 = _4050 * _4148;
        _4144 = _4168;
    }
    float _4170 = _4144;
    if (_4060)
    {
        float _4172 = _4158 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3436 = _4172;
    }
    float _4174 = _3436;
    if (_4060)
    {
        float _4176 = _4162 * _4162;
        _4166 = _4176;
    }
    float _4178 = _4166;
    float _4180 = _3956 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_4060)
    {
        float _4182 = fma(_4124, _4118, _4174);
        _4152 = _4182;
    }
    float _4184 = _4152;
    if (!_4060)
    {
        _4154 = _4054;
    }
    float _4186 = _4154;
    float _4188 = _4186;
    if (_4060)
    {
        float _4190 = _4170 * _4170;
        _4188 = _4190;
    }
    float _4192 = _4188;
    float _4194 = fma(_4184, _4184, _4178);
    float _4196 = fma(_3958, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4180);
    float _4198 = floor(_4126);
    float _4200 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4202 = _4194 + _4192;
    float _4204 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4206 = fma(_4044, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4204);
    float _4208 = precise::clamp(_4206, 0.0, 1.0);
    float _4210 = fma(_3960, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4196);
    float _4212 = _3956 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4214 = -_4208;
    float _4216 = _4214 + 1.0;
    float _4218 = rsqrt(_4202);
    float _4220 = _4210 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4222 = fma(_3958, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4212);
    float _4224 = fma(_3400, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4226 = _3956 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4228 = abs(_4216);
    float _4230 = log2(_4228);
    float _4232 = _3956 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4234 = _4220 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4236 = fma(_3958, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4226);
    float _4238 = fma(_3960, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4222);
    float _4240 = fma(_3958, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4232);
    float _4242 = -_4234;
    float _4244 = fma(_4242, _4200, 1.0);
    float _4246 = fma(_3960, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4236);
    float _4248 = _4218 * _4162;
    float _4250 = fma(_3960, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4240);
    float _4252 = _4218 * _4184;
    float _4254 = _4246 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4256 = _4248 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4258 = _4250 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4260 = _4218 * _4170;
    float _4262 = floor(_4224);
    float _4264 = -_4256;
    float _4266 = fma(_4252, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4264);
    float _4268 = _4258 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4270 = _4230 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4272 = _4238 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4274 = -_4260;
    float _4276 = fma(_4274, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4266);
    float _4278 = fma(_4254, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4268);
    float _4280 = -_4198;
    float _4282 = _4126 + _4280;
    float _4284 = exp2(_4270);
    float _4286 = fma(_4276, -0.5, 0.5);
    float _4288 = fma(_4220, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4278);
    float _4290 = _4258 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4292 = _4252 + 1.0;
    float _4294 = fma(_4272, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4288);
    float _4296 = fma(_4254, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4290);
    float _4298 = log2(_4244);
    float _4300 = -_4262;
    float _4302 = _4224 + _4300;
    float _4304 = fma(_4220, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4296);
    float _4306 = 1.0 / _4294;
    float _4308 = fma(_4276, 0.5, 0.5);
    float _4310 = _4258 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4312 = fma(_4308, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4314 = fma(_4254, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4310);
    float _4316 = -_4252;
    float _4318 = fma(_4284, _4292, _4316);
    float _4320 = sqrt(_4286);
    float _4322 = fma(_4308, _4312, -0.212114393711090087890625);
    float _4324 = fma(_4220, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4314);
    float _4326 = fma(_4272, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4304);
    float _4328 = _4298 * 0.693147182464599609375;
    float _4330 = fma(_4308, _4322, 1.570728778839111328125);
    float _4332 = fma(_4272, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4324);
    float2 _11205 = float2(_4282, _4302);
    float _4334 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11205, float2(0.0), isnan(_11205)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11205, float2(0.0), isnan(_11205)), level(0.0)).x;
    float _4336 = _4326 * _4306;
    float _4338 = _4328 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4340 = _4332 * _4306;
    float _4342 = fma(_4318, 0.5, 0.5);
    float _4344 = fma(_4336, 0.5, 0.5);
    float _4346 = fma(_4340, -0.5, 0.5);
    float _4348 = _4320 * 0.636619746685028076171875;
    float3 _11235 = float3(_4344, _4346, _4338);
    float _4350 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11235, float3(0.0), isnan(_11235)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11235, float3(0.0), isnan(_11235)), level(0.0)).x;
    float3 _11246 = float3(_4344, _4346, _4338);
    float4 _4353 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11246, float3(0.0), isnan(_11246)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11246, float3(0.0), isnan(_11246)), level(0.0)).xyzw;
    float _4355 = _4353.x;
    float _4357 = _4353.y;
    float _4359 = _4353.z;
    float _4361 = _4353.w;
    float _4363 = -_4330;
    float _4365 = fma(_4348, _4363, 1.0);
    float2 _11267 = float2(_4365, _4342);
    float3 _4369 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11267, float2(0.0), isnan(_11267)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11267, float2(0.0), isnan(_11267)), level(0.0)).xyz;
    float _4371 = _4369.x;
    float _4373 = _4369.y;
    float _4375 = _4369.z;
    float _4377 = abs(_3904);
    float _4379 = log2(_4377);
    float _4381 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4383 = _175 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _4385 = _4044 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4387 = isnan(_4044);
    bool _4389 = _4385 || _4387;
    bool _4391 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4393 = _4389 || _4391;
    float _4395 = _4379 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4397 = exp2(_4395);
    float _4399 = _3668 * _3732;
    float _4401 = _3694 * _3788;
    float _4403 = fma(_3684, _3700, _4399);
    float _4405 = fma(_3678, _3596, _4403);
    float _4407 = fma(_4397, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4409 = precise::clamp(_4407, 0.0, 1.0);
    float _4411 = _3680 * _3788;
    float _4413 = fma(_4409, -2.0, 3.0);
    float _4415 = _4409 * _4409;
    float _4417 = _3668 * _3788;
    float _4419 = _3668 * _3724;
    float _4421 = _3694 * _3732;
    float _4423 = _4415 * _4413;
    float _4425 = _3680 * _3732;
    float _4427 = _3680 * _3724;
    float _4429 = fma(_3684, _3712, _4419);
    float _4431 = fma(_4381, _4381, 1.0);
    float _4433 = _3694 * _3724;
    float _4435 = -_3644;
    float _4437 = fma(_4435, _3712, _4427);
    float _4439 = fma(_3690, _3700, _4421);
    float _4441 = fma(_3684, _3702, _4417);
    float _4443 = -_3644;
    float _4445 = fma(_4443, _3702, _4411);
    float _4447 = rsqrt(_4431);
    float _4449 = fma(_3690, _3702, _4401);
    float _4451 = fma(_3690, _3712, _4433);
    float _4453 = -_3644;
    float _4455 = fma(_4453, _3700, _4425);
    float _4457 = fma(_3670, _3596, _4439);
    float _4459 = _4230 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4461 = -_4423;
    float _4463 = _4461 + 1.0;
    float _4465 = fma(_3686, _3596, _4455);
    float _4467 = fma(_3686, _3600, _4445);
    float _4469 = _4258 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4471 = fma(_4463, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4423);
    float _4473 = exp2(_4459);
    bool _4475 = _3904 <= 8000.0;
    bool _4477 = isnan(_3904);
    bool _4479 = _4475 || _4477;
    bool _4481 = isnan(8000.0);
    bool _4483 = _4479 || _4481;
    float _4485 = float(_4483);
    float _4487 = fma(_4254, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4469);
    float _4489 = fma(_3670, _3600, _4449);
    float _4491 = fma(_3678, _3600, _4441);
    float _4493 = in.m_70.x;
    float _4495 = _4381 * _4465;
    float _4497 = fma(_3686, _3598, _4437);
    float _4499 = fma(_3670, _3598, _4451);
    float _4501 = _4381 * _4447;
    float _4503 = fma(_4220, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4487);
    float _4505 = fma(_3678, _3598, _4429);
    float _4507 = fma(_4383, _4405, _4495);
    float _4509 = -_4457;
    float _4511 = _4501 * _4509;
    float _4513 = fma(_4272, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4503);
    float _4515 = _4381 * _4467;
    float _4517 = _4485 * _4471;
    out.m_72.x = _4405;
    out.m_72.y = _4491;
    out.m_72.z = _4505;
    float _4519 = -_4489;
    float _4521 = _4501 * _4519;
    float _4523 = fma(_4447, _4465, _4511);
    float _4525 = _4381 * _4497;
    float _4527 = -_4499;
    float _4529 = _4501 * _4527;
    float _4531 = -_4473;
    float _4533 = _4531 + 1.0;
    float _4535 = fma(_4447, _4467, _4521);
    float _4537 = _4513 + _4294;
    float _4539 = _4326 + _4294;
    float _4541 = fma(_4447, _4497, _4529);
    float _4543 = _4537 * 0.5;
    float _4545 = _4294 * 0.5;
    float _4547 = fma(_4383, _4491, _4515);
    float _4549 = _4517 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4551 = fma(_4383, _4505, _4525);
    float _4553 = fma(_4332, -0.5, _4545);
    float _4555 = _4457 + _4507;
    float _4557 = _4533 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4559 = _4539 * 0.5;
    out.gl_Position.x = _4326;
    out.gl_Position.y = _4332;
    out.gl_Position.z = _4513;
    out.gl_Position.w = _4294;
    float _4561 = _4489 + _4547;
    float _4563 = _4499 + _4551;
    out.m_74.x = _4559;
    out.m_74.y = _4553;
    out.m_74.z = _4543;
    out.m_74.w = _4294;
    out.m_76.x = _4555;
    out.m_76.y = _4561;
    out.m_76.z = _4563;
    out.m_78.x = _4523;
    out.m_78.y = _4535;
    out.m_78.z = _4541;
    float _4565 = -_4557;
    float _4567 = _4565 + 1.0;
    float _4569 = _4294;
    float _4571 = _4513;
    float _4573 = _4332;
    float _4575 = _4535;
    float _4577 = _4523;
    float _4579 = _4567;
    if (!_4393)
    {
        _4569 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4581 = _4569;
    float _4583 = _4581;
    float _4585 = _4581;
    if (!_4393)
    {
        _4571 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4587 = _4571;
    float _4589 = _4587;
    float _4591 = _4587;
    if (!_4393)
    {
        _4573 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4593 = _4573;
    float _4595 = _4022 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4597 = _4593;
    float _4599 = _4593;
    if (!_4393)
    {
        _4575 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4601 = _4575;
    float _4603 = _4601;
    float _4605 = _4601;
    if (!_4393)
    {
        _4577 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4607 = _4577;
    float _4609 = -_4334;
    float _4611 = _4609 + 1.0;
    float _4613 = _4611 * _4549;
    float _4615 = precise::clamp(_4613, 0.0, 1.0);
    float _4617 = -_4615;
    float _4619 = fma(_4617, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4621 = _4557 * _4350;
    float _4623 = _4619 * _4493;
    float _4625 = _4361 * _4567;
    float _4627 = _4607;
    float _4629 = _4607;
    if (!_4393)
    {
        _4579 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4631 = _4579;
    float _4633 = _4361 * _4621;
    float _4635 = _4623 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4637 = _4375 * _4621;
    float _4639 = fma(_4371, _4633, _4355);
    float _4641 = fma(_4373, _4633, _4357);
    out.m_80.x = _4635;
    float _4643 = fma(_4361, _4637, _4359);
    out.m_82.x = _4639;
    out.m_82.y = _4641;
    out.m_82.z = _4643;
    out.m_82.w = _4625;
    bool _4645 = !_4393;
    float _4647 = _4631;
    float _4649 = _4631;
    if (!_4645)
    {
        bool _4651 = _4044 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4653 = isnan(_4044);
        bool _4655 = _4651 || _4653;
        bool _4657 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4659 = _4655 || _4657;
        if (!_4659)
        {
            float _4661 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4663 = _4044 + _4661;
            float _4665 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4667 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4665;
            float _4669 = 1.0 / _4667;
            float _4671 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4673 = _4671 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4675 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4677 = _4675 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4679 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4681 = _4679 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4683 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4685 = _4683 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4687 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4689 = _4687 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4691 = _4663 * _4669;
            float _4693 = precise::clamp(_4691, 0.0, 1.0);
            float _4695 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4697 = _4695 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4699 = fma(_4693, _4673, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4701 = fma(_4693, _4697, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4703 = fma(_4693, _4677, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4705 = fma(_4693, _4681, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4707 = fma(_4693, _4685, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4709 = fma(_4693, _4689, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4629 = _4701;
            _4599 = _4707;
            _4605 = _4699;
            _4591 = _4705;
            _4585 = _4703;
            _4649 = _4709;
            _4711 = true;
        }
        else
        {
            bool _4713 = _4044 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4715 = isnan(_4044);
            bool _4717 = _4713 || _4715;
            bool _4719 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4721 = _4717 || _4719;
            if (!_4721)
            {
                _4603 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4723 = _4603;
            _4605 = _4723;
            if (!_4721)
            {
                _4627 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4725 = _4627;
            _4629 = _4725;
            if (!_4721)
            {
                _4583 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4727 = _4583;
            _4585 = _4727;
            if (!_4721)
            {
                _4589 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4729 = _4589;
            _4591 = _4729;
            if (!_4721)
            {
                _4597 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4731 = _4597;
            _4599 = _4731;
            if (!_4721)
            {
                _4647 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4733 = _4647;
            bool _4735 = !_4721;
            _4649 = _4733;
            if (!_4735)
            {
                bool _4737 = _4044 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4739 = isnan(_4044);
                bool _4741 = _4737 || _4739;
                bool _4743 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4745 = _4741 || _4743;
                if (!_4745)
                {
                    float _4747 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4749 = _4044 + _4747;
                    float _4751 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4753 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4751;
                    float _4755 = 1.0 / _4753;
                    float _4757 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4759 = _4757 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4761 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4763 = _4761 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4765 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4767 = _4765 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4769 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4771 = _4769 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4773 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4775 = _4773 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4777 = _4749 * _4755;
                    float _4779 = precise::clamp(_4777, 0.0, 1.0);
                    float _4781 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4783 = _4781 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4785 = fma(_4779, _4759, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4787 = fma(_4779, _4783, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4789 = fma(_4779, _4763, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4791 = fma(_4779, _4767, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4793 = fma(_4779, _4771, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4795 = fma(_4779, _4775, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4629 = _4787;
                    _4599 = _4793;
                    _4605 = _4785;
                    _4591 = _4791;
                    _4585 = _4789;
                    _4649 = _4795;
                    _4711 = true;
                }
                else
                {
                    _4629 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4599 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4605 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4591 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4585 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4649 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4711 = false;
    float _4797 = _4629;
    float _4799 = _4599;
    float _4801 = _4605;
    float _4803 = _4591;
    float _4805 = _4585;
    float _4807 = _4649;
    float _4809 = fma(_4561, -0.5, 0.5);
    float _4811 = precise::clamp(_4809, 0.0, 1.0);
    float _4813 = -_4797;
    float _4815 = _4813 + _4799;
    float _4817 = -_4801;
    float _4819 = _4817 + _4803;
    out.m_84.x = 0.0;
    float _4821 = fma(_4811, _4815, _4797);
    float _4823 = -_4805;
    float _4825 = _4823 + _4807;
    float _4827 = fma(_4811, _4819, _4801);
    float _4829 = _4821 * 0.586610972881317138671875;
    bool _4831 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4833 = fma(_4811, _4825, _4805);
    float _4835 = _4595 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4837 = fma(_4827, 0.298911988735198974609375, _4829);
    bool _4839 = _4022 > 0.0;
    bool _4841 = isnan(_4022);
    bool _4843 = _4839 || _4841;
    bool _4845 = isnan(0.0);
    bool _4847 = _4843 || _4845;
    float _4849 = fma(_4833, 0.114477999508380889892578125, _4837);
    out.m_49.x = _4835;
    float _4851 = -_4849;
    float _4853 = _4827 + _4851;
    float _4855 = -_4849;
    float _4857 = _4821 + _4855;
    float _4859 = -_4849;
    float _4861 = _4833 + _4859;
    float _4863 = fma(_4853, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4849);
    float _4865 = fma(_4857, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4849);
    float _4867 = fma(_4861, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4849);
    bool _4869 = !_4831;
    if (!_4869)
    {
        float _4871 = -_3956;
        float _4873 = _4871 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4875 = -_3958;
        float _4877 = _4875 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4879 = -_3960;
        float _4881 = _4879 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4883 = _4873 * _4873;
        float _4885 = fma(_4877, _4877, _4883);
        float _4887 = fma(_4881, _4881, _4885);
        float _4889 = sqrt(_4887);
        float _4891 = rsqrt(_4887);
        float _4893 = -_4889;
        float _4895 = _4893 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4897 = _4895 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4899 = precise::clamp(_4897, 0.0, 1.0);
        float _4901 = _4877 * _4891;
        float _4903 = _4873 * _4891;
        float _4905 = abs(_4899);
        float _4907 = log2(_4905);
        float _4909 = _4881 * _4891;
        float _4911 = _4901 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4913 = _4561 * _4903;
        float _4915 = -_4903;
        float _4917 = -_4911;
        float _4919 = fma(_4915, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4917);
        float _4921 = fma(_4555, _4901, _4913);
        float _4923 = -_4909;
        float _4925 = fma(_4923, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4919);
        float _4927 = fma(_4563, _4909, _4921);
        float _4929 = precise::clamp(_4927, 0.0, 1.0);
        float _4931 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4933 = _4925 + _4931;
        float _4935 = _4907 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4937 = _4933 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4939 = precise::clamp(_4937, 0.0, 1.0);
        float _4941 = exp2(_4935);
        float _4943 = _4941 * _4939;
        float _4945 = _4929 * _4943;
        float _4947 = _4945 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4949 = _4945 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4951 = _4945 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _4947;
        out.m_84.y = _4949;
        out.m_84.z = _4951;
    }
    out.m_86.x = _4863;
    out.m_86.y = _4865;
    out.m_86.z = _4867;
    if (_4847)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4953 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4953;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

