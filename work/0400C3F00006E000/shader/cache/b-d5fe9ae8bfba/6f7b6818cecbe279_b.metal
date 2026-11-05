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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_20 [[id(7)]];
    sampler vp_t_tcb_20Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    sampler vp_t_tcb_20Smplr_w [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_1CSmplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_66 [[user(locn0)]];
    float4 m_72 [[user(locn1)]];
    float4 m_74 [[user(locn2)]];
    float4 m_86 [[user(locn3)]];
    float4 m_94 [[user(locn4)]];
    float4 m_53 [[user(locn5)]];
    float4 m_68 [[user(locn6)]];
    float4 m_78 [[user(locn7)]];
    float4 m_80 [[user(locn8)]];
    float4 m_76 [[user(locn9)]];
    float4 m_92 [[user(locn10)]];
    float4 m_82 [[user(locn11)]];
    float4 m_88 [[user(locn12)]];
    float4 m_90 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_84 [[attribute(0)]];
    float4 m_70 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_50 [[attribute(3)]];
    float4 m_55 [[attribute(4)]];
    float4 m_62 [[attribute(5)]];
    float4 m_64 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2622 = false;
    bool _1713 = false;
    bool _577 = false;
    bool _427 = false;
    bool _233 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_50.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_53.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2921 = as_type<float>(_129);
        out.gl_Position.z = _2921;
    }
    if (!_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _133 = in.m_55.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = 0.0;
    float _151 = _147;
    if (_143)
    {
        float _153 = float(_113);
        _149 = _153;
    }
    float _155 = _149;
    bool _157 = _147 >= _155;
    bool _159 = !_143;
    bool _161 = _157 || _159;
    if (_161)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _123;
    if (_161)
    {
        out.m_53.x = 0.0;
    }
    if (_161)
    {
        float _165 = _163 * 5.0;
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2990 = as_type<float>(_167);
        out.gl_Position.z = _2990;
    }
    if (_161)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = in.m_60.x;
    float _173 = in.m_60.y;
    float _175 = in.m_60.z;
    int _177 = as_type<int>(_169) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_169) & 2;
    bool _183 = _181 != 0;
    bool _185 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _187 = _173 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _189 = _173 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _191 = _173 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _193 = !_179;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].x, _187);
    float _199 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].x, _189);
    float _201 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].x, _191);
    bool _203 = !_183;
    float _205 = _203 ? (-0.5) : 0.5;
    float _207 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[4].z, _197);
    float _209 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[5].z, _199);
    float _211 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[6].z, _201);
    bool _213 = !_185;
    float _231;
    if (!_213)
    {
        float _215 = in.m_62.x;
        float _217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _223 = _221 * _217;
        float _225 = floor(_223);
        float _227 = -_225;
        float _229 = _223 + _227;
        _231 = _229;
        _233 = true;
    }
    else
    {
        float _235 = float(_113);
        float _237 = 1.0 / _235;
        float _239 = _147 * _237;
        _231 = _239;
    }
    _233 = false;
    float _241 = _231;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = _241 + _243;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = _241 + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _253 = _241 + _251;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _255;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _261 = _259 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _263;
    bool _267 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _269 = isnan(_241);
    bool _271 = _267 || _269;
    bool _273 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _275 = _271 || _273;
    float _277 = float(_275);
    bool _279 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _281 = 1.0 / _257;
    float _283 = 1.0 / _265;
    float _285 = 1.0 / _261;
    float _287 = _245 * _281;
    bool _289 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _291 = isnan(_241);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = -_277;
    float _303 = _301 + 1.0;
    bool _305 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _307 = isnan(_241);
    bool _309 = _305 || _307;
    bool _311 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _313 = _309 || _311;
    float _315 = float(_313);
    float _317 = _299 * _303;
    float _319 = _249 * _283;
    float _321 = -_299;
    float _323 = _321 + 1.0;
    float _325 = _315 * _323;
    float _327 = -_315;
    float _329 = _327 + 1.0;
    float _331 = _253 * _285;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _337 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _339 = isnan(_241);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _353;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _361 = fma(_351, _287, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _363 = _347 * _329;
    float _365 = fma(_355, _287, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _367 = fma(_335, _331, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _369 = fma(_359, _331, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _371 = -_347;
    float _373 = _371 + 1.0;
    float _375 = _361 * _363;
    float _377 = _365 * _363;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _379;
    float _383 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].x, _375);
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _385;
    float _389 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].y, _377);
    float _391 = fma(_381, _319, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _393 = fma(_367, _325, _383);
    float _395 = fma(_387, _319, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _397 = fma(_369, _325, _389);
    float _399 = fma(_391, _317, _393);
    float _401 = fma(_395, _317, _397);
    float _403 = fma(_277, (*spvDescriptorSet0.vp_c9)._m0[146].x, _399);
    float _405 = fma(_277, (*spvDescriptorSet0.vp_c9)._m0[146].y, _401);
    bool _407 = !_279;
    float _425;
    if (!_407)
    {
        float _409 = in.m_62.x;
        float _411 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _413 = _409 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _415 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[11].y, _147);
        float _417 = _415 * _411;
        float _419 = floor(_417);
        float _421 = -_419;
        float _423 = _417 + _421;
        _425 = _423;
        _427 = true;
    }
    else
    {
        float _429 = float(_113);
        float _431 = 1.0 / _429;
        float _433 = _147 * _431;
        _425 = _433;
    }
    _427 = false;
    float _435 = _425;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _439 = _435 + _437;
    float _441 = in.m_64.x;
    float _443 = in.m_64.y;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _449 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _451 = isnan(_435);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _465 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _467 = isnan(_435);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _477;
    bool _481 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _483 = isnan(_435);
    bool _485 = _481 || _483;
    bool _487 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _489 = _485 || _487;
    float _491 = float(_489);
    float _493 = 1.0 / _447;
    float _495 = -_459;
    float _497 = _495 + 1.0;
    bool _499 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _501 = _475 * _497;
    float _503 = -_475;
    float _505 = _503 + 1.0;
    float _507 = 1.0 / _463;
    float _509 = _479 * _493;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _515 = _405 * _443;
    float _517 = _403 * _441;
    float _519 = fma(_509, _439, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _521 = -_491;
    float _523 = _521 + 1.0;
    float _525 = _519 * _501;
    float _527 = _513 * _507;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _531 = _435 + _529;
    float _533 = _459 * _523;
    float _535 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[115].x, _525);
    float _537 = fma(_527, _531, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _539 = fma(_537, _533, _535);
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _545 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[117].x, _539);
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _549 = _541 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _551 = _543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _553 = _545 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _555 = _547 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_66.x = _549;
    out.m_66.y = _551;
    out.m_66.z = _555;
    out.m_66.w = _553;
    bool _557 = !_499;
    float _575;
    if (!_557)
    {
        float _559 = in.m_62.x;
        float _561 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _563 = _559 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _565 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[11].w, _147);
        float _567 = _565 * _561;
        float _569 = floor(_567);
        float _571 = -_569;
        float _573 = _567 + _571;
        _575 = _573;
        _577 = true;
    }
    else
    {
        float _579 = float(_113);
        float _581 = 1.0 / _579;
        float _583 = _147 * _581;
        _575 = _583;
    }
    _577 = false;
    float _585 = _575;
    float _587 = in.m_62.x;
    float _589 = in.m_62.y;
    float _591 = in.m_62.z;
    float _593 = in.m_62.w;
    float _595 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _597 = in.m_50.x;
    float _599 = in.m_50.y;
    float _601 = in.m_50.z;
    int _603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _605 = _603 != 0;
    int _607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _609 = _607 != 0;
    int _611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _613 = _611 != 0;
    float _615 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _619 = _617 != 0;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _623 = _595 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _629 = _587 > 0.5;
    float _631 = _587 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _633 = _593 > 0.5;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _637 = _635 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _639 = -_195;
    int _641 = _629 ? as_type<int>(_639) : as_type<int>(_195);
    float _643 = _589 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _645 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _647 = _645 != 0;
    int _649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _651 = _649 != 0;
    float _653 = 1.0 / _637;
    bool _655 = !_605;
    float _657 = _655 ? _195 : as_type<float>(_641);
    float _659 = -_621;
    float _661 = fma(_631, 2.0, _659);
    bool _663 = _589 > 0.5;
    float _665 = fma(_643, -2.0, _625);
    float _667 = _599 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _669 = -_205;
    int _671 = _663 ? as_type<int>(_669) : as_type<int>(_205);
    float _673 = _599 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _675 = _599 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _677 = !_609;
    float _679 = _677 ? _205 : as_type<float>(_671);
    float _681 = _591 * 2.0;
    int _683 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _685 = _683 != 0;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _687;
    float _691 = _587 * 2.0;
    float _693 = floor(_681);
    float _695 = fma(_597, (*spvDescriptorSet0.vp_c10)._m0[4].x, _667);
    float _697 = fma(_597, (*spvDescriptorSet0.vp_c10)._m0[5].x, _673);
    float _699 = fma(_597, (*spvDescriptorSet0.vp_c10)._m0[6].x, _675);
    float _701 = _589 + _591;
    float _703 = _589 * 2.0;
    float _705 = _689 * _653;
    float _707 = _701 + (-1.0);
    float _709 = floor(_691);
    float _711 = -_195;
    int _713 = _663 ? as_type<int>(_711) : as_type<int>(_195);
    float _715 = -_147;
    float _717 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[76].x, _661);
    bool _719 = _591 > 0.5;
    float _721 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _723 = _589 + _587;
    bool _725 = !_647;
    float _727 = _725 ? _195 : as_type<float>(_713);
    float _729 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _665);
    float _731 = floor(_703);
    float _733 = -_195;
    int _735 = _719 ? as_type<int>(_733) : as_type<int>(_195);
    float _737 = _723 + (-1.0);
    float _739 = -_205;
    int _741 = _719 ? as_type<int>(_739) : as_type<int>(_205);
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _745 = _693 > 0.0;
    float _747 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _749 = !_651;
    float _751 = _749 ? _205 : as_type<float>(_741);
    float _753 = fma(_601, (*spvDescriptorSet0.vp_c10)._m0[6].z, _699);
    bool _755 = _693 >= 0.0;
    bool _757 = isnan(_693);
    bool _759 = _755 || _757;
    bool _761 = isnan(0.0);
    bool _763 = _759 || _761;
    float _765 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _767 = _753 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _769 = 0.0;
    float _771 = _693;
    if (!_685)
    {
        _769 = _589;
    }
    float _773 = _769;
    float _775 = 0.0;
    float _777 = _773;
    if (!_685)
    {
        _775 = _591;
    }
    float _779 = _775;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _783 = _779;
    if (!_685)
    {
        _771 = _591;
    }
    float _785 = _771;
    int _787 = _763 ? 0 : 1;
    bool _789 = !_619;
    float _791 = _789 ? _195 : as_type<float>(_735);
    float _793 = _785;
    if (_685)
    {
        _777 = _587;
    }
    float _795 = _777;
    if (_685)
    {
        _783 = _589;
    }
    float _797 = _783;
    float _799 = _765 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_685)
    {
        _793 = _589;
    }
    float _801 = _793;
    float _803 = _795 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _805 = _709 > 0.0;
    float _807 = _797 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _809 = _709 >= 0.0;
    bool _811 = isnan(_709);
    bool _813 = _809 || _811;
    bool _815 = isnan(0.0);
    bool _817 = _813 || _815;
    float _819 = fma(_601, (*spvDescriptorSet0.vp_c10)._m0[4].z, _695);
    bool _821 = _731 > 0.0;
    float _823 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[83].w, _781);
    bool _825 = _731 >= 0.0;
    bool _827 = isnan(_731);
    bool _829 = _825 || _827;
    bool _831 = isnan(0.0);
    bool _833 = _829 || _831;
    float _835 = fma(_601, (*spvDescriptorSet0.vp_c10)._m0[5].z, _697);
    bool _837 = _585 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _839 = isnan(_585);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _845 = _841 || _843;
    float _847 = float(_845);
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _851 = _585 + _849;
    int _853 = ~_787;
    int _855 = _853 + 1;
    int _857 = _855 + 1;
    float _859 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _861 = _857;
    if (!_745)
    {
        int _863 = ~_787;
        int _865 = _863 + 1;
        _861 = _865;
    }
    int _867 = _861;
    float _869 = fma(_705, _851, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _871 = _585 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _873 = isnan(_585);
    bool _875 = _871 || _873;
    bool _877 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _879 = _875 || _877;
    float _881 = float(_879);
    float _883 = -_847;
    float _885 = _883 + 1.0;
    float _887 = fma(_807, -2.0, _743);
    int _889 = _817 ? 0 : 1;
    float _891 = _881 * _885;
    float _893 = _657 + 0.5;
    int _895 = _833 ? 0 : 1;
    float _897 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _901 = _899 != 0;
    int _903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _905 = _903 != 0;
    int _907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _909 = _907 != 0;
    float _911 = fma(_623, _893, _717);
    float _913 = _869 * _891;
    float _915 = _615 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _917 = -_881;
    float _919 = _917 + 1.0;
    float _921 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _923 = log2(_921);
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _927 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _929 = _679 + (-0.5);
    float _931 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[131].x, _913);
    float _933 = -_925;
    float _935 = fma(_803, 2.0, _933);
    float _937 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[83].z, _927);
    float _939 = -_915;
    float _941 = -_729;
    float _943 = fma(_939, _929, _941);
    float _945 = _791 + 0.5;
    float _947 = -_147;
    float _949 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[81].x, _935);
    float _951 = _727 + 0.5;
    float _953 = -_205;
    int _955 = _633 ? as_type<int>(_953) : as_type<int>(_205);
    float _957 = _835 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _959 = fma(_799, _945, _949);
    float _961 = _951 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _963 = !_613;
    float _965 = _963 ? _205 : as_type<float>(_955);
    float _967 = _923 * _147;
    float _969 = -_751;
    float _971 = _969 + 0.5;
    float _973 = _961 * _897;
    float _975 = _859 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _977 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _887);
    float _979 = _971 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _981 = _965 + (-0.5);
    float _983 = exp2(_967);
    float _985 = _979 * _627;
    float _987 = -_975;
    float _989 = -_977;
    float _991 = fma(_987, _981, _989);
    float _993 = _819 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    out.m_68.x = _973;
    out.m_68.y = _985;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _997 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _999 = isnan(1.0);
    bool _1001 = _997 || _999;
    bool _1003 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1005 = _1001 || _1003;
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1009 = 1.0 + _1007;
    int _1011 = ~_895;
    int _1013 = _1011 + 1;
    int _1015 = _1013 + 1;
    float _1017 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[78].z, _995);
    int _1019 = _1015;
    if (!_821)
    {
        int _1021 = ~_895;
        int _1023 = _1021 + 1;
        _1019 = _1023;
    }
    int _1025 = _1019;
    float _1027 = 1.0 / _1009;
    float _1029 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1031 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1017);
    bool _1033 = !_901;
    int _1035 = _1033 ? 0 : 1;
    float _1037 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1039 = _957 + _1037;
    float _1041 = -_983;
    float _1043 = _1041 + 1.0;
    bool _1045 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1047 = isnan(0.0);
    bool _1049 = _1045 || _1047;
    bool _1051 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1053 = _1049 || _1051;
    float _1055 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _937);
    int _1057 = abs(_1035);
    float _1059 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1061 = _993 + _1059;
    float _1063 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1065 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1029);
    float _1067 = _1053 ? _1043 : 0.0;
    float _1069 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _823);
    float _1071 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1063);
    float _1073 = float(_867);
    float _1075 = -_1055;
    float _1077 = _1075 + 1.0;
    float _1079 = float(_1057);
    float _1081 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1065);
    if (_1005)
    {
        float _1083 = _1067 * _1027;
        _151 = _1083;
    }
    float _1085 = _151;
    float _1087 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[132].x, _931);
    float _1089 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1091 = _767 + _1089;
    float _1093 = _1079 * _1073;
    float _1095 = -_1077;
    float _1097 = fma(_791, _1095, _959);
    float _1099 = -_1031;
    float _1101 = _1099 + 1.0;
    float _1103 = in.m_70.x;
    float _1105 = in.m_70.y;
    float _1107 = in.m_70.z;
    float _1109 = -_1081;
    float _1111 = _1109 + 1.0;
    float _1113 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1071);
    bool _1115 = !_905;
    int _1117 = _1115 ? 0 : 1;
    float _1119 = -_1101;
    float _1121 = fma(_657, _1119, _911);
    float _1123 = -_1069;
    float _1125 = _1123 + 1.0;
    int _1127 = ~_889;
    int _1129 = _1127 + 1;
    int _1131 = _1129 + 1;
    float _1133 = _1039 * _1039;
    int _1135 = _1131;
    float _1137 = _1087;
    if (!_805)
    {
        int _1139 = ~_889;
        int _1141 = _1139 + 1;
        _1135 = _1141;
    }
    int _1143 = _1135;
    float _1145 = fma(_679, _1111, _943);
    int _1147 = abs(_1117);
    float _1149 = fma(_965, _1125, _991);
    bool _1151 = _1113 >= 0.0;
    float _1153 = fma(_1061, _1061, _1133);
    float _1155 = _1087 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1157 = _1093 * (-2.0);
    float _1159 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1161 = float(_1143);
    float _1163 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1165 = float(_1147);
    float _1167 = fma(_1091, _1091, _1153);
    float _1169 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1171 = _1159 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1173 = _1163 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1175 = _1165 * _1161;
    float _1177 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1179 = rsqrt(_1167);
    float _1181 = fma(_747, _1157, _747);
    float _1183 = fma(_1157, _1103, _1103);
    int _1185 = as_type<int>(_1175);
    if (_1151)
    {
        _1137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1187 = _1137;
    out.m_72.x = _1171;
    out.m_72.y = _1173;
    out.m_72.z = _1177;
    out.m_72.w = _1155;
    float _1189 = _517 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1191 = _589 + (-0.5);
    out.m_74.x = _1121;
    out.m_74.y = _1145;
    out.m_74.z = _1097;
    out.m_74.w = _1149;
    if (_1151)
    {
        out.m_53.x = 0.0;
    }
    float _1193 = _587 + (-0.5);
    float _1195 = _1175 * (-2.0);
    if (_1151)
    {
        float _1197 = _1187 * 5.0;
        _1185 = as_type<int>(_1197);
    }
    int _1199 = _1185;
    float _1201 = fma(_1193, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1183);
    float _1203 = _1189 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1205 = fma(_721, _1195, _721);
    float _1207 = fma(_1195, _1105, _1105);
    bool _1209 = !_909;
    int _1211 = _1209 ? 0 : 1;
    float _1213 = _1203 * _1179;
    float _1215 = _1205;
    if (_1151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4696 = as_type<float>(_1199);
        out.gl_Position.z = _4696;
    }
    float _1217 = fma(_1181, _1085, _1201);
    int _1219 = abs(_1211);
    float _1221 = _1061 * _1213;
    float _1223 = _1039 * _1213;
    if (_1151)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1225 = -_1223;
    float _1227 = _957 + _1225;
    float _1229 = _1091 * _1213;
    float _1231 = -_1221;
    float _1233 = _993 + _1231;
    float _1235 = float(_1025);
    float _1237 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1239 = _1227 + _1237;
    float _1241 = -_1229;
    float _1243 = _767 + _1241;
    float _1245 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1247 = _1233 + _1245;
    float _1249 = _1217 * 0.15915493667125701904296875;
    float _1251 = _1239 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1253 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1255 = _1243 + _1253;
    float _1257 = float(_1219);
    float _1259 = -_1223;
    float _1261 = _1039 + _1259;
    float _1263 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1251);
    float _1265 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1207);
    float _1267 = -_1221;
    float _1269 = _1061 + _1267;
    float _1271 = _1257 * _1235;
    float _1273 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1263);
    float _1275 = _1261 * _1261;
    float _1277 = fma(_1205, _1085, _1265);
    float _1279 = _591 + _587;
    float _1281 = -_1229;
    float _1283 = _1091 + _1281;
    bool _1285 = _1273 >= 0.0;
    float _1287 = fma(_1269, _1269, _1275);
    float _1289 = _1277 * 0.15915493667125701904296875;
    float _1291 = _1279 + (-1.0);
    float _1293 = fma(_1283, _1283, _1287);
    float _1295 = _1271 * (-2.0);
    float _1297 = _591 + (-0.5);
    float _1299 = fma(_1291, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1301 = _1249 * 6.283185482025146484375;
    float _1303 = sin(_1301);
    float _1305 = fma(_1295, _1107, _1107);
    float _1307 = fma(_1299, _1295, _1299);
    int _1309 = as_type<int>(_1297);
    if (_1285)
    {
        _1215 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1311 = _1215;
    float _1313 = fma(_1297, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1305);
    if (_1285)
    {
        out.m_53.x = 0.0;
    }
    float _1315 = _1249 * 6.283185482025146484375;
    float _1317 = cos(_1315);
    if (_1285)
    {
        float _1319 = _1311 * 5.0;
        _1309 = as_type<int>(_1319);
    }
    int _1321 = _1309;
    float _1323 = fma(_1307, _1085, _1313);
    if (_1285)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4879 = as_type<float>(_1321);
        out.gl_Position.z = _4879;
    }
    float _1325 = _1323 * 0.15915493667125701904296875;
    float _1327 = _1289 * 6.283185482025146484375;
    float _1329 = sin(_1327);
    float _1331 = sqrt(_1293);
    float _1333 = _1289 * 6.283185482025146484375;
    float _1335 = cos(_1333);
    if (_1285)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1337 = _1325 * 6.283185482025146484375;
    float _1339 = cos(_1337);
    float _1341 = _1179 * _1331;
    float _1343 = _515 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1345 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _1347 = _1317 * _1329;
    float _1349 = _1303 * _1329;
    float _1351 = _1341 * _1343;
    float _1353 = _1189 * _1341;
    float _1355 = _1325 * 6.283185482025146484375;
    float _1357 = sin(_1355);
    float _1359 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1361 = _1345 * _1351;
    float _1363 = _1317 * _1335;
    float _1365 = _1303 * _1335;
    float _1367 = _1359 * _1353;
    float _1369 = _1341 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1371 = _1369 * 0.5;
    float _1373 = _1317 * _1339;
    float _1375 = _1335 * _1339;
    float _1377 = _1303 * _1339;
    float _1379 = _1329 * _1339;
    float _1381 = _1373 * _1361;
    float _1383 = fma(_1357, _1363, _1349);
    float _1385 = -_1365;
    float _1387 = fma(_1357, _1347, _1385);
    float _1389 = -_1361;
    float _1391 = _1357 * _1389;
    float _1393 = -_1347;
    float _1395 = fma(_1357, _1365, _1393);
    float _1397 = fma(_1383, _1367, _1381);
    float _1399 = _1377 * _1361;
    float _1401 = fma(_1375, _1367, _1391);
    float _1403 = fma(_1357, _1349, _1363);
    float _1405 = fma(_1387, _1371, _1397);
    float _1407 = fma(_1395, _1367, _1399);
    float _1409 = fma(_1379, _1371, _1401);
    float _1411 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1413 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1415 = fma(_1403, _1371, _1407);
    float _1417 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1411);
    float _1419 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1413);
    float _1421 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1417);
    float _1423 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1419);
    float _1425 = _1421 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1427 = _1423 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1429 = _993 + _1425;
    float _1431 = _767 + _1427;
    float _1433 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1435 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1437 = _1429 + _1435;
    float _1439 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1441 = _1431 + _1439;
    float _1443 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1433);
    float _1445 = _1437 * _1437;
    float _1447 = _1441 * _1441;
    float _1449 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1443);
    float _1451 = _1445 + _1447;
    float _1453 = _1449 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1455 = sqrt(_1451);
    float _1457 = _957 + _1453;
    bool _1459 = _1455 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1461 = _1361;
    float _1463 = _1429;
    float _1465 = _1431;
    float _1467 = _1445;
    float _1469 = _1447;
    if (!_1459)
    {
        _1461 = _1457;
    }
    float _1471 = _1461;
    bool _1473 = !_1459;
    float _1475 = _1471;
    if (!_1473)
    {
        float _1477 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1479 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1481 = _1455 + _1479;
        float _1483 = rsqrt(_1451);
        float _1485 = _1481 * _1477;
        float _1487 = _1457 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1489 = _1485 * 0.15915493667125701904296875;
        float _1491 = _1489 * 6.283185482025146484375;
        float _1493 = sin(_1491);
        float _1495 = _1489 * 6.283185482025146484375;
        float _1497 = cos(_1495);
        float _1499 = fma(_1493, _1487, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1501 = _1483 * _1499;
        float _1503 = _1497 + (-1.0);
        float _1505 = fma(_1437, _1501, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1507 = fma(_1441, _1501, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1509 = _1503 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1511 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1513 = _1505 + _1511;
        float _1515 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1517 = _1507 + _1515;
        float _1519 = fma(_1457, _1497, _1509);
        float _1521 = _1513 * _1513;
        float _1523 = _1517 * _1517;
        _1463 = _1505;
        _1465 = _1507;
        _1475 = _1519;
        _1467 = _1521;
        _1469 = _1523;
    }
    float _1525 = _1463;
    float _1527 = _1465;
    float _1529 = _1475;
    float _1531 = _1467;
    float _1533 = _1469;
    float _1535 = fma(_1525, 6.2500002968590706586837768554688e-05, 0.5);
    float _1537 = fma(_1527, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5220 = float2(_1535, _1537);
    float3 _1541 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5220, float2(0.0), isnan(_5220)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5220, float2(0.0), isnan(_5220)), level(0.0)).xyz;
    float _1543 = _1541.x;
    float _1545 = _1541.y;
    float _1547 = _1541.z;
    float _1549 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1551 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1553 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1555 = _205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1557 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1549);
    float _1559 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1551);
    float _1561 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1553);
    float _1563 = fma(_1555, _1555, 1.0);
    float _1565 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1567 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1569 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1571 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1573 = -_1357;
    float _1575 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1565);
    float _1577 = rsqrt(_1563);
    float _1579 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1581 = -_1357;
    float _1583 = fma(_1581, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1567);
    float _1585 = -_1357;
    float _1587 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1569);
    float _1589 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1591 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1579);
    float _1593 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1595 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1597 = _1529 + _1595;
    float _1599 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1589);
    float _1601 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1575);
    float _1603 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1583);
    float _1605 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1587);
    float _1607 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1593);
    float _1609 = fma(_1597, _1597, _1531);
    float _1611 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1599);
    float _1613 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1561);
    float _1615 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1607);
    float _1617 = _1609 + _1533;
    float _1619 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1557);
    float _1621 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1559);
    float _1623 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1591);
    float _1625 = _1555 * _1577;
    float _1627 = _1555 * _1601;
    float _1629 = _1555 * _1603;
    float _1631 = _1555 * _1605;
    float _1633 = -_1611;
    float _1635 = _1625 * _1633;
    float _1637 = -_1623;
    float _1639 = _1625 * _1637;
    float _1641 = -_1615;
    float _1643 = _1625 * _1641;
    float _1645 = sqrt(_1617);
    float _1647 = fma(_1571, _1619, _1627);
    float _1649 = fma(_1571, _1621, _1629);
    float _1651 = fma(_1571, _1613, _1631);
    float _1653 = fma(_1577, _1601, _1635);
    float _1655 = fma(_1577, _1603, _1639);
    float _1657 = fma(_1577, _1605, _1643);
    float _1659 = _1611 + _1647;
    float _1661 = _1623 + _1649;
    float _1663 = _1615 + _1651;
    out.m_76.x = _1619;
    out.m_76.y = _1621;
    out.m_76.z = _1613;
    out.m_78.x = _1653;
    out.m_78.y = _1655;
    out.m_78.z = _1657;
    bool _1665 = _1645 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1667 = isnan(_1645);
    bool _1669 = _1665 || _1667;
    bool _1671 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1673 = _1669 || _1671;
    out.m_80.x = _1659;
    out.m_80.y = _1661;
    out.m_80.z = _1663;
    float _1675 = _1571;
    float _1677 = _1653;
    if (!_1673)
    {
        _1675 = 1.0;
    }
    float _1679 = _1675;
    out.m_82.x = _1543;
    out.m_82.y = _1545;
    out.m_82.z = _1547;
    bool _1681 = !_1673;
    float _1683 = _1679;
    if (!_1681)
    {
        bool _1685 = _1645 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1687 = isnan(_1645);
        bool _1689 = _1685 || _1687;
        bool _1691 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1693 = _1689 || _1691;
        if (!_1693)
        {
            float _1695 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1697 = _1645 + _1695;
            float _1699 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1701 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1699;
            float _1703 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1705 = _1703 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1707 = 1.0 / _1701;
            float _1709 = _1697 * _1707;
            float _1711 = fma(_1709, _1705, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1683 = _1711;
            _1713 = true;
        }
        else
        {
            bool _1715 = _1645 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1717 = isnan(_1645);
            bool _1719 = _1715 || _1717;
            bool _1721 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1723 = _1719 || _1721;
            if (!_1723)
            {
                float _1725 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1727 = _1645 + _1725;
                float _1729 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1731 = _1729 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1733 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1735 = _1733 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1737 = 1.0 / _1731;
                float _1739 = _1727 * _1737;
                float _1741 = fma(_1739, _1735, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1683 = _1741;
                _1713 = true;
            }
            else
            {
                _1683 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1713 = false;
    float _1743 = _1683;
    float _1745 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1747 = _1529 + _1745;
    float _1749 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1751 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1753 = _1525 + _1751;
    float _1755 = fma(_1747, _1743, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1757 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1749);
    float _1759 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1761 = _1527 + _1759;
    float _1763 = fma(_1753, _1743, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1765 = -_957;
    float _1767 = _1765 + _1755;
    float _1769 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1757);
    float _1771 = fma(_1761, _1743, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1773 = -_993;
    float _1775 = _1773 + _1763;
    float _1777 = _1767 * _1767;
    float _1779 = _1769 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1781 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1783 = -_767;
    float _1785 = _1783 + _1771;
    float _1787 = fma(_1775, _1775, _1777);
    float _1789 = 1.0 / _1779;
    float _1791 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1781);
    float _1793 = fma(_1785, _1785, _1787);
    float _1795 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1791);
    float _1797 = sqrt(_1793);
    float _1799 = _1795 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1801 = _1799 + _1779;
    float _1803 = _1801 * _1789;
    float _1805 = _1803 * 0.5;
    bool _1807 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1809 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1811 = _1807 || _1809;
    bool _1813 = isnan(0.5);
    bool _1815 = _1811 || _1813;
    float _1817 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1819 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1817);
    bool _1821 = _1797 > 0.0;
    float _1823 = 1.0 / _1819;
    bool _1825 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1827 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1829 = _1825 || _1827;
    bool _1831 = isnan(0.5);
    bool _1833 = _1829 || _1831;
    float _1835 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1837 = _1763;
    float _1839 = _1789;
    float _1841 = _1771;
    if (!_1821)
    {
        _1677 = _1755;
    }
    float _1843 = _1677;
    float _1845 = _1843;
    float _1847 = _1843;
    if (!_1821)
    {
        _1835 = _1771;
    }
    float _1849 = _1835;
    bool _1851 = !_1821;
    float _1853 = _1849;
    float _1855 = _1823;
    if (!_1851)
    {
        float _1857 = _209 * _209;
        float _1859 = rsqrt(_1793);
        float _1861 = fma(_207, _207, _1857);
        float _1863 = fma(_211, _211, _1861);
        float _1865 = sqrt(_1863);
        float _1867 = _1775 * _1859;
        float _1869 = _1767 * _1859;
        float _1871 = _1785 * _1859;
        bool _1873 = _1865 > 0.0;
        float _1875 = _1859;
        if (!_1873)
        {
            _1845 = _1755;
        }
        float _1877 = _1845;
        _1847 = _1877;
        if (!_1873)
        {
            _1875 = _1771;
        }
        float _1879 = _1875;
        bool _1881 = !_1873;
        _1853 = _1879;
        if (!_1881)
        {
            float _1883 = rsqrt(_1863);
            float _1885 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1887 = _209 * _1883;
            float _1889 = _207 * _1883;
            float _1891 = _1869 * _1887;
            float _1893 = _211 * _1883;
            float _1895 = fma(_1867, _1889, _1891);
            float _1897 = _1885 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1899 = fma(_1871, _1893, _1895);
            float _1901 = _1899 * _1897;
            float _1903 = fma(_207, _1901, _1763);
            float _1905 = fma(_209, _1901, _1755);
            float _1907 = fma(_211, _1901, _1771);
            _1837 = _1903;
            _1847 = _1905;
            _1853 = _1907;
            _1839 = _1885;
        }
    }
    float _1909 = _1837;
    float _1911 = _1847;
    float _1913 = _1853;
    float _1915 = _1839;
    float _1917 = -_1221;
    float _1919 = _1917 + _1909;
    float _1921 = -_1223;
    float _1923 = _1921 + _1911;
    float _1925 = -_1229;
    float _1927 = _1925 + _1913;
    float _1929 = _1923;
    float _1931 = _1919;
    float _1933 = _1927;
    if (_1815)
    {
        _1841 = 1.0;
    }
    float _1935 = _1841;
    float _1937 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1939 = _1823 * _1937;
    float _1941 = _1935;
    if (!_1833)
    {
        float _1943 = _1239 * _1239;
        float _1945 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1947 = -_767;
        float _1949 = _1947 + _1913;
        float _1951 = -_993;
        float _1953 = _1951 + _1909;
        float _1955 = fma(_1247, _1247, _1943);
        float _1957 = fma(_1255, _1255, _1955);
        float _1959 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1961 = sqrt(_1957);
        float _1963 = 1.0 / _1341;
        float _1965 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1967 = precise::min(_1961, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1969 = _1967 * _1945;
        float _1971 = _1969 * _1963;
        float _1973 = -_957;
        float _1975 = _1973 + _1911;
        float _1977 = _1965 * _1971;
        float _1979 = _1949 * _1971;
        float _1981 = fma(_1975, _1977, _1227);
        float _1983 = fma(_1953, _1977, _1233);
        float _1985 = fma(_1965, _1979, _1243);
        _1929 = _1981;
        _1931 = _1983;
        _1933 = _1985;
        _1855 = _1965;
    }
    float _1987 = _1929;
    float _1989 = _1931;
    float _1991 = _1933;
    float _1993 = _1855;
    float _1995 = _1993;
    if (!_1815)
    {
        float _1997 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1999 = _1997 * 0.15915493667125701904296875;
        float _2001 = _1999 * 6.283185482025146484375;
        float _2003 = cos(_2001);
        float _2005 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2007 = _2005 * 0.15915493667125701904296875;
        float _2009 = _1999 * 6.283185482025146484375;
        float _2011 = sin(_2009);
        float _2013 = 1.0 / _2003;
        float _2015 = _2007 * 6.283185482025146484375;
        float _2017 = cos(_2015);
        float _2019 = _2011 * _2013;
        float _2021 = _2007 * 6.283185482025146484375;
        float _2023 = sin(_2021);
        float _2025 = _2017 * _2019;
        float _2027 = 1.0 / _2025;
        float _2029 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2031 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2029;
        float _2033 = 1.0 / _2031;
        float _2035 = _2023 * _2027;
        float _2037 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2039 = fma(_1939, _2035, _2037);
        float _2041 = _2039 * _2033;
        float _2043 = precise::clamp(_2041, 0.0, 1.0);
        _1941 = _2043;
    }
    float _2045 = _1941;
    float _2047 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2049 = _1987 + _2047;
    float _2051 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2053 = _1989 + _2051;
    float _2055 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2057 = _1991 + _2055;
    float _2059 = _2049 * _2049;
    float _2061 = fma(_2053, _2053, _2059);
    float _2063 = fma(_2057, _2057, _2061);
    float _2065 = rsqrt(_2063);
    float _2067 = sqrt(_2063);
    float _2069 = _2065 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2071 = _2053 * _2069;
    float _2073 = _2057 * _2069;
    float _2075 = _2071 * _2071;
    float _2077 = _2073 * _2073;
    float _2079 = _2075 + _2077;
    float _2081 = sqrt(_2079);
    bool _2083 = _2081 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2085 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2087 = _2081 + _2085;
    float _2089 = _2065;
    float _2091 = _2087;
    float _2093 = _2049;
    if (_2083)
    {
        float _2095 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2089 = _2095;
    }
    float _2097 = _2089;
    float _2099 = _2097;
    if (_2083)
    {
        float _2101 = _2087 * _2097;
        _2091 = _2101;
    }
    float _2103 = _2091;
    if (_2083)
    {
        float _2105 = rsqrt(_2079);
        _2099 = _2105;
    }
    float _2107 = _2099;
    float _2109 = _2107;
    if (_2083)
    {
        float _2111 = _2103 * 0.15915493667125701904296875;
        _1995 = _2111;
    }
    float _2113 = _1995;
    float _2115 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2117 = _2057;
    float _2119 = _2113;
    if (_2083)
    {
        float _2121 = _2113 * 6.283185482025146484375;
        float _2123 = sin(_2121);
        _2117 = _2123;
    }
    float _2125 = _2117;
    float _2127 = precise::max(0.0, _2115);
    float _2129 = _1915;
    float _2131 = _2127;
    if (_2083)
    {
        float _2133 = _2113 * 6.283185482025146484375;
        float _2135 = cos(_2133);
        _2129 = _2135;
    }
    float _2137 = _2129;
    float _2139 = -_2069;
    float _2141 = -_2127;
    float _2143 = fma(_2049, _2139, _2141);
    float _2145 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2083)
    {
        float _2147 = _2143 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2093 = _2147;
    }
    float _2149 = _2093;
    float _2151 = fma(_1233, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2153 = _2125;
    float _2155 = _2149;
    if (_2083)
    {
        float _2157 = fma(_2125, _2149, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2153 = _2157;
    }
    float _2159 = _2153;
    float _2161 = _2159;
    if (!_2083)
    {
        _2155 = _2075;
    }
    float _2163 = _2155;
    float _2165 = floor(_2151);
    float _2167 = _2163;
    if (_2083)
    {
        float _2169 = _2107 * _2159;
        _2145 = _2169;
    }
    float _2171 = _2145;
    if (!_2083)
    {
        _2109 = _2071;
    }
    float _2173 = _2109;
    float _2175 = _2173;
    float _2177 = _2137;
    if (_2083)
    {
        float _2179 = _2137 + (-1.0);
        _2131 = _2179;
    }
    float _2181 = _2131;
    float _2183 = _2181;
    if (_2083)
    {
        float _2185 = _2071 * _2171;
        _2175 = _2185;
    }
    float _2187 = _2175;
    if (!_2083)
    {
        _2161 = _2143;
    }
    float _2189 = _2161;
    float _2191 = _1987 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2193 = _2189;
    if (_2083)
    {
        float _2195 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2119 = _2195;
    }
    float _2197 = _2119;
    if (!_2083)
    {
        _2183 = _2073;
    }
    float _2199 = _2183;
    float _2201 = _2199;
    if (_2083)
    {
        float _2203 = _2073 * _2171;
        _2201 = _2203;
    }
    float _2205 = _2201;
    if (_2083)
    {
        float _2207 = _2187 * _2187;
        _2167 = _2207;
    }
    float _2209 = _2167;
    if (_2083)
    {
        float _2211 = fma(_2143, _2137, _2197);
        _2193 = _2211;
    }
    float _2213 = _2193;
    if (!_2083)
    {
        _2177 = _2077;
    }
    float _2215 = _2177;
    float _2217 = _2215;
    if (_2083)
    {
        float _2219 = _2205 * _2205;
        _2217 = _2219;
    }
    float _2221 = _2217;
    float _2223 = fma(_2213, _2213, _2209);
    float _2225 = _1987 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2227 = -_2165;
    float _2229 = _2151 + _2227;
    float _2231 = _2223 + _2221;
    float _2233 = fma(_1989, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2191);
    float _2235 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2237 = fma(_2067, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2235);
    float _2239 = precise::clamp(_2237, 0.0, 1.0);
    float _2241 = _1987 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2243 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2233);
    float _2245 = rsqrt(_2231);
    float _2247 = -_2239;
    float _2249 = _2247 + 1.0;
    float _2251 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2253 = _2243 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2255 = fma(_1243, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2257 = _2253 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2259 = abs(_2249);
    float _2261 = log2(_2259);
    float _2263 = -_2257;
    float _2265 = fma(_2263, _2251, 1.0);
    float _2267 = _1987 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2269 = fma(_1989, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2241);
    float _2271 = _2245 * _2187;
    float _2273 = fma(_1989, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2267);
    float _2275 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2269);
    float _2277 = _2245 * _2213;
    float _2279 = _2271 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2281 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2273);
    float _2283 = _2275 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2285 = _2245 * _2205;
    float _2287 = fma(_1989, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2225);
    float _2289 = -_2279;
    float _2291 = fma(_2277, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2289);
    float _2293 = _2281 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2295 = _2283 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2297 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2287);
    float _2299 = -_2285;
    float _2301 = fma(_2299, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2291);
    float _2303 = _2261 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2305 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2295);
    float _2307 = log2(_2265);
    float _2309 = fma(_2301, -0.5, 0.5);
    float _2311 = _2283 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2313 = fma(_2253, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2305);
    float _2315 = floor(_2255);
    float _2317 = _2297 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2319 = fma(_2301, 0.5, 0.5);
    float _2321 = fma(_2317, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2313);
    float _2323 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2311);
    float _2325 = fma(_2319, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2327 = exp2(_2303);
    float _2329 = _2277 + 1.0;
    float _2331 = fma(_2253, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2323);
    float _2333 = 1.0 / _2321;
    float _2335 = _2283 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2337 = -_2315;
    float _2339 = _2255 + _2337;
    float _2341 = fma(_2319, _2325, -0.212114393711090087890625);
    float _2343 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2335);
    float _2345 = sqrt(_2309);
    float _2347 = fma(_2253, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2343);
    float _2349 = -_2277;
    float _2351 = fma(_2327, _2329, _2349);
    float _2353 = fma(_2317, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2331);
    float _2355 = _2307 * 0.693147182464599609375;
    float _2357 = fma(_2317, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2347);
    float2 _6591 = float2(_2229, _2339);
    float _2359 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6591, float2(0.0), isnan(_6591)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6591, float2(0.0), isnan(_6591)), level(0.0)).x;
    float _2361 = fma(_2319, _2341, 1.570728778839111328125);
    float _2363 = _2353 * _2333;
    float _2365 = _2357 * _2333;
    float _2367 = _2355 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2369 = fma(_2351, 0.5, 0.5);
    float _2371 = fma(_2363, 0.5, 0.5);
    float _2373 = fma(_2365, -0.5, 0.5);
    float _2375 = _2345 * 0.636619746685028076171875;
    float3 _6623 = float3(_2371, _2373, _2367);
    float _2377 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6623, float3(0.0), isnan(_6623)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6623, float3(0.0), isnan(_6623)), level(0.0)).x;
    float3 _6634 = float3(_2371, _2373, _2367);
    float4 _2380 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6634, float3(0.0), isnan(_6634)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6634, float3(0.0), isnan(_6634)), level(0.0)).xyzw;
    float _2382 = _2380.x;
    float _2384 = _2380.y;
    float _2386 = _2380.z;
    float _2388 = _2380.w;
    float _2390 = -_2361;
    float _2392 = fma(_2375, _2390, 1.0);
    float2 _6655 = float2(_2392, _2369);
    float3 _2394 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6655, float2(0.0), isnan(_6655)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6655, float2(0.0), isnan(_6655)), level(0.0)).xyz;
    float _2396 = _2394.x;
    float _2398 = _2394.y;
    float _2400 = _2394.z;
    float _2402 = abs(_1939);
    float _2404 = log2(_2402);
    bool _2406 = _2067 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2408 = isnan(_2067);
    bool _2410 = _2406 || _2408;
    bool _2412 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2414 = _2410 || _2412;
    float _2416 = _2404 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2418 = _2283 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2420 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2418);
    float _2422 = exp2(_2416);
    float _2424 = _2261 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2426 = fma(_2253, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2420);
    float _2428 = fma(_2317, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2426);
    float _2430 = exp2(_2424);
    float _2432 = fma(_2422, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2434 = precise::clamp(_2432, 0.0, 1.0);
    float _2436 = in.m_84.x;
    float _2438 = fma(_2434, -2.0, 3.0);
    float _2440 = _2434 * _2434;
    float _2442 = -_2430;
    float _2444 = _2442 + 1.0;
    float _2446 = _2440 * _2438;
    float _2448 = _2444 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2450 = -_2446;
    float _2452 = _2450 + 1.0;
    float _2454 = fma(_2452, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2446);
    bool _2456 = _1939 <= 8000.0;
    bool _2458 = isnan(_1939);
    bool _2460 = _2456 || _2458;
    bool _2462 = isnan(8000.0);
    bool _2464 = _2460 || _2462;
    float _2466 = float(_2464);
    float _2468 = _2428 + _2321;
    float _2470 = _2466 * _2454;
    float _2472 = _2468 * 0.5;
    out.gl_Position.x = _2353;
    out.gl_Position.y = _2357;
    out.gl_Position.z = _2428;
    out.gl_Position.w = _2321;
    float _2474 = _2470 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_86.z = _2472;
    out.m_86.w = _2321;
    float _2476 = _2321;
    float _2478 = _2428;
    float _2480 = _2357;
    float _2482 = _2353;
    if (!_2414)
    {
        _2476 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2484 = _2476;
    float _2486 = _2484;
    float _2488 = _2484;
    if (!_2414)
    {
        _2478 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2490 = _2478;
    float _2492 = _2490;
    float _2494 = _2490;
    if (!_2414)
    {
        _2480 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2496 = _2480;
    float _2498 = _2496;
    float _2500 = _2496;
    if (!_2414)
    {
        _2482 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2502 = _2482;
    float _2504 = -_2359;
    float _2506 = _2504 + 1.0;
    float _2508 = _2506 * _2474;
    float _2510 = precise::clamp(_2508, 0.0, 1.0);
    float _2512 = -_2510;
    float _2514 = fma(_2512, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2516 = _2448 * _2377;
    float _2518 = _2514 * _2436;
    float _2520 = -_2448;
    float _2522 = _2520 + 1.0;
    float _2524 = _2388 * _2516;
    float _2526 = _2518 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2528 = _2388 * _2522;
    float _2530 = _2400 * _2516;
    float _2532 = fma(_2396, _2524, _2382);
    float _2534 = fma(_2398, _2524, _2384);
    out.m_88.x = _2526;
    float _2536 = fma(_2388, _2530, _2386);
    float _2538 = _2045 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2540 = _2384;
    float _2542 = _2382;
    float _2544 = _2502;
    float _2546 = _2502;
    if (!_2414)
    {
        _2540 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2548 = _2540;
    float _2550 = _2548;
    float _2552 = _2548;
    if (!_2414)
    {
        _2542 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2554 = _2542;
    out.m_90.x = _2532;
    out.m_90.y = _2534;
    out.m_90.z = _2536;
    out.m_90.w = _2528;
    bool _2556 = !_2414;
    float _2558 = _2554;
    float _2560 = _2554;
    if (!_2556)
    {
        bool _2562 = _2067 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2564 = isnan(_2067);
        bool _2566 = _2562 || _2564;
        bool _2568 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2570 = _2566 || _2568;
        if (!_2570)
        {
            float _2572 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2574 = _2067 + _2572;
            float _2576 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2578 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2576;
            float _2580 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2582 = _2580 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2584 = 1.0 / _2578;
            float _2586 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2588 = _2586 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2592 = _2590 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2594 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2596 = _2594 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2598 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2600 = _2598 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2602 = _2574 * _2584;
            float _2604 = precise::clamp(_2602, 0.0, 1.0);
            float _2606 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2608 = _2606 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2610 = fma(_2604, _2582, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2612 = fma(_2604, _2608, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2614 = fma(_2604, _2588, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2616 = fma(_2604, _2592, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2618 = fma(_2604, _2596, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2620 = fma(_2604, _2600, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2560 = _2614;
            _2500 = _2618;
            _2552 = _2610;
            _2494 = _2616;
            _2488 = _2612;
            _2546 = _2620;
            _2622 = true;
        }
        else
        {
            bool _2624 = _2067 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2626 = isnan(_2067);
            bool _2628 = _2624 || _2626;
            bool _2630 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2632 = _2628 || _2630;
            if (!_2632)
            {
                _2550 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2634 = _2550;
            _2552 = _2634;
            if (!_2632)
            {
                _2558 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2636 = _2558;
            _2560 = _2636;
            if (!_2632)
            {
                _2486 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2638 = _2486;
            _2488 = _2638;
            if (!_2632)
            {
                _2492 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2640 = _2492;
            _2494 = _2640;
            if (!_2632)
            {
                _2498 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2642 = _2498;
            _2500 = _2642;
            if (!_2632)
            {
                _2544 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2644 = _2544;
            bool _2646 = !_2632;
            _2546 = _2644;
            if (!_2646)
            {
                bool _2648 = _2067 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2650 = isnan(_2067);
                bool _2652 = _2648 || _2650;
                bool _2654 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2656 = _2652 || _2654;
                if (!_2656)
                {
                    float _2658 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2660 = _2067 + _2658;
                    float _2662 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2664 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2662;
                    float _2666 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2668 = _2666 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2670 = 1.0 / _2664;
                    float _2672 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2674 = _2672 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2676 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2678 = _2676 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2680 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2682 = _2680 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2684 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2686 = _2684 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2688 = _2660 * _2670;
                    float _2690 = precise::clamp(_2688, 0.0, 1.0);
                    float _2692 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2694 = _2692 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2696 = fma(_2690, _2668, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2698 = fma(_2690, _2694, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2700 = fma(_2690, _2674, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2702 = fma(_2690, _2678, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2704 = fma(_2690, _2682, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2706 = fma(_2690, _2686, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2560 = _2700;
                    _2500 = _2704;
                    _2552 = _2696;
                    _2494 = _2702;
                    _2488 = _2698;
                    _2546 = _2706;
                    _2622 = true;
                }
                else
                {
                    _2560 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2500 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2552 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2494 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2488 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2546 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2622 = false;
    float _2708 = _2560;
    float _2710 = _2500;
    float _2712 = _2552;
    float _2714 = _2494;
    float _2716 = _2488;
    float _2718 = _2546;
    float _2720 = _2538 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2722 = fma(_1661, -0.5, 0.5);
    float _2724 = precise::clamp(_2722, 0.0, 1.0);
    float _2726 = -_2708;
    float _2728 = _2726 + _2710;
    float _2730 = -_2712;
    float _2732 = _2730 + _2714;
    out.m_53.x = _2720;
    float _2734 = fma(_2724, _2728, _2708);
    float _2736 = -_2716;
    float _2738 = _2736 + _2718;
    float _2740 = fma(_2724, _2732, _2712);
    float _2742 = _2734 * 0.586610972881317138671875;
    bool _2744 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2746 = fma(_2724, _2738, _2716);
    out.m_92.x = 0.0;
    float _2748 = fma(_2740, 0.298911988735198974609375, _2742);
    bool _2750 = _2045 > 0.0;
    bool _2752 = isnan(_2045);
    bool _2754 = _2750 || _2752;
    bool _2756 = isnan(0.0);
    bool _2758 = _2754 || _2756;
    float _2760 = fma(_2746, 0.114477999508380889892578125, _2748);
    float _2762 = -_2760;
    float _2764 = _2740 + _2762;
    float _2766 = -_2760;
    float _2768 = _2734 + _2766;
    float _2770 = -_2760;
    float _2772 = _2746 + _2770;
    float _2774 = fma(_2764, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2760);
    float _2776 = fma(_2768, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2760);
    float _2778 = fma(_2772, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2760);
    bool _2780 = !_2744;
    if (!_2780)
    {
        float _2782 = -_1987;
        float _2784 = _2782 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2786 = -_1989;
        float _2788 = _2786 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2790 = -_1991;
        float _2792 = _2790 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2794 = _2784 * _2784;
        float _2796 = fma(_2788, _2788, _2794);
        float _2798 = fma(_2792, _2792, _2796);
        float _2800 = sqrt(_2798);
        float _2802 = rsqrt(_2798);
        float _2804 = -_2800;
        float _2806 = _2804 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2808 = _2806 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2810 = precise::clamp(_2808, 0.0, 1.0);
        float _2812 = _2788 * _2802;
        float _2814 = _2784 * _2802;
        float _2816 = abs(_2810);
        float _2818 = log2(_2816);
        float _2820 = _2792 * _2802;
        float _2822 = _2812 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2824 = _1661 * _2814;
        float _2826 = -_2814;
        float _2828 = -_2822;
        float _2830 = fma(_2826, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2828);
        float _2832 = fma(_1659, _2812, _2824);
        float _2834 = -_2820;
        float _2836 = fma(_2834, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2830);
        float _2838 = fma(_1663, _2820, _2832);
        float _2840 = precise::clamp(_2838, 0.0, 1.0);
        float _2842 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2844 = _2836 + _2842;
        float _2846 = _2818 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2848 = _2844 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2850 = precise::clamp(_2848, 0.0, 1.0);
        float _2852 = exp2(_2846);
        float _2854 = _2852 * _2850;
        float _2856 = _2840 * _2854;
        float _2858 = _2856 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2860 = _2856 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2862 = _2856 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _2858;
        out.m_92.y = _2860;
        out.m_92.z = _2862;
    }
    out.m_94.x = _2774;
    out.m_94.y = _2776;
    out.m_94.z = _2778;
    if (_2758)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _2864 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2864;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2622 = false;
    bool _1713 = false;
    bool _577 = false;
    bool _427 = false;
    bool _233 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_50.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_53.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2921 = as_type<float>(_129);
        out.gl_Position.z = _2921;
    }
    if (!_117)
    {
        return out;
    }
    float _133 = in.m_55.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = 0.0;
    float _151 = _147;
    if (_143)
    {
        float _153 = float(_113);
        _149 = _153;
    }
    float _155 = _149;
    bool _157 = _147 >= _155;
    bool _159 = !_143;
    bool _161 = _157 || _159;
    if (_161)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _123;
    if (_161)
    {
        out.m_53.x = 0.0;
    }
    if (_161)
    {
        float _165 = _163 * 5.0;
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2990 = as_type<float>(_167);
        out.gl_Position.z = _2990;
    }
    if (_161)
    {
        return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = in.m_60.x;
    float _173 = in.m_60.y;
    float _175 = in.m_60.z;
    int _177 = as_type<int>(_169) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_169) & 2;
    bool _183 = _181 != 0;
    bool _185 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _187 = _173 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _189 = _173 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _191 = _173 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _193 = !_179;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].x, _187);
    float _199 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].x, _189);
    float _201 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].x, _191);
    bool _203 = !_183;
    float _205 = _203 ? (-0.5) : 0.5;
    float _207 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[4].z, _197);
    float _209 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[5].z, _199);
    float _211 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[6].z, _201);
    bool _213 = !_185;
    float _231;
    if (!_213)
    {
        float _215 = in.m_62.x;
        float _217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _223 = _221 * _217;
        float _225 = floor(_223);
        float _227 = -_225;
        float _229 = _223 + _227;
        _231 = _229;
        _233 = true;
    }
    else
    {
        float _235 = float(_113);
        float _237 = 1.0 / _235;
        float _239 = _147 * _237;
        _231 = _239;
    }
    _233 = false;
    float _241 = _231;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = _241 + _243;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = _241 + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _253 = _241 + _251;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _255;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _261 = _259 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _263;
    bool _267 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _269 = isnan(_241);
    bool _271 = _267 || _269;
    bool _273 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _275 = _271 || _273;
    float _277 = float(_275);
    bool _279 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _281 = 1.0 / _257;
    float _283 = 1.0 / _265;
    float _285 = 1.0 / _261;
    float _287 = _245 * _281;
    bool _289 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _291 = isnan(_241);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = -_277;
    float _303 = _301 + 1.0;
    bool _305 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _307 = isnan(_241);
    bool _309 = _305 || _307;
    bool _311 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _313 = _309 || _311;
    float _315 = float(_313);
    float _317 = _299 * _303;
    float _319 = _249 * _283;
    float _321 = -_299;
    float _323 = _321 + 1.0;
    float _325 = _315 * _323;
    float _327 = -_315;
    float _329 = _327 + 1.0;
    float _331 = _253 * _285;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _337 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _339 = isnan(_241);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _353;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _361 = fma(_351, _287, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _363 = _347 * _329;
    float _365 = fma(_355, _287, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _367 = fma(_335, _331, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _369 = fma(_359, _331, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _371 = -_347;
    float _373 = _371 + 1.0;
    float _375 = _361 * _363;
    float _377 = _365 * _363;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _379;
    float _383 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].x, _375);
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _385;
    float _389 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].y, _377);
    float _391 = fma(_381, _319, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _393 = fma(_367, _325, _383);
    float _395 = fma(_387, _319, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _397 = fma(_369, _325, _389);
    float _399 = fma(_391, _317, _393);
    float _401 = fma(_395, _317, _397);
    float _403 = fma(_277, (*spvDescriptorSet0.vp_c9)._m0[146].x, _399);
    float _405 = fma(_277, (*spvDescriptorSet0.vp_c9)._m0[146].y, _401);
    bool _407 = !_279;
    float _425;
    if (!_407)
    {
        float _409 = in.m_62.x;
        float _411 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _413 = _409 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _415 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[11].y, _147);
        float _417 = _415 * _411;
        float _419 = floor(_417);
        float _421 = -_419;
        float _423 = _417 + _421;
        _425 = _423;
        _427 = true;
    }
    else
    {
        float _429 = float(_113);
        float _431 = 1.0 / _429;
        float _433 = _147 * _431;
        _425 = _433;
    }
    _427 = false;
    float _435 = _425;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _439 = _435 + _437;
    float _441 = in.m_64.x;
    float _443 = in.m_64.y;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _449 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _451 = isnan(_435);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _465 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _467 = isnan(_435);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _477;
    bool _481 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _483 = isnan(_435);
    bool _485 = _481 || _483;
    bool _487 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _489 = _485 || _487;
    float _491 = float(_489);
    float _493 = 1.0 / _447;
    float _495 = -_459;
    float _497 = _495 + 1.0;
    bool _499 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _501 = _475 * _497;
    float _503 = -_475;
    float _505 = _503 + 1.0;
    float _507 = 1.0 / _463;
    float _509 = _479 * _493;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _515 = _405 * _443;
    float _517 = _403 * _441;
    float _519 = fma(_509, _439, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _521 = -_491;
    float _523 = _521 + 1.0;
    float _525 = _519 * _501;
    float _527 = _513 * _507;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _531 = _435 + _529;
    float _533 = _459 * _523;
    float _535 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[115].x, _525);
    float _537 = fma(_527, _531, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _539 = fma(_537, _533, _535);
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _545 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[117].x, _539);
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _549 = _541 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _551 = _543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _553 = _545 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _555 = _547 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_66.x = _549;
    out.m_66.y = _551;
    out.m_66.z = _555;
    out.m_66.w = _553;
    bool _557 = !_499;
    float _575;
    if (!_557)
    {
        float _559 = in.m_62.x;
        float _561 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _563 = _559 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _565 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[11].w, _147);
        float _567 = _565 * _561;
        float _569 = floor(_567);
        float _571 = -_569;
        float _573 = _567 + _571;
        _575 = _573;
        _577 = true;
    }
    else
    {
        float _579 = float(_113);
        float _581 = 1.0 / _579;
        float _583 = _147 * _581;
        _575 = _583;
    }
    _577 = false;
    float _585 = _575;
    float _587 = in.m_62.x;
    float _589 = in.m_62.y;
    float _591 = in.m_62.z;
    float _593 = in.m_62.w;
    float _595 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _597 = in.m_50.x;
    float _599 = in.m_50.y;
    float _601 = in.m_50.z;
    int _603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _605 = _603 != 0;
    int _607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _609 = _607 != 0;
    int _611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _613 = _611 != 0;
    float _615 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _619 = _617 != 0;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _623 = _595 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _629 = _587 > 0.5;
    float _631 = _587 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _633 = _593 > 0.5;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _637 = _635 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _639 = -_195;
    int _641 = _629 ? as_type<int>(_639) : as_type<int>(_195);
    float _643 = _589 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _645 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _647 = _645 != 0;
    int _649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _651 = _649 != 0;
    float _653 = 1.0 / _637;
    bool _655 = !_605;
    float _657 = _655 ? _195 : as_type<float>(_641);
    float _659 = -_621;
    float _661 = fma(_631, 2.0, _659);
    bool _663 = _589 > 0.5;
    float _665 = fma(_643, -2.0, _625);
    float _667 = _599 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _669 = -_205;
    int _671 = _663 ? as_type<int>(_669) : as_type<int>(_205);
    float _673 = _599 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _675 = _599 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _677 = !_609;
    float _679 = _677 ? _205 : as_type<float>(_671);
    float _681 = _591 * 2.0;
    int _683 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _685 = _683 != 0;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _687;
    float _691 = _587 * 2.0;
    float _693 = floor(_681);
    float _695 = fma(_597, (*spvDescriptorSet0.vp_c10)._m0[4].x, _667);
    float _697 = fma(_597, (*spvDescriptorSet0.vp_c10)._m0[5].x, _673);
    float _699 = fma(_597, (*spvDescriptorSet0.vp_c10)._m0[6].x, _675);
    float _701 = _589 + _591;
    float _703 = _589 * 2.0;
    float _705 = _689 * _653;
    float _707 = _701 + (-1.0);
    float _709 = floor(_691);
    float _711 = -_195;
    int _713 = _663 ? as_type<int>(_711) : as_type<int>(_195);
    float _715 = -_147;
    float _717 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[76].x, _661);
    bool _719 = _591 > 0.5;
    float _721 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _723 = _589 + _587;
    bool _725 = !_647;
    float _727 = _725 ? _195 : as_type<float>(_713);
    float _729 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _665);
    float _731 = floor(_703);
    float _733 = -_195;
    int _735 = _719 ? as_type<int>(_733) : as_type<int>(_195);
    float _737 = _723 + (-1.0);
    float _739 = -_205;
    int _741 = _719 ? as_type<int>(_739) : as_type<int>(_205);
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _745 = _693 > 0.0;
    float _747 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _749 = !_651;
    float _751 = _749 ? _205 : as_type<float>(_741);
    float _753 = fma(_601, (*spvDescriptorSet0.vp_c10)._m0[6].z, _699);
    bool _755 = _693 >= 0.0;
    bool _757 = isnan(_693);
    bool _759 = _755 || _757;
    bool _761 = isnan(0.0);
    bool _763 = _759 || _761;
    float _765 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _767 = _753 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _769 = 0.0;
    float _771 = _693;
    if (!_685)
    {
        _769 = _589;
    }
    float _773 = _769;
    float _775 = 0.0;
    float _777 = _773;
    if (!_685)
    {
        _775 = _591;
    }
    float _779 = _775;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _783 = _779;
    if (!_685)
    {
        _771 = _591;
    }
    float _785 = _771;
    int _787 = _763 ? 0 : 1;
    bool _789 = !_619;
    float _791 = _789 ? _195 : as_type<float>(_735);
    float _793 = _785;
    if (_685)
    {
        _777 = _587;
    }
    float _795 = _777;
    if (_685)
    {
        _783 = _589;
    }
    float _797 = _783;
    float _799 = _765 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_685)
    {
        _793 = _589;
    }
    float _801 = _793;
    float _803 = _795 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _805 = _709 > 0.0;
    float _807 = _797 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _809 = _709 >= 0.0;
    bool _811 = isnan(_709);
    bool _813 = _809 || _811;
    bool _815 = isnan(0.0);
    bool _817 = _813 || _815;
    float _819 = fma(_601, (*spvDescriptorSet0.vp_c10)._m0[4].z, _695);
    bool _821 = _731 > 0.0;
    float _823 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[83].w, _781);
    bool _825 = _731 >= 0.0;
    bool _827 = isnan(_731);
    bool _829 = _825 || _827;
    bool _831 = isnan(0.0);
    bool _833 = _829 || _831;
    float _835 = fma(_601, (*spvDescriptorSet0.vp_c10)._m0[5].z, _697);
    bool _837 = _585 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _839 = isnan(_585);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _845 = _841 || _843;
    float _847 = float(_845);
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _851 = _585 + _849;
    int _853 = ~_787;
    int _855 = _853 + 1;
    int _857 = _855 + 1;
    float _859 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _861 = _857;
    if (!_745)
    {
        int _863 = ~_787;
        int _865 = _863 + 1;
        _861 = _865;
    }
    int _867 = _861;
    float _869 = fma(_705, _851, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _871 = _585 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _873 = isnan(_585);
    bool _875 = _871 || _873;
    bool _877 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _879 = _875 || _877;
    float _881 = float(_879);
    float _883 = -_847;
    float _885 = _883 + 1.0;
    float _887 = fma(_807, -2.0, _743);
    int _889 = _817 ? 0 : 1;
    float _891 = _881 * _885;
    float _893 = _657 + 0.5;
    int _895 = _833 ? 0 : 1;
    float _897 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _901 = _899 != 0;
    int _903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _905 = _903 != 0;
    int _907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _909 = _907 != 0;
    float _911 = fma(_623, _893, _717);
    float _913 = _869 * _891;
    float _915 = _615 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _917 = -_881;
    float _919 = _917 + 1.0;
    float _921 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _923 = log2(_921);
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _927 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _929 = _679 + (-0.5);
    float _931 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[131].x, _913);
    float _933 = -_925;
    float _935 = fma(_803, 2.0, _933);
    float _937 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[83].z, _927);
    float _939 = -_915;
    float _941 = -_729;
    float _943 = fma(_939, _929, _941);
    float _945 = _791 + 0.5;
    float _947 = -_147;
    float _949 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[81].x, _935);
    float _951 = _727 + 0.5;
    float _953 = -_205;
    int _955 = _633 ? as_type<int>(_953) : as_type<int>(_205);
    float _957 = _835 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _959 = fma(_799, _945, _949);
    float _961 = _951 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _963 = !_613;
    float _965 = _963 ? _205 : as_type<float>(_955);
    float _967 = _923 * _147;
    float _969 = -_751;
    float _971 = _969 + 0.5;
    float _973 = _961 * _897;
    float _975 = _859 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _977 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _887);
    float _979 = _971 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _981 = _965 + (-0.5);
    float _983 = exp2(_967);
    float _985 = _979 * _627;
    float _987 = -_975;
    float _989 = -_977;
    float _991 = fma(_987, _981, _989);
    float _993 = _819 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    out.m_68.x = _973;
    out.m_68.y = _985;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _997 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _999 = isnan(1.0);
    bool _1001 = _997 || _999;
    bool _1003 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1005 = _1001 || _1003;
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1009 = 1.0 + _1007;
    int _1011 = ~_895;
    int _1013 = _1011 + 1;
    int _1015 = _1013 + 1;
    float _1017 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[78].z, _995);
    int _1019 = _1015;
    if (!_821)
    {
        int _1021 = ~_895;
        int _1023 = _1021 + 1;
        _1019 = _1023;
    }
    int _1025 = _1019;
    float _1027 = 1.0 / _1009;
    float _1029 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1031 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1017);
    bool _1033 = !_901;
    int _1035 = _1033 ? 0 : 1;
    float _1037 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1039 = _957 + _1037;
    float _1041 = -_983;
    float _1043 = _1041 + 1.0;
    bool _1045 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1047 = isnan(0.0);
    bool _1049 = _1045 || _1047;
    bool _1051 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1053 = _1049 || _1051;
    float _1055 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _937);
    int _1057 = abs(_1035);
    float _1059 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1061 = _993 + _1059;
    float _1063 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1065 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1029);
    float _1067 = _1053 ? _1043 : 0.0;
    float _1069 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _823);
    float _1071 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1063);
    float _1073 = float(_867);
    float _1075 = -_1055;
    float _1077 = _1075 + 1.0;
    float _1079 = float(_1057);
    float _1081 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1065);
    if (_1005)
    {
        float _1083 = _1067 * _1027;
        _151 = _1083;
    }
    float _1085 = _151;
    float _1087 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[132].x, _931);
    float _1089 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1091 = _767 + _1089;
    float _1093 = _1079 * _1073;
    float _1095 = -_1077;
    float _1097 = fma(_791, _1095, _959);
    float _1099 = -_1031;
    float _1101 = _1099 + 1.0;
    float _1103 = in.m_70.x;
    float _1105 = in.m_70.y;
    float _1107 = in.m_70.z;
    float _1109 = -_1081;
    float _1111 = _1109 + 1.0;
    float _1113 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1071);
    bool _1115 = !_905;
    int _1117 = _1115 ? 0 : 1;
    float _1119 = -_1101;
    float _1121 = fma(_657, _1119, _911);
    float _1123 = -_1069;
    float _1125 = _1123 + 1.0;
    int _1127 = ~_889;
    int _1129 = _1127 + 1;
    int _1131 = _1129 + 1;
    float _1133 = _1039 * _1039;
    int _1135 = _1131;
    float _1137 = _1087;
    if (!_805)
    {
        int _1139 = ~_889;
        int _1141 = _1139 + 1;
        _1135 = _1141;
    }
    int _1143 = _1135;
    float _1145 = fma(_679, _1111, _943);
    int _1147 = abs(_1117);
    float _1149 = fma(_965, _1125, _991);
    bool _1151 = _1113 >= 0.0;
    float _1153 = fma(_1061, _1061, _1133);
    float _1155 = _1087 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1157 = _1093 * (-2.0);
    float _1159 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1161 = float(_1143);
    float _1163 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1165 = float(_1147);
    float _1167 = fma(_1091, _1091, _1153);
    float _1169 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1171 = _1159 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1173 = _1163 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1175 = _1165 * _1161;
    float _1177 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1179 = rsqrt(_1167);
    float _1181 = fma(_747, _1157, _747);
    float _1183 = fma(_1157, _1103, _1103);
    int _1185 = as_type<int>(_1175);
    if (_1151)
    {
        _1137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1187 = _1137;
    out.m_72.x = _1171;
    out.m_72.y = _1173;
    out.m_72.z = _1177;
    out.m_72.w = _1155;
    float _1189 = _517 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1191 = _589 + (-0.5);
    out.m_74.x = _1121;
    out.m_74.y = _1145;
    out.m_74.z = _1097;
    out.m_74.w = _1149;
    if (_1151)
    {
        out.m_53.x = 0.0;
    }
    float _1193 = _587 + (-0.5);
    float _1195 = _1175 * (-2.0);
    if (_1151)
    {
        float _1197 = _1187 * 5.0;
        _1185 = as_type<int>(_1197);
    }
    int _1199 = _1185;
    float _1201 = fma(_1193, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1183);
    float _1203 = _1189 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1205 = fma(_721, _1195, _721);
    float _1207 = fma(_1195, _1105, _1105);
    bool _1209 = !_909;
    int _1211 = _1209 ? 0 : 1;
    float _1213 = _1203 * _1179;
    float _1215 = _1205;
    if (_1151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4696 = as_type<float>(_1199);
        out.gl_Position.z = _4696;
    }
    float _1217 = fma(_1181, _1085, _1201);
    int _1219 = abs(_1211);
    float _1221 = _1061 * _1213;
    float _1223 = _1039 * _1213;
    if (_1151)
    {
        return out;
    }
    float _1225 = -_1223;
    float _1227 = _957 + _1225;
    float _1229 = _1091 * _1213;
    float _1231 = -_1221;
    float _1233 = _993 + _1231;
    float _1235 = float(_1025);
    float _1237 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1239 = _1227 + _1237;
    float _1241 = -_1229;
    float _1243 = _767 + _1241;
    float _1245 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1247 = _1233 + _1245;
    float _1249 = _1217 * 0.15915493667125701904296875;
    float _1251 = _1239 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1253 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1255 = _1243 + _1253;
    float _1257 = float(_1219);
    float _1259 = -_1223;
    float _1261 = _1039 + _1259;
    float _1263 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1251);
    float _1265 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1207);
    float _1267 = -_1221;
    float _1269 = _1061 + _1267;
    float _1271 = _1257 * _1235;
    float _1273 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1263);
    float _1275 = _1261 * _1261;
    float _1277 = fma(_1205, _1085, _1265);
    float _1279 = _591 + _587;
    float _1281 = -_1229;
    float _1283 = _1091 + _1281;
    bool _1285 = _1273 >= 0.0;
    float _1287 = fma(_1269, _1269, _1275);
    float _1289 = _1277 * 0.15915493667125701904296875;
    float _1291 = _1279 + (-1.0);
    float _1293 = fma(_1283, _1283, _1287);
    float _1295 = _1271 * (-2.0);
    float _1297 = _591 + (-0.5);
    float _1299 = fma(_1291, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1301 = _1249 * 6.283185482025146484375;
    float _1303 = sin(_1301);
    float _1305 = fma(_1295, _1107, _1107);
    float _1307 = fma(_1299, _1295, _1299);
    int _1309 = as_type<int>(_1297);
    if (_1285)
    {
        _1215 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1311 = _1215;
    float _1313 = fma(_1297, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1305);
    if (_1285)
    {
        out.m_53.x = 0.0;
    }
    float _1315 = _1249 * 6.283185482025146484375;
    float _1317 = cos(_1315);
    if (_1285)
    {
        float _1319 = _1311 * 5.0;
        _1309 = as_type<int>(_1319);
    }
    int _1321 = _1309;
    float _1323 = fma(_1307, _1085, _1313);
    if (_1285)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4879 = as_type<float>(_1321);
        out.gl_Position.z = _4879;
    }
    float _1325 = _1323 * 0.15915493667125701904296875;
    float _1327 = _1289 * 6.283185482025146484375;
    float _1329 = sin(_1327);
    float _1331 = sqrt(_1293);
    float _1333 = _1289 * 6.283185482025146484375;
    float _1335 = cos(_1333);
    if (_1285)
    {
        return out;
    }
    float _1337 = _1325 * 6.283185482025146484375;
    float _1339 = cos(_1337);
    float _1341 = _1179 * _1331;
    float _1343 = _515 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1345 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _1347 = _1317 * _1329;
    float _1349 = _1303 * _1329;
    float _1351 = _1341 * _1343;
    float _1353 = _1189 * _1341;
    float _1355 = _1325 * 6.283185482025146484375;
    float _1357 = sin(_1355);
    float _1359 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1361 = _1345 * _1351;
    float _1363 = _1317 * _1335;
    float _1365 = _1303 * _1335;
    float _1367 = _1359 * _1353;
    float _1369 = _1341 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1371 = _1369 * 0.5;
    float _1373 = _1317 * _1339;
    float _1375 = _1335 * _1339;
    float _1377 = _1303 * _1339;
    float _1379 = _1329 * _1339;
    float _1381 = _1373 * _1361;
    float _1383 = fma(_1357, _1363, _1349);
    float _1385 = -_1365;
    float _1387 = fma(_1357, _1347, _1385);
    float _1389 = -_1361;
    float _1391 = _1357 * _1389;
    float _1393 = -_1347;
    float _1395 = fma(_1357, _1365, _1393);
    float _1397 = fma(_1383, _1367, _1381);
    float _1399 = _1377 * _1361;
    float _1401 = fma(_1375, _1367, _1391);
    float _1403 = fma(_1357, _1349, _1363);
    float _1405 = fma(_1387, _1371, _1397);
    float _1407 = fma(_1395, _1367, _1399);
    float _1409 = fma(_1379, _1371, _1401);
    float _1411 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1413 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1415 = fma(_1403, _1371, _1407);
    float _1417 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1411);
    float _1419 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1413);
    float _1421 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1417);
    float _1423 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1419);
    float _1425 = _1421 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1427 = _1423 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1429 = _993 + _1425;
    float _1431 = _767 + _1427;
    float _1433 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1435 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1437 = _1429 + _1435;
    float _1439 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1441 = _1431 + _1439;
    float _1443 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1433);
    float _1445 = _1437 * _1437;
    float _1447 = _1441 * _1441;
    float _1449 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1443);
    float _1451 = _1445 + _1447;
    float _1453 = _1449 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1455 = sqrt(_1451);
    float _1457 = _957 + _1453;
    bool _1459 = _1455 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1461 = _1361;
    float _1463 = _1429;
    float _1465 = _1431;
    float _1467 = _1445;
    float _1469 = _1447;
    if (!_1459)
    {
        _1461 = _1457;
    }
    float _1471 = _1461;
    bool _1473 = !_1459;
    float _1475 = _1471;
    if (!_1473)
    {
        float _1477 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1479 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1481 = _1455 + _1479;
        float _1483 = rsqrt(_1451);
        float _1485 = _1481 * _1477;
        float _1487 = _1457 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1489 = _1485 * 0.15915493667125701904296875;
        float _1491 = _1489 * 6.283185482025146484375;
        float _1493 = sin(_1491);
        float _1495 = _1489 * 6.283185482025146484375;
        float _1497 = cos(_1495);
        float _1499 = fma(_1493, _1487, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1501 = _1483 * _1499;
        float _1503 = _1497 + (-1.0);
        float _1505 = fma(_1437, _1501, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1507 = fma(_1441, _1501, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1509 = _1503 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1511 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1513 = _1505 + _1511;
        float _1515 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1517 = _1507 + _1515;
        float _1519 = fma(_1457, _1497, _1509);
        float _1521 = _1513 * _1513;
        float _1523 = _1517 * _1517;
        _1463 = _1505;
        _1465 = _1507;
        _1475 = _1519;
        _1467 = _1521;
        _1469 = _1523;
    }
    float _1525 = _1463;
    float _1527 = _1465;
    float _1529 = _1475;
    float _1531 = _1467;
    float _1533 = _1469;
    float _1535 = fma(_1525, 6.2500002968590706586837768554688e-05, 0.5);
    float _1537 = fma(_1527, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5220 = float2(_1535, _1537);
    float3 _1541 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5220, float2(0.0), isnan(_5220)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5220, float2(0.0), isnan(_5220)), level(0.0)).xyz;
    float _1543 = _1541.x;
    float _1545 = _1541.y;
    float _1547 = _1541.z;
    float _1549 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1551 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1553 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1555 = _205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1557 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1549);
    float _1559 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1551);
    float _1561 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1553);
    float _1563 = fma(_1555, _1555, 1.0);
    float _1565 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1567 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1569 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1571 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1573 = -_1357;
    float _1575 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1565);
    float _1577 = rsqrt(_1563);
    float _1579 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1581 = -_1357;
    float _1583 = fma(_1581, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1567);
    float _1585 = -_1357;
    float _1587 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1569);
    float _1589 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1591 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1579);
    float _1593 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1595 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1597 = _1529 + _1595;
    float _1599 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1589);
    float _1601 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1575);
    float _1603 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1583);
    float _1605 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1587);
    float _1607 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1593);
    float _1609 = fma(_1597, _1597, _1531);
    float _1611 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1599);
    float _1613 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1561);
    float _1615 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1607);
    float _1617 = _1609 + _1533;
    float _1619 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1557);
    float _1621 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1559);
    float _1623 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1591);
    float _1625 = _1555 * _1577;
    float _1627 = _1555 * _1601;
    float _1629 = _1555 * _1603;
    float _1631 = _1555 * _1605;
    float _1633 = -_1611;
    float _1635 = _1625 * _1633;
    float _1637 = -_1623;
    float _1639 = _1625 * _1637;
    float _1641 = -_1615;
    float _1643 = _1625 * _1641;
    float _1645 = sqrt(_1617);
    float _1647 = fma(_1571, _1619, _1627);
    float _1649 = fma(_1571, _1621, _1629);
    float _1651 = fma(_1571, _1613, _1631);
    float _1653 = fma(_1577, _1601, _1635);
    float _1655 = fma(_1577, _1603, _1639);
    float _1657 = fma(_1577, _1605, _1643);
    float _1659 = _1611 + _1647;
    float _1661 = _1623 + _1649;
    float _1663 = _1615 + _1651;
    out.m_76.x = _1619;
    out.m_76.y = _1621;
    out.m_76.z = _1613;
    out.m_78.x = _1653;
    out.m_78.y = _1655;
    out.m_78.z = _1657;
    bool _1665 = _1645 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1667 = isnan(_1645);
    bool _1669 = _1665 || _1667;
    bool _1671 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1673 = _1669 || _1671;
    out.m_80.x = _1659;
    out.m_80.y = _1661;
    out.m_80.z = _1663;
    float _1675 = _1571;
    float _1677 = _1653;
    if (!_1673)
    {
        _1675 = 1.0;
    }
    float _1679 = _1675;
    out.m_82.x = _1543;
    out.m_82.y = _1545;
    out.m_82.z = _1547;
    bool _1681 = !_1673;
    float _1683 = _1679;
    if (!_1681)
    {
        bool _1685 = _1645 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1687 = isnan(_1645);
        bool _1689 = _1685 || _1687;
        bool _1691 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1693 = _1689 || _1691;
        if (!_1693)
        {
            float _1695 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1697 = _1645 + _1695;
            float _1699 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1701 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1699;
            float _1703 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1705 = _1703 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1707 = 1.0 / _1701;
            float _1709 = _1697 * _1707;
            float _1711 = fma(_1709, _1705, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1683 = _1711;
            _1713 = true;
        }
        else
        {
            bool _1715 = _1645 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1717 = isnan(_1645);
            bool _1719 = _1715 || _1717;
            bool _1721 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1723 = _1719 || _1721;
            if (!_1723)
            {
                float _1725 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1727 = _1645 + _1725;
                float _1729 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1731 = _1729 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1733 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1735 = _1733 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1737 = 1.0 / _1731;
                float _1739 = _1727 * _1737;
                float _1741 = fma(_1739, _1735, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1683 = _1741;
                _1713 = true;
            }
            else
            {
                _1683 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1713 = false;
    float _1743 = _1683;
    float _1745 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1747 = _1529 + _1745;
    float _1749 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1751 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1753 = _1525 + _1751;
    float _1755 = fma(_1747, _1743, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1757 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1749);
    float _1759 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1761 = _1527 + _1759;
    float _1763 = fma(_1753, _1743, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1765 = -_957;
    float _1767 = _1765 + _1755;
    float _1769 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1757);
    float _1771 = fma(_1761, _1743, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1773 = -_993;
    float _1775 = _1773 + _1763;
    float _1777 = _1767 * _1767;
    float _1779 = _1769 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1781 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1783 = -_767;
    float _1785 = _1783 + _1771;
    float _1787 = fma(_1775, _1775, _1777);
    float _1789 = 1.0 / _1779;
    float _1791 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1781);
    float _1793 = fma(_1785, _1785, _1787);
    float _1795 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1791);
    float _1797 = sqrt(_1793);
    float _1799 = _1795 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1801 = _1799 + _1779;
    float _1803 = _1801 * _1789;
    float _1805 = _1803 * 0.5;
    bool _1807 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1809 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1811 = _1807 || _1809;
    bool _1813 = isnan(0.5);
    bool _1815 = _1811 || _1813;
    float _1817 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1819 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1817);
    bool _1821 = _1797 > 0.0;
    float _1823 = 1.0 / _1819;
    bool _1825 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1827 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1829 = _1825 || _1827;
    bool _1831 = isnan(0.5);
    bool _1833 = _1829 || _1831;
    float _1835 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1837 = _1763;
    float _1839 = _1789;
    float _1841 = _1771;
    if (!_1821)
    {
        _1677 = _1755;
    }
    float _1843 = _1677;
    float _1845 = _1843;
    float _1847 = _1843;
    if (!_1821)
    {
        _1835 = _1771;
    }
    float _1849 = _1835;
    bool _1851 = !_1821;
    float _1853 = _1849;
    float _1855 = _1823;
    if (!_1851)
    {
        float _1857 = _209 * _209;
        float _1859 = rsqrt(_1793);
        float _1861 = fma(_207, _207, _1857);
        float _1863 = fma(_211, _211, _1861);
        float _1865 = sqrt(_1863);
        float _1867 = _1775 * _1859;
        float _1869 = _1767 * _1859;
        float _1871 = _1785 * _1859;
        bool _1873 = _1865 > 0.0;
        float _1875 = _1859;
        if (!_1873)
        {
            _1845 = _1755;
        }
        float _1877 = _1845;
        _1847 = _1877;
        if (!_1873)
        {
            _1875 = _1771;
        }
        float _1879 = _1875;
        bool _1881 = !_1873;
        _1853 = _1879;
        if (!_1881)
        {
            float _1883 = rsqrt(_1863);
            float _1885 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1887 = _209 * _1883;
            float _1889 = _207 * _1883;
            float _1891 = _1869 * _1887;
            float _1893 = _211 * _1883;
            float _1895 = fma(_1867, _1889, _1891);
            float _1897 = _1885 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1899 = fma(_1871, _1893, _1895);
            float _1901 = _1899 * _1897;
            float _1903 = fma(_207, _1901, _1763);
            float _1905 = fma(_209, _1901, _1755);
            float _1907 = fma(_211, _1901, _1771);
            _1837 = _1903;
            _1847 = _1905;
            _1853 = _1907;
            _1839 = _1885;
        }
    }
    float _1909 = _1837;
    float _1911 = _1847;
    float _1913 = _1853;
    float _1915 = _1839;
    float _1917 = -_1221;
    float _1919 = _1917 + _1909;
    float _1921 = -_1223;
    float _1923 = _1921 + _1911;
    float _1925 = -_1229;
    float _1927 = _1925 + _1913;
    float _1929 = _1923;
    float _1931 = _1919;
    float _1933 = _1927;
    if (_1815)
    {
        _1841 = 1.0;
    }
    float _1935 = _1841;
    float _1937 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1939 = _1823 * _1937;
    float _1941 = _1935;
    if (!_1833)
    {
        float _1943 = _1239 * _1239;
        float _1945 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1947 = -_767;
        float _1949 = _1947 + _1913;
        float _1951 = -_993;
        float _1953 = _1951 + _1909;
        float _1955 = fma(_1247, _1247, _1943);
        float _1957 = fma(_1255, _1255, _1955);
        float _1959 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1961 = sqrt(_1957);
        float _1963 = 1.0 / _1341;
        float _1965 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1967 = precise::min(_1961, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1969 = _1967 * _1945;
        float _1971 = _1969 * _1963;
        float _1973 = -_957;
        float _1975 = _1973 + _1911;
        float _1977 = _1965 * _1971;
        float _1979 = _1949 * _1971;
        float _1981 = fma(_1975, _1977, _1227);
        float _1983 = fma(_1953, _1977, _1233);
        float _1985 = fma(_1965, _1979, _1243);
        _1929 = _1981;
        _1931 = _1983;
        _1933 = _1985;
        _1855 = _1965;
    }
    float _1987 = _1929;
    float _1989 = _1931;
    float _1991 = _1933;
    float _1993 = _1855;
    float _1995 = _1993;
    if (!_1815)
    {
        float _1997 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1999 = _1997 * 0.15915493667125701904296875;
        float _2001 = _1999 * 6.283185482025146484375;
        float _2003 = cos(_2001);
        float _2005 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2007 = _2005 * 0.15915493667125701904296875;
        float _2009 = _1999 * 6.283185482025146484375;
        float _2011 = sin(_2009);
        float _2013 = 1.0 / _2003;
        float _2015 = _2007 * 6.283185482025146484375;
        float _2017 = cos(_2015);
        float _2019 = _2011 * _2013;
        float _2021 = _2007 * 6.283185482025146484375;
        float _2023 = sin(_2021);
        float _2025 = _2017 * _2019;
        float _2027 = 1.0 / _2025;
        float _2029 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2031 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2029;
        float _2033 = 1.0 / _2031;
        float _2035 = _2023 * _2027;
        float _2037 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2039 = fma(_1939, _2035, _2037);
        float _2041 = _2039 * _2033;
        float _2043 = precise::clamp(_2041, 0.0, 1.0);
        _1941 = _2043;
    }
    float _2045 = _1941;
    float _2047 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2049 = _1987 + _2047;
    float _2051 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2053 = _1989 + _2051;
    float _2055 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2057 = _1991 + _2055;
    float _2059 = _2049 * _2049;
    float _2061 = fma(_2053, _2053, _2059);
    float _2063 = fma(_2057, _2057, _2061);
    float _2065 = rsqrt(_2063);
    float _2067 = sqrt(_2063);
    float _2069 = _2065 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2071 = _2053 * _2069;
    float _2073 = _2057 * _2069;
    float _2075 = _2071 * _2071;
    float _2077 = _2073 * _2073;
    float _2079 = _2075 + _2077;
    float _2081 = sqrt(_2079);
    bool _2083 = _2081 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2085 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2087 = _2081 + _2085;
    float _2089 = _2065;
    float _2091 = _2087;
    float _2093 = _2049;
    if (_2083)
    {
        float _2095 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2089 = _2095;
    }
    float _2097 = _2089;
    float _2099 = _2097;
    if (_2083)
    {
        float _2101 = _2087 * _2097;
        _2091 = _2101;
    }
    float _2103 = _2091;
    if (_2083)
    {
        float _2105 = rsqrt(_2079);
        _2099 = _2105;
    }
    float _2107 = _2099;
    float _2109 = _2107;
    if (_2083)
    {
        float _2111 = _2103 * 0.15915493667125701904296875;
        _1995 = _2111;
    }
    float _2113 = _1995;
    float _2115 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2117 = _2057;
    float _2119 = _2113;
    if (_2083)
    {
        float _2121 = _2113 * 6.283185482025146484375;
        float _2123 = sin(_2121);
        _2117 = _2123;
    }
    float _2125 = _2117;
    float _2127 = precise::max(0.0, _2115);
    float _2129 = _1915;
    float _2131 = _2127;
    if (_2083)
    {
        float _2133 = _2113 * 6.283185482025146484375;
        float _2135 = cos(_2133);
        _2129 = _2135;
    }
    float _2137 = _2129;
    float _2139 = -_2069;
    float _2141 = -_2127;
    float _2143 = fma(_2049, _2139, _2141);
    float _2145 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2083)
    {
        float _2147 = _2143 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2093 = _2147;
    }
    float _2149 = _2093;
    float _2151 = fma(_1233, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2153 = _2125;
    float _2155 = _2149;
    if (_2083)
    {
        float _2157 = fma(_2125, _2149, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2153 = _2157;
    }
    float _2159 = _2153;
    float _2161 = _2159;
    if (!_2083)
    {
        _2155 = _2075;
    }
    float _2163 = _2155;
    float _2165 = floor(_2151);
    float _2167 = _2163;
    if (_2083)
    {
        float _2169 = _2107 * _2159;
        _2145 = _2169;
    }
    float _2171 = _2145;
    if (!_2083)
    {
        _2109 = _2071;
    }
    float _2173 = _2109;
    float _2175 = _2173;
    float _2177 = _2137;
    if (_2083)
    {
        float _2179 = _2137 + (-1.0);
        _2131 = _2179;
    }
    float _2181 = _2131;
    float _2183 = _2181;
    if (_2083)
    {
        float _2185 = _2071 * _2171;
        _2175 = _2185;
    }
    float _2187 = _2175;
    if (!_2083)
    {
        _2161 = _2143;
    }
    float _2189 = _2161;
    float _2191 = _1987 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2193 = _2189;
    if (_2083)
    {
        float _2195 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2119 = _2195;
    }
    float _2197 = _2119;
    if (!_2083)
    {
        _2183 = _2073;
    }
    float _2199 = _2183;
    float _2201 = _2199;
    if (_2083)
    {
        float _2203 = _2073 * _2171;
        _2201 = _2203;
    }
    float _2205 = _2201;
    if (_2083)
    {
        float _2207 = _2187 * _2187;
        _2167 = _2207;
    }
    float _2209 = _2167;
    if (_2083)
    {
        float _2211 = fma(_2143, _2137, _2197);
        _2193 = _2211;
    }
    float _2213 = _2193;
    if (!_2083)
    {
        _2177 = _2077;
    }
    float _2215 = _2177;
    float _2217 = _2215;
    if (_2083)
    {
        float _2219 = _2205 * _2205;
        _2217 = _2219;
    }
    float _2221 = _2217;
    float _2223 = fma(_2213, _2213, _2209);
    float _2225 = _1987 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2227 = -_2165;
    float _2229 = _2151 + _2227;
    float _2231 = _2223 + _2221;
    float _2233 = fma(_1989, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2191);
    float _2235 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2237 = fma(_2067, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2235);
    float _2239 = precise::clamp(_2237, 0.0, 1.0);
    float _2241 = _1987 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2243 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2233);
    float _2245 = rsqrt(_2231);
    float _2247 = -_2239;
    float _2249 = _2247 + 1.0;
    float _2251 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2253 = _2243 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2255 = fma(_1243, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2257 = _2253 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2259 = abs(_2249);
    float _2261 = log2(_2259);
    float _2263 = -_2257;
    float _2265 = fma(_2263, _2251, 1.0);
    float _2267 = _1987 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2269 = fma(_1989, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2241);
    float _2271 = _2245 * _2187;
    float _2273 = fma(_1989, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2267);
    float _2275 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2269);
    float _2277 = _2245 * _2213;
    float _2279 = _2271 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2281 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2273);
    float _2283 = _2275 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2285 = _2245 * _2205;
    float _2287 = fma(_1989, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2225);
    float _2289 = -_2279;
    float _2291 = fma(_2277, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2289);
    float _2293 = _2281 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2295 = _2283 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2297 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2287);
    float _2299 = -_2285;
    float _2301 = fma(_2299, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2291);
    float _2303 = _2261 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2305 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2295);
    float _2307 = log2(_2265);
    float _2309 = fma(_2301, -0.5, 0.5);
    float _2311 = _2283 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2313 = fma(_2253, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2305);
    float _2315 = floor(_2255);
    float _2317 = _2297 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2319 = fma(_2301, 0.5, 0.5);
    float _2321 = fma(_2317, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2313);
    float _2323 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2311);
    float _2325 = fma(_2319, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2327 = exp2(_2303);
    float _2329 = _2277 + 1.0;
    float _2331 = fma(_2253, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2323);
    float _2333 = 1.0 / _2321;
    float _2335 = _2283 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2337 = -_2315;
    float _2339 = _2255 + _2337;
    float _2341 = fma(_2319, _2325, -0.212114393711090087890625);
    float _2343 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2335);
    float _2345 = sqrt(_2309);
    float _2347 = fma(_2253, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2343);
    float _2349 = -_2277;
    float _2351 = fma(_2327, _2329, _2349);
    float _2353 = fma(_2317, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2331);
    float _2355 = _2307 * 0.693147182464599609375;
    float _2357 = fma(_2317, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2347);
    float2 _6591 = float2(_2229, _2339);
    float _2359 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6591, float2(0.0), isnan(_6591)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6591, float2(0.0), isnan(_6591)), level(0.0)).x;
    float _2361 = fma(_2319, _2341, 1.570728778839111328125);
    float _2363 = _2353 * _2333;
    float _2365 = _2357 * _2333;
    float _2367 = _2355 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2369 = fma(_2351, 0.5, 0.5);
    float _2371 = fma(_2363, 0.5, 0.5);
    float _2373 = fma(_2365, -0.5, 0.5);
    float _2375 = _2345 * 0.636619746685028076171875;
    float3 _6623 = float3(_2371, _2373, _2367);
    float _2377 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6623, float3(0.0), isnan(_6623)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6623, float3(0.0), isnan(_6623)), level(0.0)).x;
    float3 _6634 = float3(_2371, _2373, _2367);
    float4 _2380 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6634, float3(0.0), isnan(_6634)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6634, float3(0.0), isnan(_6634)), level(0.0)).xyzw;
    float _2382 = _2380.x;
    float _2384 = _2380.y;
    float _2386 = _2380.z;
    float _2388 = _2380.w;
    float _2390 = -_2361;
    float _2392 = fma(_2375, _2390, 1.0);
    float2 _6655 = float2(_2392, _2369);
    float3 _2394 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6655, float2(0.0), isnan(_6655)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6655, float2(0.0), isnan(_6655)), level(0.0)).xyz;
    float _2396 = _2394.x;
    float _2398 = _2394.y;
    float _2400 = _2394.z;
    float _2402 = abs(_1939);
    float _2404 = log2(_2402);
    bool _2406 = _2067 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2408 = isnan(_2067);
    bool _2410 = _2406 || _2408;
    bool _2412 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2414 = _2410 || _2412;
    float _2416 = _2404 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2418 = _2283 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2420 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2418);
    float _2422 = exp2(_2416);
    float _2424 = _2261 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2426 = fma(_2253, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2420);
    float _2428 = fma(_2317, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2426);
    float _2430 = exp2(_2424);
    float _2432 = fma(_2422, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2434 = precise::clamp(_2432, 0.0, 1.0);
    float _2436 = in.m_84.x;
    float _2438 = fma(_2434, -2.0, 3.0);
    float _2440 = _2434 * _2434;
    float _2442 = -_2430;
    float _2444 = _2442 + 1.0;
    float _2446 = _2440 * _2438;
    float _2448 = _2444 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2450 = -_2446;
    float _2452 = _2450 + 1.0;
    float _2454 = fma(_2452, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2446);
    bool _2456 = _1939 <= 8000.0;
    bool _2458 = isnan(_1939);
    bool _2460 = _2456 || _2458;
    bool _2462 = isnan(8000.0);
    bool _2464 = _2460 || _2462;
    float _2466 = float(_2464);
    float _2468 = _2428 + _2321;
    float _2470 = _2466 * _2454;
    float _2472 = _2468 * 0.5;
    out.gl_Position.x = _2353;
    out.gl_Position.y = _2357;
    out.gl_Position.z = _2428;
    out.gl_Position.w = _2321;
    float _2474 = _2470 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_86.z = _2472;
    out.m_86.w = _2321;
    float _2476 = _2321;
    float _2478 = _2428;
    float _2480 = _2357;
    float _2482 = _2353;
    if (!_2414)
    {
        _2476 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2484 = _2476;
    float _2486 = _2484;
    float _2488 = _2484;
    if (!_2414)
    {
        _2478 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2490 = _2478;
    float _2492 = _2490;
    float _2494 = _2490;
    if (!_2414)
    {
        _2480 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2496 = _2480;
    float _2498 = _2496;
    float _2500 = _2496;
    if (!_2414)
    {
        _2482 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2502 = _2482;
    float _2504 = -_2359;
    float _2506 = _2504 + 1.0;
    float _2508 = _2506 * _2474;
    float _2510 = precise::clamp(_2508, 0.0, 1.0);
    float _2512 = -_2510;
    float _2514 = fma(_2512, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2516 = _2448 * _2377;
    float _2518 = _2514 * _2436;
    float _2520 = -_2448;
    float _2522 = _2520 + 1.0;
    float _2524 = _2388 * _2516;
    float _2526 = _2518 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2528 = _2388 * _2522;
    float _2530 = _2400 * _2516;
    float _2532 = fma(_2396, _2524, _2382);
    float _2534 = fma(_2398, _2524, _2384);
    out.m_88.x = _2526;
    float _2536 = fma(_2388, _2530, _2386);
    float _2538 = _2045 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2540 = _2384;
    float _2542 = _2382;
    float _2544 = _2502;
    float _2546 = _2502;
    if (!_2414)
    {
        _2540 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2548 = _2540;
    float _2550 = _2548;
    float _2552 = _2548;
    if (!_2414)
    {
        _2542 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2554 = _2542;
    out.m_90.x = _2532;
    out.m_90.y = _2534;
    out.m_90.z = _2536;
    out.m_90.w = _2528;
    bool _2556 = !_2414;
    float _2558 = _2554;
    float _2560 = _2554;
    if (!_2556)
    {
        bool _2562 = _2067 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2564 = isnan(_2067);
        bool _2566 = _2562 || _2564;
        bool _2568 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2570 = _2566 || _2568;
        if (!_2570)
        {
            float _2572 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2574 = _2067 + _2572;
            float _2576 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2578 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2576;
            float _2580 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2582 = _2580 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2584 = 1.0 / _2578;
            float _2586 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2588 = _2586 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2592 = _2590 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2594 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2596 = _2594 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2598 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2600 = _2598 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2602 = _2574 * _2584;
            float _2604 = precise::clamp(_2602, 0.0, 1.0);
            float _2606 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2608 = _2606 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2610 = fma(_2604, _2582, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2612 = fma(_2604, _2608, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2614 = fma(_2604, _2588, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2616 = fma(_2604, _2592, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2618 = fma(_2604, _2596, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2620 = fma(_2604, _2600, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2560 = _2614;
            _2500 = _2618;
            _2552 = _2610;
            _2494 = _2616;
            _2488 = _2612;
            _2546 = _2620;
            _2622 = true;
        }
        else
        {
            bool _2624 = _2067 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2626 = isnan(_2067);
            bool _2628 = _2624 || _2626;
            bool _2630 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2632 = _2628 || _2630;
            if (!_2632)
            {
                _2550 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2634 = _2550;
            _2552 = _2634;
            if (!_2632)
            {
                _2558 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2636 = _2558;
            _2560 = _2636;
            if (!_2632)
            {
                _2486 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2638 = _2486;
            _2488 = _2638;
            if (!_2632)
            {
                _2492 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2640 = _2492;
            _2494 = _2640;
            if (!_2632)
            {
                _2498 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2642 = _2498;
            _2500 = _2642;
            if (!_2632)
            {
                _2544 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2644 = _2544;
            bool _2646 = !_2632;
            _2546 = _2644;
            if (!_2646)
            {
                bool _2648 = _2067 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2650 = isnan(_2067);
                bool _2652 = _2648 || _2650;
                bool _2654 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2656 = _2652 || _2654;
                if (!_2656)
                {
                    float _2658 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2660 = _2067 + _2658;
                    float _2662 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2664 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2662;
                    float _2666 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2668 = _2666 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2670 = 1.0 / _2664;
                    float _2672 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2674 = _2672 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2676 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2678 = _2676 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2680 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2682 = _2680 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2684 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2686 = _2684 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2688 = _2660 * _2670;
                    float _2690 = precise::clamp(_2688, 0.0, 1.0);
                    float _2692 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2694 = _2692 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2696 = fma(_2690, _2668, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2698 = fma(_2690, _2694, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2700 = fma(_2690, _2674, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2702 = fma(_2690, _2678, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2704 = fma(_2690, _2682, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2706 = fma(_2690, _2686, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2560 = _2700;
                    _2500 = _2704;
                    _2552 = _2696;
                    _2494 = _2702;
                    _2488 = _2698;
                    _2546 = _2706;
                    _2622 = true;
                }
                else
                {
                    _2560 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2500 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2552 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2494 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2488 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2546 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2622 = false;
    float _2708 = _2560;
    float _2710 = _2500;
    float _2712 = _2552;
    float _2714 = _2494;
    float _2716 = _2488;
    float _2718 = _2546;
    float _2720 = _2538 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2722 = fma(_1661, -0.5, 0.5);
    float _2724 = precise::clamp(_2722, 0.0, 1.0);
    float _2726 = -_2708;
    float _2728 = _2726 + _2710;
    float _2730 = -_2712;
    float _2732 = _2730 + _2714;
    out.m_53.x = _2720;
    float _2734 = fma(_2724, _2728, _2708);
    float _2736 = -_2716;
    float _2738 = _2736 + _2718;
    float _2740 = fma(_2724, _2732, _2712);
    float _2742 = _2734 * 0.586610972881317138671875;
    bool _2744 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2746 = fma(_2724, _2738, _2716);
    out.m_92.x = 0.0;
    float _2748 = fma(_2740, 0.298911988735198974609375, _2742);
    bool _2750 = _2045 > 0.0;
    bool _2752 = isnan(_2045);
    bool _2754 = _2750 || _2752;
    bool _2756 = isnan(0.0);
    bool _2758 = _2754 || _2756;
    float _2760 = fma(_2746, 0.114477999508380889892578125, _2748);
    float _2762 = -_2760;
    float _2764 = _2740 + _2762;
    float _2766 = -_2760;
    float _2768 = _2734 + _2766;
    float _2770 = -_2760;
    float _2772 = _2746 + _2770;
    float _2774 = fma(_2764, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2760);
    float _2776 = fma(_2768, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2760);
    float _2778 = fma(_2772, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2760);
    bool _2780 = !_2744;
    if (!_2780)
    {
        float _2782 = -_1987;
        float _2784 = _2782 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2786 = -_1989;
        float _2788 = _2786 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2790 = -_1991;
        float _2792 = _2790 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2794 = _2784 * _2784;
        float _2796 = fma(_2788, _2788, _2794);
        float _2798 = fma(_2792, _2792, _2796);
        float _2800 = sqrt(_2798);
        float _2802 = rsqrt(_2798);
        float _2804 = -_2800;
        float _2806 = _2804 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2808 = _2806 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2810 = precise::clamp(_2808, 0.0, 1.0);
        float _2812 = _2788 * _2802;
        float _2814 = _2784 * _2802;
        float _2816 = abs(_2810);
        float _2818 = log2(_2816);
        float _2820 = _2792 * _2802;
        float _2822 = _2812 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2824 = _1661 * _2814;
        float _2826 = -_2814;
        float _2828 = -_2822;
        float _2830 = fma(_2826, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2828);
        float _2832 = fma(_1659, _2812, _2824);
        float _2834 = -_2820;
        float _2836 = fma(_2834, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2830);
        float _2838 = fma(_1663, _2820, _2832);
        float _2840 = precise::clamp(_2838, 0.0, 1.0);
        float _2842 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2844 = _2836 + _2842;
        float _2846 = _2818 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2848 = _2844 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2850 = precise::clamp(_2848, 0.0, 1.0);
        float _2852 = exp2(_2846);
        float _2854 = _2852 * _2850;
        float _2856 = _2840 * _2854;
        float _2858 = _2856 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2860 = _2856 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2862 = _2856 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _2858;
        out.m_92.y = _2860;
        out.m_92.z = _2862;
    }
    out.m_94.x = _2774;
    out.m_94.y = _2776;
    out.m_94.z = _2778;
    if (_2758)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _2864 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2864;
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
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2622 = false;
    bool _1713 = false;
    bool _577 = false;
    bool _427 = false;
    bool _233 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_50.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_53.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2921 = as_type<float>(_129);
        out.gl_Position.z = _2921;
    }
    if (!_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _133 = in.m_55.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = 0.0;
    float _151 = _147;
    if (_143)
    {
        float _153 = float(_113);
        _149 = _153;
    }
    float _155 = _149;
    bool _157 = _147 >= _155;
    bool _159 = !_143;
    bool _161 = _157 || _159;
    if (_161)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _123;
    if (_161)
    {
        out.m_53.x = 0.0;
    }
    if (_161)
    {
        float _165 = _163 * 5.0;
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2990 = as_type<float>(_167);
        out.gl_Position.z = _2990;
    }
    if (_161)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = in.m_60.x;
    float _173 = in.m_60.y;
    float _175 = in.m_60.z;
    int _177 = as_type<int>(_169) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_169) & 2;
    bool _183 = _181 != 0;
    bool _185 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _187 = _173 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _189 = _173 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _191 = _173 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _193 = !_179;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].x, _187);
    float _199 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].x, _189);
    float _201 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].x, _191);
    bool _203 = !_183;
    float _205 = _203 ? (-0.5) : 0.5;
    float _207 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[4].z, _197);
    float _209 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[5].z, _199);
    float _211 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[6].z, _201);
    bool _213 = !_185;
    float _231;
    if (!_213)
    {
        float _215 = in.m_62.x;
        float _217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _223 = _221 * _217;
        float _225 = floor(_223);
        float _227 = -_225;
        float _229 = _223 + _227;
        _231 = _229;
        _233 = true;
    }
    else
    {
        float _235 = float(_113);
        float _237 = 1.0 / _235;
        float _239 = _147 * _237;
        _231 = _239;
    }
    _233 = false;
    float _241 = _231;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = _241 + _243;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = _241 + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _253 = _241 + _251;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _255;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _261 = _259 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _263;
    bool _267 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _269 = isnan(_241);
    bool _271 = _267 || _269;
    bool _273 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _275 = _271 || _273;
    float _277 = float(_275);
    bool _279 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _281 = 1.0 / _257;
    float _283 = 1.0 / _265;
    float _285 = 1.0 / _261;
    float _287 = _245 * _281;
    bool _289 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _291 = isnan(_241);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = -_277;
    float _303 = _301 + 1.0;
    bool _305 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _307 = isnan(_241);
    bool _309 = _305 || _307;
    bool _311 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _313 = _309 || _311;
    float _315 = float(_313);
    float _317 = _299 * _303;
    float _319 = _249 * _283;
    float _321 = -_299;
    float _323 = _321 + 1.0;
    float _325 = _315 * _323;
    float _327 = -_315;
    float _329 = _327 + 1.0;
    float _331 = _253 * _285;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _337 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _339 = isnan(_241);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _353;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _361 = fma(_351, _287, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _363 = _347 * _329;
    float _365 = fma(_355, _287, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _367 = fma(_335, _331, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _369 = fma(_359, _331, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _371 = -_347;
    float _373 = _371 + 1.0;
    float _375 = _361 * _363;
    float _377 = _365 * _363;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _379;
    float _383 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].x, _375);
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _385;
    float _389 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].y, _377);
    float _391 = fma(_381, _319, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _393 = fma(_367, _325, _383);
    float _395 = fma(_387, _319, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _397 = fma(_369, _325, _389);
    float _399 = fma(_391, _317, _393);
    float _401 = fma(_395, _317, _397);
    float _403 = fma(_277, (*spvDescriptorSet0.vp_c9)._m0[146].x, _399);
    float _405 = fma(_277, (*spvDescriptorSet0.vp_c9)._m0[146].y, _401);
    bool _407 = !_279;
    float _425;
    if (!_407)
    {
        float _409 = in.m_62.x;
        float _411 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _413 = _409 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _415 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[11].y, _147);
        float _417 = _415 * _411;
        float _419 = floor(_417);
        float _421 = -_419;
        float _423 = _417 + _421;
        _425 = _423;
        _427 = true;
    }
    else
    {
        float _429 = float(_113);
        float _431 = 1.0 / _429;
        float _433 = _147 * _431;
        _425 = _433;
    }
    _427 = false;
    float _435 = _425;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _439 = _435 + _437;
    float _441 = in.m_64.x;
    float _443 = in.m_64.y;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _449 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _451 = isnan(_435);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _465 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _467 = isnan(_435);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _477;
    bool _481 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _483 = isnan(_435);
    bool _485 = _481 || _483;
    bool _487 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _489 = _485 || _487;
    float _491 = float(_489);
    float _493 = 1.0 / _447;
    float _495 = -_459;
    float _497 = _495 + 1.0;
    bool _499 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _501 = _475 * _497;
    float _503 = -_475;
    float _505 = _503 + 1.0;
    float _507 = 1.0 / _463;
    float _509 = _479 * _493;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _515 = _405 * _443;
    float _517 = _403 * _441;
    float _519 = fma(_509, _439, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _521 = -_491;
    float _523 = _521 + 1.0;
    float _525 = _519 * _501;
    float _527 = _513 * _507;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _531 = _435 + _529;
    float _533 = _459 * _523;
    float _535 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[115].x, _525);
    float _537 = fma(_527, _531, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _539 = fma(_537, _533, _535);
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _545 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[117].x, _539);
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _549 = _541 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _551 = _543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _553 = _545 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _555 = _547 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_66.x = _549;
    out.m_66.y = _551;
    out.m_66.z = _555;
    out.m_66.w = _553;
    bool _557 = !_499;
    float _575;
    if (!_557)
    {
        float _559 = in.m_62.x;
        float _561 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _563 = _559 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _565 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[11].w, _147);
        float _567 = _565 * _561;
        float _569 = floor(_567);
        float _571 = -_569;
        float _573 = _567 + _571;
        _575 = _573;
        _577 = true;
    }
    else
    {
        float _579 = float(_113);
        float _581 = 1.0 / _579;
        float _583 = _147 * _581;
        _575 = _583;
    }
    _577 = false;
    float _585 = _575;
    float _587 = in.m_62.x;
    float _589 = in.m_62.y;
    float _591 = in.m_62.z;
    float _593 = in.m_62.w;
    float _595 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _597 = in.m_50.x;
    float _599 = in.m_50.y;
    float _601 = in.m_50.z;
    int _603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _605 = _603 != 0;
    int _607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _609 = _607 != 0;
    int _611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _613 = _611 != 0;
    float _615 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _619 = _617 != 0;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _623 = _595 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _629 = _587 > 0.5;
    float _631 = _587 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _633 = _593 > 0.5;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _637 = _635 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _639 = -_195;
    int _641 = _629 ? as_type<int>(_639) : as_type<int>(_195);
    float _643 = _589 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _645 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _647 = _645 != 0;
    int _649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _651 = _649 != 0;
    float _653 = 1.0 / _637;
    bool _655 = !_605;
    float _657 = _655 ? _195 : as_type<float>(_641);
    float _659 = -_621;
    float _661 = fma(_631, 2.0, _659);
    bool _663 = _589 > 0.5;
    float _665 = fma(_643, -2.0, _625);
    float _667 = _599 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _669 = -_205;
    int _671 = _663 ? as_type<int>(_669) : as_type<int>(_205);
    float _673 = _599 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _675 = _599 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _677 = !_609;
    float _679 = _677 ? _205 : as_type<float>(_671);
    float _681 = _591 * 2.0;
    int _683 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _685 = _683 != 0;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _687;
    float _691 = _587 * 2.0;
    float _693 = floor(_681);
    float _695 = fma(_597, (*spvDescriptorSet0.vp_c10)._m0[4].x, _667);
    float _697 = fma(_597, (*spvDescriptorSet0.vp_c10)._m0[5].x, _673);
    float _699 = fma(_597, (*spvDescriptorSet0.vp_c10)._m0[6].x, _675);
    float _701 = _589 + _591;
    float _703 = _589 * 2.0;
    float _705 = _689 * _653;
    float _707 = _701 + (-1.0);
    float _709 = floor(_691);
    float _711 = -_195;
    int _713 = _663 ? as_type<int>(_711) : as_type<int>(_195);
    float _715 = -_147;
    float _717 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[76].x, _661);
    bool _719 = _591 > 0.5;
    float _721 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _723 = _589 + _587;
    bool _725 = !_647;
    float _727 = _725 ? _195 : as_type<float>(_713);
    float _729 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _665);
    float _731 = floor(_703);
    float _733 = -_195;
    int _735 = _719 ? as_type<int>(_733) : as_type<int>(_195);
    float _737 = _723 + (-1.0);
    float _739 = -_205;
    int _741 = _719 ? as_type<int>(_739) : as_type<int>(_205);
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _745 = _693 > 0.0;
    float _747 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _749 = !_651;
    float _751 = _749 ? _205 : as_type<float>(_741);
    float _753 = fma(_601, (*spvDescriptorSet0.vp_c10)._m0[6].z, _699);
    bool _755 = _693 >= 0.0;
    bool _757 = isnan(_693);
    bool _759 = _755 || _757;
    bool _761 = isnan(0.0);
    bool _763 = _759 || _761;
    float _765 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _767 = _753 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _769 = 0.0;
    float _771 = _693;
    if (!_685)
    {
        _769 = _589;
    }
    float _773 = _769;
    float _775 = 0.0;
    float _777 = _773;
    if (!_685)
    {
        _775 = _591;
    }
    float _779 = _775;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _783 = _779;
    if (!_685)
    {
        _771 = _591;
    }
    float _785 = _771;
    int _787 = _763 ? 0 : 1;
    bool _789 = !_619;
    float _791 = _789 ? _195 : as_type<float>(_735);
    float _793 = _785;
    if (_685)
    {
        _777 = _587;
    }
    float _795 = _777;
    if (_685)
    {
        _783 = _589;
    }
    float _797 = _783;
    float _799 = _765 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_685)
    {
        _793 = _589;
    }
    float _801 = _793;
    float _803 = _795 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _805 = _709 > 0.0;
    float _807 = _797 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _809 = _709 >= 0.0;
    bool _811 = isnan(_709);
    bool _813 = _809 || _811;
    bool _815 = isnan(0.0);
    bool _817 = _813 || _815;
    float _819 = fma(_601, (*spvDescriptorSet0.vp_c10)._m0[4].z, _695);
    bool _821 = _731 > 0.0;
    float _823 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[83].w, _781);
    bool _825 = _731 >= 0.0;
    bool _827 = isnan(_731);
    bool _829 = _825 || _827;
    bool _831 = isnan(0.0);
    bool _833 = _829 || _831;
    float _835 = fma(_601, (*spvDescriptorSet0.vp_c10)._m0[5].z, _697);
    bool _837 = _585 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _839 = isnan(_585);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _845 = _841 || _843;
    float _847 = float(_845);
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _851 = _585 + _849;
    int _853 = ~_787;
    int _855 = _853 + 1;
    int _857 = _855 + 1;
    float _859 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _861 = _857;
    if (!_745)
    {
        int _863 = ~_787;
        int _865 = _863 + 1;
        _861 = _865;
    }
    int _867 = _861;
    float _869 = fma(_705, _851, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _871 = _585 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _873 = isnan(_585);
    bool _875 = _871 || _873;
    bool _877 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _879 = _875 || _877;
    float _881 = float(_879);
    float _883 = -_847;
    float _885 = _883 + 1.0;
    float _887 = fma(_807, -2.0, _743);
    int _889 = _817 ? 0 : 1;
    float _891 = _881 * _885;
    float _893 = _657 + 0.5;
    int _895 = _833 ? 0 : 1;
    float _897 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _901 = _899 != 0;
    int _903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _905 = _903 != 0;
    int _907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _909 = _907 != 0;
    float _911 = fma(_623, _893, _717);
    float _913 = _869 * _891;
    float _915 = _615 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _917 = -_881;
    float _919 = _917 + 1.0;
    float _921 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _923 = log2(_921);
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _927 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _929 = _679 + (-0.5);
    float _931 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[131].x, _913);
    float _933 = -_925;
    float _935 = fma(_803, 2.0, _933);
    float _937 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[83].z, _927);
    float _939 = -_915;
    float _941 = -_729;
    float _943 = fma(_939, _929, _941);
    float _945 = _791 + 0.5;
    float _947 = -_147;
    float _949 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[81].x, _935);
    float _951 = _727 + 0.5;
    float _953 = -_205;
    int _955 = _633 ? as_type<int>(_953) : as_type<int>(_205);
    float _957 = _835 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _959 = fma(_799, _945, _949);
    float _961 = _951 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _963 = !_613;
    float _965 = _963 ? _205 : as_type<float>(_955);
    float _967 = _923 * _147;
    float _969 = -_751;
    float _971 = _969 + 0.5;
    float _973 = _961 * _897;
    float _975 = _859 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _977 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _887);
    float _979 = _971 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _981 = _965 + (-0.5);
    float _983 = exp2(_967);
    float _985 = _979 * _627;
    float _987 = -_975;
    float _989 = -_977;
    float _991 = fma(_987, _981, _989);
    float _993 = _819 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    out.m_68.x = _973;
    out.m_68.y = _985;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _997 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _999 = isnan(1.0);
    bool _1001 = _997 || _999;
    bool _1003 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1005 = _1001 || _1003;
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1009 = 1.0 + _1007;
    int _1011 = ~_895;
    int _1013 = _1011 + 1;
    int _1015 = _1013 + 1;
    float _1017 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[78].z, _995);
    int _1019 = _1015;
    if (!_821)
    {
        int _1021 = ~_895;
        int _1023 = _1021 + 1;
        _1019 = _1023;
    }
    int _1025 = _1019;
    float _1027 = 1.0 / _1009;
    float _1029 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1031 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1017);
    bool _1033 = !_901;
    int _1035 = _1033 ? 0 : 1;
    float _1037 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1039 = _957 + _1037;
    float _1041 = -_983;
    float _1043 = _1041 + 1.0;
    bool _1045 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1047 = isnan(0.0);
    bool _1049 = _1045 || _1047;
    bool _1051 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1053 = _1049 || _1051;
    float _1055 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _937);
    int _1057 = abs(_1035);
    float _1059 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1061 = _993 + _1059;
    float _1063 = _1039 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1065 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1029);
    float _1067 = _1053 ? _1043 : 0.0;
    float _1069 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _823);
    float _1071 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1063);
    float _1073 = float(_867);
    float _1075 = -_1055;
    float _1077 = _1075 + 1.0;
    float _1079 = float(_1057);
    float _1081 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1065);
    if (_1005)
    {
        float _1083 = _1067 * _1027;
        _151 = _1083;
    }
    float _1085 = _151;
    float _1087 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[132].x, _931);
    float _1089 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1091 = _767 + _1089;
    float _1093 = _1079 * _1073;
    float _1095 = -_1077;
    float _1097 = fma(_791, _1095, _959);
    float _1099 = -_1031;
    float _1101 = _1099 + 1.0;
    float _1103 = in.m_70.x;
    float _1105 = in.m_70.y;
    float _1107 = in.m_70.z;
    float _1109 = -_1081;
    float _1111 = _1109 + 1.0;
    float _1113 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1071);
    bool _1115 = !_905;
    int _1117 = _1115 ? 0 : 1;
    float _1119 = -_1101;
    float _1121 = fma(_657, _1119, _911);
    float _1123 = -_1069;
    float _1125 = _1123 + 1.0;
    int _1127 = ~_889;
    int _1129 = _1127 + 1;
    int _1131 = _1129 + 1;
    float _1133 = _1039 * _1039;
    int _1135 = _1131;
    float _1137 = _1087;
    if (!_805)
    {
        int _1139 = ~_889;
        int _1141 = _1139 + 1;
        _1135 = _1141;
    }
    int _1143 = _1135;
    float _1145 = fma(_679, _1111, _943);
    int _1147 = abs(_1117);
    float _1149 = fma(_965, _1125, _991);
    bool _1151 = _1113 >= 0.0;
    float _1153 = fma(_1061, _1061, _1133);
    float _1155 = _1087 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1157 = _1093 * (-2.0);
    float _1159 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1161 = float(_1143);
    float _1163 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1165 = float(_1147);
    float _1167 = fma(_1091, _1091, _1153);
    float _1169 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1171 = _1159 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1173 = _1163 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1175 = _1165 * _1161;
    float _1177 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1179 = rsqrt(_1167);
    float _1181 = fma(_747, _1157, _747);
    float _1183 = fma(_1157, _1103, _1103);
    int _1185 = as_type<int>(_1175);
    if (_1151)
    {
        _1137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1187 = _1137;
    out.m_72.x = _1171;
    out.m_72.y = _1173;
    out.m_72.z = _1177;
    out.m_72.w = _1155;
    float _1189 = _517 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1191 = _589 + (-0.5);
    out.m_74.x = _1121;
    out.m_74.y = _1145;
    out.m_74.z = _1097;
    out.m_74.w = _1149;
    if (_1151)
    {
        out.m_53.x = 0.0;
    }
    float _1193 = _587 + (-0.5);
    float _1195 = _1175 * (-2.0);
    if (_1151)
    {
        float _1197 = _1187 * 5.0;
        _1185 = as_type<int>(_1197);
    }
    int _1199 = _1185;
    float _1201 = fma(_1193, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1183);
    float _1203 = _1189 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1205 = fma(_721, _1195, _721);
    float _1207 = fma(_1195, _1105, _1105);
    bool _1209 = !_909;
    int _1211 = _1209 ? 0 : 1;
    float _1213 = _1203 * _1179;
    float _1215 = _1205;
    if (_1151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4696 = as_type<float>(_1199);
        out.gl_Position.z = _4696;
    }
    float _1217 = fma(_1181, _1085, _1201);
    int _1219 = abs(_1211);
    float _1221 = _1061 * _1213;
    float _1223 = _1039 * _1213;
    if (_1151)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1225 = -_1223;
    float _1227 = _957 + _1225;
    float _1229 = _1091 * _1213;
    float _1231 = -_1221;
    float _1233 = _993 + _1231;
    float _1235 = float(_1025);
    float _1237 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1239 = _1227 + _1237;
    float _1241 = -_1229;
    float _1243 = _767 + _1241;
    float _1245 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1247 = _1233 + _1245;
    float _1249 = _1217 * 0.15915493667125701904296875;
    float _1251 = _1239 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1253 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1255 = _1243 + _1253;
    float _1257 = float(_1219);
    float _1259 = -_1223;
    float _1261 = _1039 + _1259;
    float _1263 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1251);
    float _1265 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1207);
    float _1267 = -_1221;
    float _1269 = _1061 + _1267;
    float _1271 = _1257 * _1235;
    float _1273 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1263);
    float _1275 = _1261 * _1261;
    float _1277 = fma(_1205, _1085, _1265);
    float _1279 = _591 + _587;
    float _1281 = -_1229;
    float _1283 = _1091 + _1281;
    bool _1285 = _1273 >= 0.0;
    float _1287 = fma(_1269, _1269, _1275);
    float _1289 = _1277 * 0.15915493667125701904296875;
    float _1291 = _1279 + (-1.0);
    float _1293 = fma(_1283, _1283, _1287);
    float _1295 = _1271 * (-2.0);
    float _1297 = _591 + (-0.5);
    float _1299 = fma(_1291, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1301 = _1249 * 6.283185482025146484375;
    float _1303 = sin(_1301);
    float _1305 = fma(_1295, _1107, _1107);
    float _1307 = fma(_1299, _1295, _1299);
    int _1309 = as_type<int>(_1297);
    if (_1285)
    {
        _1215 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1311 = _1215;
    float _1313 = fma(_1297, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1305);
    if (_1285)
    {
        out.m_53.x = 0.0;
    }
    float _1315 = _1249 * 6.283185482025146484375;
    float _1317 = cos(_1315);
    if (_1285)
    {
        float _1319 = _1311 * 5.0;
        _1309 = as_type<int>(_1319);
    }
    int _1321 = _1309;
    float _1323 = fma(_1307, _1085, _1313);
    if (_1285)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4879 = as_type<float>(_1321);
        out.gl_Position.z = _4879;
    }
    float _1325 = _1323 * 0.15915493667125701904296875;
    float _1327 = _1289 * 6.283185482025146484375;
    float _1329 = sin(_1327);
    float _1331 = sqrt(_1293);
    float _1333 = _1289 * 6.283185482025146484375;
    float _1335 = cos(_1333);
    if (_1285)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1337 = _1325 * 6.283185482025146484375;
    float _1339 = cos(_1337);
    float _1341 = _1179 * _1331;
    float _1343 = _515 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1345 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _1347 = _1317 * _1329;
    float _1349 = _1303 * _1329;
    float _1351 = _1341 * _1343;
    float _1353 = _1189 * _1341;
    float _1355 = _1325 * 6.283185482025146484375;
    float _1357 = sin(_1355);
    float _1359 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1361 = _1345 * _1351;
    float _1363 = _1317 * _1335;
    float _1365 = _1303 * _1335;
    float _1367 = _1359 * _1353;
    float _1369 = _1341 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1371 = _1369 * 0.5;
    float _1373 = _1317 * _1339;
    float _1375 = _1335 * _1339;
    float _1377 = _1303 * _1339;
    float _1379 = _1329 * _1339;
    float _1381 = _1373 * _1361;
    float _1383 = fma(_1357, _1363, _1349);
    float _1385 = -_1365;
    float _1387 = fma(_1357, _1347, _1385);
    float _1389 = -_1361;
    float _1391 = _1357 * _1389;
    float _1393 = -_1347;
    float _1395 = fma(_1357, _1365, _1393);
    float _1397 = fma(_1383, _1367, _1381);
    float _1399 = _1377 * _1361;
    float _1401 = fma(_1375, _1367, _1391);
    float _1403 = fma(_1357, _1349, _1363);
    float _1405 = fma(_1387, _1371, _1397);
    float _1407 = fma(_1395, _1367, _1399);
    float _1409 = fma(_1379, _1371, _1401);
    float _1411 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1413 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1415 = fma(_1403, _1371, _1407);
    float _1417 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1411);
    float _1419 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1413);
    float _1421 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1417);
    float _1423 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1419);
    float _1425 = _1421 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1427 = _1423 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1429 = _993 + _1425;
    float _1431 = _767 + _1427;
    float _1433 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1435 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1437 = _1429 + _1435;
    float _1439 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1441 = _1431 + _1439;
    float _1443 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1433);
    float _1445 = _1437 * _1437;
    float _1447 = _1441 * _1441;
    float _1449 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1443);
    float _1451 = _1445 + _1447;
    float _1453 = _1449 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1455 = sqrt(_1451);
    float _1457 = _957 + _1453;
    bool _1459 = _1455 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1461 = _1361;
    float _1463 = _1429;
    float _1465 = _1431;
    float _1467 = _1445;
    float _1469 = _1447;
    if (!_1459)
    {
        _1461 = _1457;
    }
    float _1471 = _1461;
    bool _1473 = !_1459;
    float _1475 = _1471;
    if (!_1473)
    {
        float _1477 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1479 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1481 = _1455 + _1479;
        float _1483 = rsqrt(_1451);
        float _1485 = _1481 * _1477;
        float _1487 = _1457 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1489 = _1485 * 0.15915493667125701904296875;
        float _1491 = _1489 * 6.283185482025146484375;
        float _1493 = sin(_1491);
        float _1495 = _1489 * 6.283185482025146484375;
        float _1497 = cos(_1495);
        float _1499 = fma(_1493, _1487, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1501 = _1483 * _1499;
        float _1503 = _1497 + (-1.0);
        float _1505 = fma(_1437, _1501, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1507 = fma(_1441, _1501, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1509 = _1503 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1511 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1513 = _1505 + _1511;
        float _1515 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1517 = _1507 + _1515;
        float _1519 = fma(_1457, _1497, _1509);
        float _1521 = _1513 * _1513;
        float _1523 = _1517 * _1517;
        _1463 = _1505;
        _1465 = _1507;
        _1475 = _1519;
        _1467 = _1521;
        _1469 = _1523;
    }
    float _1525 = _1463;
    float _1527 = _1465;
    float _1529 = _1475;
    float _1531 = _1467;
    float _1533 = _1469;
    float _1535 = fma(_1525, 6.2500002968590706586837768554688e-05, 0.5);
    float _1537 = fma(_1527, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5220 = float2(_1535, _1537);
    float3 _1541 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5220, float2(0.0), isnan(_5220)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5220, float2(0.0), isnan(_5220)), level(0.0)).xyz;
    float _1543 = _1541.x;
    float _1545 = _1541.y;
    float _1547 = _1541.z;
    float _1549 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1551 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1553 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1555 = _205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1557 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1549);
    float _1559 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1551);
    float _1561 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1553);
    float _1563 = fma(_1555, _1555, 1.0);
    float _1565 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1567 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1569 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1571 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1573 = -_1357;
    float _1575 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1565);
    float _1577 = rsqrt(_1563);
    float _1579 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1581 = -_1357;
    float _1583 = fma(_1581, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1567);
    float _1585 = -_1357;
    float _1587 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1569);
    float _1589 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1591 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1579);
    float _1593 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1595 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1597 = _1529 + _1595;
    float _1599 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1589);
    float _1601 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1575);
    float _1603 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1583);
    float _1605 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1587);
    float _1607 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1593);
    float _1609 = fma(_1597, _1597, _1531);
    float _1611 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1599);
    float _1613 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1561);
    float _1615 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1607);
    float _1617 = _1609 + _1533;
    float _1619 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1557);
    float _1621 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1559);
    float _1623 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1591);
    float _1625 = _1555 * _1577;
    float _1627 = _1555 * _1601;
    float _1629 = _1555 * _1603;
    float _1631 = _1555 * _1605;
    float _1633 = -_1611;
    float _1635 = _1625 * _1633;
    float _1637 = -_1623;
    float _1639 = _1625 * _1637;
    float _1641 = -_1615;
    float _1643 = _1625 * _1641;
    float _1645 = sqrt(_1617);
    float _1647 = fma(_1571, _1619, _1627);
    float _1649 = fma(_1571, _1621, _1629);
    float _1651 = fma(_1571, _1613, _1631);
    float _1653 = fma(_1577, _1601, _1635);
    float _1655 = fma(_1577, _1603, _1639);
    float _1657 = fma(_1577, _1605, _1643);
    float _1659 = _1611 + _1647;
    float _1661 = _1623 + _1649;
    float _1663 = _1615 + _1651;
    out.m_76.x = _1619;
    out.m_76.y = _1621;
    out.m_76.z = _1613;
    out.m_78.x = _1653;
    out.m_78.y = _1655;
    out.m_78.z = _1657;
    bool _1665 = _1645 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1667 = isnan(_1645);
    bool _1669 = _1665 || _1667;
    bool _1671 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1673 = _1669 || _1671;
    out.m_80.x = _1659;
    out.m_80.y = _1661;
    out.m_80.z = _1663;
    float _1675 = _1571;
    float _1677 = _1653;
    if (!_1673)
    {
        _1675 = 1.0;
    }
    float _1679 = _1675;
    out.m_82.x = _1543;
    out.m_82.y = _1545;
    out.m_82.z = _1547;
    bool _1681 = !_1673;
    float _1683 = _1679;
    if (!_1681)
    {
        bool _1685 = _1645 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1687 = isnan(_1645);
        bool _1689 = _1685 || _1687;
        bool _1691 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1693 = _1689 || _1691;
        if (!_1693)
        {
            float _1695 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1697 = _1645 + _1695;
            float _1699 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1701 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1699;
            float _1703 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1705 = _1703 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1707 = 1.0 / _1701;
            float _1709 = _1697 * _1707;
            float _1711 = fma(_1709, _1705, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1683 = _1711;
            _1713 = true;
        }
        else
        {
            bool _1715 = _1645 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1717 = isnan(_1645);
            bool _1719 = _1715 || _1717;
            bool _1721 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1723 = _1719 || _1721;
            if (!_1723)
            {
                float _1725 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1727 = _1645 + _1725;
                float _1729 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1731 = _1729 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1733 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1735 = _1733 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1737 = 1.0 / _1731;
                float _1739 = _1727 * _1737;
                float _1741 = fma(_1739, _1735, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1683 = _1741;
                _1713 = true;
            }
            else
            {
                _1683 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1713 = false;
    float _1743 = _1683;
    float _1745 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1747 = _1529 + _1745;
    float _1749 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1751 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1753 = _1525 + _1751;
    float _1755 = fma(_1747, _1743, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1757 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1749);
    float _1759 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1761 = _1527 + _1759;
    float _1763 = fma(_1753, _1743, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1765 = -_957;
    float _1767 = _1765 + _1755;
    float _1769 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1757);
    float _1771 = fma(_1761, _1743, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1773 = -_993;
    float _1775 = _1773 + _1763;
    float _1777 = _1767 * _1767;
    float _1779 = _1769 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1781 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1783 = -_767;
    float _1785 = _1783 + _1771;
    float _1787 = fma(_1775, _1775, _1777);
    float _1789 = 1.0 / _1779;
    float _1791 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1781);
    float _1793 = fma(_1785, _1785, _1787);
    float _1795 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1791);
    float _1797 = sqrt(_1793);
    float _1799 = _1795 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1801 = _1799 + _1779;
    float _1803 = _1801 * _1789;
    float _1805 = _1803 * 0.5;
    bool _1807 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1809 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1811 = _1807 || _1809;
    bool _1813 = isnan(0.5);
    bool _1815 = _1811 || _1813;
    float _1817 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1819 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1817);
    bool _1821 = _1797 > 0.0;
    float _1823 = 1.0 / _1819;
    bool _1825 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1827 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1829 = _1825 || _1827;
    bool _1831 = isnan(0.5);
    bool _1833 = _1829 || _1831;
    float _1835 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1837 = _1763;
    float _1839 = _1789;
    float _1841 = _1771;
    if (!_1821)
    {
        _1677 = _1755;
    }
    float _1843 = _1677;
    float _1845 = _1843;
    float _1847 = _1843;
    if (!_1821)
    {
        _1835 = _1771;
    }
    float _1849 = _1835;
    bool _1851 = !_1821;
    float _1853 = _1849;
    float _1855 = _1823;
    if (!_1851)
    {
        float _1857 = _209 * _209;
        float _1859 = rsqrt(_1793);
        float _1861 = fma(_207, _207, _1857);
        float _1863 = fma(_211, _211, _1861);
        float _1865 = sqrt(_1863);
        float _1867 = _1775 * _1859;
        float _1869 = _1767 * _1859;
        float _1871 = _1785 * _1859;
        bool _1873 = _1865 > 0.0;
        float _1875 = _1859;
        if (!_1873)
        {
            _1845 = _1755;
        }
        float _1877 = _1845;
        _1847 = _1877;
        if (!_1873)
        {
            _1875 = _1771;
        }
        float _1879 = _1875;
        bool _1881 = !_1873;
        _1853 = _1879;
        if (!_1881)
        {
            float _1883 = rsqrt(_1863);
            float _1885 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1887 = _209 * _1883;
            float _1889 = _207 * _1883;
            float _1891 = _1869 * _1887;
            float _1893 = _211 * _1883;
            float _1895 = fma(_1867, _1889, _1891);
            float _1897 = _1885 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1899 = fma(_1871, _1893, _1895);
            float _1901 = _1899 * _1897;
            float _1903 = fma(_207, _1901, _1763);
            float _1905 = fma(_209, _1901, _1755);
            float _1907 = fma(_211, _1901, _1771);
            _1837 = _1903;
            _1847 = _1905;
            _1853 = _1907;
            _1839 = _1885;
        }
    }
    float _1909 = _1837;
    float _1911 = _1847;
    float _1913 = _1853;
    float _1915 = _1839;
    float _1917 = -_1221;
    float _1919 = _1917 + _1909;
    float _1921 = -_1223;
    float _1923 = _1921 + _1911;
    float _1925 = -_1229;
    float _1927 = _1925 + _1913;
    float _1929 = _1923;
    float _1931 = _1919;
    float _1933 = _1927;
    if (_1815)
    {
        _1841 = 1.0;
    }
    float _1935 = _1841;
    float _1937 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1939 = _1823 * _1937;
    float _1941 = _1935;
    if (!_1833)
    {
        float _1943 = _1239 * _1239;
        float _1945 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1947 = -_767;
        float _1949 = _1947 + _1913;
        float _1951 = -_993;
        float _1953 = _1951 + _1909;
        float _1955 = fma(_1247, _1247, _1943);
        float _1957 = fma(_1255, _1255, _1955);
        float _1959 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1961 = sqrt(_1957);
        float _1963 = 1.0 / _1341;
        float _1965 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1967 = precise::min(_1961, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1969 = _1967 * _1945;
        float _1971 = _1969 * _1963;
        float _1973 = -_957;
        float _1975 = _1973 + _1911;
        float _1977 = _1965 * _1971;
        float _1979 = _1949 * _1971;
        float _1981 = fma(_1975, _1977, _1227);
        float _1983 = fma(_1953, _1977, _1233);
        float _1985 = fma(_1965, _1979, _1243);
        _1929 = _1981;
        _1931 = _1983;
        _1933 = _1985;
        _1855 = _1965;
    }
    float _1987 = _1929;
    float _1989 = _1931;
    float _1991 = _1933;
    float _1993 = _1855;
    float _1995 = _1993;
    if (!_1815)
    {
        float _1997 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1999 = _1997 * 0.15915493667125701904296875;
        float _2001 = _1999 * 6.283185482025146484375;
        float _2003 = cos(_2001);
        float _2005 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2007 = _2005 * 0.15915493667125701904296875;
        float _2009 = _1999 * 6.283185482025146484375;
        float _2011 = sin(_2009);
        float _2013 = 1.0 / _2003;
        float _2015 = _2007 * 6.283185482025146484375;
        float _2017 = cos(_2015);
        float _2019 = _2011 * _2013;
        float _2021 = _2007 * 6.283185482025146484375;
        float _2023 = sin(_2021);
        float _2025 = _2017 * _2019;
        float _2027 = 1.0 / _2025;
        float _2029 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2031 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2029;
        float _2033 = 1.0 / _2031;
        float _2035 = _2023 * _2027;
        float _2037 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2039 = fma(_1939, _2035, _2037);
        float _2041 = _2039 * _2033;
        float _2043 = precise::clamp(_2041, 0.0, 1.0);
        _1941 = _2043;
    }
    float _2045 = _1941;
    float _2047 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2049 = _1987 + _2047;
    float _2051 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2053 = _1989 + _2051;
    float _2055 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2057 = _1991 + _2055;
    float _2059 = _2049 * _2049;
    float _2061 = fma(_2053, _2053, _2059);
    float _2063 = fma(_2057, _2057, _2061);
    float _2065 = rsqrt(_2063);
    float _2067 = sqrt(_2063);
    float _2069 = _2065 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2071 = _2053 * _2069;
    float _2073 = _2057 * _2069;
    float _2075 = _2071 * _2071;
    float _2077 = _2073 * _2073;
    float _2079 = _2075 + _2077;
    float _2081 = sqrt(_2079);
    bool _2083 = _2081 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2085 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2087 = _2081 + _2085;
    float _2089 = _2065;
    float _2091 = _2087;
    float _2093 = _2049;
    if (_2083)
    {
        float _2095 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2089 = _2095;
    }
    float _2097 = _2089;
    float _2099 = _2097;
    if (_2083)
    {
        float _2101 = _2087 * _2097;
        _2091 = _2101;
    }
    float _2103 = _2091;
    if (_2083)
    {
        float _2105 = rsqrt(_2079);
        _2099 = _2105;
    }
    float _2107 = _2099;
    float _2109 = _2107;
    if (_2083)
    {
        float _2111 = _2103 * 0.15915493667125701904296875;
        _1995 = _2111;
    }
    float _2113 = _1995;
    float _2115 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2117 = _2057;
    float _2119 = _2113;
    if (_2083)
    {
        float _2121 = _2113 * 6.283185482025146484375;
        float _2123 = sin(_2121);
        _2117 = _2123;
    }
    float _2125 = _2117;
    float _2127 = precise::max(0.0, _2115);
    float _2129 = _1915;
    float _2131 = _2127;
    if (_2083)
    {
        float _2133 = _2113 * 6.283185482025146484375;
        float _2135 = cos(_2133);
        _2129 = _2135;
    }
    float _2137 = _2129;
    float _2139 = -_2069;
    float _2141 = -_2127;
    float _2143 = fma(_2049, _2139, _2141);
    float _2145 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2083)
    {
        float _2147 = _2143 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2093 = _2147;
    }
    float _2149 = _2093;
    float _2151 = fma(_1233, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2153 = _2125;
    float _2155 = _2149;
    if (_2083)
    {
        float _2157 = fma(_2125, _2149, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2153 = _2157;
    }
    float _2159 = _2153;
    float _2161 = _2159;
    if (!_2083)
    {
        _2155 = _2075;
    }
    float _2163 = _2155;
    float _2165 = floor(_2151);
    float _2167 = _2163;
    if (_2083)
    {
        float _2169 = _2107 * _2159;
        _2145 = _2169;
    }
    float _2171 = _2145;
    if (!_2083)
    {
        _2109 = _2071;
    }
    float _2173 = _2109;
    float _2175 = _2173;
    float _2177 = _2137;
    if (_2083)
    {
        float _2179 = _2137 + (-1.0);
        _2131 = _2179;
    }
    float _2181 = _2131;
    float _2183 = _2181;
    if (_2083)
    {
        float _2185 = _2071 * _2171;
        _2175 = _2185;
    }
    float _2187 = _2175;
    if (!_2083)
    {
        _2161 = _2143;
    }
    float _2189 = _2161;
    float _2191 = _1987 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2193 = _2189;
    if (_2083)
    {
        float _2195 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2119 = _2195;
    }
    float _2197 = _2119;
    if (!_2083)
    {
        _2183 = _2073;
    }
    float _2199 = _2183;
    float _2201 = _2199;
    if (_2083)
    {
        float _2203 = _2073 * _2171;
        _2201 = _2203;
    }
    float _2205 = _2201;
    if (_2083)
    {
        float _2207 = _2187 * _2187;
        _2167 = _2207;
    }
    float _2209 = _2167;
    if (_2083)
    {
        float _2211 = fma(_2143, _2137, _2197);
        _2193 = _2211;
    }
    float _2213 = _2193;
    if (!_2083)
    {
        _2177 = _2077;
    }
    float _2215 = _2177;
    float _2217 = _2215;
    if (_2083)
    {
        float _2219 = _2205 * _2205;
        _2217 = _2219;
    }
    float _2221 = _2217;
    float _2223 = fma(_2213, _2213, _2209);
    float _2225 = _1987 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2227 = -_2165;
    float _2229 = _2151 + _2227;
    float _2231 = _2223 + _2221;
    float _2233 = fma(_1989, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2191);
    float _2235 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2237 = fma(_2067, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2235);
    float _2239 = precise::clamp(_2237, 0.0, 1.0);
    float _2241 = _1987 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2243 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2233);
    float _2245 = rsqrt(_2231);
    float _2247 = -_2239;
    float _2249 = _2247 + 1.0;
    float _2251 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2253 = _2243 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2255 = fma(_1243, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2257 = _2253 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2259 = abs(_2249);
    float _2261 = log2(_2259);
    float _2263 = -_2257;
    float _2265 = fma(_2263, _2251, 1.0);
    float _2267 = _1987 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2269 = fma(_1989, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2241);
    float _2271 = _2245 * _2187;
    float _2273 = fma(_1989, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2267);
    float _2275 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2269);
    float _2277 = _2245 * _2213;
    float _2279 = _2271 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2281 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2273);
    float _2283 = _2275 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2285 = _2245 * _2205;
    float _2287 = fma(_1989, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2225);
    float _2289 = -_2279;
    float _2291 = fma(_2277, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2289);
    float _2293 = _2281 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2295 = _2283 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2297 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2287);
    float _2299 = -_2285;
    float _2301 = fma(_2299, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2291);
    float _2303 = _2261 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2305 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2295);
    float _2307 = log2(_2265);
    float _2309 = fma(_2301, -0.5, 0.5);
    float _2311 = _2283 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2313 = fma(_2253, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2305);
    float _2315 = floor(_2255);
    float _2317 = _2297 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2319 = fma(_2301, 0.5, 0.5);
    float _2321 = fma(_2317, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2313);
    float _2323 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2311);
    float _2325 = fma(_2319, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2327 = exp2(_2303);
    float _2329 = _2277 + 1.0;
    float _2331 = fma(_2253, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2323);
    float _2333 = 1.0 / _2321;
    float _2335 = _2283 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2337 = -_2315;
    float _2339 = _2255 + _2337;
    float _2341 = fma(_2319, _2325, -0.212114393711090087890625);
    float _2343 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2335);
    float _2345 = sqrt(_2309);
    float _2347 = fma(_2253, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2343);
    float _2349 = -_2277;
    float _2351 = fma(_2327, _2329, _2349);
    float _2353 = fma(_2317, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2331);
    float _2355 = _2307 * 0.693147182464599609375;
    float _2357 = fma(_2317, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2347);
    float2 _6591 = float2(_2229, _2339);
    float _2359 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6591, float2(0.0), isnan(_6591)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6591, float2(0.0), isnan(_6591)), level(0.0)).x;
    float _2361 = fma(_2319, _2341, 1.570728778839111328125);
    float _2363 = _2353 * _2333;
    float _2365 = _2357 * _2333;
    float _2367 = _2355 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2369 = fma(_2351, 0.5, 0.5);
    float _2371 = fma(_2363, 0.5, 0.5);
    float _2373 = fma(_2365, -0.5, 0.5);
    float _2375 = _2345 * 0.636619746685028076171875;
    float3 _6623 = float3(_2371, _2373, _2367);
    float _2377 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6623, float3(0.0), isnan(_6623)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6623, float3(0.0), isnan(_6623)), level(0.0)).x;
    float3 _6634 = float3(_2371, _2373, _2367);
    float4 _2380 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6634, float3(0.0), isnan(_6634)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6634, float3(0.0), isnan(_6634)), level(0.0)).xyzw;
    float _2382 = _2380.x;
    float _2384 = _2380.y;
    float _2386 = _2380.z;
    float _2388 = _2380.w;
    float _2390 = -_2361;
    float _2392 = fma(_2375, _2390, 1.0);
    float2 _6655 = float2(_2392, _2369);
    float3 _2394 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6655, float2(0.0), isnan(_6655)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6655, float2(0.0), isnan(_6655)), level(0.0)).xyz;
    float _2396 = _2394.x;
    float _2398 = _2394.y;
    float _2400 = _2394.z;
    float _2402 = abs(_1939);
    float _2404 = log2(_2402);
    bool _2406 = _2067 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2408 = isnan(_2067);
    bool _2410 = _2406 || _2408;
    bool _2412 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2414 = _2410 || _2412;
    float _2416 = _2404 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2418 = _2283 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2420 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2418);
    float _2422 = exp2(_2416);
    float _2424 = _2261 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2426 = fma(_2253, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2420);
    float _2428 = fma(_2317, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2426);
    float _2430 = exp2(_2424);
    float _2432 = fma(_2422, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2434 = precise::clamp(_2432, 0.0, 1.0);
    float _2436 = in.m_84.x;
    float _2438 = fma(_2434, -2.0, 3.0);
    float _2440 = _2434 * _2434;
    float _2442 = -_2430;
    float _2444 = _2442 + 1.0;
    float _2446 = _2440 * _2438;
    float _2448 = _2444 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2450 = -_2446;
    float _2452 = _2450 + 1.0;
    float _2454 = fma(_2452, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2446);
    bool _2456 = _1939 <= 8000.0;
    bool _2458 = isnan(_1939);
    bool _2460 = _2456 || _2458;
    bool _2462 = isnan(8000.0);
    bool _2464 = _2460 || _2462;
    float _2466 = float(_2464);
    float _2468 = _2428 + _2321;
    float _2470 = _2466 * _2454;
    float _2472 = _2468 * 0.5;
    out.gl_Position.x = _2353;
    out.gl_Position.y = _2357;
    out.gl_Position.z = _2428;
    out.gl_Position.w = _2321;
    float _2474 = _2470 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_86.z = _2472;
    out.m_86.w = _2321;
    float _2476 = _2321;
    float _2478 = _2428;
    float _2480 = _2357;
    float _2482 = _2353;
    if (!_2414)
    {
        _2476 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2484 = _2476;
    float _2486 = _2484;
    float _2488 = _2484;
    if (!_2414)
    {
        _2478 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2490 = _2478;
    float _2492 = _2490;
    float _2494 = _2490;
    if (!_2414)
    {
        _2480 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2496 = _2480;
    float _2498 = _2496;
    float _2500 = _2496;
    if (!_2414)
    {
        _2482 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2502 = _2482;
    float _2504 = -_2359;
    float _2506 = _2504 + 1.0;
    float _2508 = _2506 * _2474;
    float _2510 = precise::clamp(_2508, 0.0, 1.0);
    float _2512 = -_2510;
    float _2514 = fma(_2512, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2516 = _2448 * _2377;
    float _2518 = _2514 * _2436;
    float _2520 = -_2448;
    float _2522 = _2520 + 1.0;
    float _2524 = _2388 * _2516;
    float _2526 = _2518 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2528 = _2388 * _2522;
    float _2530 = _2400 * _2516;
    float _2532 = fma(_2396, _2524, _2382);
    float _2534 = fma(_2398, _2524, _2384);
    out.m_88.x = _2526;
    float _2536 = fma(_2388, _2530, _2386);
    float _2538 = _2045 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2540 = _2384;
    float _2542 = _2382;
    float _2544 = _2502;
    float _2546 = _2502;
    if (!_2414)
    {
        _2540 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2548 = _2540;
    float _2550 = _2548;
    float _2552 = _2548;
    if (!_2414)
    {
        _2542 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2554 = _2542;
    out.m_90.x = _2532;
    out.m_90.y = _2534;
    out.m_90.z = _2536;
    out.m_90.w = _2528;
    bool _2556 = !_2414;
    float _2558 = _2554;
    float _2560 = _2554;
    if (!_2556)
    {
        bool _2562 = _2067 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2564 = isnan(_2067);
        bool _2566 = _2562 || _2564;
        bool _2568 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2570 = _2566 || _2568;
        if (!_2570)
        {
            float _2572 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2574 = _2067 + _2572;
            float _2576 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2578 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2576;
            float _2580 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2582 = _2580 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2584 = 1.0 / _2578;
            float _2586 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2588 = _2586 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2592 = _2590 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2594 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2596 = _2594 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2598 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2600 = _2598 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2602 = _2574 * _2584;
            float _2604 = precise::clamp(_2602, 0.0, 1.0);
            float _2606 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2608 = _2606 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2610 = fma(_2604, _2582, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2612 = fma(_2604, _2608, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2614 = fma(_2604, _2588, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2616 = fma(_2604, _2592, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2618 = fma(_2604, _2596, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2620 = fma(_2604, _2600, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2560 = _2614;
            _2500 = _2618;
            _2552 = _2610;
            _2494 = _2616;
            _2488 = _2612;
            _2546 = _2620;
            _2622 = true;
        }
        else
        {
            bool _2624 = _2067 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2626 = isnan(_2067);
            bool _2628 = _2624 || _2626;
            bool _2630 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2632 = _2628 || _2630;
            if (!_2632)
            {
                _2550 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2634 = _2550;
            _2552 = _2634;
            if (!_2632)
            {
                _2558 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2636 = _2558;
            _2560 = _2636;
            if (!_2632)
            {
                _2486 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2638 = _2486;
            _2488 = _2638;
            if (!_2632)
            {
                _2492 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2640 = _2492;
            _2494 = _2640;
            if (!_2632)
            {
                _2498 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2642 = _2498;
            _2500 = _2642;
            if (!_2632)
            {
                _2544 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2644 = _2544;
            bool _2646 = !_2632;
            _2546 = _2644;
            if (!_2646)
            {
                bool _2648 = _2067 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2650 = isnan(_2067);
                bool _2652 = _2648 || _2650;
                bool _2654 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2656 = _2652 || _2654;
                if (!_2656)
                {
                    float _2658 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2660 = _2067 + _2658;
                    float _2662 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2664 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2662;
                    float _2666 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2668 = _2666 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2670 = 1.0 / _2664;
                    float _2672 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2674 = _2672 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2676 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2678 = _2676 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2680 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2682 = _2680 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2684 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2686 = _2684 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2688 = _2660 * _2670;
                    float _2690 = precise::clamp(_2688, 0.0, 1.0);
                    float _2692 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2694 = _2692 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2696 = fma(_2690, _2668, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2698 = fma(_2690, _2694, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2700 = fma(_2690, _2674, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2702 = fma(_2690, _2678, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2704 = fma(_2690, _2682, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2706 = fma(_2690, _2686, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2560 = _2700;
                    _2500 = _2704;
                    _2552 = _2696;
                    _2494 = _2702;
                    _2488 = _2698;
                    _2546 = _2706;
                    _2622 = true;
                }
                else
                {
                    _2560 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2500 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2552 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2494 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2488 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2546 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2622 = false;
    float _2708 = _2560;
    float _2710 = _2500;
    float _2712 = _2552;
    float _2714 = _2494;
    float _2716 = _2488;
    float _2718 = _2546;
    float _2720 = _2538 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2722 = fma(_1661, -0.5, 0.5);
    float _2724 = precise::clamp(_2722, 0.0, 1.0);
    float _2726 = -_2708;
    float _2728 = _2726 + _2710;
    float _2730 = -_2712;
    float _2732 = _2730 + _2714;
    out.m_53.x = _2720;
    float _2734 = fma(_2724, _2728, _2708);
    float _2736 = -_2716;
    float _2738 = _2736 + _2718;
    float _2740 = fma(_2724, _2732, _2712);
    float _2742 = _2734 * 0.586610972881317138671875;
    bool _2744 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2746 = fma(_2724, _2738, _2716);
    out.m_92.x = 0.0;
    float _2748 = fma(_2740, 0.298911988735198974609375, _2742);
    bool _2750 = _2045 > 0.0;
    bool _2752 = isnan(_2045);
    bool _2754 = _2750 || _2752;
    bool _2756 = isnan(0.0);
    bool _2758 = _2754 || _2756;
    float _2760 = fma(_2746, 0.114477999508380889892578125, _2748);
    float _2762 = -_2760;
    float _2764 = _2740 + _2762;
    float _2766 = -_2760;
    float _2768 = _2734 + _2766;
    float _2770 = -_2760;
    float _2772 = _2746 + _2770;
    float _2774 = fma(_2764, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2760);
    float _2776 = fma(_2768, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2760);
    float _2778 = fma(_2772, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2760);
    bool _2780 = !_2744;
    if (!_2780)
    {
        float _2782 = -_1987;
        float _2784 = _2782 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2786 = -_1989;
        float _2788 = _2786 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2790 = -_1991;
        float _2792 = _2790 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2794 = _2784 * _2784;
        float _2796 = fma(_2788, _2788, _2794);
        float _2798 = fma(_2792, _2792, _2796);
        float _2800 = sqrt(_2798);
        float _2802 = rsqrt(_2798);
        float _2804 = -_2800;
        float _2806 = _2804 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2808 = _2806 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2810 = precise::clamp(_2808, 0.0, 1.0);
        float _2812 = _2788 * _2802;
        float _2814 = _2784 * _2802;
        float _2816 = abs(_2810);
        float _2818 = log2(_2816);
        float _2820 = _2792 * _2802;
        float _2822 = _2812 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2824 = _1661 * _2814;
        float _2826 = -_2814;
        float _2828 = -_2822;
        float _2830 = fma(_2826, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2828);
        float _2832 = fma(_1659, _2812, _2824);
        float _2834 = -_2820;
        float _2836 = fma(_2834, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2830);
        float _2838 = fma(_1663, _2820, _2832);
        float _2840 = precise::clamp(_2838, 0.0, 1.0);
        float _2842 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2844 = _2836 + _2842;
        float _2846 = _2818 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2848 = _2844 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2850 = precise::clamp(_2848, 0.0, 1.0);
        float _2852 = exp2(_2846);
        float _2854 = _2852 * _2850;
        float _2856 = _2840 * _2854;
        float _2858 = _2856 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2860 = _2856 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2862 = _2856 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _2858;
        out.m_92.y = _2860;
        out.m_92.z = _2862;
    }
    out.m_94.x = _2774;
    out.m_94.y = _2776;
    out.m_94.z = _2778;
    if (_2758)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _2864 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2864;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

