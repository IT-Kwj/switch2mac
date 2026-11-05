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
    texture2d<float> vp_t_tcb_20 [[id(14)]];
    sampler vp_t_tcb_20Smplr [[id(15)]];
    sampler vp_t_tcb_24Smplr_w [[id(16)]];
    sampler vp_t_tcb_32Smplr_w [[id(17)]];
    sampler vp_t_tcb_30Smplr_w [[id(18)]];
    sampler vp_t_tcb_1CSmplr_w [[id(19)]];
    sampler vp_t_tcb_20Smplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_64 [[user(locn0)]];
    float4 m_66 [[user(locn1)]];
    float4 m_55 [[user(locn2)]];
    float4 m_104 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_78 [[user(locn5)]];
    float4 m_92 [[user(locn6)]];
    float4 m_82 [[user(locn7)]];
    float4 m_96 [[user(locn8)]];
    float4 m_76 [[user(locn9)]];
    float4 m_88 [[user(locn10)]];
    float4 m_84 [[user(locn11)]];
    float4 m_94 [[user(locn12)]];
    float4 m_80 [[user(locn13)]];
    float4 m_102 [[user(locn14)]];
    float4 m_90 [[user(locn15)]];
    float4 m_98 [[user(locn16)]];
    float4 m_100 [[user(locn17)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_86 [[attribute(0)]];
    float4 m_72 [[attribute(1)]];
    float4 m_74 [[attribute(2)]];
    float4 m_70 [[attribute(3)]];
    float4 m_68 [[attribute(4)]];
    float4 m_48 [[attribute(5)]];
    float4 m_50 [[attribute(6)]];
    float4 m_60 [[attribute(7)]];
    float4 m_62 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4685 = false;
    bool _499 = false;
    bool _317 = false;
    bool _221 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _118 = in.m_48.w;
    float _120 = in.m_50.w;
    float _122 = trunc(_118);
    int _125 = int(_122);
    float _127 = -_120;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _129;
    bool _133 = _125 >= 1;
    float _135 = 0.0;
    float _137 = _120;
    float _139 = _129;
    if (!_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _135;
    if (!_133)
    {
        out.m_55.x = 0.0;
    }
    int _143 = 0;
    if (!_133)
    {
        float _145 = _141 * 5.0;
        _143 = as_type<int>(_145);
    }
    int _147 = _143;
    if (!_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4994 = as_type<float>(_147);
        out.gl_Position.z = _4994;
    }
    if (!_133)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _149 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _151 = isnan(_120);
    bool _153 = _149 || _151;
    bool _155 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _157 = _153 || _155;
    float _159 = float(_125);
    bool _161 = _129 >= _159;
    bool _163 = !_157;
    bool _165 = _161 || _163;
    float _167 = 1.0 / _159;
    if (_165)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _137;
    if (_165)
    {
        out.m_55.x = 0.0;
    }
    float _171 = _129 * _167;
    int _173 = 0;
    float _175 = _171;
    if (_165)
    {
        float _177 = _169 * 5.0;
        _173 = as_type<int>(_177);
    }
    int _179 = _173;
    out.m_53.x = _171;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5057 = as_type<float>(_179);
        out.gl_Position.z = _5057;
    }
    if (_165)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _181 = as_type<float>(int(gl_VertexIndex));
    bool _183 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _185 = as_type<int>(_181) & 1;
    bool _187 = _185 != 0;
    int _189 = as_type<int>(_181) & 2;
    bool _191 = _189 != 0;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_191;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_183;
    float _219;
    if (!_201)
    {
        float _203 = in.m_60.x;
        float _205 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _207 = _203 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _209 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _211 = _209 * _205;
        float _213 = floor(_211);
        float _215 = -_213;
        float _217 = _211 + _215;
        _219 = _217;
        _221 = true;
    }
    else
    {
        _219 = _171;
    }
    _221 = false;
    float _223 = _219;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _227 = _223 + _225;
    bool _229 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _231 = isnan(_223);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _241;
    float _245 = -_239;
    float _247 = _245 + 1.0;
    bool _249 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _251 = isnan(_223);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _257 = _253 || _255;
    float _259 = float(_257);
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _261;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _267 = 1.0 / _243;
    float _269 = _259 * _247;
    float _271 = -_259;
    float _273 = _271 + 1.0;
    float _275 = _227 * _267;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _277;
    float _281 = fma(_263, _275, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _283 = fma(_279, _275, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _285 = _281 * _269;
    float _287 = _283 * _269;
    float _289 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[143].x, _285);
    float _291 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[143].y, _287);
    float _293 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[144].x, _289);
    float _295 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[144].y, _291);
    bool _297 = !_265;
    float _315;
    if (!_297)
    {
        float _299 = in.m_60.x;
        float _301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _303 = _299 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _307 = _305 * _301;
        float _309 = floor(_307);
        float _311 = -_309;
        float _313 = _307 + _311;
        _315 = _313;
        _317 = true;
    }
    else
    {
        _315 = _171;
    }
    _317 = false;
    float _319 = _315;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _323 = _319 + _321;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _333 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _335 = isnan(_319);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _349 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _351 = isnan(_319);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = 1.0 / _327;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _363;
    float _367 = -_343;
    float _369 = _367 + 1.0;
    bool _371 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _373 = isnan(_319);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    bool _383 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _385 = 1.0 / _331;
    float _387 = 1.0 / _347;
    float _389 = _365 * _361;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _393 = _391 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _395 = _359 * _369;
    float _397 = -_359;
    float _399 = _397 + 1.0;
    float _401 = fma(_389, _323, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _403 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _405 = isnan(_319);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = _381 * _399;
    float _417 = _393 * _385;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _421 = _319 + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _423;
    float _427 = _401 * _415;
    float _429 = -_381;
    float _431 = _429 + 1.0;
    float _433 = fma(_417, _421, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _435 = -_413;
    float _437 = _435 + 1.0;
    float _439 = _425 * _387;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _443 = _319 + _441;
    float _445 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[115].x, _427);
    float _447 = _343 * _437;
    float _449 = in.m_62.x;
    float _451 = in.m_62.y;
    float _453 = fma(_439, _443, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _455 = fma(_433, _395, _445);
    float _457 = fma(_453, _447, _455);
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _461 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[118].x, _457);
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _467 = _459 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _469 = _461 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _471 = _463 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _473 = _465 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_64.x = _467;
    out.m_64.y = _471;
    out.m_64.z = _473;
    out.m_64.w = _469;
    float _475 = _295 * _451;
    float _477 = _293 * _449;
    bool _479 = !_383;
    float _497;
    if (!_479)
    {
        float _481 = in.m_60.x;
        float _483 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _485 = _481 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _487 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[11].w, _129);
        float _489 = _487 * _483;
        float _491 = floor(_489);
        float _493 = -_491;
        float _495 = _489 + _493;
        _497 = _495;
        _499 = true;
    }
    else
    {
        _497 = _171;
    }
    _499 = false;
    float _501 = _497;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _505 = _501 + _503;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _515 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _517 = isnan(_501);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _531 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _533 = isnan(_501);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = 1.0 / _509;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _545;
    float _549 = -_525;
    float _551 = _549 + 1.0;
    bool _553 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _555 = isnan(_501);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    bool _565 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _567 = 1.0 / _513;
    float _569 = 1.0 / _529;
    float _571 = _547 * _543;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _577 = _541 * _551;
    float _579 = -_541;
    float _581 = _579 + 1.0;
    float _583 = fma(_571, _505, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _585 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _587 = isnan(_501);
    bool _589 = _585 || _587;
    bool _591 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _593 = _589 || _591;
    int _595 = _593 ? 1065353216 : 0;
    float _597 = _563 * _581;
    float _599 = _575 * _567;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _603 = _501 + _601;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _605;
    float _609 = _583 * _597;
    float _611 = -_563;
    float _613 = _611 + 1.0;
    float _615 = fma(_599, _603, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _617 = -as_type<float>(_595);
    float _619 = _617 + 1.0;
    float _621 = _607 * _569;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _625 = _501 + _623;
    float _627 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[131].x, _609);
    float _629 = _525 * _619;
    float _631 = fma(_621, _625, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _633 = fma(_615, _577, _627);
    float _635 = fma(_631, _629, _633);
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _643 = fma(as_type<float>(_595), (*spvDescriptorSet0.vp_c9)._m0[134].x, _635);
    float _645 = _639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _647 = _637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _649 = _641 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _651 = _643 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_66.x = _645;
    out.m_66.y = _649;
    out.m_66.z = _647;
    out.m_66.w = _651;
    bool _653 = !_565;
    float _655 = _643;
    int _657 = as_type<int>(_645);
    int _659 = _595;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    if (!_653)
    {
        float _663 = in.m_60.x;
        float _665 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _667 = _663 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _669 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[14].x, _129);
        float _671 = _669 * _665;
        float _673 = floor(_671);
        float _675 = -_673;
        float _677 = _671 + _675;
        _655 = _673;
        _175 = _677;
    }
    float _679 = _655;
    float _681 = _175;
    float _683 = in.m_60.z;
    float _685 = in.m_60.w;
    int _687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _689 = _687 != 0;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _693 = _679;
    if (_689)
    {
        float _695 = in.m_60.x;
        float _697 = in.m_60.y;
        _691 = _695;
        _693 = _697;
    }
    float _699 = _691;
    float _701 = _693;
    float _703 = 0.0;
    if (_689)
    {
        _703 = 1.0;
    }
    float _705 = _703;
    float _707 = 0.0;
    float _709 = _705;
    if (_689)
    {
        _707 = 1.0;
    }
    float _711 = _707;
    float _713 = _711;
    if (_689)
    {
        _657 = 0;
    }
    int _715 = _657;
    float _717 = _683 * 2.0;
    int _719 = _715;
    if (_689)
    {
        _659 = 0;
    }
    int _721 = _659;
    float _723 = floor(_717);
    float _725 = 0.0;
    float _727 = _701;
    float _729 = _699;
    int _731 = _721;
    if (_689)
    {
        _725 = _699;
    }
    float _733 = _725;
    bool _735 = _723 > 0.0;
    bool _737 = _723 >= 0.0;
    bool _739 = isnan(_723);
    bool _741 = _737 || _739;
    bool _743 = isnan(0.0);
    bool _745 = _741 || _743;
    float _747 = _723;
    float _749 = _733;
    if (_689)
    {
        _661 = _733;
    }
    float _751 = _661;
    float _753 = _745 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _755 = _753;
    float _757 = _751;
    if (_689)
    {
        _747 = _733;
    }
    float _759 = _747;
    int _761 = ~as_type<int>(_753);
    int _763 = _761 + 1;
    int _765 = _763 + 1;
    int _767 = _765;
    float _769 = _759;
    if (!_735)
    {
        int _771 = ~as_type<int>(_753);
        int _773 = _771 + 1;
        _767 = _773;
    }
    int _775 = _767;
    if (_689)
    {
        _755 = _701;
    }
    float _777 = _755;
    float _779 = _777;
    if (!_689)
    {
        float _781 = in.m_60.x;
        float _783 = in.m_60.y;
        float _785 = in.m_60.z;
        float _787 = _781 * 3.1415927410125732421875;
        float _789 = _787 * 0.15915493667125701904296875;
        float _791 = _783 * 3.1415927410125732421875;
        float _793 = _791 * 0.15915493667125701904296875;
        float _795 = _789 * 6.283185482025146484375;
        float _797 = sin(_795);
        float _799 = _793 * 6.283185482025146484375;
        float _801 = sin(_799);
        _757 = _797;
        _727 = _783;
        _719 = 1;
        _729 = _781;
        _731 = 2;
        _779 = _801;
        _713 = 5.839270114898681640625;
        _769 = _785;
        _709 = 7.345489978790283203125;
        _749 = _783;
    }
    float _803 = _757;
    float _805 = _727;
    int _807 = _719;
    float _809 = _729;
    int _811 = _731;
    float _813 = _779;
    float _815 = _713;
    float _817 = _769;
    float _819 = _709;
    float _821 = _749;
    float _823 = _803 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _825 = _805 * 2.0;
    bool _827 = _807 != 1;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _833 = floor(_825);
    float _835 = _809 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _837 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[93].z, _831);
    float _839 = _809 * 2.0;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _843 = _811 != 2;
    float _845 = floor(_839);
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    bool _849 = _683 > 0.5;
    float _851 = _805 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _853 = -_829;
    float _855 = fma(_835, 2.0, _853);
    float _857 = -_847;
    float _859 = fma(_823, 2.0, _857);
    int _861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _863 = _861 != 0;
    int _865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _867 = _865 != 0;
    int _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _871 = _869 != 0;
    float _873 = fma(_851, -2.0, _841);
    float _875 = -_199;
    float _877 = _849 ? _875 : _199;
    float _879 = _813 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _881 = int(_843);
    int _883 = _827 ? 2 : 0;
    int _885 = _881 | _883;
    int _887 = _849 ? 4 : 0;
    int _889 = _885 | _887;
    int _891 = _863 ? 8 : 0;
    int _893 = _889 | _891;
    int _895 = _867 ? 16 : 0;
    int _897 = _893 | _895;
    int _899 = _871 ? 32 : 0;
    int _901 = _897 | _899;
    int _903 = false ? 64 : 0;
    int _905 = _901 | _903;
    int _907 = _905 & 4;
    float _909 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _911 = log2(_909);
    bool _913 = _805 > 0.5;
    float _915 = _805 + _809;
    bool _917 = !_871;
    float _919 = _917 ? _199 : _877;
    float _921 = _167 * _129;
    float _923 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[92].z, _837);
    float _925 = _851;
    float _927 = _877;
    float _929 = _823;
    float _931 = _835;
    float _933 = _839;
    float _935 = _813;
    if (!_827)
    {
        _925 = _683;
    }
    float _937 = _925;
    float _939 = -_129;
    float _941 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[76].x, _855);
    float _943 = _937;
    if (!_827)
    {
        _927 = _683;
    }
    float _945 = _927;
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _949 = _945;
    if (!_827)
    {
        _929 = _805;
    }
    float _951 = _929;
    float _953 = -_129;
    float _955 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[91].x, _859);
    float _957 = _951;
    if (!_827)
    {
        _931 = _805;
    }
    float _959 = _931;
    float _961 = fma(_879, -2.0, _947);
    int _963 = int(_843);
    int _965 = _827 ? 2 : 0;
    int _967 = _963 | _965;
    int _969 = _913 ? 4 : 0;
    int _971 = _967 | _969;
    int _973 = _863 ? 8 : 0;
    int _975 = _971 | _973;
    int _977 = _867 ? 16 : 0;
    int _979 = _975 | _977;
    int _981 = _871 ? 32 : 0;
    int _983 = _979 | _981;
    int _985 = false ? 64 : 0;
    int _987 = _983 | _985;
    int _989 = _987 & 4;
    float _991 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _993 = int(_991);
    float _995 = -_195;
    int _997 = _913 ? as_type<int>(_995) : as_type<int>(_195);
    float _999 = _911 * _129;
    float _1001 = _959;
    float _1003 = as_type<float>(_989);
    if (_827)
    {
        _943 = _805;
    }
    float _1005 = _943;
    float _1007 = _477 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (_827)
    {
        _949 = _805;
    }
    float _1009 = _949;
    float _1011 = _475 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    if (_827)
    {
        _957 = _809;
    }
    float _1013 = _957;
    float _1015 = exp2(_999);
    if (_827)
    {
        _1001 = _809;
    }
    float _1017 = _1001;
    bool _1019 = _845 >= 0.0;
    bool _1021 = isnan(_845);
    bool _1023 = _1019 || _1021;
    bool _1025 = isnan(0.0);
    bool _1027 = _1023 || _1025;
    bool _1029 = _833 >= 0.0;
    bool _1031 = isnan(_833);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan(0.0);
    bool _1037 = _1033 || _1035;
    bool _1039 = !_867;
    float _1041 = _1039 ? _195 : as_type<float>(_997);
    float _1043 = _915 + (-1.0);
    int _1045 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1047 = _1045 != 0;
    int _1049 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1051 = _1049 != 0;
    int _1053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1055 = _1053 != 0;
    float _1057 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1059 = int(_1057);
    float _1061 = -_1015;
    float _1063 = _1061 + 1.0;
    bool _1065 = !_1051;
    float _1067 = _1065 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1069 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1071 = !_1047;
    int _1073 = _1071 ? 0 : 1;
    float _1075 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1077 = !_1055;
    int _1079 = _1077 ? 0 : 1;
    int _1081 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1083 = _1081 != 0;
    int _1085 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1087 = _1085 != 0;
    int _1089 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1091 = _1089 != 0;
    bool _1093 = !_1087;
    int _1095 = _1093 ? 0 : 1;
    float _1097 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1099 = !_1083;
    int _1101 = _1099 ? 0 : 1;
    bool _1103 = !_1091;
    int _1105 = _1103 ? 0 : 1;
    float _1107 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1097);
    float _1109 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1111 = int(_1109);
    int _1113 = _1027 ? 0 : 1;
    int _1115 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1117 = _1115 != 0;
    int _1119 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1121 = _1119 != 0;
    int _1123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1125 = _1123 != 0;
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    bool _1129 = _833 > 0.0;
    float _1131 = fma(_1017, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1075);
    float _1133 = _1013 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1135 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1137 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1127);
    float _1139 = _1067;
    if (_843)
    {
        _933 = _809;
    }
    float _1141 = _933;
    float _1143 = -_1135;
    float _1145 = fma(_1133, 2.0, _1143);
    float _1147 = _1141;
    if (!_843)
    {
        _1147 = _683;
    }
    float _1149 = _1147;
    float _1151 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1153 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_843)
    {
        _935 = _805;
    }
    float _1155 = _935;
    float _1157 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1137);
    bool _1159 = !_1117;
    int _1161 = _1159 ? 0 : 1;
    float _1163 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1165 = _1155;
    if (!_843)
    {
        _1165 = _809;
    }
    float _1167 = _1165;
    float _1169 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1107);
    bool _1171 = _845 > 0.0;
    float _1173 = fma(_1153, -2.0, _1151);
    float _1175 = float(_993);
    float _1177 = -_129;
    float _1179 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1145);
    float _1181 = 1.0 / _1175;
    int _1183 = abs(_1161);
    float _1185 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1187 = float(_775);
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1191 = float(_1059);
    float _1193 = -_1185;
    float _1195 = fma(_1163, 2.0, _1193);
    int _1197 = ~_1113;
    int _1199 = _1197 + 1;
    int _1201 = _1199 + 1;
    float _1203 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1173);
    float _1205 = _1167 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1207 = float(_1183);
    float _1209 = 1.0 / _1191;
    int _1211 = _1201;
    if (!_1171)
    {
        int _1213 = ~_1113;
        int _1215 = _1213 + 1;
        _1211 = _1215;
    }
    int _1217 = _1211;
    float _1219 = fma(_1205, -2.0, _1189);
    bool _1221 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1223 = isnan(0.0);
    bool _1225 = _1221 || _1223;
    bool _1227 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1229 = _1225 || _1227;
    float _1231 = _1207 * _1187;
    float _1233 = float(_1111);
    float _1235 = _1181 * _129;
    float _1237 = in.m_68.x;
    float _1239 = in.m_68.y;
    float _1241 = in.m_68.z;
    float _1243 = 1.0 / _1233;
    float _1245 = _1229 ? _1063 : 0.0;
    float _1247 = _1231 * (-2.0);
    bool _1249 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1251 = isnan(1.0);
    bool _1253 = _1249 || _1251;
    bool _1255 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1257 = _1253 || _1255;
    float _1259 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1261 = 1.0 + _1259;
    float _1263 = fma(_1069, _1247, _1069);
    float _1265 = 1.0 / _1261;
    float _1267 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1269 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _1271 = !_1121;
    int _1273 = _1271 ? 0 : 1;
    float _1275 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1277 = _1037 ? 0 : 1;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1281 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1267);
    int _1283 = abs(_1273);
    float _1285 = _1209 * _129;
    float _1287 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1269);
    float _1289 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1275);
    float _1291 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1279);
    int _1293 = ~_1277;
    int _1295 = _1293 + 1;
    int _1297 = _1295 + 1;
    float _1299 = _809 + (-0.5);
    float _1301 = fma(_1247, _1237, _1237);
    int _1303 = _1297;
    if (!_1129)
    {
        int _1305 = ~_1277;
        int _1307 = _1305 + 1;
        _1303 = _1307;
    }
    int _1309 = _1303;
    float _1311 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1281);
    float _1313 = float(_1217);
    float _1315 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1287);
    bool _1317 = !_1125;
    int _1319 = _1317 ? 0 : 1;
    float _1321 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _873);
    float _1323 = float(_1283);
    float _1325 = _1243 * _129;
    float _1327 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1289);
    float _1329 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1291);
    float _1331 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[91].y, _961);
    float _1333 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1131);
    float _1335 = -_129;
    float _1337 = fma(_1335, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1195);
    float _1339 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1219);
    if (_1257)
    {
        float _1341 = _1245 * _1265;
        _139 = _1341;
    }
    float _1343 = _139;
    float _1345 = fma(_1299, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1301);
    int _1347 = abs(_1319);
    float _1349 = _1323 * _1313;
    float _1351 = _805 + _683;
    float _1353 = fma(_1263, _1343, _1345);
    float _1355 = _1349 * (-2.0);
    float _1357 = _1351 + (-1.0);
    float _1359 = float(_1309);
    float _1361 = fma(_1355, _1239, _1239);
    float _1363 = float(_1347);
    float _1365 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1367 = _805 + (-0.5);
    float _1369 = _809 + _683;
    float _1371 = _683 + (-0.5);
    float _1373 = _1363 * _1359;
    float _1375 = fma(_1367, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1361);
    float _1377 = _1369 + (-1.0);
    float _1379 = _1373 * (-2.0);
    float _1381 = fma(_1365, _1355, _1365);
    float _1383 = _1353 * 0.15915493667125701904296875;
    float _1385 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1387 = fma(_1379, _1241, _1241);
    float _1389 = fma(_1381, _1343, _1375);
    float _1391 = _1383 * 6.283185482025146484375;
    float _1393 = sin(_1391);
    float _1395 = fma(_1385, _1379, _1385);
    float _1397 = fma(_1371, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1387);
    float _1399 = _1389 * 0.15915493667125701904296875;
    float _1401 = in.m_48.x;
    float _1403 = in.m_48.y;
    float _1405 = in.m_48.z;
    bool _1407 = _685 > 0.5;
    float _1409 = fma(_1395, _1343, _1397);
    float _1411 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1413 = in.m_70.x;
    float _1415 = in.m_70.y;
    float _1417 = in.m_70.z;
    float _1419 = in.m_70.w;
    float _1421 = _1383 * 6.283185482025146484375;
    float _1423 = cos(_1421);
    float _1425 = _1409 * 0.15915493667125701904296875;
    float _1427 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _1429 = _1007 * _1411;
    float _1431 = _1011 * _1427;
    float _1433 = _1399 * 6.283185482025146484375;
    float _1435 = sin(_1433);
    float _1437 = in.m_72.x;
    float _1439 = in.m_72.y;
    float _1441 = in.m_72.z;
    float _1443 = in.m_72.w;
    float _1445 = _1399 * 6.283185482025146484375;
    float _1447 = cos(_1445);
    float _1449 = _1403 * _1415;
    float _1451 = _1425 * 6.283185482025146484375;
    float _1453 = cos(_1451);
    float _1455 = _1393 * _1435;
    float _1457 = fma(_1401, _1413, _1449);
    float _1459 = fma(_1405, _1417, _1457);
    float _1461 = _1425 * 6.283185482025146484375;
    float _1463 = sin(_1461);
    float _1465 = _1423 * _1447;
    float _1467 = _1393 * _1447;
    float _1469 = _1403 * _1439;
    float _1471 = fma(_1401, _1437, _1469);
    float _1473 = _1423 * _1453;
    float _1475 = _1423 * _1435;
    float _1477 = _1393 * _1453;
    float _1479 = _1447 * _1453;
    float _1481 = _1473 * _1431;
    float _1483 = _1435 * _1453;
    float _1485 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1487 = fma(_1405, _1441, _1471);
    float _1489 = fma(_1463, _1465, _1455);
    float _1491 = -_1431;
    float _1493 = _1463 * _1491;
    float _1495 = -_1467;
    float _1497 = fma(_1463, _1475, _1495);
    float _1499 = -_1475;
    float _1501 = fma(_1463, _1467, _1499);
    float _1503 = fma(_1489, _1429, _1481);
    float _1505 = _1477 * _1431;
    float _1507 = fma(_1479, _1429, _1493);
    float _1509 = _1487 + _1443;
    float _1511 = fma(_1497, _1485, _1503);
    float _1513 = fma(_1463, _1455, _1465);
    float _1515 = fma(_1501, _1429, _1505);
    float _1517 = fma(_1483, _1485, _1507);
    float _1519 = _1511 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1521 = _1511 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1523 = fma(_1513, _1485, _1515);
    float _1525 = _1459 + _1419;
    float _1527 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1519);
    float _1529 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1521);
    float _1531 = _1511 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1533 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1527);
    float _1535 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1529);
    float _1537 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1531);
    float _1539 = _1533 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1541 = _1535 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1543 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1537);
    float _1545 = in.m_74.x;
    float _1547 = in.m_74.y;
    float _1549 = in.m_74.z;
    float _1551 = in.m_74.w;
    float _1553 = _1525 + _1539;
    float _1555 = _1509 + _1541;
    float _1557 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1559 = _1553 + _1557;
    float _1561 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1563 = _1555 + _1561;
    float _1565 = _1559 * _1559;
    float _1567 = fma(_1563, _1563, _1565);
    float _1569 = sqrt(_1567);
    float _1571 = _1403 * _1547;
    float _1573 = fma(_1401, _1545, _1571);
    float _1575 = fma(_1405, _1549, _1573);
    bool _1577 = _1569 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1579 = _1575 + _1551;
    float _1581 = _1579 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1583 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1581);
    float _1585 = _1403;
    float _1587 = _1545;
    float _1589 = _1551;
    float _1591 = _1523;
    float _1593 = _1555;
    float _1595 = _1553;
    float _1597 = _1567;
    float _1599 = _1579;
    if (_1577)
    {
        float _1601 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1585 = _1601;
    }
    float _1603 = _1585;
    float _1605 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1583);
    float _1607 = _1605 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1609 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1611 = _1569 + _1609;
    float _1613 = _1611;
    if (_1577)
    {
        float _1615 = rsqrt(_1567);
        _1587 = _1615;
    }
    float _1617 = _1587;
    float _1619 = _1617;
    if (_1577)
    {
        float _1621 = _1611 * _1603;
        _1613 = _1621;
    }
    float _1623 = _1613;
    float _1625 = 1.0 / _1607;
    float _1627 = _1543 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    if (_1577)
    {
        float _1629 = _1623 * 0.15915493667125701904296875;
        _1589 = _1629;
    }
    float _1631 = _1589;
    float _1633 = _1579 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1635 = _1579 + _1627;
    float _1637 = _1405;
    float _1639 = _1635;
    float _1641 = _1631;
    if (_1577)
    {
        float _1643 = _1631 * 6.283185482025146484375;
        float _1645 = sin(_1643);
        _1637 = _1645;
    }
    float _1647 = _1637;
    float _1649 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1633);
    if (_1577)
    {
        float _1651 = _1635 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1591 = _1651;
    }
    float _1653 = _1591;
    float _1655 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1649);
    float _1657 = _1627;
    float _1659 = _1653;
    if (_1577)
    {
        float _1661 = _1631 * 6.283185482025146484375;
        float _1663 = cos(_1661);
        _1657 = _1663;
    }
    float _1665 = _1657;
    float _1667 = _1655 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1669 = _1667 + _1607;
    float _1671 = -_199;
    float _1673 = _1407 ? _1671 : _199;
    float _1675 = _1673;
    if (_1577)
    {
        float _1677 = fma(_1647, _1653, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1659 = _1677;
    }
    float _1679 = _1659;
    float _1681 = _1669 * _1625;
    float _1683 = _1681 * 0.5;
    bool _1685 = !_863;
    float _1687 = _1685 ? _199 : _1673;
    float _1689 = _1679;
    float _1691 = _1683;
    if (_1577)
    {
        float _1693 = _1617 * _1679;
        _1689 = _1693;
    }
    float _1695 = _1689;
    int _1697 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1699 = _1697 != 0;
    int _1701 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1703 = _1701 != 0;
    int _1705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1707 = _1705 != 0;
    int _1709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1711 = _1709 != 0;
    float _1713 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1715 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1713);
    if (!_1577)
    {
        _1691 = _1553;
    }
    float _1717 = _1691;
    float _1719 = _1717;
    if (_1577)
    {
        float _1721 = _1665 + (-1.0);
        _1675 = _1721;
    }
    float _1723 = _1675;
    float _1725 = _1723;
    if (_1577)
    {
        float _1727 = fma(_1563, _1695, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1593 = _1727;
    }
    float _1729 = _1593;
    bool _1731 = !_1699;
    int _1733 = _1731 ? 0 : 1;
    if (_1577)
    {
        float _1735 = fma(_1559, _1695, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1719 = _1735;
    }
    float _1737 = _1719;
    float _1739 = 1.0 / _1715;
    bool _1741 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1743 = isnan(0.5);
    bool _1745 = _1741 || _1743;
    bool _1747 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1749 = _1745 || _1747;
    if (_1577)
    {
        float _1751 = _1723 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1725 = _1751;
    }
    float _1753 = _1725;
    bool _1755 = !_1703;
    int _1757 = _1755 ? 0 : 1;
    bool _1759 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1761 = isnan(0.5);
    bool _1763 = _1759 || _1761;
    bool _1765 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1767 = _1763 || _1765;
    if (_1577)
    {
        float _1769 = fma(_1635, _1665, _1753);
        _1639 = _1769;
    }
    float _1771 = _1639;
    bool _1773 = !_1707;
    int _1775 = _1773 ? 0 : 1;
    bool _1777 = !_1711;
    int _1779 = _1777 ? 0 : 1;
    float _1781 = _1771;
    if (_1749)
    {
        _1595 = _1729;
    }
    float _1783 = _1595;
    float _1785 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1787 = _1739 * _1785;
    float _1789 = _1783;
    if (_1749)
    {
        _1597 = _1737;
    }
    float _1791 = _1597;
    float _1793 = _1791;
    if (_1767)
    {
        _1641 = 1.0;
    }
    float _1795 = _1641;
    float _1797 = _1795;
    if (!_1749)
    {
        float _1799 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1801 = _1579 + _1799;
        float _1803 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1805 = _1509 + _1803;
        float _1807 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1809 = -_1579;
        float _1811 = _1809 + _1771;
        float _1813 = _1801 * _1801;
        float _1815 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1817 = _1525 + _1815;
        float _1819 = -_1509;
        float _1821 = _1819 + _1729;
        float _1823 = -_1525;
        float _1825 = _1823 + _1737;
        float _1827 = fma(_1805, _1805, _1813);
        float _1829 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1831 = fma(_1817, _1817, _1827);
        float _1833 = sqrt(_1831);
        float _1835 = _1807 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1837 = precise::min(_1833, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1839 = _1837 * _1829;
        float _1841 = _1835 * _1839;
        float _1843 = fma(_1811, _1841, _1579);
        float _1845 = fma(_1821, _1841, _1509);
        float _1847 = fma(_1825, _1841, _1525);
        _1781 = _1843;
        _1789 = _1845;
        _1793 = _1847;
        _1619 = _1807;
    }
    float _1849 = _1781;
    float _1851 = _1789;
    float _1853 = _1793;
    float _1855 = _1619;
    float _1857 = _1855;
    if (!_1767)
    {
        float _1859 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1861 = _1859 * 0.15915493667125701904296875;
        float _1863 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1865 = _1861 * 6.283185482025146484375;
        float _1867 = cos(_1865);
        float _1869 = _1863 * 0.15915493667125701904296875;
        float _1871 = _1861 * 6.283185482025146484375;
        float _1873 = sin(_1871);
        float _1875 = 1.0 / _1867;
        float _1877 = _1869 * 6.283185482025146484375;
        float _1879 = cos(_1877);
        float _1881 = _1873 * _1875;
        float _1883 = _1869 * 6.283185482025146484375;
        float _1885 = sin(_1883);
        float _1887 = _1879 * _1881;
        float _1889 = 1.0 / _1887;
        float _1891 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1893 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1891;
        float _1895 = 1.0 / _1893;
        float _1897 = _1885 * _1889;
        float _1899 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1901 = fma(_1787, _1897, _1899);
        float _1903 = _1901 * _1895;
        float _1905 = precise::clamp(_1903, 0.0, 1.0);
        _1599 = _1861;
        _1857 = _1869;
        _1797 = _1905;
    }
    float _1907 = _1599;
    float _1909 = _1857;
    float _1911 = _1797;
    float _1913 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1915 = _1849 + _1913;
    float _1917 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1919 = _1851 + _1917;
    float _1921 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1923 = _1853 + _1921;
    bool _1925 = _907 != 0;
    float _1927 = _1915 * _1915;
    float _1929 = fma(_1737, 6.2500002968590706586837768554688e-05, 0.5);
    float _1931 = fma(_1919, _1919, _1927);
    float _1933 = fma(_1923, _1923, _1931);
    float _1935 = rsqrt(_1933);
    float _1937 = sqrt(_1933);
    float _1939 = _1935 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1941 = _1919 * _1939;
    float _1943 = _1923 * _1939;
    float _1945 = _1941 * _1941;
    float _1947 = _1943 * _1943;
    float _1949 = _1945 + _1947;
    float _1951 = sqrt(_1949);
    bool _1953 = _1951 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1955 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1957 = _1951 + _1955;
    float _1959 = _1935;
    float _1961 = _1957;
    float _1963 = _1907;
    float _1965 = _1915;
    float _1967 = _1939;
    float _1969 = _1949;
    if (_1953)
    {
        float _1971 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1959 = _1971;
    }
    float _1973 = _1959;
    float _1975 = _1973;
    if (_1953)
    {
        float _1977 = _1957 * _1973;
        _1961 = _1977;
    }
    float _1979 = _1961;
    if (_1953)
    {
        float _1981 = rsqrt(_1949);
        _1975 = _1981;
    }
    float _1983 = _1975;
    float _1985 = _1983;
    if (_1953)
    {
        float _1987 = _1979 * 0.15915493667125701904296875;
        _1963 = _1987;
    }
    float _1989 = _1963;
    float _1991 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1993 = _1923;
    if (_1953)
    {
        float _1995 = _1989 * 6.283185482025146484375;
        float _1997 = sin(_1995);
        _1993 = _1997;
    }
    float _1999 = _1993;
    float _2001 = precise::max(0.0, _1991);
    float _2003 = _1909;
    if (_1953)
    {
        float _2005 = _1989 * 6.283185482025146484375;
        float _2007 = cos(_2005);
        _2003 = _2007;
    }
    float _2009 = _2003;
    float _2011 = -_1939;
    float _2013 = -_2001;
    float _2015 = fma(_1915, _2011, _2013);
    float _2017 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1953)
    {
        float _2019 = _2015 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1965 = _2019;
    }
    float _2021 = _1965;
    float _2023 = fma(_1509, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2025 = _1999;
    float _2027 = _2021;
    if (_1953)
    {
        float _2029 = fma(_1999, _2021, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2025 = _2029;
    }
    float _2031 = _2025;
    float _2033 = _2031;
    if (!_1953)
    {
        _2027 = _2015;
    }
    float _2035 = _2027;
    float _2037 = floor(_2023);
    float _2039 = _2035;
    if (_1953)
    {
        float _2041 = _1983 * _2031;
        _1967 = _2041;
    }
    float _2043 = _1967;
    if (!_1953)
    {
        _1985 = _1941;
    }
    float _2045 = _1985;
    float _2047 = _2045;
    float _2049 = _2009;
    if (_1953)
    {
        float _2051 = _2009 + (-1.0);
        _2017 = _2051;
    }
    float _2053 = _2017;
    float _2055 = _2053;
    if (_1953)
    {
        float _2057 = _1941 * _2043;
        _2047 = _2057;
    }
    float _2059 = _2047;
    if (!_1953)
    {
        _2033 = _1945;
    }
    float _2061 = _2033;
    float _2063 = _2061;
    if (_1953)
    {
        float _2065 = _2053 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1969 = _2065;
    }
    float _2067 = _1969;
    if (!_1953)
    {
        _2055 = _1943;
    }
    float _2069 = _2055;
    float _2071 = _2069;
    if (_1953)
    {
        float _2073 = _2059 * _2059;
        _2063 = _2073;
    }
    float _2075 = _2063;
    if (_1953)
    {
        float _2077 = _1943 * _2043;
        _2071 = _2077;
    }
    float _2079 = _2071;
    if (_1953)
    {
        float _2081 = fma(_2015, _2009, _2067);
        _2039 = _2081;
    }
    float _2083 = _2039;
    if (!_1953)
    {
        _2049 = _1947;
    }
    float _2085 = _2049;
    float _2087 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2089 = _2085;
    if (_1953)
    {
        float _2091 = _2079 * _2079;
        _2089 = _2091;
    }
    float _2093 = _2089;
    float _2095 = fma(_2083, _2083, _2075);
    float _2097 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2087);
    float _2099 = -_2037;
    float _2101 = _2023 + _2099;
    float _2103 = _2095 + _2093;
    float _2105 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2107 = fma(_1937, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2105);
    float _2109 = precise::clamp(_2107, 0.0, 1.0);
    float _2111 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2097);
    float _2113 = rsqrt(_2103);
    float _2115 = -_2109;
    float _2117 = _2115 + 1.0;
    float _2119 = _2111 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2121 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2123 = _2119 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2125 = fma(_1525, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2127 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2129 = -_2123;
    float _2131 = fma(_2129, _2121, 1.0);
    float _2133 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2135 = abs(_2117);
    float _2137 = log2(_2135);
    float _2139 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2127);
    float _2141 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2143 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2133);
    float _2145 = _2113 * _2059;
    float _2147 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2139);
    float _2149 = _2113 * _2083;
    float _2151 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2143);
    float _2153 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2155 = _2147 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2157 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2141);
    float _2159 = _2151 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2161 = _2113 * _2079;
    float _2163 = -_2153;
    float _2165 = fma(_2149, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2163);
    float _2167 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2157);
    float _2169 = _2159 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2171 = floor(_2125);
    float _2173 = -_2161;
    float _2175 = fma(_2173, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2165);
    float _2177 = _2167 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2179 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2169);
    float _2181 = _2137 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2183 = fma(_2175, -0.5, 0.5);
    float _2185 = fma(_2175, 0.5, 0.5);
    float _2187 = fma(_2119, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2179);
    float _2189 = exp2(_2181);
    float _2191 = _2149 + 1.0;
    float _2193 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2187);
    float _2195 = fma(_2185, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2197 = _2159 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2199 = -_2171;
    float _2201 = _2125 + _2199;
    float _2203 = sqrt(_2183);
    float _2205 = _2159 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2207 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2197);
    float _2209 = fma(_2185, _2195, -0.212114393711090087890625);
    float _2211 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2205);
    float _2213 = fma(_2119, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2207);
    float _2215 = fma(_2185, _2209, 1.570728778839111328125);
    float _2217 = log2(_2131);
    float _2219 = fma(_2119, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2211);
    float _2221 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2213);
    float _2223 = -_2149;
    float _2225 = fma(_2189, _2191, _2223);
    float _2227 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2219);
    float _2229 = fma(_1729, 6.2500002968590706586837768554688e-05, 0.5);
    float _2231 = fma(_2225, 0.5, 0.5);
    float _2233 = 1.0 / _2193;
    float _2235 = _2203 * 0.636619746685028076171875;
    float _2237 = -_2215;
    float _2239 = fma(_2235, _2237, 1.0);
    float _2241 = _2217 * 0.693147182464599609375;
    float2 _8251 = float2(_2101, _2201);
    float _2243 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8251, float2(0.0), isnan(_8251)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8251, float2(0.0), isnan(_8251)), level(0.0)).x;
    float _2245 = _2241 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2247 = _2221 * _2233;
    float _2249 = _2227 * _2233;
    float _2251 = fma(_2247, 0.5, 0.5);
    float _2253 = fma(_2249, -0.5, 0.5);
    float3 _8276 = float3(_2251, _2253, _2245);
    float _2255 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8276, float3(0.0), isnan(_8276)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8276, float3(0.0), isnan(_8276)), level(0.0)).x;
    float3 _8287 = float3(_2251, _2253, _2245);
    float4 _2258 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8287, float3(0.0), isnan(_8287)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8287, float3(0.0), isnan(_8287)), level(0.0)).xyzw;
    float _2260 = _2258.x;
    float _2262 = _2258.y;
    float _2264 = _2258.z;
    float _2266 = _2258.w;
    float2 _8303 = float2(_2239, _2231);
    float3 _2270 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8303, float2(0.0), isnan(_8303)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8303, float2(0.0), isnan(_8303)), level(0.0)).xyz;
    float _2272 = _2270.x;
    float _2274 = _2270.y;
    float _2276 = _2270.z;
    float2 _8317 = float2(_2229, _1929);
    float3 _2278 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_8317, float2(0.0), isnan(_8317)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_8317, float2(0.0), isnan(_8317)), level(0.0)).xyz;
    float _2280 = _2278.x;
    float _2282 = _2278.y;
    float _2284 = _2278.z;
    float _2286 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2288 = int(_2286);
    float _2290 = _815 * _817;
    int _2292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2294 = _2292 != 0;
    float _2296 = -_1157;
    float _2298 = _2296 + 1.0;
    int _2300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2302 = _2300 != 0;
    float _2304 = -_1327;
    float _2306 = _2304 + 1.0;
    int _2308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2310 = _2308 != 0;
    float _2312 = -_1333;
    float _2314 = _2312 + 1.0;
    float _2316 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _2318 = int(_2316);
    int _2320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2322 = _2320 != 0;
    float _2324 = -_1169;
    float _2326 = _2324 + 1.0;
    int _2328 = abs(_1073);
    float _2330 = _2137 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2332 = abs(_1079);
    float _2334 = _2159 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2336 = abs(_1757);
    float _2338 = trunc(_1235);
    int _2340 = int(_2338);
    float _2342 = float(uint(_2288));
    float _2344 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2334);
    float _2346 = trunc(_1285);
    int _2348 = int(_2346);
    float _2350 = float(uint(_2318));
    float _2352 = -_1329;
    float _2354 = _2352 + 1.0;
    float _2356 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _2358 = int(_2356);
    float _2360 = float(uint(_2340));
    float _2362 = fma(_2119, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2344);
    float _2364 = float(_2288);
    int _2366 = ~_2318;
    int _2368 = _2366 + 1;
    float _2370 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2362);
    float _2372 = float(_2318);
    float _2374 = 1.0 / _2342;
    float _2376 = float(uint(_2348));
    int _2378 = abs(_1779);
    out.gl_Position.x = _2221;
    out.gl_Position.y = _2227;
    out.gl_Position.z = _2370;
    out.gl_Position.w = _2193;
    bool _2380 = _989 != 0;
    bool _2382 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2384 = isnan(_681);
    bool _2386 = _2382 || _2384;
    bool _2388 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2390 = _2386 || _2388;
    float _2392 = float(_2390);
    float _2394 = 1.0 / _2350;
    float _2396 = float(uint(_2358));
    float _2398 = 1.0 / _2396;
    int _2400 = as_type<int>(_2374) + (-2);
    float _2402 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2404 = _2402 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2406 = float(_2340);
    float _2408 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2410 = _2408 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2412 = as_type<float>(_2400) * _2360;
    bool _2414 = _2406 >= _2364;
    bool _2416 = isnan(_2406);
    bool _2418 = _2414 || _2416;
    bool _2420 = isnan(_2364);
    bool _2422 = _2418 || _2420;
    float _2424 = float(_2422);
    float _2426 = trunc(_1325);
    int _2428 = int(_2426);
    int _2430 = as_type<int>(_2394) + (-2);
    float _2432 = _819 * _809;
    int _2434 = ~_2288;
    int _2436 = _2434 + 1;
    float _2438 = as_type<float>(_2430) * _2376;
    float _2440 = trunc(_2412);
    float _2442 = precise::max(_2440, 0.0);
    uint _2445 = uint(_2442);
    float _2447 = trunc(_2438);
    float _2449 = precise::max(_2447, 0.0);
    uint _2451 = uint(_2449);
    float _2453 = float(uint(_2428));
    int _2455 = _2436 * int(_2445);
    int _2457 = _2455 + _2340;
    float _2459 = trunc(_2424);
    int _2461 = int(_2459);
    float _2463 = float(uint(_2457));
    int _2465 = as_type<int>(_2398) + (-2);
    float _2467 = floor(_2290);
    float _2469 = as_type<float>(_2400) * _2463;
    int _2471 = _2368 * int(_2451);
    int _2473 = _2471 + _2348;
    float _2475 = as_type<float>(_2465) * _2453;
    int _2477 = ~_2288;
    int _2479 = _2477 + 1;
    float _2481 = float(_2348);
    float _2483 = trunc(_2469);
    float _2485 = precise::max(_2483, 0.0);
    uint _2487 = uint(_2485);
    float _2489 = float(uint(_2473));
    bool _2491 = _2481 >= _2372;
    bool _2493 = isnan(_2481);
    bool _2495 = _2491 || _2493;
    bool _2497 = isnan(_2372);
    bool _2499 = _2495 || _2497;
    float _2501 = float(_2499);
    float _2503 = as_type<float>(_2430) * _2489;
    float _2505 = _819 * _821;
    float _2507 = floor(_2432);
    float _2509 = -_2467;
    float _2511 = _2290 + _2509;
    float _2513 = trunc(_2503);
    float _2515 = precise::max(_2513, 0.0);
    uint _2517 = uint(_2515);
    int _2519 = int(_2445) + int(_2487);
    int _2521 = ~_2358;
    int _2523 = _2521 + 1;
    int _2525 = _2479 * _2519;
    int _2527 = _2525 + _2340;
    int _2529 = ~_2318;
    int _2531 = _2529 + 1;
    float _2533 = trunc(_2475);
    float _2535 = precise::max(_2533, 0.0);
    uint _2537 = uint(_2535);
    float _2539 = -_2507;
    float _2541 = _2432 + _2539;
    bool _2543 = uint(_2527) >= uint(_2288);
    float _2545 = _2511 * _2372;
    float _2547 = _2541 * _2364;
    float _2549 = _2364 * _921;
    int _2551 = int(_2451) + int(_2517);
    float _2553 = trunc(_2501);
    int _2555 = int(_2553);
    bool _2557 = !_2322;
    int _2559 = _2557 ? 0 : 1;
    float _2561 = _2372 * _921;
    int _2563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2565 = _2563 != 0;
    int _2567 = _2531 * _2551;
    int _2569 = _2567 + _2348;
    int _2571 = abs(_2559);
    int _2573 = _2523 * int(_2537);
    int _2575 = _2573 + _2428;
    float _2577 = trunc(_2547);
    int _2579 = int(_2577);
    bool _2581 = !_2565;
    int _2583 = _2581 ? 0 : 1;
    bool _2585 = _2288 == 0;
    float _2587 = float(uint(_2575));
    bool _2589 = !_2543;
    int _2591 = _2589 ? 0 : (-1);
    float _2593 = trunc(_2545);
    int _2595 = int(_2593);
    bool _2597 = uint(_2569) >= uint(_2318);
    float _2599 = as_type<float>(_2465) * _2587;
    int _2601 = ~_2519;
    int _2603 = _2601 + _2591;
    int _2605 = _2603 + 1;
    bool _2607 = !_2597;
    int _2609 = _2607 ? 0 : (-1);
    int _2611 = abs(_2583);
    int _2613 = _2579 * _2571;
    int _2615 = _2613 + _2340;
    int _2617 = ~_2551;
    int _2619 = _2617 + _2609;
    int _2621 = _2619 + 1;
    int _2623 = _2288 * _2605;
    int _2625 = _2623 + _2340;
    float _2627 = as_type<float>(_2551);
    float _2629 = _2505;
    float _2631 = _2227;
    float _2633 = _2221;
    if (_2310)
    {
        float _2635 = in.m_60.w;
        _2627 = _2635;
    }
    float _2637 = _2627;
    float _2639 = trunc(_2599);
    float _2641 = precise::max(_2639, 0.0);
    uint _2643 = uint(_2641);
    bool _2645 = _2318 == 0;
    int _2647 = _2318 * _2621;
    int _2649 = _2647 + _2348;
    int _2651 = ~_2461;
    int _2653 = _2651 + 1;
    int _2655 = _2653 + 1;
    int _2657 = _2595 * _2611;
    int _2659 = _2657 + _2348;
    bool _2661 = !_2585;
    int _2663 = _2661 ? _2625 : (-1);
    int _2665 = ~_2555;
    int _2667 = _2665 + 1;
    int _2669 = _2667 + 1;
    float _2671 = trunc(_2549);
    int _2673 = int(_2671);
    bool _2675 = !_2645;
    int _2677 = _2675 ? _2649 : (-1);
    int _2679 = _2663 * _2655;
    int _2681 = _2318 + (-1);
    int _2683 = _2288 + (-1);
    int _2685 = _2677 * _2669;
    float _2687 = float(_2428);
    float _2689 = trunc(_2561);
    int _2691 = int(_2689);
    int _2693 = int(_2537) + int(_2643);
    int _2695 = _2555 * _2681;
    int _2697 = _2695 + _2685;
    int _2699 = abs(as_type<int>(_1067));
    int _2701 = _2461 * _2683;
    int _2703 = _2701 + _2679;
    int _2705 = ~_2358;
    int _2707 = _2705 + 1;
    if (_2310)
    {
        float _2709 = _2637 * 3.1415927410125732421875;
        _1139 = _2709;
    }
    float _2711 = _1139;
    bool _2713 = !_2294;
    int _2715 = _2713 ? 0 : 1;
    int _2717 = _2703 * _2699;
    float _2719 = _2711;
    if (_2310)
    {
        float _2721 = _2711 * 0.15915493667125701904296875;
        _2719 = _2721;
    }
    float _2723 = _2719;
    int _2725 = abs(_2715);
    int _2727 = _2673 * _2328;
    int _2729 = _2727 + _2717;
    int _2731 = abs(_1095);
    int _2733 = _2707 * _2693;
    int _2735 = _2733 + _2428;
    float _2737 = as_type<float>(_2707);
    if (_2310)
    {
        float _2739 = _2723 * 6.283185482025146484375;
        float _2741 = sin(_2739);
        _2737 = _2741;
    }
    float _2743 = _2737;
    int _2745 = abs(_1101);
    int _2747 = _2697 * _2731;
    bool _2749 = uint(_2735) >= uint(_2358);
    int _2751 = abs(_1105);
    int _2753 = _2691 * _2745;
    int _2755 = _2753 + _2747;
    float _2757 = float(_2358);
    float _2759 = floor(_2505);
    int _2761 = _2615 * _2332;
    int _2763 = _2761 + _2729;
    bool _2765 = !_2749;
    int _2767 = _2765 ? 0 : (-1);
    int _2769 = _2579 * _2725;
    int _2771 = _2769 + _2763;
    bool _2773 = !_2302;
    int _2775 = _2773 ? 0 : 1;
    int _2777 = ~_2693;
    int _2779 = _2777 + _2767;
    int _2781 = _2779 + 1;
    float _2783 = _2757 * _921;
    float _2785 = float(uint(_2771));
    int _2787 = _2659 * _2751;
    int _2789 = _2787 + _2755;
    bool _2791 = _2687 >= _2757;
    bool _2793 = isnan(_2687);
    bool _2795 = _2791 || _2793;
    bool _2797 = isnan(_2757);
    bool _2799 = _2795 || _2797;
    float _2801 = float(_2799);
    int _2803 = _2358 * _2781;
    int _2805 = _2803 + _2428;
    int _2807 = abs(_2775);
    float _2809 = as_type<float>(_2400) * _2785;
    float _2811 = float(uint(_2615));
    float _2813 = trunc(_2783);
    int _2815 = int(_2813);
    bool _2817 = _2749;
    float _2819 = as_type<float>(_2815);
    if (_2310)
    {
        bool _2821 = _2743 > 0.5;
        _2817 = _2821;
    }
    bool _2823 = _2817;
    int _2825 = _2595 * _2807;
    int _2827 = _2825 + _2789;
    float _2829 = -_2759;
    float _2831 = _2505 + _2829;
    bool _2833 = _2358 == 0;
    float _2835 = as_type<float>(_2400) * _2811;
    int _2837 = ~_2288;
    int _2839 = _2837 + 1;
    float _2841 = _2831 * _2757;
    float _2843 = trunc(_2801);
    int _2845 = int(_2843);
    float _2847 = float(uint(_2827));
    bool _2849 = !_2833;
    int _2851 = _2849 ? _2805 : (-1);
    if (!_2310)
    {
        _2629 = _195;
    }
    float _2853 = _2629;
    float _2855 = as_type<float>(_2430) * _2847;
    float _2857 = _2853;
    if (_2310)
    {
        float _2859 = -_195;
        float _2861 = _2823 ? _2859 : _195;
        _2857 = _2861;
    }
    float _2863 = _2857;
    float _2865 = trunc(_2809);
    float _2867 = precise::max(_2865, 0.0);
    uint _2869 = uint(_2867);
    int _2871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2873 = _2871 != 0;
    int _2875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2877 = _2875 != 0;
    int _2879 = abs(_1733);
    float _2881 = trunc(_2855);
    float _2883 = precise::max(_2881, 0.0);
    uint _2885 = uint(_2883);
    int _2887 = ~_2845;
    int _2889 = _2887 + 1;
    int _2891 = _2889 + 1;
    float _2893 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2895 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2893;
    float _2897 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2899 = _2897 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _2901 = _2851 * _2891;
    int _2903 = _2358 + (-1);
    int _2905 = _2839 * int(_2869);
    int _2907 = _2905 + _2771;
    float _2909 = trunc(_2835);
    float _2911 = precise::max(_2909, 0.0);
    uint _2913 = uint(_2911);
    int _2915 = ~_2318;
    int _2917 = _2915 + 1;
    float _2919 = as_type<float>(_2745);
    float _2921 = as_type<float>(_2869);
    if (_2873)
    {
        float _2923 = in.m_60.x;
        _2919 = _2923;
    }
    float _2925 = _2919;
    int _2927 = _2845 * _2903;
    int _2929 = _2927 + _2901;
    float _2931 = float(uint(_2907));
    float _2933 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2935 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2933;
    bool _2937 = !_2877;
    int _2939 = _2937 ? 0 : 1;
    int _2941 = _2917 * int(_2885);
    int _2943 = _2941 + _2827;
    float _2945 = trunc(_2841);
    int _2947 = int(_2945);
    float _2949 = as_type<float>(_2400) * _2931;
    int _2951 = ~_2288;
    int _2953 = _2951 + 1;
    int _2955 = abs(_2939);
    float _2957 = float(uint(_2943));
    float _2959 = trunc(_2949);
    float _2961 = precise::max(_2959, 0.0);
    uint _2963 = uint(_2961);
    int _2965 = _2953 * int(_2913);
    int _2967 = _2965 + _2615;
    float _2969 = float(uint(_2967));
    int _2971 = _2929 * _2336;
    int _2973 = _2947 * _2955;
    int _2975 = _2973 + _2428;
    float _2977 = as_type<float>(_2430) * _2957;
    float _2979 = as_type<float>(_2400) * _2969;
    float _2981 = float(uint(_2659));
    int _2983 = _2815 * _2879;
    int _2985 = _2983 + _2971;
    float _2987 = trunc(_2977);
    float _2989 = precise::max(_2987, 0.0);
    uint _2991 = uint(_2989);
    int _2993 = ~_2288;
    int _2995 = _2993 + 1;
    if (_2873)
    {
        float _2997 = _2925 * 3.1415927410125732421875;
        _2819 = _2997;
    }
    float _2999 = _2819;
    int _3001 = int(_2869) + int(_2963);
    float _3003 = -_2243;
    float _3005 = _3003 + 1.0;
    int _3007 = abs(_1775);
    float _3009 = as_type<float>(_2430) * _2981;
    if (_2873)
    {
        float _3011 = _2999 * 0.15915493667125701904296875;
        _2921 = _3011;
    }
    float _3013 = _2921;
    float _3015 = trunc(_2979);
    float _3017 = precise::max(_3015, 0.0);
    uint _3019 = uint(_3017);
    int _3021 = _2995 * _3001;
    int _3023 = _3021 + _2771;
    if (!_2873)
    {
        _1003 = _199;
    }
    float _3025 = _1003;
    int _3027 = _2975 * _3007;
    int _3029 = _3027 + _2985;
    int _3031 = ~_2318;
    int _3033 = _3031 + 1;
    bool _3035 = uint(_3023) >= uint(_2288);
    int _3037 = _2947 * _2378;
    int _3039 = _3037 + _3029;
    float _3041 = trunc(_3009);
    float _3043 = precise::max(_3041, 0.0);
    uint _3045 = uint(_3043);
    int _3047 = int(_2885) + int(_2991);
    float _3049 = -_195;
    int _3051 = _1925 ? as_type<int>(_3049) : as_type<int>(_195);
    float _3053 = float(uint(_2975));
    float _3055 = _3013;
    float _3057 = _3025;
    if (_2873)
    {
        float _3059 = _3013 * 6.283185482025146484375;
        float _3061 = sin(_3059);
        _3055 = _3061;
    }
    float _3063 = _3055;
    int _3065 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _3067 = _3065 != 0;
    int _3069 = _3033 * _3047;
    int _3071 = _3069 + _2827;
    int _3073 = ~_2318;
    int _3075 = _3073 + 1;
    float _3077 = as_type<float>(_2465) * _3053;
    bool _3079 = !_3067;
    float _3081 = _3079 ? _195 : as_type<float>(_3051);
    bool _3083 = uint(_3071) >= uint(_2318);
    int _3085 = _3075 * int(_3045);
    int _3087 = _3085 + _2659;
    float _3089 = float(uint(_3039));
    float _3091 = trunc(_3077);
    float _3093 = precise::max(_3091, 0.0);
    uint _3095 = uint(_3093);
    bool _3097 = !_3035;
    int _3099 = _3097 ? 0 : (-1);
    float _3101 = as_type<float>(_2465) * _3089;
    int _3103 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3105 = _3103 != 0;
    float _3107 = float(uint(_3087));
    float _3109 = 1.0 / _2404;
    bool _3111 = !_3083;
    int _3113 = _3111 ? 0 : (-1);
    int _3115 = ~_3001;
    int _3117 = _3115 + _3099;
    int _3119 = _3117 + 1;
    float _3121 = as_type<float>(_2430) * _3107;
    bool _3123 = _3083;
    if (_2873)
    {
        bool _3125 = _3063 > 0.5;
        _3123 = _3125;
    }
    bool _3127 = _3123;
    int _3129 = ~_2358;
    int _3131 = _3129 + 1;
    float _3133 = trunc(_3101);
    float _3135 = precise::max(_3133, 0.0);
    uint _3137 = uint(_3135);
    int _3139 = ~_3047;
    int _3141 = _3139 + _3113;
    int _3143 = _3141 + 1;
    int _3145 = _2288 * _3119;
    int _3147 = _3145 + _2771;
    float _3149 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _3151 = _3149 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    if (_2873)
    {
        float _3153 = -_199;
        float _3155 = _3127 ? _3153 : _199;
        _3057 = _3155;
    }
    float _3157 = _3057;
    int _3159 = _2318 * _3143;
    int _3161 = _3159 + _2827;
    bool _3163 = !_2585;
    int _3165 = _3163 ? _3147 : (-1);
    int _3167 = _3131 * int(_3095);
    int _3169 = _3167 + _2975;
    int _3171 = int(_2913) + int(_3019);
    float _3173 = trunc(_3121);
    float _3175 = precise::max(_3173, 0.0);
    uint _3177 = uint(_3175);
    float _3179 = -_199;
    int _3181 = _2380 ? as_type<int>(_3179) : as_type<int>(_199);
    float _3183 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3185 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _3183;
    float _3187 = float(uint(_3169));
    int _3189 = _3165 & 3;
    bool _3191 = _3189 != 0;
    int _3193 = _3131 * int(_3137);
    int _3195 = _3193 + _3039;
    int _3197 = ~_2288;
    int _3199 = _3197 + 1;
    float _3201 = as_type<float>(_2465) * _3187;
    bool _3203 = uint(_3189) > 1u;
    float _3205 = 1.0 / _2410;
    float _3207 = float(uint(_3195));
    int _3209 = _3199 * _3171;
    int _3211 = _3209 + _2615;
    int _3213 = _3165 & 3;
    bool _3215 = _3213 != 0;
    bool _3217 = !_3105;
    float _3219 = _3217 ? _199 : as_type<float>(_3181);
    float _3221 = as_type<float>(_2465) * _3207;
    bool _3223 = !_2645;
    int _3225 = _3223 ? _3161 : (-1);
    float _3227 = trunc(_3201);
    float _3229 = precise::max(_3227, 0.0);
    uint _3231 = uint(_3229);
    int _3233 = _3215 ? 0 : 1;
    int _3235 = _3225 & 3;
    bool _3237 = _3235 != 0;
    bool _3239 = uint(_3211) >= uint(_2288);
    int _3241 = ~_3233;
    int _3243 = _3241 + 1;
    int _3245 = _3243 + 1;
    float _3247 = trunc(_3221);
    float _3249 = precise::max(_3247, 0.0);
    uint _3251 = uint(_3249);
    int _3253 = _3245;
    if (!_3203)
    {
        int _3255 = ~_3233;
        int _3257 = _3255 + 1;
        _3253 = _3257;
    }
    int _3259 = _3253;
    bool _3261 = uint(_3235) > 1u;
    bool _3263 = !_3239;
    int _3265 = _3263 ? 0 : (-1);
    int _3267 = _3225 & 3;
    bool _3269 = _3267 != 0;
    float _3271 = exp2(_2330);
    int _3273 = _3269 ? 0 : 1;
    int _3275 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3277 = _3275 != 0;
    int _3279 = ~_2318;
    int _3281 = _3279 + 1;
    int _3283 = int(_3045) + int(_3177);
    int _3285 = int(_3137) + int(_3251);
    bool _3287 = !_3237;
    int _3289 = _3287 ? 0 : 1;
    int _3291 = ~_2358;
    int _3293 = _3291 + 1;
    float _3295 = -_3271;
    float _3297 = _3295 + 1.0;
    bool _3299 = _3235 != 3;
    int _3301 = ~_3273;
    int _3303 = _3301 + 1;
    int _3305 = _3303 + 1;
    float _3307 = _3297 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _3309 = _3305;
    if (!_3261)
    {
        int _3311 = ~_3273;
        int _3313 = _3311 + 1;
        _3309 = _3313;
    }
    int _3315 = _3309;
    int _3317 = _3281 * _3283;
    int _3319 = _3317 + _2659;
    bool _3321 = uint(_3235) >= 2u;
    float _3323 = _3307 * _2255;
    float _3325 = -_3307;
    float _3327 = _3325 + 1.0;
    int _3329 = _3321 ? 0 : 1;
    int _3331 = _3293 * _3285;
    int _3333 = _3331 + _3039;
    bool _3335 = uint(_3319) >= uint(_2318);
    int _3337 = int(_3095) + int(_3231);
    float _3339 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3341 = _3339 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _3343 = ~_3329;
    int _3345 = _3343 + 1;
    int _3347 = _3345 + 1;
    int _3349 = ~_2358;
    int _3351 = _3349 + 1;
    float _3353 = 1.0 / _3341;
    int _3355 = _3347;
    if (_3299)
    {
        int _3357 = ~_3329;
        int _3359 = _3357 + 1;
        _3355 = _3359;
    }
    int _3361 = _3355;
    int _3363 = _3351 * _3337;
    int _3365 = _3363 + _2975;
    bool _3367 = uint(_3333) >= uint(_2358);
    bool _3369 = !_3335;
    int _3371 = _3369 ? 0 : (-1);
    float _3373 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3375 = _3373 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3377 = !_3367;
    int _3379 = _3377 ? 0 : (-1);
    bool _3381 = _809 > 0.5;
    float _3383 = 1.0 / _3375;
    bool _3385 = uint(_3365) >= uint(_2358);
    float _3387 = _2899 * _3353;
    bool _3389 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _3391 = isnan(_681);
    bool _3393 = _3389 || _3391;
    bool _3395 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _3397 = _3393 || _3395;
    float _3399 = float(_3397);
    float _3401 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3403 = _3401 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3405 = !_3385;
    int _3407 = _3405 ? 0 : (-1);
    bool _3409 = _3235 != 3;
    float _3411 = 1.0 / _3403;
    float _3413 = -_195;
    int _3415 = _3381 ? as_type<int>(_3413) : as_type<int>(_195);
    bool _3417 = !_3409;
    int _3419 = _3417 ? 0 : (-1);
    bool _3421 = !_3277;
    float _3423 = _3421 ? _195 : as_type<float>(_3415);
    float _3425 = _2895 * _3383;
    int _3427 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3429 = _3427 != 0;
    int _3431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3433 = _3431 != 0;
    float _3435 = -_3399;
    float _3437 = _3435 + 1.0;
    int _3439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _3441 = _3439 != 0;
    bool _3443 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _3445 = isnan(_681);
    bool _3447 = _3443 || _3445;
    bool _3449 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _3451 = _3447 || _3449;
    float _3453 = float(_3451);
    bool _3455 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _3457 = isnan(_681);
    bool _3459 = _3455 || _3457;
    bool _3461 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _3463 = _3459 || _3461;
    float _3465 = float(_3463);
    float _3467 = _2935 * _3411;
    float _3469 = -_3453;
    float _3471 = _3469 + 1.0;
    float _3473 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3475 = _3473 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3477 = _3465 * _3437;
    float _3479 = -_3465;
    float _3481 = _3479 + 1.0;
    float _3483 = _3399 * _3471;
    bool _3485 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3487 = isnan(_681);
    bool _3489 = _3485 || _3487;
    bool _3491 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _3493 = _3489 || _3491;
    float _3495 = float(_3493);
    float _3497 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3499 = _3497 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3501 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3503 = isnan(_681);
    bool _3505 = _3501 || _3503;
    bool _3507 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _3509 = _3505 || _3507;
    float _3511 = float(_3509);
    float _3513 = 1.0 / _3475;
    bool _3515 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _3517 = isnan(_681);
    bool _3519 = _3515 || _3517;
    bool _3521 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _3523 = _3519 || _3521;
    float _3525 = float(_3523);
    float _3527 = _3495 * _3481;
    float _3529 = -_3495;
    float _3531 = _3529 + 1.0;
    float _3533 = -_3511;
    float _3535 = _3533 + 1.0;
    int _3537 = ~_3285;
    int _3539 = _3537 + _3379;
    int _3541 = _3539 + 1;
    float _3543 = -_3525;
    float _3545 = _3543 + 1.0;
    float _3547 = _3511 * _3531;
    float _3549 = 1.0 / _3499;
    float _3551 = _3525 * _3535;
    float _3553 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3555 = _681 + _3553;
    bool _3557 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _3559 = isnan(_681);
    bool _3561 = _3557 || _3559;
    bool _3563 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _3565 = _3561 || _3563;
    float _3567 = float(_3565);
    float _3569 = _2392 * _3545;
    float _3571 = -_2392;
    float _3573 = _3571 + 1.0;
    float _3575 = fma(_3425, _3555, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _3577 = _2358 * _3541;
    int _3579 = _3577 + _3039;
    float _3581 = _3185 * _3513;
    float _3583 = _3567 * _3573;
    int _3585 = ~_3283;
    int _3587 = _3585 + _3371;
    int _3589 = _3587 + 1;
    float _3591 = _3575 * _3583;
    float _3593 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3595 = _681 + _3593;
    float _3597 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3599 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _3597;
    float _3601 = -_3567;
    float _3603 = _3601 + 1.0;
    float _3605 = _3151 * _3549;
    float _3607 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _3609 = _3607 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3611 = fma(_3387, _3595, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _3613 = fma(_3603, (*spvDescriptorSet0.vp_c9)._m0[159].x, _3591);
    float _3615 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3617 = _681 + _3615;
    float _3619 = abs(_1787);
    float _3621 = log2(_3619);
    float _3623 = _3609 * _3109;
    float _3625 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3627 = _681 + _3625;
    float _3629 = fma(_3467, _3617, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _3631 = fma(_3611, _3569, _3613);
    float _3633 = _3599 * _3205;
    float _3635 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3637 = _681 + _3635;
    float _3639 = fma(_3605, _3627, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _3641 = fma(_3629, _3551, _3631);
    float _3643 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3645 = _681 + _3643;
    float _3647 = fma(_3581, _3637, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _3649 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3651 = _681 + _3649;
    float _3653 = fma(_3639, _3547, _3641);
    float _3655 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3657 = fma(_3623, _3645, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _3659 = _2863 + 0.5;
    float _3661 = _3621 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3663 = fma(_3647, _3527, _3653);
    float _3665 = _3157 + (-0.5);
    float _3667 = fma(_3633, _3651, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _3669 = fma(_3659, (*spvDescriptorSet0.vp_c9)._m0[95].x, _955);
    float _3671 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3673 = fma(_3657, _3477, _3663);
    float _3675 = _3423 + 0.5;
    float _3677 = -_923;
    float _3679 = _3677 + 1.0;
    float _3681 = -_3665;
    float _3683 = -_1331;
    float _3685 = fma(_3681, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3683);
    float _3687 = _3219 + (-0.5);
    float _3689 = fma(_3675, (*spvDescriptorSet0.vp_c9)._m0[80].x, _941);
    int _3691 = _3225 >> 31;
    float _3693 = exp2(_3661);
    float _3695 = -_3679;
    float _3697 = fma(_3695, _2863, _3669);
    float _3699 = fma(_2298, _3157, _3685);
    float _3701 = -_3687;
    float _3703 = -_1321;
    float _3705 = fma(_3701, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3703);
    float _3707 = _3655 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3709 = _3081 + 0.5;
    int _3711 = _3691 & 3;
    out.m_76.x = _3697;
    out.m_76.y = _3699;
    float _3713 = fma(_3707, _3709, _1179);
    int _3715 = _3225 + _3711;
    float _3717 = _3671 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3719 = _1687 + (-0.5);
    float _3721 = -_2314;
    float _3723 = fma(_3081, _3721, _3713);
    float _3725 = _1473 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3727 = fma(_3693, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3729 = precise::clamp(_3727, 0.0, 1.0);
    int _3731 = _3715 >> 2;
    float _3733 = -_3717;
    float _3735 = -_1203;
    float _3737 = fma(_3733, _3719, _3735);
    float _3739 = -_1311;
    float _3741 = _3739 + 1.0;
    float _3743 = fma(_3729, -2.0, 3.0);
    float _3745 = _3729 * _3729;
    int _3747 = _3731 << 4;
    int _3749 = _3747 + 656;
    float _3751 = -_2306;
    float _3753 = fma(_3423, _3751, _3689);
    float _3755 = fma(_3219, _3741, _3705);
    float _3757 = _3745 * _3743;
    uint _3759 = uint(int(uint(_3749) >> uint(2)));
    uint _3761 = uint(int(uint(int(_3759)) >> uint(2)));
    int _3763 = int(_3759) & 3;
    float _3765 = (*spvDescriptorSet0.vp_c9)._m0[int(_3761)][_3763];
    int _3767 = int(_3759) + 1;
    uint _3769 = uint(int(uint(_3767) >> uint(2)));
    int _3771 = _3767 & 3;
    float _3773 = (*spvDescriptorSet0.vp_c9)._m0[int(_3769)][_3771];
    float _3775 = fma(_1687, _2326, _3737);
    float _3777 = _1473 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3779 = -_3757;
    float _3781 = _3779 + 1.0;
    float _3783 = _1473 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3785 = -_1463;
    float _3787 = fma(_3785, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3725);
    float _3789 = -_1463;
    float _3791 = fma(_3789, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3777);
    float _3793 = fma(_3781, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3757);
    out.m_78.x = _3753;
    out.m_78.y = _3755;
    out.m_78.z = _3723;
    out.m_78.w = _3775;
    int _3795 = _3749 + 8;
    uint _3797 = uint(int(uint(_3795) >> uint(2)));
    uint _3799 = uint(int(uint(int(_3797)) >> uint(2)));
    int _3801 = int(_3797) & 3;
    float _3803 = (*spvDescriptorSet0.vp_c9)._m0[int(_3799)][_3801];
    int _3805 = int(_3797) + 1;
    uint _3807 = uint(int(uint(_3805) >> uint(2)));
    int _3809 = _3805 & 3;
    float _3811 = (*spvDescriptorSet0.vp_c9)._m0[int(_3807)][_3809];
    float _3813 = -_1463;
    float _3815 = fma(_3813, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3783);
    float _3817 = _1489 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3819 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3791);
    bool _3821 = _1787 <= 8000.0;
    bool _3823 = isnan(_1787);
    bool _3825 = _3821 || _3823;
    bool _3827 = isnan(8000.0);
    bool _3829 = _3825 || _3827;
    float _3831 = float(_3829);
    float _3833 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3835 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3817);
    int _3837 = _2318 * _3589;
    int _3839 = _3837 + _2659;
    int _3841 = ~_3337;
    int _3843 = _3841 + _3407;
    int _3845 = _3843 + 1;
    float _3847 = _3831 * _3793;
    int _3849 = ~_3171;
    int _3851 = _3849 + _3265;
    int _3853 = _3851 + 1;
    float _3855 = fma(_3667, _3483, _3673);
    bool _3857 = !_2645;
    int _3859 = _3857 ? _3839 : (-1);
    float _3861 = _1489 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3863 = _1489 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3865 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3787);
    float _3867 = _1497 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3869 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3815);
    float _3871 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3861);
    float _3873 = _1497 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3875 = abs(_3315);
    float _3877 = _1497 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3879 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3867);
    float _3881 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3873);
    int _3883 = ~_3875;
    int _3885 = _3883 + 1;
    int _3887 = _3885 + 1;
    float _3889 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3877);
    float _3891 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3879);
    float _3893 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3863);
    int _3895 = abs(_3289);
    float _3897 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3881);
    bool _3899 = !_3433;
    int _3901 = _3899 ? 0 : 1;
    float _3903 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3889);
    bool _3905 = uint(_3189) >= 2u;
    float _3907 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3909 = int(_3907);
    int _3911 = ~_3895;
    int _3913 = _3911 + 1;
    int _3915 = _3913 + 1;
    int _3917 = _2358 * _3845;
    int _3919 = _3917 + _2975;
    int _3921 = _3905 ? 0 : 1;
    int _3923 = _2288 * _3853;
    int _3925 = _3923 + _2615;
    int _3927 = abs(_3901);
    int _3929 = _3887 * as_type<int>(_3773);
    int _3931 = abs(_3361);
    float _3933 = _3847 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _3935 = _3189 != 3;
    int _3937 = _3915 * as_type<int>(_3765);
    int _3939 = _3937 + _3929;
    int _3941 = abs(_3419);
    float _3943 = _3005 * _3933;
    float _3945 = precise::clamp(_3943, 0.0, 1.0);
    int _3947 = ~_3931;
    int _3949 = _3947 + 1;
    int _3951 = _3949 + 1;
    float _3953 = _2276 * _3323;
    int _3955 = ~_3941;
    int _3957 = _3955 + 1;
    int _3959 = _3957 + 1;
    float _3961 = fma(_3453, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3855);
    int _3963 = _3165 >> 31;
    int _3965 = _3951 * as_type<int>(_3803);
    int _3967 = _3965 + _3939;
    int _3969 = ~_3927;
    int _3971 = _3969 + 1;
    int _3973 = _3971 + 1;
    int _3975 = _3963 & 3;
    int _3977 = _3959 * as_type<int>(_3811);
    int _3979 = _3977 + _3967;
    int _3981 = ~_3921;
    int _3983 = _3981 + 1;
    int _3985 = _3983 + 1;
    float _3987 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3989 = _3985;
    float _3991 = _3897;
    if (_3935)
    {
        int _3993 = ~_3921;
        int _3995 = _3993 + 1;
        _3989 = _3995;
    }
    int _3997 = _3989;
    int _3999 = _3979 * _3973;
    int _4001 = _3165 + _3975;
    float _4003 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3893);
    int _4005 = abs(_3909);
    float _4007 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3871);
    bool _4009 = !_2833;
    int _4011 = _4009 ? _3579 : (-1);
    float _4013 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3835);
    float _4015 = float(uint(_3909));
    float _4017 = _3987 * _3819;
    int _4019 = _4001 >> 2;
    int _4021 = _3859 * _3927;
    int _4023 = _4021 + _3999;
    float _4025 = float(uint(_4005));
    float _4027 = 1.0 / _4015;
    int _4029 = _4011 >> 31;
    out.m_80.x = _4003;
    out.m_80.y = _4007;
    out.m_80.z = _4013;
    int _4031 = _4019 << 4;
    int _4033 = _4031 + 368;
    float _4035 = fma(_3833, _4003, _4017);
    int _4037 = _4011 & 3;
    bool _4039 = _4037 != 0;
    float _4041 = _3987 * _3865;
    int _4043 = _4011 & 3;
    bool _4045 = _4043 != 0;
    float _4047 = 1.0 / _4025;
    int _4049 = _4029 & 3;
    uint _4051 = uint(int(uint(_4033) >> uint(2)));
    uint _4053 = uint(int(uint(int(_4051)) >> uint(2)));
    int _4055 = int(_4051) & 3;
    float _4057 = (*spvDescriptorSet0.vp_c9)._m0[int(_4053)][_4055];
    int _4059 = int(_4051) + 1;
    uint _4061 = uint(int(uint(_4059) >> uint(2)));
    int _4063 = _4059 & 3;
    float _4065 = (*spvDescriptorSet0.vp_c9)._m0[int(_4061)][_4063];
    int _4067 = _4039 ? 0 : 1;
    float _4069 = fma(_3833, _4007, _4041);
    bool _4071 = uint(_4043) > 1u;
    float _4073 = _3987 * _3869;
    int _4075 = _4011 + _4049;
    out.m_82.x = _3961;
    int _4077 = as_type<int>(_4027) + (-2);
    float _4079 = fma(_3833, _4013, _4073);
    int _4081 = _4075 >> 2;
    int _4083 = abs(_4023);
    int _4085 = _4081 << 4;
    int _4087 = _4085 + 800;
    int _4089 = ~_4067;
    int _4091 = _4089 + 1;
    int _4093 = _4091 + 1;
    float _4095 = float(uint(_4023));
    uint _4097 = uint(int(uint(_4087) >> uint(2)));
    uint _4099 = uint(int(uint(int(_4097)) >> uint(2)));
    int _4101 = int(_4097) & 3;
    float _4103 = (*spvDescriptorSet0.vp_c9)._m0[int(_4099)][_4101];
    int _4105 = int(_4097) + 1;
    uint _4107 = uint(int(uint(_4105) >> uint(2)));
    int _4109 = _4105 & 3;
    float _4111 = (*spvDescriptorSet0.vp_c9)._m0[int(_4107)][_4109];
    int _4113 = _4093;
    if (!_4071)
    {
        int _4115 = ~_4067;
        int _4117 = _4115 + 1;
        _4113 = _4117;
    }
    int _4119 = _4113;
    int _4121 = as_type<int>(_4047) + (-2);
    float _4123 = as_type<float>(_4077) * _4095;
    float _4125 = float(uint(_4083));
    int _4127 = ~_3909;
    int _4129 = _4127 + 1;
    int _4131 = _4033 + 8;
    uint _4133 = uint(int(uint(_4131) >> uint(2)));
    uint _4135 = uint(int(uint(int(_4133)) >> uint(2)));
    int _4137 = int(_4133) & 3;
    float _4139 = (*spvDescriptorSet0.vp_c9)._m0[int(_4135)][_4137];
    int _4141 = int(_4133) + 1;
    uint _4143 = uint(int(uint(_4141) >> uint(2)));
    int _4145 = _4141 & 3;
    float _4147 = (*spvDescriptorSet0.vp_c9)._m0[int(_4143)][_4145];
    bool _4149 = _4043 != 3;
    float _4151 = as_type<float>(_4121) * _4125;
    float _4153 = trunc(_4123);
    float _4155 = precise::max(_4153, 0.0);
    uint _4157 = uint(_4155);
    bool _4159 = !_3191;
    int _4161 = _4159 ? 0 : 1;
    bool _4163 = uint(_4043) >= 2u;
    int _4165 = _4087 + 8;
    uint _4167 = uint(int(uint(_4165) >> uint(2)));
    uint _4169 = uint(int(uint(int(_4167)) >> uint(2)));
    int _4171 = int(_4167) & 3;
    float _4173 = (*spvDescriptorSet0.vp_c9)._m0[int(_4169)][_4171];
    int _4175 = int(_4167) + 1;
    uint _4177 = uint(int(uint(_4175) >> uint(2)));
    int _4179 = _4175 & 3;
    float _4181 = (*spvDescriptorSet0.vp_c9)._m0[int(_4177)][_4179];
    float _4183 = trunc(_4151);
    float _4185 = precise::max(_4183, 0.0);
    uint _4187 = uint(_4185);
    int _4189 = abs(_3259);
    float _4191 = fma(_3987, _3987, 1.0);
    int _4193 = _4163 ? 0 : 1;
    bool _4195 = _3189 != 3;
    int _4197 = ~_4189;
    int _4199 = _4197 + 1;
    int _4201 = _4199 + 1;
    int _4203 = _4129 * int(_4157);
    int _4205 = _4203 + _4023;
    int _4207 = ~_4005;
    int _4209 = _4207 + 1;
    float _4211 = rsqrt(_4191);
    int _4213 = ~_4193;
    int _4215 = _4213 + 1;
    int _4217 = _4215 + 1;
    int _4219 = _4201 * as_type<int>(_4065);
    int _4221 = _4217;
    if (_4149)
    {
        int _4223 = ~_4193;
        int _4225 = _4223 + 1;
        _4221 = _4225;
    }
    int _4227 = _4221;
    float _4229 = float(uint(_4205));
    int _4231 = _4209 * int(_4187);
    int _4233 = _4231 + _4083;
    bool _4235 = !_4045;
    int _4237 = _4235 ? 0 : 1;
    int _4239 = abs(_4161);
    float _4241 = as_type<float>(_4077) * _4229;
    float _4243 = float(uint(_4233));
    int _4245 = abs(_4237);
    int _4247 = abs(_4119);
    float _4249 = as_type<float>(_4121) * _4243;
    float _4251 = trunc(_4241);
    float _4253 = precise::max(_4251, 0.0);
    uint _4255 = uint(_4253);
    float _4257 = _3987 * _4211;
    int _4259 = ~_4239;
    int _4261 = _4259 + 1;
    int _4263 = _4261 + 1;
    int _4265 = abs(_3997);
    float _4267 = trunc(_4249);
    float _4269 = precise::max(_4267, 0.0);
    uint _4271 = uint(_4269);
    int _4273 = abs(_4227);
    int _4275 = _4263 * as_type<int>(_4057);
    int _4277 = _4275 + _4219;
    int _4279 = ~_4247;
    int _4281 = _4279 + 1;
    int _4283 = _4281 + 1;
    int _4285 = ~_4245;
    int _4287 = _4285 + 1;
    int _4289 = _4287 + 1;
    int _4291 = _4283 * as_type<int>(_4111);
    int _4293 = ~_4273;
    int _4295 = _4293 + 1;
    int _4297 = _4295 + 1;
    int _4299 = ~_4265;
    int _4301 = _4299 + 1;
    int _4303 = _4301 + 1;
    int _4305 = _4289 * as_type<int>(_4103);
    int _4307 = _4305 + _4291;
    bool _4309 = _4043 != 3;
    int _4311 = int(_4157) + int(_4255);
    int _4313 = _4297 * as_type<int>(_4173);
    int _4315 = _4313 + _4307;
    float _4317 = -_3891;
    float _4319 = _4257 * _4317;
    int _4321 = ~_3909;
    int _4323 = _4321 + 1;
    int _4325 = _4303 * as_type<int>(_4139);
    int _4327 = _4325 + _4277;
    bool _4329 = !_4195;
    int _4331 = _4329 ? 0 : (-1);
    float _4333 = fma(_4211, _3819, _4319);
    float _4335 = -_3897;
    float _4337 = _4257 * _4335;
    float _4339 = _3891 + _4035;
    bool _4341 = !_4309;
    int _4343 = _4341 ? 0 : (-1);
    float _4345 = fma(_4211, _3865, _4337);
    int _4347 = abs(_4331);
    float _4349 = -_3903;
    float _4351 = _4257 * _4349;
    int _4353 = abs(_4343);
    int _4355 = ~_4005;
    int _4357 = _4355 + 1;
    float _4359 = fma(_4211, _3869, _4351);
    int _4361 = _4323 * _4311;
    int _4363 = _4361 + _4023;
    int _4365 = int(_4187) + int(_4271);
    out.m_84.x = _4333;
    out.m_84.y = _4345;
    out.m_84.z = _4359;
    int _4367 = ~_4347;
    int _4369 = _4367 + 1;
    int _4371 = _4369 + 1;
    bool _4373 = uint(_4363) >= uint(_3909);
    int _4375 = _4357 * _4365;
    int _4377 = _4375 + _4083;
    int _4379 = ~_4353;
    int _4381 = _4379 + 1;
    int _4383 = _4381 + 1;
    int _4385 = _4371 * as_type<int>(_4147);
    int _4387 = _4385 + _4327;
    bool _4389 = !_3429;
    int _4391 = _4389 ? 0 : 1;
    bool _4393 = !_4373;
    int _4395 = _4393 ? 0 : (-1);
    int _4397 = _4383 * as_type<int>(_4181);
    int _4399 = _4397 + _4315;
    int _4401 = _4023 ^ _3909;
    bool _4403 = uint(_4377) >= uint(_4005);
    int _4405 = abs(_4391);
    float _4407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    uint _4409 = uint(int(uint(_4401) >> uint(31)));
    int _4411 = ~_4311;
    int _4413 = _4411 + _4395;
    int _4415 = _4413 + 1;
    bool _4417 = !_4403;
    int _4419 = _4417 ? 0 : (-1);
    bool _4421 = !_3441;
    int _4423 = _4421 ? 0 : 1;
    int _4425 = _3909 * _4415;
    int _4427 = _4425 + _4023;
    int _4429 = ~_4405;
    int _4431 = _4429 + 1;
    int _4433 = _4431 + 1;
    int _4435 = ~_4419;
    int _4437 = _4365 + _4435;
    int _4439 = _4437 + 1;
    int _4441 = ~int(_4409);
    int _4443 = _4441 + 1;
    int _4445 = _4387 * _4433;
    bool _4447 = _3909 == 0;
    float _4449 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _4451 = _3909 == 0;
    int _4453 = abs(_4423);
    int _4455 = _4439 ^ _4443;
    bool _4457 = !_4447;
    int _4459 = _4457 ? _4427 : (-1);
    int _4461 = ~_4453;
    int _4463 = _4461 + 1;
    int _4465 = _4463 + 1;
    int _4467 = ~_4443;
    int _4469 = _4467 + _4455;
    int _4471 = _4469 + 1;
    float _4473 = float(_4459);
    float _4475 = _4407 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _4477 = _4399 * _4465;
    bool _4479 = !_2585;
    int _4481 = _4479 ? _3925 : (-1);
    float _4483 = _1041 + 0.5;
    bool _4485 = !_4451;
    int _4487 = _4485 ? _4471 : (-1);
    float _4489 = fma(_4475, _4473, _1337);
    bool _4491 = !_2833;
    int _4493 = _4491 ? _3919 : (-1);
    int _4495 = _4481 * _4405;
    int _4497 = _4495 + _4445;
    float _4499 = float(_4487);
    float _4501 = _4449 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _4503 = in.m_86.x;
    float _4505 = fma(_4475, _4483, _4489);
    float _4507 = _919 + (-0.5);
    float _4509 = -_1339;
    float _4511 = fma(_4501, _4499, _4509);
    float _4513 = _2193 * 0.5;
    int _4515 = _4493 * _4453;
    int _4517 = _4515 + _4477;
    float _4519 = _3897 + _4069;
    float _4521 = -_4501;
    float _4523 = fma(_4521, _4507, _4511);
    float _4525 = -_2354;
    float _4527 = fma(_1041, _4525, _4505);
    float _4529 = float(_4497);
    float _4531 = -_1315;
    float _4533 = _4531 + 1.0;
    float _4535 = _2370 + _2193;
    float _4537 = _2221 + _2193;
    out.m_88.x = _4529;
    float _4539 = _4535 * 0.5;
    float _4541 = _4537 * 0.5;
    float _4543 = fma(_2227, -0.5, _4513);
    float _4545 = float(_4517);
    float _4547 = _3903 + _4079;
    out.m_90.x = _2280;
    out.m_90.y = _2282;
    out.m_90.z = _2284;
    bool _4549 = _1937 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4551 = isnan(_1937);
    bool _4553 = _4549 || _4551;
    bool _4555 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4557 = _4553 || _4555;
    float _4559 = fma(_919, _4533, _4523);
    out.m_92.x = _4541;
    out.m_92.y = _4543;
    out.m_92.z = _4539;
    out.m_92.w = _2193;
    float _4561 = _1911 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4563 = -_3945;
    float _4565 = fma(_4563, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_88.w = _4545;
    float _4567 = _4565 * _4503;
    out.m_94.x = _4339;
    out.m_94.y = _4519;
    out.m_94.z = _4547;
    float _4569 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _4571 = _4559;
    float _4573 = _4527;
    if (!_4557)
    {
        _2631 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4575 = _2631;
    float _4577 = _4567 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_96.x = _4527;
    out.m_96.y = _4559;
    float _4579 = _2266 * _3323;
    float _4581 = _2266 * _3327;
    float _4583 = fma(_2266, _3953, _2264);
    out.m_98.x = _4577;
    float _4585 = fma(_2272, _4579, _2260);
    float _4587 = fma(_2274, _4579, _2262);
    float _4589 = _4575;
    float _4591 = _4575;
    if (!_4557)
    {
        _2633 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4593 = _2633;
    float _4595 = _4593;
    float _4597 = _4593;
    if (!_4557)
    {
        _3991 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4599 = _3991;
    out.m_100.x = _4585;
    out.m_100.y = _4587;
    out.m_100.z = _4583;
    out.m_100.w = _4581;
    float _4601 = _4599;
    float _4603 = _4599;
    if (!_4557)
    {
        _4569 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4605 = _4569;
    float _4607 = _4605;
    float _4609 = _4605;
    if (!_4557)
    {
        _4571 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4611 = _4571;
    float _4613 = _4611;
    float _4615 = _4611;
    if (!_4557)
    {
        _4573 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4617 = _4573;
    bool _4619 = !_4557;
    float _4621 = _4617;
    float _4623 = _4617;
    if (!_4619)
    {
        bool _4625 = _1937 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4627 = isnan(_1937);
        bool _4629 = _4625 || _4627;
        bool _4631 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4633 = _4629 || _4631;
        if (!_4633)
        {
            float _4635 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4637 = _1937 + _4635;
            float _4639 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4641 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4639;
            float _4643 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4645 = _4643 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4647 = 1.0 / _4641;
            float _4649 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4651 = _4649 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4653 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4655 = _4653 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4657 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4659 = _4657 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4661 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4663 = _4661 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4665 = _4637 * _4647;
            float _4667 = precise::clamp(_4665, 0.0, 1.0);
            float _4669 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4671 = _4669 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4673 = fma(_4667, _4645, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4675 = fma(_4667, _4671, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4677 = fma(_4667, _4651, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4679 = fma(_4667, _4655, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4681 = fma(_4667, _4659, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4683 = fma(_4667, _4663, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4597 = _4677;
            _4615 = _4681;
            _4591 = _4673;
            _4609 = _4679;
            _4603 = _4675;
            _4623 = _4683;
            _4685 = true;
        }
        else
        {
            bool _4687 = _1937 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4689 = isnan(_1937);
            bool _4691 = _4687 || _4689;
            bool _4693 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4695 = _4691 || _4693;
            if (!_4695)
            {
                _4589 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4697 = _4589;
            _4591 = _4697;
            if (!_4695)
            {
                _4595 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4699 = _4595;
            _4597 = _4699;
            if (!_4695)
            {
                _4601 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4701 = _4601;
            _4603 = _4701;
            if (!_4695)
            {
                _4607 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4703 = _4607;
            _4609 = _4703;
            if (!_4695)
            {
                _4613 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4705 = _4613;
            _4615 = _4705;
            if (!_4695)
            {
                _4621 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4707 = _4621;
            bool _4709 = !_4695;
            _4623 = _4707;
            if (!_4709)
            {
                bool _4711 = _1937 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4713 = isnan(_1937);
                bool _4715 = _4711 || _4713;
                bool _4717 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4719 = _4715 || _4717;
                if (!_4719)
                {
                    float _4721 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4723 = _1937 + _4721;
                    float _4725 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4727 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4725;
                    float _4729 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4731 = _4729 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4733 = 1.0 / _4727;
                    float _4735 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4737 = _4735 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4739 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4741 = _4739 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4743 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4745 = _4743 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4747 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4749 = _4747 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4751 = _4723 * _4733;
                    float _4753 = precise::clamp(_4751, 0.0, 1.0);
                    float _4755 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4757 = _4755 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4759 = fma(_4753, _4731, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4761 = fma(_4753, _4757, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4763 = fma(_4753, _4737, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4765 = fma(_4753, _4741, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4767 = fma(_4753, _4745, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4769 = fma(_4753, _4749, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4597 = _4763;
                    _4615 = _4767;
                    _4591 = _4759;
                    _4609 = _4765;
                    _4603 = _4761;
                    _4623 = _4769;
                    _4685 = true;
                }
                else
                {
                    _4597 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4615 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4591 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4609 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4603 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4623 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4685 = false;
    float _4771 = _4597;
    float _4773 = _4615;
    float _4775 = _4591;
    float _4777 = _4609;
    float _4779 = _4603;
    float _4781 = _4623;
    float _4783 = _4561 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4785 = fma(_4519, -0.5, 0.5);
    float _4787 = precise::clamp(_4785, 0.0, 1.0);
    float _4789 = -_4771;
    float _4791 = _4789 + _4773;
    float _4793 = -_4775;
    float _4795 = _4793 + _4777;
    out.m_102.x = 0.0;
    float _4797 = fma(_4787, _4791, _4771);
    float _4799 = -_4779;
    float _4801 = _4799 + _4781;
    float _4803 = fma(_4787, _4795, _4775);
    float _4805 = _4797 * 0.586610972881317138671875;
    bool _4807 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4809 = fma(_4787, _4801, _4779);
    out.m_55.x = _4783;
    float _4811 = fma(_4803, 0.298911988735198974609375, _4805);
    bool _4813 = _1911 > 0.0;
    bool _4815 = isnan(_1911);
    bool _4817 = _4813 || _4815;
    bool _4819 = isnan(0.0);
    bool _4821 = _4817 || _4819;
    float _4823 = fma(_4809, 0.114477999508380889892578125, _4811);
    float _4825 = -_4823;
    float _4827 = _4803 + _4825;
    float _4829 = -_4823;
    float _4831 = _4797 + _4829;
    float _4833 = -_4823;
    float _4835 = _4809 + _4833;
    float _4837 = fma(_4827, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4823);
    float _4839 = fma(_4831, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4823);
    float _4841 = fma(_4835, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4823);
    bool _4843 = !_4807;
    if (!_4843)
    {
        float _4845 = -_1849;
        float _4847 = _4845 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4849 = -_1851;
        float _4851 = _4849 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4853 = -_1853;
        float _4855 = _4853 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4857 = _4847 * _4847;
        float _4859 = fma(_4851, _4851, _4857);
        float _4861 = fma(_4855, _4855, _4859);
        float _4863 = sqrt(_4861);
        float _4865 = rsqrt(_4861);
        float _4867 = -_4863;
        float _4869 = _4867 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4871 = _4869 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4873 = precise::clamp(_4871, 0.0, 1.0);
        float _4875 = _4851 * _4865;
        float _4877 = _4847 * _4865;
        float _4879 = abs(_4873);
        float _4881 = log2(_4879);
        float _4883 = _4855 * _4865;
        float _4885 = _4875 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4887 = _4519 * _4877;
        float _4889 = -_4877;
        float _4891 = -_4885;
        float _4893 = fma(_4889, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4891);
        float _4895 = fma(_4339, _4875, _4887);
        float _4897 = -_4883;
        float _4899 = fma(_4897, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4893);
        float _4901 = fma(_4547, _4883, _4895);
        float _4903 = precise::clamp(_4901, 0.0, 1.0);
        float _4905 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4907 = _4899 + _4905;
        float _4909 = _4881 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4911 = _4907 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4913 = precise::clamp(_4911, 0.0, 1.0);
        float _4915 = exp2(_4909);
        float _4917 = _4915 * _4913;
        float _4919 = _4903 * _4917;
        float _4921 = _4919 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4923 = _4919 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4925 = _4919 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_102.x = _4921;
        out.m_102.y = _4923;
        out.m_102.z = _4925;
    }
    out.m_104.x = _4837;
    out.m_104.y = _4839;
    out.m_104.z = _4841;
    if (_4821)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_55.x = 0.0;
    float _4927 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4927;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4685 = false;
    bool _499 = false;
    bool _317 = false;
    bool _221 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _118 = in.m_48.w;
    float _120 = in.m_50.w;
    float _122 = trunc(_118);
    int _125 = int(_122);
    float _127 = -_120;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _129;
    bool _133 = _125 >= 1;
    float _135 = 0.0;
    float _137 = _120;
    float _139 = _129;
    if (!_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _135;
    if (!_133)
    {
        out.m_55.x = 0.0;
    }
    int _143 = 0;
    if (!_133)
    {
        float _145 = _141 * 5.0;
        _143 = as_type<int>(_145);
    }
    int _147 = _143;
    if (!_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4994 = as_type<float>(_147);
        out.gl_Position.z = _4994;
    }
    if (!_133)
    {
        return out;
    }
    bool _149 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _151 = isnan(_120);
    bool _153 = _149 || _151;
    bool _155 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _157 = _153 || _155;
    float _159 = float(_125);
    bool _161 = _129 >= _159;
    bool _163 = !_157;
    bool _165 = _161 || _163;
    float _167 = 1.0 / _159;
    if (_165)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _137;
    if (_165)
    {
        out.m_55.x = 0.0;
    }
    float _171 = _129 * _167;
    int _173 = 0;
    float _175 = _171;
    if (_165)
    {
        float _177 = _169 * 5.0;
        _173 = as_type<int>(_177);
    }
    int _179 = _173;
    out.m_53.x = _171;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5057 = as_type<float>(_179);
        out.gl_Position.z = _5057;
    }
    if (_165)
    {
        return out;
    }
    float _181 = as_type<float>(int(gl_VertexIndex));
    bool _183 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _185 = as_type<int>(_181) & 1;
    bool _187 = _185 != 0;
    int _189 = as_type<int>(_181) & 2;
    bool _191 = _189 != 0;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_191;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_183;
    float _219;
    if (!_201)
    {
        float _203 = in.m_60.x;
        float _205 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _207 = _203 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _209 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _211 = _209 * _205;
        float _213 = floor(_211);
        float _215 = -_213;
        float _217 = _211 + _215;
        _219 = _217;
        _221 = true;
    }
    else
    {
        _219 = _171;
    }
    _221 = false;
    float _223 = _219;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _227 = _223 + _225;
    bool _229 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _231 = isnan(_223);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _241;
    float _245 = -_239;
    float _247 = _245 + 1.0;
    bool _249 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _251 = isnan(_223);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _257 = _253 || _255;
    float _259 = float(_257);
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _261;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _267 = 1.0 / _243;
    float _269 = _259 * _247;
    float _271 = -_259;
    float _273 = _271 + 1.0;
    float _275 = _227 * _267;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _277;
    float _281 = fma(_263, _275, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _283 = fma(_279, _275, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _285 = _281 * _269;
    float _287 = _283 * _269;
    float _289 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[143].x, _285);
    float _291 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[143].y, _287);
    float _293 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[144].x, _289);
    float _295 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[144].y, _291);
    bool _297 = !_265;
    float _315;
    if (!_297)
    {
        float _299 = in.m_60.x;
        float _301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _303 = _299 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _307 = _305 * _301;
        float _309 = floor(_307);
        float _311 = -_309;
        float _313 = _307 + _311;
        _315 = _313;
        _317 = true;
    }
    else
    {
        _315 = _171;
    }
    _317 = false;
    float _319 = _315;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _323 = _319 + _321;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _333 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _335 = isnan(_319);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _349 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _351 = isnan(_319);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = 1.0 / _327;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _363;
    float _367 = -_343;
    float _369 = _367 + 1.0;
    bool _371 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _373 = isnan(_319);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    bool _383 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _385 = 1.0 / _331;
    float _387 = 1.0 / _347;
    float _389 = _365 * _361;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _393 = _391 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _395 = _359 * _369;
    float _397 = -_359;
    float _399 = _397 + 1.0;
    float _401 = fma(_389, _323, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _403 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _405 = isnan(_319);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = _381 * _399;
    float _417 = _393 * _385;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _421 = _319 + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _423;
    float _427 = _401 * _415;
    float _429 = -_381;
    float _431 = _429 + 1.0;
    float _433 = fma(_417, _421, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _435 = -_413;
    float _437 = _435 + 1.0;
    float _439 = _425 * _387;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _443 = _319 + _441;
    float _445 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[115].x, _427);
    float _447 = _343 * _437;
    float _449 = in.m_62.x;
    float _451 = in.m_62.y;
    float _453 = fma(_439, _443, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _455 = fma(_433, _395, _445);
    float _457 = fma(_453, _447, _455);
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _461 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[118].x, _457);
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _467 = _459 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _469 = _461 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _471 = _463 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _473 = _465 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_64.x = _467;
    out.m_64.y = _471;
    out.m_64.z = _473;
    out.m_64.w = _469;
    float _475 = _295 * _451;
    float _477 = _293 * _449;
    bool _479 = !_383;
    float _497;
    if (!_479)
    {
        float _481 = in.m_60.x;
        float _483 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _485 = _481 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _487 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[11].w, _129);
        float _489 = _487 * _483;
        float _491 = floor(_489);
        float _493 = -_491;
        float _495 = _489 + _493;
        _497 = _495;
        _499 = true;
    }
    else
    {
        _497 = _171;
    }
    _499 = false;
    float _501 = _497;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _505 = _501 + _503;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _515 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _517 = isnan(_501);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _531 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _533 = isnan(_501);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = 1.0 / _509;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _545;
    float _549 = -_525;
    float _551 = _549 + 1.0;
    bool _553 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _555 = isnan(_501);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    bool _565 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _567 = 1.0 / _513;
    float _569 = 1.0 / _529;
    float _571 = _547 * _543;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _577 = _541 * _551;
    float _579 = -_541;
    float _581 = _579 + 1.0;
    float _583 = fma(_571, _505, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _585 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _587 = isnan(_501);
    bool _589 = _585 || _587;
    bool _591 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _593 = _589 || _591;
    int _595 = _593 ? 1065353216 : 0;
    float _597 = _563 * _581;
    float _599 = _575 * _567;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _603 = _501 + _601;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _605;
    float _609 = _583 * _597;
    float _611 = -_563;
    float _613 = _611 + 1.0;
    float _615 = fma(_599, _603, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _617 = -as_type<float>(_595);
    float _619 = _617 + 1.0;
    float _621 = _607 * _569;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _625 = _501 + _623;
    float _627 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[131].x, _609);
    float _629 = _525 * _619;
    float _631 = fma(_621, _625, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _633 = fma(_615, _577, _627);
    float _635 = fma(_631, _629, _633);
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _643 = fma(as_type<float>(_595), (*spvDescriptorSet0.vp_c9)._m0[134].x, _635);
    float _645 = _639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _647 = _637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _649 = _641 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _651 = _643 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_66.x = _645;
    out.m_66.y = _649;
    out.m_66.z = _647;
    out.m_66.w = _651;
    bool _653 = !_565;
    float _655 = _643;
    int _657 = as_type<int>(_645);
    int _659 = _595;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    if (!_653)
    {
        float _663 = in.m_60.x;
        float _665 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _667 = _663 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _669 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[14].x, _129);
        float _671 = _669 * _665;
        float _673 = floor(_671);
        float _675 = -_673;
        float _677 = _671 + _675;
        _655 = _673;
        _175 = _677;
    }
    float _679 = _655;
    float _681 = _175;
    float _683 = in.m_60.z;
    float _685 = in.m_60.w;
    int _687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _689 = _687 != 0;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _693 = _679;
    if (_689)
    {
        float _695 = in.m_60.x;
        float _697 = in.m_60.y;
        _691 = _695;
        _693 = _697;
    }
    float _699 = _691;
    float _701 = _693;
    float _703 = 0.0;
    if (_689)
    {
        _703 = 1.0;
    }
    float _705 = _703;
    float _707 = 0.0;
    float _709 = _705;
    if (_689)
    {
        _707 = 1.0;
    }
    float _711 = _707;
    float _713 = _711;
    if (_689)
    {
        _657 = 0;
    }
    int _715 = _657;
    float _717 = _683 * 2.0;
    int _719 = _715;
    if (_689)
    {
        _659 = 0;
    }
    int _721 = _659;
    float _723 = floor(_717);
    float _725 = 0.0;
    float _727 = _701;
    float _729 = _699;
    int _731 = _721;
    if (_689)
    {
        _725 = _699;
    }
    float _733 = _725;
    bool _735 = _723 > 0.0;
    bool _737 = _723 >= 0.0;
    bool _739 = isnan(_723);
    bool _741 = _737 || _739;
    bool _743 = isnan(0.0);
    bool _745 = _741 || _743;
    float _747 = _723;
    float _749 = _733;
    if (_689)
    {
        _661 = _733;
    }
    float _751 = _661;
    float _753 = _745 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _755 = _753;
    float _757 = _751;
    if (_689)
    {
        _747 = _733;
    }
    float _759 = _747;
    int _761 = ~as_type<int>(_753);
    int _763 = _761 + 1;
    int _765 = _763 + 1;
    int _767 = _765;
    float _769 = _759;
    if (!_735)
    {
        int _771 = ~as_type<int>(_753);
        int _773 = _771 + 1;
        _767 = _773;
    }
    int _775 = _767;
    if (_689)
    {
        _755 = _701;
    }
    float _777 = _755;
    float _779 = _777;
    if (!_689)
    {
        float _781 = in.m_60.x;
        float _783 = in.m_60.y;
        float _785 = in.m_60.z;
        float _787 = _781 * 3.1415927410125732421875;
        float _789 = _787 * 0.15915493667125701904296875;
        float _791 = _783 * 3.1415927410125732421875;
        float _793 = _791 * 0.15915493667125701904296875;
        float _795 = _789 * 6.283185482025146484375;
        float _797 = sin(_795);
        float _799 = _793 * 6.283185482025146484375;
        float _801 = sin(_799);
        _757 = _797;
        _727 = _783;
        _719 = 1;
        _729 = _781;
        _731 = 2;
        _779 = _801;
        _713 = 5.839270114898681640625;
        _769 = _785;
        _709 = 7.345489978790283203125;
        _749 = _783;
    }
    float _803 = _757;
    float _805 = _727;
    int _807 = _719;
    float _809 = _729;
    int _811 = _731;
    float _813 = _779;
    float _815 = _713;
    float _817 = _769;
    float _819 = _709;
    float _821 = _749;
    float _823 = _803 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _825 = _805 * 2.0;
    bool _827 = _807 != 1;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _833 = floor(_825);
    float _835 = _809 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _837 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[93].z, _831);
    float _839 = _809 * 2.0;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _843 = _811 != 2;
    float _845 = floor(_839);
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    bool _849 = _683 > 0.5;
    float _851 = _805 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _853 = -_829;
    float _855 = fma(_835, 2.0, _853);
    float _857 = -_847;
    float _859 = fma(_823, 2.0, _857);
    int _861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _863 = _861 != 0;
    int _865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _867 = _865 != 0;
    int _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _871 = _869 != 0;
    float _873 = fma(_851, -2.0, _841);
    float _875 = -_199;
    float _877 = _849 ? _875 : _199;
    float _879 = _813 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _881 = int(_843);
    int _883 = _827 ? 2 : 0;
    int _885 = _881 | _883;
    int _887 = _849 ? 4 : 0;
    int _889 = _885 | _887;
    int _891 = _863 ? 8 : 0;
    int _893 = _889 | _891;
    int _895 = _867 ? 16 : 0;
    int _897 = _893 | _895;
    int _899 = _871 ? 32 : 0;
    int _901 = _897 | _899;
    int _903 = false ? 64 : 0;
    int _905 = _901 | _903;
    int _907 = _905 & 4;
    float _909 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _911 = log2(_909);
    bool _913 = _805 > 0.5;
    float _915 = _805 + _809;
    bool _917 = !_871;
    float _919 = _917 ? _199 : _877;
    float _921 = _167 * _129;
    float _923 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[92].z, _837);
    float _925 = _851;
    float _927 = _877;
    float _929 = _823;
    float _931 = _835;
    float _933 = _839;
    float _935 = _813;
    if (!_827)
    {
        _925 = _683;
    }
    float _937 = _925;
    float _939 = -_129;
    float _941 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[76].x, _855);
    float _943 = _937;
    if (!_827)
    {
        _927 = _683;
    }
    float _945 = _927;
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _949 = _945;
    if (!_827)
    {
        _929 = _805;
    }
    float _951 = _929;
    float _953 = -_129;
    float _955 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[91].x, _859);
    float _957 = _951;
    if (!_827)
    {
        _931 = _805;
    }
    float _959 = _931;
    float _961 = fma(_879, -2.0, _947);
    int _963 = int(_843);
    int _965 = _827 ? 2 : 0;
    int _967 = _963 | _965;
    int _969 = _913 ? 4 : 0;
    int _971 = _967 | _969;
    int _973 = _863 ? 8 : 0;
    int _975 = _971 | _973;
    int _977 = _867 ? 16 : 0;
    int _979 = _975 | _977;
    int _981 = _871 ? 32 : 0;
    int _983 = _979 | _981;
    int _985 = false ? 64 : 0;
    int _987 = _983 | _985;
    int _989 = _987 & 4;
    float _991 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _993 = int(_991);
    float _995 = -_195;
    int _997 = _913 ? as_type<int>(_995) : as_type<int>(_195);
    float _999 = _911 * _129;
    float _1001 = _959;
    float _1003 = as_type<float>(_989);
    if (_827)
    {
        _943 = _805;
    }
    float _1005 = _943;
    float _1007 = _477 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (_827)
    {
        _949 = _805;
    }
    float _1009 = _949;
    float _1011 = _475 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    if (_827)
    {
        _957 = _809;
    }
    float _1013 = _957;
    float _1015 = exp2(_999);
    if (_827)
    {
        _1001 = _809;
    }
    float _1017 = _1001;
    bool _1019 = _845 >= 0.0;
    bool _1021 = isnan(_845);
    bool _1023 = _1019 || _1021;
    bool _1025 = isnan(0.0);
    bool _1027 = _1023 || _1025;
    bool _1029 = _833 >= 0.0;
    bool _1031 = isnan(_833);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan(0.0);
    bool _1037 = _1033 || _1035;
    bool _1039 = !_867;
    float _1041 = _1039 ? _195 : as_type<float>(_997);
    float _1043 = _915 + (-1.0);
    int _1045 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1047 = _1045 != 0;
    int _1049 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1051 = _1049 != 0;
    int _1053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1055 = _1053 != 0;
    float _1057 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1059 = int(_1057);
    float _1061 = -_1015;
    float _1063 = _1061 + 1.0;
    bool _1065 = !_1051;
    float _1067 = _1065 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1069 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1071 = !_1047;
    int _1073 = _1071 ? 0 : 1;
    float _1075 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1077 = !_1055;
    int _1079 = _1077 ? 0 : 1;
    int _1081 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1083 = _1081 != 0;
    int _1085 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1087 = _1085 != 0;
    int _1089 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1091 = _1089 != 0;
    bool _1093 = !_1087;
    int _1095 = _1093 ? 0 : 1;
    float _1097 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1099 = !_1083;
    int _1101 = _1099 ? 0 : 1;
    bool _1103 = !_1091;
    int _1105 = _1103 ? 0 : 1;
    float _1107 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1097);
    float _1109 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1111 = int(_1109);
    int _1113 = _1027 ? 0 : 1;
    int _1115 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1117 = _1115 != 0;
    int _1119 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1121 = _1119 != 0;
    int _1123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1125 = _1123 != 0;
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    bool _1129 = _833 > 0.0;
    float _1131 = fma(_1017, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1075);
    float _1133 = _1013 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1135 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1137 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1127);
    float _1139 = _1067;
    if (_843)
    {
        _933 = _809;
    }
    float _1141 = _933;
    float _1143 = -_1135;
    float _1145 = fma(_1133, 2.0, _1143);
    float _1147 = _1141;
    if (!_843)
    {
        _1147 = _683;
    }
    float _1149 = _1147;
    float _1151 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1153 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_843)
    {
        _935 = _805;
    }
    float _1155 = _935;
    float _1157 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1137);
    bool _1159 = !_1117;
    int _1161 = _1159 ? 0 : 1;
    float _1163 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1165 = _1155;
    if (!_843)
    {
        _1165 = _809;
    }
    float _1167 = _1165;
    float _1169 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1107);
    bool _1171 = _845 > 0.0;
    float _1173 = fma(_1153, -2.0, _1151);
    float _1175 = float(_993);
    float _1177 = -_129;
    float _1179 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1145);
    float _1181 = 1.0 / _1175;
    int _1183 = abs(_1161);
    float _1185 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1187 = float(_775);
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1191 = float(_1059);
    float _1193 = -_1185;
    float _1195 = fma(_1163, 2.0, _1193);
    int _1197 = ~_1113;
    int _1199 = _1197 + 1;
    int _1201 = _1199 + 1;
    float _1203 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1173);
    float _1205 = _1167 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1207 = float(_1183);
    float _1209 = 1.0 / _1191;
    int _1211 = _1201;
    if (!_1171)
    {
        int _1213 = ~_1113;
        int _1215 = _1213 + 1;
        _1211 = _1215;
    }
    int _1217 = _1211;
    float _1219 = fma(_1205, -2.0, _1189);
    bool _1221 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1223 = isnan(0.0);
    bool _1225 = _1221 || _1223;
    bool _1227 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1229 = _1225 || _1227;
    float _1231 = _1207 * _1187;
    float _1233 = float(_1111);
    float _1235 = _1181 * _129;
    float _1237 = in.m_68.x;
    float _1239 = in.m_68.y;
    float _1241 = in.m_68.z;
    float _1243 = 1.0 / _1233;
    float _1245 = _1229 ? _1063 : 0.0;
    float _1247 = _1231 * (-2.0);
    bool _1249 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1251 = isnan(1.0);
    bool _1253 = _1249 || _1251;
    bool _1255 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1257 = _1253 || _1255;
    float _1259 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1261 = 1.0 + _1259;
    float _1263 = fma(_1069, _1247, _1069);
    float _1265 = 1.0 / _1261;
    float _1267 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1269 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _1271 = !_1121;
    int _1273 = _1271 ? 0 : 1;
    float _1275 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1277 = _1037 ? 0 : 1;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1281 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1267);
    int _1283 = abs(_1273);
    float _1285 = _1209 * _129;
    float _1287 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1269);
    float _1289 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1275);
    float _1291 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1279);
    int _1293 = ~_1277;
    int _1295 = _1293 + 1;
    int _1297 = _1295 + 1;
    float _1299 = _809 + (-0.5);
    float _1301 = fma(_1247, _1237, _1237);
    int _1303 = _1297;
    if (!_1129)
    {
        int _1305 = ~_1277;
        int _1307 = _1305 + 1;
        _1303 = _1307;
    }
    int _1309 = _1303;
    float _1311 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1281);
    float _1313 = float(_1217);
    float _1315 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1287);
    bool _1317 = !_1125;
    int _1319 = _1317 ? 0 : 1;
    float _1321 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _873);
    float _1323 = float(_1283);
    float _1325 = _1243 * _129;
    float _1327 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1289);
    float _1329 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1291);
    float _1331 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[91].y, _961);
    float _1333 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1131);
    float _1335 = -_129;
    float _1337 = fma(_1335, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1195);
    float _1339 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1219);
    if (_1257)
    {
        float _1341 = _1245 * _1265;
        _139 = _1341;
    }
    float _1343 = _139;
    float _1345 = fma(_1299, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1301);
    int _1347 = abs(_1319);
    float _1349 = _1323 * _1313;
    float _1351 = _805 + _683;
    float _1353 = fma(_1263, _1343, _1345);
    float _1355 = _1349 * (-2.0);
    float _1357 = _1351 + (-1.0);
    float _1359 = float(_1309);
    float _1361 = fma(_1355, _1239, _1239);
    float _1363 = float(_1347);
    float _1365 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1367 = _805 + (-0.5);
    float _1369 = _809 + _683;
    float _1371 = _683 + (-0.5);
    float _1373 = _1363 * _1359;
    float _1375 = fma(_1367, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1361);
    float _1377 = _1369 + (-1.0);
    float _1379 = _1373 * (-2.0);
    float _1381 = fma(_1365, _1355, _1365);
    float _1383 = _1353 * 0.15915493667125701904296875;
    float _1385 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1387 = fma(_1379, _1241, _1241);
    float _1389 = fma(_1381, _1343, _1375);
    float _1391 = _1383 * 6.283185482025146484375;
    float _1393 = sin(_1391);
    float _1395 = fma(_1385, _1379, _1385);
    float _1397 = fma(_1371, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1387);
    float _1399 = _1389 * 0.15915493667125701904296875;
    float _1401 = in.m_48.x;
    float _1403 = in.m_48.y;
    float _1405 = in.m_48.z;
    bool _1407 = _685 > 0.5;
    float _1409 = fma(_1395, _1343, _1397);
    float _1411 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1413 = in.m_70.x;
    float _1415 = in.m_70.y;
    float _1417 = in.m_70.z;
    float _1419 = in.m_70.w;
    float _1421 = _1383 * 6.283185482025146484375;
    float _1423 = cos(_1421);
    float _1425 = _1409 * 0.15915493667125701904296875;
    float _1427 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _1429 = _1007 * _1411;
    float _1431 = _1011 * _1427;
    float _1433 = _1399 * 6.283185482025146484375;
    float _1435 = sin(_1433);
    float _1437 = in.m_72.x;
    float _1439 = in.m_72.y;
    float _1441 = in.m_72.z;
    float _1443 = in.m_72.w;
    float _1445 = _1399 * 6.283185482025146484375;
    float _1447 = cos(_1445);
    float _1449 = _1403 * _1415;
    float _1451 = _1425 * 6.283185482025146484375;
    float _1453 = cos(_1451);
    float _1455 = _1393 * _1435;
    float _1457 = fma(_1401, _1413, _1449);
    float _1459 = fma(_1405, _1417, _1457);
    float _1461 = _1425 * 6.283185482025146484375;
    float _1463 = sin(_1461);
    float _1465 = _1423 * _1447;
    float _1467 = _1393 * _1447;
    float _1469 = _1403 * _1439;
    float _1471 = fma(_1401, _1437, _1469);
    float _1473 = _1423 * _1453;
    float _1475 = _1423 * _1435;
    float _1477 = _1393 * _1453;
    float _1479 = _1447 * _1453;
    float _1481 = _1473 * _1431;
    float _1483 = _1435 * _1453;
    float _1485 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1487 = fma(_1405, _1441, _1471);
    float _1489 = fma(_1463, _1465, _1455);
    float _1491 = -_1431;
    float _1493 = _1463 * _1491;
    float _1495 = -_1467;
    float _1497 = fma(_1463, _1475, _1495);
    float _1499 = -_1475;
    float _1501 = fma(_1463, _1467, _1499);
    float _1503 = fma(_1489, _1429, _1481);
    float _1505 = _1477 * _1431;
    float _1507 = fma(_1479, _1429, _1493);
    float _1509 = _1487 + _1443;
    float _1511 = fma(_1497, _1485, _1503);
    float _1513 = fma(_1463, _1455, _1465);
    float _1515 = fma(_1501, _1429, _1505);
    float _1517 = fma(_1483, _1485, _1507);
    float _1519 = _1511 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1521 = _1511 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1523 = fma(_1513, _1485, _1515);
    float _1525 = _1459 + _1419;
    float _1527 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1519);
    float _1529 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1521);
    float _1531 = _1511 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1533 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1527);
    float _1535 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1529);
    float _1537 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1531);
    float _1539 = _1533 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1541 = _1535 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1543 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1537);
    float _1545 = in.m_74.x;
    float _1547 = in.m_74.y;
    float _1549 = in.m_74.z;
    float _1551 = in.m_74.w;
    float _1553 = _1525 + _1539;
    float _1555 = _1509 + _1541;
    float _1557 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1559 = _1553 + _1557;
    float _1561 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1563 = _1555 + _1561;
    float _1565 = _1559 * _1559;
    float _1567 = fma(_1563, _1563, _1565);
    float _1569 = sqrt(_1567);
    float _1571 = _1403 * _1547;
    float _1573 = fma(_1401, _1545, _1571);
    float _1575 = fma(_1405, _1549, _1573);
    bool _1577 = _1569 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1579 = _1575 + _1551;
    float _1581 = _1579 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1583 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1581);
    float _1585 = _1403;
    float _1587 = _1545;
    float _1589 = _1551;
    float _1591 = _1523;
    float _1593 = _1555;
    float _1595 = _1553;
    float _1597 = _1567;
    float _1599 = _1579;
    if (_1577)
    {
        float _1601 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1585 = _1601;
    }
    float _1603 = _1585;
    float _1605 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1583);
    float _1607 = _1605 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1609 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1611 = _1569 + _1609;
    float _1613 = _1611;
    if (_1577)
    {
        float _1615 = rsqrt(_1567);
        _1587 = _1615;
    }
    float _1617 = _1587;
    float _1619 = _1617;
    if (_1577)
    {
        float _1621 = _1611 * _1603;
        _1613 = _1621;
    }
    float _1623 = _1613;
    float _1625 = 1.0 / _1607;
    float _1627 = _1543 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    if (_1577)
    {
        float _1629 = _1623 * 0.15915493667125701904296875;
        _1589 = _1629;
    }
    float _1631 = _1589;
    float _1633 = _1579 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1635 = _1579 + _1627;
    float _1637 = _1405;
    float _1639 = _1635;
    float _1641 = _1631;
    if (_1577)
    {
        float _1643 = _1631 * 6.283185482025146484375;
        float _1645 = sin(_1643);
        _1637 = _1645;
    }
    float _1647 = _1637;
    float _1649 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1633);
    if (_1577)
    {
        float _1651 = _1635 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1591 = _1651;
    }
    float _1653 = _1591;
    float _1655 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1649);
    float _1657 = _1627;
    float _1659 = _1653;
    if (_1577)
    {
        float _1661 = _1631 * 6.283185482025146484375;
        float _1663 = cos(_1661);
        _1657 = _1663;
    }
    float _1665 = _1657;
    float _1667 = _1655 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1669 = _1667 + _1607;
    float _1671 = -_199;
    float _1673 = _1407 ? _1671 : _199;
    float _1675 = _1673;
    if (_1577)
    {
        float _1677 = fma(_1647, _1653, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1659 = _1677;
    }
    float _1679 = _1659;
    float _1681 = _1669 * _1625;
    float _1683 = _1681 * 0.5;
    bool _1685 = !_863;
    float _1687 = _1685 ? _199 : _1673;
    float _1689 = _1679;
    float _1691 = _1683;
    if (_1577)
    {
        float _1693 = _1617 * _1679;
        _1689 = _1693;
    }
    float _1695 = _1689;
    int _1697 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1699 = _1697 != 0;
    int _1701 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1703 = _1701 != 0;
    int _1705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1707 = _1705 != 0;
    int _1709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1711 = _1709 != 0;
    float _1713 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1715 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1713);
    if (!_1577)
    {
        _1691 = _1553;
    }
    float _1717 = _1691;
    float _1719 = _1717;
    if (_1577)
    {
        float _1721 = _1665 + (-1.0);
        _1675 = _1721;
    }
    float _1723 = _1675;
    float _1725 = _1723;
    if (_1577)
    {
        float _1727 = fma(_1563, _1695, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1593 = _1727;
    }
    float _1729 = _1593;
    bool _1731 = !_1699;
    int _1733 = _1731 ? 0 : 1;
    if (_1577)
    {
        float _1735 = fma(_1559, _1695, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1719 = _1735;
    }
    float _1737 = _1719;
    float _1739 = 1.0 / _1715;
    bool _1741 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1743 = isnan(0.5);
    bool _1745 = _1741 || _1743;
    bool _1747 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1749 = _1745 || _1747;
    if (_1577)
    {
        float _1751 = _1723 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1725 = _1751;
    }
    float _1753 = _1725;
    bool _1755 = !_1703;
    int _1757 = _1755 ? 0 : 1;
    bool _1759 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1761 = isnan(0.5);
    bool _1763 = _1759 || _1761;
    bool _1765 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1767 = _1763 || _1765;
    if (_1577)
    {
        float _1769 = fma(_1635, _1665, _1753);
        _1639 = _1769;
    }
    float _1771 = _1639;
    bool _1773 = !_1707;
    int _1775 = _1773 ? 0 : 1;
    bool _1777 = !_1711;
    int _1779 = _1777 ? 0 : 1;
    float _1781 = _1771;
    if (_1749)
    {
        _1595 = _1729;
    }
    float _1783 = _1595;
    float _1785 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1787 = _1739 * _1785;
    float _1789 = _1783;
    if (_1749)
    {
        _1597 = _1737;
    }
    float _1791 = _1597;
    float _1793 = _1791;
    if (_1767)
    {
        _1641 = 1.0;
    }
    float _1795 = _1641;
    float _1797 = _1795;
    if (!_1749)
    {
        float _1799 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1801 = _1579 + _1799;
        float _1803 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1805 = _1509 + _1803;
        float _1807 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1809 = -_1579;
        float _1811 = _1809 + _1771;
        float _1813 = _1801 * _1801;
        float _1815 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1817 = _1525 + _1815;
        float _1819 = -_1509;
        float _1821 = _1819 + _1729;
        float _1823 = -_1525;
        float _1825 = _1823 + _1737;
        float _1827 = fma(_1805, _1805, _1813);
        float _1829 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1831 = fma(_1817, _1817, _1827);
        float _1833 = sqrt(_1831);
        float _1835 = _1807 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1837 = precise::min(_1833, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1839 = _1837 * _1829;
        float _1841 = _1835 * _1839;
        float _1843 = fma(_1811, _1841, _1579);
        float _1845 = fma(_1821, _1841, _1509);
        float _1847 = fma(_1825, _1841, _1525);
        _1781 = _1843;
        _1789 = _1845;
        _1793 = _1847;
        _1619 = _1807;
    }
    float _1849 = _1781;
    float _1851 = _1789;
    float _1853 = _1793;
    float _1855 = _1619;
    float _1857 = _1855;
    if (!_1767)
    {
        float _1859 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1861 = _1859 * 0.15915493667125701904296875;
        float _1863 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1865 = _1861 * 6.283185482025146484375;
        float _1867 = cos(_1865);
        float _1869 = _1863 * 0.15915493667125701904296875;
        float _1871 = _1861 * 6.283185482025146484375;
        float _1873 = sin(_1871);
        float _1875 = 1.0 / _1867;
        float _1877 = _1869 * 6.283185482025146484375;
        float _1879 = cos(_1877);
        float _1881 = _1873 * _1875;
        float _1883 = _1869 * 6.283185482025146484375;
        float _1885 = sin(_1883);
        float _1887 = _1879 * _1881;
        float _1889 = 1.0 / _1887;
        float _1891 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1893 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1891;
        float _1895 = 1.0 / _1893;
        float _1897 = _1885 * _1889;
        float _1899 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1901 = fma(_1787, _1897, _1899);
        float _1903 = _1901 * _1895;
        float _1905 = precise::clamp(_1903, 0.0, 1.0);
        _1599 = _1861;
        _1857 = _1869;
        _1797 = _1905;
    }
    float _1907 = _1599;
    float _1909 = _1857;
    float _1911 = _1797;
    float _1913 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1915 = _1849 + _1913;
    float _1917 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1919 = _1851 + _1917;
    float _1921 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1923 = _1853 + _1921;
    bool _1925 = _907 != 0;
    float _1927 = _1915 * _1915;
    float _1929 = fma(_1737, 6.2500002968590706586837768554688e-05, 0.5);
    float _1931 = fma(_1919, _1919, _1927);
    float _1933 = fma(_1923, _1923, _1931);
    float _1935 = rsqrt(_1933);
    float _1937 = sqrt(_1933);
    float _1939 = _1935 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1941 = _1919 * _1939;
    float _1943 = _1923 * _1939;
    float _1945 = _1941 * _1941;
    float _1947 = _1943 * _1943;
    float _1949 = _1945 + _1947;
    float _1951 = sqrt(_1949);
    bool _1953 = _1951 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1955 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1957 = _1951 + _1955;
    float _1959 = _1935;
    float _1961 = _1957;
    float _1963 = _1907;
    float _1965 = _1915;
    float _1967 = _1939;
    float _1969 = _1949;
    if (_1953)
    {
        float _1971 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1959 = _1971;
    }
    float _1973 = _1959;
    float _1975 = _1973;
    if (_1953)
    {
        float _1977 = _1957 * _1973;
        _1961 = _1977;
    }
    float _1979 = _1961;
    if (_1953)
    {
        float _1981 = rsqrt(_1949);
        _1975 = _1981;
    }
    float _1983 = _1975;
    float _1985 = _1983;
    if (_1953)
    {
        float _1987 = _1979 * 0.15915493667125701904296875;
        _1963 = _1987;
    }
    float _1989 = _1963;
    float _1991 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1993 = _1923;
    if (_1953)
    {
        float _1995 = _1989 * 6.283185482025146484375;
        float _1997 = sin(_1995);
        _1993 = _1997;
    }
    float _1999 = _1993;
    float _2001 = precise::max(0.0, _1991);
    float _2003 = _1909;
    if (_1953)
    {
        float _2005 = _1989 * 6.283185482025146484375;
        float _2007 = cos(_2005);
        _2003 = _2007;
    }
    float _2009 = _2003;
    float _2011 = -_1939;
    float _2013 = -_2001;
    float _2015 = fma(_1915, _2011, _2013);
    float _2017 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1953)
    {
        float _2019 = _2015 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1965 = _2019;
    }
    float _2021 = _1965;
    float _2023 = fma(_1509, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2025 = _1999;
    float _2027 = _2021;
    if (_1953)
    {
        float _2029 = fma(_1999, _2021, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2025 = _2029;
    }
    float _2031 = _2025;
    float _2033 = _2031;
    if (!_1953)
    {
        _2027 = _2015;
    }
    float _2035 = _2027;
    float _2037 = floor(_2023);
    float _2039 = _2035;
    if (_1953)
    {
        float _2041 = _1983 * _2031;
        _1967 = _2041;
    }
    float _2043 = _1967;
    if (!_1953)
    {
        _1985 = _1941;
    }
    float _2045 = _1985;
    float _2047 = _2045;
    float _2049 = _2009;
    if (_1953)
    {
        float _2051 = _2009 + (-1.0);
        _2017 = _2051;
    }
    float _2053 = _2017;
    float _2055 = _2053;
    if (_1953)
    {
        float _2057 = _1941 * _2043;
        _2047 = _2057;
    }
    float _2059 = _2047;
    if (!_1953)
    {
        _2033 = _1945;
    }
    float _2061 = _2033;
    float _2063 = _2061;
    if (_1953)
    {
        float _2065 = _2053 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1969 = _2065;
    }
    float _2067 = _1969;
    if (!_1953)
    {
        _2055 = _1943;
    }
    float _2069 = _2055;
    float _2071 = _2069;
    if (_1953)
    {
        float _2073 = _2059 * _2059;
        _2063 = _2073;
    }
    float _2075 = _2063;
    if (_1953)
    {
        float _2077 = _1943 * _2043;
        _2071 = _2077;
    }
    float _2079 = _2071;
    if (_1953)
    {
        float _2081 = fma(_2015, _2009, _2067);
        _2039 = _2081;
    }
    float _2083 = _2039;
    if (!_1953)
    {
        _2049 = _1947;
    }
    float _2085 = _2049;
    float _2087 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2089 = _2085;
    if (_1953)
    {
        float _2091 = _2079 * _2079;
        _2089 = _2091;
    }
    float _2093 = _2089;
    float _2095 = fma(_2083, _2083, _2075);
    float _2097 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2087);
    float _2099 = -_2037;
    float _2101 = _2023 + _2099;
    float _2103 = _2095 + _2093;
    float _2105 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2107 = fma(_1937, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2105);
    float _2109 = precise::clamp(_2107, 0.0, 1.0);
    float _2111 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2097);
    float _2113 = rsqrt(_2103);
    float _2115 = -_2109;
    float _2117 = _2115 + 1.0;
    float _2119 = _2111 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2121 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2123 = _2119 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2125 = fma(_1525, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2127 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2129 = -_2123;
    float _2131 = fma(_2129, _2121, 1.0);
    float _2133 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2135 = abs(_2117);
    float _2137 = log2(_2135);
    float _2139 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2127);
    float _2141 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2143 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2133);
    float _2145 = _2113 * _2059;
    float _2147 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2139);
    float _2149 = _2113 * _2083;
    float _2151 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2143);
    float _2153 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2155 = _2147 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2157 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2141);
    float _2159 = _2151 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2161 = _2113 * _2079;
    float _2163 = -_2153;
    float _2165 = fma(_2149, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2163);
    float _2167 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2157);
    float _2169 = _2159 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2171 = floor(_2125);
    float _2173 = -_2161;
    float _2175 = fma(_2173, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2165);
    float _2177 = _2167 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2179 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2169);
    float _2181 = _2137 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2183 = fma(_2175, -0.5, 0.5);
    float _2185 = fma(_2175, 0.5, 0.5);
    float _2187 = fma(_2119, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2179);
    float _2189 = exp2(_2181);
    float _2191 = _2149 + 1.0;
    float _2193 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2187);
    float _2195 = fma(_2185, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2197 = _2159 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2199 = -_2171;
    float _2201 = _2125 + _2199;
    float _2203 = sqrt(_2183);
    float _2205 = _2159 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2207 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2197);
    float _2209 = fma(_2185, _2195, -0.212114393711090087890625);
    float _2211 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2205);
    float _2213 = fma(_2119, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2207);
    float _2215 = fma(_2185, _2209, 1.570728778839111328125);
    float _2217 = log2(_2131);
    float _2219 = fma(_2119, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2211);
    float _2221 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2213);
    float _2223 = -_2149;
    float _2225 = fma(_2189, _2191, _2223);
    float _2227 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2219);
    float _2229 = fma(_1729, 6.2500002968590706586837768554688e-05, 0.5);
    float _2231 = fma(_2225, 0.5, 0.5);
    float _2233 = 1.0 / _2193;
    float _2235 = _2203 * 0.636619746685028076171875;
    float _2237 = -_2215;
    float _2239 = fma(_2235, _2237, 1.0);
    float _2241 = _2217 * 0.693147182464599609375;
    float2 _8251 = float2(_2101, _2201);
    float _2243 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8251, float2(0.0), isnan(_8251)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8251, float2(0.0), isnan(_8251)), level(0.0)).x;
    float _2245 = _2241 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2247 = _2221 * _2233;
    float _2249 = _2227 * _2233;
    float _2251 = fma(_2247, 0.5, 0.5);
    float _2253 = fma(_2249, -0.5, 0.5);
    float3 _8276 = float3(_2251, _2253, _2245);
    float _2255 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8276, float3(0.0), isnan(_8276)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8276, float3(0.0), isnan(_8276)), level(0.0)).x;
    float3 _8287 = float3(_2251, _2253, _2245);
    float4 _2258 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8287, float3(0.0), isnan(_8287)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8287, float3(0.0), isnan(_8287)), level(0.0)).xyzw;
    float _2260 = _2258.x;
    float _2262 = _2258.y;
    float _2264 = _2258.z;
    float _2266 = _2258.w;
    float2 _8303 = float2(_2239, _2231);
    float3 _2270 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8303, float2(0.0), isnan(_8303)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8303, float2(0.0), isnan(_8303)), level(0.0)).xyz;
    float _2272 = _2270.x;
    float _2274 = _2270.y;
    float _2276 = _2270.z;
    float2 _8317 = float2(_2229, _1929);
    float3 _2278 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_8317, float2(0.0), isnan(_8317)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_8317, float2(0.0), isnan(_8317)), level(0.0)).xyz;
    float _2280 = _2278.x;
    float _2282 = _2278.y;
    float _2284 = _2278.z;
    float _2286 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2288 = int(_2286);
    float _2290 = _815 * _817;
    int _2292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2294 = _2292 != 0;
    float _2296 = -_1157;
    float _2298 = _2296 + 1.0;
    int _2300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2302 = _2300 != 0;
    float _2304 = -_1327;
    float _2306 = _2304 + 1.0;
    int _2308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2310 = _2308 != 0;
    float _2312 = -_1333;
    float _2314 = _2312 + 1.0;
    float _2316 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _2318 = int(_2316);
    int _2320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2322 = _2320 != 0;
    float _2324 = -_1169;
    float _2326 = _2324 + 1.0;
    int _2328 = abs(_1073);
    float _2330 = _2137 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2332 = abs(_1079);
    float _2334 = _2159 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2336 = abs(_1757);
    float _2338 = trunc(_1235);
    int _2340 = int(_2338);
    float _2342 = float(uint(_2288));
    float _2344 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2334);
    float _2346 = trunc(_1285);
    int _2348 = int(_2346);
    float _2350 = float(uint(_2318));
    float _2352 = -_1329;
    float _2354 = _2352 + 1.0;
    float _2356 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _2358 = int(_2356);
    float _2360 = float(uint(_2340));
    float _2362 = fma(_2119, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2344);
    float _2364 = float(_2288);
    int _2366 = ~_2318;
    int _2368 = _2366 + 1;
    float _2370 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2362);
    float _2372 = float(_2318);
    float _2374 = 1.0 / _2342;
    float _2376 = float(uint(_2348));
    int _2378 = abs(_1779);
    out.gl_Position.x = _2221;
    out.gl_Position.y = _2227;
    out.gl_Position.z = _2370;
    out.gl_Position.w = _2193;
    bool _2380 = _989 != 0;
    bool _2382 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2384 = isnan(_681);
    bool _2386 = _2382 || _2384;
    bool _2388 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2390 = _2386 || _2388;
    float _2392 = float(_2390);
    float _2394 = 1.0 / _2350;
    float _2396 = float(uint(_2358));
    float _2398 = 1.0 / _2396;
    int _2400 = as_type<int>(_2374) + (-2);
    float _2402 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2404 = _2402 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2406 = float(_2340);
    float _2408 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2410 = _2408 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2412 = as_type<float>(_2400) * _2360;
    bool _2414 = _2406 >= _2364;
    bool _2416 = isnan(_2406);
    bool _2418 = _2414 || _2416;
    bool _2420 = isnan(_2364);
    bool _2422 = _2418 || _2420;
    float _2424 = float(_2422);
    float _2426 = trunc(_1325);
    int _2428 = int(_2426);
    int _2430 = as_type<int>(_2394) + (-2);
    float _2432 = _819 * _809;
    int _2434 = ~_2288;
    int _2436 = _2434 + 1;
    float _2438 = as_type<float>(_2430) * _2376;
    float _2440 = trunc(_2412);
    float _2442 = precise::max(_2440, 0.0);
    uint _2445 = uint(_2442);
    float _2447 = trunc(_2438);
    float _2449 = precise::max(_2447, 0.0);
    uint _2451 = uint(_2449);
    float _2453 = float(uint(_2428));
    int _2455 = _2436 * int(_2445);
    int _2457 = _2455 + _2340;
    float _2459 = trunc(_2424);
    int _2461 = int(_2459);
    float _2463 = float(uint(_2457));
    int _2465 = as_type<int>(_2398) + (-2);
    float _2467 = floor(_2290);
    float _2469 = as_type<float>(_2400) * _2463;
    int _2471 = _2368 * int(_2451);
    int _2473 = _2471 + _2348;
    float _2475 = as_type<float>(_2465) * _2453;
    int _2477 = ~_2288;
    int _2479 = _2477 + 1;
    float _2481 = float(_2348);
    float _2483 = trunc(_2469);
    float _2485 = precise::max(_2483, 0.0);
    uint _2487 = uint(_2485);
    float _2489 = float(uint(_2473));
    bool _2491 = _2481 >= _2372;
    bool _2493 = isnan(_2481);
    bool _2495 = _2491 || _2493;
    bool _2497 = isnan(_2372);
    bool _2499 = _2495 || _2497;
    float _2501 = float(_2499);
    float _2503 = as_type<float>(_2430) * _2489;
    float _2505 = _819 * _821;
    float _2507 = floor(_2432);
    float _2509 = -_2467;
    float _2511 = _2290 + _2509;
    float _2513 = trunc(_2503);
    float _2515 = precise::max(_2513, 0.0);
    uint _2517 = uint(_2515);
    int _2519 = int(_2445) + int(_2487);
    int _2521 = ~_2358;
    int _2523 = _2521 + 1;
    int _2525 = _2479 * _2519;
    int _2527 = _2525 + _2340;
    int _2529 = ~_2318;
    int _2531 = _2529 + 1;
    float _2533 = trunc(_2475);
    float _2535 = precise::max(_2533, 0.0);
    uint _2537 = uint(_2535);
    float _2539 = -_2507;
    float _2541 = _2432 + _2539;
    bool _2543 = uint(_2527) >= uint(_2288);
    float _2545 = _2511 * _2372;
    float _2547 = _2541 * _2364;
    float _2549 = _2364 * _921;
    int _2551 = int(_2451) + int(_2517);
    float _2553 = trunc(_2501);
    int _2555 = int(_2553);
    bool _2557 = !_2322;
    int _2559 = _2557 ? 0 : 1;
    float _2561 = _2372 * _921;
    int _2563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2565 = _2563 != 0;
    int _2567 = _2531 * _2551;
    int _2569 = _2567 + _2348;
    int _2571 = abs(_2559);
    int _2573 = _2523 * int(_2537);
    int _2575 = _2573 + _2428;
    float _2577 = trunc(_2547);
    int _2579 = int(_2577);
    bool _2581 = !_2565;
    int _2583 = _2581 ? 0 : 1;
    bool _2585 = _2288 == 0;
    float _2587 = float(uint(_2575));
    bool _2589 = !_2543;
    int _2591 = _2589 ? 0 : (-1);
    float _2593 = trunc(_2545);
    int _2595 = int(_2593);
    bool _2597 = uint(_2569) >= uint(_2318);
    float _2599 = as_type<float>(_2465) * _2587;
    int _2601 = ~_2519;
    int _2603 = _2601 + _2591;
    int _2605 = _2603 + 1;
    bool _2607 = !_2597;
    int _2609 = _2607 ? 0 : (-1);
    int _2611 = abs(_2583);
    int _2613 = _2579 * _2571;
    int _2615 = _2613 + _2340;
    int _2617 = ~_2551;
    int _2619 = _2617 + _2609;
    int _2621 = _2619 + 1;
    int _2623 = _2288 * _2605;
    int _2625 = _2623 + _2340;
    float _2627 = as_type<float>(_2551);
    float _2629 = _2505;
    float _2631 = _2227;
    float _2633 = _2221;
    if (_2310)
    {
        float _2635 = in.m_60.w;
        _2627 = _2635;
    }
    float _2637 = _2627;
    float _2639 = trunc(_2599);
    float _2641 = precise::max(_2639, 0.0);
    uint _2643 = uint(_2641);
    bool _2645 = _2318 == 0;
    int _2647 = _2318 * _2621;
    int _2649 = _2647 + _2348;
    int _2651 = ~_2461;
    int _2653 = _2651 + 1;
    int _2655 = _2653 + 1;
    int _2657 = _2595 * _2611;
    int _2659 = _2657 + _2348;
    bool _2661 = !_2585;
    int _2663 = _2661 ? _2625 : (-1);
    int _2665 = ~_2555;
    int _2667 = _2665 + 1;
    int _2669 = _2667 + 1;
    float _2671 = trunc(_2549);
    int _2673 = int(_2671);
    bool _2675 = !_2645;
    int _2677 = _2675 ? _2649 : (-1);
    int _2679 = _2663 * _2655;
    int _2681 = _2318 + (-1);
    int _2683 = _2288 + (-1);
    int _2685 = _2677 * _2669;
    float _2687 = float(_2428);
    float _2689 = trunc(_2561);
    int _2691 = int(_2689);
    int _2693 = int(_2537) + int(_2643);
    int _2695 = _2555 * _2681;
    int _2697 = _2695 + _2685;
    int _2699 = abs(as_type<int>(_1067));
    int _2701 = _2461 * _2683;
    int _2703 = _2701 + _2679;
    int _2705 = ~_2358;
    int _2707 = _2705 + 1;
    if (_2310)
    {
        float _2709 = _2637 * 3.1415927410125732421875;
        _1139 = _2709;
    }
    float _2711 = _1139;
    bool _2713 = !_2294;
    int _2715 = _2713 ? 0 : 1;
    int _2717 = _2703 * _2699;
    float _2719 = _2711;
    if (_2310)
    {
        float _2721 = _2711 * 0.15915493667125701904296875;
        _2719 = _2721;
    }
    float _2723 = _2719;
    int _2725 = abs(_2715);
    int _2727 = _2673 * _2328;
    int _2729 = _2727 + _2717;
    int _2731 = abs(_1095);
    int _2733 = _2707 * _2693;
    int _2735 = _2733 + _2428;
    float _2737 = as_type<float>(_2707);
    if (_2310)
    {
        float _2739 = _2723 * 6.283185482025146484375;
        float _2741 = sin(_2739);
        _2737 = _2741;
    }
    float _2743 = _2737;
    int _2745 = abs(_1101);
    int _2747 = _2697 * _2731;
    bool _2749 = uint(_2735) >= uint(_2358);
    int _2751 = abs(_1105);
    int _2753 = _2691 * _2745;
    int _2755 = _2753 + _2747;
    float _2757 = float(_2358);
    float _2759 = floor(_2505);
    int _2761 = _2615 * _2332;
    int _2763 = _2761 + _2729;
    bool _2765 = !_2749;
    int _2767 = _2765 ? 0 : (-1);
    int _2769 = _2579 * _2725;
    int _2771 = _2769 + _2763;
    bool _2773 = !_2302;
    int _2775 = _2773 ? 0 : 1;
    int _2777 = ~_2693;
    int _2779 = _2777 + _2767;
    int _2781 = _2779 + 1;
    float _2783 = _2757 * _921;
    float _2785 = float(uint(_2771));
    int _2787 = _2659 * _2751;
    int _2789 = _2787 + _2755;
    bool _2791 = _2687 >= _2757;
    bool _2793 = isnan(_2687);
    bool _2795 = _2791 || _2793;
    bool _2797 = isnan(_2757);
    bool _2799 = _2795 || _2797;
    float _2801 = float(_2799);
    int _2803 = _2358 * _2781;
    int _2805 = _2803 + _2428;
    int _2807 = abs(_2775);
    float _2809 = as_type<float>(_2400) * _2785;
    float _2811 = float(uint(_2615));
    float _2813 = trunc(_2783);
    int _2815 = int(_2813);
    bool _2817 = _2749;
    float _2819 = as_type<float>(_2815);
    if (_2310)
    {
        bool _2821 = _2743 > 0.5;
        _2817 = _2821;
    }
    bool _2823 = _2817;
    int _2825 = _2595 * _2807;
    int _2827 = _2825 + _2789;
    float _2829 = -_2759;
    float _2831 = _2505 + _2829;
    bool _2833 = _2358 == 0;
    float _2835 = as_type<float>(_2400) * _2811;
    int _2837 = ~_2288;
    int _2839 = _2837 + 1;
    float _2841 = _2831 * _2757;
    float _2843 = trunc(_2801);
    int _2845 = int(_2843);
    float _2847 = float(uint(_2827));
    bool _2849 = !_2833;
    int _2851 = _2849 ? _2805 : (-1);
    if (!_2310)
    {
        _2629 = _195;
    }
    float _2853 = _2629;
    float _2855 = as_type<float>(_2430) * _2847;
    float _2857 = _2853;
    if (_2310)
    {
        float _2859 = -_195;
        float _2861 = _2823 ? _2859 : _195;
        _2857 = _2861;
    }
    float _2863 = _2857;
    float _2865 = trunc(_2809);
    float _2867 = precise::max(_2865, 0.0);
    uint _2869 = uint(_2867);
    int _2871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2873 = _2871 != 0;
    int _2875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2877 = _2875 != 0;
    int _2879 = abs(_1733);
    float _2881 = trunc(_2855);
    float _2883 = precise::max(_2881, 0.0);
    uint _2885 = uint(_2883);
    int _2887 = ~_2845;
    int _2889 = _2887 + 1;
    int _2891 = _2889 + 1;
    float _2893 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2895 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2893;
    float _2897 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2899 = _2897 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _2901 = _2851 * _2891;
    int _2903 = _2358 + (-1);
    int _2905 = _2839 * int(_2869);
    int _2907 = _2905 + _2771;
    float _2909 = trunc(_2835);
    float _2911 = precise::max(_2909, 0.0);
    uint _2913 = uint(_2911);
    int _2915 = ~_2318;
    int _2917 = _2915 + 1;
    float _2919 = as_type<float>(_2745);
    float _2921 = as_type<float>(_2869);
    if (_2873)
    {
        float _2923 = in.m_60.x;
        _2919 = _2923;
    }
    float _2925 = _2919;
    int _2927 = _2845 * _2903;
    int _2929 = _2927 + _2901;
    float _2931 = float(uint(_2907));
    float _2933 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2935 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2933;
    bool _2937 = !_2877;
    int _2939 = _2937 ? 0 : 1;
    int _2941 = _2917 * int(_2885);
    int _2943 = _2941 + _2827;
    float _2945 = trunc(_2841);
    int _2947 = int(_2945);
    float _2949 = as_type<float>(_2400) * _2931;
    int _2951 = ~_2288;
    int _2953 = _2951 + 1;
    int _2955 = abs(_2939);
    float _2957 = float(uint(_2943));
    float _2959 = trunc(_2949);
    float _2961 = precise::max(_2959, 0.0);
    uint _2963 = uint(_2961);
    int _2965 = _2953 * int(_2913);
    int _2967 = _2965 + _2615;
    float _2969 = float(uint(_2967));
    int _2971 = _2929 * _2336;
    int _2973 = _2947 * _2955;
    int _2975 = _2973 + _2428;
    float _2977 = as_type<float>(_2430) * _2957;
    float _2979 = as_type<float>(_2400) * _2969;
    float _2981 = float(uint(_2659));
    int _2983 = _2815 * _2879;
    int _2985 = _2983 + _2971;
    float _2987 = trunc(_2977);
    float _2989 = precise::max(_2987, 0.0);
    uint _2991 = uint(_2989);
    int _2993 = ~_2288;
    int _2995 = _2993 + 1;
    if (_2873)
    {
        float _2997 = _2925 * 3.1415927410125732421875;
        _2819 = _2997;
    }
    float _2999 = _2819;
    int _3001 = int(_2869) + int(_2963);
    float _3003 = -_2243;
    float _3005 = _3003 + 1.0;
    int _3007 = abs(_1775);
    float _3009 = as_type<float>(_2430) * _2981;
    if (_2873)
    {
        float _3011 = _2999 * 0.15915493667125701904296875;
        _2921 = _3011;
    }
    float _3013 = _2921;
    float _3015 = trunc(_2979);
    float _3017 = precise::max(_3015, 0.0);
    uint _3019 = uint(_3017);
    int _3021 = _2995 * _3001;
    int _3023 = _3021 + _2771;
    if (!_2873)
    {
        _1003 = _199;
    }
    float _3025 = _1003;
    int _3027 = _2975 * _3007;
    int _3029 = _3027 + _2985;
    int _3031 = ~_2318;
    int _3033 = _3031 + 1;
    bool _3035 = uint(_3023) >= uint(_2288);
    int _3037 = _2947 * _2378;
    int _3039 = _3037 + _3029;
    float _3041 = trunc(_3009);
    float _3043 = precise::max(_3041, 0.0);
    uint _3045 = uint(_3043);
    int _3047 = int(_2885) + int(_2991);
    float _3049 = -_195;
    int _3051 = _1925 ? as_type<int>(_3049) : as_type<int>(_195);
    float _3053 = float(uint(_2975));
    float _3055 = _3013;
    float _3057 = _3025;
    if (_2873)
    {
        float _3059 = _3013 * 6.283185482025146484375;
        float _3061 = sin(_3059);
        _3055 = _3061;
    }
    float _3063 = _3055;
    int _3065 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _3067 = _3065 != 0;
    int _3069 = _3033 * _3047;
    int _3071 = _3069 + _2827;
    int _3073 = ~_2318;
    int _3075 = _3073 + 1;
    float _3077 = as_type<float>(_2465) * _3053;
    bool _3079 = !_3067;
    float _3081 = _3079 ? _195 : as_type<float>(_3051);
    bool _3083 = uint(_3071) >= uint(_2318);
    int _3085 = _3075 * int(_3045);
    int _3087 = _3085 + _2659;
    float _3089 = float(uint(_3039));
    float _3091 = trunc(_3077);
    float _3093 = precise::max(_3091, 0.0);
    uint _3095 = uint(_3093);
    bool _3097 = !_3035;
    int _3099 = _3097 ? 0 : (-1);
    float _3101 = as_type<float>(_2465) * _3089;
    int _3103 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3105 = _3103 != 0;
    float _3107 = float(uint(_3087));
    float _3109 = 1.0 / _2404;
    bool _3111 = !_3083;
    int _3113 = _3111 ? 0 : (-1);
    int _3115 = ~_3001;
    int _3117 = _3115 + _3099;
    int _3119 = _3117 + 1;
    float _3121 = as_type<float>(_2430) * _3107;
    bool _3123 = _3083;
    if (_2873)
    {
        bool _3125 = _3063 > 0.5;
        _3123 = _3125;
    }
    bool _3127 = _3123;
    int _3129 = ~_2358;
    int _3131 = _3129 + 1;
    float _3133 = trunc(_3101);
    float _3135 = precise::max(_3133, 0.0);
    uint _3137 = uint(_3135);
    int _3139 = ~_3047;
    int _3141 = _3139 + _3113;
    int _3143 = _3141 + 1;
    int _3145 = _2288 * _3119;
    int _3147 = _3145 + _2771;
    float _3149 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _3151 = _3149 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    if (_2873)
    {
        float _3153 = -_199;
        float _3155 = _3127 ? _3153 : _199;
        _3057 = _3155;
    }
    float _3157 = _3057;
    int _3159 = _2318 * _3143;
    int _3161 = _3159 + _2827;
    bool _3163 = !_2585;
    int _3165 = _3163 ? _3147 : (-1);
    int _3167 = _3131 * int(_3095);
    int _3169 = _3167 + _2975;
    int _3171 = int(_2913) + int(_3019);
    float _3173 = trunc(_3121);
    float _3175 = precise::max(_3173, 0.0);
    uint _3177 = uint(_3175);
    float _3179 = -_199;
    int _3181 = _2380 ? as_type<int>(_3179) : as_type<int>(_199);
    float _3183 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3185 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _3183;
    float _3187 = float(uint(_3169));
    int _3189 = _3165 & 3;
    bool _3191 = _3189 != 0;
    int _3193 = _3131 * int(_3137);
    int _3195 = _3193 + _3039;
    int _3197 = ~_2288;
    int _3199 = _3197 + 1;
    float _3201 = as_type<float>(_2465) * _3187;
    bool _3203 = uint(_3189) > 1u;
    float _3205 = 1.0 / _2410;
    float _3207 = float(uint(_3195));
    int _3209 = _3199 * _3171;
    int _3211 = _3209 + _2615;
    int _3213 = _3165 & 3;
    bool _3215 = _3213 != 0;
    bool _3217 = !_3105;
    float _3219 = _3217 ? _199 : as_type<float>(_3181);
    float _3221 = as_type<float>(_2465) * _3207;
    bool _3223 = !_2645;
    int _3225 = _3223 ? _3161 : (-1);
    float _3227 = trunc(_3201);
    float _3229 = precise::max(_3227, 0.0);
    uint _3231 = uint(_3229);
    int _3233 = _3215 ? 0 : 1;
    int _3235 = _3225 & 3;
    bool _3237 = _3235 != 0;
    bool _3239 = uint(_3211) >= uint(_2288);
    int _3241 = ~_3233;
    int _3243 = _3241 + 1;
    int _3245 = _3243 + 1;
    float _3247 = trunc(_3221);
    float _3249 = precise::max(_3247, 0.0);
    uint _3251 = uint(_3249);
    int _3253 = _3245;
    if (!_3203)
    {
        int _3255 = ~_3233;
        int _3257 = _3255 + 1;
        _3253 = _3257;
    }
    int _3259 = _3253;
    bool _3261 = uint(_3235) > 1u;
    bool _3263 = !_3239;
    int _3265 = _3263 ? 0 : (-1);
    int _3267 = _3225 & 3;
    bool _3269 = _3267 != 0;
    float _3271 = exp2(_2330);
    int _3273 = _3269 ? 0 : 1;
    int _3275 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3277 = _3275 != 0;
    int _3279 = ~_2318;
    int _3281 = _3279 + 1;
    int _3283 = int(_3045) + int(_3177);
    int _3285 = int(_3137) + int(_3251);
    bool _3287 = !_3237;
    int _3289 = _3287 ? 0 : 1;
    int _3291 = ~_2358;
    int _3293 = _3291 + 1;
    float _3295 = -_3271;
    float _3297 = _3295 + 1.0;
    bool _3299 = _3235 != 3;
    int _3301 = ~_3273;
    int _3303 = _3301 + 1;
    int _3305 = _3303 + 1;
    float _3307 = _3297 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _3309 = _3305;
    if (!_3261)
    {
        int _3311 = ~_3273;
        int _3313 = _3311 + 1;
        _3309 = _3313;
    }
    int _3315 = _3309;
    int _3317 = _3281 * _3283;
    int _3319 = _3317 + _2659;
    bool _3321 = uint(_3235) >= 2u;
    float _3323 = _3307 * _2255;
    float _3325 = -_3307;
    float _3327 = _3325 + 1.0;
    int _3329 = _3321 ? 0 : 1;
    int _3331 = _3293 * _3285;
    int _3333 = _3331 + _3039;
    bool _3335 = uint(_3319) >= uint(_2318);
    int _3337 = int(_3095) + int(_3231);
    float _3339 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3341 = _3339 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _3343 = ~_3329;
    int _3345 = _3343 + 1;
    int _3347 = _3345 + 1;
    int _3349 = ~_2358;
    int _3351 = _3349 + 1;
    float _3353 = 1.0 / _3341;
    int _3355 = _3347;
    if (_3299)
    {
        int _3357 = ~_3329;
        int _3359 = _3357 + 1;
        _3355 = _3359;
    }
    int _3361 = _3355;
    int _3363 = _3351 * _3337;
    int _3365 = _3363 + _2975;
    bool _3367 = uint(_3333) >= uint(_2358);
    bool _3369 = !_3335;
    int _3371 = _3369 ? 0 : (-1);
    float _3373 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3375 = _3373 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3377 = !_3367;
    int _3379 = _3377 ? 0 : (-1);
    bool _3381 = _809 > 0.5;
    float _3383 = 1.0 / _3375;
    bool _3385 = uint(_3365) >= uint(_2358);
    float _3387 = _2899 * _3353;
    bool _3389 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _3391 = isnan(_681);
    bool _3393 = _3389 || _3391;
    bool _3395 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _3397 = _3393 || _3395;
    float _3399 = float(_3397);
    float _3401 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3403 = _3401 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3405 = !_3385;
    int _3407 = _3405 ? 0 : (-1);
    bool _3409 = _3235 != 3;
    float _3411 = 1.0 / _3403;
    float _3413 = -_195;
    int _3415 = _3381 ? as_type<int>(_3413) : as_type<int>(_195);
    bool _3417 = !_3409;
    int _3419 = _3417 ? 0 : (-1);
    bool _3421 = !_3277;
    float _3423 = _3421 ? _195 : as_type<float>(_3415);
    float _3425 = _2895 * _3383;
    int _3427 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3429 = _3427 != 0;
    int _3431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3433 = _3431 != 0;
    float _3435 = -_3399;
    float _3437 = _3435 + 1.0;
    int _3439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _3441 = _3439 != 0;
    bool _3443 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _3445 = isnan(_681);
    bool _3447 = _3443 || _3445;
    bool _3449 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _3451 = _3447 || _3449;
    float _3453 = float(_3451);
    bool _3455 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _3457 = isnan(_681);
    bool _3459 = _3455 || _3457;
    bool _3461 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _3463 = _3459 || _3461;
    float _3465 = float(_3463);
    float _3467 = _2935 * _3411;
    float _3469 = -_3453;
    float _3471 = _3469 + 1.0;
    float _3473 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3475 = _3473 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3477 = _3465 * _3437;
    float _3479 = -_3465;
    float _3481 = _3479 + 1.0;
    float _3483 = _3399 * _3471;
    bool _3485 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3487 = isnan(_681);
    bool _3489 = _3485 || _3487;
    bool _3491 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _3493 = _3489 || _3491;
    float _3495 = float(_3493);
    float _3497 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3499 = _3497 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3501 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3503 = isnan(_681);
    bool _3505 = _3501 || _3503;
    bool _3507 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _3509 = _3505 || _3507;
    float _3511 = float(_3509);
    float _3513 = 1.0 / _3475;
    bool _3515 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _3517 = isnan(_681);
    bool _3519 = _3515 || _3517;
    bool _3521 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _3523 = _3519 || _3521;
    float _3525 = float(_3523);
    float _3527 = _3495 * _3481;
    float _3529 = -_3495;
    float _3531 = _3529 + 1.0;
    float _3533 = -_3511;
    float _3535 = _3533 + 1.0;
    int _3537 = ~_3285;
    int _3539 = _3537 + _3379;
    int _3541 = _3539 + 1;
    float _3543 = -_3525;
    float _3545 = _3543 + 1.0;
    float _3547 = _3511 * _3531;
    float _3549 = 1.0 / _3499;
    float _3551 = _3525 * _3535;
    float _3553 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3555 = _681 + _3553;
    bool _3557 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _3559 = isnan(_681);
    bool _3561 = _3557 || _3559;
    bool _3563 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _3565 = _3561 || _3563;
    float _3567 = float(_3565);
    float _3569 = _2392 * _3545;
    float _3571 = -_2392;
    float _3573 = _3571 + 1.0;
    float _3575 = fma(_3425, _3555, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _3577 = _2358 * _3541;
    int _3579 = _3577 + _3039;
    float _3581 = _3185 * _3513;
    float _3583 = _3567 * _3573;
    int _3585 = ~_3283;
    int _3587 = _3585 + _3371;
    int _3589 = _3587 + 1;
    float _3591 = _3575 * _3583;
    float _3593 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3595 = _681 + _3593;
    float _3597 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3599 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _3597;
    float _3601 = -_3567;
    float _3603 = _3601 + 1.0;
    float _3605 = _3151 * _3549;
    float _3607 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _3609 = _3607 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3611 = fma(_3387, _3595, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _3613 = fma(_3603, (*spvDescriptorSet0.vp_c9)._m0[159].x, _3591);
    float _3615 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3617 = _681 + _3615;
    float _3619 = abs(_1787);
    float _3621 = log2(_3619);
    float _3623 = _3609 * _3109;
    float _3625 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3627 = _681 + _3625;
    float _3629 = fma(_3467, _3617, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _3631 = fma(_3611, _3569, _3613);
    float _3633 = _3599 * _3205;
    float _3635 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3637 = _681 + _3635;
    float _3639 = fma(_3605, _3627, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _3641 = fma(_3629, _3551, _3631);
    float _3643 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3645 = _681 + _3643;
    float _3647 = fma(_3581, _3637, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _3649 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3651 = _681 + _3649;
    float _3653 = fma(_3639, _3547, _3641);
    float _3655 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3657 = fma(_3623, _3645, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _3659 = _2863 + 0.5;
    float _3661 = _3621 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3663 = fma(_3647, _3527, _3653);
    float _3665 = _3157 + (-0.5);
    float _3667 = fma(_3633, _3651, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _3669 = fma(_3659, (*spvDescriptorSet0.vp_c9)._m0[95].x, _955);
    float _3671 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3673 = fma(_3657, _3477, _3663);
    float _3675 = _3423 + 0.5;
    float _3677 = -_923;
    float _3679 = _3677 + 1.0;
    float _3681 = -_3665;
    float _3683 = -_1331;
    float _3685 = fma(_3681, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3683);
    float _3687 = _3219 + (-0.5);
    float _3689 = fma(_3675, (*spvDescriptorSet0.vp_c9)._m0[80].x, _941);
    int _3691 = _3225 >> 31;
    float _3693 = exp2(_3661);
    float _3695 = -_3679;
    float _3697 = fma(_3695, _2863, _3669);
    float _3699 = fma(_2298, _3157, _3685);
    float _3701 = -_3687;
    float _3703 = -_1321;
    float _3705 = fma(_3701, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3703);
    float _3707 = _3655 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3709 = _3081 + 0.5;
    int _3711 = _3691 & 3;
    out.m_76.x = _3697;
    out.m_76.y = _3699;
    float _3713 = fma(_3707, _3709, _1179);
    int _3715 = _3225 + _3711;
    float _3717 = _3671 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3719 = _1687 + (-0.5);
    float _3721 = -_2314;
    float _3723 = fma(_3081, _3721, _3713);
    float _3725 = _1473 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3727 = fma(_3693, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3729 = precise::clamp(_3727, 0.0, 1.0);
    int _3731 = _3715 >> 2;
    float _3733 = -_3717;
    float _3735 = -_1203;
    float _3737 = fma(_3733, _3719, _3735);
    float _3739 = -_1311;
    float _3741 = _3739 + 1.0;
    float _3743 = fma(_3729, -2.0, 3.0);
    float _3745 = _3729 * _3729;
    int _3747 = _3731 << 4;
    int _3749 = _3747 + 656;
    float _3751 = -_2306;
    float _3753 = fma(_3423, _3751, _3689);
    float _3755 = fma(_3219, _3741, _3705);
    float _3757 = _3745 * _3743;
    uint _3759 = uint(int(uint(_3749) >> uint(2)));
    uint _3761 = uint(int(uint(int(_3759)) >> uint(2)));
    int _3763 = int(_3759) & 3;
    float _3765 = (*spvDescriptorSet0.vp_c9)._m0[int(_3761)][_3763];
    int _3767 = int(_3759) + 1;
    uint _3769 = uint(int(uint(_3767) >> uint(2)));
    int _3771 = _3767 & 3;
    float _3773 = (*spvDescriptorSet0.vp_c9)._m0[int(_3769)][_3771];
    float _3775 = fma(_1687, _2326, _3737);
    float _3777 = _1473 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3779 = -_3757;
    float _3781 = _3779 + 1.0;
    float _3783 = _1473 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3785 = -_1463;
    float _3787 = fma(_3785, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3725);
    float _3789 = -_1463;
    float _3791 = fma(_3789, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3777);
    float _3793 = fma(_3781, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3757);
    out.m_78.x = _3753;
    out.m_78.y = _3755;
    out.m_78.z = _3723;
    out.m_78.w = _3775;
    int _3795 = _3749 + 8;
    uint _3797 = uint(int(uint(_3795) >> uint(2)));
    uint _3799 = uint(int(uint(int(_3797)) >> uint(2)));
    int _3801 = int(_3797) & 3;
    float _3803 = (*spvDescriptorSet0.vp_c9)._m0[int(_3799)][_3801];
    int _3805 = int(_3797) + 1;
    uint _3807 = uint(int(uint(_3805) >> uint(2)));
    int _3809 = _3805 & 3;
    float _3811 = (*spvDescriptorSet0.vp_c9)._m0[int(_3807)][_3809];
    float _3813 = -_1463;
    float _3815 = fma(_3813, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3783);
    float _3817 = _1489 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3819 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3791);
    bool _3821 = _1787 <= 8000.0;
    bool _3823 = isnan(_1787);
    bool _3825 = _3821 || _3823;
    bool _3827 = isnan(8000.0);
    bool _3829 = _3825 || _3827;
    float _3831 = float(_3829);
    float _3833 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3835 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3817);
    int _3837 = _2318 * _3589;
    int _3839 = _3837 + _2659;
    int _3841 = ~_3337;
    int _3843 = _3841 + _3407;
    int _3845 = _3843 + 1;
    float _3847 = _3831 * _3793;
    int _3849 = ~_3171;
    int _3851 = _3849 + _3265;
    int _3853 = _3851 + 1;
    float _3855 = fma(_3667, _3483, _3673);
    bool _3857 = !_2645;
    int _3859 = _3857 ? _3839 : (-1);
    float _3861 = _1489 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3863 = _1489 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3865 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3787);
    float _3867 = _1497 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3869 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3815);
    float _3871 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3861);
    float _3873 = _1497 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3875 = abs(_3315);
    float _3877 = _1497 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3879 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3867);
    float _3881 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3873);
    int _3883 = ~_3875;
    int _3885 = _3883 + 1;
    int _3887 = _3885 + 1;
    float _3889 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3877);
    float _3891 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3879);
    float _3893 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3863);
    int _3895 = abs(_3289);
    float _3897 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3881);
    bool _3899 = !_3433;
    int _3901 = _3899 ? 0 : 1;
    float _3903 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3889);
    bool _3905 = uint(_3189) >= 2u;
    float _3907 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3909 = int(_3907);
    int _3911 = ~_3895;
    int _3913 = _3911 + 1;
    int _3915 = _3913 + 1;
    int _3917 = _2358 * _3845;
    int _3919 = _3917 + _2975;
    int _3921 = _3905 ? 0 : 1;
    int _3923 = _2288 * _3853;
    int _3925 = _3923 + _2615;
    int _3927 = abs(_3901);
    int _3929 = _3887 * as_type<int>(_3773);
    int _3931 = abs(_3361);
    float _3933 = _3847 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _3935 = _3189 != 3;
    int _3937 = _3915 * as_type<int>(_3765);
    int _3939 = _3937 + _3929;
    int _3941 = abs(_3419);
    float _3943 = _3005 * _3933;
    float _3945 = precise::clamp(_3943, 0.0, 1.0);
    int _3947 = ~_3931;
    int _3949 = _3947 + 1;
    int _3951 = _3949 + 1;
    float _3953 = _2276 * _3323;
    int _3955 = ~_3941;
    int _3957 = _3955 + 1;
    int _3959 = _3957 + 1;
    float _3961 = fma(_3453, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3855);
    int _3963 = _3165 >> 31;
    int _3965 = _3951 * as_type<int>(_3803);
    int _3967 = _3965 + _3939;
    int _3969 = ~_3927;
    int _3971 = _3969 + 1;
    int _3973 = _3971 + 1;
    int _3975 = _3963 & 3;
    int _3977 = _3959 * as_type<int>(_3811);
    int _3979 = _3977 + _3967;
    int _3981 = ~_3921;
    int _3983 = _3981 + 1;
    int _3985 = _3983 + 1;
    float _3987 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3989 = _3985;
    float _3991 = _3897;
    if (_3935)
    {
        int _3993 = ~_3921;
        int _3995 = _3993 + 1;
        _3989 = _3995;
    }
    int _3997 = _3989;
    int _3999 = _3979 * _3973;
    int _4001 = _3165 + _3975;
    float _4003 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3893);
    int _4005 = abs(_3909);
    float _4007 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3871);
    bool _4009 = !_2833;
    int _4011 = _4009 ? _3579 : (-1);
    float _4013 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3835);
    float _4015 = float(uint(_3909));
    float _4017 = _3987 * _3819;
    int _4019 = _4001 >> 2;
    int _4021 = _3859 * _3927;
    int _4023 = _4021 + _3999;
    float _4025 = float(uint(_4005));
    float _4027 = 1.0 / _4015;
    int _4029 = _4011 >> 31;
    out.m_80.x = _4003;
    out.m_80.y = _4007;
    out.m_80.z = _4013;
    int _4031 = _4019 << 4;
    int _4033 = _4031 + 368;
    float _4035 = fma(_3833, _4003, _4017);
    int _4037 = _4011 & 3;
    bool _4039 = _4037 != 0;
    float _4041 = _3987 * _3865;
    int _4043 = _4011 & 3;
    bool _4045 = _4043 != 0;
    float _4047 = 1.0 / _4025;
    int _4049 = _4029 & 3;
    uint _4051 = uint(int(uint(_4033) >> uint(2)));
    uint _4053 = uint(int(uint(int(_4051)) >> uint(2)));
    int _4055 = int(_4051) & 3;
    float _4057 = (*spvDescriptorSet0.vp_c9)._m0[int(_4053)][_4055];
    int _4059 = int(_4051) + 1;
    uint _4061 = uint(int(uint(_4059) >> uint(2)));
    int _4063 = _4059 & 3;
    float _4065 = (*spvDescriptorSet0.vp_c9)._m0[int(_4061)][_4063];
    int _4067 = _4039 ? 0 : 1;
    float _4069 = fma(_3833, _4007, _4041);
    bool _4071 = uint(_4043) > 1u;
    float _4073 = _3987 * _3869;
    int _4075 = _4011 + _4049;
    out.m_82.x = _3961;
    int _4077 = as_type<int>(_4027) + (-2);
    float _4079 = fma(_3833, _4013, _4073);
    int _4081 = _4075 >> 2;
    int _4083 = abs(_4023);
    int _4085 = _4081 << 4;
    int _4087 = _4085 + 800;
    int _4089 = ~_4067;
    int _4091 = _4089 + 1;
    int _4093 = _4091 + 1;
    float _4095 = float(uint(_4023));
    uint _4097 = uint(int(uint(_4087) >> uint(2)));
    uint _4099 = uint(int(uint(int(_4097)) >> uint(2)));
    int _4101 = int(_4097) & 3;
    float _4103 = (*spvDescriptorSet0.vp_c9)._m0[int(_4099)][_4101];
    int _4105 = int(_4097) + 1;
    uint _4107 = uint(int(uint(_4105) >> uint(2)));
    int _4109 = _4105 & 3;
    float _4111 = (*spvDescriptorSet0.vp_c9)._m0[int(_4107)][_4109];
    int _4113 = _4093;
    if (!_4071)
    {
        int _4115 = ~_4067;
        int _4117 = _4115 + 1;
        _4113 = _4117;
    }
    int _4119 = _4113;
    int _4121 = as_type<int>(_4047) + (-2);
    float _4123 = as_type<float>(_4077) * _4095;
    float _4125 = float(uint(_4083));
    int _4127 = ~_3909;
    int _4129 = _4127 + 1;
    int _4131 = _4033 + 8;
    uint _4133 = uint(int(uint(_4131) >> uint(2)));
    uint _4135 = uint(int(uint(int(_4133)) >> uint(2)));
    int _4137 = int(_4133) & 3;
    float _4139 = (*spvDescriptorSet0.vp_c9)._m0[int(_4135)][_4137];
    int _4141 = int(_4133) + 1;
    uint _4143 = uint(int(uint(_4141) >> uint(2)));
    int _4145 = _4141 & 3;
    float _4147 = (*spvDescriptorSet0.vp_c9)._m0[int(_4143)][_4145];
    bool _4149 = _4043 != 3;
    float _4151 = as_type<float>(_4121) * _4125;
    float _4153 = trunc(_4123);
    float _4155 = precise::max(_4153, 0.0);
    uint _4157 = uint(_4155);
    bool _4159 = !_3191;
    int _4161 = _4159 ? 0 : 1;
    bool _4163 = uint(_4043) >= 2u;
    int _4165 = _4087 + 8;
    uint _4167 = uint(int(uint(_4165) >> uint(2)));
    uint _4169 = uint(int(uint(int(_4167)) >> uint(2)));
    int _4171 = int(_4167) & 3;
    float _4173 = (*spvDescriptorSet0.vp_c9)._m0[int(_4169)][_4171];
    int _4175 = int(_4167) + 1;
    uint _4177 = uint(int(uint(_4175) >> uint(2)));
    int _4179 = _4175 & 3;
    float _4181 = (*spvDescriptorSet0.vp_c9)._m0[int(_4177)][_4179];
    float _4183 = trunc(_4151);
    float _4185 = precise::max(_4183, 0.0);
    uint _4187 = uint(_4185);
    int _4189 = abs(_3259);
    float _4191 = fma(_3987, _3987, 1.0);
    int _4193 = _4163 ? 0 : 1;
    bool _4195 = _3189 != 3;
    int _4197 = ~_4189;
    int _4199 = _4197 + 1;
    int _4201 = _4199 + 1;
    int _4203 = _4129 * int(_4157);
    int _4205 = _4203 + _4023;
    int _4207 = ~_4005;
    int _4209 = _4207 + 1;
    float _4211 = rsqrt(_4191);
    int _4213 = ~_4193;
    int _4215 = _4213 + 1;
    int _4217 = _4215 + 1;
    int _4219 = _4201 * as_type<int>(_4065);
    int _4221 = _4217;
    if (_4149)
    {
        int _4223 = ~_4193;
        int _4225 = _4223 + 1;
        _4221 = _4225;
    }
    int _4227 = _4221;
    float _4229 = float(uint(_4205));
    int _4231 = _4209 * int(_4187);
    int _4233 = _4231 + _4083;
    bool _4235 = !_4045;
    int _4237 = _4235 ? 0 : 1;
    int _4239 = abs(_4161);
    float _4241 = as_type<float>(_4077) * _4229;
    float _4243 = float(uint(_4233));
    int _4245 = abs(_4237);
    int _4247 = abs(_4119);
    float _4249 = as_type<float>(_4121) * _4243;
    float _4251 = trunc(_4241);
    float _4253 = precise::max(_4251, 0.0);
    uint _4255 = uint(_4253);
    float _4257 = _3987 * _4211;
    int _4259 = ~_4239;
    int _4261 = _4259 + 1;
    int _4263 = _4261 + 1;
    int _4265 = abs(_3997);
    float _4267 = trunc(_4249);
    float _4269 = precise::max(_4267, 0.0);
    uint _4271 = uint(_4269);
    int _4273 = abs(_4227);
    int _4275 = _4263 * as_type<int>(_4057);
    int _4277 = _4275 + _4219;
    int _4279 = ~_4247;
    int _4281 = _4279 + 1;
    int _4283 = _4281 + 1;
    int _4285 = ~_4245;
    int _4287 = _4285 + 1;
    int _4289 = _4287 + 1;
    int _4291 = _4283 * as_type<int>(_4111);
    int _4293 = ~_4273;
    int _4295 = _4293 + 1;
    int _4297 = _4295 + 1;
    int _4299 = ~_4265;
    int _4301 = _4299 + 1;
    int _4303 = _4301 + 1;
    int _4305 = _4289 * as_type<int>(_4103);
    int _4307 = _4305 + _4291;
    bool _4309 = _4043 != 3;
    int _4311 = int(_4157) + int(_4255);
    int _4313 = _4297 * as_type<int>(_4173);
    int _4315 = _4313 + _4307;
    float _4317 = -_3891;
    float _4319 = _4257 * _4317;
    int _4321 = ~_3909;
    int _4323 = _4321 + 1;
    int _4325 = _4303 * as_type<int>(_4139);
    int _4327 = _4325 + _4277;
    bool _4329 = !_4195;
    int _4331 = _4329 ? 0 : (-1);
    float _4333 = fma(_4211, _3819, _4319);
    float _4335 = -_3897;
    float _4337 = _4257 * _4335;
    float _4339 = _3891 + _4035;
    bool _4341 = !_4309;
    int _4343 = _4341 ? 0 : (-1);
    float _4345 = fma(_4211, _3865, _4337);
    int _4347 = abs(_4331);
    float _4349 = -_3903;
    float _4351 = _4257 * _4349;
    int _4353 = abs(_4343);
    int _4355 = ~_4005;
    int _4357 = _4355 + 1;
    float _4359 = fma(_4211, _3869, _4351);
    int _4361 = _4323 * _4311;
    int _4363 = _4361 + _4023;
    int _4365 = int(_4187) + int(_4271);
    out.m_84.x = _4333;
    out.m_84.y = _4345;
    out.m_84.z = _4359;
    int _4367 = ~_4347;
    int _4369 = _4367 + 1;
    int _4371 = _4369 + 1;
    bool _4373 = uint(_4363) >= uint(_3909);
    int _4375 = _4357 * _4365;
    int _4377 = _4375 + _4083;
    int _4379 = ~_4353;
    int _4381 = _4379 + 1;
    int _4383 = _4381 + 1;
    int _4385 = _4371 * as_type<int>(_4147);
    int _4387 = _4385 + _4327;
    bool _4389 = !_3429;
    int _4391 = _4389 ? 0 : 1;
    bool _4393 = !_4373;
    int _4395 = _4393 ? 0 : (-1);
    int _4397 = _4383 * as_type<int>(_4181);
    int _4399 = _4397 + _4315;
    int _4401 = _4023 ^ _3909;
    bool _4403 = uint(_4377) >= uint(_4005);
    int _4405 = abs(_4391);
    float _4407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    uint _4409 = uint(int(uint(_4401) >> uint(31)));
    int _4411 = ~_4311;
    int _4413 = _4411 + _4395;
    int _4415 = _4413 + 1;
    bool _4417 = !_4403;
    int _4419 = _4417 ? 0 : (-1);
    bool _4421 = !_3441;
    int _4423 = _4421 ? 0 : 1;
    int _4425 = _3909 * _4415;
    int _4427 = _4425 + _4023;
    int _4429 = ~_4405;
    int _4431 = _4429 + 1;
    int _4433 = _4431 + 1;
    int _4435 = ~_4419;
    int _4437 = _4365 + _4435;
    int _4439 = _4437 + 1;
    int _4441 = ~int(_4409);
    int _4443 = _4441 + 1;
    int _4445 = _4387 * _4433;
    bool _4447 = _3909 == 0;
    float _4449 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _4451 = _3909 == 0;
    int _4453 = abs(_4423);
    int _4455 = _4439 ^ _4443;
    bool _4457 = !_4447;
    int _4459 = _4457 ? _4427 : (-1);
    int _4461 = ~_4453;
    int _4463 = _4461 + 1;
    int _4465 = _4463 + 1;
    int _4467 = ~_4443;
    int _4469 = _4467 + _4455;
    int _4471 = _4469 + 1;
    float _4473 = float(_4459);
    float _4475 = _4407 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _4477 = _4399 * _4465;
    bool _4479 = !_2585;
    int _4481 = _4479 ? _3925 : (-1);
    float _4483 = _1041 + 0.5;
    bool _4485 = !_4451;
    int _4487 = _4485 ? _4471 : (-1);
    float _4489 = fma(_4475, _4473, _1337);
    bool _4491 = !_2833;
    int _4493 = _4491 ? _3919 : (-1);
    int _4495 = _4481 * _4405;
    int _4497 = _4495 + _4445;
    float _4499 = float(_4487);
    float _4501 = _4449 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _4503 = in.m_86.x;
    float _4505 = fma(_4475, _4483, _4489);
    float _4507 = _919 + (-0.5);
    float _4509 = -_1339;
    float _4511 = fma(_4501, _4499, _4509);
    float _4513 = _2193 * 0.5;
    int _4515 = _4493 * _4453;
    int _4517 = _4515 + _4477;
    float _4519 = _3897 + _4069;
    float _4521 = -_4501;
    float _4523 = fma(_4521, _4507, _4511);
    float _4525 = -_2354;
    float _4527 = fma(_1041, _4525, _4505);
    float _4529 = float(_4497);
    float _4531 = -_1315;
    float _4533 = _4531 + 1.0;
    float _4535 = _2370 + _2193;
    float _4537 = _2221 + _2193;
    out.m_88.x = _4529;
    float _4539 = _4535 * 0.5;
    float _4541 = _4537 * 0.5;
    float _4543 = fma(_2227, -0.5, _4513);
    float _4545 = float(_4517);
    float _4547 = _3903 + _4079;
    out.m_90.x = _2280;
    out.m_90.y = _2282;
    out.m_90.z = _2284;
    bool _4549 = _1937 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4551 = isnan(_1937);
    bool _4553 = _4549 || _4551;
    bool _4555 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4557 = _4553 || _4555;
    float _4559 = fma(_919, _4533, _4523);
    out.m_92.x = _4541;
    out.m_92.y = _4543;
    out.m_92.z = _4539;
    out.m_92.w = _2193;
    float _4561 = _1911 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4563 = -_3945;
    float _4565 = fma(_4563, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_88.w = _4545;
    float _4567 = _4565 * _4503;
    out.m_94.x = _4339;
    out.m_94.y = _4519;
    out.m_94.z = _4547;
    float _4569 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _4571 = _4559;
    float _4573 = _4527;
    if (!_4557)
    {
        _2631 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4575 = _2631;
    float _4577 = _4567 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_96.x = _4527;
    out.m_96.y = _4559;
    float _4579 = _2266 * _3323;
    float _4581 = _2266 * _3327;
    float _4583 = fma(_2266, _3953, _2264);
    out.m_98.x = _4577;
    float _4585 = fma(_2272, _4579, _2260);
    float _4587 = fma(_2274, _4579, _2262);
    float _4589 = _4575;
    float _4591 = _4575;
    if (!_4557)
    {
        _2633 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4593 = _2633;
    float _4595 = _4593;
    float _4597 = _4593;
    if (!_4557)
    {
        _3991 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4599 = _3991;
    out.m_100.x = _4585;
    out.m_100.y = _4587;
    out.m_100.z = _4583;
    out.m_100.w = _4581;
    float _4601 = _4599;
    float _4603 = _4599;
    if (!_4557)
    {
        _4569 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4605 = _4569;
    float _4607 = _4605;
    float _4609 = _4605;
    if (!_4557)
    {
        _4571 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4611 = _4571;
    float _4613 = _4611;
    float _4615 = _4611;
    if (!_4557)
    {
        _4573 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4617 = _4573;
    bool _4619 = !_4557;
    float _4621 = _4617;
    float _4623 = _4617;
    if (!_4619)
    {
        bool _4625 = _1937 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4627 = isnan(_1937);
        bool _4629 = _4625 || _4627;
        bool _4631 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4633 = _4629 || _4631;
        if (!_4633)
        {
            float _4635 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4637 = _1937 + _4635;
            float _4639 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4641 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4639;
            float _4643 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4645 = _4643 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4647 = 1.0 / _4641;
            float _4649 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4651 = _4649 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4653 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4655 = _4653 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4657 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4659 = _4657 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4661 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4663 = _4661 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4665 = _4637 * _4647;
            float _4667 = precise::clamp(_4665, 0.0, 1.0);
            float _4669 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4671 = _4669 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4673 = fma(_4667, _4645, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4675 = fma(_4667, _4671, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4677 = fma(_4667, _4651, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4679 = fma(_4667, _4655, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4681 = fma(_4667, _4659, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4683 = fma(_4667, _4663, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4597 = _4677;
            _4615 = _4681;
            _4591 = _4673;
            _4609 = _4679;
            _4603 = _4675;
            _4623 = _4683;
            _4685 = true;
        }
        else
        {
            bool _4687 = _1937 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4689 = isnan(_1937);
            bool _4691 = _4687 || _4689;
            bool _4693 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4695 = _4691 || _4693;
            if (!_4695)
            {
                _4589 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4697 = _4589;
            _4591 = _4697;
            if (!_4695)
            {
                _4595 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4699 = _4595;
            _4597 = _4699;
            if (!_4695)
            {
                _4601 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4701 = _4601;
            _4603 = _4701;
            if (!_4695)
            {
                _4607 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4703 = _4607;
            _4609 = _4703;
            if (!_4695)
            {
                _4613 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4705 = _4613;
            _4615 = _4705;
            if (!_4695)
            {
                _4621 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4707 = _4621;
            bool _4709 = !_4695;
            _4623 = _4707;
            if (!_4709)
            {
                bool _4711 = _1937 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4713 = isnan(_1937);
                bool _4715 = _4711 || _4713;
                bool _4717 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4719 = _4715 || _4717;
                if (!_4719)
                {
                    float _4721 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4723 = _1937 + _4721;
                    float _4725 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4727 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4725;
                    float _4729 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4731 = _4729 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4733 = 1.0 / _4727;
                    float _4735 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4737 = _4735 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4739 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4741 = _4739 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4743 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4745 = _4743 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4747 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4749 = _4747 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4751 = _4723 * _4733;
                    float _4753 = precise::clamp(_4751, 0.0, 1.0);
                    float _4755 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4757 = _4755 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4759 = fma(_4753, _4731, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4761 = fma(_4753, _4757, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4763 = fma(_4753, _4737, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4765 = fma(_4753, _4741, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4767 = fma(_4753, _4745, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4769 = fma(_4753, _4749, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4597 = _4763;
                    _4615 = _4767;
                    _4591 = _4759;
                    _4609 = _4765;
                    _4603 = _4761;
                    _4623 = _4769;
                    _4685 = true;
                }
                else
                {
                    _4597 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4615 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4591 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4609 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4603 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4623 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4685 = false;
    float _4771 = _4597;
    float _4773 = _4615;
    float _4775 = _4591;
    float _4777 = _4609;
    float _4779 = _4603;
    float _4781 = _4623;
    float _4783 = _4561 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4785 = fma(_4519, -0.5, 0.5);
    float _4787 = precise::clamp(_4785, 0.0, 1.0);
    float _4789 = -_4771;
    float _4791 = _4789 + _4773;
    float _4793 = -_4775;
    float _4795 = _4793 + _4777;
    out.m_102.x = 0.0;
    float _4797 = fma(_4787, _4791, _4771);
    float _4799 = -_4779;
    float _4801 = _4799 + _4781;
    float _4803 = fma(_4787, _4795, _4775);
    float _4805 = _4797 * 0.586610972881317138671875;
    bool _4807 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4809 = fma(_4787, _4801, _4779);
    out.m_55.x = _4783;
    float _4811 = fma(_4803, 0.298911988735198974609375, _4805);
    bool _4813 = _1911 > 0.0;
    bool _4815 = isnan(_1911);
    bool _4817 = _4813 || _4815;
    bool _4819 = isnan(0.0);
    bool _4821 = _4817 || _4819;
    float _4823 = fma(_4809, 0.114477999508380889892578125, _4811);
    float _4825 = -_4823;
    float _4827 = _4803 + _4825;
    float _4829 = -_4823;
    float _4831 = _4797 + _4829;
    float _4833 = -_4823;
    float _4835 = _4809 + _4833;
    float _4837 = fma(_4827, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4823);
    float _4839 = fma(_4831, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4823);
    float _4841 = fma(_4835, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4823);
    bool _4843 = !_4807;
    if (!_4843)
    {
        float _4845 = -_1849;
        float _4847 = _4845 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4849 = -_1851;
        float _4851 = _4849 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4853 = -_1853;
        float _4855 = _4853 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4857 = _4847 * _4847;
        float _4859 = fma(_4851, _4851, _4857);
        float _4861 = fma(_4855, _4855, _4859);
        float _4863 = sqrt(_4861);
        float _4865 = rsqrt(_4861);
        float _4867 = -_4863;
        float _4869 = _4867 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4871 = _4869 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4873 = precise::clamp(_4871, 0.0, 1.0);
        float _4875 = _4851 * _4865;
        float _4877 = _4847 * _4865;
        float _4879 = abs(_4873);
        float _4881 = log2(_4879);
        float _4883 = _4855 * _4865;
        float _4885 = _4875 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4887 = _4519 * _4877;
        float _4889 = -_4877;
        float _4891 = -_4885;
        float _4893 = fma(_4889, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4891);
        float _4895 = fma(_4339, _4875, _4887);
        float _4897 = -_4883;
        float _4899 = fma(_4897, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4893);
        float _4901 = fma(_4547, _4883, _4895);
        float _4903 = precise::clamp(_4901, 0.0, 1.0);
        float _4905 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4907 = _4899 + _4905;
        float _4909 = _4881 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4911 = _4907 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4913 = precise::clamp(_4911, 0.0, 1.0);
        float _4915 = exp2(_4909);
        float _4917 = _4915 * _4913;
        float _4919 = _4903 * _4917;
        float _4921 = _4919 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4923 = _4919 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4925 = _4919 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_102.x = _4921;
        out.m_102.y = _4923;
        out.m_102.z = _4925;
    }
    out.m_104.x = _4837;
    out.m_104.y = _4839;
    out.m_104.z = _4841;
    if (_4821)
    {
        return out;
    }
    out.m_55.x = 0.0;
    float _4927 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4927;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4685 = false;
    bool _499 = false;
    bool _317 = false;
    bool _221 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _118 = in.m_48.w;
    float _120 = in.m_50.w;
    float _122 = trunc(_118);
    int _125 = int(_122);
    float _127 = -_120;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _129;
    bool _133 = _125 >= 1;
    float _135 = 0.0;
    float _137 = _120;
    float _139 = _129;
    if (!_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _135;
    if (!_133)
    {
        out.m_55.x = 0.0;
    }
    int _143 = 0;
    if (!_133)
    {
        float _145 = _141 * 5.0;
        _143 = as_type<int>(_145);
    }
    int _147 = _143;
    if (!_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4994 = as_type<float>(_147);
        out.gl_Position.z = _4994;
    }
    if (!_133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _149 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _151 = isnan(_120);
    bool _153 = _149 || _151;
    bool _155 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _157 = _153 || _155;
    float _159 = float(_125);
    bool _161 = _129 >= _159;
    bool _163 = !_157;
    bool _165 = _161 || _163;
    float _167 = 1.0 / _159;
    if (_165)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _137;
    if (_165)
    {
        out.m_55.x = 0.0;
    }
    float _171 = _129 * _167;
    int _173 = 0;
    float _175 = _171;
    if (_165)
    {
        float _177 = _169 * 5.0;
        _173 = as_type<int>(_177);
    }
    int _179 = _173;
    out.m_53.x = _171;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5057 = as_type<float>(_179);
        out.gl_Position.z = _5057;
    }
    if (_165)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _181 = as_type<float>(int(gl_VertexIndex));
    bool _183 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _185 = as_type<int>(_181) & 1;
    bool _187 = _185 != 0;
    int _189 = as_type<int>(_181) & 2;
    bool _191 = _189 != 0;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_191;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_183;
    float _219;
    if (!_201)
    {
        float _203 = in.m_60.x;
        float _205 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _207 = _203 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _209 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _211 = _209 * _205;
        float _213 = floor(_211);
        float _215 = -_213;
        float _217 = _211 + _215;
        _219 = _217;
        _221 = true;
    }
    else
    {
        _219 = _171;
    }
    _221 = false;
    float _223 = _219;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _227 = _223 + _225;
    bool _229 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _231 = isnan(_223);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _241;
    float _245 = -_239;
    float _247 = _245 + 1.0;
    bool _249 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _251 = isnan(_223);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _257 = _253 || _255;
    float _259 = float(_257);
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _261;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _267 = 1.0 / _243;
    float _269 = _259 * _247;
    float _271 = -_259;
    float _273 = _271 + 1.0;
    float _275 = _227 * _267;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _277;
    float _281 = fma(_263, _275, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _283 = fma(_279, _275, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _285 = _281 * _269;
    float _287 = _283 * _269;
    float _289 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[143].x, _285);
    float _291 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[143].y, _287);
    float _293 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[144].x, _289);
    float _295 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[144].y, _291);
    bool _297 = !_265;
    float _315;
    if (!_297)
    {
        float _299 = in.m_60.x;
        float _301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _303 = _299 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _307 = _305 * _301;
        float _309 = floor(_307);
        float _311 = -_309;
        float _313 = _307 + _311;
        _315 = _313;
        _317 = true;
    }
    else
    {
        _315 = _171;
    }
    _317 = false;
    float _319 = _315;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _323 = _319 + _321;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _333 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _335 = isnan(_319);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _349 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _351 = isnan(_319);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = 1.0 / _327;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _363;
    float _367 = -_343;
    float _369 = _367 + 1.0;
    bool _371 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _373 = isnan(_319);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    bool _383 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _385 = 1.0 / _331;
    float _387 = 1.0 / _347;
    float _389 = _365 * _361;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _393 = _391 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _395 = _359 * _369;
    float _397 = -_359;
    float _399 = _397 + 1.0;
    float _401 = fma(_389, _323, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _403 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _405 = isnan(_319);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = _381 * _399;
    float _417 = _393 * _385;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _421 = _319 + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _423;
    float _427 = _401 * _415;
    float _429 = -_381;
    float _431 = _429 + 1.0;
    float _433 = fma(_417, _421, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _435 = -_413;
    float _437 = _435 + 1.0;
    float _439 = _425 * _387;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _443 = _319 + _441;
    float _445 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[115].x, _427);
    float _447 = _343 * _437;
    float _449 = in.m_62.x;
    float _451 = in.m_62.y;
    float _453 = fma(_439, _443, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _455 = fma(_433, _395, _445);
    float _457 = fma(_453, _447, _455);
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _461 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[118].x, _457);
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _467 = _459 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _469 = _461 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _471 = _463 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _473 = _465 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_64.x = _467;
    out.m_64.y = _471;
    out.m_64.z = _473;
    out.m_64.w = _469;
    float _475 = _295 * _451;
    float _477 = _293 * _449;
    bool _479 = !_383;
    float _497;
    if (!_479)
    {
        float _481 = in.m_60.x;
        float _483 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _485 = _481 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _487 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[11].w, _129);
        float _489 = _487 * _483;
        float _491 = floor(_489);
        float _493 = -_491;
        float _495 = _489 + _493;
        _497 = _495;
        _499 = true;
    }
    else
    {
        _497 = _171;
    }
    _499 = false;
    float _501 = _497;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _505 = _501 + _503;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _515 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _517 = isnan(_501);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _531 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _533 = isnan(_501);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = 1.0 / _509;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _545;
    float _549 = -_525;
    float _551 = _549 + 1.0;
    bool _553 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _555 = isnan(_501);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    bool _565 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _567 = 1.0 / _513;
    float _569 = 1.0 / _529;
    float _571 = _547 * _543;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _577 = _541 * _551;
    float _579 = -_541;
    float _581 = _579 + 1.0;
    float _583 = fma(_571, _505, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _585 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _587 = isnan(_501);
    bool _589 = _585 || _587;
    bool _591 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _593 = _589 || _591;
    int _595 = _593 ? 1065353216 : 0;
    float _597 = _563 * _581;
    float _599 = _575 * _567;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _603 = _501 + _601;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _605;
    float _609 = _583 * _597;
    float _611 = -_563;
    float _613 = _611 + 1.0;
    float _615 = fma(_599, _603, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _617 = -as_type<float>(_595);
    float _619 = _617 + 1.0;
    float _621 = _607 * _569;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _625 = _501 + _623;
    float _627 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[131].x, _609);
    float _629 = _525 * _619;
    float _631 = fma(_621, _625, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _633 = fma(_615, _577, _627);
    float _635 = fma(_631, _629, _633);
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _643 = fma(as_type<float>(_595), (*spvDescriptorSet0.vp_c9)._m0[134].x, _635);
    float _645 = _639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _647 = _637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _649 = _641 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _651 = _643 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_66.x = _645;
    out.m_66.y = _649;
    out.m_66.z = _647;
    out.m_66.w = _651;
    bool _653 = !_565;
    float _655 = _643;
    int _657 = as_type<int>(_645);
    int _659 = _595;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    if (!_653)
    {
        float _663 = in.m_60.x;
        float _665 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _667 = _663 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _669 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[14].x, _129);
        float _671 = _669 * _665;
        float _673 = floor(_671);
        float _675 = -_673;
        float _677 = _671 + _675;
        _655 = _673;
        _175 = _677;
    }
    float _679 = _655;
    float _681 = _175;
    float _683 = in.m_60.z;
    float _685 = in.m_60.w;
    int _687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _689 = _687 != 0;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _693 = _679;
    if (_689)
    {
        float _695 = in.m_60.x;
        float _697 = in.m_60.y;
        _691 = _695;
        _693 = _697;
    }
    float _699 = _691;
    float _701 = _693;
    float _703 = 0.0;
    if (_689)
    {
        _703 = 1.0;
    }
    float _705 = _703;
    float _707 = 0.0;
    float _709 = _705;
    if (_689)
    {
        _707 = 1.0;
    }
    float _711 = _707;
    float _713 = _711;
    if (_689)
    {
        _657 = 0;
    }
    int _715 = _657;
    float _717 = _683 * 2.0;
    int _719 = _715;
    if (_689)
    {
        _659 = 0;
    }
    int _721 = _659;
    float _723 = floor(_717);
    float _725 = 0.0;
    float _727 = _701;
    float _729 = _699;
    int _731 = _721;
    if (_689)
    {
        _725 = _699;
    }
    float _733 = _725;
    bool _735 = _723 > 0.0;
    bool _737 = _723 >= 0.0;
    bool _739 = isnan(_723);
    bool _741 = _737 || _739;
    bool _743 = isnan(0.0);
    bool _745 = _741 || _743;
    float _747 = _723;
    float _749 = _733;
    if (_689)
    {
        _661 = _733;
    }
    float _751 = _661;
    float _753 = _745 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _755 = _753;
    float _757 = _751;
    if (_689)
    {
        _747 = _733;
    }
    float _759 = _747;
    int _761 = ~as_type<int>(_753);
    int _763 = _761 + 1;
    int _765 = _763 + 1;
    int _767 = _765;
    float _769 = _759;
    if (!_735)
    {
        int _771 = ~as_type<int>(_753);
        int _773 = _771 + 1;
        _767 = _773;
    }
    int _775 = _767;
    if (_689)
    {
        _755 = _701;
    }
    float _777 = _755;
    float _779 = _777;
    if (!_689)
    {
        float _781 = in.m_60.x;
        float _783 = in.m_60.y;
        float _785 = in.m_60.z;
        float _787 = _781 * 3.1415927410125732421875;
        float _789 = _787 * 0.15915493667125701904296875;
        float _791 = _783 * 3.1415927410125732421875;
        float _793 = _791 * 0.15915493667125701904296875;
        float _795 = _789 * 6.283185482025146484375;
        float _797 = sin(_795);
        float _799 = _793 * 6.283185482025146484375;
        float _801 = sin(_799);
        _757 = _797;
        _727 = _783;
        _719 = 1;
        _729 = _781;
        _731 = 2;
        _779 = _801;
        _713 = 5.839270114898681640625;
        _769 = _785;
        _709 = 7.345489978790283203125;
        _749 = _783;
    }
    float _803 = _757;
    float _805 = _727;
    int _807 = _719;
    float _809 = _729;
    int _811 = _731;
    float _813 = _779;
    float _815 = _713;
    float _817 = _769;
    float _819 = _709;
    float _821 = _749;
    float _823 = _803 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _825 = _805 * 2.0;
    bool _827 = _807 != 1;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _833 = floor(_825);
    float _835 = _809 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _837 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[93].z, _831);
    float _839 = _809 * 2.0;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _843 = _811 != 2;
    float _845 = floor(_839);
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    bool _849 = _683 > 0.5;
    float _851 = _805 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _853 = -_829;
    float _855 = fma(_835, 2.0, _853);
    float _857 = -_847;
    float _859 = fma(_823, 2.0, _857);
    int _861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _863 = _861 != 0;
    int _865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _867 = _865 != 0;
    int _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _871 = _869 != 0;
    float _873 = fma(_851, -2.0, _841);
    float _875 = -_199;
    float _877 = _849 ? _875 : _199;
    float _879 = _813 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _881 = int(_843);
    int _883 = _827 ? 2 : 0;
    int _885 = _881 | _883;
    int _887 = _849 ? 4 : 0;
    int _889 = _885 | _887;
    int _891 = _863 ? 8 : 0;
    int _893 = _889 | _891;
    int _895 = _867 ? 16 : 0;
    int _897 = _893 | _895;
    int _899 = _871 ? 32 : 0;
    int _901 = _897 | _899;
    int _903 = false ? 64 : 0;
    int _905 = _901 | _903;
    int _907 = _905 & 4;
    float _909 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _911 = log2(_909);
    bool _913 = _805 > 0.5;
    float _915 = _805 + _809;
    bool _917 = !_871;
    float _919 = _917 ? _199 : _877;
    float _921 = _167 * _129;
    float _923 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[92].z, _837);
    float _925 = _851;
    float _927 = _877;
    float _929 = _823;
    float _931 = _835;
    float _933 = _839;
    float _935 = _813;
    if (!_827)
    {
        _925 = _683;
    }
    float _937 = _925;
    float _939 = -_129;
    float _941 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[76].x, _855);
    float _943 = _937;
    if (!_827)
    {
        _927 = _683;
    }
    float _945 = _927;
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _949 = _945;
    if (!_827)
    {
        _929 = _805;
    }
    float _951 = _929;
    float _953 = -_129;
    float _955 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[91].x, _859);
    float _957 = _951;
    if (!_827)
    {
        _931 = _805;
    }
    float _959 = _931;
    float _961 = fma(_879, -2.0, _947);
    int _963 = int(_843);
    int _965 = _827 ? 2 : 0;
    int _967 = _963 | _965;
    int _969 = _913 ? 4 : 0;
    int _971 = _967 | _969;
    int _973 = _863 ? 8 : 0;
    int _975 = _971 | _973;
    int _977 = _867 ? 16 : 0;
    int _979 = _975 | _977;
    int _981 = _871 ? 32 : 0;
    int _983 = _979 | _981;
    int _985 = false ? 64 : 0;
    int _987 = _983 | _985;
    int _989 = _987 & 4;
    float _991 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _993 = int(_991);
    float _995 = -_195;
    int _997 = _913 ? as_type<int>(_995) : as_type<int>(_195);
    float _999 = _911 * _129;
    float _1001 = _959;
    float _1003 = as_type<float>(_989);
    if (_827)
    {
        _943 = _805;
    }
    float _1005 = _943;
    float _1007 = _477 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (_827)
    {
        _949 = _805;
    }
    float _1009 = _949;
    float _1011 = _475 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    if (_827)
    {
        _957 = _809;
    }
    float _1013 = _957;
    float _1015 = exp2(_999);
    if (_827)
    {
        _1001 = _809;
    }
    float _1017 = _1001;
    bool _1019 = _845 >= 0.0;
    bool _1021 = isnan(_845);
    bool _1023 = _1019 || _1021;
    bool _1025 = isnan(0.0);
    bool _1027 = _1023 || _1025;
    bool _1029 = _833 >= 0.0;
    bool _1031 = isnan(_833);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan(0.0);
    bool _1037 = _1033 || _1035;
    bool _1039 = !_867;
    float _1041 = _1039 ? _195 : as_type<float>(_997);
    float _1043 = _915 + (-1.0);
    int _1045 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1047 = _1045 != 0;
    int _1049 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1051 = _1049 != 0;
    int _1053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1055 = _1053 != 0;
    float _1057 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1059 = int(_1057);
    float _1061 = -_1015;
    float _1063 = _1061 + 1.0;
    bool _1065 = !_1051;
    float _1067 = _1065 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1069 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1071 = !_1047;
    int _1073 = _1071 ? 0 : 1;
    float _1075 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1077 = !_1055;
    int _1079 = _1077 ? 0 : 1;
    int _1081 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1083 = _1081 != 0;
    int _1085 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1087 = _1085 != 0;
    int _1089 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1091 = _1089 != 0;
    bool _1093 = !_1087;
    int _1095 = _1093 ? 0 : 1;
    float _1097 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1099 = !_1083;
    int _1101 = _1099 ? 0 : 1;
    bool _1103 = !_1091;
    int _1105 = _1103 ? 0 : 1;
    float _1107 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1097);
    float _1109 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1111 = int(_1109);
    int _1113 = _1027 ? 0 : 1;
    int _1115 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1117 = _1115 != 0;
    int _1119 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1121 = _1119 != 0;
    int _1123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1125 = _1123 != 0;
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    bool _1129 = _833 > 0.0;
    float _1131 = fma(_1017, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1075);
    float _1133 = _1013 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1135 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1137 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1127);
    float _1139 = _1067;
    if (_843)
    {
        _933 = _809;
    }
    float _1141 = _933;
    float _1143 = -_1135;
    float _1145 = fma(_1133, 2.0, _1143);
    float _1147 = _1141;
    if (!_843)
    {
        _1147 = _683;
    }
    float _1149 = _1147;
    float _1151 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1153 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_843)
    {
        _935 = _805;
    }
    float _1155 = _935;
    float _1157 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1137);
    bool _1159 = !_1117;
    int _1161 = _1159 ? 0 : 1;
    float _1163 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1165 = _1155;
    if (!_843)
    {
        _1165 = _809;
    }
    float _1167 = _1165;
    float _1169 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1107);
    bool _1171 = _845 > 0.0;
    float _1173 = fma(_1153, -2.0, _1151);
    float _1175 = float(_993);
    float _1177 = -_129;
    float _1179 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1145);
    float _1181 = 1.0 / _1175;
    int _1183 = abs(_1161);
    float _1185 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1187 = float(_775);
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1191 = float(_1059);
    float _1193 = -_1185;
    float _1195 = fma(_1163, 2.0, _1193);
    int _1197 = ~_1113;
    int _1199 = _1197 + 1;
    int _1201 = _1199 + 1;
    float _1203 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1173);
    float _1205 = _1167 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1207 = float(_1183);
    float _1209 = 1.0 / _1191;
    int _1211 = _1201;
    if (!_1171)
    {
        int _1213 = ~_1113;
        int _1215 = _1213 + 1;
        _1211 = _1215;
    }
    int _1217 = _1211;
    float _1219 = fma(_1205, -2.0, _1189);
    bool _1221 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1223 = isnan(0.0);
    bool _1225 = _1221 || _1223;
    bool _1227 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1229 = _1225 || _1227;
    float _1231 = _1207 * _1187;
    float _1233 = float(_1111);
    float _1235 = _1181 * _129;
    float _1237 = in.m_68.x;
    float _1239 = in.m_68.y;
    float _1241 = in.m_68.z;
    float _1243 = 1.0 / _1233;
    float _1245 = _1229 ? _1063 : 0.0;
    float _1247 = _1231 * (-2.0);
    bool _1249 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1251 = isnan(1.0);
    bool _1253 = _1249 || _1251;
    bool _1255 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1257 = _1253 || _1255;
    float _1259 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1261 = 1.0 + _1259;
    float _1263 = fma(_1069, _1247, _1069);
    float _1265 = 1.0 / _1261;
    float _1267 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1269 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _1271 = !_1121;
    int _1273 = _1271 ? 0 : 1;
    float _1275 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1277 = _1037 ? 0 : 1;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1281 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1267);
    int _1283 = abs(_1273);
    float _1285 = _1209 * _129;
    float _1287 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1269);
    float _1289 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1275);
    float _1291 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1279);
    int _1293 = ~_1277;
    int _1295 = _1293 + 1;
    int _1297 = _1295 + 1;
    float _1299 = _809 + (-0.5);
    float _1301 = fma(_1247, _1237, _1237);
    int _1303 = _1297;
    if (!_1129)
    {
        int _1305 = ~_1277;
        int _1307 = _1305 + 1;
        _1303 = _1307;
    }
    int _1309 = _1303;
    float _1311 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1281);
    float _1313 = float(_1217);
    float _1315 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1287);
    bool _1317 = !_1125;
    int _1319 = _1317 ? 0 : 1;
    float _1321 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _873);
    float _1323 = float(_1283);
    float _1325 = _1243 * _129;
    float _1327 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1289);
    float _1329 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1291);
    float _1331 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[91].y, _961);
    float _1333 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1131);
    float _1335 = -_129;
    float _1337 = fma(_1335, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1195);
    float _1339 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1219);
    if (_1257)
    {
        float _1341 = _1245 * _1265;
        _139 = _1341;
    }
    float _1343 = _139;
    float _1345 = fma(_1299, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1301);
    int _1347 = abs(_1319);
    float _1349 = _1323 * _1313;
    float _1351 = _805 + _683;
    float _1353 = fma(_1263, _1343, _1345);
    float _1355 = _1349 * (-2.0);
    float _1357 = _1351 + (-1.0);
    float _1359 = float(_1309);
    float _1361 = fma(_1355, _1239, _1239);
    float _1363 = float(_1347);
    float _1365 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1367 = _805 + (-0.5);
    float _1369 = _809 + _683;
    float _1371 = _683 + (-0.5);
    float _1373 = _1363 * _1359;
    float _1375 = fma(_1367, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1361);
    float _1377 = _1369 + (-1.0);
    float _1379 = _1373 * (-2.0);
    float _1381 = fma(_1365, _1355, _1365);
    float _1383 = _1353 * 0.15915493667125701904296875;
    float _1385 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1387 = fma(_1379, _1241, _1241);
    float _1389 = fma(_1381, _1343, _1375);
    float _1391 = _1383 * 6.283185482025146484375;
    float _1393 = sin(_1391);
    float _1395 = fma(_1385, _1379, _1385);
    float _1397 = fma(_1371, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1387);
    float _1399 = _1389 * 0.15915493667125701904296875;
    float _1401 = in.m_48.x;
    float _1403 = in.m_48.y;
    float _1405 = in.m_48.z;
    bool _1407 = _685 > 0.5;
    float _1409 = fma(_1395, _1343, _1397);
    float _1411 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1413 = in.m_70.x;
    float _1415 = in.m_70.y;
    float _1417 = in.m_70.z;
    float _1419 = in.m_70.w;
    float _1421 = _1383 * 6.283185482025146484375;
    float _1423 = cos(_1421);
    float _1425 = _1409 * 0.15915493667125701904296875;
    float _1427 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _1429 = _1007 * _1411;
    float _1431 = _1011 * _1427;
    float _1433 = _1399 * 6.283185482025146484375;
    float _1435 = sin(_1433);
    float _1437 = in.m_72.x;
    float _1439 = in.m_72.y;
    float _1441 = in.m_72.z;
    float _1443 = in.m_72.w;
    float _1445 = _1399 * 6.283185482025146484375;
    float _1447 = cos(_1445);
    float _1449 = _1403 * _1415;
    float _1451 = _1425 * 6.283185482025146484375;
    float _1453 = cos(_1451);
    float _1455 = _1393 * _1435;
    float _1457 = fma(_1401, _1413, _1449);
    float _1459 = fma(_1405, _1417, _1457);
    float _1461 = _1425 * 6.283185482025146484375;
    float _1463 = sin(_1461);
    float _1465 = _1423 * _1447;
    float _1467 = _1393 * _1447;
    float _1469 = _1403 * _1439;
    float _1471 = fma(_1401, _1437, _1469);
    float _1473 = _1423 * _1453;
    float _1475 = _1423 * _1435;
    float _1477 = _1393 * _1453;
    float _1479 = _1447 * _1453;
    float _1481 = _1473 * _1431;
    float _1483 = _1435 * _1453;
    float _1485 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1487 = fma(_1405, _1441, _1471);
    float _1489 = fma(_1463, _1465, _1455);
    float _1491 = -_1431;
    float _1493 = _1463 * _1491;
    float _1495 = -_1467;
    float _1497 = fma(_1463, _1475, _1495);
    float _1499 = -_1475;
    float _1501 = fma(_1463, _1467, _1499);
    float _1503 = fma(_1489, _1429, _1481);
    float _1505 = _1477 * _1431;
    float _1507 = fma(_1479, _1429, _1493);
    float _1509 = _1487 + _1443;
    float _1511 = fma(_1497, _1485, _1503);
    float _1513 = fma(_1463, _1455, _1465);
    float _1515 = fma(_1501, _1429, _1505);
    float _1517 = fma(_1483, _1485, _1507);
    float _1519 = _1511 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1521 = _1511 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1523 = fma(_1513, _1485, _1515);
    float _1525 = _1459 + _1419;
    float _1527 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1519);
    float _1529 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1521);
    float _1531 = _1511 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1533 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1527);
    float _1535 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1529);
    float _1537 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1531);
    float _1539 = _1533 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1541 = _1535 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1543 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1537);
    float _1545 = in.m_74.x;
    float _1547 = in.m_74.y;
    float _1549 = in.m_74.z;
    float _1551 = in.m_74.w;
    float _1553 = _1525 + _1539;
    float _1555 = _1509 + _1541;
    float _1557 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1559 = _1553 + _1557;
    float _1561 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1563 = _1555 + _1561;
    float _1565 = _1559 * _1559;
    float _1567 = fma(_1563, _1563, _1565);
    float _1569 = sqrt(_1567);
    float _1571 = _1403 * _1547;
    float _1573 = fma(_1401, _1545, _1571);
    float _1575 = fma(_1405, _1549, _1573);
    bool _1577 = _1569 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1579 = _1575 + _1551;
    float _1581 = _1579 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1583 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1581);
    float _1585 = _1403;
    float _1587 = _1545;
    float _1589 = _1551;
    float _1591 = _1523;
    float _1593 = _1555;
    float _1595 = _1553;
    float _1597 = _1567;
    float _1599 = _1579;
    if (_1577)
    {
        float _1601 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1585 = _1601;
    }
    float _1603 = _1585;
    float _1605 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1583);
    float _1607 = _1605 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1609 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1611 = _1569 + _1609;
    float _1613 = _1611;
    if (_1577)
    {
        float _1615 = rsqrt(_1567);
        _1587 = _1615;
    }
    float _1617 = _1587;
    float _1619 = _1617;
    if (_1577)
    {
        float _1621 = _1611 * _1603;
        _1613 = _1621;
    }
    float _1623 = _1613;
    float _1625 = 1.0 / _1607;
    float _1627 = _1543 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    if (_1577)
    {
        float _1629 = _1623 * 0.15915493667125701904296875;
        _1589 = _1629;
    }
    float _1631 = _1589;
    float _1633 = _1579 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1635 = _1579 + _1627;
    float _1637 = _1405;
    float _1639 = _1635;
    float _1641 = _1631;
    if (_1577)
    {
        float _1643 = _1631 * 6.283185482025146484375;
        float _1645 = sin(_1643);
        _1637 = _1645;
    }
    float _1647 = _1637;
    float _1649 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1633);
    if (_1577)
    {
        float _1651 = _1635 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1591 = _1651;
    }
    float _1653 = _1591;
    float _1655 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1649);
    float _1657 = _1627;
    float _1659 = _1653;
    if (_1577)
    {
        float _1661 = _1631 * 6.283185482025146484375;
        float _1663 = cos(_1661);
        _1657 = _1663;
    }
    float _1665 = _1657;
    float _1667 = _1655 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1669 = _1667 + _1607;
    float _1671 = -_199;
    float _1673 = _1407 ? _1671 : _199;
    float _1675 = _1673;
    if (_1577)
    {
        float _1677 = fma(_1647, _1653, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1659 = _1677;
    }
    float _1679 = _1659;
    float _1681 = _1669 * _1625;
    float _1683 = _1681 * 0.5;
    bool _1685 = !_863;
    float _1687 = _1685 ? _199 : _1673;
    float _1689 = _1679;
    float _1691 = _1683;
    if (_1577)
    {
        float _1693 = _1617 * _1679;
        _1689 = _1693;
    }
    float _1695 = _1689;
    int _1697 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1699 = _1697 != 0;
    int _1701 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1703 = _1701 != 0;
    int _1705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1707 = _1705 != 0;
    int _1709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1711 = _1709 != 0;
    float _1713 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1715 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1713);
    if (!_1577)
    {
        _1691 = _1553;
    }
    float _1717 = _1691;
    float _1719 = _1717;
    if (_1577)
    {
        float _1721 = _1665 + (-1.0);
        _1675 = _1721;
    }
    float _1723 = _1675;
    float _1725 = _1723;
    if (_1577)
    {
        float _1727 = fma(_1563, _1695, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1593 = _1727;
    }
    float _1729 = _1593;
    bool _1731 = !_1699;
    int _1733 = _1731 ? 0 : 1;
    if (_1577)
    {
        float _1735 = fma(_1559, _1695, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1719 = _1735;
    }
    float _1737 = _1719;
    float _1739 = 1.0 / _1715;
    bool _1741 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1743 = isnan(0.5);
    bool _1745 = _1741 || _1743;
    bool _1747 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1749 = _1745 || _1747;
    if (_1577)
    {
        float _1751 = _1723 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1725 = _1751;
    }
    float _1753 = _1725;
    bool _1755 = !_1703;
    int _1757 = _1755 ? 0 : 1;
    bool _1759 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1761 = isnan(0.5);
    bool _1763 = _1759 || _1761;
    bool _1765 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1767 = _1763 || _1765;
    if (_1577)
    {
        float _1769 = fma(_1635, _1665, _1753);
        _1639 = _1769;
    }
    float _1771 = _1639;
    bool _1773 = !_1707;
    int _1775 = _1773 ? 0 : 1;
    bool _1777 = !_1711;
    int _1779 = _1777 ? 0 : 1;
    float _1781 = _1771;
    if (_1749)
    {
        _1595 = _1729;
    }
    float _1783 = _1595;
    float _1785 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1787 = _1739 * _1785;
    float _1789 = _1783;
    if (_1749)
    {
        _1597 = _1737;
    }
    float _1791 = _1597;
    float _1793 = _1791;
    if (_1767)
    {
        _1641 = 1.0;
    }
    float _1795 = _1641;
    float _1797 = _1795;
    if (!_1749)
    {
        float _1799 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1801 = _1579 + _1799;
        float _1803 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1805 = _1509 + _1803;
        float _1807 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1809 = -_1579;
        float _1811 = _1809 + _1771;
        float _1813 = _1801 * _1801;
        float _1815 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1817 = _1525 + _1815;
        float _1819 = -_1509;
        float _1821 = _1819 + _1729;
        float _1823 = -_1525;
        float _1825 = _1823 + _1737;
        float _1827 = fma(_1805, _1805, _1813);
        float _1829 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1831 = fma(_1817, _1817, _1827);
        float _1833 = sqrt(_1831);
        float _1835 = _1807 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1837 = precise::min(_1833, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1839 = _1837 * _1829;
        float _1841 = _1835 * _1839;
        float _1843 = fma(_1811, _1841, _1579);
        float _1845 = fma(_1821, _1841, _1509);
        float _1847 = fma(_1825, _1841, _1525);
        _1781 = _1843;
        _1789 = _1845;
        _1793 = _1847;
        _1619 = _1807;
    }
    float _1849 = _1781;
    float _1851 = _1789;
    float _1853 = _1793;
    float _1855 = _1619;
    float _1857 = _1855;
    if (!_1767)
    {
        float _1859 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1861 = _1859 * 0.15915493667125701904296875;
        float _1863 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1865 = _1861 * 6.283185482025146484375;
        float _1867 = cos(_1865);
        float _1869 = _1863 * 0.15915493667125701904296875;
        float _1871 = _1861 * 6.283185482025146484375;
        float _1873 = sin(_1871);
        float _1875 = 1.0 / _1867;
        float _1877 = _1869 * 6.283185482025146484375;
        float _1879 = cos(_1877);
        float _1881 = _1873 * _1875;
        float _1883 = _1869 * 6.283185482025146484375;
        float _1885 = sin(_1883);
        float _1887 = _1879 * _1881;
        float _1889 = 1.0 / _1887;
        float _1891 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1893 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1891;
        float _1895 = 1.0 / _1893;
        float _1897 = _1885 * _1889;
        float _1899 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1901 = fma(_1787, _1897, _1899);
        float _1903 = _1901 * _1895;
        float _1905 = precise::clamp(_1903, 0.0, 1.0);
        _1599 = _1861;
        _1857 = _1869;
        _1797 = _1905;
    }
    float _1907 = _1599;
    float _1909 = _1857;
    float _1911 = _1797;
    float _1913 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1915 = _1849 + _1913;
    float _1917 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1919 = _1851 + _1917;
    float _1921 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1923 = _1853 + _1921;
    bool _1925 = _907 != 0;
    float _1927 = _1915 * _1915;
    float _1929 = fma(_1737, 6.2500002968590706586837768554688e-05, 0.5);
    float _1931 = fma(_1919, _1919, _1927);
    float _1933 = fma(_1923, _1923, _1931);
    float _1935 = rsqrt(_1933);
    float _1937 = sqrt(_1933);
    float _1939 = _1935 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1941 = _1919 * _1939;
    float _1943 = _1923 * _1939;
    float _1945 = _1941 * _1941;
    float _1947 = _1943 * _1943;
    float _1949 = _1945 + _1947;
    float _1951 = sqrt(_1949);
    bool _1953 = _1951 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1955 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1957 = _1951 + _1955;
    float _1959 = _1935;
    float _1961 = _1957;
    float _1963 = _1907;
    float _1965 = _1915;
    float _1967 = _1939;
    float _1969 = _1949;
    if (_1953)
    {
        float _1971 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1959 = _1971;
    }
    float _1973 = _1959;
    float _1975 = _1973;
    if (_1953)
    {
        float _1977 = _1957 * _1973;
        _1961 = _1977;
    }
    float _1979 = _1961;
    if (_1953)
    {
        float _1981 = rsqrt(_1949);
        _1975 = _1981;
    }
    float _1983 = _1975;
    float _1985 = _1983;
    if (_1953)
    {
        float _1987 = _1979 * 0.15915493667125701904296875;
        _1963 = _1987;
    }
    float _1989 = _1963;
    float _1991 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1993 = _1923;
    if (_1953)
    {
        float _1995 = _1989 * 6.283185482025146484375;
        float _1997 = sin(_1995);
        _1993 = _1997;
    }
    float _1999 = _1993;
    float _2001 = precise::max(0.0, _1991);
    float _2003 = _1909;
    if (_1953)
    {
        float _2005 = _1989 * 6.283185482025146484375;
        float _2007 = cos(_2005);
        _2003 = _2007;
    }
    float _2009 = _2003;
    float _2011 = -_1939;
    float _2013 = -_2001;
    float _2015 = fma(_1915, _2011, _2013);
    float _2017 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1953)
    {
        float _2019 = _2015 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1965 = _2019;
    }
    float _2021 = _1965;
    float _2023 = fma(_1509, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2025 = _1999;
    float _2027 = _2021;
    if (_1953)
    {
        float _2029 = fma(_1999, _2021, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2025 = _2029;
    }
    float _2031 = _2025;
    float _2033 = _2031;
    if (!_1953)
    {
        _2027 = _2015;
    }
    float _2035 = _2027;
    float _2037 = floor(_2023);
    float _2039 = _2035;
    if (_1953)
    {
        float _2041 = _1983 * _2031;
        _1967 = _2041;
    }
    float _2043 = _1967;
    if (!_1953)
    {
        _1985 = _1941;
    }
    float _2045 = _1985;
    float _2047 = _2045;
    float _2049 = _2009;
    if (_1953)
    {
        float _2051 = _2009 + (-1.0);
        _2017 = _2051;
    }
    float _2053 = _2017;
    float _2055 = _2053;
    if (_1953)
    {
        float _2057 = _1941 * _2043;
        _2047 = _2057;
    }
    float _2059 = _2047;
    if (!_1953)
    {
        _2033 = _1945;
    }
    float _2061 = _2033;
    float _2063 = _2061;
    if (_1953)
    {
        float _2065 = _2053 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1969 = _2065;
    }
    float _2067 = _1969;
    if (!_1953)
    {
        _2055 = _1943;
    }
    float _2069 = _2055;
    float _2071 = _2069;
    if (_1953)
    {
        float _2073 = _2059 * _2059;
        _2063 = _2073;
    }
    float _2075 = _2063;
    if (_1953)
    {
        float _2077 = _1943 * _2043;
        _2071 = _2077;
    }
    float _2079 = _2071;
    if (_1953)
    {
        float _2081 = fma(_2015, _2009, _2067);
        _2039 = _2081;
    }
    float _2083 = _2039;
    if (!_1953)
    {
        _2049 = _1947;
    }
    float _2085 = _2049;
    float _2087 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2089 = _2085;
    if (_1953)
    {
        float _2091 = _2079 * _2079;
        _2089 = _2091;
    }
    float _2093 = _2089;
    float _2095 = fma(_2083, _2083, _2075);
    float _2097 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2087);
    float _2099 = -_2037;
    float _2101 = _2023 + _2099;
    float _2103 = _2095 + _2093;
    float _2105 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2107 = fma(_1937, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2105);
    float _2109 = precise::clamp(_2107, 0.0, 1.0);
    float _2111 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2097);
    float _2113 = rsqrt(_2103);
    float _2115 = -_2109;
    float _2117 = _2115 + 1.0;
    float _2119 = _2111 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2121 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2123 = _2119 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2125 = fma(_1525, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2127 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2129 = -_2123;
    float _2131 = fma(_2129, _2121, 1.0);
    float _2133 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2135 = abs(_2117);
    float _2137 = log2(_2135);
    float _2139 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2127);
    float _2141 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2143 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2133);
    float _2145 = _2113 * _2059;
    float _2147 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2139);
    float _2149 = _2113 * _2083;
    float _2151 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2143);
    float _2153 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2155 = _2147 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2157 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2141);
    float _2159 = _2151 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2161 = _2113 * _2079;
    float _2163 = -_2153;
    float _2165 = fma(_2149, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2163);
    float _2167 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2157);
    float _2169 = _2159 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2171 = floor(_2125);
    float _2173 = -_2161;
    float _2175 = fma(_2173, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2165);
    float _2177 = _2167 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2179 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2169);
    float _2181 = _2137 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2183 = fma(_2175, -0.5, 0.5);
    float _2185 = fma(_2175, 0.5, 0.5);
    float _2187 = fma(_2119, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2179);
    float _2189 = exp2(_2181);
    float _2191 = _2149 + 1.0;
    float _2193 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2187);
    float _2195 = fma(_2185, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2197 = _2159 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2199 = -_2171;
    float _2201 = _2125 + _2199;
    float _2203 = sqrt(_2183);
    float _2205 = _2159 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2207 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2197);
    float _2209 = fma(_2185, _2195, -0.212114393711090087890625);
    float _2211 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2205);
    float _2213 = fma(_2119, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2207);
    float _2215 = fma(_2185, _2209, 1.570728778839111328125);
    float _2217 = log2(_2131);
    float _2219 = fma(_2119, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2211);
    float _2221 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2213);
    float _2223 = -_2149;
    float _2225 = fma(_2189, _2191, _2223);
    float _2227 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2219);
    float _2229 = fma(_1729, 6.2500002968590706586837768554688e-05, 0.5);
    float _2231 = fma(_2225, 0.5, 0.5);
    float _2233 = 1.0 / _2193;
    float _2235 = _2203 * 0.636619746685028076171875;
    float _2237 = -_2215;
    float _2239 = fma(_2235, _2237, 1.0);
    float _2241 = _2217 * 0.693147182464599609375;
    float2 _8251 = float2(_2101, _2201);
    float _2243 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8251, float2(0.0), isnan(_8251)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8251, float2(0.0), isnan(_8251)), level(0.0)).x;
    float _2245 = _2241 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2247 = _2221 * _2233;
    float _2249 = _2227 * _2233;
    float _2251 = fma(_2247, 0.5, 0.5);
    float _2253 = fma(_2249, -0.5, 0.5);
    float3 _8276 = float3(_2251, _2253, _2245);
    float _2255 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8276, float3(0.0), isnan(_8276)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8276, float3(0.0), isnan(_8276)), level(0.0)).x;
    float3 _8287 = float3(_2251, _2253, _2245);
    float4 _2258 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8287, float3(0.0), isnan(_8287)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8287, float3(0.0), isnan(_8287)), level(0.0)).xyzw;
    float _2260 = _2258.x;
    float _2262 = _2258.y;
    float _2264 = _2258.z;
    float _2266 = _2258.w;
    float2 _8303 = float2(_2239, _2231);
    float3 _2270 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8303, float2(0.0), isnan(_8303)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8303, float2(0.0), isnan(_8303)), level(0.0)).xyz;
    float _2272 = _2270.x;
    float _2274 = _2270.y;
    float _2276 = _2270.z;
    float2 _8317 = float2(_2229, _1929);
    float3 _2278 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_8317, float2(0.0), isnan(_8317)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_8317, float2(0.0), isnan(_8317)), level(0.0)).xyz;
    float _2280 = _2278.x;
    float _2282 = _2278.y;
    float _2284 = _2278.z;
    float _2286 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2288 = int(_2286);
    float _2290 = _815 * _817;
    int _2292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2294 = _2292 != 0;
    float _2296 = -_1157;
    float _2298 = _2296 + 1.0;
    int _2300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2302 = _2300 != 0;
    float _2304 = -_1327;
    float _2306 = _2304 + 1.0;
    int _2308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2310 = _2308 != 0;
    float _2312 = -_1333;
    float _2314 = _2312 + 1.0;
    float _2316 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _2318 = int(_2316);
    int _2320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2322 = _2320 != 0;
    float _2324 = -_1169;
    float _2326 = _2324 + 1.0;
    int _2328 = abs(_1073);
    float _2330 = _2137 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2332 = abs(_1079);
    float _2334 = _2159 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2336 = abs(_1757);
    float _2338 = trunc(_1235);
    int _2340 = int(_2338);
    float _2342 = float(uint(_2288));
    float _2344 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2334);
    float _2346 = trunc(_1285);
    int _2348 = int(_2346);
    float _2350 = float(uint(_2318));
    float _2352 = -_1329;
    float _2354 = _2352 + 1.0;
    float _2356 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _2358 = int(_2356);
    float _2360 = float(uint(_2340));
    float _2362 = fma(_2119, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2344);
    float _2364 = float(_2288);
    int _2366 = ~_2318;
    int _2368 = _2366 + 1;
    float _2370 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2362);
    float _2372 = float(_2318);
    float _2374 = 1.0 / _2342;
    float _2376 = float(uint(_2348));
    int _2378 = abs(_1779);
    out.gl_Position.x = _2221;
    out.gl_Position.y = _2227;
    out.gl_Position.z = _2370;
    out.gl_Position.w = _2193;
    bool _2380 = _989 != 0;
    bool _2382 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2384 = isnan(_681);
    bool _2386 = _2382 || _2384;
    bool _2388 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2390 = _2386 || _2388;
    float _2392 = float(_2390);
    float _2394 = 1.0 / _2350;
    float _2396 = float(uint(_2358));
    float _2398 = 1.0 / _2396;
    int _2400 = as_type<int>(_2374) + (-2);
    float _2402 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2404 = _2402 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2406 = float(_2340);
    float _2408 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2410 = _2408 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2412 = as_type<float>(_2400) * _2360;
    bool _2414 = _2406 >= _2364;
    bool _2416 = isnan(_2406);
    bool _2418 = _2414 || _2416;
    bool _2420 = isnan(_2364);
    bool _2422 = _2418 || _2420;
    float _2424 = float(_2422);
    float _2426 = trunc(_1325);
    int _2428 = int(_2426);
    int _2430 = as_type<int>(_2394) + (-2);
    float _2432 = _819 * _809;
    int _2434 = ~_2288;
    int _2436 = _2434 + 1;
    float _2438 = as_type<float>(_2430) * _2376;
    float _2440 = trunc(_2412);
    float _2442 = precise::max(_2440, 0.0);
    uint _2445 = uint(_2442);
    float _2447 = trunc(_2438);
    float _2449 = precise::max(_2447, 0.0);
    uint _2451 = uint(_2449);
    float _2453 = float(uint(_2428));
    int _2455 = _2436 * int(_2445);
    int _2457 = _2455 + _2340;
    float _2459 = trunc(_2424);
    int _2461 = int(_2459);
    float _2463 = float(uint(_2457));
    int _2465 = as_type<int>(_2398) + (-2);
    float _2467 = floor(_2290);
    float _2469 = as_type<float>(_2400) * _2463;
    int _2471 = _2368 * int(_2451);
    int _2473 = _2471 + _2348;
    float _2475 = as_type<float>(_2465) * _2453;
    int _2477 = ~_2288;
    int _2479 = _2477 + 1;
    float _2481 = float(_2348);
    float _2483 = trunc(_2469);
    float _2485 = precise::max(_2483, 0.0);
    uint _2487 = uint(_2485);
    float _2489 = float(uint(_2473));
    bool _2491 = _2481 >= _2372;
    bool _2493 = isnan(_2481);
    bool _2495 = _2491 || _2493;
    bool _2497 = isnan(_2372);
    bool _2499 = _2495 || _2497;
    float _2501 = float(_2499);
    float _2503 = as_type<float>(_2430) * _2489;
    float _2505 = _819 * _821;
    float _2507 = floor(_2432);
    float _2509 = -_2467;
    float _2511 = _2290 + _2509;
    float _2513 = trunc(_2503);
    float _2515 = precise::max(_2513, 0.0);
    uint _2517 = uint(_2515);
    int _2519 = int(_2445) + int(_2487);
    int _2521 = ~_2358;
    int _2523 = _2521 + 1;
    int _2525 = _2479 * _2519;
    int _2527 = _2525 + _2340;
    int _2529 = ~_2318;
    int _2531 = _2529 + 1;
    float _2533 = trunc(_2475);
    float _2535 = precise::max(_2533, 0.0);
    uint _2537 = uint(_2535);
    float _2539 = -_2507;
    float _2541 = _2432 + _2539;
    bool _2543 = uint(_2527) >= uint(_2288);
    float _2545 = _2511 * _2372;
    float _2547 = _2541 * _2364;
    float _2549 = _2364 * _921;
    int _2551 = int(_2451) + int(_2517);
    float _2553 = trunc(_2501);
    int _2555 = int(_2553);
    bool _2557 = !_2322;
    int _2559 = _2557 ? 0 : 1;
    float _2561 = _2372 * _921;
    int _2563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2565 = _2563 != 0;
    int _2567 = _2531 * _2551;
    int _2569 = _2567 + _2348;
    int _2571 = abs(_2559);
    int _2573 = _2523 * int(_2537);
    int _2575 = _2573 + _2428;
    float _2577 = trunc(_2547);
    int _2579 = int(_2577);
    bool _2581 = !_2565;
    int _2583 = _2581 ? 0 : 1;
    bool _2585 = _2288 == 0;
    float _2587 = float(uint(_2575));
    bool _2589 = !_2543;
    int _2591 = _2589 ? 0 : (-1);
    float _2593 = trunc(_2545);
    int _2595 = int(_2593);
    bool _2597 = uint(_2569) >= uint(_2318);
    float _2599 = as_type<float>(_2465) * _2587;
    int _2601 = ~_2519;
    int _2603 = _2601 + _2591;
    int _2605 = _2603 + 1;
    bool _2607 = !_2597;
    int _2609 = _2607 ? 0 : (-1);
    int _2611 = abs(_2583);
    int _2613 = _2579 * _2571;
    int _2615 = _2613 + _2340;
    int _2617 = ~_2551;
    int _2619 = _2617 + _2609;
    int _2621 = _2619 + 1;
    int _2623 = _2288 * _2605;
    int _2625 = _2623 + _2340;
    float _2627 = as_type<float>(_2551);
    float _2629 = _2505;
    float _2631 = _2227;
    float _2633 = _2221;
    if (_2310)
    {
        float _2635 = in.m_60.w;
        _2627 = _2635;
    }
    float _2637 = _2627;
    float _2639 = trunc(_2599);
    float _2641 = precise::max(_2639, 0.0);
    uint _2643 = uint(_2641);
    bool _2645 = _2318 == 0;
    int _2647 = _2318 * _2621;
    int _2649 = _2647 + _2348;
    int _2651 = ~_2461;
    int _2653 = _2651 + 1;
    int _2655 = _2653 + 1;
    int _2657 = _2595 * _2611;
    int _2659 = _2657 + _2348;
    bool _2661 = !_2585;
    int _2663 = _2661 ? _2625 : (-1);
    int _2665 = ~_2555;
    int _2667 = _2665 + 1;
    int _2669 = _2667 + 1;
    float _2671 = trunc(_2549);
    int _2673 = int(_2671);
    bool _2675 = !_2645;
    int _2677 = _2675 ? _2649 : (-1);
    int _2679 = _2663 * _2655;
    int _2681 = _2318 + (-1);
    int _2683 = _2288 + (-1);
    int _2685 = _2677 * _2669;
    float _2687 = float(_2428);
    float _2689 = trunc(_2561);
    int _2691 = int(_2689);
    int _2693 = int(_2537) + int(_2643);
    int _2695 = _2555 * _2681;
    int _2697 = _2695 + _2685;
    int _2699 = abs(as_type<int>(_1067));
    int _2701 = _2461 * _2683;
    int _2703 = _2701 + _2679;
    int _2705 = ~_2358;
    int _2707 = _2705 + 1;
    if (_2310)
    {
        float _2709 = _2637 * 3.1415927410125732421875;
        _1139 = _2709;
    }
    float _2711 = _1139;
    bool _2713 = !_2294;
    int _2715 = _2713 ? 0 : 1;
    int _2717 = _2703 * _2699;
    float _2719 = _2711;
    if (_2310)
    {
        float _2721 = _2711 * 0.15915493667125701904296875;
        _2719 = _2721;
    }
    float _2723 = _2719;
    int _2725 = abs(_2715);
    int _2727 = _2673 * _2328;
    int _2729 = _2727 + _2717;
    int _2731 = abs(_1095);
    int _2733 = _2707 * _2693;
    int _2735 = _2733 + _2428;
    float _2737 = as_type<float>(_2707);
    if (_2310)
    {
        float _2739 = _2723 * 6.283185482025146484375;
        float _2741 = sin(_2739);
        _2737 = _2741;
    }
    float _2743 = _2737;
    int _2745 = abs(_1101);
    int _2747 = _2697 * _2731;
    bool _2749 = uint(_2735) >= uint(_2358);
    int _2751 = abs(_1105);
    int _2753 = _2691 * _2745;
    int _2755 = _2753 + _2747;
    float _2757 = float(_2358);
    float _2759 = floor(_2505);
    int _2761 = _2615 * _2332;
    int _2763 = _2761 + _2729;
    bool _2765 = !_2749;
    int _2767 = _2765 ? 0 : (-1);
    int _2769 = _2579 * _2725;
    int _2771 = _2769 + _2763;
    bool _2773 = !_2302;
    int _2775 = _2773 ? 0 : 1;
    int _2777 = ~_2693;
    int _2779 = _2777 + _2767;
    int _2781 = _2779 + 1;
    float _2783 = _2757 * _921;
    float _2785 = float(uint(_2771));
    int _2787 = _2659 * _2751;
    int _2789 = _2787 + _2755;
    bool _2791 = _2687 >= _2757;
    bool _2793 = isnan(_2687);
    bool _2795 = _2791 || _2793;
    bool _2797 = isnan(_2757);
    bool _2799 = _2795 || _2797;
    float _2801 = float(_2799);
    int _2803 = _2358 * _2781;
    int _2805 = _2803 + _2428;
    int _2807 = abs(_2775);
    float _2809 = as_type<float>(_2400) * _2785;
    float _2811 = float(uint(_2615));
    float _2813 = trunc(_2783);
    int _2815 = int(_2813);
    bool _2817 = _2749;
    float _2819 = as_type<float>(_2815);
    if (_2310)
    {
        bool _2821 = _2743 > 0.5;
        _2817 = _2821;
    }
    bool _2823 = _2817;
    int _2825 = _2595 * _2807;
    int _2827 = _2825 + _2789;
    float _2829 = -_2759;
    float _2831 = _2505 + _2829;
    bool _2833 = _2358 == 0;
    float _2835 = as_type<float>(_2400) * _2811;
    int _2837 = ~_2288;
    int _2839 = _2837 + 1;
    float _2841 = _2831 * _2757;
    float _2843 = trunc(_2801);
    int _2845 = int(_2843);
    float _2847 = float(uint(_2827));
    bool _2849 = !_2833;
    int _2851 = _2849 ? _2805 : (-1);
    if (!_2310)
    {
        _2629 = _195;
    }
    float _2853 = _2629;
    float _2855 = as_type<float>(_2430) * _2847;
    float _2857 = _2853;
    if (_2310)
    {
        float _2859 = -_195;
        float _2861 = _2823 ? _2859 : _195;
        _2857 = _2861;
    }
    float _2863 = _2857;
    float _2865 = trunc(_2809);
    float _2867 = precise::max(_2865, 0.0);
    uint _2869 = uint(_2867);
    int _2871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2873 = _2871 != 0;
    int _2875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2877 = _2875 != 0;
    int _2879 = abs(_1733);
    float _2881 = trunc(_2855);
    float _2883 = precise::max(_2881, 0.0);
    uint _2885 = uint(_2883);
    int _2887 = ~_2845;
    int _2889 = _2887 + 1;
    int _2891 = _2889 + 1;
    float _2893 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2895 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2893;
    float _2897 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2899 = _2897 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _2901 = _2851 * _2891;
    int _2903 = _2358 + (-1);
    int _2905 = _2839 * int(_2869);
    int _2907 = _2905 + _2771;
    float _2909 = trunc(_2835);
    float _2911 = precise::max(_2909, 0.0);
    uint _2913 = uint(_2911);
    int _2915 = ~_2318;
    int _2917 = _2915 + 1;
    float _2919 = as_type<float>(_2745);
    float _2921 = as_type<float>(_2869);
    if (_2873)
    {
        float _2923 = in.m_60.x;
        _2919 = _2923;
    }
    float _2925 = _2919;
    int _2927 = _2845 * _2903;
    int _2929 = _2927 + _2901;
    float _2931 = float(uint(_2907));
    float _2933 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2935 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2933;
    bool _2937 = !_2877;
    int _2939 = _2937 ? 0 : 1;
    int _2941 = _2917 * int(_2885);
    int _2943 = _2941 + _2827;
    float _2945 = trunc(_2841);
    int _2947 = int(_2945);
    float _2949 = as_type<float>(_2400) * _2931;
    int _2951 = ~_2288;
    int _2953 = _2951 + 1;
    int _2955 = abs(_2939);
    float _2957 = float(uint(_2943));
    float _2959 = trunc(_2949);
    float _2961 = precise::max(_2959, 0.0);
    uint _2963 = uint(_2961);
    int _2965 = _2953 * int(_2913);
    int _2967 = _2965 + _2615;
    float _2969 = float(uint(_2967));
    int _2971 = _2929 * _2336;
    int _2973 = _2947 * _2955;
    int _2975 = _2973 + _2428;
    float _2977 = as_type<float>(_2430) * _2957;
    float _2979 = as_type<float>(_2400) * _2969;
    float _2981 = float(uint(_2659));
    int _2983 = _2815 * _2879;
    int _2985 = _2983 + _2971;
    float _2987 = trunc(_2977);
    float _2989 = precise::max(_2987, 0.0);
    uint _2991 = uint(_2989);
    int _2993 = ~_2288;
    int _2995 = _2993 + 1;
    if (_2873)
    {
        float _2997 = _2925 * 3.1415927410125732421875;
        _2819 = _2997;
    }
    float _2999 = _2819;
    int _3001 = int(_2869) + int(_2963);
    float _3003 = -_2243;
    float _3005 = _3003 + 1.0;
    int _3007 = abs(_1775);
    float _3009 = as_type<float>(_2430) * _2981;
    if (_2873)
    {
        float _3011 = _2999 * 0.15915493667125701904296875;
        _2921 = _3011;
    }
    float _3013 = _2921;
    float _3015 = trunc(_2979);
    float _3017 = precise::max(_3015, 0.0);
    uint _3019 = uint(_3017);
    int _3021 = _2995 * _3001;
    int _3023 = _3021 + _2771;
    if (!_2873)
    {
        _1003 = _199;
    }
    float _3025 = _1003;
    int _3027 = _2975 * _3007;
    int _3029 = _3027 + _2985;
    int _3031 = ~_2318;
    int _3033 = _3031 + 1;
    bool _3035 = uint(_3023) >= uint(_2288);
    int _3037 = _2947 * _2378;
    int _3039 = _3037 + _3029;
    float _3041 = trunc(_3009);
    float _3043 = precise::max(_3041, 0.0);
    uint _3045 = uint(_3043);
    int _3047 = int(_2885) + int(_2991);
    float _3049 = -_195;
    int _3051 = _1925 ? as_type<int>(_3049) : as_type<int>(_195);
    float _3053 = float(uint(_2975));
    float _3055 = _3013;
    float _3057 = _3025;
    if (_2873)
    {
        float _3059 = _3013 * 6.283185482025146484375;
        float _3061 = sin(_3059);
        _3055 = _3061;
    }
    float _3063 = _3055;
    int _3065 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _3067 = _3065 != 0;
    int _3069 = _3033 * _3047;
    int _3071 = _3069 + _2827;
    int _3073 = ~_2318;
    int _3075 = _3073 + 1;
    float _3077 = as_type<float>(_2465) * _3053;
    bool _3079 = !_3067;
    float _3081 = _3079 ? _195 : as_type<float>(_3051);
    bool _3083 = uint(_3071) >= uint(_2318);
    int _3085 = _3075 * int(_3045);
    int _3087 = _3085 + _2659;
    float _3089 = float(uint(_3039));
    float _3091 = trunc(_3077);
    float _3093 = precise::max(_3091, 0.0);
    uint _3095 = uint(_3093);
    bool _3097 = !_3035;
    int _3099 = _3097 ? 0 : (-1);
    float _3101 = as_type<float>(_2465) * _3089;
    int _3103 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3105 = _3103 != 0;
    float _3107 = float(uint(_3087));
    float _3109 = 1.0 / _2404;
    bool _3111 = !_3083;
    int _3113 = _3111 ? 0 : (-1);
    int _3115 = ~_3001;
    int _3117 = _3115 + _3099;
    int _3119 = _3117 + 1;
    float _3121 = as_type<float>(_2430) * _3107;
    bool _3123 = _3083;
    if (_2873)
    {
        bool _3125 = _3063 > 0.5;
        _3123 = _3125;
    }
    bool _3127 = _3123;
    int _3129 = ~_2358;
    int _3131 = _3129 + 1;
    float _3133 = trunc(_3101);
    float _3135 = precise::max(_3133, 0.0);
    uint _3137 = uint(_3135);
    int _3139 = ~_3047;
    int _3141 = _3139 + _3113;
    int _3143 = _3141 + 1;
    int _3145 = _2288 * _3119;
    int _3147 = _3145 + _2771;
    float _3149 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _3151 = _3149 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    if (_2873)
    {
        float _3153 = -_199;
        float _3155 = _3127 ? _3153 : _199;
        _3057 = _3155;
    }
    float _3157 = _3057;
    int _3159 = _2318 * _3143;
    int _3161 = _3159 + _2827;
    bool _3163 = !_2585;
    int _3165 = _3163 ? _3147 : (-1);
    int _3167 = _3131 * int(_3095);
    int _3169 = _3167 + _2975;
    int _3171 = int(_2913) + int(_3019);
    float _3173 = trunc(_3121);
    float _3175 = precise::max(_3173, 0.0);
    uint _3177 = uint(_3175);
    float _3179 = -_199;
    int _3181 = _2380 ? as_type<int>(_3179) : as_type<int>(_199);
    float _3183 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3185 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _3183;
    float _3187 = float(uint(_3169));
    int _3189 = _3165 & 3;
    bool _3191 = _3189 != 0;
    int _3193 = _3131 * int(_3137);
    int _3195 = _3193 + _3039;
    int _3197 = ~_2288;
    int _3199 = _3197 + 1;
    float _3201 = as_type<float>(_2465) * _3187;
    bool _3203 = uint(_3189) > 1u;
    float _3205 = 1.0 / _2410;
    float _3207 = float(uint(_3195));
    int _3209 = _3199 * _3171;
    int _3211 = _3209 + _2615;
    int _3213 = _3165 & 3;
    bool _3215 = _3213 != 0;
    bool _3217 = !_3105;
    float _3219 = _3217 ? _199 : as_type<float>(_3181);
    float _3221 = as_type<float>(_2465) * _3207;
    bool _3223 = !_2645;
    int _3225 = _3223 ? _3161 : (-1);
    float _3227 = trunc(_3201);
    float _3229 = precise::max(_3227, 0.0);
    uint _3231 = uint(_3229);
    int _3233 = _3215 ? 0 : 1;
    int _3235 = _3225 & 3;
    bool _3237 = _3235 != 0;
    bool _3239 = uint(_3211) >= uint(_2288);
    int _3241 = ~_3233;
    int _3243 = _3241 + 1;
    int _3245 = _3243 + 1;
    float _3247 = trunc(_3221);
    float _3249 = precise::max(_3247, 0.0);
    uint _3251 = uint(_3249);
    int _3253 = _3245;
    if (!_3203)
    {
        int _3255 = ~_3233;
        int _3257 = _3255 + 1;
        _3253 = _3257;
    }
    int _3259 = _3253;
    bool _3261 = uint(_3235) > 1u;
    bool _3263 = !_3239;
    int _3265 = _3263 ? 0 : (-1);
    int _3267 = _3225 & 3;
    bool _3269 = _3267 != 0;
    float _3271 = exp2(_2330);
    int _3273 = _3269 ? 0 : 1;
    int _3275 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3277 = _3275 != 0;
    int _3279 = ~_2318;
    int _3281 = _3279 + 1;
    int _3283 = int(_3045) + int(_3177);
    int _3285 = int(_3137) + int(_3251);
    bool _3287 = !_3237;
    int _3289 = _3287 ? 0 : 1;
    int _3291 = ~_2358;
    int _3293 = _3291 + 1;
    float _3295 = -_3271;
    float _3297 = _3295 + 1.0;
    bool _3299 = _3235 != 3;
    int _3301 = ~_3273;
    int _3303 = _3301 + 1;
    int _3305 = _3303 + 1;
    float _3307 = _3297 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _3309 = _3305;
    if (!_3261)
    {
        int _3311 = ~_3273;
        int _3313 = _3311 + 1;
        _3309 = _3313;
    }
    int _3315 = _3309;
    int _3317 = _3281 * _3283;
    int _3319 = _3317 + _2659;
    bool _3321 = uint(_3235) >= 2u;
    float _3323 = _3307 * _2255;
    float _3325 = -_3307;
    float _3327 = _3325 + 1.0;
    int _3329 = _3321 ? 0 : 1;
    int _3331 = _3293 * _3285;
    int _3333 = _3331 + _3039;
    bool _3335 = uint(_3319) >= uint(_2318);
    int _3337 = int(_3095) + int(_3231);
    float _3339 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3341 = _3339 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _3343 = ~_3329;
    int _3345 = _3343 + 1;
    int _3347 = _3345 + 1;
    int _3349 = ~_2358;
    int _3351 = _3349 + 1;
    float _3353 = 1.0 / _3341;
    int _3355 = _3347;
    if (_3299)
    {
        int _3357 = ~_3329;
        int _3359 = _3357 + 1;
        _3355 = _3359;
    }
    int _3361 = _3355;
    int _3363 = _3351 * _3337;
    int _3365 = _3363 + _2975;
    bool _3367 = uint(_3333) >= uint(_2358);
    bool _3369 = !_3335;
    int _3371 = _3369 ? 0 : (-1);
    float _3373 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3375 = _3373 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3377 = !_3367;
    int _3379 = _3377 ? 0 : (-1);
    bool _3381 = _809 > 0.5;
    float _3383 = 1.0 / _3375;
    bool _3385 = uint(_3365) >= uint(_2358);
    float _3387 = _2899 * _3353;
    bool _3389 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _3391 = isnan(_681);
    bool _3393 = _3389 || _3391;
    bool _3395 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _3397 = _3393 || _3395;
    float _3399 = float(_3397);
    float _3401 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3403 = _3401 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3405 = !_3385;
    int _3407 = _3405 ? 0 : (-1);
    bool _3409 = _3235 != 3;
    float _3411 = 1.0 / _3403;
    float _3413 = -_195;
    int _3415 = _3381 ? as_type<int>(_3413) : as_type<int>(_195);
    bool _3417 = !_3409;
    int _3419 = _3417 ? 0 : (-1);
    bool _3421 = !_3277;
    float _3423 = _3421 ? _195 : as_type<float>(_3415);
    float _3425 = _2895 * _3383;
    int _3427 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3429 = _3427 != 0;
    int _3431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3433 = _3431 != 0;
    float _3435 = -_3399;
    float _3437 = _3435 + 1.0;
    int _3439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _3441 = _3439 != 0;
    bool _3443 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _3445 = isnan(_681);
    bool _3447 = _3443 || _3445;
    bool _3449 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _3451 = _3447 || _3449;
    float _3453 = float(_3451);
    bool _3455 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _3457 = isnan(_681);
    bool _3459 = _3455 || _3457;
    bool _3461 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _3463 = _3459 || _3461;
    float _3465 = float(_3463);
    float _3467 = _2935 * _3411;
    float _3469 = -_3453;
    float _3471 = _3469 + 1.0;
    float _3473 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3475 = _3473 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3477 = _3465 * _3437;
    float _3479 = -_3465;
    float _3481 = _3479 + 1.0;
    float _3483 = _3399 * _3471;
    bool _3485 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3487 = isnan(_681);
    bool _3489 = _3485 || _3487;
    bool _3491 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _3493 = _3489 || _3491;
    float _3495 = float(_3493);
    float _3497 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3499 = _3497 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3501 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3503 = isnan(_681);
    bool _3505 = _3501 || _3503;
    bool _3507 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _3509 = _3505 || _3507;
    float _3511 = float(_3509);
    float _3513 = 1.0 / _3475;
    bool _3515 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _3517 = isnan(_681);
    bool _3519 = _3515 || _3517;
    bool _3521 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _3523 = _3519 || _3521;
    float _3525 = float(_3523);
    float _3527 = _3495 * _3481;
    float _3529 = -_3495;
    float _3531 = _3529 + 1.0;
    float _3533 = -_3511;
    float _3535 = _3533 + 1.0;
    int _3537 = ~_3285;
    int _3539 = _3537 + _3379;
    int _3541 = _3539 + 1;
    float _3543 = -_3525;
    float _3545 = _3543 + 1.0;
    float _3547 = _3511 * _3531;
    float _3549 = 1.0 / _3499;
    float _3551 = _3525 * _3535;
    float _3553 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3555 = _681 + _3553;
    bool _3557 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _3559 = isnan(_681);
    bool _3561 = _3557 || _3559;
    bool _3563 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _3565 = _3561 || _3563;
    float _3567 = float(_3565);
    float _3569 = _2392 * _3545;
    float _3571 = -_2392;
    float _3573 = _3571 + 1.0;
    float _3575 = fma(_3425, _3555, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _3577 = _2358 * _3541;
    int _3579 = _3577 + _3039;
    float _3581 = _3185 * _3513;
    float _3583 = _3567 * _3573;
    int _3585 = ~_3283;
    int _3587 = _3585 + _3371;
    int _3589 = _3587 + 1;
    float _3591 = _3575 * _3583;
    float _3593 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3595 = _681 + _3593;
    float _3597 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3599 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _3597;
    float _3601 = -_3567;
    float _3603 = _3601 + 1.0;
    float _3605 = _3151 * _3549;
    float _3607 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _3609 = _3607 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3611 = fma(_3387, _3595, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _3613 = fma(_3603, (*spvDescriptorSet0.vp_c9)._m0[159].x, _3591);
    float _3615 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3617 = _681 + _3615;
    float _3619 = abs(_1787);
    float _3621 = log2(_3619);
    float _3623 = _3609 * _3109;
    float _3625 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3627 = _681 + _3625;
    float _3629 = fma(_3467, _3617, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _3631 = fma(_3611, _3569, _3613);
    float _3633 = _3599 * _3205;
    float _3635 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3637 = _681 + _3635;
    float _3639 = fma(_3605, _3627, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _3641 = fma(_3629, _3551, _3631);
    float _3643 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3645 = _681 + _3643;
    float _3647 = fma(_3581, _3637, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _3649 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3651 = _681 + _3649;
    float _3653 = fma(_3639, _3547, _3641);
    float _3655 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3657 = fma(_3623, _3645, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _3659 = _2863 + 0.5;
    float _3661 = _3621 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3663 = fma(_3647, _3527, _3653);
    float _3665 = _3157 + (-0.5);
    float _3667 = fma(_3633, _3651, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _3669 = fma(_3659, (*spvDescriptorSet0.vp_c9)._m0[95].x, _955);
    float _3671 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3673 = fma(_3657, _3477, _3663);
    float _3675 = _3423 + 0.5;
    float _3677 = -_923;
    float _3679 = _3677 + 1.0;
    float _3681 = -_3665;
    float _3683 = -_1331;
    float _3685 = fma(_3681, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3683);
    float _3687 = _3219 + (-0.5);
    float _3689 = fma(_3675, (*spvDescriptorSet0.vp_c9)._m0[80].x, _941);
    int _3691 = _3225 >> 31;
    float _3693 = exp2(_3661);
    float _3695 = -_3679;
    float _3697 = fma(_3695, _2863, _3669);
    float _3699 = fma(_2298, _3157, _3685);
    float _3701 = -_3687;
    float _3703 = -_1321;
    float _3705 = fma(_3701, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3703);
    float _3707 = _3655 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3709 = _3081 + 0.5;
    int _3711 = _3691 & 3;
    out.m_76.x = _3697;
    out.m_76.y = _3699;
    float _3713 = fma(_3707, _3709, _1179);
    int _3715 = _3225 + _3711;
    float _3717 = _3671 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3719 = _1687 + (-0.5);
    float _3721 = -_2314;
    float _3723 = fma(_3081, _3721, _3713);
    float _3725 = _1473 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3727 = fma(_3693, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3729 = precise::clamp(_3727, 0.0, 1.0);
    int _3731 = _3715 >> 2;
    float _3733 = -_3717;
    float _3735 = -_1203;
    float _3737 = fma(_3733, _3719, _3735);
    float _3739 = -_1311;
    float _3741 = _3739 + 1.0;
    float _3743 = fma(_3729, -2.0, 3.0);
    float _3745 = _3729 * _3729;
    int _3747 = _3731 << 4;
    int _3749 = _3747 + 656;
    float _3751 = -_2306;
    float _3753 = fma(_3423, _3751, _3689);
    float _3755 = fma(_3219, _3741, _3705);
    float _3757 = _3745 * _3743;
    uint _3759 = uint(int(uint(_3749) >> uint(2)));
    uint _3761 = uint(int(uint(int(_3759)) >> uint(2)));
    int _3763 = int(_3759) & 3;
    float _3765 = (*spvDescriptorSet0.vp_c9)._m0[int(_3761)][_3763];
    int _3767 = int(_3759) + 1;
    uint _3769 = uint(int(uint(_3767) >> uint(2)));
    int _3771 = _3767 & 3;
    float _3773 = (*spvDescriptorSet0.vp_c9)._m0[int(_3769)][_3771];
    float _3775 = fma(_1687, _2326, _3737);
    float _3777 = _1473 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3779 = -_3757;
    float _3781 = _3779 + 1.0;
    float _3783 = _1473 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3785 = -_1463;
    float _3787 = fma(_3785, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3725);
    float _3789 = -_1463;
    float _3791 = fma(_3789, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3777);
    float _3793 = fma(_3781, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3757);
    out.m_78.x = _3753;
    out.m_78.y = _3755;
    out.m_78.z = _3723;
    out.m_78.w = _3775;
    int _3795 = _3749 + 8;
    uint _3797 = uint(int(uint(_3795) >> uint(2)));
    uint _3799 = uint(int(uint(int(_3797)) >> uint(2)));
    int _3801 = int(_3797) & 3;
    float _3803 = (*spvDescriptorSet0.vp_c9)._m0[int(_3799)][_3801];
    int _3805 = int(_3797) + 1;
    uint _3807 = uint(int(uint(_3805) >> uint(2)));
    int _3809 = _3805 & 3;
    float _3811 = (*spvDescriptorSet0.vp_c9)._m0[int(_3807)][_3809];
    float _3813 = -_1463;
    float _3815 = fma(_3813, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3783);
    float _3817 = _1489 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3819 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3791);
    bool _3821 = _1787 <= 8000.0;
    bool _3823 = isnan(_1787);
    bool _3825 = _3821 || _3823;
    bool _3827 = isnan(8000.0);
    bool _3829 = _3825 || _3827;
    float _3831 = float(_3829);
    float _3833 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3835 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3817);
    int _3837 = _2318 * _3589;
    int _3839 = _3837 + _2659;
    int _3841 = ~_3337;
    int _3843 = _3841 + _3407;
    int _3845 = _3843 + 1;
    float _3847 = _3831 * _3793;
    int _3849 = ~_3171;
    int _3851 = _3849 + _3265;
    int _3853 = _3851 + 1;
    float _3855 = fma(_3667, _3483, _3673);
    bool _3857 = !_2645;
    int _3859 = _3857 ? _3839 : (-1);
    float _3861 = _1489 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3863 = _1489 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3865 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3787);
    float _3867 = _1497 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3869 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3815);
    float _3871 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3861);
    float _3873 = _1497 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3875 = abs(_3315);
    float _3877 = _1497 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3879 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3867);
    float _3881 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3873);
    int _3883 = ~_3875;
    int _3885 = _3883 + 1;
    int _3887 = _3885 + 1;
    float _3889 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3877);
    float _3891 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3879);
    float _3893 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3863);
    int _3895 = abs(_3289);
    float _3897 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3881);
    bool _3899 = !_3433;
    int _3901 = _3899 ? 0 : 1;
    float _3903 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3889);
    bool _3905 = uint(_3189) >= 2u;
    float _3907 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3909 = int(_3907);
    int _3911 = ~_3895;
    int _3913 = _3911 + 1;
    int _3915 = _3913 + 1;
    int _3917 = _2358 * _3845;
    int _3919 = _3917 + _2975;
    int _3921 = _3905 ? 0 : 1;
    int _3923 = _2288 * _3853;
    int _3925 = _3923 + _2615;
    int _3927 = abs(_3901);
    int _3929 = _3887 * as_type<int>(_3773);
    int _3931 = abs(_3361);
    float _3933 = _3847 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _3935 = _3189 != 3;
    int _3937 = _3915 * as_type<int>(_3765);
    int _3939 = _3937 + _3929;
    int _3941 = abs(_3419);
    float _3943 = _3005 * _3933;
    float _3945 = precise::clamp(_3943, 0.0, 1.0);
    int _3947 = ~_3931;
    int _3949 = _3947 + 1;
    int _3951 = _3949 + 1;
    float _3953 = _2276 * _3323;
    int _3955 = ~_3941;
    int _3957 = _3955 + 1;
    int _3959 = _3957 + 1;
    float _3961 = fma(_3453, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3855);
    int _3963 = _3165 >> 31;
    int _3965 = _3951 * as_type<int>(_3803);
    int _3967 = _3965 + _3939;
    int _3969 = ~_3927;
    int _3971 = _3969 + 1;
    int _3973 = _3971 + 1;
    int _3975 = _3963 & 3;
    int _3977 = _3959 * as_type<int>(_3811);
    int _3979 = _3977 + _3967;
    int _3981 = ~_3921;
    int _3983 = _3981 + 1;
    int _3985 = _3983 + 1;
    float _3987 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3989 = _3985;
    float _3991 = _3897;
    if (_3935)
    {
        int _3993 = ~_3921;
        int _3995 = _3993 + 1;
        _3989 = _3995;
    }
    int _3997 = _3989;
    int _3999 = _3979 * _3973;
    int _4001 = _3165 + _3975;
    float _4003 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3893);
    int _4005 = abs(_3909);
    float _4007 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3871);
    bool _4009 = !_2833;
    int _4011 = _4009 ? _3579 : (-1);
    float _4013 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3835);
    float _4015 = float(uint(_3909));
    float _4017 = _3987 * _3819;
    int _4019 = _4001 >> 2;
    int _4021 = _3859 * _3927;
    int _4023 = _4021 + _3999;
    float _4025 = float(uint(_4005));
    float _4027 = 1.0 / _4015;
    int _4029 = _4011 >> 31;
    out.m_80.x = _4003;
    out.m_80.y = _4007;
    out.m_80.z = _4013;
    int _4031 = _4019 << 4;
    int _4033 = _4031 + 368;
    float _4035 = fma(_3833, _4003, _4017);
    int _4037 = _4011 & 3;
    bool _4039 = _4037 != 0;
    float _4041 = _3987 * _3865;
    int _4043 = _4011 & 3;
    bool _4045 = _4043 != 0;
    float _4047 = 1.0 / _4025;
    int _4049 = _4029 & 3;
    uint _4051 = uint(int(uint(_4033) >> uint(2)));
    uint _4053 = uint(int(uint(int(_4051)) >> uint(2)));
    int _4055 = int(_4051) & 3;
    float _4057 = (*spvDescriptorSet0.vp_c9)._m0[int(_4053)][_4055];
    int _4059 = int(_4051) + 1;
    uint _4061 = uint(int(uint(_4059) >> uint(2)));
    int _4063 = _4059 & 3;
    float _4065 = (*spvDescriptorSet0.vp_c9)._m0[int(_4061)][_4063];
    int _4067 = _4039 ? 0 : 1;
    float _4069 = fma(_3833, _4007, _4041);
    bool _4071 = uint(_4043) > 1u;
    float _4073 = _3987 * _3869;
    int _4075 = _4011 + _4049;
    out.m_82.x = _3961;
    int _4077 = as_type<int>(_4027) + (-2);
    float _4079 = fma(_3833, _4013, _4073);
    int _4081 = _4075 >> 2;
    int _4083 = abs(_4023);
    int _4085 = _4081 << 4;
    int _4087 = _4085 + 800;
    int _4089 = ~_4067;
    int _4091 = _4089 + 1;
    int _4093 = _4091 + 1;
    float _4095 = float(uint(_4023));
    uint _4097 = uint(int(uint(_4087) >> uint(2)));
    uint _4099 = uint(int(uint(int(_4097)) >> uint(2)));
    int _4101 = int(_4097) & 3;
    float _4103 = (*spvDescriptorSet0.vp_c9)._m0[int(_4099)][_4101];
    int _4105 = int(_4097) + 1;
    uint _4107 = uint(int(uint(_4105) >> uint(2)));
    int _4109 = _4105 & 3;
    float _4111 = (*spvDescriptorSet0.vp_c9)._m0[int(_4107)][_4109];
    int _4113 = _4093;
    if (!_4071)
    {
        int _4115 = ~_4067;
        int _4117 = _4115 + 1;
        _4113 = _4117;
    }
    int _4119 = _4113;
    int _4121 = as_type<int>(_4047) + (-2);
    float _4123 = as_type<float>(_4077) * _4095;
    float _4125 = float(uint(_4083));
    int _4127 = ~_3909;
    int _4129 = _4127 + 1;
    int _4131 = _4033 + 8;
    uint _4133 = uint(int(uint(_4131) >> uint(2)));
    uint _4135 = uint(int(uint(int(_4133)) >> uint(2)));
    int _4137 = int(_4133) & 3;
    float _4139 = (*spvDescriptorSet0.vp_c9)._m0[int(_4135)][_4137];
    int _4141 = int(_4133) + 1;
    uint _4143 = uint(int(uint(_4141) >> uint(2)));
    int _4145 = _4141 & 3;
    float _4147 = (*spvDescriptorSet0.vp_c9)._m0[int(_4143)][_4145];
    bool _4149 = _4043 != 3;
    float _4151 = as_type<float>(_4121) * _4125;
    float _4153 = trunc(_4123);
    float _4155 = precise::max(_4153, 0.0);
    uint _4157 = uint(_4155);
    bool _4159 = !_3191;
    int _4161 = _4159 ? 0 : 1;
    bool _4163 = uint(_4043) >= 2u;
    int _4165 = _4087 + 8;
    uint _4167 = uint(int(uint(_4165) >> uint(2)));
    uint _4169 = uint(int(uint(int(_4167)) >> uint(2)));
    int _4171 = int(_4167) & 3;
    float _4173 = (*spvDescriptorSet0.vp_c9)._m0[int(_4169)][_4171];
    int _4175 = int(_4167) + 1;
    uint _4177 = uint(int(uint(_4175) >> uint(2)));
    int _4179 = _4175 & 3;
    float _4181 = (*spvDescriptorSet0.vp_c9)._m0[int(_4177)][_4179];
    float _4183 = trunc(_4151);
    float _4185 = precise::max(_4183, 0.0);
    uint _4187 = uint(_4185);
    int _4189 = abs(_3259);
    float _4191 = fma(_3987, _3987, 1.0);
    int _4193 = _4163 ? 0 : 1;
    bool _4195 = _3189 != 3;
    int _4197 = ~_4189;
    int _4199 = _4197 + 1;
    int _4201 = _4199 + 1;
    int _4203 = _4129 * int(_4157);
    int _4205 = _4203 + _4023;
    int _4207 = ~_4005;
    int _4209 = _4207 + 1;
    float _4211 = rsqrt(_4191);
    int _4213 = ~_4193;
    int _4215 = _4213 + 1;
    int _4217 = _4215 + 1;
    int _4219 = _4201 * as_type<int>(_4065);
    int _4221 = _4217;
    if (_4149)
    {
        int _4223 = ~_4193;
        int _4225 = _4223 + 1;
        _4221 = _4225;
    }
    int _4227 = _4221;
    float _4229 = float(uint(_4205));
    int _4231 = _4209 * int(_4187);
    int _4233 = _4231 + _4083;
    bool _4235 = !_4045;
    int _4237 = _4235 ? 0 : 1;
    int _4239 = abs(_4161);
    float _4241 = as_type<float>(_4077) * _4229;
    float _4243 = float(uint(_4233));
    int _4245 = abs(_4237);
    int _4247 = abs(_4119);
    float _4249 = as_type<float>(_4121) * _4243;
    float _4251 = trunc(_4241);
    float _4253 = precise::max(_4251, 0.0);
    uint _4255 = uint(_4253);
    float _4257 = _3987 * _4211;
    int _4259 = ~_4239;
    int _4261 = _4259 + 1;
    int _4263 = _4261 + 1;
    int _4265 = abs(_3997);
    float _4267 = trunc(_4249);
    float _4269 = precise::max(_4267, 0.0);
    uint _4271 = uint(_4269);
    int _4273 = abs(_4227);
    int _4275 = _4263 * as_type<int>(_4057);
    int _4277 = _4275 + _4219;
    int _4279 = ~_4247;
    int _4281 = _4279 + 1;
    int _4283 = _4281 + 1;
    int _4285 = ~_4245;
    int _4287 = _4285 + 1;
    int _4289 = _4287 + 1;
    int _4291 = _4283 * as_type<int>(_4111);
    int _4293 = ~_4273;
    int _4295 = _4293 + 1;
    int _4297 = _4295 + 1;
    int _4299 = ~_4265;
    int _4301 = _4299 + 1;
    int _4303 = _4301 + 1;
    int _4305 = _4289 * as_type<int>(_4103);
    int _4307 = _4305 + _4291;
    bool _4309 = _4043 != 3;
    int _4311 = int(_4157) + int(_4255);
    int _4313 = _4297 * as_type<int>(_4173);
    int _4315 = _4313 + _4307;
    float _4317 = -_3891;
    float _4319 = _4257 * _4317;
    int _4321 = ~_3909;
    int _4323 = _4321 + 1;
    int _4325 = _4303 * as_type<int>(_4139);
    int _4327 = _4325 + _4277;
    bool _4329 = !_4195;
    int _4331 = _4329 ? 0 : (-1);
    float _4333 = fma(_4211, _3819, _4319);
    float _4335 = -_3897;
    float _4337 = _4257 * _4335;
    float _4339 = _3891 + _4035;
    bool _4341 = !_4309;
    int _4343 = _4341 ? 0 : (-1);
    float _4345 = fma(_4211, _3865, _4337);
    int _4347 = abs(_4331);
    float _4349 = -_3903;
    float _4351 = _4257 * _4349;
    int _4353 = abs(_4343);
    int _4355 = ~_4005;
    int _4357 = _4355 + 1;
    float _4359 = fma(_4211, _3869, _4351);
    int _4361 = _4323 * _4311;
    int _4363 = _4361 + _4023;
    int _4365 = int(_4187) + int(_4271);
    out.m_84.x = _4333;
    out.m_84.y = _4345;
    out.m_84.z = _4359;
    int _4367 = ~_4347;
    int _4369 = _4367 + 1;
    int _4371 = _4369 + 1;
    bool _4373 = uint(_4363) >= uint(_3909);
    int _4375 = _4357 * _4365;
    int _4377 = _4375 + _4083;
    int _4379 = ~_4353;
    int _4381 = _4379 + 1;
    int _4383 = _4381 + 1;
    int _4385 = _4371 * as_type<int>(_4147);
    int _4387 = _4385 + _4327;
    bool _4389 = !_3429;
    int _4391 = _4389 ? 0 : 1;
    bool _4393 = !_4373;
    int _4395 = _4393 ? 0 : (-1);
    int _4397 = _4383 * as_type<int>(_4181);
    int _4399 = _4397 + _4315;
    int _4401 = _4023 ^ _3909;
    bool _4403 = uint(_4377) >= uint(_4005);
    int _4405 = abs(_4391);
    float _4407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    uint _4409 = uint(int(uint(_4401) >> uint(31)));
    int _4411 = ~_4311;
    int _4413 = _4411 + _4395;
    int _4415 = _4413 + 1;
    bool _4417 = !_4403;
    int _4419 = _4417 ? 0 : (-1);
    bool _4421 = !_3441;
    int _4423 = _4421 ? 0 : 1;
    int _4425 = _3909 * _4415;
    int _4427 = _4425 + _4023;
    int _4429 = ~_4405;
    int _4431 = _4429 + 1;
    int _4433 = _4431 + 1;
    int _4435 = ~_4419;
    int _4437 = _4365 + _4435;
    int _4439 = _4437 + 1;
    int _4441 = ~int(_4409);
    int _4443 = _4441 + 1;
    int _4445 = _4387 * _4433;
    bool _4447 = _3909 == 0;
    float _4449 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _4451 = _3909 == 0;
    int _4453 = abs(_4423);
    int _4455 = _4439 ^ _4443;
    bool _4457 = !_4447;
    int _4459 = _4457 ? _4427 : (-1);
    int _4461 = ~_4453;
    int _4463 = _4461 + 1;
    int _4465 = _4463 + 1;
    int _4467 = ~_4443;
    int _4469 = _4467 + _4455;
    int _4471 = _4469 + 1;
    float _4473 = float(_4459);
    float _4475 = _4407 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _4477 = _4399 * _4465;
    bool _4479 = !_2585;
    int _4481 = _4479 ? _3925 : (-1);
    float _4483 = _1041 + 0.5;
    bool _4485 = !_4451;
    int _4487 = _4485 ? _4471 : (-1);
    float _4489 = fma(_4475, _4473, _1337);
    bool _4491 = !_2833;
    int _4493 = _4491 ? _3919 : (-1);
    int _4495 = _4481 * _4405;
    int _4497 = _4495 + _4445;
    float _4499 = float(_4487);
    float _4501 = _4449 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _4503 = in.m_86.x;
    float _4505 = fma(_4475, _4483, _4489);
    float _4507 = _919 + (-0.5);
    float _4509 = -_1339;
    float _4511 = fma(_4501, _4499, _4509);
    float _4513 = _2193 * 0.5;
    int _4515 = _4493 * _4453;
    int _4517 = _4515 + _4477;
    float _4519 = _3897 + _4069;
    float _4521 = -_4501;
    float _4523 = fma(_4521, _4507, _4511);
    float _4525 = -_2354;
    float _4527 = fma(_1041, _4525, _4505);
    float _4529 = float(_4497);
    float _4531 = -_1315;
    float _4533 = _4531 + 1.0;
    float _4535 = _2370 + _2193;
    float _4537 = _2221 + _2193;
    out.m_88.x = _4529;
    float _4539 = _4535 * 0.5;
    float _4541 = _4537 * 0.5;
    float _4543 = fma(_2227, -0.5, _4513);
    float _4545 = float(_4517);
    float _4547 = _3903 + _4079;
    out.m_90.x = _2280;
    out.m_90.y = _2282;
    out.m_90.z = _2284;
    bool _4549 = _1937 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4551 = isnan(_1937);
    bool _4553 = _4549 || _4551;
    bool _4555 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4557 = _4553 || _4555;
    float _4559 = fma(_919, _4533, _4523);
    out.m_92.x = _4541;
    out.m_92.y = _4543;
    out.m_92.z = _4539;
    out.m_92.w = _2193;
    float _4561 = _1911 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4563 = -_3945;
    float _4565 = fma(_4563, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_88.w = _4545;
    float _4567 = _4565 * _4503;
    out.m_94.x = _4339;
    out.m_94.y = _4519;
    out.m_94.z = _4547;
    float _4569 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _4571 = _4559;
    float _4573 = _4527;
    if (!_4557)
    {
        _2631 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4575 = _2631;
    float _4577 = _4567 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_96.x = _4527;
    out.m_96.y = _4559;
    float _4579 = _2266 * _3323;
    float _4581 = _2266 * _3327;
    float _4583 = fma(_2266, _3953, _2264);
    out.m_98.x = _4577;
    float _4585 = fma(_2272, _4579, _2260);
    float _4587 = fma(_2274, _4579, _2262);
    float _4589 = _4575;
    float _4591 = _4575;
    if (!_4557)
    {
        _2633 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4593 = _2633;
    float _4595 = _4593;
    float _4597 = _4593;
    if (!_4557)
    {
        _3991 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4599 = _3991;
    out.m_100.x = _4585;
    out.m_100.y = _4587;
    out.m_100.z = _4583;
    out.m_100.w = _4581;
    float _4601 = _4599;
    float _4603 = _4599;
    if (!_4557)
    {
        _4569 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4605 = _4569;
    float _4607 = _4605;
    float _4609 = _4605;
    if (!_4557)
    {
        _4571 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4611 = _4571;
    float _4613 = _4611;
    float _4615 = _4611;
    if (!_4557)
    {
        _4573 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4617 = _4573;
    bool _4619 = !_4557;
    float _4621 = _4617;
    float _4623 = _4617;
    if (!_4619)
    {
        bool _4625 = _1937 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4627 = isnan(_1937);
        bool _4629 = _4625 || _4627;
        bool _4631 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4633 = _4629 || _4631;
        if (!_4633)
        {
            float _4635 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4637 = _1937 + _4635;
            float _4639 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4641 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4639;
            float _4643 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4645 = _4643 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4647 = 1.0 / _4641;
            float _4649 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4651 = _4649 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4653 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4655 = _4653 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4657 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4659 = _4657 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4661 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4663 = _4661 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4665 = _4637 * _4647;
            float _4667 = precise::clamp(_4665, 0.0, 1.0);
            float _4669 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4671 = _4669 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4673 = fma(_4667, _4645, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4675 = fma(_4667, _4671, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4677 = fma(_4667, _4651, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4679 = fma(_4667, _4655, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4681 = fma(_4667, _4659, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4683 = fma(_4667, _4663, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4597 = _4677;
            _4615 = _4681;
            _4591 = _4673;
            _4609 = _4679;
            _4603 = _4675;
            _4623 = _4683;
            _4685 = true;
        }
        else
        {
            bool _4687 = _1937 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4689 = isnan(_1937);
            bool _4691 = _4687 || _4689;
            bool _4693 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4695 = _4691 || _4693;
            if (!_4695)
            {
                _4589 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4697 = _4589;
            _4591 = _4697;
            if (!_4695)
            {
                _4595 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4699 = _4595;
            _4597 = _4699;
            if (!_4695)
            {
                _4601 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4701 = _4601;
            _4603 = _4701;
            if (!_4695)
            {
                _4607 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4703 = _4607;
            _4609 = _4703;
            if (!_4695)
            {
                _4613 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4705 = _4613;
            _4615 = _4705;
            if (!_4695)
            {
                _4621 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4707 = _4621;
            bool _4709 = !_4695;
            _4623 = _4707;
            if (!_4709)
            {
                bool _4711 = _1937 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4713 = isnan(_1937);
                bool _4715 = _4711 || _4713;
                bool _4717 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4719 = _4715 || _4717;
                if (!_4719)
                {
                    float _4721 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4723 = _1937 + _4721;
                    float _4725 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4727 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4725;
                    float _4729 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4731 = _4729 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4733 = 1.0 / _4727;
                    float _4735 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4737 = _4735 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4739 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4741 = _4739 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4743 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4745 = _4743 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4747 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4749 = _4747 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4751 = _4723 * _4733;
                    float _4753 = precise::clamp(_4751, 0.0, 1.0);
                    float _4755 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4757 = _4755 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4759 = fma(_4753, _4731, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4761 = fma(_4753, _4757, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4763 = fma(_4753, _4737, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4765 = fma(_4753, _4741, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4767 = fma(_4753, _4745, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4769 = fma(_4753, _4749, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4597 = _4763;
                    _4615 = _4767;
                    _4591 = _4759;
                    _4609 = _4765;
                    _4603 = _4761;
                    _4623 = _4769;
                    _4685 = true;
                }
                else
                {
                    _4597 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4615 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4591 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4609 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4603 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4623 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4685 = false;
    float _4771 = _4597;
    float _4773 = _4615;
    float _4775 = _4591;
    float _4777 = _4609;
    float _4779 = _4603;
    float _4781 = _4623;
    float _4783 = _4561 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4785 = fma(_4519, -0.5, 0.5);
    float _4787 = precise::clamp(_4785, 0.0, 1.0);
    float _4789 = -_4771;
    float _4791 = _4789 + _4773;
    float _4793 = -_4775;
    float _4795 = _4793 + _4777;
    out.m_102.x = 0.0;
    float _4797 = fma(_4787, _4791, _4771);
    float _4799 = -_4779;
    float _4801 = _4799 + _4781;
    float _4803 = fma(_4787, _4795, _4775);
    float _4805 = _4797 * 0.586610972881317138671875;
    bool _4807 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4809 = fma(_4787, _4801, _4779);
    out.m_55.x = _4783;
    float _4811 = fma(_4803, 0.298911988735198974609375, _4805);
    bool _4813 = _1911 > 0.0;
    bool _4815 = isnan(_1911);
    bool _4817 = _4813 || _4815;
    bool _4819 = isnan(0.0);
    bool _4821 = _4817 || _4819;
    float _4823 = fma(_4809, 0.114477999508380889892578125, _4811);
    float _4825 = -_4823;
    float _4827 = _4803 + _4825;
    float _4829 = -_4823;
    float _4831 = _4797 + _4829;
    float _4833 = -_4823;
    float _4835 = _4809 + _4833;
    float _4837 = fma(_4827, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4823);
    float _4839 = fma(_4831, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4823);
    float _4841 = fma(_4835, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4823);
    bool _4843 = !_4807;
    if (!_4843)
    {
        float _4845 = -_1849;
        float _4847 = _4845 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4849 = -_1851;
        float _4851 = _4849 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4853 = -_1853;
        float _4855 = _4853 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4857 = _4847 * _4847;
        float _4859 = fma(_4851, _4851, _4857);
        float _4861 = fma(_4855, _4855, _4859);
        float _4863 = sqrt(_4861);
        float _4865 = rsqrt(_4861);
        float _4867 = -_4863;
        float _4869 = _4867 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4871 = _4869 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4873 = precise::clamp(_4871, 0.0, 1.0);
        float _4875 = _4851 * _4865;
        float _4877 = _4847 * _4865;
        float _4879 = abs(_4873);
        float _4881 = log2(_4879);
        float _4883 = _4855 * _4865;
        float _4885 = _4875 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4887 = _4519 * _4877;
        float _4889 = -_4877;
        float _4891 = -_4885;
        float _4893 = fma(_4889, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4891);
        float _4895 = fma(_4339, _4875, _4887);
        float _4897 = -_4883;
        float _4899 = fma(_4897, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4893);
        float _4901 = fma(_4547, _4883, _4895);
        float _4903 = precise::clamp(_4901, 0.0, 1.0);
        float _4905 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4907 = _4899 + _4905;
        float _4909 = _4881 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4911 = _4907 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4913 = precise::clamp(_4911, 0.0, 1.0);
        float _4915 = exp2(_4909);
        float _4917 = _4915 * _4913;
        float _4919 = _4903 * _4917;
        float _4921 = _4919 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4923 = _4919 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4925 = _4919 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_102.x = _4921;
        out.m_102.y = _4923;
        out.m_102.z = _4925;
    }
    out.m_104.x = _4837;
    out.m_104.y = _4839;
    out.m_104.z = _4841;
    if (_4821)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_55.x = 0.0;
    float _4927 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4927;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

