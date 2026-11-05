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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_66 [[user(locn0)]];
    float4 m_68 [[user(locn1)]];
    float4 m_55 [[user(locn2)]];
    float4 m_98 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_74 [[user(locn5)]];
    float4 m_90 [[user(locn6)]];
    float4 m_72 [[user(locn7)]];
    float4 m_80 [[user(locn8)]];
    float4 m_70 [[user(locn9)]];
    float4 m_78 [[user(locn10)]];
    float4 m_84 [[user(locn11)]];
    float4 m_86 [[user(locn12)]];
    float4 m_82 [[user(locn13)]];
    float4 m_96 [[user(locn14)]];
    float4 m_92 [[user(locn15)]];
    float4 m_94 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_88 [[attribute(0)]];
    float4 m_76 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_50 [[attribute(4)]];
    float4 m_62 [[attribute(5)]];
    float4 m_64 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4907 = false;
    bool _4052 = false;
    bool _573 = false;
    bool _429 = false;
    bool _241 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_48.w;
    float _114 = in.m_50.w;
    float _116 = trunc(_112);
    int _119 = int(_116);
    float _121 = -_114;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _123;
    bool _127 = _119 >= 1;
    float _129 = 0.0;
    float _131 = as_type<float>(_119);
    float _133 = _123;
    if (!_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _129;
    if (!_127)
    {
        out.m_55.x = 0.0;
    }
    int _137 = 0;
    if (!_127)
    {
        float _139 = _135 * 5.0;
        _137 = as_type<int>(_139);
    }
    int _141 = _137;
    int _143 = _141;
    if (!_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5218 = as_type<float>(_141);
        out.gl_Position.z = _5218;
    }
    if (!_127)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _145 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_114);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = float(_119);
    bool _157 = _123 >= _155;
    bool _159 = !_153;
    bool _161 = _157 || _159;
    float _163 = 1.0 / _155;
    if (_161)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _131;
    if (_161)
    {
        out.m_55.x = 0.0;
    }
    float _167 = _123 * _163;
    float _169 = _167;
    if (_161)
    {
        float _171 = _165 * 5.0;
        _143 = as_type<int>(_171);
    }
    int _173 = _143;
    out.m_53.x = _167;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5281 = as_type<float>(_173);
        out.gl_Position.z = _5281;
    }
    if (_161)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _175 = as_type<float>(int(gl_VertexIndex));
    float _177 = in.m_60.x;
    float _179 = in.m_60.y;
    float _181 = in.m_60.z;
    int _183 = as_type<int>(_175) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_175) & 2;
    bool _189 = _187 != 0;
    bool _191 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _193 = _179 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _195 = _179 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _197 = _179 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _199 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].x, _193);
    float _201 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].x, _195);
    float _203 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].x, _197);
    float _205 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[4].z, _199);
    float _207 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[5].z, _201);
    float _209 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[6].z, _203);
    bool _211 = !_185;
    float _213 = _211 ? (-0.5) : 0.5;
    bool _215 = !_189;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_191;
    float _221 = _207;
    float _239;
    if (!_219)
    {
        float _223 = in.m_62.x;
        float _225 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _227 = _223 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _229 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _231 = _229 * _225;
        float _233 = floor(_231);
        float _235 = -_233;
        float _237 = _231 + _235;
        _239 = _237;
        _241 = true;
    }
    else
    {
        _239 = _167;
    }
    _241 = false;
    float _243 = _239;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _247 = _243 + _245;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _251 = _243 + _249;
    bool _253 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _255 = isnan(_243);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _271 = _269 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _279 = _243 + _277;
    float _281 = 1.0 / _267;
    bool _283 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _285 = 1.0 / _275;
    float _287 = 1.0 / _271;
    float _289 = _247 * _281;
    bool _291 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _293 = isnan(_243);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = -_263;
    float _305 = _303 + 1.0;
    float _307 = _301 * _305;
    float _309 = _251 * _285;
    bool _311 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _313 = isnan(_243);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = -_301;
    float _325 = _323 + 1.0;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _331 = _279 * _287;
    bool _333 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _335 = isnan(_243);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _345;
    float _349 = _321 * _325;
    float _351 = -_321;
    float _353 = _351 + 1.0;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _361 = _359 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _363 = fma(_347, _289, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _365 = _343 * _353;
    float _367 = fma(_357, _289, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _369 = fma(_329, _331, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _371 = fma(_361, _331, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _373 = -_343;
    float _375 = _373 + 1.0;
    float _377 = _363 * _365;
    float _379 = _367 * _365;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _385;
    float _389 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[143].x, _377);
    float _391 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[143].y, _379);
    float _393 = fma(_383, _309, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _395 = fma(_387, _309, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _397 = fma(_369, _349, _389);
    float _399 = fma(_371, _349, _391);
    float _401 = fma(_393, _307, _397);
    float _403 = fma(_395, _307, _399);
    float _405 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[146].x, _401);
    float _407 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[146].y, _403);
    bool _409 = !_283;
    float _427;
    if (!_409)
    {
        float _411 = in.m_62.x;
        float _413 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _415 = _411 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _417 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _419 = _417 * _413;
        float _421 = floor(_419);
        float _423 = -_421;
        float _425 = _419 + _423;
        _427 = _425;
        _429 = true;
    }
    else
    {
        _427 = _167;
    }
    _429 = false;
    float _431 = _427;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _435 = _431 + _433;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _441 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _443 = isnan(_431);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _457 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _459 = isnan(_431);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _465 = _461 || _463;
    float _467 = float(_465);
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _469;
    bool _473 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _475 = isnan(_431);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = 1.0 / _439;
    float _487 = -_451;
    float _489 = _487 + 1.0;
    bool _491 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _493 = 1.0 / _455;
    float _495 = _471 * _485;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _501 = -_483;
    float _503 = _501 + 1.0;
    float _505 = fma(_495, _435, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _507 = _467 * _489;
    float _509 = -_467;
    float _511 = _509 + 1.0;
    float _513 = _451 * _503;
    float _515 = _499 * _493;
    float _517 = _505 * _507;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _521 = _431 + _519;
    float _523 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[115].x, _517);
    float _525 = fma(_515, _521, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _529 = fma(_525, _513, _523);
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _533 = in.m_64.x;
    float _535 = in.m_64.y;
    float _537 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[117].x, _529);
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _541 = _527 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _543 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _545 = _537 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _547 = _539 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_66.x = _541;
    out.m_66.y = _543;
    out.m_66.z = _547;
    out.m_66.w = _545;
    float _549 = _407 * _535;
    float _551 = _405 * _533;
    bool _553 = !_491;
    float _571;
    if (!_553)
    {
        float _555 = in.m_62.x;
        float _557 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _559 = _555 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _561 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[11].w, _123);
        float _563 = _561 * _557;
        float _565 = floor(_563);
        float _567 = -_565;
        float _569 = _563 + _567;
        _571 = _569;
        _573 = true;
    }
    else
    {
        _571 = _167;
    }
    _573 = false;
    float _575 = _571;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _579 = _575 + _577;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _585 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _587 = isnan(_575);
    bool _589 = _585 || _587;
    bool _591 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _593 = _589 || _591;
    float _595 = float(_593);
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _601 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _603 = isnan(_575);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _613;
    bool _617 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _619 = isnan(_575);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = 1.0 / _583;
    float _631 = -_595;
    float _633 = _631 + 1.0;
    bool _635 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _637 = 1.0 / _599;
    float _639 = _615 * _629;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _645 = fma(_639, _579, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _647 = _611 * _633;
    float _649 = -_627;
    float _651 = _649 + 1.0;
    float _653 = -_611;
    float _655 = _653 + 1.0;
    float _657 = _643 * _637;
    float _659 = _645 * _647;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _663 = _575 + _661;
    float _665 = _595 * _651;
    float _667 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[131].x, _659);
    float _669 = fma(_657, _663, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _671 = fma(_669, _665, _667);
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _679 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[133].x, _671);
    float _681 = _673 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _683 = _675 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _685 = _677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _687 = _679 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_68.x = _681;
    out.m_68.y = _683;
    out.m_68.z = _685;
    out.m_68.w = _687;
    bool _689 = !_635;
    float _691 = _665;
    float _693 = _687;
    if (!_689)
    {
        float _695 = in.m_62.x;
        float _697 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _699 = _695 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _701 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[14].x, _123);
        float _703 = _701 * _697;
        float _705 = floor(_703);
        float _707 = -_705;
        float _709 = _703 + _707;
        _169 = _709;
    }
    float _711 = _169;
    float _713 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _715 = int(_713);
    int _717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _719 = _717 != 0;
    float _721 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _723 = int(_721);
    float _725 = float(_715);
    float _727 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _729 = int(_727);
    float _731 = 0.0;
    if (_719)
    {
        _731 = 1.0;
    }
    float _733 = _731;
    float _735 = _733;
    if (_719)
    {
        _691 = 1.0;
    }
    float _737 = _691;
    float _739 = float(_723);
    float _741 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _743 = int(_741);
    float _745 = 1.0 / _739;
    float _747 = float(uint(_729));
    int _749 = ~_729;
    int _751 = _749 + 1;
    float _753 = 1.0 / _725;
    float _755 = float(uint(_743));
    float _757 = _745 * _123;
    float _759 = 1.0 / _747;
    float _761 = _753 * _123;
    float _763 = 1.0 / _755;
    float _765 = _739;
    float _767 = _753;
    float _769 = _737;
    if (_719)
    {
        float _771 = in.m_62.x;
        float _773 = in.m_62.y;
        _765 = _771;
        _767 = _773;
    }
    float _775 = _765;
    float _777 = _767;
    float _779 = trunc(_757);
    int _781 = int(_779);
    int _783 = as_type<int>(_759) + (-2);
    float _785 = trunc(_761);
    int _787 = int(_785);
    int _789 = as_type<int>(_763) + (-2);
    float _791 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _793 = int(_791);
    float _795 = float(uint(_781));
    int _797 = as_type<int>(_795);
    float _799 = _775;
    float _801 = _777;
    if (_719)
    {
        _693 = _777;
    }
    float _803 = _693;
    float _805 = as_type<float>(_783) * _795;
    float _807 = _803;
    if (_719)
    {
        _797 = 0;
    }
    int _809 = _797;
    float _811 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _813 = int(_811);
    float _815 = float(uint(_787));
    float _817 = as_type<float>(_789) * _815;
    float _819 = _815;
    int _821 = _809;
    if (_719)
    {
        _819 = _775;
    }
    float _823 = _819;
    float _825 = trunc(_805);
    float _827 = precise::max(_825, 0.0);
    uint _830 = uint(_827);
    float _832 = float(uint(_793));
    float _834 = 0.0;
    int _836 = as_type<int>(_832);
    float _838 = _823;
    if (_719)
    {
        _834 = _823;
    }
    float _840 = _834;
    float _842 = trunc(_817);
    float _844 = precise::max(_842, 0.0);
    uint _846 = uint(_844);
    float _848 = float(_813);
    float _850 = 1.0 / _848;
    float _852 = 1.0 / _832;
    float _854 = _848;
    float _856 = _840;
    if (_719)
    {
        _854 = _823;
    }
    float _858 = _854;
    float _860 = _858;
    if (_719)
    {
        _836 = 0;
    }
    int _862 = _836;
    int _864 = _862;
    if (!_719)
    {
        float _866 = in.m_62.x;
        float _868 = in.m_62.y;
        float _870 = in.m_62.z;
        float _872 = _866 * 3.1415927410125732421875;
        float _874 = _872 * 0.15915493667125701904296875;
        float _876 = _868 * 3.1415927410125732421875;
        float _878 = _876 * 0.15915493667125701904296875;
        float _880 = _874 * 6.283185482025146484375;
        float _882 = sin(_880);
        float _884 = _878 * 6.283185482025146484375;
        float _886 = sin(_884);
        _735 = 7.345489978790283203125;
        _799 = _866;
        _838 = _868;
        _769 = 5.839270114898681640625;
        _860 = _870;
        _801 = _868;
        _856 = _882;
        _821 = 1;
        _864 = 2;
        _807 = _886;
    }
    float _888 = _735;
    float _890 = _799;
    float _892 = _838;
    float _894 = _769;
    float _896 = _860;
    float _898 = _801;
    float _900 = _856;
    int _902 = _821;
    int _904 = _864;
    float _906 = _807;
    float _908 = in.m_62.z;
    float _910 = in.m_62.w;
    int _912 = ~_743;
    int _914 = _912 + 1;
    int _916 = _751 * int(_830);
    int _918 = _916 + _781;
    float _920 = _850 * _123;
    float _922 = _888 * _890;
    float _924 = _888 * _892;
    int _926 = _914 * int(_846);
    int _928 = _926 + _787;
    float _930 = float(uint(_918));
    float _932 = floor(_922);
    float _934 = _894 * _896;
    float _936 = _163 * _123;
    float _938 = float(uint(_928));
    float _940 = as_type<float>(_783) * _930;
    float _942 = float(_729);
    float _944 = _890 * 2.0;
    float _946 = trunc(_920);
    int _948 = int(_946);
    float _950 = float(_781);
    float _952 = _890 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _956 = _954 != 0;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _960 = _711 + _958;
    bool _962 = _898 > 0.5;
    int _964 = ~_729;
    int _966 = _964 + 1;
    float _968 = trunc(_940);
    float _970 = precise::max(_968, 0.0);
    uint _972 = uint(_970);
    bool _974 = _910 > 0.5;
    float _976 = as_type<float>(_789) * _938;
    float _978 = -_932;
    float _980 = _922 + _978;
    int _982 = as_type<int>(_852) + (-2);
    bool _984 = _908 > 0.5;
    float _986 = floor(_934);
    float _988 = float(uint(_948));
    bool _990 = _950 >= _942;
    bool _992 = isnan(_950);
    bool _994 = _990 || _992;
    bool _996 = isnan(_942);
    bool _998 = _994 || _996;
    float _1000 = float(_998);
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1004 = _1002 != 0;
    int _1006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1008 = _1006 != 0;
    int _1010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1012 = _1010 != 0;
    float _1014 = as_type<float>(_982) * _988;
    float _1016 = -_213;
    int _1018 = _962 ? as_type<int>(_1016) : as_type<int>(_213);
    float _1020 = trunc(_976);
    float _1022 = precise::max(_1020, 0.0);
    uint _1024 = uint(_1022);
    int _1026 = int(_830) + int(_972);
    int _1028 = ~_743;
    int _1030 = _1028 + 1;
    int _1032 = _966 * _1026;
    int _1034 = _1032 + _781;
    int _1036 = int(_974);
    int _1038 = _984 ? 2 : 0;
    int _1040 = _1036 | _1038;
    int _1042 = _956 ? 4 : 0;
    int _1044 = _1040 | _1042;
    int _1046 = _1004 ? 8 : 0;
    int _1048 = _1044 | _1046;
    int _1050 = _1008 ? 16 : 0;
    int _1052 = _1048 | _1050;
    int _1054 = _1012 ? 32 : 0;
    int _1056 = _1052 | _1054;
    int _1058 = _962 ? 64 : 0;
    int _1060 = _1056 | _1058;
    int _1062 = _1060 & 64;
    float _1064 = trunc(_1014);
    float _1066 = precise::max(_1064, 0.0);
    uint _1068 = uint(_1066);
    float _1070 = -_986;
    float _1072 = _934 + _1070;
    float _1074 = -_217;
    int _1076 = _984 ? as_type<int>(_1074) : as_type<int>(_217);
    bool _1078 = !_956;
    int _1080 = _1078 ? 0 : 1;
    bool _1082 = !_1012;
    float _1084 = _1082 ? _217 : as_type<float>(_1076);
    float _1086 = _980 * _942;
    int _1088 = int(_846) + int(_1024);
    float _1090 = floor(_924);
    float _1092 = _942 * _936;
    float _1094 = float(_743);
    float _1096 = float(_787);
    int _1098 = _1030 * _1088;
    int _1100 = _1098 + _787;
    int _1102 = abs(_1080);
    float _1104 = trunc(_1000);
    int _1106 = int(_1104);
    float _1108 = _1072 * _1094;
    int _1110 = _729 + (-1);
    float _1112 = trunc(_1086);
    int _1114 = int(_1112);
    bool _1116 = !_1008;
    float _1118 = _1116 ? _213 : as_type<float>(_1018);
    int _1120 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1122 = _1120 != 0;
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1126 = _1124 != 0;
    int _1128 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1130 = _1128 != 0;
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    bool _1134 = uint(_1034) >= uint(_729);
    int _1136 = ~_793;
    int _1138 = _1136 + 1;
    float _1140 = trunc(_1092);
    int _1142 = int(_1140);
    bool _1144 = !_1126;
    int _1146 = _1144 ? 0 : 1;
    float _1148 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1132);
    bool _1150 = !_1122;
    int _1152 = _1150 ? 0 : 1;
    int _1154 = _1138 * int(_1068);
    int _1156 = _1154 + _948;
    int _1158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1160 = _1158 != 0;
    float _1162 = _900 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _1164 = uint(_1100) >= uint(_743);
    float _1166 = trunc(_1108);
    int _1168 = int(_1166);
    bool _1170 = _1096 >= _1094;
    bool _1172 = isnan(_1096);
    bool _1174 = _1170 || _1172;
    bool _1176 = isnan(_1094);
    bool _1178 = _1174 || _1176;
    float _1180 = float(_1178);
    float _1182 = _1094 * _936;
    bool _1184 = !_1130;
    int _1186 = _1184 ? 0 : 1;
    float _1188 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1148);
    bool _1190 = !_1160;
    int _1192 = _1190 ? 0 : 1;
    bool _1194 = !_1164;
    int _1196 = _1194 ? 0 : (-1);
    float _1198 = trunc(_1180);
    int _1200 = int(_1198);
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1204 = _1202 != 0;
    int _1206 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1208 = _1206 != 0;
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1212 = _1210 != 0;
    float _1214 = -_1188;
    float _1216 = _1214 + 1.0;
    bool _1218 = !_1134;
    int _1220 = _1218 ? 0 : (-1);
    int _1222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1224 = _1222 != 0;
    int _1226 = ~_1026;
    int _1228 = _1226 + _1220;
    int _1230 = _1228 + 1;
    float _1232 = trunc(_1182);
    int _1234 = int(_1232);
    float _1236 = -_1090;
    float _1238 = _924 + _1236;
    float _1240 = float(uint(_1156));
    bool _1242 = !_1208;
    int _1244 = _1242 ? 0 : 1;
    bool _1246 = _1062 != 0;
    float _1248 = as_type<float>(_982) * _1240;
    float _1250 = floor(_944);
    int _1252 = ~_1088;
    int _1254 = _1252 + _1196;
    int _1256 = _1254 + 1;
    bool _1258 = !_1224;
    int _1260 = _1258 ? 0 : 1;
    int _1262 = _1114 * _1102;
    int _1264 = _1262 + _781;
    bool _1266 = _729 == 0;
    int _1268 = _729 * _1230;
    int _1270 = _1268 + _781;
    bool _1272 = !_1204;
    int _1274 = _1272 ? 0 : 1;
    int _1276 = _743 * _1256;
    int _1278 = _1276 + _787;
    bool _1280 = _743 == 0;
    float _1282 = trunc(_1248);
    float _1284 = precise::max(_1282, 0.0);
    uint _1286 = uint(_1284);
    int _1288 = ~_1106;
    int _1290 = _1288 + 1;
    int _1292 = _1290 + 1;
    bool _1294 = !_1266;
    int _1296 = _1294 ? _1270 : (-1);
    int _1298 = ~_1200;
    int _1300 = _1298 + 1;
    int _1302 = _1300 + 1;
    bool _1304 = !_1280;
    int _1306 = _1304 ? _1278 : (-1);
    int _1308 = _1296 * _1292;
    int _1310 = abs(_1146);
    int _1312 = _743 + (-1);
    int _1314 = _1306 * _1302;
    int _1316 = abs(_1244);
    int _1318 = _1106 * _1110;
    int _1320 = _1318 + _1308;
    int _1322 = abs(_1152);
    int _1324 = _1200 * _1312;
    int _1326 = _1324 + _1314;
    int _1328 = _1320 * _1310;
    int _1330 = abs(_1186);
    int _1332 = abs(_1260);
    int _1334 = _1326 * _1316;
    int _1336 = abs(_1192);
    int _1338 = _1168 * _1332;
    int _1340 = _1338 + _787;
    int _1342 = _1142 * _1322;
    int _1344 = _1342 + _1328;
    int _1346 = int(_1068) + int(_1286);
    int _1348 = ~_793;
    int _1350 = _1348 + 1;
    int _1352 = _1264 * _1330;
    int _1354 = _1352 + _1344;
    int _1356 = abs(_1274);
    int _1358 = _1350 * _1346;
    int _1360 = _1358 + _948;
    float _1362 = -_217;
    int _1364 = _974 ? as_type<int>(_1362) : as_type<int>(_217);
    int _1366 = _1114 * _1336;
    int _1368 = _1366 + _1354;
    bool _1370 = uint(_1360) >= uint(_793);
    float _1372 = float(uint(_1368));
    int _1374 = _1234 * _1356;
    int _1376 = _1374 + _1334;
    float _1378 = float(_793);
    float _1380 = -_213;
    int _1382 = _984 ? as_type<int>(_1380) : as_type<int>(_213);
    float _1384 = as_type<float>(_783) * _1372;
    float _1386 = float(_948);
    float _1388 = _1238 * _1378;
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1392 = _1390 != 0;
    float _1394 = trunc(_1384);
    float _1396 = precise::max(_1394, 0.0);
    uint _1398 = uint(_1396);
    bool _1400 = _1386 >= _1378;
    bool _1402 = isnan(_1386);
    bool _1404 = _1400 || _1402;
    bool _1406 = isnan(_1378);
    bool _1408 = _1404 || _1406;
    float _1410 = float(_1408);
    float _1412 = _1378 * _936;
    bool _1414 = !_1212;
    int _1416 = _1414 ? 0 : 1;
    int _1418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1420 = _1418 != 0;
    bool _1422 = !_1392;
    int _1424 = _1422 ? 0 : 1;
    float _1426 = trunc(_1410);
    int _1428 = int(_1426);
    bool _1430 = !_1420;
    int _1432 = _1430 ? 0 : 1;
    int _1434 = abs(_1416);
    int _1436 = abs(_1424);
    bool _1438 = !_1004;
    float _1440 = _1438 ? _217 : as_type<float>(_1364);
    int _1442 = _1340 * _1434;
    int _1444 = _1442 + _1376;
    bool _1446 = !_1370;
    int _1448 = _1446 ? 0 : (-1);
    float _1450 = trunc(_1412);
    int _1452 = int(_1450);
    int _1454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1456 = _1454 != 0;
    int _1458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1460 = _1458 != 0;
    int _1462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1464 = _1462 != 0;
    int _1466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1468 = _1466 != 0;
    int _1470 = ~_1346;
    int _1472 = _1470 + _1448;
    int _1474 = _1472 + 1;
    bool _1476 = !_1460;
    int _1478 = _1476 ? 0 : 1;
    int _1480 = _1168 * _1436;
    int _1482 = _1480 + _1444;
    int _1484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1486 = _1484 != 0;
    int _1488 = _793 * _1474;
    int _1490 = _1488 + _948;
    int _1492 = ~_729;
    int _1494 = _1492 + 1;
    float _1496 = trunc(_1388);
    int _1498 = int(_1496);
    bool _1500 = !_1456;
    int _1502 = _1500 ? 0 : 1;
    bool _1504 = _793 == 0;
    int _1506 = _1494 * int(_1398);
    int _1508 = _1506 + _1368;
    float _1510 = float(uint(_1482));
    int _1512 = ~_1428;
    int _1514 = _1512 + 1;
    int _1516 = _1514 + 1;
    bool _1518 = !_1504;
    int _1520 = _1518 ? _1490 : (-1);
    float _1522 = as_type<float>(_789) * _1510;
    float _1524 = float(uint(_1508));
    float _1526 = _1510;
    float _1528 = as_type<float>(_1368);
    float _1530 = as_type<float>(_1068);
    if (_1486)
    {
        float _1532 = in.m_62.w;
        _1526 = _1532;
    }
    float _1534 = _1526;
    int _1536 = abs(_1478);
    int _1538 = _1520 * _1516;
    int _1540 = _793 + (-1);
    float _1542 = as_type<float>(_783) * _1524;
    float _1544 = trunc(_1522);
    float _1546 = precise::max(_1544, 0.0);
    uint _1548 = uint(_1546);
    int _1550 = abs(_1432);
    int _1552 = abs(_1502);
    int _1554 = _1428 * _1540;
    int _1556 = _1554 + _1538;
    float _1558 = trunc(_1542);
    float _1560 = precise::max(_1558, 0.0);
    uint _1562 = uint(_1560);
    int _1564 = _1556 * _1536;
    int _1566 = ~_743;
    int _1568 = _1566 + 1;
    int _1570 = _1498 * _1550;
    int _1572 = _1570 + _948;
    bool _1574 = _729 == 0;
    int _1576 = _1452 * _1552;
    int _1578 = _1576 + _1564;
    bool _1580 = !_1464;
    int _1582 = _1580 ? 0 : 1;
    int _1584 = ~_729;
    int _1586 = _1584 + 1;
    int _1588 = _1568 * int(_1548);
    int _1590 = _1588 + _1482;
    float _1592 = as_type<float>(_1550);
    if (_1486)
    {
        float _1594 = _1534 * 3.1415927410125732421875;
        _1592 = _1594;
    }
    float _1596 = _1592;
    int _1598 = abs(_1582);
    bool _1600 = !_1468;
    int _1602 = _1600 ? 0 : 1;
    float _1604 = _1596;
    if (_1486)
    {
        float _1606 = _1596 * 0.15915493667125701904296875;
        _1604 = _1606;
    }
    float _1608 = _1604;
    int _1610 = int(_1398) + int(_1562);
    float _1612 = float(uint(_1590));
    int _1614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1616 = _1614 != 0;
    int _1618 = _1586 * _1610;
    int _1620 = _1618 + _1368;
    int _1622 = abs(_1602);
    float _1624 = as_type<float>(_789) * _1612;
    float _1626 = _1608;
    if (_1486)
    {
        float _1628 = _1608 * 6.283185482025146484375;
        float _1630 = sin(_1628);
        _1626 = _1630;
    }
    float _1632 = _1626;
    float _1634 = 0.0;
    if (!_1486)
    {
        _1634 = _213;
    }
    float _1636 = _1634;
    bool _1638 = uint(_1620) >= uint(_729);
    int _1640 = _1572 * _1598;
    int _1642 = _1640 + _1578;
    float _1644 = float(uint(_1264));
    float _1646 = trunc(_1624);
    float _1648 = precise::max(_1646, 0.0);
    uint _1650 = uint(_1648);
    bool _1652 = !_1638;
    int _1654 = _1652 ? 0 : (-1);
    float _1656 = as_type<float>(_1562);
    float _1658 = _1636;
    if (_1616)
    {
        float _1660 = in.m_62.x;
        _1656 = _1660;
    }
    float _1662 = _1656;
    int _1664 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1666 = _1664 != 0;
    float _1668 = as_type<float>(_783) * _1644;
    int _1670 = ~_1610;
    int _1672 = _1670 + _1654;
    int _1674 = _1672 + 1;
    int _1676 = _1498 * _1622;
    int _1678 = _1676 + _1642;
    bool _1680 = !_1666;
    float _1682 = _1680 ? _213 : as_type<float>(_1382);
    bool _1684 = _1666;
    if (_1486)
    {
        bool _1686 = _1632 > 0.5;
        _1684 = _1686;
    }
    bool _1688 = _1684;
    float _1690 = trunc(_1668);
    float _1692 = precise::max(_1690, 0.0);
    uint _1694 = uint(_1692);
    int _1696 = _729 * _1674;
    int _1698 = _1696 + _1368;
    float _1700 = float(uint(_1678));
    if (_1486)
    {
        float _1702 = -_213;
        float _1704 = _1688 ? _1702 : _213;
        _1658 = _1704;
    }
    float _1706 = _1658;
    bool _1708 = !_1574;
    int _1710 = _1708 ? _1698 : (-1);
    int _1712 = int(_1548) + int(_1650);
    float _1714 = as_type<float>(_982) * _1700;
    int _1716 = _1710 & 3;
    bool _1718 = _1716 != 0;
    int _1720 = _1710 & 3;
    bool _1722 = _1720 != 0;
    float _1724 = trunc(_1714);
    float _1726 = precise::max(_1724, 0.0);
    uint _1728 = uint(_1726);
    int _1730 = ~_729;
    int _1732 = _1730 + 1;
    int _1734 = _1718 ? 0 : 1;
    float _1736 = _1706;
    if (_1616)
    {
        float _1738 = _1662 * 3.1415927410125732421875;
        _1528 = _1738;
    }
    float _1740 = _1528;
    bool _1742 = uint(_1720) > 1u;
    int _1744 = _1732 * int(_1694);
    int _1746 = _1744 + _1264;
    float _1748 = float(uint(_1340));
    float _1750 = _1740;
    if (_1616)
    {
        float _1752 = _1740 * 0.15915493667125701904296875;
        _1750 = _1752;
    }
    float _1754 = _1750;
    int _1756 = ~_743;
    int _1758 = _1756 + 1;
    float _1760 = float(uint(_1746));
    float _1762 = as_type<float>(_789) * _1748;
    int _1764 = ~_793;
    int _1766 = _1764 + 1;
    int _1768 = _1758 * _1712;
    int _1770 = _1768 + _1482;
    int _1772 = ~_1734;
    int _1774 = _1772 + 1;
    int _1776 = _1774 + 1;
    float _1778 = as_type<float>(_783) * _1760;
    float _1780 = trunc(_1762);
    float _1782 = precise::max(_1780, 0.0);
    uint _1784 = uint(_1782);
    int _1786 = _1766 * int(_1728);
    int _1788 = _1786 + _1678;
    int _1790 = _1776;
    if (!_1742)
    {
        int _1792 = ~_1734;
        int _1794 = _1792 + 1;
        _1790 = _1794;
    }
    int _1796 = _1790;
    float _1798 = -_217;
    int _1800 = _1246 ? as_type<int>(_1798) : as_type<int>(_217);
    bool _1802 = uint(_1720) >= 2u;
    bool _1804 = uint(_1770) >= uint(_743);
    float _1806 = _1754;
    if (_1616)
    {
        float _1808 = _1754 * 6.283185482025146484375;
        float _1810 = sin(_1808);
        _1806 = _1810;
    }
    float _1812 = _1806;
    float _1814 = float(uint(_1788));
    int _1816 = _1802 ? 0 : 1;
    bool _1818 = _1720 != 3;
    float _1820 = as_type<float>(_982) * _1814;
    bool _1822 = !_1804;
    int _1824 = _1822 ? 0 : (-1);
    float _1826 = trunc(_1778);
    float _1828 = precise::max(_1826, 0.0);
    uint _1830 = uint(_1828);
    int _1832 = ~_743;
    int _1834 = _1832 + 1;
    int _1836 = ~_1712;
    int _1838 = _1836 + _1824;
    int _1840 = _1838 + 1;
    int _1842 = ~_1816;
    int _1844 = _1842 + 1;
    int _1846 = _1844 + 1;
    int _1848 = _1834 * int(_1784);
    int _1850 = _1848 + _1340;
    float _1852 = 0.0;
    int _1854 = _1846;
    bool _1856 = _1818;
    if (!_1616)
    {
        _1852 = _217;
    }
    float _1858 = _1852;
    float _1860 = trunc(_1820);
    float _1862 = precise::max(_1860, 0.0);
    uint _1864 = uint(_1862);
    int _1866 = _743 * _1840;
    int _1868 = _1866 + _1482;
    float _1870 = _1858;
    if (_1818)
    {
        int _1872 = ~_1816;
        int _1874 = _1872 + 1;
        _1854 = _1874;
    }
    int _1876 = _1854;
    if (_1616)
    {
        bool _1878 = _1812 > 0.5;
        _1856 = _1878;
    }
    bool _1880 = _1856;
    bool _1882 = !_1280;
    int _1884 = _1882 ? _1868 : (-1);
    float _1886 = float(uint(_1850));
    if (_1616)
    {
        float _1888 = -_217;
        float _1890 = _1880 ? _1888 : _217;
        _1870 = _1890;
    }
    float _1892 = _1870;
    int _1894 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1896 = _1894 != 0;
    float _1898 = as_type<float>(_789) * _1886;
    int _1900 = _1884 & 3;
    bool _1902 = _1900 != 0;
    int _1904 = int(_1694) + int(_1830);
    bool _1906 = !_1896;
    float _1908 = _1906 ? _217 : as_type<float>(_1800);
    float _1910 = trunc(_1898);
    float _1912 = precise::max(_1910, 0.0);
    uint _1914 = uint(_1912);
    bool _1916 = uint(_1900) > 1u;
    int _1918 = int(_1728) + int(_1864);
    int _1920 = ~_793;
    int _1922 = _1920 + 1;
    int _1924 = _1884 & 3;
    bool _1926 = _1924 != 0;
    int _1928 = ~_729;
    int _1930 = _1928 + 1;
    int _1932 = _1922 * _1918;
    int _1934 = _1932 + _1678;
    int _1936 = _1926 ? 0 : 1;
    float _1938 = float(uint(_1572));
    int _1940 = _1930 * _1904;
    int _1942 = _1940 + _1264;
    int _1944 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1946 = _1944 != 0;
    int _1948 = ~_1936;
    int _1950 = _1948 + 1;
    int _1952 = _1950 + 1;
    float _1954 = as_type<float>(_982) * _1938;
    bool _1956 = !_1946;
    int _1958 = _1956 ? 0 : 1;
    bool _1960 = uint(_1934) >= uint(_793);
    int _1962 = _1952;
    float _1964 = as_type<float>(_1864);
    if (!_1916)
    {
        int _1966 = ~_1936;
        int _1968 = _1966 + 1;
        _1962 = _1968;
    }
    int _1970 = _1962;
    float _1972 = trunc(_1954);
    float _1974 = precise::max(_1972, 0.0);
    uint _1976 = uint(_1974);
    bool _1978 = uint(_1942) >= uint(_729);
    bool _1980 = !_1960;
    int _1982 = _1980 ? 0 : (-1);
    bool _1984 = _1900 != 3;
    int _1986 = ~_743;
    int _1988 = _1986 + 1;
    bool _1990 = !_1978;
    int _1992 = _1990 ? 0 : (-1);
    bool _1994 = uint(_1900) >= 2u;
    int _1996 = int(_1784) + int(_1914);
    int _1998 = ~_1918;
    int _2000 = _1998 + _1982;
    int _2002 = _2000 + 1;
    int _2004 = ~_793;
    int _2006 = _2004 + 1;
    int _2008 = _793 * _2002;
    int _2010 = _2008 + _1678;
    int _2012 = _1994 ? 0 : 1;
    int _2014 = _1988 * _1996;
    int _2016 = _2014 + _1340;
    int _2018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2020 = _2018 != 0;
    int _2022 = ~_2012;
    int _2024 = _2022 + 1;
    int _2026 = _2024 + 1;
    int _2028 = _2026;
    float _2030 = as_type<float>(_2010);
    if (_1984)
    {
        int _2032 = ~_2012;
        int _2034 = _2032 + 1;
        _2028 = _2034;
    }
    int _2036 = _2028;
    int _2038 = _2006 * int(_1976);
    int _2040 = _2038 + _1572;
    int _2042 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2044 = _2042 != 0;
    bool _2046 = !_2020;
    int _2048 = _2046 ? 0 : 1;
    bool _2050 = uint(_2016) >= uint(_743);
    bool _2052 = !_1504;
    int _2054 = _2052 ? _2010 : (-1);
    bool _2056 = !_2044;
    int _2058 = _2056 ? 0 : 1;
    bool _2060 = !_2050;
    int _2062 = _2060 ? 0 : (-1);
    int _2064 = _2054 & 3;
    bool _2066 = _2064 != 0;
    int _2068 = _2054 & 3;
    bool _2070 = _2068 != 0;
    float _2072 = float(uint(_2040));
    int _2074 = _2066 ? 0 : 1;
    bool _2076 = uint(_2068) > 1u;
    float _2078 = as_type<float>(_982) * _2072;
    int _2080 = ~_2074;
    int _2082 = _2080 + 1;
    int _2084 = _2082 + 1;
    int _2086 = ~_793;
    int _2088 = _2086 + 1;
    float _2090 = trunc(_2078);
    float _2092 = precise::max(_2090, 0.0);
    uint _2094 = uint(_2092);
    float _2096 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2098 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    int _2100 = _2084;
    float _2102 = as_type<float>(_1976);
    if (!_2076)
    {
        int _2104 = ~_2074;
        int _2106 = _2104 + 1;
        _2100 = _2106;
    }
    int _2108 = _2100;
    float _2110 = -_2096;
    float _2112 = fma(_1162, 2.0, _2110);
    bool _2114 = uint(_2068) >= 2u;
    float _2116 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2118 = -_123;
    float _2120 = fma(_2118, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2112);
    int _2122 = _2114 ? 0 : 1;
    bool _2124 = _2068 != 3;
    float _2126 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2128 = int(_1976) + int(_2094);
    int _2130 = ~_2122;
    int _2132 = _2130 + 1;
    int _2134 = _2132 + 1;
    int _2136 = _2088 * _2128;
    int _2138 = _2136 + _1572;
    float _2140 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2142 = _2134;
    if (_2124)
    {
        int _2144 = ~_2122;
        int _2146 = _2144 + 1;
        _2142 = _2146;
    }
    int _2148 = _2142;
    float _2150 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2152 = uint(_2138) >= uint(_793);
    float _2154 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2156 = !_2152;
    int _2158 = _2156 ? 0 : (-1);
    float _2160 = -_2154;
    float _2162 = fma(_952, 2.0, _2160);
    bool _2164 = _890 > 0.5;
    float _2166 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2168 = _2166 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2170 = -_123;
    float _2172 = fma(_2170, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2162);
    float _2174 = -_213;
    int _2176 = _2164 ? as_type<int>(_2174) : as_type<int>(_213);
    float _2178 = 1.0 / _2168;
    bool _2180 = _902 != 1;
    float _2182 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2184 = in.m_48.x;
    float _2186 = in.m_48.y;
    float _2188 = in.m_48.z;
    int _2190 = abs(_2036);
    float _2192 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _2194 = ~_1904;
    int _2196 = _2194 + _1992;
    int _2198 = _2196 + 1;
    int _2200 = abs(_1796);
    float _2202 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2192);
    float _2204 = 0.0;
    if (!_2180)
    {
        _2204 = _898;
    }
    float _2206 = _2204;
    int _2208 = _729 * _2198;
    int _2210 = _2208 + _1264;
    float _2212 = 0.0;
    float _2214 = _2206;
    if (!_2180)
    {
        _2212 = _898;
    }
    float _2216 = _2212;
    float _2218 = _2216;
    if (!_2180)
    {
        _1964 = _908;
    }
    float _2220 = _1964;
    float _2222 = _2220;
    if (!_2180)
    {
        _1530 = _908;
    }
    float _2224 = _1530;
    float _2226 = _2224;
    if (_2180)
    {
        _2214 = _890;
    }
    float _2228 = _2214;
    if (_2180)
    {
        _2218 = _890;
    }
    float _2230 = _2218;
    if (_2180)
    {
        _2222 = _898;
    }
    float _2232 = _2222;
    float _2234 = _2186 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    if (_2180)
    {
        _2226 = _898;
    }
    float _2236 = _2226;
    float _2238 = _2186 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _2240 = _904 != 2;
    float _2242 = fma(_2184, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2234);
    float _2244 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2246 = _2186 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2248 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2250 = log2(_2248);
    float _2252 = fma(_2184, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2238);
    float _2254 = fma(_2184, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2246);
    float _2256 = _898 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2258 = fma(_2230, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2126);
    float _2260 = fma(_2188, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2252);
    float _2262 = fma(_2256, -2.0, _2244);
    float _2264 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    if (_2240)
    {
        _2102 = _890;
    }
    float _2266 = _2102;
    float _2268 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2258);
    float _2270 = _2266;
    if (_2240)
    {
        _2030 = _898;
    }
    float _2272 = _2030;
    float _2274 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2264);
    float _2276 = _2272;
    if (!_2240)
    {
        _2270 = _908;
    }
    float _2278 = _2270;
    float _2280 = _906 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2282 = _2250 * _123;
    if (!_2240)
    {
        _2276 = _890;
    }
    float _2284 = _2276;
    float _2286 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2262);
    int _2288 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2290 = _2288 != 0;
    float _2292 = fma(_2280, -2.0, _2098);
    float _2294 = exp2(_2282);
    bool _2296 = !_2290;
    float _2298 = _2296 ? _213 : as_type<float>(_2176);
    float _2300 = _2228 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _2302 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2304 = isnan(0.0);
    bool _2306 = _2302 || _2304;
    bool _2308 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2310 = _2306 || _2308;
    float _2312 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2314 = -_2116;
    float _2316 = fma(_2300, 2.0, _2314);
    float _2318 = _2278 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2320 = fma(_2236, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2312);
    float _2322 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2324 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2322;
    float _2326 = _2232 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2328 = -_2140;
    float _2330 = fma(_2318, 2.0, _2328);
    float _2332 = _2324 * _2178;
    float _2334 = -_2294;
    float _2336 = _2334 + 1.0;
    float _2338 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2340 = _2338 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2342 = fma(_2326, -2.0, _2150);
    float _2344 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2346 = _2344 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2348 = _2310 ? _2336 : 0.0;
    float _2350 = 1.0 / _2340;
    bool _2352 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2354 = isnan(1.0);
    bool _2356 = _2352 || _2354;
    bool _2358 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2360 = _2356 || _2358;
    float _2362 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2364 = 1.0 + _2362;
    float _2366 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2368 = _2366 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2370 = _2284 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2372 = 1.0 / _2364;
    float _2374 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2376 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2378 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2380 = fma(_2370, -2.0, _2182);
    float _2382 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2374);
    float _2384 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2376);
    float _2386 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2378);
    float _2388 = 1.0 / _2368;
    float _2390 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2392 = _2390 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2394 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2382);
    float _2396 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2384);
    float _2398 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2202);
    float _2400 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2386);
    float _2402 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2274);
    float _2404 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2292);
    float _2406 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2320);
    float _2408 = -_123;
    float _2410 = fma(_2408, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2316);
    float _2412 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2342);
    float _2414 = -_123;
    float _2416 = fma(_2414, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2330);
    float _2418 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2380);
    if (_2360)
    {
        float _2420 = _2348 * _2372;
        _133 = _2420;
    }
    float _2422 = _133;
    float _2424 = _898 * 2.0;
    bool _2426 = _1250 >= 0.0;
    bool _2428 = isnan(_1250);
    bool _2430 = _2426 || _2428;
    bool _2432 = isnan(0.0);
    bool _2434 = _2430 || _2432;
    float _2436 = 1.0 / _2392;
    float _2438 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2440 = _2438 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _2442 = _2434 ? 0 : 1;
    float _2444 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2446 = _2444 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _2448 = _1250 > 0.0;
    float _2450 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2452 = _2450 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2454 = floor(_2424);
    float _2456 = _2446 * _2388;
    float _2458 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2460 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2458;
    float _2462 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2464 = _2462 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2466 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2468 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2466;
    float _2470 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2472 = _2470 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2474 = fma(_2188, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2254);
    float _2476 = -_2406;
    float _2478 = _2476 + 1.0;
    float _2480 = 1.0 / _2346;
    float _2482 = _2472 * _2350;
    float _2484 = _2468 * _2436;
    int _2486 = ~_2442;
    int _2488 = _2486 + 1;
    int _2490 = _2488 + 1;
    float _2492 = -_2398;
    float _2494 = _2492 + 1.0;
    int _2496 = _2490;
    if (!_2448)
    {
        int _2498 = ~_2442;
        int _2500 = _2498 + 1;
        _2496 = _2500;
    }
    int _2502 = _2496;
    float _2504 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2506 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2504;
    float _2508 = 1.0 / _2440;
    bool _2510 = _2454 >= 0.0;
    bool _2512 = isnan(_2454);
    bool _2514 = _2510 || _2512;
    bool _2516 = isnan(0.0);
    bool _2518 = _2514 || _2516;
    float _2520 = -_2400;
    float _2522 = _2520 + 1.0;
    int _2524 = abs(_2108);
    int _2526 = _2518 ? 0 : 1;
    bool _2528 = _2454 > 0.0;
    float _2530 = 1.0 / _2452;
    float _2532 = _2460 * _2480;
    bool _2534 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2536 = isnan(_711);
    bool _2538 = _2534 || _2536;
    bool _2540 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2542 = _2538 || _2540;
    float _2544 = float(_2542);
    bool _2546 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2548 = isnan(_711);
    bool _2550 = _2546 || _2548;
    bool _2552 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2554 = _2550 || _2552;
    float _2556 = float(_2554);
    int _2558 = ~_2524;
    int _2560 = _2558 + 1;
    int _2562 = _2560 + 1;
    float _2564 = _2464 * _2508;
    int _2566 = ~_1996;
    int _2568 = _2566 + _2062;
    int _2570 = _2568 + 1;
    float _2572 = _908 * 2.0;
    int _2574 = ~_2526;
    int _2576 = _2574 + 1;
    int _2578 = _2576 + 1;
    int _2580 = _2578;
    if (!_2528)
    {
        int _2582 = ~_2526;
        int _2584 = _2582 + 1;
        _2580 = _2584;
    }
    int _2586 = _2580;
    int _2588 = _743 * _2570;
    int _2590 = _2588 + _1340;
    bool _2592 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2594 = isnan(_711);
    bool _2596 = _2592 || _2594;
    bool _2598 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2600 = _2596 || _2598;
    float _2602 = float(_2600);
    float _2604 = _2506 * _2530;
    bool _2606 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2608 = isnan(_711);
    bool _2610 = _2606 || _2608;
    bool _2612 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2614 = _2610 || _2612;
    float _2616 = float(_2614);
    float _2618 = -_2544;
    float _2620 = _2618 + 1.0;
    float _2622 = floor(_2572);
    bool _2624 = !_1280;
    int _2626 = _2624 ? _2590 : (-1);
    float _2628 = _2616 * _2620;
    float _2630 = -_2616;
    float _2632 = _2630 + 1.0;
    float _2634 = -_2556;
    float _2636 = _2634 + 1.0;
    bool _2638 = !_1902;
    int _2640 = _2638 ? 0 : 1;
    int _2642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2644 = _2642 != 0;
    int _2646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2648 = _2646 != 0;
    int _2650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2652 = _2650 != 0;
    float _2654 = _2602 * _2636;
    int _2656 = _1884 >> 31;
    float _2658 = -_2602;
    float _2660 = _2658 + 1.0;
    bool _2662 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2664 = isnan(_711);
    bool _2666 = _2662 || _2664;
    bool _2668 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2670 = _2666 || _2668;
    float _2672 = float(_2670);
    float _2674 = _2556 * _2632;
    int _2676 = _2656 & 3;
    bool _2678 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2680 = isnan(_711);
    bool _2682 = _2678 || _2680;
    bool _2684 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2686 = _2682 || _2684;
    float _2688 = float(_2686);
    float _2690 = -_2672;
    float _2692 = _2690 + 1.0;
    int _2694 = _1884 + _2676;
    float _2696 = _2672 * _2660;
    bool _2698 = _2622 >= 0.0;
    bool _2700 = isnan(_2622);
    bool _2702 = _2698 || _2700;
    bool _2704 = isnan(0.0);
    bool _2706 = _2702 || _2704;
    float _2708 = _2688 * _2692;
    int _2710 = _2694 >> 2;
    float _2712 = -_2688;
    float _2714 = _2712 + 1.0;
    bool _2716 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2718 = isnan(_711);
    bool _2720 = _2716 || _2718;
    bool _2722 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2724 = _2720 || _2722;
    float _2726 = float(_2724);
    float _2728 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2730 = _711 + _2728;
    int _2732 = _2706 ? 0 : 1;
    int _2734 = _2710 << 4;
    int _2736 = _2734 + 656;
    float _2738 = fma(_2332, _2730, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2740 = _2622 > 0.0;
    float _2742 = _2726 * _2714;
    float _2744 = -_2726;
    float _2746 = _2744 + 1.0;
    float _2748 = fma(_2188, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2242);
    bool _2750 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2752 = isnan(_711);
    bool _2754 = _2750 || _2752;
    bool _2756 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2758 = _2754 || _2756;
    float _2760 = float(_2758);
    uint _2762 = uint(int(uint(_2736) >> uint(2)));
    uint _2764 = uint(int(uint(int(_2762)) >> uint(2)));
    int _2766 = int(_2762) & 3;
    float _2768 = (*spvDescriptorSet0.vp_c9)._m0[int(_2764)][_2766];
    int _2770 = int(_2762) + 1;
    uint _2772 = uint(int(uint(_2770) >> uint(2)));
    int _2774 = _2770 & 3;
    float _2776 = (*spvDescriptorSet0.vp_c9)._m0[int(_2772)][_2774];
    float _2778 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2780 = _711 + _2778;
    float _2782 = _2748 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _2784 = abs(_2640);
    float _2786 = _2760 * _2746;
    float _2788 = fma(_2456, _960, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2790 = -_2760;
    float _2792 = _2790 + 1.0;
    float _2794 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2796 = _711 + _2794;
    float _2798 = _2738 * _2786;
    float _2800 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2802 = _711 + _2800;
    float _2804 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2806 = _711 + _2804;
    float _2808 = fma(_2482, _2796, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2810 = fma(_2792, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2798);
    float _2812 = fma(_2484, _2780, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2814 = fma(_2532, _2802, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2816 = _898 + _890;
    int _2818 = _2736 + 8;
    uint _2820 = uint(int(uint(_2818) >> uint(2)));
    uint _2822 = uint(int(uint(int(_2820)) >> uint(2)));
    int _2824 = int(_2820) & 3;
    float _2826 = (*spvDescriptorSet0.vp_c9)._m0[int(_2822)][_2824];
    int _2828 = int(_2820) + 1;
    uint _2830 = uint(int(uint(_2828) >> uint(2)));
    int _2832 = _2828 & 3;
    float _2834 = (*spvDescriptorSet0.vp_c9)._m0[int(_2830)][_2832];
    float _2836 = fma(_2788, _2742, _2810);
    float _2838 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2840 = _711 + _2838;
    int _2842 = ~_2732;
    int _2844 = _2842 + 1;
    int _2846 = _2844 + 1;
    float _2848 = _898 + (-0.5);
    float _2850 = fma(_2812, _2708, _2836);
    float _2852 = fma(_2564, _2840, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2854 = _2260 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2856 = _2846;
    if (!_2740)
    {
        int _2858 = ~_2732;
        int _2860 = _2858 + 1;
        _2856 = _2860;
    }
    int _2862 = _2856;
    float _2864 = _898 + _908;
    float _2866 = fma(_2808, _2696, _2850);
    float _2868 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2870 = _2854 + _2868;
    float _2872 = _2474 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2874 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2876 = _2782 + _2874;
    int _2878 = abs(_1970);
    float _2880 = _2870 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2882 = fma(_2604, _2806, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2884 = _890 + _908;
    int _2886 = ~_2878;
    int _2888 = _2886 + 1;
    int _2890 = _2888 + 1;
    float _2892 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2880);
    bool _2894 = !_1722;
    int _2896 = _2894 ? 0 : 1;
    float _2898 = _890 + (-0.5);
    bool _2900 = _1900 != 3;
    float _2902 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2904 = int(_2902);
    float _2906 = _2816 + (-1.0);
    float _2908 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2910 = _2872 + _2908;
    float _2912 = fma(_2814, _2654, _2866);
    int _2914 = abs(_2048);
    float _2916 = _1706 + 0.5;
    float _2918 = fma(_2906, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2920 = _2890 * as_type<int>(_2776);
    int _2922 = ~_2784;
    int _2924 = _2922 + 1;
    int _2926 = _2924 + 1;
    float _2928 = fma(_2910, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2892);
    bool _2930 = !_2900;
    int _2932 = _2930 ? 0 : (-1);
    float _2934 = fma(_2916, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2120);
    float _2936 = fma(_2852, _2674, _2912);
    int _2938 = _2926 * as_type<int>(_2768);
    int _2940 = _2938 + _2920;
    int _2942 = abs(_2932);
    float _2944 = fma(_2882, _2628, _2936);
    int _2946 = ~_2190;
    int _2948 = _2946 + 1;
    int _2950 = _2948 + 1;
    int _2952 = ~_2942;
    int _2954 = _2952 + 1;
    int _2956 = _2954 + 1;
    float _2958 = fma(_2544, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2944);
    float _2960 = float(uint(_2904));
    int _2962 = _2950 * as_type<int>(_2826);
    int _2964 = _2962 + _2940;
    int _2966 = ~_2914;
    int _2968 = _2966 + 1;
    int _2970 = _2968 + 1;
    float _2972 = _1892 + (-0.5);
    bool _2974 = _2928 >= 0.0;
    int _2976 = _2956 * as_type<int>(_2834);
    int _2978 = _2976 + _2964;
    float _2980 = 1.0 / _2960;
    float _2982 = -_2972;
    float _2984 = -_2404;
    float _2986 = fma(_2982, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2984);
    float _2988 = _2298 + 0.5;
    int _2990 = _2978 * _2970;
    float _2992 = -_2402;
    float _2994 = _2992 + 1.0;
    float _2996 = _1908 + (-0.5);
    float _2998 = fma(_2988, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2172);
    float _3000 = -_1216;
    float _3002 = fma(_3000, _1706, _2934);
    float _3004 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3006 = _2626 * _2914;
    int _3008 = _3006 + _2990;
    float _3010 = fma(_2994, _1892, _2986);
    if (_2974)
    {
        _1736 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3012 = _1736;
    float _3014 = _1682 + 0.5;
    float _3016 = -_2996;
    float _3018 = -_2286;
    float _3020 = fma(_3016, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3018);
    float _3022 = float(uint(_3008));
    float _3024 = _1440 + (-0.5);
    float _3026 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3028 = as_type<int>(_2980) + (-2);
    int _3030 = as_type<int>(_2980);
    if (_2974)
    {
        float _3032 = _3012 * 5.0;
        _3030 = as_type<int>(_3032);
    }
    int _3034 = _3030;
    out.m_70.x = _3002;
    out.m_70.y = _3010;
    bool _3036 = !_2644;
    int _3038 = _3036 ? 0 : 1;
    float _3040 = as_type<float>(_3028) * _3022;
    int _3042 = abs(_2896);
    float _3044 = _3004 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_2974)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9476 = as_type<float>(_3034);
        out.gl_Position.z = _9476;
    }
    float _3046 = trunc(_3040);
    float _3048 = precise::max(_3046, 0.0);
    uint _3050 = uint(_3048);
    int _3052 = abs(_3038);
    float _3054 = fma(_3044, _3014, _2410);
    int _3056 = ~_2904;
    int _3058 = _3056 + 1;
    out.m_72.x = _2958;
    int _3060 = abs(_1958);
    float _3062 = _3026 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3064 = abs(_2904);
    if (_2974)
    {
        out.m_55.x = 0.0;
    }
    float _3066 = -_3062;
    float _3068 = -_2412;
    float _3070 = fma(_3066, _3024, _3068);
    float _3072 = _2870 * _2870;
    int _3074 = _1710 >> 31;
    float _3076 = fma(_1440, _2478, _3070);
    float _3078 = float(uint(_3064));
    float _3080 = fma(_2876, _2876, _3072);
    int _3082 = _2054 >> 31;
    int _3084 = _3058 * int(_3050);
    int _3086 = _3084 + _3008;
    int _3088 = _3074 & 3;
    float _3090 = 1.0 / _3078;
    int _3092 = _3082 & 3;
    int _3094 = _1710 + _3088;
    float _3096 = fma(_2910, _2910, _3080);
    float _3098 = -_2394;
    float _3100 = _3098 + 1.0;
    int _3102 = _2054 + _3092;
    float _3104 = _551 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3106 = rsqrt(_3096);
    float _3108 = -_3100;
    float _3110 = fma(_2298, _3108, _2998);
    int _3112 = abs(_3008);
    float _3114 = _3104 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _3116 = _3094 >> 2;
    int _3118 = _3102 >> 2;
    float _3120 = -_2268;
    float _3122 = _3120 + 1.0;
    int _3124 = as_type<int>(_3090) + (-2);
    float _3126 = -_2396;
    float _3128 = _3126 + 1.0;
    float _3130 = float(uint(_3112));
    float _3132 = -_3122;
    float _3134 = fma(_1682, _3132, _3054);
    float _3136 = float(uint(_3086));
    float _3138 = fma(_1908, _3128, _3020);
    int _3140 = _3116 << 4;
    int _3142 = _3140 + 368;
    float _3144 = as_type<float>(_3124) * _3130;
    int _3146 = _3118 << 4;
    int _3148 = _3146 + 800;
    float _3150 = as_type<float>(_3028) * _3136;
    float _3152 = _3114 * _3106;
    uint _3154 = uint(int(uint(_3142) >> uint(2)));
    uint _3156 = uint(int(uint(int(_3154)) >> uint(2)));
    int _3158 = int(_3154) & 3;
    float _3160 = (*spvDescriptorSet0.vp_c9)._m0[int(_3156)][_3158];
    int _3162 = int(_3154) + 1;
    uint _3164 = uint(int(uint(_3162) >> uint(2)));
    int _3166 = _3162 & 3;
    float _3168 = (*spvDescriptorSet0.vp_c9)._m0[int(_3164)][_3166];
    int _3170 = ~_3064;
    int _3172 = _3170 + 1;
    float _3174 = trunc(_3144);
    float _3176 = precise::max(_3174, 0.0);
    uint _3178 = uint(_3176);
    float _3180 = _2870 * _3152;
    float _3182 = _2876 * _3152;
    out.m_74.x = _3110;
    out.m_74.y = _3138;
    out.m_74.z = _3134;
    out.m_74.w = _3076;
    float _3184 = -_3180;
    float _3186 = _2870 + _3184;
    uint _3188 = uint(int(uint(_3148) >> uint(2)));
    uint _3190 = uint(int(uint(int(_3188)) >> uint(2)));
    int _3192 = int(_3188) & 3;
    float _3194 = (*spvDescriptorSet0.vp_c9)._m0[int(_3190)][_3192];
    int _3196 = int(_3188) + 1;
    uint _3198 = uint(int(uint(_3196) >> uint(2)));
    int _3200 = _3196 & 3;
    float _3202 = (*spvDescriptorSet0.vp_c9)._m0[int(_3198)][_3200];
    float _3204 = -_3182;
    float _3206 = _2876 + _3204;
    float _3208 = float(_2862);
    float _3210 = _3186 * _3186;
    float _3212 = float(_3052);
    float _3214 = trunc(_3150);
    float _3216 = precise::max(_3214, 0.0);
    uint _3218 = uint(_3216);
    int _3220 = ~_2128;
    int _3222 = _3220 + _2158;
    int _3224 = _3222 + 1;
    float _3226 = fma(_3206, _3206, _3210);
    int _3228 = _3142 + 8;
    uint _3230 = uint(int(uint(_3228) >> uint(2)));
    uint _3232 = uint(int(uint(int(_3230)) >> uint(2)));
    int _3234 = int(_3230) & 3;
    float _3236 = (*spvDescriptorSet0.vp_c9)._m0[int(_3232)][_3234];
    int _3238 = int(_3230) + 1;
    uint _3240 = uint(int(uint(_3238) >> uint(2)));
    int _3242 = _3238 & 3;
    float _3244 = (*spvDescriptorSet0.vp_c9)._m0[int(_3240)][_3242];
    float _3246 = _3212 * _3208;
    int _3248 = _3172 * int(_3178);
    int _3250 = _3248 + _3112;
    bool _3252 = _729 == 0;
    int _3254 = _793 * _3224;
    int _3256 = _3254 + _1572;
    float _3258 = _2910 * _3152;
    float _3260 = float(uint(_3250));
    int _3262 = _3148 + 8;
    uint _3264 = uint(int(uint(_3262) >> uint(2)));
    uint _3266 = uint(int(uint(int(_3264)) >> uint(2)));
    int _3268 = int(_3264) & 3;
    float _3270 = (*spvDescriptorSet0.vp_c9)._m0[int(_3266)][_3268];
    int _3272 = int(_3264) + 1;
    uint _3274 = uint(int(uint(_3272) >> uint(2)));
    int _3276 = _3272 & 3;
    float _3278 = (*spvDescriptorSet0.vp_c9)._m0[int(_3274)][_3276];
    int _3280 = ~_2904;
    int _3282 = _3280 + 1;
    float _3284 = -_3258;
    float _3286 = _2910 + _3284;
    int _3288 = ~_2200;
    int _3290 = _3288 + 1;
    int _3292 = _3290 + 1;
    float _3294 = as_type<float>(_3124) * _3260;
    int _3296 = int(_3050) + int(_3218);
    bool _3298 = !_2070;
    int _3300 = _3298 ? 0 : 1;
    float _3302 = trunc(_3294);
    float _3304 = precise::max(_3302, 0.0);
    uint _3306 = uint(_3304);
    bool _3308 = _1720 != 3;
    int _3310 = _3282 * _3296;
    int _3312 = _3310 + _3008;
    int _3314 = ~_3064;
    int _3316 = _3314 + 1;
    bool _3318 = !_3252;
    int _3320 = _3318 ? _2210 : (-1);
    bool _3322 = !_1504;
    int _3324 = _3322 ? _3256 : (-1);
    int _3326 = _3292 * as_type<int>(_3168);
    bool _3328 = !_3308;
    int _3330 = _3328 ? 0 : (-1);
    bool _3332 = uint(_3312) >= uint(_2904);
    int _3334 = int(_3178) + int(_3306);
    bool _3336 = !_3332;
    int _3338 = _3336 ? 0 : (-1);
    int _3340 = _2562 * as_type<int>(_3202);
    int _3342 = abs(_3300);
    int _3344 = _3316 * _3334;
    int _3346 = _3344 + _3112;
    int _3348 = ~_3342;
    int _3350 = _3348 + 1;
    int _3352 = _3350 + 1;
    bool _3354 = _2068 != 3;
    int _3356 = ~_3042;
    int _3358 = _3356 + 1;
    int _3360 = _3358 + 1;
    int _3362 = _3352 * as_type<int>(_3194);
    int _3364 = _3362 + _3340;
    int _3366 = ~_3296;
    int _3368 = _3366 + _3338;
    int _3370 = _3368 + 1;
    bool _3372 = !_3354;
    int _3374 = _3372 ? 0 : (-1);
    int _3376 = _3360 * as_type<int>(_3160);
    int _3378 = _3376 + _3326;
    bool _3380 = uint(_3346) >= uint(_3064);
    int _3382 = _2904 * _3370;
    int _3384 = _3382 + _3008;
    int _3386 = abs(_2148);
    bool _3388 = !_3380;
    int _3390 = _3388 ? 0 : (-1);
    int _3392 = abs(_1876);
    bool _3394 = _2904 == 0;
    int _3396 = ~_3386;
    int _3398 = _3396 + 1;
    int _3400 = _3398 + 1;
    int _3402 = abs(_3330);
    int _3404 = ~_3392;
    int _3406 = _3404 + 1;
    int _3408 = _3406 + 1;
    int _3410 = _3400 * as_type<int>(_3270);
    int _3412 = _3410 + _3364;
    bool _3414 = !_3394;
    int _3416 = _3414 ? _3384 : (-1);
    float _3418 = _1118 + 0.5;
    bool _3420 = _2904 == 0;
    int _3422 = _3408 * as_type<int>(_3236);
    int _3424 = _3422 + _3378;
    int _3426 = _3008 ^ _2904;
    int _3428 = abs(_3374);
    int _3430 = ~_3402;
    int _3432 = _3430 + 1;
    int _3434 = _3432 + 1;
    float _3436 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    uint _3438 = uint(int(uint(_3426) >> uint(31)));
    int _3440 = ~_3428;
    int _3442 = _3440 + 1;
    int _3444 = _3442 + 1;
    int _3446 = _3434 * as_type<int>(_3244);
    int _3448 = _3446 + _3424;
    int _3450 = ~_3390;
    int _3452 = _3334 + _3450;
    int _3454 = _3452 + 1;
    int _3456 = ~int(_3438);
    int _3458 = _3456 + 1;
    float _3460 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3462 = abs(_2058);
    int _3464 = _3444 * as_type<int>(_3278);
    int _3466 = _3464 + _3412;
    int _3468 = _3454 ^ _3458;
    int _3470 = ~_3060;
    int _3472 = _3470 + 1;
    int _3474 = _3472 + 1;
    int _3476 = ~_3458;
    int _3478 = _3476 + _3468;
    int _3480 = _3478 + 1;
    float _3482 = _3436 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3484 = in.m_76.x;
    float _3486 = in.m_76.y;
    float _3488 = in.m_76.z;
    int _3490 = ~_3462;
    int _3492 = _3490 + 1;
    int _3494 = _3492 + 1;
    int _3496 = _3448 * _3474;
    bool _3498 = !_3420;
    int _3500 = _3498 ? _3480 : (-1);
    float _3502 = float(_3416);
    int _3504 = _3466 * _3494;
    float _3506 = float(_3500);
    float _3508 = _3460 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3510 = _3320 * _3060;
    int _3512 = _3510 + _3496;
    float _3514 = fma(_3482, _3502, _2416);
    int _3516 = _3324 * _3462;
    int _3518 = _3516 + _3504;
    float _3520 = -_2418;
    float _3522 = fma(_3508, _3506, _3520);
    float _3524 = _1084 + (-0.5);
    float _3526 = fma(_3482, _3418, _3514);
    float _3528 = _3246 * (-2.0);
    float _3530 = -_3508;
    float _3532 = fma(_3530, _3524, _3522);
    float _3534 = float(_3512);
    float _3536 = -_2494;
    float _3538 = fma(_1118, _3536, _3526);
    float _3540 = float(_3518);
    float _3542 = fma(_1084, _2522, _3532);
    float _3544 = fma(_2918, _3528, _2918);
    out.m_78.x = _3534;
    float _3546 = fma(_3528, _3484, _3484);
    bool _3548 = !_2648;
    int _3550 = _3548 ? 0 : 1;
    out.m_78.w = _3540;
    bool _3552 = !_2652;
    int _3554 = _3552 ? 0 : 1;
    int _3556 = abs(_3550);
    out.m_80.x = _3538;
    out.m_80.y = _3542;
    float _3558 = _3488;
    if (_2974)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3560 = -_3180;
    float _3562 = _2854 + _3560;
    float _3564 = -_3182;
    float _3566 = _2782 + _3564;
    float _3568 = fma(_2898, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3546);
    float _3570 = float(_2502);
    float _3572 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3574 = _3562 + _3572;
    float _3576 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3578 = _3566 + _3576;
    float _3580 = fma(_3544, _2422, _3568);
    float _3582 = float(_3556);
    float _3584 = _3574 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3586 = -_3258;
    float _3588 = _2872 + _3586;
    float _3590 = _2864 + (-1.0);
    float _3592 = float(_2586);
    float _3594 = fma(_3578, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3584);
    float _3596 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3598 = _3588 + _3596;
    float _3600 = _3582 * _3570;
    int _3602 = abs(_3554);
    float _3604 = fma(_3286, _3286, _3226);
    float _3606 = fma(_3598, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3594);
    float _3608 = _3600 * (-2.0);
    float _3610 = _3580 * 0.15915493667125701904296875;
    float _3612 = float(_3602);
    float _3614 = fma(_3590, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3616 = fma(_3608, _3486, _3486);
    bool _3618 = _3606 >= 0.0;
    float _3620 = _2884 + (-1.0);
    float _3622 = fma(_3614, _3608, _3614);
    float _3624 = fma(_2848, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3616);
    float _3626 = _3612 * _3592;
    float _3628 = _908 + (-0.5);
    float _3630 = fma(_3622, _2422, _3624);
    float _3632 = _3626 * (-2.0);
    float _3634 = sqrt(_3604);
    float _3636 = fma(_3620, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3638 = _3630 * 0.15915493667125701904296875;
    float _3640 = fma(_3632, _3488, _3488);
    if (_3618)
    {
        _3558 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3642 = _3558;
    float _3644 = fma(_3636, _3632, _3636);
    int _3646 = as_type<int>(_3642);
    if (_3618)
    {
        out.m_55.x = 0.0;
    }
    float _3648 = fma(_3628, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3640);
    float _3650 = _3638 * 6.283185482025146484375;
    float _3652 = sin(_3650);
    if (_3618)
    {
        float _3654 = _3642 * 5.0;
        _3646 = as_type<int>(_3654);
    }
    int _3656 = _3646;
    float _3658 = fma(_3644, _2422, _3648);
    if (_3618)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10373 = as_type<float>(_3656);
        out.gl_Position.z = _10373;
    }
    float _3660 = _3638 * 6.283185482025146484375;
    float _3662 = cos(_3660);
    float _3664 = _3610 * 6.283185482025146484375;
    float _3666 = sin(_3664);
    float _3668 = _3610 * 6.283185482025146484375;
    float _3670 = cos(_3668);
    float _3672 = _3658 * 0.15915493667125701904296875;
    if (_3618)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3674 = _3672 * 6.283185482025146484375;
    float _3676 = cos(_3674);
    float _3678 = _3106 * _3634;
    float _3680 = _549 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3682 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _217);
    float _3684 = _3670 * _3662;
    float _3686 = _3104 * _3678;
    float _3688 = _3678 * _3680;
    float _3690 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _213);
    float _3692 = _3672 * 6.283185482025146484375;
    float _3694 = sin(_3692);
    float _3696 = _3670 * _3652;
    float _3698 = _3682 * _3688;
    float _3700 = _3666 * _3652;
    float _3702 = _3666 * _3662;
    float _3704 = _3690 * _3686;
    float _3706 = _3670 * _3676;
    float _3708 = _3662 * _3676;
    float _3710 = _3666 * _3676;
    float _3712 = _3652 * _3676;
    float _3714 = _3706 * _3698;
    float _3716 = _3678 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3718 = _3716 * 0.5;
    float _3720 = fma(_3694, _3684, _3700);
    float _3722 = -_3702;
    float _3724 = fma(_3694, _3696, _3722);
    float _3726 = -_3698;
    float _3728 = _3694 * _3726;
    float _3730 = -_3696;
    float _3732 = fma(_3694, _3702, _3730);
    float _3734 = fma(_3720, _3704, _3714);
    float _3736 = _3710 * _3698;
    float _3738 = fma(_3708, _3704, _3728);
    float _3740 = fma(_3694, _3700, _3684);
    float _3742 = fma(_3724, _3718, _3734);
    float _3744 = fma(_3732, _3704, _3736);
    float _3746 = fma(_3712, _3718, _3738);
    float _3748 = _3720 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3750 = _3742 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3752 = _3742 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3754 = fma(_3740, _3718, _3744);
    float _3756 = _3742 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3758 = fma(_3746, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3750);
    float _3760 = fma(_3746, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3752);
    float _3762 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3764 = fma(_3746, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3756);
    float _3766 = fma(_3754, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3758);
    float _3768 = fma(_3754, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3760);
    float _3770 = fma(_3708, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3748);
    float _3772 = fma(_3754, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3764);
    float _3774 = _3766 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3776 = _3768 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3778 = _3720 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3780 = _3772 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3782 = _2782 + _3774;
    float _3784 = _2872 + _3776;
    float _3786 = _3720 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3788 = fma(_3708, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3778);
    float _3790 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3792 = _3782 + _3790;
    float _3794 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3796 = _3784 + _3794;
    float _3798 = fma(_3708, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3786);
    float _3800 = _3706 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3802 = _3792 * _3792;
    float _3804 = _3796 * _3796;
    float _3806 = _3706 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3808 = -_3694;
    float _3810 = fma(_3808, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3800);
    float _3812 = fma(_3762, _3762, 1.0);
    float _3814 = _3802 + _3804;
    float _3816 = _3706 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3818 = _3724 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3820 = _3724 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3822 = sqrt(_3814);
    float _3824 = _3724 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3826 = _2854 + _3780;
    float _3828 = -_3694;
    float _3830 = fma(_3828, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3806);
    float _3832 = -_3694;
    float _3834 = fma(_3832, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3816);
    float _3836 = fma(_3712, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3818);
    float _3838 = fma(_3712, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3820);
    float _3840 = fma(_3712, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3824);
    float _3842 = rsqrt(_3812);
    bool _3844 = _3822 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3846 = _3724;
    float _3848 = _3712;
    float _3850 = _3816;
    float _3852 = _3812;
    float _3854 = _3818;
    if (!_3844)
    {
        _3846 = _3804;
    }
    float _3856 = _3846;
    float _3858 = _3856;
    if (!_3844)
    {
        _3848 = _3802;
    }
    float _3860 = _3848;
    float _3862 = _3860;
    if (!_3844)
    {
        _3850 = _3782;
    }
    float _3864 = _3850;
    float _3866 = _3864;
    if (!_3844)
    {
        _3852 = _3784;
    }
    float _3868 = _3852;
    float _3870 = _3868;
    if (!_3844)
    {
        _3854 = _3826;
    }
    float _3872 = _3854;
    bool _3874 = !_3844;
    float _3876 = _3872;
    if (!_3874)
    {
        float _3878 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3880 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3882 = _3822 + _3880;
        float _3884 = rsqrt(_3814);
        float _3886 = _3882 * _3878;
        float _3888 = _3826 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3890 = _3886 * 0.15915493667125701904296875;
        float _3892 = _3890 * 6.283185482025146484375;
        float _3894 = sin(_3892);
        float _3896 = _3890 * 6.283185482025146484375;
        float _3898 = cos(_3896);
        float _3900 = fma(_3894, _3888, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3902 = _3884 * _3900;
        float _3904 = _3898 + (-1.0);
        float _3906 = fma(_3792, _3902, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3908 = fma(_3796, _3902, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3910 = _3904 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3912 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3914 = _3906 + _3912;
        float _3916 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3918 = _3908 + _3916;
        float _3920 = fma(_3826, _3898, _3910);
        float _3922 = _3914 * _3914;
        float _3924 = _3918 * _3918;
        _3876 = _3920;
        _3862 = _3922;
        _3858 = _3924;
        _3866 = _3906;
        _3870 = _3908;
    }
    float _3926 = _3876;
    float _3928 = _3862;
    float _3930 = _3858;
    float _3932 = _3866;
    float _3934 = _3870;
    float _3936 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3938 = _3926 + _3936;
    float _3940 = fma(_3710, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3810);
    float _3942 = fma(_3710, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3830);
    float _3944 = fma(_3710, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3834);
    float _3946 = fma(_3938, _3938, _3928);
    float _3948 = fma(_3740, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3836);
    float _3950 = fma(_3732, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3788);
    float _3952 = fma(_3740, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3838);
    float _3954 = _3946 + _3930;
    float _3956 = fma(_3740, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3840);
    float _3958 = fma(_3732, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3798);
    float _3960 = _3762 * _3842;
    float _3962 = fma(_3732, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3770);
    float _3964 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3966 = _3762 * _3940;
    float _3968 = _3762 * _3942;
    float _3970 = _3762 * _3944;
    float _3972 = sqrt(_3954);
    float _3974 = -_3948;
    float _3976 = _3960 * _3974;
    float _3978 = -_3952;
    float _3980 = _3960 * _3978;
    float _3982 = -_3956;
    float _3984 = _3960 * _3982;
    float _3986 = fma(_3964, _3950, _3966);
    float _3988 = fma(_3964, _3958, _3968);
    float _3990 = fma(_3964, _3962, _3970);
    float _3992 = fma(_3842, _3942, _3980);
    float _3994 = fma(_3842, _3940, _3976);
    float _3996 = fma(_3842, _3944, _3984);
    float _3998 = _3948 + _3986;
    float _4000 = _3952 + _3988;
    float _4002 = _3956 + _3990;
    out.m_82.x = _3950;
    out.m_82.y = _3958;
    out.m_82.z = _3962;
    bool _4004 = _3972 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4006 = isnan(_3972);
    bool _4008 = _4004 || _4006;
    bool _4010 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4012 = _4008 || _4010;
    out.m_84.x = _3994;
    out.m_84.y = _3992;
    out.m_84.z = _3996;
    out.m_86.x = _3998;
    out.m_86.y = _4000;
    out.m_86.z = _4002;
    float _4014 = _3966;
    float _4016 = _3994;
    if (!_4012)
    {
        _4014 = 1.0;
    }
    float _4018 = _4014;
    bool _4020 = !_4012;
    float _4022 = _4018;
    if (!_4020)
    {
        bool _4024 = _3972 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4026 = isnan(_3972);
        bool _4028 = _4024 || _4026;
        bool _4030 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4032 = _4028 || _4030;
        if (!_4032)
        {
            float _4034 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4036 = _3972 + _4034;
            float _4038 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4040 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4038;
            float _4042 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4044 = _4042 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4046 = 1.0 / _4040;
            float _4048 = _4036 * _4046;
            float _4050 = fma(_4048, _4044, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4022 = _4050;
            _4052 = true;
        }
        else
        {
            bool _4054 = _3972 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4056 = isnan(_3972);
            bool _4058 = _4054 || _4056;
            bool _4060 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4062 = _4058 || _4060;
            if (!_4062)
            {
                float _4064 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4066 = _3972 + _4064;
                float _4068 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4070 = _4068 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4072 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4074 = _4072 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4076 = 1.0 / _4070;
                float _4078 = _4066 * _4076;
                float _4080 = fma(_4078, _4074, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4022 = _4080;
                _4052 = true;
            }
            else
            {
                _4022 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4052 = false;
    float _4082 = _4022;
    float _4084 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4086 = _3926 + _4084;
    float _4088 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4090 = _3932 + _4088;
    float _4092 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4094 = _3934 + _4092;
    float _4096 = fma(_4086, _4082, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4098 = fma(_4090, _4082, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4100 = fma(_4094, _4082, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4102 = -_2854;
    float _4104 = _4102 + _4096;
    float _4106 = -_2782;
    float _4108 = _4106 + _4098;
    float _4110 = -_2872;
    float _4112 = _4110 + _4100;
    float _4114 = _4104 * _4104;
    float _4116 = fma(_4108, _4108, _4114);
    float _4118 = fma(_4112, _4112, _4116);
    float _4120 = sqrt(_4118);
    bool _4122 = _4120 > 0.0;
    float _4124 = _4090;
    float _4126 = _4120;
    float _4128 = _4094;
    float _4130 = _4098;
    if (!_4122)
    {
        _4124 = _4098;
    }
    float _4132 = _4124;
    float _4134 = _4132;
    float _4136 = _4132;
    if (!_4122)
    {
        _4126 = _4096;
    }
    float _4138 = _4126;
    float _4140 = _4138;
    if (!_4122)
    {
        _4128 = _4100;
    }
    float _4142 = _4128;
    bool _4144 = !_4122;
    float _4146 = _4142;
    if (!_4144)
    {
        float _4148 = _207 * _207;
        float _4150 = fma(_205, _205, _4148);
        float _4152 = rsqrt(_4118);
        float _4154 = fma(_209, _209, _4150);
        float _4156 = sqrt(_4154);
        float _4158 = _4108 * _4152;
        float _4160 = _4104 * _4152;
        float _4162 = _4112 * _4152;
        bool _4164 = _4156 > 0.0;
        float _4166 = _4152;
        float _4168 = _4156;
        _4016 = _4158;
        if (!_4164)
        {
            _4134 = _4098;
        }
        float _4170 = _4134;
        _4136 = _4170;
        if (!_4164)
        {
            _4166 = _4096;
        }
        float _4172 = _4166;
        _4140 = _4172;
        if (!_4164)
        {
            _4168 = _4100;
        }
        float _4174 = _4168;
        bool _4176 = !_4164;
        _4146 = _4174;
        if (!_4176)
        {
            float _4178 = rsqrt(_4154);
            float _4180 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4182 = _207 * _4178;
            float _4184 = _205 * _4178;
            float _4186 = _4160 * _4182;
            float _4188 = _209 * _4178;
            float _4190 = fma(_4158, _4184, _4186);
            float _4192 = _4180 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4194 = fma(_4162, _4188, _4190);
            float _4196 = _4194 * _4192;
            float _4198 = fma(_205, _4196, _4098);
            float _4200 = fma(_207, _4196, _4096);
            float _4202 = fma(_209, _4196, _4100);
            _4140 = _4200;
            _4136 = _4198;
            _4146 = _4202;
        }
    }
    float _4204 = _4140;
    float _4206 = _4136;
    float _4208 = _4146;
    float _4210 = _4016;
    float _4212 = -_3180;
    float _4214 = _4212 + _4204;
    float _4216 = -_3182;
    float _4218 = _4216 + _4206;
    float _4220 = -_3258;
    float _4222 = _4220 + _4208;
    float _4224 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4226 = _4214 + _4224;
    float _4228 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4230 = _4218 + _4228;
    float _4232 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4234 = _4222 + _4232;
    float _4236 = _4226 * _4226;
    float _4238 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4240 = fma(_4230, _4230, _4236);
    float _4242 = fma(_4234, _4234, _4240);
    float _4244 = rsqrt(_4242);
    float _4246 = sqrt(_4242);
    float _4248 = _4244 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4250 = _4230 * _4248;
    float _4252 = _4234 * _4248;
    float _4254 = _4250 * _4250;
    float _4256 = _4252 * _4252;
    float _4258 = _4254 + _4256;
    float _4260 = sqrt(_4258);
    bool _4262 = _4260 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4264 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4266 = _4260 + _4264;
    float _4268 = _4234;
    float _4270 = _4258;
    float _4272 = _4266;
    float _4274 = _4210;
    if (_4262)
    {
        float _4276 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4268 = _4276;
    }
    float _4278 = _4268;
    if (_4262)
    {
        float _4280 = rsqrt(_4258);
        _4270 = _4280;
    }
    float _4282 = _4270;
    float _4284 = _4282;
    if (_4262)
    {
        float _4286 = _4266 * _4278;
        _4272 = _4286;
    }
    float _4288 = _4272;
    if (_4262)
    {
        float _4290 = _4288 * 0.15915493667125701904296875;
        _221 = _4290;
    }
    float _4292 = _221;
    float _4294 = _4278;
    if (_4262)
    {
        float _4296 = _4292 * 6.283185482025146484375;
        float _4298 = sin(_4296);
        _4294 = _4298;
    }
    float _4300 = _4294;
    float _4302 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4304 = precise::max(0.0, _4302);
    float _4306 = _4236;
    float _4308 = _4304;
    if (_4262)
    {
        float _4310 = _4292 * 6.283185482025146484375;
        float _4312 = cos(_4310);
        _4306 = _4312;
    }
    float _4314 = _4306;
    float _4316 = -_4248;
    float _4318 = -_4304;
    float _4320 = fma(_4226, _4316, _4318);
    float _4322 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_4262)
    {
        float _4324 = _4320 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4308 = _4324;
    }
    float _4326 = _4308;
    float _4328 = _4214 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4330 = fma(_3566, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4332 = _4326;
    if (!_4262)
    {
        _4322 = _4250;
    }
    float _4334 = _4322;
    float _4336 = _4300;
    float _4338 = _4334;
    if (_4262)
    {
        float _4340 = fma(_4300, _4326, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4336 = _4340;
    }
    float _4342 = _4336;
    float _4344 = fma(_4218, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4328);
    float _4346 = floor(_4330);
    float _4348 = _4342;
    float _4350 = _4314;
    if (_4262)
    {
        float _4352 = _4314 + (-1.0);
        _4332 = _4352;
    }
    float _4354 = _4332;
    float _4356 = _4354;
    if (_4262)
    {
        float _4358 = _4282 * _4342;
        _4274 = _4358;
    }
    float _4360 = _4274;
    if (!_4262)
    {
        _4348 = _4320;
    }
    float _4362 = _4348;
    float _4364 = fma(_4222, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4344);
    float _4366 = _4362;
    if (_4262)
    {
        float _4368 = _4354 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4130 = _4368;
    }
    float _4370 = _4130;
    if (_4262)
    {
        float _4372 = _4250 * _4360;
        _4338 = _4372;
    }
    float _4374 = _4338;
    if (!_4262)
    {
        _4356 = _4252;
    }
    float _4376 = _4356;
    float _4378 = _4376;
    if (_4262)
    {
        float _4380 = _4252 * _4360;
        _4378 = _4380;
    }
    float _4382 = _4378;
    if (!_4262)
    {
        _4284 = _4254;
    }
    float _4384 = _4284;
    float _4386 = _4384;
    if (_4262)
    {
        float _4388 = fma(_4320, _4314, _4370);
        _4366 = _4388;
    }
    float _4390 = _4366;
    if (_4262)
    {
        float _4392 = _4374 * _4374;
        _4386 = _4392;
    }
    float _4394 = _4386;
    if (!_4262)
    {
        _4350 = _4256;
    }
    float _4396 = _4350;
    float _4398 = _4396;
    if (_4262)
    {
        float _4400 = _4382 * _4382;
        _4398 = _4400;
    }
    float _4402 = _4398;
    float _4404 = fma(_4390, _4390, _4394);
    float _4406 = _4214 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4408 = _4214 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4410 = -_4346;
    float _4412 = _4330 + _4410;
    float _4414 = _4404 + _4402;
    float _4416 = _4214 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4418 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4420 = fma(_4246, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4418);
    float _4422 = precise::clamp(_4420, 0.0, 1.0);
    float _4424 = fma(_4218, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4406);
    float _4426 = rsqrt(_4414);
    float _4428 = fma(_4218, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4416);
    float _4430 = _4364 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4432 = -_4422;
    float _4434 = _4432 + 1.0;
    float _4436 = fma(_4218, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4408);
    float _4438 = fma(_4222, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4428);
    float _4440 = fma(_4222, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4424);
    float _4442 = fma(_4222, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4436);
    float _4444 = _4438 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4446 = _4430 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4448 = _4440 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4450 = abs(_4434);
    float _4452 = log2(_4450);
    float _4454 = _4442 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4456 = fma(_4444, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4446);
    float _4458 = _4448 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4460 = _4426 * _4374;
    float _4462 = _4426 * _4390;
    float _4464 = fma(_4448, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4456);
    float _4466 = _4426 * _4382;
    float _4468 = -_4458;
    float _4470 = fma(_4468, _4238, 1.0);
    float _4472 = fma(_3588, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4474 = fma(_4454, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4464);
    float _4476 = _4460 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4478 = _4430 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4480 = floor(_4472);
    float _4482 = -_4476;
    float _4484 = fma(_4462, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4482);
    float _4486 = _4452 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4488 = fma(_4444, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4478);
    float _4490 = -_4466;
    float _4492 = fma(_4490, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4484);
    float _4494 = _4430 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4496 = log2(_4470);
    float _4498 = fma(_4448, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4488);
    float _4500 = fma(_4492, -0.5, 0.5);
    float _4502 = fma(_4492, 0.5, 0.5);
    float _4504 = fma(_4444, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4494);
    float _4506 = _4462 + 1.0;
    float _4508 = fma(_4502, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4510 = exp2(_4486);
    float _4512 = fma(_4448, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4504);
    float _4514 = -_4480;
    float _4516 = _4472 + _4514;
    float _4518 = fma(_4502, _4508, -0.212114393711090087890625);
    float _4520 = fma(_4454, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4512);
    float _4522 = fma(_4502, _4518, 1.570728778839111328125);
    float _4524 = 1.0 / _4474;
    float _4526 = sqrt(_4500);
    float _4528 = -_4462;
    float _4530 = fma(_4510, _4506, _4528);
    float _4532 = fma(_4454, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4498);
    float _4534 = _4496 * 0.693147182464599609375;
    float _4536 = fma(_4530, 0.5, 0.5);
    float _4538 = _4534 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4540 = _4520 * _4524;
    float _4542 = _4532 * _4524;
    float _4544 = fma(_4540, 0.5, 0.5);
    float _4546 = fma(_4542, -0.5, 0.5);
    float _4548 = _4526 * 0.636619746685028076171875;
    float2 _11874 = float2(_4412, _4516);
    float _4550 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11874, float2(0.0), isnan(_11874)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11874, float2(0.0), isnan(_11874)), level(0.0)).x;
    float3 _11885 = float3(_4544, _4546, _4538);
    float _4552 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11885, float3(0.0), isnan(_11885)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11885, float3(0.0), isnan(_11885)), level(0.0)).x;
    float _4554 = -_4522;
    float _4556 = fma(_4548, _4554, 1.0);
    float3 _11901 = float3(_4544, _4546, _4538);
    float4 _4559 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11901, float3(0.0), isnan(_11901)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11901, float3(0.0), isnan(_11901)), level(0.0)).xyzw;
    float _4561 = _4559.x;
    float _4563 = _4559.y;
    float _4565 = _4559.z;
    float _4567 = _4559.w;
    float2 _11917 = float2(_4556, _4536);
    float3 _4571 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11917, float2(0.0), isnan(_11917)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11917, float2(0.0), isnan(_11917)), level(0.0)).xyz;
    float _4573 = _4571.x;
    float _4575 = _4571.y;
    float _4577 = _4571.z;
    float _4579 = _3562 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4581 = _3562 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4583 = _4430 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4585 = in.m_88.x;
    float _4587 = fma(_3566, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4579);
    float _4589 = fma(_3566, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4581);
    float _4591 = fma(_4444, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4583);
    float _4593 = fma(_3588, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4587);
    float _4595 = fma(_3588, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4589);
    float _4597 = _4593 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4599 = _4595 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4601 = 1.0 / _4597;
    float _4603 = _4599 + _4597;
    float _4605 = _4603 * _4601;
    float _4607 = _4605 * 0.5;
    float _4609 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4611 = fma(_4607, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4609);
    float _4613 = 1.0 / _4611;
    float _4615 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4617 = _4613 * _4615;
    float _4619 = abs(_4617);
    float _4621 = log2(_4619);
    bool _4623 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4625 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4627 = _4623 || _4625;
    bool _4629 = isnan(0.5);
    bool _4631 = _4627 || _4629;
    float _4633 = fma(_4448, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4591);
    float _4635 = _4452 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4637 = _4520 + _4474;
    float _4639 = _4474 * 0.5;
    float _4641 = fma(_4454, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4633);
    float _4643 = exp2(_4635);
    float _4645 = _4637 * 0.5;
    float _4647 = fma(_4532, -0.5, _4639);
    float _4649 = _4621 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4651 = exp2(_4649);
    float _4653 = fma(_4651, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4655 = precise::clamp(_4653, 0.0, 1.0);
    bool _4657 = _4617 <= 8000.0;
    bool _4659 = isnan(_4617);
    bool _4661 = _4657 || _4659;
    bool _4663 = isnan(8000.0);
    bool _4665 = _4661 || _4663;
    float _4667 = float(_4665);
    float _4669 = fma(_4655, -2.0, 3.0);
    float _4671 = _4655 * _4655;
    float _4673 = _4671 * _4669;
    float _4675 = -_4673;
    float _4677 = _4675 + 1.0;
    float _4679 = fma(_4677, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4673);
    float _4681 = _4667 * _4679;
    float _4683 = _4641 + _4474;
    float _4685 = _4667;
    float _4687 = _4474;
    float _4689 = _4641;
    float _4691 = _4532;
    if (_4631)
    {
        _4685 = 1.0;
    }
    float _4693 = _4685;
    float _4695 = _4683 * 0.5;
    float _4697 = _4693;
    float _4699 = _4561;
    if (!_4631)
    {
        float _4701 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4703 = _4701 * 0.15915493667125701904296875;
        float _4705 = _4703 * 6.283185482025146484375;
        float _4707 = cos(_4705);
        float _4709 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4711 = _4709 * 0.15915493667125701904296875;
        float _4713 = _4703 * 6.283185482025146484375;
        float _4715 = sin(_4713);
        float _4717 = 1.0 / _4707;
        float _4719 = _4711 * 6.283185482025146484375;
        float _4721 = cos(_4719);
        float _4723 = _4715 * _4717;
        float _4725 = _4711 * 6.283185482025146484375;
        float _4727 = sin(_4725);
        float _4729 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4731 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4729;
        float _4733 = _4721 * _4723;
        float _4735 = 1.0 / _4731;
        float _4737 = 1.0 / _4733;
        float _4739 = _4727 * _4737;
        float _4741 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4743 = fma(_4617, _4739, _4741);
        float _4745 = _4743 * _4735;
        float _4747 = precise::clamp(_4745, 0.0, 1.0);
        _4697 = _4747;
    }
    float _4749 = _4697;
    float _4751 = _4681 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4753 = -_4643;
    float _4755 = _4753 + 1.0;
    float _4757 = -_4550;
    float _4759 = _4757 + 1.0;
    out.gl_Position.x = _4520;
    out.gl_Position.y = _4532;
    out.gl_Position.z = _4641;
    out.gl_Position.w = _4474;
    float _4761 = _4755 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4763 = _4759 * _4751;
    float _4765 = precise::clamp(_4763, 0.0, 1.0);
    bool _4767 = _4246 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4769 = isnan(_4246);
    bool _4771 = _4767 || _4769;
    bool _4773 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4775 = _4771 || _4773;
    out.m_90.x = _4645;
    out.m_90.y = _4647;
    out.m_90.z = _4695;
    out.m_90.w = _4474;
    float _4777 = _4761 * _4552;
    float _4779 = -_4765;
    float _4781 = fma(_4779, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4783 = _4567 * _4777;
    float _4785 = _4781 * _4585;
    float _4787 = _4577 * _4777;
    float _4789 = -_4761;
    float _4791 = _4789 + 1.0;
    float _4793 = _4785 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4795 = _4783;
    float _4797 = _4791;
    if (!_4775)
    {
        _4687 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4799 = _4687;
    float _4801 = fma(_4573, _4783, _4561);
    float _4803 = fma(_4575, _4783, _4563);
    float _4805 = _4567 * _4791;
    float _4807 = fma(_4567, _4787, _4565);
    out.m_92.x = _4793;
    float _4809 = _4749 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4811 = _4799;
    float _4813 = _4799;
    if (!_4775)
    {
        _4795 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4815 = _4795;
    out.m_94.x = _4801;
    out.m_94.y = _4803;
    out.m_94.z = _4807;
    out.m_94.w = _4805;
    float _4817 = _4815;
    float _4819 = _4815;
    if (!_4775)
    {
        _4699 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4821 = _4699;
    float _4823 = _4821;
    float _4825 = _4821;
    if (!_4775)
    {
        _4689 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4827 = _4689;
    float _4829 = _4827;
    float _4831 = _4827;
    if (!_4775)
    {
        _4691 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4833 = _4691;
    float _4835 = _4833;
    float _4837 = _4833;
    if (!_4775)
    {
        _4797 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4839 = _4797;
    bool _4841 = !_4775;
    float _4843 = _4839;
    float _4845 = _4839;
    if (!_4841)
    {
        bool _4847 = _4246 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4849 = isnan(_4246);
        bool _4851 = _4847 || _4849;
        bool _4853 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4855 = _4851 || _4853;
        if (!_4855)
        {
            float _4857 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4859 = _4246 + _4857;
            float _4861 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4863 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4861;
            float _4865 = 1.0 / _4863;
            float _4867 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4869 = _4867 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4871 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4873 = _4871 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4875 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4877 = _4875 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4879 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4881 = _4879 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4883 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4885 = _4883 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4887 = _4859 * _4865;
            float _4889 = precise::clamp(_4887, 0.0, 1.0);
            float _4891 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4893 = _4891 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4895 = fma(_4889, _4873, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4897 = fma(_4889, _4893, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4899 = fma(_4889, _4869, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4901 = fma(_4889, _4877, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4903 = fma(_4889, _4881, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4905 = fma(_4889, _4885, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4837 = _4899;
            _4825 = _4903;
            _4831 = _4897;
            _4819 = _4901;
            _4845 = _4895;
            _4813 = _4905;
            _4907 = true;
        }
        else
        {
            bool _4909 = _4246 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4911 = isnan(_4246);
            bool _4913 = _4909 || _4911;
            bool _4915 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4917 = _4913 || _4915;
            if (!_4917)
            {
                _4817 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4919 = _4817;
            _4819 = _4919;
            if (!_4917)
            {
                _4823 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4921 = _4823;
            _4825 = _4921;
            if (!_4917)
            {
                _4811 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4923 = _4811;
            _4813 = _4923;
            if (!_4917)
            {
                _4829 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4925 = _4829;
            _4831 = _4925;
            if (!_4917)
            {
                _4835 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4927 = _4835;
            _4837 = _4927;
            if (!_4917)
            {
                _4843 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4929 = _4843;
            bool _4931 = !_4917;
            _4845 = _4929;
            if (!_4931)
            {
                bool _4933 = _4246 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4935 = isnan(_4246);
                bool _4937 = _4933 || _4935;
                bool _4939 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4941 = _4937 || _4939;
                if (!_4941)
                {
                    float _4943 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4945 = _4246 + _4943;
                    float _4947 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4949 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4947;
                    float _4951 = 1.0 / _4949;
                    float _4953 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4955 = _4953 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4957 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4959 = _4957 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4961 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4963 = _4961 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4965 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4967 = _4965 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4969 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4971 = _4969 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4973 = _4945 * _4951;
                    float _4975 = precise::clamp(_4973, 0.0, 1.0);
                    float _4977 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4979 = _4977 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4981 = fma(_4975, _4959, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4983 = fma(_4975, _4979, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4985 = fma(_4975, _4955, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4987 = fma(_4975, _4963, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4989 = fma(_4975, _4967, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4991 = fma(_4975, _4971, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4837 = _4985;
                    _4825 = _4989;
                    _4831 = _4983;
                    _4819 = _4987;
                    _4845 = _4981;
                    _4813 = _4991;
                    _4907 = true;
                }
                else
                {
                    _4837 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4825 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4831 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4819 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4845 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4813 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4907 = false;
    float _4993 = _4837;
    float _4995 = _4825;
    float _4997 = _4831;
    float _4999 = _4819;
    float _5001 = _4845;
    float _5003 = _4813;
    float _5005 = fma(_4000, -0.5, 0.5);
    float _5007 = precise::clamp(_5005, 0.0, 1.0);
    float _5009 = -_4993;
    float _5011 = _4995 + _5009;
    float _5013 = _4809 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5015 = -_4997;
    float _5017 = _4999 + _5015;
    float _5019 = fma(_5007, _5011, _4993);
    out.m_96.x = 0.0;
    float _5021 = -_5001;
    float _5023 = _5003 + _5021;
    float _5025 = fma(_5007, _5017, _4997);
    float _5027 = _5019 * 0.586610972881317138671875;
    out.m_55.x = _5013;
    bool _5029 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5031 = fma(_5007, _5023, _5001);
    float _5033 = fma(_5025, 0.298911988735198974609375, _5027);
    bool _5035 = _4749 > 0.0;
    bool _5037 = isnan(_4749);
    bool _5039 = _5035 || _5037;
    bool _5041 = isnan(0.0);
    bool _5043 = _5039 || _5041;
    float _5045 = fma(_5031, 0.114477999508380889892578125, _5033);
    float _5047 = -_5045;
    float _5049 = _5025 + _5047;
    float _5051 = -_5045;
    float _5053 = _5019 + _5051;
    float _5055 = -_5045;
    float _5057 = _5031 + _5055;
    float _5059 = fma(_5049, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5045);
    float _5061 = fma(_5053, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5045);
    float _5063 = fma(_5057, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5045);
    bool _5065 = !_5029;
    if (!_5065)
    {
        float _5067 = -_4214;
        float _5069 = _5067 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5071 = -_4218;
        float _5073 = _5071 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5075 = -_4222;
        float _5077 = _5075 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5079 = _5069 * _5069;
        float _5081 = fma(_5073, _5073, _5079);
        float _5083 = fma(_5077, _5077, _5081);
        float _5085 = sqrt(_5083);
        float _5087 = rsqrt(_5083);
        float _5089 = -_5085;
        float _5091 = _5089 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5093 = _5091 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5095 = precise::clamp(_5093, 0.0, 1.0);
        float _5097 = _5073 * _5087;
        float _5099 = _5069 * _5087;
        float _5101 = abs(_5095);
        float _5103 = log2(_5101);
        float _5105 = _5077 * _5087;
        float _5107 = _5097 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5109 = _4000 * _5099;
        float _5111 = -_5099;
        float _5113 = -_5107;
        float _5115 = fma(_5111, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5113);
        float _5117 = fma(_3998, _5097, _5109);
        float _5119 = -_5105;
        float _5121 = fma(_5119, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5115);
        float _5123 = fma(_4002, _5105, _5117);
        float _5125 = precise::clamp(_5123, 0.0, 1.0);
        float _5127 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5129 = _5121 + _5127;
        float _5131 = _5103 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5133 = _5129 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5135 = precise::clamp(_5133, 0.0, 1.0);
        float _5137 = exp2(_5131);
        float _5139 = _5137 * _5135;
        float _5141 = _5125 * _5139;
        float _5143 = _5141 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5145 = _5141 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5147 = _5141 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _5143;
        out.m_96.y = _5145;
        out.m_96.z = _5147;
    }
    out.m_98.x = _5059;
    out.m_98.y = _5061;
    out.m_98.z = _5063;
    if (_5043)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_55.x = 0.0;
    float _5149 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5149;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4907 = false;
    bool _4052 = false;
    bool _573 = false;
    bool _429 = false;
    bool _241 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_48.w;
    float _114 = in.m_50.w;
    float _116 = trunc(_112);
    int _119 = int(_116);
    float _121 = -_114;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _123;
    bool _127 = _119 >= 1;
    float _129 = 0.0;
    float _131 = as_type<float>(_119);
    float _133 = _123;
    if (!_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _129;
    if (!_127)
    {
        out.m_55.x = 0.0;
    }
    int _137 = 0;
    if (!_127)
    {
        float _139 = _135 * 5.0;
        _137 = as_type<int>(_139);
    }
    int _141 = _137;
    int _143 = _141;
    if (!_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5218 = as_type<float>(_141);
        out.gl_Position.z = _5218;
    }
    if (!_127)
    {
        return out;
    }
    bool _145 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_114);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = float(_119);
    bool _157 = _123 >= _155;
    bool _159 = !_153;
    bool _161 = _157 || _159;
    float _163 = 1.0 / _155;
    if (_161)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _131;
    if (_161)
    {
        out.m_55.x = 0.0;
    }
    float _167 = _123 * _163;
    float _169 = _167;
    if (_161)
    {
        float _171 = _165 * 5.0;
        _143 = as_type<int>(_171);
    }
    int _173 = _143;
    out.m_53.x = _167;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5281 = as_type<float>(_173);
        out.gl_Position.z = _5281;
    }
    if (_161)
    {
        return out;
    }
    float _175 = as_type<float>(int(gl_VertexIndex));
    float _177 = in.m_60.x;
    float _179 = in.m_60.y;
    float _181 = in.m_60.z;
    int _183 = as_type<int>(_175) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_175) & 2;
    bool _189 = _187 != 0;
    bool _191 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _193 = _179 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _195 = _179 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _197 = _179 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _199 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].x, _193);
    float _201 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].x, _195);
    float _203 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].x, _197);
    float _205 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[4].z, _199);
    float _207 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[5].z, _201);
    float _209 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[6].z, _203);
    bool _211 = !_185;
    float _213 = _211 ? (-0.5) : 0.5;
    bool _215 = !_189;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_191;
    float _221 = _207;
    float _239;
    if (!_219)
    {
        float _223 = in.m_62.x;
        float _225 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _227 = _223 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _229 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _231 = _229 * _225;
        float _233 = floor(_231);
        float _235 = -_233;
        float _237 = _231 + _235;
        _239 = _237;
        _241 = true;
    }
    else
    {
        _239 = _167;
    }
    _241 = false;
    float _243 = _239;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _247 = _243 + _245;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _251 = _243 + _249;
    bool _253 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _255 = isnan(_243);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _271 = _269 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _279 = _243 + _277;
    float _281 = 1.0 / _267;
    bool _283 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _285 = 1.0 / _275;
    float _287 = 1.0 / _271;
    float _289 = _247 * _281;
    bool _291 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _293 = isnan(_243);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = -_263;
    float _305 = _303 + 1.0;
    float _307 = _301 * _305;
    float _309 = _251 * _285;
    bool _311 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _313 = isnan(_243);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = -_301;
    float _325 = _323 + 1.0;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _331 = _279 * _287;
    bool _333 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _335 = isnan(_243);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _345;
    float _349 = _321 * _325;
    float _351 = -_321;
    float _353 = _351 + 1.0;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _361 = _359 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _363 = fma(_347, _289, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _365 = _343 * _353;
    float _367 = fma(_357, _289, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _369 = fma(_329, _331, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _371 = fma(_361, _331, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _373 = -_343;
    float _375 = _373 + 1.0;
    float _377 = _363 * _365;
    float _379 = _367 * _365;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _385;
    float _389 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[143].x, _377);
    float _391 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[143].y, _379);
    float _393 = fma(_383, _309, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _395 = fma(_387, _309, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _397 = fma(_369, _349, _389);
    float _399 = fma(_371, _349, _391);
    float _401 = fma(_393, _307, _397);
    float _403 = fma(_395, _307, _399);
    float _405 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[146].x, _401);
    float _407 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[146].y, _403);
    bool _409 = !_283;
    float _427;
    if (!_409)
    {
        float _411 = in.m_62.x;
        float _413 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _415 = _411 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _417 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _419 = _417 * _413;
        float _421 = floor(_419);
        float _423 = -_421;
        float _425 = _419 + _423;
        _427 = _425;
        _429 = true;
    }
    else
    {
        _427 = _167;
    }
    _429 = false;
    float _431 = _427;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _435 = _431 + _433;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _441 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _443 = isnan(_431);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _457 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _459 = isnan(_431);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _465 = _461 || _463;
    float _467 = float(_465);
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _469;
    bool _473 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _475 = isnan(_431);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = 1.0 / _439;
    float _487 = -_451;
    float _489 = _487 + 1.0;
    bool _491 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _493 = 1.0 / _455;
    float _495 = _471 * _485;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _501 = -_483;
    float _503 = _501 + 1.0;
    float _505 = fma(_495, _435, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _507 = _467 * _489;
    float _509 = -_467;
    float _511 = _509 + 1.0;
    float _513 = _451 * _503;
    float _515 = _499 * _493;
    float _517 = _505 * _507;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _521 = _431 + _519;
    float _523 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[115].x, _517);
    float _525 = fma(_515, _521, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _529 = fma(_525, _513, _523);
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _533 = in.m_64.x;
    float _535 = in.m_64.y;
    float _537 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[117].x, _529);
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _541 = _527 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _543 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _545 = _537 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _547 = _539 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_66.x = _541;
    out.m_66.y = _543;
    out.m_66.z = _547;
    out.m_66.w = _545;
    float _549 = _407 * _535;
    float _551 = _405 * _533;
    bool _553 = !_491;
    float _571;
    if (!_553)
    {
        float _555 = in.m_62.x;
        float _557 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _559 = _555 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _561 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[11].w, _123);
        float _563 = _561 * _557;
        float _565 = floor(_563);
        float _567 = -_565;
        float _569 = _563 + _567;
        _571 = _569;
        _573 = true;
    }
    else
    {
        _571 = _167;
    }
    _573 = false;
    float _575 = _571;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _579 = _575 + _577;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _585 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _587 = isnan(_575);
    bool _589 = _585 || _587;
    bool _591 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _593 = _589 || _591;
    float _595 = float(_593);
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _601 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _603 = isnan(_575);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _613;
    bool _617 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _619 = isnan(_575);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = 1.0 / _583;
    float _631 = -_595;
    float _633 = _631 + 1.0;
    bool _635 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _637 = 1.0 / _599;
    float _639 = _615 * _629;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _645 = fma(_639, _579, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _647 = _611 * _633;
    float _649 = -_627;
    float _651 = _649 + 1.0;
    float _653 = -_611;
    float _655 = _653 + 1.0;
    float _657 = _643 * _637;
    float _659 = _645 * _647;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _663 = _575 + _661;
    float _665 = _595 * _651;
    float _667 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[131].x, _659);
    float _669 = fma(_657, _663, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _671 = fma(_669, _665, _667);
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _679 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[133].x, _671);
    float _681 = _673 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _683 = _675 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _685 = _677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _687 = _679 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_68.x = _681;
    out.m_68.y = _683;
    out.m_68.z = _685;
    out.m_68.w = _687;
    bool _689 = !_635;
    float _691 = _665;
    float _693 = _687;
    if (!_689)
    {
        float _695 = in.m_62.x;
        float _697 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _699 = _695 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _701 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[14].x, _123);
        float _703 = _701 * _697;
        float _705 = floor(_703);
        float _707 = -_705;
        float _709 = _703 + _707;
        _169 = _709;
    }
    float _711 = _169;
    float _713 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _715 = int(_713);
    int _717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _719 = _717 != 0;
    float _721 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _723 = int(_721);
    float _725 = float(_715);
    float _727 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _729 = int(_727);
    float _731 = 0.0;
    if (_719)
    {
        _731 = 1.0;
    }
    float _733 = _731;
    float _735 = _733;
    if (_719)
    {
        _691 = 1.0;
    }
    float _737 = _691;
    float _739 = float(_723);
    float _741 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _743 = int(_741);
    float _745 = 1.0 / _739;
    float _747 = float(uint(_729));
    int _749 = ~_729;
    int _751 = _749 + 1;
    float _753 = 1.0 / _725;
    float _755 = float(uint(_743));
    float _757 = _745 * _123;
    float _759 = 1.0 / _747;
    float _761 = _753 * _123;
    float _763 = 1.0 / _755;
    float _765 = _739;
    float _767 = _753;
    float _769 = _737;
    if (_719)
    {
        float _771 = in.m_62.x;
        float _773 = in.m_62.y;
        _765 = _771;
        _767 = _773;
    }
    float _775 = _765;
    float _777 = _767;
    float _779 = trunc(_757);
    int _781 = int(_779);
    int _783 = as_type<int>(_759) + (-2);
    float _785 = trunc(_761);
    int _787 = int(_785);
    int _789 = as_type<int>(_763) + (-2);
    float _791 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _793 = int(_791);
    float _795 = float(uint(_781));
    int _797 = as_type<int>(_795);
    float _799 = _775;
    float _801 = _777;
    if (_719)
    {
        _693 = _777;
    }
    float _803 = _693;
    float _805 = as_type<float>(_783) * _795;
    float _807 = _803;
    if (_719)
    {
        _797 = 0;
    }
    int _809 = _797;
    float _811 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _813 = int(_811);
    float _815 = float(uint(_787));
    float _817 = as_type<float>(_789) * _815;
    float _819 = _815;
    int _821 = _809;
    if (_719)
    {
        _819 = _775;
    }
    float _823 = _819;
    float _825 = trunc(_805);
    float _827 = precise::max(_825, 0.0);
    uint _830 = uint(_827);
    float _832 = float(uint(_793));
    float _834 = 0.0;
    int _836 = as_type<int>(_832);
    float _838 = _823;
    if (_719)
    {
        _834 = _823;
    }
    float _840 = _834;
    float _842 = trunc(_817);
    float _844 = precise::max(_842, 0.0);
    uint _846 = uint(_844);
    float _848 = float(_813);
    float _850 = 1.0 / _848;
    float _852 = 1.0 / _832;
    float _854 = _848;
    float _856 = _840;
    if (_719)
    {
        _854 = _823;
    }
    float _858 = _854;
    float _860 = _858;
    if (_719)
    {
        _836 = 0;
    }
    int _862 = _836;
    int _864 = _862;
    if (!_719)
    {
        float _866 = in.m_62.x;
        float _868 = in.m_62.y;
        float _870 = in.m_62.z;
        float _872 = _866 * 3.1415927410125732421875;
        float _874 = _872 * 0.15915493667125701904296875;
        float _876 = _868 * 3.1415927410125732421875;
        float _878 = _876 * 0.15915493667125701904296875;
        float _880 = _874 * 6.283185482025146484375;
        float _882 = sin(_880);
        float _884 = _878 * 6.283185482025146484375;
        float _886 = sin(_884);
        _735 = 7.345489978790283203125;
        _799 = _866;
        _838 = _868;
        _769 = 5.839270114898681640625;
        _860 = _870;
        _801 = _868;
        _856 = _882;
        _821 = 1;
        _864 = 2;
        _807 = _886;
    }
    float _888 = _735;
    float _890 = _799;
    float _892 = _838;
    float _894 = _769;
    float _896 = _860;
    float _898 = _801;
    float _900 = _856;
    int _902 = _821;
    int _904 = _864;
    float _906 = _807;
    float _908 = in.m_62.z;
    float _910 = in.m_62.w;
    int _912 = ~_743;
    int _914 = _912 + 1;
    int _916 = _751 * int(_830);
    int _918 = _916 + _781;
    float _920 = _850 * _123;
    float _922 = _888 * _890;
    float _924 = _888 * _892;
    int _926 = _914 * int(_846);
    int _928 = _926 + _787;
    float _930 = float(uint(_918));
    float _932 = floor(_922);
    float _934 = _894 * _896;
    float _936 = _163 * _123;
    float _938 = float(uint(_928));
    float _940 = as_type<float>(_783) * _930;
    float _942 = float(_729);
    float _944 = _890 * 2.0;
    float _946 = trunc(_920);
    int _948 = int(_946);
    float _950 = float(_781);
    float _952 = _890 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _956 = _954 != 0;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _960 = _711 + _958;
    bool _962 = _898 > 0.5;
    int _964 = ~_729;
    int _966 = _964 + 1;
    float _968 = trunc(_940);
    float _970 = precise::max(_968, 0.0);
    uint _972 = uint(_970);
    bool _974 = _910 > 0.5;
    float _976 = as_type<float>(_789) * _938;
    float _978 = -_932;
    float _980 = _922 + _978;
    int _982 = as_type<int>(_852) + (-2);
    bool _984 = _908 > 0.5;
    float _986 = floor(_934);
    float _988 = float(uint(_948));
    bool _990 = _950 >= _942;
    bool _992 = isnan(_950);
    bool _994 = _990 || _992;
    bool _996 = isnan(_942);
    bool _998 = _994 || _996;
    float _1000 = float(_998);
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1004 = _1002 != 0;
    int _1006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1008 = _1006 != 0;
    int _1010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1012 = _1010 != 0;
    float _1014 = as_type<float>(_982) * _988;
    float _1016 = -_213;
    int _1018 = _962 ? as_type<int>(_1016) : as_type<int>(_213);
    float _1020 = trunc(_976);
    float _1022 = precise::max(_1020, 0.0);
    uint _1024 = uint(_1022);
    int _1026 = int(_830) + int(_972);
    int _1028 = ~_743;
    int _1030 = _1028 + 1;
    int _1032 = _966 * _1026;
    int _1034 = _1032 + _781;
    int _1036 = int(_974);
    int _1038 = _984 ? 2 : 0;
    int _1040 = _1036 | _1038;
    int _1042 = _956 ? 4 : 0;
    int _1044 = _1040 | _1042;
    int _1046 = _1004 ? 8 : 0;
    int _1048 = _1044 | _1046;
    int _1050 = _1008 ? 16 : 0;
    int _1052 = _1048 | _1050;
    int _1054 = _1012 ? 32 : 0;
    int _1056 = _1052 | _1054;
    int _1058 = _962 ? 64 : 0;
    int _1060 = _1056 | _1058;
    int _1062 = _1060 & 64;
    float _1064 = trunc(_1014);
    float _1066 = precise::max(_1064, 0.0);
    uint _1068 = uint(_1066);
    float _1070 = -_986;
    float _1072 = _934 + _1070;
    float _1074 = -_217;
    int _1076 = _984 ? as_type<int>(_1074) : as_type<int>(_217);
    bool _1078 = !_956;
    int _1080 = _1078 ? 0 : 1;
    bool _1082 = !_1012;
    float _1084 = _1082 ? _217 : as_type<float>(_1076);
    float _1086 = _980 * _942;
    int _1088 = int(_846) + int(_1024);
    float _1090 = floor(_924);
    float _1092 = _942 * _936;
    float _1094 = float(_743);
    float _1096 = float(_787);
    int _1098 = _1030 * _1088;
    int _1100 = _1098 + _787;
    int _1102 = abs(_1080);
    float _1104 = trunc(_1000);
    int _1106 = int(_1104);
    float _1108 = _1072 * _1094;
    int _1110 = _729 + (-1);
    float _1112 = trunc(_1086);
    int _1114 = int(_1112);
    bool _1116 = !_1008;
    float _1118 = _1116 ? _213 : as_type<float>(_1018);
    int _1120 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1122 = _1120 != 0;
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1126 = _1124 != 0;
    int _1128 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1130 = _1128 != 0;
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    bool _1134 = uint(_1034) >= uint(_729);
    int _1136 = ~_793;
    int _1138 = _1136 + 1;
    float _1140 = trunc(_1092);
    int _1142 = int(_1140);
    bool _1144 = !_1126;
    int _1146 = _1144 ? 0 : 1;
    float _1148 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1132);
    bool _1150 = !_1122;
    int _1152 = _1150 ? 0 : 1;
    int _1154 = _1138 * int(_1068);
    int _1156 = _1154 + _948;
    int _1158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1160 = _1158 != 0;
    float _1162 = _900 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _1164 = uint(_1100) >= uint(_743);
    float _1166 = trunc(_1108);
    int _1168 = int(_1166);
    bool _1170 = _1096 >= _1094;
    bool _1172 = isnan(_1096);
    bool _1174 = _1170 || _1172;
    bool _1176 = isnan(_1094);
    bool _1178 = _1174 || _1176;
    float _1180 = float(_1178);
    float _1182 = _1094 * _936;
    bool _1184 = !_1130;
    int _1186 = _1184 ? 0 : 1;
    float _1188 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1148);
    bool _1190 = !_1160;
    int _1192 = _1190 ? 0 : 1;
    bool _1194 = !_1164;
    int _1196 = _1194 ? 0 : (-1);
    float _1198 = trunc(_1180);
    int _1200 = int(_1198);
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1204 = _1202 != 0;
    int _1206 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1208 = _1206 != 0;
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1212 = _1210 != 0;
    float _1214 = -_1188;
    float _1216 = _1214 + 1.0;
    bool _1218 = !_1134;
    int _1220 = _1218 ? 0 : (-1);
    int _1222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1224 = _1222 != 0;
    int _1226 = ~_1026;
    int _1228 = _1226 + _1220;
    int _1230 = _1228 + 1;
    float _1232 = trunc(_1182);
    int _1234 = int(_1232);
    float _1236 = -_1090;
    float _1238 = _924 + _1236;
    float _1240 = float(uint(_1156));
    bool _1242 = !_1208;
    int _1244 = _1242 ? 0 : 1;
    bool _1246 = _1062 != 0;
    float _1248 = as_type<float>(_982) * _1240;
    float _1250 = floor(_944);
    int _1252 = ~_1088;
    int _1254 = _1252 + _1196;
    int _1256 = _1254 + 1;
    bool _1258 = !_1224;
    int _1260 = _1258 ? 0 : 1;
    int _1262 = _1114 * _1102;
    int _1264 = _1262 + _781;
    bool _1266 = _729 == 0;
    int _1268 = _729 * _1230;
    int _1270 = _1268 + _781;
    bool _1272 = !_1204;
    int _1274 = _1272 ? 0 : 1;
    int _1276 = _743 * _1256;
    int _1278 = _1276 + _787;
    bool _1280 = _743 == 0;
    float _1282 = trunc(_1248);
    float _1284 = precise::max(_1282, 0.0);
    uint _1286 = uint(_1284);
    int _1288 = ~_1106;
    int _1290 = _1288 + 1;
    int _1292 = _1290 + 1;
    bool _1294 = !_1266;
    int _1296 = _1294 ? _1270 : (-1);
    int _1298 = ~_1200;
    int _1300 = _1298 + 1;
    int _1302 = _1300 + 1;
    bool _1304 = !_1280;
    int _1306 = _1304 ? _1278 : (-1);
    int _1308 = _1296 * _1292;
    int _1310 = abs(_1146);
    int _1312 = _743 + (-1);
    int _1314 = _1306 * _1302;
    int _1316 = abs(_1244);
    int _1318 = _1106 * _1110;
    int _1320 = _1318 + _1308;
    int _1322 = abs(_1152);
    int _1324 = _1200 * _1312;
    int _1326 = _1324 + _1314;
    int _1328 = _1320 * _1310;
    int _1330 = abs(_1186);
    int _1332 = abs(_1260);
    int _1334 = _1326 * _1316;
    int _1336 = abs(_1192);
    int _1338 = _1168 * _1332;
    int _1340 = _1338 + _787;
    int _1342 = _1142 * _1322;
    int _1344 = _1342 + _1328;
    int _1346 = int(_1068) + int(_1286);
    int _1348 = ~_793;
    int _1350 = _1348 + 1;
    int _1352 = _1264 * _1330;
    int _1354 = _1352 + _1344;
    int _1356 = abs(_1274);
    int _1358 = _1350 * _1346;
    int _1360 = _1358 + _948;
    float _1362 = -_217;
    int _1364 = _974 ? as_type<int>(_1362) : as_type<int>(_217);
    int _1366 = _1114 * _1336;
    int _1368 = _1366 + _1354;
    bool _1370 = uint(_1360) >= uint(_793);
    float _1372 = float(uint(_1368));
    int _1374 = _1234 * _1356;
    int _1376 = _1374 + _1334;
    float _1378 = float(_793);
    float _1380 = -_213;
    int _1382 = _984 ? as_type<int>(_1380) : as_type<int>(_213);
    float _1384 = as_type<float>(_783) * _1372;
    float _1386 = float(_948);
    float _1388 = _1238 * _1378;
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1392 = _1390 != 0;
    float _1394 = trunc(_1384);
    float _1396 = precise::max(_1394, 0.0);
    uint _1398 = uint(_1396);
    bool _1400 = _1386 >= _1378;
    bool _1402 = isnan(_1386);
    bool _1404 = _1400 || _1402;
    bool _1406 = isnan(_1378);
    bool _1408 = _1404 || _1406;
    float _1410 = float(_1408);
    float _1412 = _1378 * _936;
    bool _1414 = !_1212;
    int _1416 = _1414 ? 0 : 1;
    int _1418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1420 = _1418 != 0;
    bool _1422 = !_1392;
    int _1424 = _1422 ? 0 : 1;
    float _1426 = trunc(_1410);
    int _1428 = int(_1426);
    bool _1430 = !_1420;
    int _1432 = _1430 ? 0 : 1;
    int _1434 = abs(_1416);
    int _1436 = abs(_1424);
    bool _1438 = !_1004;
    float _1440 = _1438 ? _217 : as_type<float>(_1364);
    int _1442 = _1340 * _1434;
    int _1444 = _1442 + _1376;
    bool _1446 = !_1370;
    int _1448 = _1446 ? 0 : (-1);
    float _1450 = trunc(_1412);
    int _1452 = int(_1450);
    int _1454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1456 = _1454 != 0;
    int _1458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1460 = _1458 != 0;
    int _1462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1464 = _1462 != 0;
    int _1466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1468 = _1466 != 0;
    int _1470 = ~_1346;
    int _1472 = _1470 + _1448;
    int _1474 = _1472 + 1;
    bool _1476 = !_1460;
    int _1478 = _1476 ? 0 : 1;
    int _1480 = _1168 * _1436;
    int _1482 = _1480 + _1444;
    int _1484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1486 = _1484 != 0;
    int _1488 = _793 * _1474;
    int _1490 = _1488 + _948;
    int _1492 = ~_729;
    int _1494 = _1492 + 1;
    float _1496 = trunc(_1388);
    int _1498 = int(_1496);
    bool _1500 = !_1456;
    int _1502 = _1500 ? 0 : 1;
    bool _1504 = _793 == 0;
    int _1506 = _1494 * int(_1398);
    int _1508 = _1506 + _1368;
    float _1510 = float(uint(_1482));
    int _1512 = ~_1428;
    int _1514 = _1512 + 1;
    int _1516 = _1514 + 1;
    bool _1518 = !_1504;
    int _1520 = _1518 ? _1490 : (-1);
    float _1522 = as_type<float>(_789) * _1510;
    float _1524 = float(uint(_1508));
    float _1526 = _1510;
    float _1528 = as_type<float>(_1368);
    float _1530 = as_type<float>(_1068);
    if (_1486)
    {
        float _1532 = in.m_62.w;
        _1526 = _1532;
    }
    float _1534 = _1526;
    int _1536 = abs(_1478);
    int _1538 = _1520 * _1516;
    int _1540 = _793 + (-1);
    float _1542 = as_type<float>(_783) * _1524;
    float _1544 = trunc(_1522);
    float _1546 = precise::max(_1544, 0.0);
    uint _1548 = uint(_1546);
    int _1550 = abs(_1432);
    int _1552 = abs(_1502);
    int _1554 = _1428 * _1540;
    int _1556 = _1554 + _1538;
    float _1558 = trunc(_1542);
    float _1560 = precise::max(_1558, 0.0);
    uint _1562 = uint(_1560);
    int _1564 = _1556 * _1536;
    int _1566 = ~_743;
    int _1568 = _1566 + 1;
    int _1570 = _1498 * _1550;
    int _1572 = _1570 + _948;
    bool _1574 = _729 == 0;
    int _1576 = _1452 * _1552;
    int _1578 = _1576 + _1564;
    bool _1580 = !_1464;
    int _1582 = _1580 ? 0 : 1;
    int _1584 = ~_729;
    int _1586 = _1584 + 1;
    int _1588 = _1568 * int(_1548);
    int _1590 = _1588 + _1482;
    float _1592 = as_type<float>(_1550);
    if (_1486)
    {
        float _1594 = _1534 * 3.1415927410125732421875;
        _1592 = _1594;
    }
    float _1596 = _1592;
    int _1598 = abs(_1582);
    bool _1600 = !_1468;
    int _1602 = _1600 ? 0 : 1;
    float _1604 = _1596;
    if (_1486)
    {
        float _1606 = _1596 * 0.15915493667125701904296875;
        _1604 = _1606;
    }
    float _1608 = _1604;
    int _1610 = int(_1398) + int(_1562);
    float _1612 = float(uint(_1590));
    int _1614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1616 = _1614 != 0;
    int _1618 = _1586 * _1610;
    int _1620 = _1618 + _1368;
    int _1622 = abs(_1602);
    float _1624 = as_type<float>(_789) * _1612;
    float _1626 = _1608;
    if (_1486)
    {
        float _1628 = _1608 * 6.283185482025146484375;
        float _1630 = sin(_1628);
        _1626 = _1630;
    }
    float _1632 = _1626;
    float _1634 = 0.0;
    if (!_1486)
    {
        _1634 = _213;
    }
    float _1636 = _1634;
    bool _1638 = uint(_1620) >= uint(_729);
    int _1640 = _1572 * _1598;
    int _1642 = _1640 + _1578;
    float _1644 = float(uint(_1264));
    float _1646 = trunc(_1624);
    float _1648 = precise::max(_1646, 0.0);
    uint _1650 = uint(_1648);
    bool _1652 = !_1638;
    int _1654 = _1652 ? 0 : (-1);
    float _1656 = as_type<float>(_1562);
    float _1658 = _1636;
    if (_1616)
    {
        float _1660 = in.m_62.x;
        _1656 = _1660;
    }
    float _1662 = _1656;
    int _1664 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1666 = _1664 != 0;
    float _1668 = as_type<float>(_783) * _1644;
    int _1670 = ~_1610;
    int _1672 = _1670 + _1654;
    int _1674 = _1672 + 1;
    int _1676 = _1498 * _1622;
    int _1678 = _1676 + _1642;
    bool _1680 = !_1666;
    float _1682 = _1680 ? _213 : as_type<float>(_1382);
    bool _1684 = _1666;
    if (_1486)
    {
        bool _1686 = _1632 > 0.5;
        _1684 = _1686;
    }
    bool _1688 = _1684;
    float _1690 = trunc(_1668);
    float _1692 = precise::max(_1690, 0.0);
    uint _1694 = uint(_1692);
    int _1696 = _729 * _1674;
    int _1698 = _1696 + _1368;
    float _1700 = float(uint(_1678));
    if (_1486)
    {
        float _1702 = -_213;
        float _1704 = _1688 ? _1702 : _213;
        _1658 = _1704;
    }
    float _1706 = _1658;
    bool _1708 = !_1574;
    int _1710 = _1708 ? _1698 : (-1);
    int _1712 = int(_1548) + int(_1650);
    float _1714 = as_type<float>(_982) * _1700;
    int _1716 = _1710 & 3;
    bool _1718 = _1716 != 0;
    int _1720 = _1710 & 3;
    bool _1722 = _1720 != 0;
    float _1724 = trunc(_1714);
    float _1726 = precise::max(_1724, 0.0);
    uint _1728 = uint(_1726);
    int _1730 = ~_729;
    int _1732 = _1730 + 1;
    int _1734 = _1718 ? 0 : 1;
    float _1736 = _1706;
    if (_1616)
    {
        float _1738 = _1662 * 3.1415927410125732421875;
        _1528 = _1738;
    }
    float _1740 = _1528;
    bool _1742 = uint(_1720) > 1u;
    int _1744 = _1732 * int(_1694);
    int _1746 = _1744 + _1264;
    float _1748 = float(uint(_1340));
    float _1750 = _1740;
    if (_1616)
    {
        float _1752 = _1740 * 0.15915493667125701904296875;
        _1750 = _1752;
    }
    float _1754 = _1750;
    int _1756 = ~_743;
    int _1758 = _1756 + 1;
    float _1760 = float(uint(_1746));
    float _1762 = as_type<float>(_789) * _1748;
    int _1764 = ~_793;
    int _1766 = _1764 + 1;
    int _1768 = _1758 * _1712;
    int _1770 = _1768 + _1482;
    int _1772 = ~_1734;
    int _1774 = _1772 + 1;
    int _1776 = _1774 + 1;
    float _1778 = as_type<float>(_783) * _1760;
    float _1780 = trunc(_1762);
    float _1782 = precise::max(_1780, 0.0);
    uint _1784 = uint(_1782);
    int _1786 = _1766 * int(_1728);
    int _1788 = _1786 + _1678;
    int _1790 = _1776;
    if (!_1742)
    {
        int _1792 = ~_1734;
        int _1794 = _1792 + 1;
        _1790 = _1794;
    }
    int _1796 = _1790;
    float _1798 = -_217;
    int _1800 = _1246 ? as_type<int>(_1798) : as_type<int>(_217);
    bool _1802 = uint(_1720) >= 2u;
    bool _1804 = uint(_1770) >= uint(_743);
    float _1806 = _1754;
    if (_1616)
    {
        float _1808 = _1754 * 6.283185482025146484375;
        float _1810 = sin(_1808);
        _1806 = _1810;
    }
    float _1812 = _1806;
    float _1814 = float(uint(_1788));
    int _1816 = _1802 ? 0 : 1;
    bool _1818 = _1720 != 3;
    float _1820 = as_type<float>(_982) * _1814;
    bool _1822 = !_1804;
    int _1824 = _1822 ? 0 : (-1);
    float _1826 = trunc(_1778);
    float _1828 = precise::max(_1826, 0.0);
    uint _1830 = uint(_1828);
    int _1832 = ~_743;
    int _1834 = _1832 + 1;
    int _1836 = ~_1712;
    int _1838 = _1836 + _1824;
    int _1840 = _1838 + 1;
    int _1842 = ~_1816;
    int _1844 = _1842 + 1;
    int _1846 = _1844 + 1;
    int _1848 = _1834 * int(_1784);
    int _1850 = _1848 + _1340;
    float _1852 = 0.0;
    int _1854 = _1846;
    bool _1856 = _1818;
    if (!_1616)
    {
        _1852 = _217;
    }
    float _1858 = _1852;
    float _1860 = trunc(_1820);
    float _1862 = precise::max(_1860, 0.0);
    uint _1864 = uint(_1862);
    int _1866 = _743 * _1840;
    int _1868 = _1866 + _1482;
    float _1870 = _1858;
    if (_1818)
    {
        int _1872 = ~_1816;
        int _1874 = _1872 + 1;
        _1854 = _1874;
    }
    int _1876 = _1854;
    if (_1616)
    {
        bool _1878 = _1812 > 0.5;
        _1856 = _1878;
    }
    bool _1880 = _1856;
    bool _1882 = !_1280;
    int _1884 = _1882 ? _1868 : (-1);
    float _1886 = float(uint(_1850));
    if (_1616)
    {
        float _1888 = -_217;
        float _1890 = _1880 ? _1888 : _217;
        _1870 = _1890;
    }
    float _1892 = _1870;
    int _1894 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1896 = _1894 != 0;
    float _1898 = as_type<float>(_789) * _1886;
    int _1900 = _1884 & 3;
    bool _1902 = _1900 != 0;
    int _1904 = int(_1694) + int(_1830);
    bool _1906 = !_1896;
    float _1908 = _1906 ? _217 : as_type<float>(_1800);
    float _1910 = trunc(_1898);
    float _1912 = precise::max(_1910, 0.0);
    uint _1914 = uint(_1912);
    bool _1916 = uint(_1900) > 1u;
    int _1918 = int(_1728) + int(_1864);
    int _1920 = ~_793;
    int _1922 = _1920 + 1;
    int _1924 = _1884 & 3;
    bool _1926 = _1924 != 0;
    int _1928 = ~_729;
    int _1930 = _1928 + 1;
    int _1932 = _1922 * _1918;
    int _1934 = _1932 + _1678;
    int _1936 = _1926 ? 0 : 1;
    float _1938 = float(uint(_1572));
    int _1940 = _1930 * _1904;
    int _1942 = _1940 + _1264;
    int _1944 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1946 = _1944 != 0;
    int _1948 = ~_1936;
    int _1950 = _1948 + 1;
    int _1952 = _1950 + 1;
    float _1954 = as_type<float>(_982) * _1938;
    bool _1956 = !_1946;
    int _1958 = _1956 ? 0 : 1;
    bool _1960 = uint(_1934) >= uint(_793);
    int _1962 = _1952;
    float _1964 = as_type<float>(_1864);
    if (!_1916)
    {
        int _1966 = ~_1936;
        int _1968 = _1966 + 1;
        _1962 = _1968;
    }
    int _1970 = _1962;
    float _1972 = trunc(_1954);
    float _1974 = precise::max(_1972, 0.0);
    uint _1976 = uint(_1974);
    bool _1978 = uint(_1942) >= uint(_729);
    bool _1980 = !_1960;
    int _1982 = _1980 ? 0 : (-1);
    bool _1984 = _1900 != 3;
    int _1986 = ~_743;
    int _1988 = _1986 + 1;
    bool _1990 = !_1978;
    int _1992 = _1990 ? 0 : (-1);
    bool _1994 = uint(_1900) >= 2u;
    int _1996 = int(_1784) + int(_1914);
    int _1998 = ~_1918;
    int _2000 = _1998 + _1982;
    int _2002 = _2000 + 1;
    int _2004 = ~_793;
    int _2006 = _2004 + 1;
    int _2008 = _793 * _2002;
    int _2010 = _2008 + _1678;
    int _2012 = _1994 ? 0 : 1;
    int _2014 = _1988 * _1996;
    int _2016 = _2014 + _1340;
    int _2018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2020 = _2018 != 0;
    int _2022 = ~_2012;
    int _2024 = _2022 + 1;
    int _2026 = _2024 + 1;
    int _2028 = _2026;
    float _2030 = as_type<float>(_2010);
    if (_1984)
    {
        int _2032 = ~_2012;
        int _2034 = _2032 + 1;
        _2028 = _2034;
    }
    int _2036 = _2028;
    int _2038 = _2006 * int(_1976);
    int _2040 = _2038 + _1572;
    int _2042 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2044 = _2042 != 0;
    bool _2046 = !_2020;
    int _2048 = _2046 ? 0 : 1;
    bool _2050 = uint(_2016) >= uint(_743);
    bool _2052 = !_1504;
    int _2054 = _2052 ? _2010 : (-1);
    bool _2056 = !_2044;
    int _2058 = _2056 ? 0 : 1;
    bool _2060 = !_2050;
    int _2062 = _2060 ? 0 : (-1);
    int _2064 = _2054 & 3;
    bool _2066 = _2064 != 0;
    int _2068 = _2054 & 3;
    bool _2070 = _2068 != 0;
    float _2072 = float(uint(_2040));
    int _2074 = _2066 ? 0 : 1;
    bool _2076 = uint(_2068) > 1u;
    float _2078 = as_type<float>(_982) * _2072;
    int _2080 = ~_2074;
    int _2082 = _2080 + 1;
    int _2084 = _2082 + 1;
    int _2086 = ~_793;
    int _2088 = _2086 + 1;
    float _2090 = trunc(_2078);
    float _2092 = precise::max(_2090, 0.0);
    uint _2094 = uint(_2092);
    float _2096 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2098 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    int _2100 = _2084;
    float _2102 = as_type<float>(_1976);
    if (!_2076)
    {
        int _2104 = ~_2074;
        int _2106 = _2104 + 1;
        _2100 = _2106;
    }
    int _2108 = _2100;
    float _2110 = -_2096;
    float _2112 = fma(_1162, 2.0, _2110);
    bool _2114 = uint(_2068) >= 2u;
    float _2116 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2118 = -_123;
    float _2120 = fma(_2118, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2112);
    int _2122 = _2114 ? 0 : 1;
    bool _2124 = _2068 != 3;
    float _2126 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2128 = int(_1976) + int(_2094);
    int _2130 = ~_2122;
    int _2132 = _2130 + 1;
    int _2134 = _2132 + 1;
    int _2136 = _2088 * _2128;
    int _2138 = _2136 + _1572;
    float _2140 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2142 = _2134;
    if (_2124)
    {
        int _2144 = ~_2122;
        int _2146 = _2144 + 1;
        _2142 = _2146;
    }
    int _2148 = _2142;
    float _2150 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2152 = uint(_2138) >= uint(_793);
    float _2154 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2156 = !_2152;
    int _2158 = _2156 ? 0 : (-1);
    float _2160 = -_2154;
    float _2162 = fma(_952, 2.0, _2160);
    bool _2164 = _890 > 0.5;
    float _2166 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2168 = _2166 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2170 = -_123;
    float _2172 = fma(_2170, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2162);
    float _2174 = -_213;
    int _2176 = _2164 ? as_type<int>(_2174) : as_type<int>(_213);
    float _2178 = 1.0 / _2168;
    bool _2180 = _902 != 1;
    float _2182 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2184 = in.m_48.x;
    float _2186 = in.m_48.y;
    float _2188 = in.m_48.z;
    int _2190 = abs(_2036);
    float _2192 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _2194 = ~_1904;
    int _2196 = _2194 + _1992;
    int _2198 = _2196 + 1;
    int _2200 = abs(_1796);
    float _2202 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2192);
    float _2204 = 0.0;
    if (!_2180)
    {
        _2204 = _898;
    }
    float _2206 = _2204;
    int _2208 = _729 * _2198;
    int _2210 = _2208 + _1264;
    float _2212 = 0.0;
    float _2214 = _2206;
    if (!_2180)
    {
        _2212 = _898;
    }
    float _2216 = _2212;
    float _2218 = _2216;
    if (!_2180)
    {
        _1964 = _908;
    }
    float _2220 = _1964;
    float _2222 = _2220;
    if (!_2180)
    {
        _1530 = _908;
    }
    float _2224 = _1530;
    float _2226 = _2224;
    if (_2180)
    {
        _2214 = _890;
    }
    float _2228 = _2214;
    if (_2180)
    {
        _2218 = _890;
    }
    float _2230 = _2218;
    if (_2180)
    {
        _2222 = _898;
    }
    float _2232 = _2222;
    float _2234 = _2186 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    if (_2180)
    {
        _2226 = _898;
    }
    float _2236 = _2226;
    float _2238 = _2186 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _2240 = _904 != 2;
    float _2242 = fma(_2184, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2234);
    float _2244 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2246 = _2186 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2248 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2250 = log2(_2248);
    float _2252 = fma(_2184, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2238);
    float _2254 = fma(_2184, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2246);
    float _2256 = _898 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2258 = fma(_2230, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2126);
    float _2260 = fma(_2188, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2252);
    float _2262 = fma(_2256, -2.0, _2244);
    float _2264 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    if (_2240)
    {
        _2102 = _890;
    }
    float _2266 = _2102;
    float _2268 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2258);
    float _2270 = _2266;
    if (_2240)
    {
        _2030 = _898;
    }
    float _2272 = _2030;
    float _2274 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2264);
    float _2276 = _2272;
    if (!_2240)
    {
        _2270 = _908;
    }
    float _2278 = _2270;
    float _2280 = _906 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2282 = _2250 * _123;
    if (!_2240)
    {
        _2276 = _890;
    }
    float _2284 = _2276;
    float _2286 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2262);
    int _2288 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2290 = _2288 != 0;
    float _2292 = fma(_2280, -2.0, _2098);
    float _2294 = exp2(_2282);
    bool _2296 = !_2290;
    float _2298 = _2296 ? _213 : as_type<float>(_2176);
    float _2300 = _2228 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _2302 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2304 = isnan(0.0);
    bool _2306 = _2302 || _2304;
    bool _2308 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2310 = _2306 || _2308;
    float _2312 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2314 = -_2116;
    float _2316 = fma(_2300, 2.0, _2314);
    float _2318 = _2278 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2320 = fma(_2236, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2312);
    float _2322 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2324 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2322;
    float _2326 = _2232 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2328 = -_2140;
    float _2330 = fma(_2318, 2.0, _2328);
    float _2332 = _2324 * _2178;
    float _2334 = -_2294;
    float _2336 = _2334 + 1.0;
    float _2338 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2340 = _2338 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2342 = fma(_2326, -2.0, _2150);
    float _2344 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2346 = _2344 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2348 = _2310 ? _2336 : 0.0;
    float _2350 = 1.0 / _2340;
    bool _2352 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2354 = isnan(1.0);
    bool _2356 = _2352 || _2354;
    bool _2358 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2360 = _2356 || _2358;
    float _2362 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2364 = 1.0 + _2362;
    float _2366 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2368 = _2366 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2370 = _2284 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2372 = 1.0 / _2364;
    float _2374 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2376 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2378 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2380 = fma(_2370, -2.0, _2182);
    float _2382 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2374);
    float _2384 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2376);
    float _2386 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2378);
    float _2388 = 1.0 / _2368;
    float _2390 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2392 = _2390 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2394 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2382);
    float _2396 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2384);
    float _2398 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2202);
    float _2400 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2386);
    float _2402 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2274);
    float _2404 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2292);
    float _2406 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2320);
    float _2408 = -_123;
    float _2410 = fma(_2408, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2316);
    float _2412 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2342);
    float _2414 = -_123;
    float _2416 = fma(_2414, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2330);
    float _2418 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2380);
    if (_2360)
    {
        float _2420 = _2348 * _2372;
        _133 = _2420;
    }
    float _2422 = _133;
    float _2424 = _898 * 2.0;
    bool _2426 = _1250 >= 0.0;
    bool _2428 = isnan(_1250);
    bool _2430 = _2426 || _2428;
    bool _2432 = isnan(0.0);
    bool _2434 = _2430 || _2432;
    float _2436 = 1.0 / _2392;
    float _2438 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2440 = _2438 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _2442 = _2434 ? 0 : 1;
    float _2444 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2446 = _2444 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _2448 = _1250 > 0.0;
    float _2450 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2452 = _2450 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2454 = floor(_2424);
    float _2456 = _2446 * _2388;
    float _2458 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2460 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2458;
    float _2462 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2464 = _2462 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2466 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2468 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2466;
    float _2470 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2472 = _2470 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2474 = fma(_2188, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2254);
    float _2476 = -_2406;
    float _2478 = _2476 + 1.0;
    float _2480 = 1.0 / _2346;
    float _2482 = _2472 * _2350;
    float _2484 = _2468 * _2436;
    int _2486 = ~_2442;
    int _2488 = _2486 + 1;
    int _2490 = _2488 + 1;
    float _2492 = -_2398;
    float _2494 = _2492 + 1.0;
    int _2496 = _2490;
    if (!_2448)
    {
        int _2498 = ~_2442;
        int _2500 = _2498 + 1;
        _2496 = _2500;
    }
    int _2502 = _2496;
    float _2504 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2506 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2504;
    float _2508 = 1.0 / _2440;
    bool _2510 = _2454 >= 0.0;
    bool _2512 = isnan(_2454);
    bool _2514 = _2510 || _2512;
    bool _2516 = isnan(0.0);
    bool _2518 = _2514 || _2516;
    float _2520 = -_2400;
    float _2522 = _2520 + 1.0;
    int _2524 = abs(_2108);
    int _2526 = _2518 ? 0 : 1;
    bool _2528 = _2454 > 0.0;
    float _2530 = 1.0 / _2452;
    float _2532 = _2460 * _2480;
    bool _2534 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2536 = isnan(_711);
    bool _2538 = _2534 || _2536;
    bool _2540 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2542 = _2538 || _2540;
    float _2544 = float(_2542);
    bool _2546 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2548 = isnan(_711);
    bool _2550 = _2546 || _2548;
    bool _2552 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2554 = _2550 || _2552;
    float _2556 = float(_2554);
    int _2558 = ~_2524;
    int _2560 = _2558 + 1;
    int _2562 = _2560 + 1;
    float _2564 = _2464 * _2508;
    int _2566 = ~_1996;
    int _2568 = _2566 + _2062;
    int _2570 = _2568 + 1;
    float _2572 = _908 * 2.0;
    int _2574 = ~_2526;
    int _2576 = _2574 + 1;
    int _2578 = _2576 + 1;
    int _2580 = _2578;
    if (!_2528)
    {
        int _2582 = ~_2526;
        int _2584 = _2582 + 1;
        _2580 = _2584;
    }
    int _2586 = _2580;
    int _2588 = _743 * _2570;
    int _2590 = _2588 + _1340;
    bool _2592 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2594 = isnan(_711);
    bool _2596 = _2592 || _2594;
    bool _2598 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2600 = _2596 || _2598;
    float _2602 = float(_2600);
    float _2604 = _2506 * _2530;
    bool _2606 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2608 = isnan(_711);
    bool _2610 = _2606 || _2608;
    bool _2612 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2614 = _2610 || _2612;
    float _2616 = float(_2614);
    float _2618 = -_2544;
    float _2620 = _2618 + 1.0;
    float _2622 = floor(_2572);
    bool _2624 = !_1280;
    int _2626 = _2624 ? _2590 : (-1);
    float _2628 = _2616 * _2620;
    float _2630 = -_2616;
    float _2632 = _2630 + 1.0;
    float _2634 = -_2556;
    float _2636 = _2634 + 1.0;
    bool _2638 = !_1902;
    int _2640 = _2638 ? 0 : 1;
    int _2642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2644 = _2642 != 0;
    int _2646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2648 = _2646 != 0;
    int _2650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2652 = _2650 != 0;
    float _2654 = _2602 * _2636;
    int _2656 = _1884 >> 31;
    float _2658 = -_2602;
    float _2660 = _2658 + 1.0;
    bool _2662 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2664 = isnan(_711);
    bool _2666 = _2662 || _2664;
    bool _2668 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2670 = _2666 || _2668;
    float _2672 = float(_2670);
    float _2674 = _2556 * _2632;
    int _2676 = _2656 & 3;
    bool _2678 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2680 = isnan(_711);
    bool _2682 = _2678 || _2680;
    bool _2684 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2686 = _2682 || _2684;
    float _2688 = float(_2686);
    float _2690 = -_2672;
    float _2692 = _2690 + 1.0;
    int _2694 = _1884 + _2676;
    float _2696 = _2672 * _2660;
    bool _2698 = _2622 >= 0.0;
    bool _2700 = isnan(_2622);
    bool _2702 = _2698 || _2700;
    bool _2704 = isnan(0.0);
    bool _2706 = _2702 || _2704;
    float _2708 = _2688 * _2692;
    int _2710 = _2694 >> 2;
    float _2712 = -_2688;
    float _2714 = _2712 + 1.0;
    bool _2716 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2718 = isnan(_711);
    bool _2720 = _2716 || _2718;
    bool _2722 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2724 = _2720 || _2722;
    float _2726 = float(_2724);
    float _2728 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2730 = _711 + _2728;
    int _2732 = _2706 ? 0 : 1;
    int _2734 = _2710 << 4;
    int _2736 = _2734 + 656;
    float _2738 = fma(_2332, _2730, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2740 = _2622 > 0.0;
    float _2742 = _2726 * _2714;
    float _2744 = -_2726;
    float _2746 = _2744 + 1.0;
    float _2748 = fma(_2188, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2242);
    bool _2750 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2752 = isnan(_711);
    bool _2754 = _2750 || _2752;
    bool _2756 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2758 = _2754 || _2756;
    float _2760 = float(_2758);
    uint _2762 = uint(int(uint(_2736) >> uint(2)));
    uint _2764 = uint(int(uint(int(_2762)) >> uint(2)));
    int _2766 = int(_2762) & 3;
    float _2768 = (*spvDescriptorSet0.vp_c9)._m0[int(_2764)][_2766];
    int _2770 = int(_2762) + 1;
    uint _2772 = uint(int(uint(_2770) >> uint(2)));
    int _2774 = _2770 & 3;
    float _2776 = (*spvDescriptorSet0.vp_c9)._m0[int(_2772)][_2774];
    float _2778 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2780 = _711 + _2778;
    float _2782 = _2748 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _2784 = abs(_2640);
    float _2786 = _2760 * _2746;
    float _2788 = fma(_2456, _960, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2790 = -_2760;
    float _2792 = _2790 + 1.0;
    float _2794 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2796 = _711 + _2794;
    float _2798 = _2738 * _2786;
    float _2800 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2802 = _711 + _2800;
    float _2804 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2806 = _711 + _2804;
    float _2808 = fma(_2482, _2796, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2810 = fma(_2792, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2798);
    float _2812 = fma(_2484, _2780, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2814 = fma(_2532, _2802, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2816 = _898 + _890;
    int _2818 = _2736 + 8;
    uint _2820 = uint(int(uint(_2818) >> uint(2)));
    uint _2822 = uint(int(uint(int(_2820)) >> uint(2)));
    int _2824 = int(_2820) & 3;
    float _2826 = (*spvDescriptorSet0.vp_c9)._m0[int(_2822)][_2824];
    int _2828 = int(_2820) + 1;
    uint _2830 = uint(int(uint(_2828) >> uint(2)));
    int _2832 = _2828 & 3;
    float _2834 = (*spvDescriptorSet0.vp_c9)._m0[int(_2830)][_2832];
    float _2836 = fma(_2788, _2742, _2810);
    float _2838 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2840 = _711 + _2838;
    int _2842 = ~_2732;
    int _2844 = _2842 + 1;
    int _2846 = _2844 + 1;
    float _2848 = _898 + (-0.5);
    float _2850 = fma(_2812, _2708, _2836);
    float _2852 = fma(_2564, _2840, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2854 = _2260 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2856 = _2846;
    if (!_2740)
    {
        int _2858 = ~_2732;
        int _2860 = _2858 + 1;
        _2856 = _2860;
    }
    int _2862 = _2856;
    float _2864 = _898 + _908;
    float _2866 = fma(_2808, _2696, _2850);
    float _2868 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2870 = _2854 + _2868;
    float _2872 = _2474 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2874 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2876 = _2782 + _2874;
    int _2878 = abs(_1970);
    float _2880 = _2870 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2882 = fma(_2604, _2806, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2884 = _890 + _908;
    int _2886 = ~_2878;
    int _2888 = _2886 + 1;
    int _2890 = _2888 + 1;
    float _2892 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2880);
    bool _2894 = !_1722;
    int _2896 = _2894 ? 0 : 1;
    float _2898 = _890 + (-0.5);
    bool _2900 = _1900 != 3;
    float _2902 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2904 = int(_2902);
    float _2906 = _2816 + (-1.0);
    float _2908 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2910 = _2872 + _2908;
    float _2912 = fma(_2814, _2654, _2866);
    int _2914 = abs(_2048);
    float _2916 = _1706 + 0.5;
    float _2918 = fma(_2906, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2920 = _2890 * as_type<int>(_2776);
    int _2922 = ~_2784;
    int _2924 = _2922 + 1;
    int _2926 = _2924 + 1;
    float _2928 = fma(_2910, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2892);
    bool _2930 = !_2900;
    int _2932 = _2930 ? 0 : (-1);
    float _2934 = fma(_2916, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2120);
    float _2936 = fma(_2852, _2674, _2912);
    int _2938 = _2926 * as_type<int>(_2768);
    int _2940 = _2938 + _2920;
    int _2942 = abs(_2932);
    float _2944 = fma(_2882, _2628, _2936);
    int _2946 = ~_2190;
    int _2948 = _2946 + 1;
    int _2950 = _2948 + 1;
    int _2952 = ~_2942;
    int _2954 = _2952 + 1;
    int _2956 = _2954 + 1;
    float _2958 = fma(_2544, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2944);
    float _2960 = float(uint(_2904));
    int _2962 = _2950 * as_type<int>(_2826);
    int _2964 = _2962 + _2940;
    int _2966 = ~_2914;
    int _2968 = _2966 + 1;
    int _2970 = _2968 + 1;
    float _2972 = _1892 + (-0.5);
    bool _2974 = _2928 >= 0.0;
    int _2976 = _2956 * as_type<int>(_2834);
    int _2978 = _2976 + _2964;
    float _2980 = 1.0 / _2960;
    float _2982 = -_2972;
    float _2984 = -_2404;
    float _2986 = fma(_2982, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2984);
    float _2988 = _2298 + 0.5;
    int _2990 = _2978 * _2970;
    float _2992 = -_2402;
    float _2994 = _2992 + 1.0;
    float _2996 = _1908 + (-0.5);
    float _2998 = fma(_2988, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2172);
    float _3000 = -_1216;
    float _3002 = fma(_3000, _1706, _2934);
    float _3004 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3006 = _2626 * _2914;
    int _3008 = _3006 + _2990;
    float _3010 = fma(_2994, _1892, _2986);
    if (_2974)
    {
        _1736 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3012 = _1736;
    float _3014 = _1682 + 0.5;
    float _3016 = -_2996;
    float _3018 = -_2286;
    float _3020 = fma(_3016, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3018);
    float _3022 = float(uint(_3008));
    float _3024 = _1440 + (-0.5);
    float _3026 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3028 = as_type<int>(_2980) + (-2);
    int _3030 = as_type<int>(_2980);
    if (_2974)
    {
        float _3032 = _3012 * 5.0;
        _3030 = as_type<int>(_3032);
    }
    int _3034 = _3030;
    out.m_70.x = _3002;
    out.m_70.y = _3010;
    bool _3036 = !_2644;
    int _3038 = _3036 ? 0 : 1;
    float _3040 = as_type<float>(_3028) * _3022;
    int _3042 = abs(_2896);
    float _3044 = _3004 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_2974)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9476 = as_type<float>(_3034);
        out.gl_Position.z = _9476;
    }
    float _3046 = trunc(_3040);
    float _3048 = precise::max(_3046, 0.0);
    uint _3050 = uint(_3048);
    int _3052 = abs(_3038);
    float _3054 = fma(_3044, _3014, _2410);
    int _3056 = ~_2904;
    int _3058 = _3056 + 1;
    out.m_72.x = _2958;
    int _3060 = abs(_1958);
    float _3062 = _3026 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3064 = abs(_2904);
    if (_2974)
    {
        out.m_55.x = 0.0;
    }
    float _3066 = -_3062;
    float _3068 = -_2412;
    float _3070 = fma(_3066, _3024, _3068);
    float _3072 = _2870 * _2870;
    int _3074 = _1710 >> 31;
    float _3076 = fma(_1440, _2478, _3070);
    float _3078 = float(uint(_3064));
    float _3080 = fma(_2876, _2876, _3072);
    int _3082 = _2054 >> 31;
    int _3084 = _3058 * int(_3050);
    int _3086 = _3084 + _3008;
    int _3088 = _3074 & 3;
    float _3090 = 1.0 / _3078;
    int _3092 = _3082 & 3;
    int _3094 = _1710 + _3088;
    float _3096 = fma(_2910, _2910, _3080);
    float _3098 = -_2394;
    float _3100 = _3098 + 1.0;
    int _3102 = _2054 + _3092;
    float _3104 = _551 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3106 = rsqrt(_3096);
    float _3108 = -_3100;
    float _3110 = fma(_2298, _3108, _2998);
    int _3112 = abs(_3008);
    float _3114 = _3104 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _3116 = _3094 >> 2;
    int _3118 = _3102 >> 2;
    float _3120 = -_2268;
    float _3122 = _3120 + 1.0;
    int _3124 = as_type<int>(_3090) + (-2);
    float _3126 = -_2396;
    float _3128 = _3126 + 1.0;
    float _3130 = float(uint(_3112));
    float _3132 = -_3122;
    float _3134 = fma(_1682, _3132, _3054);
    float _3136 = float(uint(_3086));
    float _3138 = fma(_1908, _3128, _3020);
    int _3140 = _3116 << 4;
    int _3142 = _3140 + 368;
    float _3144 = as_type<float>(_3124) * _3130;
    int _3146 = _3118 << 4;
    int _3148 = _3146 + 800;
    float _3150 = as_type<float>(_3028) * _3136;
    float _3152 = _3114 * _3106;
    uint _3154 = uint(int(uint(_3142) >> uint(2)));
    uint _3156 = uint(int(uint(int(_3154)) >> uint(2)));
    int _3158 = int(_3154) & 3;
    float _3160 = (*spvDescriptorSet0.vp_c9)._m0[int(_3156)][_3158];
    int _3162 = int(_3154) + 1;
    uint _3164 = uint(int(uint(_3162) >> uint(2)));
    int _3166 = _3162 & 3;
    float _3168 = (*spvDescriptorSet0.vp_c9)._m0[int(_3164)][_3166];
    int _3170 = ~_3064;
    int _3172 = _3170 + 1;
    float _3174 = trunc(_3144);
    float _3176 = precise::max(_3174, 0.0);
    uint _3178 = uint(_3176);
    float _3180 = _2870 * _3152;
    float _3182 = _2876 * _3152;
    out.m_74.x = _3110;
    out.m_74.y = _3138;
    out.m_74.z = _3134;
    out.m_74.w = _3076;
    float _3184 = -_3180;
    float _3186 = _2870 + _3184;
    uint _3188 = uint(int(uint(_3148) >> uint(2)));
    uint _3190 = uint(int(uint(int(_3188)) >> uint(2)));
    int _3192 = int(_3188) & 3;
    float _3194 = (*spvDescriptorSet0.vp_c9)._m0[int(_3190)][_3192];
    int _3196 = int(_3188) + 1;
    uint _3198 = uint(int(uint(_3196) >> uint(2)));
    int _3200 = _3196 & 3;
    float _3202 = (*spvDescriptorSet0.vp_c9)._m0[int(_3198)][_3200];
    float _3204 = -_3182;
    float _3206 = _2876 + _3204;
    float _3208 = float(_2862);
    float _3210 = _3186 * _3186;
    float _3212 = float(_3052);
    float _3214 = trunc(_3150);
    float _3216 = precise::max(_3214, 0.0);
    uint _3218 = uint(_3216);
    int _3220 = ~_2128;
    int _3222 = _3220 + _2158;
    int _3224 = _3222 + 1;
    float _3226 = fma(_3206, _3206, _3210);
    int _3228 = _3142 + 8;
    uint _3230 = uint(int(uint(_3228) >> uint(2)));
    uint _3232 = uint(int(uint(int(_3230)) >> uint(2)));
    int _3234 = int(_3230) & 3;
    float _3236 = (*spvDescriptorSet0.vp_c9)._m0[int(_3232)][_3234];
    int _3238 = int(_3230) + 1;
    uint _3240 = uint(int(uint(_3238) >> uint(2)));
    int _3242 = _3238 & 3;
    float _3244 = (*spvDescriptorSet0.vp_c9)._m0[int(_3240)][_3242];
    float _3246 = _3212 * _3208;
    int _3248 = _3172 * int(_3178);
    int _3250 = _3248 + _3112;
    bool _3252 = _729 == 0;
    int _3254 = _793 * _3224;
    int _3256 = _3254 + _1572;
    float _3258 = _2910 * _3152;
    float _3260 = float(uint(_3250));
    int _3262 = _3148 + 8;
    uint _3264 = uint(int(uint(_3262) >> uint(2)));
    uint _3266 = uint(int(uint(int(_3264)) >> uint(2)));
    int _3268 = int(_3264) & 3;
    float _3270 = (*spvDescriptorSet0.vp_c9)._m0[int(_3266)][_3268];
    int _3272 = int(_3264) + 1;
    uint _3274 = uint(int(uint(_3272) >> uint(2)));
    int _3276 = _3272 & 3;
    float _3278 = (*spvDescriptorSet0.vp_c9)._m0[int(_3274)][_3276];
    int _3280 = ~_2904;
    int _3282 = _3280 + 1;
    float _3284 = -_3258;
    float _3286 = _2910 + _3284;
    int _3288 = ~_2200;
    int _3290 = _3288 + 1;
    int _3292 = _3290 + 1;
    float _3294 = as_type<float>(_3124) * _3260;
    int _3296 = int(_3050) + int(_3218);
    bool _3298 = !_2070;
    int _3300 = _3298 ? 0 : 1;
    float _3302 = trunc(_3294);
    float _3304 = precise::max(_3302, 0.0);
    uint _3306 = uint(_3304);
    bool _3308 = _1720 != 3;
    int _3310 = _3282 * _3296;
    int _3312 = _3310 + _3008;
    int _3314 = ~_3064;
    int _3316 = _3314 + 1;
    bool _3318 = !_3252;
    int _3320 = _3318 ? _2210 : (-1);
    bool _3322 = !_1504;
    int _3324 = _3322 ? _3256 : (-1);
    int _3326 = _3292 * as_type<int>(_3168);
    bool _3328 = !_3308;
    int _3330 = _3328 ? 0 : (-1);
    bool _3332 = uint(_3312) >= uint(_2904);
    int _3334 = int(_3178) + int(_3306);
    bool _3336 = !_3332;
    int _3338 = _3336 ? 0 : (-1);
    int _3340 = _2562 * as_type<int>(_3202);
    int _3342 = abs(_3300);
    int _3344 = _3316 * _3334;
    int _3346 = _3344 + _3112;
    int _3348 = ~_3342;
    int _3350 = _3348 + 1;
    int _3352 = _3350 + 1;
    bool _3354 = _2068 != 3;
    int _3356 = ~_3042;
    int _3358 = _3356 + 1;
    int _3360 = _3358 + 1;
    int _3362 = _3352 * as_type<int>(_3194);
    int _3364 = _3362 + _3340;
    int _3366 = ~_3296;
    int _3368 = _3366 + _3338;
    int _3370 = _3368 + 1;
    bool _3372 = !_3354;
    int _3374 = _3372 ? 0 : (-1);
    int _3376 = _3360 * as_type<int>(_3160);
    int _3378 = _3376 + _3326;
    bool _3380 = uint(_3346) >= uint(_3064);
    int _3382 = _2904 * _3370;
    int _3384 = _3382 + _3008;
    int _3386 = abs(_2148);
    bool _3388 = !_3380;
    int _3390 = _3388 ? 0 : (-1);
    int _3392 = abs(_1876);
    bool _3394 = _2904 == 0;
    int _3396 = ~_3386;
    int _3398 = _3396 + 1;
    int _3400 = _3398 + 1;
    int _3402 = abs(_3330);
    int _3404 = ~_3392;
    int _3406 = _3404 + 1;
    int _3408 = _3406 + 1;
    int _3410 = _3400 * as_type<int>(_3270);
    int _3412 = _3410 + _3364;
    bool _3414 = !_3394;
    int _3416 = _3414 ? _3384 : (-1);
    float _3418 = _1118 + 0.5;
    bool _3420 = _2904 == 0;
    int _3422 = _3408 * as_type<int>(_3236);
    int _3424 = _3422 + _3378;
    int _3426 = _3008 ^ _2904;
    int _3428 = abs(_3374);
    int _3430 = ~_3402;
    int _3432 = _3430 + 1;
    int _3434 = _3432 + 1;
    float _3436 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    uint _3438 = uint(int(uint(_3426) >> uint(31)));
    int _3440 = ~_3428;
    int _3442 = _3440 + 1;
    int _3444 = _3442 + 1;
    int _3446 = _3434 * as_type<int>(_3244);
    int _3448 = _3446 + _3424;
    int _3450 = ~_3390;
    int _3452 = _3334 + _3450;
    int _3454 = _3452 + 1;
    int _3456 = ~int(_3438);
    int _3458 = _3456 + 1;
    float _3460 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3462 = abs(_2058);
    int _3464 = _3444 * as_type<int>(_3278);
    int _3466 = _3464 + _3412;
    int _3468 = _3454 ^ _3458;
    int _3470 = ~_3060;
    int _3472 = _3470 + 1;
    int _3474 = _3472 + 1;
    int _3476 = ~_3458;
    int _3478 = _3476 + _3468;
    int _3480 = _3478 + 1;
    float _3482 = _3436 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3484 = in.m_76.x;
    float _3486 = in.m_76.y;
    float _3488 = in.m_76.z;
    int _3490 = ~_3462;
    int _3492 = _3490 + 1;
    int _3494 = _3492 + 1;
    int _3496 = _3448 * _3474;
    bool _3498 = !_3420;
    int _3500 = _3498 ? _3480 : (-1);
    float _3502 = float(_3416);
    int _3504 = _3466 * _3494;
    float _3506 = float(_3500);
    float _3508 = _3460 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3510 = _3320 * _3060;
    int _3512 = _3510 + _3496;
    float _3514 = fma(_3482, _3502, _2416);
    int _3516 = _3324 * _3462;
    int _3518 = _3516 + _3504;
    float _3520 = -_2418;
    float _3522 = fma(_3508, _3506, _3520);
    float _3524 = _1084 + (-0.5);
    float _3526 = fma(_3482, _3418, _3514);
    float _3528 = _3246 * (-2.0);
    float _3530 = -_3508;
    float _3532 = fma(_3530, _3524, _3522);
    float _3534 = float(_3512);
    float _3536 = -_2494;
    float _3538 = fma(_1118, _3536, _3526);
    float _3540 = float(_3518);
    float _3542 = fma(_1084, _2522, _3532);
    float _3544 = fma(_2918, _3528, _2918);
    out.m_78.x = _3534;
    float _3546 = fma(_3528, _3484, _3484);
    bool _3548 = !_2648;
    int _3550 = _3548 ? 0 : 1;
    out.m_78.w = _3540;
    bool _3552 = !_2652;
    int _3554 = _3552 ? 0 : 1;
    int _3556 = abs(_3550);
    out.m_80.x = _3538;
    out.m_80.y = _3542;
    float _3558 = _3488;
    if (_2974)
    {
        return out;
    }
    float _3560 = -_3180;
    float _3562 = _2854 + _3560;
    float _3564 = -_3182;
    float _3566 = _2782 + _3564;
    float _3568 = fma(_2898, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3546);
    float _3570 = float(_2502);
    float _3572 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3574 = _3562 + _3572;
    float _3576 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3578 = _3566 + _3576;
    float _3580 = fma(_3544, _2422, _3568);
    float _3582 = float(_3556);
    float _3584 = _3574 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3586 = -_3258;
    float _3588 = _2872 + _3586;
    float _3590 = _2864 + (-1.0);
    float _3592 = float(_2586);
    float _3594 = fma(_3578, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3584);
    float _3596 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3598 = _3588 + _3596;
    float _3600 = _3582 * _3570;
    int _3602 = abs(_3554);
    float _3604 = fma(_3286, _3286, _3226);
    float _3606 = fma(_3598, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3594);
    float _3608 = _3600 * (-2.0);
    float _3610 = _3580 * 0.15915493667125701904296875;
    float _3612 = float(_3602);
    float _3614 = fma(_3590, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3616 = fma(_3608, _3486, _3486);
    bool _3618 = _3606 >= 0.0;
    float _3620 = _2884 + (-1.0);
    float _3622 = fma(_3614, _3608, _3614);
    float _3624 = fma(_2848, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3616);
    float _3626 = _3612 * _3592;
    float _3628 = _908 + (-0.5);
    float _3630 = fma(_3622, _2422, _3624);
    float _3632 = _3626 * (-2.0);
    float _3634 = sqrt(_3604);
    float _3636 = fma(_3620, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3638 = _3630 * 0.15915493667125701904296875;
    float _3640 = fma(_3632, _3488, _3488);
    if (_3618)
    {
        _3558 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3642 = _3558;
    float _3644 = fma(_3636, _3632, _3636);
    int _3646 = as_type<int>(_3642);
    if (_3618)
    {
        out.m_55.x = 0.0;
    }
    float _3648 = fma(_3628, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3640);
    float _3650 = _3638 * 6.283185482025146484375;
    float _3652 = sin(_3650);
    if (_3618)
    {
        float _3654 = _3642 * 5.0;
        _3646 = as_type<int>(_3654);
    }
    int _3656 = _3646;
    float _3658 = fma(_3644, _2422, _3648);
    if (_3618)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10373 = as_type<float>(_3656);
        out.gl_Position.z = _10373;
    }
    float _3660 = _3638 * 6.283185482025146484375;
    float _3662 = cos(_3660);
    float _3664 = _3610 * 6.283185482025146484375;
    float _3666 = sin(_3664);
    float _3668 = _3610 * 6.283185482025146484375;
    float _3670 = cos(_3668);
    float _3672 = _3658 * 0.15915493667125701904296875;
    if (_3618)
    {
        return out;
    }
    float _3674 = _3672 * 6.283185482025146484375;
    float _3676 = cos(_3674);
    float _3678 = _3106 * _3634;
    float _3680 = _549 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3682 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _217);
    float _3684 = _3670 * _3662;
    float _3686 = _3104 * _3678;
    float _3688 = _3678 * _3680;
    float _3690 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _213);
    float _3692 = _3672 * 6.283185482025146484375;
    float _3694 = sin(_3692);
    float _3696 = _3670 * _3652;
    float _3698 = _3682 * _3688;
    float _3700 = _3666 * _3652;
    float _3702 = _3666 * _3662;
    float _3704 = _3690 * _3686;
    float _3706 = _3670 * _3676;
    float _3708 = _3662 * _3676;
    float _3710 = _3666 * _3676;
    float _3712 = _3652 * _3676;
    float _3714 = _3706 * _3698;
    float _3716 = _3678 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3718 = _3716 * 0.5;
    float _3720 = fma(_3694, _3684, _3700);
    float _3722 = -_3702;
    float _3724 = fma(_3694, _3696, _3722);
    float _3726 = -_3698;
    float _3728 = _3694 * _3726;
    float _3730 = -_3696;
    float _3732 = fma(_3694, _3702, _3730);
    float _3734 = fma(_3720, _3704, _3714);
    float _3736 = _3710 * _3698;
    float _3738 = fma(_3708, _3704, _3728);
    float _3740 = fma(_3694, _3700, _3684);
    float _3742 = fma(_3724, _3718, _3734);
    float _3744 = fma(_3732, _3704, _3736);
    float _3746 = fma(_3712, _3718, _3738);
    float _3748 = _3720 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3750 = _3742 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3752 = _3742 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3754 = fma(_3740, _3718, _3744);
    float _3756 = _3742 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3758 = fma(_3746, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3750);
    float _3760 = fma(_3746, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3752);
    float _3762 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3764 = fma(_3746, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3756);
    float _3766 = fma(_3754, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3758);
    float _3768 = fma(_3754, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3760);
    float _3770 = fma(_3708, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3748);
    float _3772 = fma(_3754, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3764);
    float _3774 = _3766 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3776 = _3768 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3778 = _3720 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3780 = _3772 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3782 = _2782 + _3774;
    float _3784 = _2872 + _3776;
    float _3786 = _3720 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3788 = fma(_3708, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3778);
    float _3790 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3792 = _3782 + _3790;
    float _3794 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3796 = _3784 + _3794;
    float _3798 = fma(_3708, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3786);
    float _3800 = _3706 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3802 = _3792 * _3792;
    float _3804 = _3796 * _3796;
    float _3806 = _3706 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3808 = -_3694;
    float _3810 = fma(_3808, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3800);
    float _3812 = fma(_3762, _3762, 1.0);
    float _3814 = _3802 + _3804;
    float _3816 = _3706 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3818 = _3724 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3820 = _3724 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3822 = sqrt(_3814);
    float _3824 = _3724 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3826 = _2854 + _3780;
    float _3828 = -_3694;
    float _3830 = fma(_3828, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3806);
    float _3832 = -_3694;
    float _3834 = fma(_3832, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3816);
    float _3836 = fma(_3712, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3818);
    float _3838 = fma(_3712, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3820);
    float _3840 = fma(_3712, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3824);
    float _3842 = rsqrt(_3812);
    bool _3844 = _3822 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3846 = _3724;
    float _3848 = _3712;
    float _3850 = _3816;
    float _3852 = _3812;
    float _3854 = _3818;
    if (!_3844)
    {
        _3846 = _3804;
    }
    float _3856 = _3846;
    float _3858 = _3856;
    if (!_3844)
    {
        _3848 = _3802;
    }
    float _3860 = _3848;
    float _3862 = _3860;
    if (!_3844)
    {
        _3850 = _3782;
    }
    float _3864 = _3850;
    float _3866 = _3864;
    if (!_3844)
    {
        _3852 = _3784;
    }
    float _3868 = _3852;
    float _3870 = _3868;
    if (!_3844)
    {
        _3854 = _3826;
    }
    float _3872 = _3854;
    bool _3874 = !_3844;
    float _3876 = _3872;
    if (!_3874)
    {
        float _3878 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3880 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3882 = _3822 + _3880;
        float _3884 = rsqrt(_3814);
        float _3886 = _3882 * _3878;
        float _3888 = _3826 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3890 = _3886 * 0.15915493667125701904296875;
        float _3892 = _3890 * 6.283185482025146484375;
        float _3894 = sin(_3892);
        float _3896 = _3890 * 6.283185482025146484375;
        float _3898 = cos(_3896);
        float _3900 = fma(_3894, _3888, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3902 = _3884 * _3900;
        float _3904 = _3898 + (-1.0);
        float _3906 = fma(_3792, _3902, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3908 = fma(_3796, _3902, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3910 = _3904 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3912 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3914 = _3906 + _3912;
        float _3916 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3918 = _3908 + _3916;
        float _3920 = fma(_3826, _3898, _3910);
        float _3922 = _3914 * _3914;
        float _3924 = _3918 * _3918;
        _3876 = _3920;
        _3862 = _3922;
        _3858 = _3924;
        _3866 = _3906;
        _3870 = _3908;
    }
    float _3926 = _3876;
    float _3928 = _3862;
    float _3930 = _3858;
    float _3932 = _3866;
    float _3934 = _3870;
    float _3936 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3938 = _3926 + _3936;
    float _3940 = fma(_3710, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3810);
    float _3942 = fma(_3710, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3830);
    float _3944 = fma(_3710, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3834);
    float _3946 = fma(_3938, _3938, _3928);
    float _3948 = fma(_3740, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3836);
    float _3950 = fma(_3732, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3788);
    float _3952 = fma(_3740, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3838);
    float _3954 = _3946 + _3930;
    float _3956 = fma(_3740, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3840);
    float _3958 = fma(_3732, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3798);
    float _3960 = _3762 * _3842;
    float _3962 = fma(_3732, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3770);
    float _3964 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3966 = _3762 * _3940;
    float _3968 = _3762 * _3942;
    float _3970 = _3762 * _3944;
    float _3972 = sqrt(_3954);
    float _3974 = -_3948;
    float _3976 = _3960 * _3974;
    float _3978 = -_3952;
    float _3980 = _3960 * _3978;
    float _3982 = -_3956;
    float _3984 = _3960 * _3982;
    float _3986 = fma(_3964, _3950, _3966);
    float _3988 = fma(_3964, _3958, _3968);
    float _3990 = fma(_3964, _3962, _3970);
    float _3992 = fma(_3842, _3942, _3980);
    float _3994 = fma(_3842, _3940, _3976);
    float _3996 = fma(_3842, _3944, _3984);
    float _3998 = _3948 + _3986;
    float _4000 = _3952 + _3988;
    float _4002 = _3956 + _3990;
    out.m_82.x = _3950;
    out.m_82.y = _3958;
    out.m_82.z = _3962;
    bool _4004 = _3972 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4006 = isnan(_3972);
    bool _4008 = _4004 || _4006;
    bool _4010 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4012 = _4008 || _4010;
    out.m_84.x = _3994;
    out.m_84.y = _3992;
    out.m_84.z = _3996;
    out.m_86.x = _3998;
    out.m_86.y = _4000;
    out.m_86.z = _4002;
    float _4014 = _3966;
    float _4016 = _3994;
    if (!_4012)
    {
        _4014 = 1.0;
    }
    float _4018 = _4014;
    bool _4020 = !_4012;
    float _4022 = _4018;
    if (!_4020)
    {
        bool _4024 = _3972 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4026 = isnan(_3972);
        bool _4028 = _4024 || _4026;
        bool _4030 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4032 = _4028 || _4030;
        if (!_4032)
        {
            float _4034 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4036 = _3972 + _4034;
            float _4038 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4040 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4038;
            float _4042 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4044 = _4042 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4046 = 1.0 / _4040;
            float _4048 = _4036 * _4046;
            float _4050 = fma(_4048, _4044, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4022 = _4050;
            _4052 = true;
        }
        else
        {
            bool _4054 = _3972 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4056 = isnan(_3972);
            bool _4058 = _4054 || _4056;
            bool _4060 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4062 = _4058 || _4060;
            if (!_4062)
            {
                float _4064 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4066 = _3972 + _4064;
                float _4068 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4070 = _4068 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4072 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4074 = _4072 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4076 = 1.0 / _4070;
                float _4078 = _4066 * _4076;
                float _4080 = fma(_4078, _4074, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4022 = _4080;
                _4052 = true;
            }
            else
            {
                _4022 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4052 = false;
    float _4082 = _4022;
    float _4084 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4086 = _3926 + _4084;
    float _4088 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4090 = _3932 + _4088;
    float _4092 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4094 = _3934 + _4092;
    float _4096 = fma(_4086, _4082, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4098 = fma(_4090, _4082, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4100 = fma(_4094, _4082, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4102 = -_2854;
    float _4104 = _4102 + _4096;
    float _4106 = -_2782;
    float _4108 = _4106 + _4098;
    float _4110 = -_2872;
    float _4112 = _4110 + _4100;
    float _4114 = _4104 * _4104;
    float _4116 = fma(_4108, _4108, _4114);
    float _4118 = fma(_4112, _4112, _4116);
    float _4120 = sqrt(_4118);
    bool _4122 = _4120 > 0.0;
    float _4124 = _4090;
    float _4126 = _4120;
    float _4128 = _4094;
    float _4130 = _4098;
    if (!_4122)
    {
        _4124 = _4098;
    }
    float _4132 = _4124;
    float _4134 = _4132;
    float _4136 = _4132;
    if (!_4122)
    {
        _4126 = _4096;
    }
    float _4138 = _4126;
    float _4140 = _4138;
    if (!_4122)
    {
        _4128 = _4100;
    }
    float _4142 = _4128;
    bool _4144 = !_4122;
    float _4146 = _4142;
    if (!_4144)
    {
        float _4148 = _207 * _207;
        float _4150 = fma(_205, _205, _4148);
        float _4152 = rsqrt(_4118);
        float _4154 = fma(_209, _209, _4150);
        float _4156 = sqrt(_4154);
        float _4158 = _4108 * _4152;
        float _4160 = _4104 * _4152;
        float _4162 = _4112 * _4152;
        bool _4164 = _4156 > 0.0;
        float _4166 = _4152;
        float _4168 = _4156;
        _4016 = _4158;
        if (!_4164)
        {
            _4134 = _4098;
        }
        float _4170 = _4134;
        _4136 = _4170;
        if (!_4164)
        {
            _4166 = _4096;
        }
        float _4172 = _4166;
        _4140 = _4172;
        if (!_4164)
        {
            _4168 = _4100;
        }
        float _4174 = _4168;
        bool _4176 = !_4164;
        _4146 = _4174;
        if (!_4176)
        {
            float _4178 = rsqrt(_4154);
            float _4180 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4182 = _207 * _4178;
            float _4184 = _205 * _4178;
            float _4186 = _4160 * _4182;
            float _4188 = _209 * _4178;
            float _4190 = fma(_4158, _4184, _4186);
            float _4192 = _4180 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4194 = fma(_4162, _4188, _4190);
            float _4196 = _4194 * _4192;
            float _4198 = fma(_205, _4196, _4098);
            float _4200 = fma(_207, _4196, _4096);
            float _4202 = fma(_209, _4196, _4100);
            _4140 = _4200;
            _4136 = _4198;
            _4146 = _4202;
        }
    }
    float _4204 = _4140;
    float _4206 = _4136;
    float _4208 = _4146;
    float _4210 = _4016;
    float _4212 = -_3180;
    float _4214 = _4212 + _4204;
    float _4216 = -_3182;
    float _4218 = _4216 + _4206;
    float _4220 = -_3258;
    float _4222 = _4220 + _4208;
    float _4224 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4226 = _4214 + _4224;
    float _4228 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4230 = _4218 + _4228;
    float _4232 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4234 = _4222 + _4232;
    float _4236 = _4226 * _4226;
    float _4238 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4240 = fma(_4230, _4230, _4236);
    float _4242 = fma(_4234, _4234, _4240);
    float _4244 = rsqrt(_4242);
    float _4246 = sqrt(_4242);
    float _4248 = _4244 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4250 = _4230 * _4248;
    float _4252 = _4234 * _4248;
    float _4254 = _4250 * _4250;
    float _4256 = _4252 * _4252;
    float _4258 = _4254 + _4256;
    float _4260 = sqrt(_4258);
    bool _4262 = _4260 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4264 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4266 = _4260 + _4264;
    float _4268 = _4234;
    float _4270 = _4258;
    float _4272 = _4266;
    float _4274 = _4210;
    if (_4262)
    {
        float _4276 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4268 = _4276;
    }
    float _4278 = _4268;
    if (_4262)
    {
        float _4280 = rsqrt(_4258);
        _4270 = _4280;
    }
    float _4282 = _4270;
    float _4284 = _4282;
    if (_4262)
    {
        float _4286 = _4266 * _4278;
        _4272 = _4286;
    }
    float _4288 = _4272;
    if (_4262)
    {
        float _4290 = _4288 * 0.15915493667125701904296875;
        _221 = _4290;
    }
    float _4292 = _221;
    float _4294 = _4278;
    if (_4262)
    {
        float _4296 = _4292 * 6.283185482025146484375;
        float _4298 = sin(_4296);
        _4294 = _4298;
    }
    float _4300 = _4294;
    float _4302 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4304 = precise::max(0.0, _4302);
    float _4306 = _4236;
    float _4308 = _4304;
    if (_4262)
    {
        float _4310 = _4292 * 6.283185482025146484375;
        float _4312 = cos(_4310);
        _4306 = _4312;
    }
    float _4314 = _4306;
    float _4316 = -_4248;
    float _4318 = -_4304;
    float _4320 = fma(_4226, _4316, _4318);
    float _4322 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_4262)
    {
        float _4324 = _4320 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4308 = _4324;
    }
    float _4326 = _4308;
    float _4328 = _4214 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4330 = fma(_3566, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4332 = _4326;
    if (!_4262)
    {
        _4322 = _4250;
    }
    float _4334 = _4322;
    float _4336 = _4300;
    float _4338 = _4334;
    if (_4262)
    {
        float _4340 = fma(_4300, _4326, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4336 = _4340;
    }
    float _4342 = _4336;
    float _4344 = fma(_4218, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4328);
    float _4346 = floor(_4330);
    float _4348 = _4342;
    float _4350 = _4314;
    if (_4262)
    {
        float _4352 = _4314 + (-1.0);
        _4332 = _4352;
    }
    float _4354 = _4332;
    float _4356 = _4354;
    if (_4262)
    {
        float _4358 = _4282 * _4342;
        _4274 = _4358;
    }
    float _4360 = _4274;
    if (!_4262)
    {
        _4348 = _4320;
    }
    float _4362 = _4348;
    float _4364 = fma(_4222, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4344);
    float _4366 = _4362;
    if (_4262)
    {
        float _4368 = _4354 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4130 = _4368;
    }
    float _4370 = _4130;
    if (_4262)
    {
        float _4372 = _4250 * _4360;
        _4338 = _4372;
    }
    float _4374 = _4338;
    if (!_4262)
    {
        _4356 = _4252;
    }
    float _4376 = _4356;
    float _4378 = _4376;
    if (_4262)
    {
        float _4380 = _4252 * _4360;
        _4378 = _4380;
    }
    float _4382 = _4378;
    if (!_4262)
    {
        _4284 = _4254;
    }
    float _4384 = _4284;
    float _4386 = _4384;
    if (_4262)
    {
        float _4388 = fma(_4320, _4314, _4370);
        _4366 = _4388;
    }
    float _4390 = _4366;
    if (_4262)
    {
        float _4392 = _4374 * _4374;
        _4386 = _4392;
    }
    float _4394 = _4386;
    if (!_4262)
    {
        _4350 = _4256;
    }
    float _4396 = _4350;
    float _4398 = _4396;
    if (_4262)
    {
        float _4400 = _4382 * _4382;
        _4398 = _4400;
    }
    float _4402 = _4398;
    float _4404 = fma(_4390, _4390, _4394);
    float _4406 = _4214 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4408 = _4214 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4410 = -_4346;
    float _4412 = _4330 + _4410;
    float _4414 = _4404 + _4402;
    float _4416 = _4214 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4418 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4420 = fma(_4246, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4418);
    float _4422 = precise::clamp(_4420, 0.0, 1.0);
    float _4424 = fma(_4218, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4406);
    float _4426 = rsqrt(_4414);
    float _4428 = fma(_4218, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4416);
    float _4430 = _4364 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4432 = -_4422;
    float _4434 = _4432 + 1.0;
    float _4436 = fma(_4218, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4408);
    float _4438 = fma(_4222, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4428);
    float _4440 = fma(_4222, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4424);
    float _4442 = fma(_4222, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4436);
    float _4444 = _4438 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4446 = _4430 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4448 = _4440 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4450 = abs(_4434);
    float _4452 = log2(_4450);
    float _4454 = _4442 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4456 = fma(_4444, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4446);
    float _4458 = _4448 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4460 = _4426 * _4374;
    float _4462 = _4426 * _4390;
    float _4464 = fma(_4448, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4456);
    float _4466 = _4426 * _4382;
    float _4468 = -_4458;
    float _4470 = fma(_4468, _4238, 1.0);
    float _4472 = fma(_3588, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4474 = fma(_4454, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4464);
    float _4476 = _4460 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4478 = _4430 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4480 = floor(_4472);
    float _4482 = -_4476;
    float _4484 = fma(_4462, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4482);
    float _4486 = _4452 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4488 = fma(_4444, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4478);
    float _4490 = -_4466;
    float _4492 = fma(_4490, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4484);
    float _4494 = _4430 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4496 = log2(_4470);
    float _4498 = fma(_4448, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4488);
    float _4500 = fma(_4492, -0.5, 0.5);
    float _4502 = fma(_4492, 0.5, 0.5);
    float _4504 = fma(_4444, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4494);
    float _4506 = _4462 + 1.0;
    float _4508 = fma(_4502, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4510 = exp2(_4486);
    float _4512 = fma(_4448, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4504);
    float _4514 = -_4480;
    float _4516 = _4472 + _4514;
    float _4518 = fma(_4502, _4508, -0.212114393711090087890625);
    float _4520 = fma(_4454, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4512);
    float _4522 = fma(_4502, _4518, 1.570728778839111328125);
    float _4524 = 1.0 / _4474;
    float _4526 = sqrt(_4500);
    float _4528 = -_4462;
    float _4530 = fma(_4510, _4506, _4528);
    float _4532 = fma(_4454, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4498);
    float _4534 = _4496 * 0.693147182464599609375;
    float _4536 = fma(_4530, 0.5, 0.5);
    float _4538 = _4534 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4540 = _4520 * _4524;
    float _4542 = _4532 * _4524;
    float _4544 = fma(_4540, 0.5, 0.5);
    float _4546 = fma(_4542, -0.5, 0.5);
    float _4548 = _4526 * 0.636619746685028076171875;
    float2 _11874 = float2(_4412, _4516);
    float _4550 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11874, float2(0.0), isnan(_11874)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11874, float2(0.0), isnan(_11874)), level(0.0)).x;
    float3 _11885 = float3(_4544, _4546, _4538);
    float _4552 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11885, float3(0.0), isnan(_11885)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11885, float3(0.0), isnan(_11885)), level(0.0)).x;
    float _4554 = -_4522;
    float _4556 = fma(_4548, _4554, 1.0);
    float3 _11901 = float3(_4544, _4546, _4538);
    float4 _4559 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11901, float3(0.0), isnan(_11901)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11901, float3(0.0), isnan(_11901)), level(0.0)).xyzw;
    float _4561 = _4559.x;
    float _4563 = _4559.y;
    float _4565 = _4559.z;
    float _4567 = _4559.w;
    float2 _11917 = float2(_4556, _4536);
    float3 _4571 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11917, float2(0.0), isnan(_11917)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11917, float2(0.0), isnan(_11917)), level(0.0)).xyz;
    float _4573 = _4571.x;
    float _4575 = _4571.y;
    float _4577 = _4571.z;
    float _4579 = _3562 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4581 = _3562 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4583 = _4430 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4585 = in.m_88.x;
    float _4587 = fma(_3566, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4579);
    float _4589 = fma(_3566, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4581);
    float _4591 = fma(_4444, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4583);
    float _4593 = fma(_3588, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4587);
    float _4595 = fma(_3588, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4589);
    float _4597 = _4593 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4599 = _4595 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4601 = 1.0 / _4597;
    float _4603 = _4599 + _4597;
    float _4605 = _4603 * _4601;
    float _4607 = _4605 * 0.5;
    float _4609 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4611 = fma(_4607, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4609);
    float _4613 = 1.0 / _4611;
    float _4615 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4617 = _4613 * _4615;
    float _4619 = abs(_4617);
    float _4621 = log2(_4619);
    bool _4623 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4625 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4627 = _4623 || _4625;
    bool _4629 = isnan(0.5);
    bool _4631 = _4627 || _4629;
    float _4633 = fma(_4448, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4591);
    float _4635 = _4452 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4637 = _4520 + _4474;
    float _4639 = _4474 * 0.5;
    float _4641 = fma(_4454, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4633);
    float _4643 = exp2(_4635);
    float _4645 = _4637 * 0.5;
    float _4647 = fma(_4532, -0.5, _4639);
    float _4649 = _4621 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4651 = exp2(_4649);
    float _4653 = fma(_4651, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4655 = precise::clamp(_4653, 0.0, 1.0);
    bool _4657 = _4617 <= 8000.0;
    bool _4659 = isnan(_4617);
    bool _4661 = _4657 || _4659;
    bool _4663 = isnan(8000.0);
    bool _4665 = _4661 || _4663;
    float _4667 = float(_4665);
    float _4669 = fma(_4655, -2.0, 3.0);
    float _4671 = _4655 * _4655;
    float _4673 = _4671 * _4669;
    float _4675 = -_4673;
    float _4677 = _4675 + 1.0;
    float _4679 = fma(_4677, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4673);
    float _4681 = _4667 * _4679;
    float _4683 = _4641 + _4474;
    float _4685 = _4667;
    float _4687 = _4474;
    float _4689 = _4641;
    float _4691 = _4532;
    if (_4631)
    {
        _4685 = 1.0;
    }
    float _4693 = _4685;
    float _4695 = _4683 * 0.5;
    float _4697 = _4693;
    float _4699 = _4561;
    if (!_4631)
    {
        float _4701 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4703 = _4701 * 0.15915493667125701904296875;
        float _4705 = _4703 * 6.283185482025146484375;
        float _4707 = cos(_4705);
        float _4709 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4711 = _4709 * 0.15915493667125701904296875;
        float _4713 = _4703 * 6.283185482025146484375;
        float _4715 = sin(_4713);
        float _4717 = 1.0 / _4707;
        float _4719 = _4711 * 6.283185482025146484375;
        float _4721 = cos(_4719);
        float _4723 = _4715 * _4717;
        float _4725 = _4711 * 6.283185482025146484375;
        float _4727 = sin(_4725);
        float _4729 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4731 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4729;
        float _4733 = _4721 * _4723;
        float _4735 = 1.0 / _4731;
        float _4737 = 1.0 / _4733;
        float _4739 = _4727 * _4737;
        float _4741 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4743 = fma(_4617, _4739, _4741);
        float _4745 = _4743 * _4735;
        float _4747 = precise::clamp(_4745, 0.0, 1.0);
        _4697 = _4747;
    }
    float _4749 = _4697;
    float _4751 = _4681 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4753 = -_4643;
    float _4755 = _4753 + 1.0;
    float _4757 = -_4550;
    float _4759 = _4757 + 1.0;
    out.gl_Position.x = _4520;
    out.gl_Position.y = _4532;
    out.gl_Position.z = _4641;
    out.gl_Position.w = _4474;
    float _4761 = _4755 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4763 = _4759 * _4751;
    float _4765 = precise::clamp(_4763, 0.0, 1.0);
    bool _4767 = _4246 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4769 = isnan(_4246);
    bool _4771 = _4767 || _4769;
    bool _4773 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4775 = _4771 || _4773;
    out.m_90.x = _4645;
    out.m_90.y = _4647;
    out.m_90.z = _4695;
    out.m_90.w = _4474;
    float _4777 = _4761 * _4552;
    float _4779 = -_4765;
    float _4781 = fma(_4779, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4783 = _4567 * _4777;
    float _4785 = _4781 * _4585;
    float _4787 = _4577 * _4777;
    float _4789 = -_4761;
    float _4791 = _4789 + 1.0;
    float _4793 = _4785 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4795 = _4783;
    float _4797 = _4791;
    if (!_4775)
    {
        _4687 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4799 = _4687;
    float _4801 = fma(_4573, _4783, _4561);
    float _4803 = fma(_4575, _4783, _4563);
    float _4805 = _4567 * _4791;
    float _4807 = fma(_4567, _4787, _4565);
    out.m_92.x = _4793;
    float _4809 = _4749 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4811 = _4799;
    float _4813 = _4799;
    if (!_4775)
    {
        _4795 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4815 = _4795;
    out.m_94.x = _4801;
    out.m_94.y = _4803;
    out.m_94.z = _4807;
    out.m_94.w = _4805;
    float _4817 = _4815;
    float _4819 = _4815;
    if (!_4775)
    {
        _4699 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4821 = _4699;
    float _4823 = _4821;
    float _4825 = _4821;
    if (!_4775)
    {
        _4689 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4827 = _4689;
    float _4829 = _4827;
    float _4831 = _4827;
    if (!_4775)
    {
        _4691 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4833 = _4691;
    float _4835 = _4833;
    float _4837 = _4833;
    if (!_4775)
    {
        _4797 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4839 = _4797;
    bool _4841 = !_4775;
    float _4843 = _4839;
    float _4845 = _4839;
    if (!_4841)
    {
        bool _4847 = _4246 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4849 = isnan(_4246);
        bool _4851 = _4847 || _4849;
        bool _4853 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4855 = _4851 || _4853;
        if (!_4855)
        {
            float _4857 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4859 = _4246 + _4857;
            float _4861 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4863 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4861;
            float _4865 = 1.0 / _4863;
            float _4867 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4869 = _4867 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4871 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4873 = _4871 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4875 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4877 = _4875 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4879 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4881 = _4879 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4883 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4885 = _4883 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4887 = _4859 * _4865;
            float _4889 = precise::clamp(_4887, 0.0, 1.0);
            float _4891 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4893 = _4891 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4895 = fma(_4889, _4873, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4897 = fma(_4889, _4893, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4899 = fma(_4889, _4869, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4901 = fma(_4889, _4877, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4903 = fma(_4889, _4881, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4905 = fma(_4889, _4885, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4837 = _4899;
            _4825 = _4903;
            _4831 = _4897;
            _4819 = _4901;
            _4845 = _4895;
            _4813 = _4905;
            _4907 = true;
        }
        else
        {
            bool _4909 = _4246 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4911 = isnan(_4246);
            bool _4913 = _4909 || _4911;
            bool _4915 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4917 = _4913 || _4915;
            if (!_4917)
            {
                _4817 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4919 = _4817;
            _4819 = _4919;
            if (!_4917)
            {
                _4823 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4921 = _4823;
            _4825 = _4921;
            if (!_4917)
            {
                _4811 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4923 = _4811;
            _4813 = _4923;
            if (!_4917)
            {
                _4829 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4925 = _4829;
            _4831 = _4925;
            if (!_4917)
            {
                _4835 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4927 = _4835;
            _4837 = _4927;
            if (!_4917)
            {
                _4843 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4929 = _4843;
            bool _4931 = !_4917;
            _4845 = _4929;
            if (!_4931)
            {
                bool _4933 = _4246 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4935 = isnan(_4246);
                bool _4937 = _4933 || _4935;
                bool _4939 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4941 = _4937 || _4939;
                if (!_4941)
                {
                    float _4943 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4945 = _4246 + _4943;
                    float _4947 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4949 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4947;
                    float _4951 = 1.0 / _4949;
                    float _4953 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4955 = _4953 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4957 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4959 = _4957 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4961 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4963 = _4961 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4965 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4967 = _4965 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4969 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4971 = _4969 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4973 = _4945 * _4951;
                    float _4975 = precise::clamp(_4973, 0.0, 1.0);
                    float _4977 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4979 = _4977 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4981 = fma(_4975, _4959, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4983 = fma(_4975, _4979, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4985 = fma(_4975, _4955, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4987 = fma(_4975, _4963, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4989 = fma(_4975, _4967, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4991 = fma(_4975, _4971, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4837 = _4985;
                    _4825 = _4989;
                    _4831 = _4983;
                    _4819 = _4987;
                    _4845 = _4981;
                    _4813 = _4991;
                    _4907 = true;
                }
                else
                {
                    _4837 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4825 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4831 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4819 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4845 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4813 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4907 = false;
    float _4993 = _4837;
    float _4995 = _4825;
    float _4997 = _4831;
    float _4999 = _4819;
    float _5001 = _4845;
    float _5003 = _4813;
    float _5005 = fma(_4000, -0.5, 0.5);
    float _5007 = precise::clamp(_5005, 0.0, 1.0);
    float _5009 = -_4993;
    float _5011 = _4995 + _5009;
    float _5013 = _4809 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5015 = -_4997;
    float _5017 = _4999 + _5015;
    float _5019 = fma(_5007, _5011, _4993);
    out.m_96.x = 0.0;
    float _5021 = -_5001;
    float _5023 = _5003 + _5021;
    float _5025 = fma(_5007, _5017, _4997);
    float _5027 = _5019 * 0.586610972881317138671875;
    out.m_55.x = _5013;
    bool _5029 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5031 = fma(_5007, _5023, _5001);
    float _5033 = fma(_5025, 0.298911988735198974609375, _5027);
    bool _5035 = _4749 > 0.0;
    bool _5037 = isnan(_4749);
    bool _5039 = _5035 || _5037;
    bool _5041 = isnan(0.0);
    bool _5043 = _5039 || _5041;
    float _5045 = fma(_5031, 0.114477999508380889892578125, _5033);
    float _5047 = -_5045;
    float _5049 = _5025 + _5047;
    float _5051 = -_5045;
    float _5053 = _5019 + _5051;
    float _5055 = -_5045;
    float _5057 = _5031 + _5055;
    float _5059 = fma(_5049, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5045);
    float _5061 = fma(_5053, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5045);
    float _5063 = fma(_5057, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5045);
    bool _5065 = !_5029;
    if (!_5065)
    {
        float _5067 = -_4214;
        float _5069 = _5067 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5071 = -_4218;
        float _5073 = _5071 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5075 = -_4222;
        float _5077 = _5075 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5079 = _5069 * _5069;
        float _5081 = fma(_5073, _5073, _5079);
        float _5083 = fma(_5077, _5077, _5081);
        float _5085 = sqrt(_5083);
        float _5087 = rsqrt(_5083);
        float _5089 = -_5085;
        float _5091 = _5089 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5093 = _5091 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5095 = precise::clamp(_5093, 0.0, 1.0);
        float _5097 = _5073 * _5087;
        float _5099 = _5069 * _5087;
        float _5101 = abs(_5095);
        float _5103 = log2(_5101);
        float _5105 = _5077 * _5087;
        float _5107 = _5097 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5109 = _4000 * _5099;
        float _5111 = -_5099;
        float _5113 = -_5107;
        float _5115 = fma(_5111, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5113);
        float _5117 = fma(_3998, _5097, _5109);
        float _5119 = -_5105;
        float _5121 = fma(_5119, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5115);
        float _5123 = fma(_4002, _5105, _5117);
        float _5125 = precise::clamp(_5123, 0.0, 1.0);
        float _5127 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5129 = _5121 + _5127;
        float _5131 = _5103 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5133 = _5129 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5135 = precise::clamp(_5133, 0.0, 1.0);
        float _5137 = exp2(_5131);
        float _5139 = _5137 * _5135;
        float _5141 = _5125 * _5139;
        float _5143 = _5141 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5145 = _5141 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5147 = _5141 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _5143;
        out.m_96.y = _5145;
        out.m_96.z = _5147;
    }
    out.m_98.x = _5059;
    out.m_98.y = _5061;
    out.m_98.z = _5063;
    if (_5043)
    {
        return out;
    }
    out.m_55.x = 0.0;
    float _5149 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5149;
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4907 = false;
    bool _4052 = false;
    bool _573 = false;
    bool _429 = false;
    bool _241 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_48.w;
    float _114 = in.m_50.w;
    float _116 = trunc(_112);
    int _119 = int(_116);
    float _121 = -_114;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _123;
    bool _127 = _119 >= 1;
    float _129 = 0.0;
    float _131 = as_type<float>(_119);
    float _133 = _123;
    if (!_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _129;
    if (!_127)
    {
        out.m_55.x = 0.0;
    }
    int _137 = 0;
    if (!_127)
    {
        float _139 = _135 * 5.0;
        _137 = as_type<int>(_139);
    }
    int _141 = _137;
    int _143 = _141;
    if (!_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5218 = as_type<float>(_141);
        out.gl_Position.z = _5218;
    }
    if (!_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _145 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_114);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = float(_119);
    bool _157 = _123 >= _155;
    bool _159 = !_153;
    bool _161 = _157 || _159;
    float _163 = 1.0 / _155;
    if (_161)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _131;
    if (_161)
    {
        out.m_55.x = 0.0;
    }
    float _167 = _123 * _163;
    float _169 = _167;
    if (_161)
    {
        float _171 = _165 * 5.0;
        _143 = as_type<int>(_171);
    }
    int _173 = _143;
    out.m_53.x = _167;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5281 = as_type<float>(_173);
        out.gl_Position.z = _5281;
    }
    if (_161)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _175 = as_type<float>(int(gl_VertexIndex));
    float _177 = in.m_60.x;
    float _179 = in.m_60.y;
    float _181 = in.m_60.z;
    int _183 = as_type<int>(_175) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_175) & 2;
    bool _189 = _187 != 0;
    bool _191 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _193 = _179 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _195 = _179 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _197 = _179 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _199 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].x, _193);
    float _201 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].x, _195);
    float _203 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].x, _197);
    float _205 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[4].z, _199);
    float _207 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[5].z, _201);
    float _209 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[6].z, _203);
    bool _211 = !_185;
    float _213 = _211 ? (-0.5) : 0.5;
    bool _215 = !_189;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_191;
    float _221 = _207;
    float _239;
    if (!_219)
    {
        float _223 = in.m_62.x;
        float _225 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _227 = _223 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _229 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _231 = _229 * _225;
        float _233 = floor(_231);
        float _235 = -_233;
        float _237 = _231 + _235;
        _239 = _237;
        _241 = true;
    }
    else
    {
        _239 = _167;
    }
    _241 = false;
    float _243 = _239;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _247 = _243 + _245;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _251 = _243 + _249;
    bool _253 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _255 = isnan(_243);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _271 = _269 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _279 = _243 + _277;
    float _281 = 1.0 / _267;
    bool _283 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _285 = 1.0 / _275;
    float _287 = 1.0 / _271;
    float _289 = _247 * _281;
    bool _291 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _293 = isnan(_243);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = -_263;
    float _305 = _303 + 1.0;
    float _307 = _301 * _305;
    float _309 = _251 * _285;
    bool _311 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _313 = isnan(_243);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = -_301;
    float _325 = _323 + 1.0;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _331 = _279 * _287;
    bool _333 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _335 = isnan(_243);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _345;
    float _349 = _321 * _325;
    float _351 = -_321;
    float _353 = _351 + 1.0;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _361 = _359 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _363 = fma(_347, _289, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _365 = _343 * _353;
    float _367 = fma(_357, _289, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _369 = fma(_329, _331, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _371 = fma(_361, _331, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _373 = -_343;
    float _375 = _373 + 1.0;
    float _377 = _363 * _365;
    float _379 = _367 * _365;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _385;
    float _389 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[143].x, _377);
    float _391 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[143].y, _379);
    float _393 = fma(_383, _309, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _395 = fma(_387, _309, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _397 = fma(_369, _349, _389);
    float _399 = fma(_371, _349, _391);
    float _401 = fma(_393, _307, _397);
    float _403 = fma(_395, _307, _399);
    float _405 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[146].x, _401);
    float _407 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[146].y, _403);
    bool _409 = !_283;
    float _427;
    if (!_409)
    {
        float _411 = in.m_62.x;
        float _413 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _415 = _411 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _417 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _419 = _417 * _413;
        float _421 = floor(_419);
        float _423 = -_421;
        float _425 = _419 + _423;
        _427 = _425;
        _429 = true;
    }
    else
    {
        _427 = _167;
    }
    _429 = false;
    float _431 = _427;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _435 = _431 + _433;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _441 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _443 = isnan(_431);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _457 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _459 = isnan(_431);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _465 = _461 || _463;
    float _467 = float(_465);
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _469;
    bool _473 = _431 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _475 = isnan(_431);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = 1.0 / _439;
    float _487 = -_451;
    float _489 = _487 + 1.0;
    bool _491 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _493 = 1.0 / _455;
    float _495 = _471 * _485;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _501 = -_483;
    float _503 = _501 + 1.0;
    float _505 = fma(_495, _435, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _507 = _467 * _489;
    float _509 = -_467;
    float _511 = _509 + 1.0;
    float _513 = _451 * _503;
    float _515 = _499 * _493;
    float _517 = _505 * _507;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _521 = _431 + _519;
    float _523 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[115].x, _517);
    float _525 = fma(_515, _521, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _529 = fma(_525, _513, _523);
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _533 = in.m_64.x;
    float _535 = in.m_64.y;
    float _537 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[117].x, _529);
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _541 = _527 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _543 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _545 = _537 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _547 = _539 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_66.x = _541;
    out.m_66.y = _543;
    out.m_66.z = _547;
    out.m_66.w = _545;
    float _549 = _407 * _535;
    float _551 = _405 * _533;
    bool _553 = !_491;
    float _571;
    if (!_553)
    {
        float _555 = in.m_62.x;
        float _557 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _559 = _555 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _561 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[11].w, _123);
        float _563 = _561 * _557;
        float _565 = floor(_563);
        float _567 = -_565;
        float _569 = _563 + _567;
        _571 = _569;
        _573 = true;
    }
    else
    {
        _571 = _167;
    }
    _573 = false;
    float _575 = _571;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _579 = _575 + _577;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _585 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _587 = isnan(_575);
    bool _589 = _585 || _587;
    bool _591 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _593 = _589 || _591;
    float _595 = float(_593);
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _601 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _603 = isnan(_575);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _613;
    bool _617 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _619 = isnan(_575);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = 1.0 / _583;
    float _631 = -_595;
    float _633 = _631 + 1.0;
    bool _635 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _637 = 1.0 / _599;
    float _639 = _615 * _629;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _645 = fma(_639, _579, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _647 = _611 * _633;
    float _649 = -_627;
    float _651 = _649 + 1.0;
    float _653 = -_611;
    float _655 = _653 + 1.0;
    float _657 = _643 * _637;
    float _659 = _645 * _647;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _663 = _575 + _661;
    float _665 = _595 * _651;
    float _667 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[131].x, _659);
    float _669 = fma(_657, _663, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _671 = fma(_669, _665, _667);
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _679 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[133].x, _671);
    float _681 = _673 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _683 = _675 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _685 = _677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _687 = _679 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_68.x = _681;
    out.m_68.y = _683;
    out.m_68.z = _685;
    out.m_68.w = _687;
    bool _689 = !_635;
    float _691 = _665;
    float _693 = _687;
    if (!_689)
    {
        float _695 = in.m_62.x;
        float _697 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _699 = _695 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _701 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[14].x, _123);
        float _703 = _701 * _697;
        float _705 = floor(_703);
        float _707 = -_705;
        float _709 = _703 + _707;
        _169 = _709;
    }
    float _711 = _169;
    float _713 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _715 = int(_713);
    int _717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _719 = _717 != 0;
    float _721 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _723 = int(_721);
    float _725 = float(_715);
    float _727 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _729 = int(_727);
    float _731 = 0.0;
    if (_719)
    {
        _731 = 1.0;
    }
    float _733 = _731;
    float _735 = _733;
    if (_719)
    {
        _691 = 1.0;
    }
    float _737 = _691;
    float _739 = float(_723);
    float _741 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _743 = int(_741);
    float _745 = 1.0 / _739;
    float _747 = float(uint(_729));
    int _749 = ~_729;
    int _751 = _749 + 1;
    float _753 = 1.0 / _725;
    float _755 = float(uint(_743));
    float _757 = _745 * _123;
    float _759 = 1.0 / _747;
    float _761 = _753 * _123;
    float _763 = 1.0 / _755;
    float _765 = _739;
    float _767 = _753;
    float _769 = _737;
    if (_719)
    {
        float _771 = in.m_62.x;
        float _773 = in.m_62.y;
        _765 = _771;
        _767 = _773;
    }
    float _775 = _765;
    float _777 = _767;
    float _779 = trunc(_757);
    int _781 = int(_779);
    int _783 = as_type<int>(_759) + (-2);
    float _785 = trunc(_761);
    int _787 = int(_785);
    int _789 = as_type<int>(_763) + (-2);
    float _791 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _793 = int(_791);
    float _795 = float(uint(_781));
    int _797 = as_type<int>(_795);
    float _799 = _775;
    float _801 = _777;
    if (_719)
    {
        _693 = _777;
    }
    float _803 = _693;
    float _805 = as_type<float>(_783) * _795;
    float _807 = _803;
    if (_719)
    {
        _797 = 0;
    }
    int _809 = _797;
    float _811 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _813 = int(_811);
    float _815 = float(uint(_787));
    float _817 = as_type<float>(_789) * _815;
    float _819 = _815;
    int _821 = _809;
    if (_719)
    {
        _819 = _775;
    }
    float _823 = _819;
    float _825 = trunc(_805);
    float _827 = precise::max(_825, 0.0);
    uint _830 = uint(_827);
    float _832 = float(uint(_793));
    float _834 = 0.0;
    int _836 = as_type<int>(_832);
    float _838 = _823;
    if (_719)
    {
        _834 = _823;
    }
    float _840 = _834;
    float _842 = trunc(_817);
    float _844 = precise::max(_842, 0.0);
    uint _846 = uint(_844);
    float _848 = float(_813);
    float _850 = 1.0 / _848;
    float _852 = 1.0 / _832;
    float _854 = _848;
    float _856 = _840;
    if (_719)
    {
        _854 = _823;
    }
    float _858 = _854;
    float _860 = _858;
    if (_719)
    {
        _836 = 0;
    }
    int _862 = _836;
    int _864 = _862;
    if (!_719)
    {
        float _866 = in.m_62.x;
        float _868 = in.m_62.y;
        float _870 = in.m_62.z;
        float _872 = _866 * 3.1415927410125732421875;
        float _874 = _872 * 0.15915493667125701904296875;
        float _876 = _868 * 3.1415927410125732421875;
        float _878 = _876 * 0.15915493667125701904296875;
        float _880 = _874 * 6.283185482025146484375;
        float _882 = sin(_880);
        float _884 = _878 * 6.283185482025146484375;
        float _886 = sin(_884);
        _735 = 7.345489978790283203125;
        _799 = _866;
        _838 = _868;
        _769 = 5.839270114898681640625;
        _860 = _870;
        _801 = _868;
        _856 = _882;
        _821 = 1;
        _864 = 2;
        _807 = _886;
    }
    float _888 = _735;
    float _890 = _799;
    float _892 = _838;
    float _894 = _769;
    float _896 = _860;
    float _898 = _801;
    float _900 = _856;
    int _902 = _821;
    int _904 = _864;
    float _906 = _807;
    float _908 = in.m_62.z;
    float _910 = in.m_62.w;
    int _912 = ~_743;
    int _914 = _912 + 1;
    int _916 = _751 * int(_830);
    int _918 = _916 + _781;
    float _920 = _850 * _123;
    float _922 = _888 * _890;
    float _924 = _888 * _892;
    int _926 = _914 * int(_846);
    int _928 = _926 + _787;
    float _930 = float(uint(_918));
    float _932 = floor(_922);
    float _934 = _894 * _896;
    float _936 = _163 * _123;
    float _938 = float(uint(_928));
    float _940 = as_type<float>(_783) * _930;
    float _942 = float(_729);
    float _944 = _890 * 2.0;
    float _946 = trunc(_920);
    int _948 = int(_946);
    float _950 = float(_781);
    float _952 = _890 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _956 = _954 != 0;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _960 = _711 + _958;
    bool _962 = _898 > 0.5;
    int _964 = ~_729;
    int _966 = _964 + 1;
    float _968 = trunc(_940);
    float _970 = precise::max(_968, 0.0);
    uint _972 = uint(_970);
    bool _974 = _910 > 0.5;
    float _976 = as_type<float>(_789) * _938;
    float _978 = -_932;
    float _980 = _922 + _978;
    int _982 = as_type<int>(_852) + (-2);
    bool _984 = _908 > 0.5;
    float _986 = floor(_934);
    float _988 = float(uint(_948));
    bool _990 = _950 >= _942;
    bool _992 = isnan(_950);
    bool _994 = _990 || _992;
    bool _996 = isnan(_942);
    bool _998 = _994 || _996;
    float _1000 = float(_998);
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1004 = _1002 != 0;
    int _1006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1008 = _1006 != 0;
    int _1010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1012 = _1010 != 0;
    float _1014 = as_type<float>(_982) * _988;
    float _1016 = -_213;
    int _1018 = _962 ? as_type<int>(_1016) : as_type<int>(_213);
    float _1020 = trunc(_976);
    float _1022 = precise::max(_1020, 0.0);
    uint _1024 = uint(_1022);
    int _1026 = int(_830) + int(_972);
    int _1028 = ~_743;
    int _1030 = _1028 + 1;
    int _1032 = _966 * _1026;
    int _1034 = _1032 + _781;
    int _1036 = int(_974);
    int _1038 = _984 ? 2 : 0;
    int _1040 = _1036 | _1038;
    int _1042 = _956 ? 4 : 0;
    int _1044 = _1040 | _1042;
    int _1046 = _1004 ? 8 : 0;
    int _1048 = _1044 | _1046;
    int _1050 = _1008 ? 16 : 0;
    int _1052 = _1048 | _1050;
    int _1054 = _1012 ? 32 : 0;
    int _1056 = _1052 | _1054;
    int _1058 = _962 ? 64 : 0;
    int _1060 = _1056 | _1058;
    int _1062 = _1060 & 64;
    float _1064 = trunc(_1014);
    float _1066 = precise::max(_1064, 0.0);
    uint _1068 = uint(_1066);
    float _1070 = -_986;
    float _1072 = _934 + _1070;
    float _1074 = -_217;
    int _1076 = _984 ? as_type<int>(_1074) : as_type<int>(_217);
    bool _1078 = !_956;
    int _1080 = _1078 ? 0 : 1;
    bool _1082 = !_1012;
    float _1084 = _1082 ? _217 : as_type<float>(_1076);
    float _1086 = _980 * _942;
    int _1088 = int(_846) + int(_1024);
    float _1090 = floor(_924);
    float _1092 = _942 * _936;
    float _1094 = float(_743);
    float _1096 = float(_787);
    int _1098 = _1030 * _1088;
    int _1100 = _1098 + _787;
    int _1102 = abs(_1080);
    float _1104 = trunc(_1000);
    int _1106 = int(_1104);
    float _1108 = _1072 * _1094;
    int _1110 = _729 + (-1);
    float _1112 = trunc(_1086);
    int _1114 = int(_1112);
    bool _1116 = !_1008;
    float _1118 = _1116 ? _213 : as_type<float>(_1018);
    int _1120 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1122 = _1120 != 0;
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1126 = _1124 != 0;
    int _1128 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1130 = _1128 != 0;
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    bool _1134 = uint(_1034) >= uint(_729);
    int _1136 = ~_793;
    int _1138 = _1136 + 1;
    float _1140 = trunc(_1092);
    int _1142 = int(_1140);
    bool _1144 = !_1126;
    int _1146 = _1144 ? 0 : 1;
    float _1148 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1132);
    bool _1150 = !_1122;
    int _1152 = _1150 ? 0 : 1;
    int _1154 = _1138 * int(_1068);
    int _1156 = _1154 + _948;
    int _1158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1160 = _1158 != 0;
    float _1162 = _900 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _1164 = uint(_1100) >= uint(_743);
    float _1166 = trunc(_1108);
    int _1168 = int(_1166);
    bool _1170 = _1096 >= _1094;
    bool _1172 = isnan(_1096);
    bool _1174 = _1170 || _1172;
    bool _1176 = isnan(_1094);
    bool _1178 = _1174 || _1176;
    float _1180 = float(_1178);
    float _1182 = _1094 * _936;
    bool _1184 = !_1130;
    int _1186 = _1184 ? 0 : 1;
    float _1188 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1148);
    bool _1190 = !_1160;
    int _1192 = _1190 ? 0 : 1;
    bool _1194 = !_1164;
    int _1196 = _1194 ? 0 : (-1);
    float _1198 = trunc(_1180);
    int _1200 = int(_1198);
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1204 = _1202 != 0;
    int _1206 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1208 = _1206 != 0;
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1212 = _1210 != 0;
    float _1214 = -_1188;
    float _1216 = _1214 + 1.0;
    bool _1218 = !_1134;
    int _1220 = _1218 ? 0 : (-1);
    int _1222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1224 = _1222 != 0;
    int _1226 = ~_1026;
    int _1228 = _1226 + _1220;
    int _1230 = _1228 + 1;
    float _1232 = trunc(_1182);
    int _1234 = int(_1232);
    float _1236 = -_1090;
    float _1238 = _924 + _1236;
    float _1240 = float(uint(_1156));
    bool _1242 = !_1208;
    int _1244 = _1242 ? 0 : 1;
    bool _1246 = _1062 != 0;
    float _1248 = as_type<float>(_982) * _1240;
    float _1250 = floor(_944);
    int _1252 = ~_1088;
    int _1254 = _1252 + _1196;
    int _1256 = _1254 + 1;
    bool _1258 = !_1224;
    int _1260 = _1258 ? 0 : 1;
    int _1262 = _1114 * _1102;
    int _1264 = _1262 + _781;
    bool _1266 = _729 == 0;
    int _1268 = _729 * _1230;
    int _1270 = _1268 + _781;
    bool _1272 = !_1204;
    int _1274 = _1272 ? 0 : 1;
    int _1276 = _743 * _1256;
    int _1278 = _1276 + _787;
    bool _1280 = _743 == 0;
    float _1282 = trunc(_1248);
    float _1284 = precise::max(_1282, 0.0);
    uint _1286 = uint(_1284);
    int _1288 = ~_1106;
    int _1290 = _1288 + 1;
    int _1292 = _1290 + 1;
    bool _1294 = !_1266;
    int _1296 = _1294 ? _1270 : (-1);
    int _1298 = ~_1200;
    int _1300 = _1298 + 1;
    int _1302 = _1300 + 1;
    bool _1304 = !_1280;
    int _1306 = _1304 ? _1278 : (-1);
    int _1308 = _1296 * _1292;
    int _1310 = abs(_1146);
    int _1312 = _743 + (-1);
    int _1314 = _1306 * _1302;
    int _1316 = abs(_1244);
    int _1318 = _1106 * _1110;
    int _1320 = _1318 + _1308;
    int _1322 = abs(_1152);
    int _1324 = _1200 * _1312;
    int _1326 = _1324 + _1314;
    int _1328 = _1320 * _1310;
    int _1330 = abs(_1186);
    int _1332 = abs(_1260);
    int _1334 = _1326 * _1316;
    int _1336 = abs(_1192);
    int _1338 = _1168 * _1332;
    int _1340 = _1338 + _787;
    int _1342 = _1142 * _1322;
    int _1344 = _1342 + _1328;
    int _1346 = int(_1068) + int(_1286);
    int _1348 = ~_793;
    int _1350 = _1348 + 1;
    int _1352 = _1264 * _1330;
    int _1354 = _1352 + _1344;
    int _1356 = abs(_1274);
    int _1358 = _1350 * _1346;
    int _1360 = _1358 + _948;
    float _1362 = -_217;
    int _1364 = _974 ? as_type<int>(_1362) : as_type<int>(_217);
    int _1366 = _1114 * _1336;
    int _1368 = _1366 + _1354;
    bool _1370 = uint(_1360) >= uint(_793);
    float _1372 = float(uint(_1368));
    int _1374 = _1234 * _1356;
    int _1376 = _1374 + _1334;
    float _1378 = float(_793);
    float _1380 = -_213;
    int _1382 = _984 ? as_type<int>(_1380) : as_type<int>(_213);
    float _1384 = as_type<float>(_783) * _1372;
    float _1386 = float(_948);
    float _1388 = _1238 * _1378;
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1392 = _1390 != 0;
    float _1394 = trunc(_1384);
    float _1396 = precise::max(_1394, 0.0);
    uint _1398 = uint(_1396);
    bool _1400 = _1386 >= _1378;
    bool _1402 = isnan(_1386);
    bool _1404 = _1400 || _1402;
    bool _1406 = isnan(_1378);
    bool _1408 = _1404 || _1406;
    float _1410 = float(_1408);
    float _1412 = _1378 * _936;
    bool _1414 = !_1212;
    int _1416 = _1414 ? 0 : 1;
    int _1418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1420 = _1418 != 0;
    bool _1422 = !_1392;
    int _1424 = _1422 ? 0 : 1;
    float _1426 = trunc(_1410);
    int _1428 = int(_1426);
    bool _1430 = !_1420;
    int _1432 = _1430 ? 0 : 1;
    int _1434 = abs(_1416);
    int _1436 = abs(_1424);
    bool _1438 = !_1004;
    float _1440 = _1438 ? _217 : as_type<float>(_1364);
    int _1442 = _1340 * _1434;
    int _1444 = _1442 + _1376;
    bool _1446 = !_1370;
    int _1448 = _1446 ? 0 : (-1);
    float _1450 = trunc(_1412);
    int _1452 = int(_1450);
    int _1454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1456 = _1454 != 0;
    int _1458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1460 = _1458 != 0;
    int _1462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1464 = _1462 != 0;
    int _1466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1468 = _1466 != 0;
    int _1470 = ~_1346;
    int _1472 = _1470 + _1448;
    int _1474 = _1472 + 1;
    bool _1476 = !_1460;
    int _1478 = _1476 ? 0 : 1;
    int _1480 = _1168 * _1436;
    int _1482 = _1480 + _1444;
    int _1484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1486 = _1484 != 0;
    int _1488 = _793 * _1474;
    int _1490 = _1488 + _948;
    int _1492 = ~_729;
    int _1494 = _1492 + 1;
    float _1496 = trunc(_1388);
    int _1498 = int(_1496);
    bool _1500 = !_1456;
    int _1502 = _1500 ? 0 : 1;
    bool _1504 = _793 == 0;
    int _1506 = _1494 * int(_1398);
    int _1508 = _1506 + _1368;
    float _1510 = float(uint(_1482));
    int _1512 = ~_1428;
    int _1514 = _1512 + 1;
    int _1516 = _1514 + 1;
    bool _1518 = !_1504;
    int _1520 = _1518 ? _1490 : (-1);
    float _1522 = as_type<float>(_789) * _1510;
    float _1524 = float(uint(_1508));
    float _1526 = _1510;
    float _1528 = as_type<float>(_1368);
    float _1530 = as_type<float>(_1068);
    if (_1486)
    {
        float _1532 = in.m_62.w;
        _1526 = _1532;
    }
    float _1534 = _1526;
    int _1536 = abs(_1478);
    int _1538 = _1520 * _1516;
    int _1540 = _793 + (-1);
    float _1542 = as_type<float>(_783) * _1524;
    float _1544 = trunc(_1522);
    float _1546 = precise::max(_1544, 0.0);
    uint _1548 = uint(_1546);
    int _1550 = abs(_1432);
    int _1552 = abs(_1502);
    int _1554 = _1428 * _1540;
    int _1556 = _1554 + _1538;
    float _1558 = trunc(_1542);
    float _1560 = precise::max(_1558, 0.0);
    uint _1562 = uint(_1560);
    int _1564 = _1556 * _1536;
    int _1566 = ~_743;
    int _1568 = _1566 + 1;
    int _1570 = _1498 * _1550;
    int _1572 = _1570 + _948;
    bool _1574 = _729 == 0;
    int _1576 = _1452 * _1552;
    int _1578 = _1576 + _1564;
    bool _1580 = !_1464;
    int _1582 = _1580 ? 0 : 1;
    int _1584 = ~_729;
    int _1586 = _1584 + 1;
    int _1588 = _1568 * int(_1548);
    int _1590 = _1588 + _1482;
    float _1592 = as_type<float>(_1550);
    if (_1486)
    {
        float _1594 = _1534 * 3.1415927410125732421875;
        _1592 = _1594;
    }
    float _1596 = _1592;
    int _1598 = abs(_1582);
    bool _1600 = !_1468;
    int _1602 = _1600 ? 0 : 1;
    float _1604 = _1596;
    if (_1486)
    {
        float _1606 = _1596 * 0.15915493667125701904296875;
        _1604 = _1606;
    }
    float _1608 = _1604;
    int _1610 = int(_1398) + int(_1562);
    float _1612 = float(uint(_1590));
    int _1614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1616 = _1614 != 0;
    int _1618 = _1586 * _1610;
    int _1620 = _1618 + _1368;
    int _1622 = abs(_1602);
    float _1624 = as_type<float>(_789) * _1612;
    float _1626 = _1608;
    if (_1486)
    {
        float _1628 = _1608 * 6.283185482025146484375;
        float _1630 = sin(_1628);
        _1626 = _1630;
    }
    float _1632 = _1626;
    float _1634 = 0.0;
    if (!_1486)
    {
        _1634 = _213;
    }
    float _1636 = _1634;
    bool _1638 = uint(_1620) >= uint(_729);
    int _1640 = _1572 * _1598;
    int _1642 = _1640 + _1578;
    float _1644 = float(uint(_1264));
    float _1646 = trunc(_1624);
    float _1648 = precise::max(_1646, 0.0);
    uint _1650 = uint(_1648);
    bool _1652 = !_1638;
    int _1654 = _1652 ? 0 : (-1);
    float _1656 = as_type<float>(_1562);
    float _1658 = _1636;
    if (_1616)
    {
        float _1660 = in.m_62.x;
        _1656 = _1660;
    }
    float _1662 = _1656;
    int _1664 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1666 = _1664 != 0;
    float _1668 = as_type<float>(_783) * _1644;
    int _1670 = ~_1610;
    int _1672 = _1670 + _1654;
    int _1674 = _1672 + 1;
    int _1676 = _1498 * _1622;
    int _1678 = _1676 + _1642;
    bool _1680 = !_1666;
    float _1682 = _1680 ? _213 : as_type<float>(_1382);
    bool _1684 = _1666;
    if (_1486)
    {
        bool _1686 = _1632 > 0.5;
        _1684 = _1686;
    }
    bool _1688 = _1684;
    float _1690 = trunc(_1668);
    float _1692 = precise::max(_1690, 0.0);
    uint _1694 = uint(_1692);
    int _1696 = _729 * _1674;
    int _1698 = _1696 + _1368;
    float _1700 = float(uint(_1678));
    if (_1486)
    {
        float _1702 = -_213;
        float _1704 = _1688 ? _1702 : _213;
        _1658 = _1704;
    }
    float _1706 = _1658;
    bool _1708 = !_1574;
    int _1710 = _1708 ? _1698 : (-1);
    int _1712 = int(_1548) + int(_1650);
    float _1714 = as_type<float>(_982) * _1700;
    int _1716 = _1710 & 3;
    bool _1718 = _1716 != 0;
    int _1720 = _1710 & 3;
    bool _1722 = _1720 != 0;
    float _1724 = trunc(_1714);
    float _1726 = precise::max(_1724, 0.0);
    uint _1728 = uint(_1726);
    int _1730 = ~_729;
    int _1732 = _1730 + 1;
    int _1734 = _1718 ? 0 : 1;
    float _1736 = _1706;
    if (_1616)
    {
        float _1738 = _1662 * 3.1415927410125732421875;
        _1528 = _1738;
    }
    float _1740 = _1528;
    bool _1742 = uint(_1720) > 1u;
    int _1744 = _1732 * int(_1694);
    int _1746 = _1744 + _1264;
    float _1748 = float(uint(_1340));
    float _1750 = _1740;
    if (_1616)
    {
        float _1752 = _1740 * 0.15915493667125701904296875;
        _1750 = _1752;
    }
    float _1754 = _1750;
    int _1756 = ~_743;
    int _1758 = _1756 + 1;
    float _1760 = float(uint(_1746));
    float _1762 = as_type<float>(_789) * _1748;
    int _1764 = ~_793;
    int _1766 = _1764 + 1;
    int _1768 = _1758 * _1712;
    int _1770 = _1768 + _1482;
    int _1772 = ~_1734;
    int _1774 = _1772 + 1;
    int _1776 = _1774 + 1;
    float _1778 = as_type<float>(_783) * _1760;
    float _1780 = trunc(_1762);
    float _1782 = precise::max(_1780, 0.0);
    uint _1784 = uint(_1782);
    int _1786 = _1766 * int(_1728);
    int _1788 = _1786 + _1678;
    int _1790 = _1776;
    if (!_1742)
    {
        int _1792 = ~_1734;
        int _1794 = _1792 + 1;
        _1790 = _1794;
    }
    int _1796 = _1790;
    float _1798 = -_217;
    int _1800 = _1246 ? as_type<int>(_1798) : as_type<int>(_217);
    bool _1802 = uint(_1720) >= 2u;
    bool _1804 = uint(_1770) >= uint(_743);
    float _1806 = _1754;
    if (_1616)
    {
        float _1808 = _1754 * 6.283185482025146484375;
        float _1810 = sin(_1808);
        _1806 = _1810;
    }
    float _1812 = _1806;
    float _1814 = float(uint(_1788));
    int _1816 = _1802 ? 0 : 1;
    bool _1818 = _1720 != 3;
    float _1820 = as_type<float>(_982) * _1814;
    bool _1822 = !_1804;
    int _1824 = _1822 ? 0 : (-1);
    float _1826 = trunc(_1778);
    float _1828 = precise::max(_1826, 0.0);
    uint _1830 = uint(_1828);
    int _1832 = ~_743;
    int _1834 = _1832 + 1;
    int _1836 = ~_1712;
    int _1838 = _1836 + _1824;
    int _1840 = _1838 + 1;
    int _1842 = ~_1816;
    int _1844 = _1842 + 1;
    int _1846 = _1844 + 1;
    int _1848 = _1834 * int(_1784);
    int _1850 = _1848 + _1340;
    float _1852 = 0.0;
    int _1854 = _1846;
    bool _1856 = _1818;
    if (!_1616)
    {
        _1852 = _217;
    }
    float _1858 = _1852;
    float _1860 = trunc(_1820);
    float _1862 = precise::max(_1860, 0.0);
    uint _1864 = uint(_1862);
    int _1866 = _743 * _1840;
    int _1868 = _1866 + _1482;
    float _1870 = _1858;
    if (_1818)
    {
        int _1872 = ~_1816;
        int _1874 = _1872 + 1;
        _1854 = _1874;
    }
    int _1876 = _1854;
    if (_1616)
    {
        bool _1878 = _1812 > 0.5;
        _1856 = _1878;
    }
    bool _1880 = _1856;
    bool _1882 = !_1280;
    int _1884 = _1882 ? _1868 : (-1);
    float _1886 = float(uint(_1850));
    if (_1616)
    {
        float _1888 = -_217;
        float _1890 = _1880 ? _1888 : _217;
        _1870 = _1890;
    }
    float _1892 = _1870;
    int _1894 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1896 = _1894 != 0;
    float _1898 = as_type<float>(_789) * _1886;
    int _1900 = _1884 & 3;
    bool _1902 = _1900 != 0;
    int _1904 = int(_1694) + int(_1830);
    bool _1906 = !_1896;
    float _1908 = _1906 ? _217 : as_type<float>(_1800);
    float _1910 = trunc(_1898);
    float _1912 = precise::max(_1910, 0.0);
    uint _1914 = uint(_1912);
    bool _1916 = uint(_1900) > 1u;
    int _1918 = int(_1728) + int(_1864);
    int _1920 = ~_793;
    int _1922 = _1920 + 1;
    int _1924 = _1884 & 3;
    bool _1926 = _1924 != 0;
    int _1928 = ~_729;
    int _1930 = _1928 + 1;
    int _1932 = _1922 * _1918;
    int _1934 = _1932 + _1678;
    int _1936 = _1926 ? 0 : 1;
    float _1938 = float(uint(_1572));
    int _1940 = _1930 * _1904;
    int _1942 = _1940 + _1264;
    int _1944 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1946 = _1944 != 0;
    int _1948 = ~_1936;
    int _1950 = _1948 + 1;
    int _1952 = _1950 + 1;
    float _1954 = as_type<float>(_982) * _1938;
    bool _1956 = !_1946;
    int _1958 = _1956 ? 0 : 1;
    bool _1960 = uint(_1934) >= uint(_793);
    int _1962 = _1952;
    float _1964 = as_type<float>(_1864);
    if (!_1916)
    {
        int _1966 = ~_1936;
        int _1968 = _1966 + 1;
        _1962 = _1968;
    }
    int _1970 = _1962;
    float _1972 = trunc(_1954);
    float _1974 = precise::max(_1972, 0.0);
    uint _1976 = uint(_1974);
    bool _1978 = uint(_1942) >= uint(_729);
    bool _1980 = !_1960;
    int _1982 = _1980 ? 0 : (-1);
    bool _1984 = _1900 != 3;
    int _1986 = ~_743;
    int _1988 = _1986 + 1;
    bool _1990 = !_1978;
    int _1992 = _1990 ? 0 : (-1);
    bool _1994 = uint(_1900) >= 2u;
    int _1996 = int(_1784) + int(_1914);
    int _1998 = ~_1918;
    int _2000 = _1998 + _1982;
    int _2002 = _2000 + 1;
    int _2004 = ~_793;
    int _2006 = _2004 + 1;
    int _2008 = _793 * _2002;
    int _2010 = _2008 + _1678;
    int _2012 = _1994 ? 0 : 1;
    int _2014 = _1988 * _1996;
    int _2016 = _2014 + _1340;
    int _2018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2020 = _2018 != 0;
    int _2022 = ~_2012;
    int _2024 = _2022 + 1;
    int _2026 = _2024 + 1;
    int _2028 = _2026;
    float _2030 = as_type<float>(_2010);
    if (_1984)
    {
        int _2032 = ~_2012;
        int _2034 = _2032 + 1;
        _2028 = _2034;
    }
    int _2036 = _2028;
    int _2038 = _2006 * int(_1976);
    int _2040 = _2038 + _1572;
    int _2042 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2044 = _2042 != 0;
    bool _2046 = !_2020;
    int _2048 = _2046 ? 0 : 1;
    bool _2050 = uint(_2016) >= uint(_743);
    bool _2052 = !_1504;
    int _2054 = _2052 ? _2010 : (-1);
    bool _2056 = !_2044;
    int _2058 = _2056 ? 0 : 1;
    bool _2060 = !_2050;
    int _2062 = _2060 ? 0 : (-1);
    int _2064 = _2054 & 3;
    bool _2066 = _2064 != 0;
    int _2068 = _2054 & 3;
    bool _2070 = _2068 != 0;
    float _2072 = float(uint(_2040));
    int _2074 = _2066 ? 0 : 1;
    bool _2076 = uint(_2068) > 1u;
    float _2078 = as_type<float>(_982) * _2072;
    int _2080 = ~_2074;
    int _2082 = _2080 + 1;
    int _2084 = _2082 + 1;
    int _2086 = ~_793;
    int _2088 = _2086 + 1;
    float _2090 = trunc(_2078);
    float _2092 = precise::max(_2090, 0.0);
    uint _2094 = uint(_2092);
    float _2096 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2098 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    int _2100 = _2084;
    float _2102 = as_type<float>(_1976);
    if (!_2076)
    {
        int _2104 = ~_2074;
        int _2106 = _2104 + 1;
        _2100 = _2106;
    }
    int _2108 = _2100;
    float _2110 = -_2096;
    float _2112 = fma(_1162, 2.0, _2110);
    bool _2114 = uint(_2068) >= 2u;
    float _2116 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2118 = -_123;
    float _2120 = fma(_2118, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2112);
    int _2122 = _2114 ? 0 : 1;
    bool _2124 = _2068 != 3;
    float _2126 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2128 = int(_1976) + int(_2094);
    int _2130 = ~_2122;
    int _2132 = _2130 + 1;
    int _2134 = _2132 + 1;
    int _2136 = _2088 * _2128;
    int _2138 = _2136 + _1572;
    float _2140 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2142 = _2134;
    if (_2124)
    {
        int _2144 = ~_2122;
        int _2146 = _2144 + 1;
        _2142 = _2146;
    }
    int _2148 = _2142;
    float _2150 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2152 = uint(_2138) >= uint(_793);
    float _2154 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2156 = !_2152;
    int _2158 = _2156 ? 0 : (-1);
    float _2160 = -_2154;
    float _2162 = fma(_952, 2.0, _2160);
    bool _2164 = _890 > 0.5;
    float _2166 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2168 = _2166 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2170 = -_123;
    float _2172 = fma(_2170, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2162);
    float _2174 = -_213;
    int _2176 = _2164 ? as_type<int>(_2174) : as_type<int>(_213);
    float _2178 = 1.0 / _2168;
    bool _2180 = _902 != 1;
    float _2182 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2184 = in.m_48.x;
    float _2186 = in.m_48.y;
    float _2188 = in.m_48.z;
    int _2190 = abs(_2036);
    float _2192 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _2194 = ~_1904;
    int _2196 = _2194 + _1992;
    int _2198 = _2196 + 1;
    int _2200 = abs(_1796);
    float _2202 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2192);
    float _2204 = 0.0;
    if (!_2180)
    {
        _2204 = _898;
    }
    float _2206 = _2204;
    int _2208 = _729 * _2198;
    int _2210 = _2208 + _1264;
    float _2212 = 0.0;
    float _2214 = _2206;
    if (!_2180)
    {
        _2212 = _898;
    }
    float _2216 = _2212;
    float _2218 = _2216;
    if (!_2180)
    {
        _1964 = _908;
    }
    float _2220 = _1964;
    float _2222 = _2220;
    if (!_2180)
    {
        _1530 = _908;
    }
    float _2224 = _1530;
    float _2226 = _2224;
    if (_2180)
    {
        _2214 = _890;
    }
    float _2228 = _2214;
    if (_2180)
    {
        _2218 = _890;
    }
    float _2230 = _2218;
    if (_2180)
    {
        _2222 = _898;
    }
    float _2232 = _2222;
    float _2234 = _2186 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    if (_2180)
    {
        _2226 = _898;
    }
    float _2236 = _2226;
    float _2238 = _2186 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _2240 = _904 != 2;
    float _2242 = fma(_2184, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2234);
    float _2244 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2246 = _2186 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2248 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2250 = log2(_2248);
    float _2252 = fma(_2184, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2238);
    float _2254 = fma(_2184, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2246);
    float _2256 = _898 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2258 = fma(_2230, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2126);
    float _2260 = fma(_2188, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2252);
    float _2262 = fma(_2256, -2.0, _2244);
    float _2264 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    if (_2240)
    {
        _2102 = _890;
    }
    float _2266 = _2102;
    float _2268 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2258);
    float _2270 = _2266;
    if (_2240)
    {
        _2030 = _898;
    }
    float _2272 = _2030;
    float _2274 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2264);
    float _2276 = _2272;
    if (!_2240)
    {
        _2270 = _908;
    }
    float _2278 = _2270;
    float _2280 = _906 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2282 = _2250 * _123;
    if (!_2240)
    {
        _2276 = _890;
    }
    float _2284 = _2276;
    float _2286 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2262);
    int _2288 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2290 = _2288 != 0;
    float _2292 = fma(_2280, -2.0, _2098);
    float _2294 = exp2(_2282);
    bool _2296 = !_2290;
    float _2298 = _2296 ? _213 : as_type<float>(_2176);
    float _2300 = _2228 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _2302 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2304 = isnan(0.0);
    bool _2306 = _2302 || _2304;
    bool _2308 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2310 = _2306 || _2308;
    float _2312 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2314 = -_2116;
    float _2316 = fma(_2300, 2.0, _2314);
    float _2318 = _2278 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2320 = fma(_2236, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2312);
    float _2322 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2324 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2322;
    float _2326 = _2232 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2328 = -_2140;
    float _2330 = fma(_2318, 2.0, _2328);
    float _2332 = _2324 * _2178;
    float _2334 = -_2294;
    float _2336 = _2334 + 1.0;
    float _2338 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2340 = _2338 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2342 = fma(_2326, -2.0, _2150);
    float _2344 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2346 = _2344 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2348 = _2310 ? _2336 : 0.0;
    float _2350 = 1.0 / _2340;
    bool _2352 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2354 = isnan(1.0);
    bool _2356 = _2352 || _2354;
    bool _2358 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2360 = _2356 || _2358;
    float _2362 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2364 = 1.0 + _2362;
    float _2366 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2368 = _2366 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2370 = _2284 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2372 = 1.0 / _2364;
    float _2374 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2376 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2378 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2380 = fma(_2370, -2.0, _2182);
    float _2382 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2374);
    float _2384 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2376);
    float _2386 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2378);
    float _2388 = 1.0 / _2368;
    float _2390 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2392 = _2390 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2394 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2382);
    float _2396 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2384);
    float _2398 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2202);
    float _2400 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2386);
    float _2402 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2274);
    float _2404 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2292);
    float _2406 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2320);
    float _2408 = -_123;
    float _2410 = fma(_2408, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2316);
    float _2412 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2342);
    float _2414 = -_123;
    float _2416 = fma(_2414, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2330);
    float _2418 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2380);
    if (_2360)
    {
        float _2420 = _2348 * _2372;
        _133 = _2420;
    }
    float _2422 = _133;
    float _2424 = _898 * 2.0;
    bool _2426 = _1250 >= 0.0;
    bool _2428 = isnan(_1250);
    bool _2430 = _2426 || _2428;
    bool _2432 = isnan(0.0);
    bool _2434 = _2430 || _2432;
    float _2436 = 1.0 / _2392;
    float _2438 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2440 = _2438 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _2442 = _2434 ? 0 : 1;
    float _2444 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2446 = _2444 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _2448 = _1250 > 0.0;
    float _2450 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2452 = _2450 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2454 = floor(_2424);
    float _2456 = _2446 * _2388;
    float _2458 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2460 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2458;
    float _2462 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2464 = _2462 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2466 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2468 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2466;
    float _2470 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2472 = _2470 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2474 = fma(_2188, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2254);
    float _2476 = -_2406;
    float _2478 = _2476 + 1.0;
    float _2480 = 1.0 / _2346;
    float _2482 = _2472 * _2350;
    float _2484 = _2468 * _2436;
    int _2486 = ~_2442;
    int _2488 = _2486 + 1;
    int _2490 = _2488 + 1;
    float _2492 = -_2398;
    float _2494 = _2492 + 1.0;
    int _2496 = _2490;
    if (!_2448)
    {
        int _2498 = ~_2442;
        int _2500 = _2498 + 1;
        _2496 = _2500;
    }
    int _2502 = _2496;
    float _2504 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2506 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2504;
    float _2508 = 1.0 / _2440;
    bool _2510 = _2454 >= 0.0;
    bool _2512 = isnan(_2454);
    bool _2514 = _2510 || _2512;
    bool _2516 = isnan(0.0);
    bool _2518 = _2514 || _2516;
    float _2520 = -_2400;
    float _2522 = _2520 + 1.0;
    int _2524 = abs(_2108);
    int _2526 = _2518 ? 0 : 1;
    bool _2528 = _2454 > 0.0;
    float _2530 = 1.0 / _2452;
    float _2532 = _2460 * _2480;
    bool _2534 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2536 = isnan(_711);
    bool _2538 = _2534 || _2536;
    bool _2540 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2542 = _2538 || _2540;
    float _2544 = float(_2542);
    bool _2546 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2548 = isnan(_711);
    bool _2550 = _2546 || _2548;
    bool _2552 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2554 = _2550 || _2552;
    float _2556 = float(_2554);
    int _2558 = ~_2524;
    int _2560 = _2558 + 1;
    int _2562 = _2560 + 1;
    float _2564 = _2464 * _2508;
    int _2566 = ~_1996;
    int _2568 = _2566 + _2062;
    int _2570 = _2568 + 1;
    float _2572 = _908 * 2.0;
    int _2574 = ~_2526;
    int _2576 = _2574 + 1;
    int _2578 = _2576 + 1;
    int _2580 = _2578;
    if (!_2528)
    {
        int _2582 = ~_2526;
        int _2584 = _2582 + 1;
        _2580 = _2584;
    }
    int _2586 = _2580;
    int _2588 = _743 * _2570;
    int _2590 = _2588 + _1340;
    bool _2592 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2594 = isnan(_711);
    bool _2596 = _2592 || _2594;
    bool _2598 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2600 = _2596 || _2598;
    float _2602 = float(_2600);
    float _2604 = _2506 * _2530;
    bool _2606 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2608 = isnan(_711);
    bool _2610 = _2606 || _2608;
    bool _2612 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2614 = _2610 || _2612;
    float _2616 = float(_2614);
    float _2618 = -_2544;
    float _2620 = _2618 + 1.0;
    float _2622 = floor(_2572);
    bool _2624 = !_1280;
    int _2626 = _2624 ? _2590 : (-1);
    float _2628 = _2616 * _2620;
    float _2630 = -_2616;
    float _2632 = _2630 + 1.0;
    float _2634 = -_2556;
    float _2636 = _2634 + 1.0;
    bool _2638 = !_1902;
    int _2640 = _2638 ? 0 : 1;
    int _2642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2644 = _2642 != 0;
    int _2646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2648 = _2646 != 0;
    int _2650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2652 = _2650 != 0;
    float _2654 = _2602 * _2636;
    int _2656 = _1884 >> 31;
    float _2658 = -_2602;
    float _2660 = _2658 + 1.0;
    bool _2662 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2664 = isnan(_711);
    bool _2666 = _2662 || _2664;
    bool _2668 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2670 = _2666 || _2668;
    float _2672 = float(_2670);
    float _2674 = _2556 * _2632;
    int _2676 = _2656 & 3;
    bool _2678 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2680 = isnan(_711);
    bool _2682 = _2678 || _2680;
    bool _2684 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2686 = _2682 || _2684;
    float _2688 = float(_2686);
    float _2690 = -_2672;
    float _2692 = _2690 + 1.0;
    int _2694 = _1884 + _2676;
    float _2696 = _2672 * _2660;
    bool _2698 = _2622 >= 0.0;
    bool _2700 = isnan(_2622);
    bool _2702 = _2698 || _2700;
    bool _2704 = isnan(0.0);
    bool _2706 = _2702 || _2704;
    float _2708 = _2688 * _2692;
    int _2710 = _2694 >> 2;
    float _2712 = -_2688;
    float _2714 = _2712 + 1.0;
    bool _2716 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2718 = isnan(_711);
    bool _2720 = _2716 || _2718;
    bool _2722 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2724 = _2720 || _2722;
    float _2726 = float(_2724);
    float _2728 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2730 = _711 + _2728;
    int _2732 = _2706 ? 0 : 1;
    int _2734 = _2710 << 4;
    int _2736 = _2734 + 656;
    float _2738 = fma(_2332, _2730, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2740 = _2622 > 0.0;
    float _2742 = _2726 * _2714;
    float _2744 = -_2726;
    float _2746 = _2744 + 1.0;
    float _2748 = fma(_2188, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2242);
    bool _2750 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2752 = isnan(_711);
    bool _2754 = _2750 || _2752;
    bool _2756 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2758 = _2754 || _2756;
    float _2760 = float(_2758);
    uint _2762 = uint(int(uint(_2736) >> uint(2)));
    uint _2764 = uint(int(uint(int(_2762)) >> uint(2)));
    int _2766 = int(_2762) & 3;
    float _2768 = (*spvDescriptorSet0.vp_c9)._m0[int(_2764)][_2766];
    int _2770 = int(_2762) + 1;
    uint _2772 = uint(int(uint(_2770) >> uint(2)));
    int _2774 = _2770 & 3;
    float _2776 = (*spvDescriptorSet0.vp_c9)._m0[int(_2772)][_2774];
    float _2778 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2780 = _711 + _2778;
    float _2782 = _2748 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _2784 = abs(_2640);
    float _2786 = _2760 * _2746;
    float _2788 = fma(_2456, _960, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2790 = -_2760;
    float _2792 = _2790 + 1.0;
    float _2794 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2796 = _711 + _2794;
    float _2798 = _2738 * _2786;
    float _2800 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2802 = _711 + _2800;
    float _2804 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2806 = _711 + _2804;
    float _2808 = fma(_2482, _2796, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2810 = fma(_2792, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2798);
    float _2812 = fma(_2484, _2780, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2814 = fma(_2532, _2802, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2816 = _898 + _890;
    int _2818 = _2736 + 8;
    uint _2820 = uint(int(uint(_2818) >> uint(2)));
    uint _2822 = uint(int(uint(int(_2820)) >> uint(2)));
    int _2824 = int(_2820) & 3;
    float _2826 = (*spvDescriptorSet0.vp_c9)._m0[int(_2822)][_2824];
    int _2828 = int(_2820) + 1;
    uint _2830 = uint(int(uint(_2828) >> uint(2)));
    int _2832 = _2828 & 3;
    float _2834 = (*spvDescriptorSet0.vp_c9)._m0[int(_2830)][_2832];
    float _2836 = fma(_2788, _2742, _2810);
    float _2838 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2840 = _711 + _2838;
    int _2842 = ~_2732;
    int _2844 = _2842 + 1;
    int _2846 = _2844 + 1;
    float _2848 = _898 + (-0.5);
    float _2850 = fma(_2812, _2708, _2836);
    float _2852 = fma(_2564, _2840, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2854 = _2260 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2856 = _2846;
    if (!_2740)
    {
        int _2858 = ~_2732;
        int _2860 = _2858 + 1;
        _2856 = _2860;
    }
    int _2862 = _2856;
    float _2864 = _898 + _908;
    float _2866 = fma(_2808, _2696, _2850);
    float _2868 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2870 = _2854 + _2868;
    float _2872 = _2474 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2874 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2876 = _2782 + _2874;
    int _2878 = abs(_1970);
    float _2880 = _2870 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2882 = fma(_2604, _2806, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2884 = _890 + _908;
    int _2886 = ~_2878;
    int _2888 = _2886 + 1;
    int _2890 = _2888 + 1;
    float _2892 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2880);
    bool _2894 = !_1722;
    int _2896 = _2894 ? 0 : 1;
    float _2898 = _890 + (-0.5);
    bool _2900 = _1900 != 3;
    float _2902 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2904 = int(_2902);
    float _2906 = _2816 + (-1.0);
    float _2908 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2910 = _2872 + _2908;
    float _2912 = fma(_2814, _2654, _2866);
    int _2914 = abs(_2048);
    float _2916 = _1706 + 0.5;
    float _2918 = fma(_2906, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2920 = _2890 * as_type<int>(_2776);
    int _2922 = ~_2784;
    int _2924 = _2922 + 1;
    int _2926 = _2924 + 1;
    float _2928 = fma(_2910, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2892);
    bool _2930 = !_2900;
    int _2932 = _2930 ? 0 : (-1);
    float _2934 = fma(_2916, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2120);
    float _2936 = fma(_2852, _2674, _2912);
    int _2938 = _2926 * as_type<int>(_2768);
    int _2940 = _2938 + _2920;
    int _2942 = abs(_2932);
    float _2944 = fma(_2882, _2628, _2936);
    int _2946 = ~_2190;
    int _2948 = _2946 + 1;
    int _2950 = _2948 + 1;
    int _2952 = ~_2942;
    int _2954 = _2952 + 1;
    int _2956 = _2954 + 1;
    float _2958 = fma(_2544, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2944);
    float _2960 = float(uint(_2904));
    int _2962 = _2950 * as_type<int>(_2826);
    int _2964 = _2962 + _2940;
    int _2966 = ~_2914;
    int _2968 = _2966 + 1;
    int _2970 = _2968 + 1;
    float _2972 = _1892 + (-0.5);
    bool _2974 = _2928 >= 0.0;
    int _2976 = _2956 * as_type<int>(_2834);
    int _2978 = _2976 + _2964;
    float _2980 = 1.0 / _2960;
    float _2982 = -_2972;
    float _2984 = -_2404;
    float _2986 = fma(_2982, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2984);
    float _2988 = _2298 + 0.5;
    int _2990 = _2978 * _2970;
    float _2992 = -_2402;
    float _2994 = _2992 + 1.0;
    float _2996 = _1908 + (-0.5);
    float _2998 = fma(_2988, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2172);
    float _3000 = -_1216;
    float _3002 = fma(_3000, _1706, _2934);
    float _3004 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3006 = _2626 * _2914;
    int _3008 = _3006 + _2990;
    float _3010 = fma(_2994, _1892, _2986);
    if (_2974)
    {
        _1736 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3012 = _1736;
    float _3014 = _1682 + 0.5;
    float _3016 = -_2996;
    float _3018 = -_2286;
    float _3020 = fma(_3016, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3018);
    float _3022 = float(uint(_3008));
    float _3024 = _1440 + (-0.5);
    float _3026 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3028 = as_type<int>(_2980) + (-2);
    int _3030 = as_type<int>(_2980);
    if (_2974)
    {
        float _3032 = _3012 * 5.0;
        _3030 = as_type<int>(_3032);
    }
    int _3034 = _3030;
    out.m_70.x = _3002;
    out.m_70.y = _3010;
    bool _3036 = !_2644;
    int _3038 = _3036 ? 0 : 1;
    float _3040 = as_type<float>(_3028) * _3022;
    int _3042 = abs(_2896);
    float _3044 = _3004 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_2974)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9476 = as_type<float>(_3034);
        out.gl_Position.z = _9476;
    }
    float _3046 = trunc(_3040);
    float _3048 = precise::max(_3046, 0.0);
    uint _3050 = uint(_3048);
    int _3052 = abs(_3038);
    float _3054 = fma(_3044, _3014, _2410);
    int _3056 = ~_2904;
    int _3058 = _3056 + 1;
    out.m_72.x = _2958;
    int _3060 = abs(_1958);
    float _3062 = _3026 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3064 = abs(_2904);
    if (_2974)
    {
        out.m_55.x = 0.0;
    }
    float _3066 = -_3062;
    float _3068 = -_2412;
    float _3070 = fma(_3066, _3024, _3068);
    float _3072 = _2870 * _2870;
    int _3074 = _1710 >> 31;
    float _3076 = fma(_1440, _2478, _3070);
    float _3078 = float(uint(_3064));
    float _3080 = fma(_2876, _2876, _3072);
    int _3082 = _2054 >> 31;
    int _3084 = _3058 * int(_3050);
    int _3086 = _3084 + _3008;
    int _3088 = _3074 & 3;
    float _3090 = 1.0 / _3078;
    int _3092 = _3082 & 3;
    int _3094 = _1710 + _3088;
    float _3096 = fma(_2910, _2910, _3080);
    float _3098 = -_2394;
    float _3100 = _3098 + 1.0;
    int _3102 = _2054 + _3092;
    float _3104 = _551 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3106 = rsqrt(_3096);
    float _3108 = -_3100;
    float _3110 = fma(_2298, _3108, _2998);
    int _3112 = abs(_3008);
    float _3114 = _3104 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _3116 = _3094 >> 2;
    int _3118 = _3102 >> 2;
    float _3120 = -_2268;
    float _3122 = _3120 + 1.0;
    int _3124 = as_type<int>(_3090) + (-2);
    float _3126 = -_2396;
    float _3128 = _3126 + 1.0;
    float _3130 = float(uint(_3112));
    float _3132 = -_3122;
    float _3134 = fma(_1682, _3132, _3054);
    float _3136 = float(uint(_3086));
    float _3138 = fma(_1908, _3128, _3020);
    int _3140 = _3116 << 4;
    int _3142 = _3140 + 368;
    float _3144 = as_type<float>(_3124) * _3130;
    int _3146 = _3118 << 4;
    int _3148 = _3146 + 800;
    float _3150 = as_type<float>(_3028) * _3136;
    float _3152 = _3114 * _3106;
    uint _3154 = uint(int(uint(_3142) >> uint(2)));
    uint _3156 = uint(int(uint(int(_3154)) >> uint(2)));
    int _3158 = int(_3154) & 3;
    float _3160 = (*spvDescriptorSet0.vp_c9)._m0[int(_3156)][_3158];
    int _3162 = int(_3154) + 1;
    uint _3164 = uint(int(uint(_3162) >> uint(2)));
    int _3166 = _3162 & 3;
    float _3168 = (*spvDescriptorSet0.vp_c9)._m0[int(_3164)][_3166];
    int _3170 = ~_3064;
    int _3172 = _3170 + 1;
    float _3174 = trunc(_3144);
    float _3176 = precise::max(_3174, 0.0);
    uint _3178 = uint(_3176);
    float _3180 = _2870 * _3152;
    float _3182 = _2876 * _3152;
    out.m_74.x = _3110;
    out.m_74.y = _3138;
    out.m_74.z = _3134;
    out.m_74.w = _3076;
    float _3184 = -_3180;
    float _3186 = _2870 + _3184;
    uint _3188 = uint(int(uint(_3148) >> uint(2)));
    uint _3190 = uint(int(uint(int(_3188)) >> uint(2)));
    int _3192 = int(_3188) & 3;
    float _3194 = (*spvDescriptorSet0.vp_c9)._m0[int(_3190)][_3192];
    int _3196 = int(_3188) + 1;
    uint _3198 = uint(int(uint(_3196) >> uint(2)));
    int _3200 = _3196 & 3;
    float _3202 = (*spvDescriptorSet0.vp_c9)._m0[int(_3198)][_3200];
    float _3204 = -_3182;
    float _3206 = _2876 + _3204;
    float _3208 = float(_2862);
    float _3210 = _3186 * _3186;
    float _3212 = float(_3052);
    float _3214 = trunc(_3150);
    float _3216 = precise::max(_3214, 0.0);
    uint _3218 = uint(_3216);
    int _3220 = ~_2128;
    int _3222 = _3220 + _2158;
    int _3224 = _3222 + 1;
    float _3226 = fma(_3206, _3206, _3210);
    int _3228 = _3142 + 8;
    uint _3230 = uint(int(uint(_3228) >> uint(2)));
    uint _3232 = uint(int(uint(int(_3230)) >> uint(2)));
    int _3234 = int(_3230) & 3;
    float _3236 = (*spvDescriptorSet0.vp_c9)._m0[int(_3232)][_3234];
    int _3238 = int(_3230) + 1;
    uint _3240 = uint(int(uint(_3238) >> uint(2)));
    int _3242 = _3238 & 3;
    float _3244 = (*spvDescriptorSet0.vp_c9)._m0[int(_3240)][_3242];
    float _3246 = _3212 * _3208;
    int _3248 = _3172 * int(_3178);
    int _3250 = _3248 + _3112;
    bool _3252 = _729 == 0;
    int _3254 = _793 * _3224;
    int _3256 = _3254 + _1572;
    float _3258 = _2910 * _3152;
    float _3260 = float(uint(_3250));
    int _3262 = _3148 + 8;
    uint _3264 = uint(int(uint(_3262) >> uint(2)));
    uint _3266 = uint(int(uint(int(_3264)) >> uint(2)));
    int _3268 = int(_3264) & 3;
    float _3270 = (*spvDescriptorSet0.vp_c9)._m0[int(_3266)][_3268];
    int _3272 = int(_3264) + 1;
    uint _3274 = uint(int(uint(_3272) >> uint(2)));
    int _3276 = _3272 & 3;
    float _3278 = (*spvDescriptorSet0.vp_c9)._m0[int(_3274)][_3276];
    int _3280 = ~_2904;
    int _3282 = _3280 + 1;
    float _3284 = -_3258;
    float _3286 = _2910 + _3284;
    int _3288 = ~_2200;
    int _3290 = _3288 + 1;
    int _3292 = _3290 + 1;
    float _3294 = as_type<float>(_3124) * _3260;
    int _3296 = int(_3050) + int(_3218);
    bool _3298 = !_2070;
    int _3300 = _3298 ? 0 : 1;
    float _3302 = trunc(_3294);
    float _3304 = precise::max(_3302, 0.0);
    uint _3306 = uint(_3304);
    bool _3308 = _1720 != 3;
    int _3310 = _3282 * _3296;
    int _3312 = _3310 + _3008;
    int _3314 = ~_3064;
    int _3316 = _3314 + 1;
    bool _3318 = !_3252;
    int _3320 = _3318 ? _2210 : (-1);
    bool _3322 = !_1504;
    int _3324 = _3322 ? _3256 : (-1);
    int _3326 = _3292 * as_type<int>(_3168);
    bool _3328 = !_3308;
    int _3330 = _3328 ? 0 : (-1);
    bool _3332 = uint(_3312) >= uint(_2904);
    int _3334 = int(_3178) + int(_3306);
    bool _3336 = !_3332;
    int _3338 = _3336 ? 0 : (-1);
    int _3340 = _2562 * as_type<int>(_3202);
    int _3342 = abs(_3300);
    int _3344 = _3316 * _3334;
    int _3346 = _3344 + _3112;
    int _3348 = ~_3342;
    int _3350 = _3348 + 1;
    int _3352 = _3350 + 1;
    bool _3354 = _2068 != 3;
    int _3356 = ~_3042;
    int _3358 = _3356 + 1;
    int _3360 = _3358 + 1;
    int _3362 = _3352 * as_type<int>(_3194);
    int _3364 = _3362 + _3340;
    int _3366 = ~_3296;
    int _3368 = _3366 + _3338;
    int _3370 = _3368 + 1;
    bool _3372 = !_3354;
    int _3374 = _3372 ? 0 : (-1);
    int _3376 = _3360 * as_type<int>(_3160);
    int _3378 = _3376 + _3326;
    bool _3380 = uint(_3346) >= uint(_3064);
    int _3382 = _2904 * _3370;
    int _3384 = _3382 + _3008;
    int _3386 = abs(_2148);
    bool _3388 = !_3380;
    int _3390 = _3388 ? 0 : (-1);
    int _3392 = abs(_1876);
    bool _3394 = _2904 == 0;
    int _3396 = ~_3386;
    int _3398 = _3396 + 1;
    int _3400 = _3398 + 1;
    int _3402 = abs(_3330);
    int _3404 = ~_3392;
    int _3406 = _3404 + 1;
    int _3408 = _3406 + 1;
    int _3410 = _3400 * as_type<int>(_3270);
    int _3412 = _3410 + _3364;
    bool _3414 = !_3394;
    int _3416 = _3414 ? _3384 : (-1);
    float _3418 = _1118 + 0.5;
    bool _3420 = _2904 == 0;
    int _3422 = _3408 * as_type<int>(_3236);
    int _3424 = _3422 + _3378;
    int _3426 = _3008 ^ _2904;
    int _3428 = abs(_3374);
    int _3430 = ~_3402;
    int _3432 = _3430 + 1;
    int _3434 = _3432 + 1;
    float _3436 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    uint _3438 = uint(int(uint(_3426) >> uint(31)));
    int _3440 = ~_3428;
    int _3442 = _3440 + 1;
    int _3444 = _3442 + 1;
    int _3446 = _3434 * as_type<int>(_3244);
    int _3448 = _3446 + _3424;
    int _3450 = ~_3390;
    int _3452 = _3334 + _3450;
    int _3454 = _3452 + 1;
    int _3456 = ~int(_3438);
    int _3458 = _3456 + 1;
    float _3460 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3462 = abs(_2058);
    int _3464 = _3444 * as_type<int>(_3278);
    int _3466 = _3464 + _3412;
    int _3468 = _3454 ^ _3458;
    int _3470 = ~_3060;
    int _3472 = _3470 + 1;
    int _3474 = _3472 + 1;
    int _3476 = ~_3458;
    int _3478 = _3476 + _3468;
    int _3480 = _3478 + 1;
    float _3482 = _3436 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3484 = in.m_76.x;
    float _3486 = in.m_76.y;
    float _3488 = in.m_76.z;
    int _3490 = ~_3462;
    int _3492 = _3490 + 1;
    int _3494 = _3492 + 1;
    int _3496 = _3448 * _3474;
    bool _3498 = !_3420;
    int _3500 = _3498 ? _3480 : (-1);
    float _3502 = float(_3416);
    int _3504 = _3466 * _3494;
    float _3506 = float(_3500);
    float _3508 = _3460 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3510 = _3320 * _3060;
    int _3512 = _3510 + _3496;
    float _3514 = fma(_3482, _3502, _2416);
    int _3516 = _3324 * _3462;
    int _3518 = _3516 + _3504;
    float _3520 = -_2418;
    float _3522 = fma(_3508, _3506, _3520);
    float _3524 = _1084 + (-0.5);
    float _3526 = fma(_3482, _3418, _3514);
    float _3528 = _3246 * (-2.0);
    float _3530 = -_3508;
    float _3532 = fma(_3530, _3524, _3522);
    float _3534 = float(_3512);
    float _3536 = -_2494;
    float _3538 = fma(_1118, _3536, _3526);
    float _3540 = float(_3518);
    float _3542 = fma(_1084, _2522, _3532);
    float _3544 = fma(_2918, _3528, _2918);
    out.m_78.x = _3534;
    float _3546 = fma(_3528, _3484, _3484);
    bool _3548 = !_2648;
    int _3550 = _3548 ? 0 : 1;
    out.m_78.w = _3540;
    bool _3552 = !_2652;
    int _3554 = _3552 ? 0 : 1;
    int _3556 = abs(_3550);
    out.m_80.x = _3538;
    out.m_80.y = _3542;
    float _3558 = _3488;
    if (_2974)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3560 = -_3180;
    float _3562 = _2854 + _3560;
    float _3564 = -_3182;
    float _3566 = _2782 + _3564;
    float _3568 = fma(_2898, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3546);
    float _3570 = float(_2502);
    float _3572 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3574 = _3562 + _3572;
    float _3576 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3578 = _3566 + _3576;
    float _3580 = fma(_3544, _2422, _3568);
    float _3582 = float(_3556);
    float _3584 = _3574 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3586 = -_3258;
    float _3588 = _2872 + _3586;
    float _3590 = _2864 + (-1.0);
    float _3592 = float(_2586);
    float _3594 = fma(_3578, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3584);
    float _3596 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3598 = _3588 + _3596;
    float _3600 = _3582 * _3570;
    int _3602 = abs(_3554);
    float _3604 = fma(_3286, _3286, _3226);
    float _3606 = fma(_3598, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3594);
    float _3608 = _3600 * (-2.0);
    float _3610 = _3580 * 0.15915493667125701904296875;
    float _3612 = float(_3602);
    float _3614 = fma(_3590, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3616 = fma(_3608, _3486, _3486);
    bool _3618 = _3606 >= 0.0;
    float _3620 = _2884 + (-1.0);
    float _3622 = fma(_3614, _3608, _3614);
    float _3624 = fma(_2848, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3616);
    float _3626 = _3612 * _3592;
    float _3628 = _908 + (-0.5);
    float _3630 = fma(_3622, _2422, _3624);
    float _3632 = _3626 * (-2.0);
    float _3634 = sqrt(_3604);
    float _3636 = fma(_3620, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3638 = _3630 * 0.15915493667125701904296875;
    float _3640 = fma(_3632, _3488, _3488);
    if (_3618)
    {
        _3558 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3642 = _3558;
    float _3644 = fma(_3636, _3632, _3636);
    int _3646 = as_type<int>(_3642);
    if (_3618)
    {
        out.m_55.x = 0.0;
    }
    float _3648 = fma(_3628, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3640);
    float _3650 = _3638 * 6.283185482025146484375;
    float _3652 = sin(_3650);
    if (_3618)
    {
        float _3654 = _3642 * 5.0;
        _3646 = as_type<int>(_3654);
    }
    int _3656 = _3646;
    float _3658 = fma(_3644, _2422, _3648);
    if (_3618)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10373 = as_type<float>(_3656);
        out.gl_Position.z = _10373;
    }
    float _3660 = _3638 * 6.283185482025146484375;
    float _3662 = cos(_3660);
    float _3664 = _3610 * 6.283185482025146484375;
    float _3666 = sin(_3664);
    float _3668 = _3610 * 6.283185482025146484375;
    float _3670 = cos(_3668);
    float _3672 = _3658 * 0.15915493667125701904296875;
    if (_3618)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3674 = _3672 * 6.283185482025146484375;
    float _3676 = cos(_3674);
    float _3678 = _3106 * _3634;
    float _3680 = _549 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3682 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _217);
    float _3684 = _3670 * _3662;
    float _3686 = _3104 * _3678;
    float _3688 = _3678 * _3680;
    float _3690 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _213);
    float _3692 = _3672 * 6.283185482025146484375;
    float _3694 = sin(_3692);
    float _3696 = _3670 * _3652;
    float _3698 = _3682 * _3688;
    float _3700 = _3666 * _3652;
    float _3702 = _3666 * _3662;
    float _3704 = _3690 * _3686;
    float _3706 = _3670 * _3676;
    float _3708 = _3662 * _3676;
    float _3710 = _3666 * _3676;
    float _3712 = _3652 * _3676;
    float _3714 = _3706 * _3698;
    float _3716 = _3678 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3718 = _3716 * 0.5;
    float _3720 = fma(_3694, _3684, _3700);
    float _3722 = -_3702;
    float _3724 = fma(_3694, _3696, _3722);
    float _3726 = -_3698;
    float _3728 = _3694 * _3726;
    float _3730 = -_3696;
    float _3732 = fma(_3694, _3702, _3730);
    float _3734 = fma(_3720, _3704, _3714);
    float _3736 = _3710 * _3698;
    float _3738 = fma(_3708, _3704, _3728);
    float _3740 = fma(_3694, _3700, _3684);
    float _3742 = fma(_3724, _3718, _3734);
    float _3744 = fma(_3732, _3704, _3736);
    float _3746 = fma(_3712, _3718, _3738);
    float _3748 = _3720 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3750 = _3742 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3752 = _3742 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3754 = fma(_3740, _3718, _3744);
    float _3756 = _3742 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3758 = fma(_3746, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3750);
    float _3760 = fma(_3746, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3752);
    float _3762 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3764 = fma(_3746, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3756);
    float _3766 = fma(_3754, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3758);
    float _3768 = fma(_3754, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3760);
    float _3770 = fma(_3708, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3748);
    float _3772 = fma(_3754, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3764);
    float _3774 = _3766 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3776 = _3768 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3778 = _3720 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3780 = _3772 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3782 = _2782 + _3774;
    float _3784 = _2872 + _3776;
    float _3786 = _3720 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3788 = fma(_3708, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3778);
    float _3790 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3792 = _3782 + _3790;
    float _3794 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3796 = _3784 + _3794;
    float _3798 = fma(_3708, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3786);
    float _3800 = _3706 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3802 = _3792 * _3792;
    float _3804 = _3796 * _3796;
    float _3806 = _3706 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3808 = -_3694;
    float _3810 = fma(_3808, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3800);
    float _3812 = fma(_3762, _3762, 1.0);
    float _3814 = _3802 + _3804;
    float _3816 = _3706 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3818 = _3724 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3820 = _3724 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3822 = sqrt(_3814);
    float _3824 = _3724 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3826 = _2854 + _3780;
    float _3828 = -_3694;
    float _3830 = fma(_3828, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3806);
    float _3832 = -_3694;
    float _3834 = fma(_3832, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3816);
    float _3836 = fma(_3712, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3818);
    float _3838 = fma(_3712, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3820);
    float _3840 = fma(_3712, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3824);
    float _3842 = rsqrt(_3812);
    bool _3844 = _3822 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3846 = _3724;
    float _3848 = _3712;
    float _3850 = _3816;
    float _3852 = _3812;
    float _3854 = _3818;
    if (!_3844)
    {
        _3846 = _3804;
    }
    float _3856 = _3846;
    float _3858 = _3856;
    if (!_3844)
    {
        _3848 = _3802;
    }
    float _3860 = _3848;
    float _3862 = _3860;
    if (!_3844)
    {
        _3850 = _3782;
    }
    float _3864 = _3850;
    float _3866 = _3864;
    if (!_3844)
    {
        _3852 = _3784;
    }
    float _3868 = _3852;
    float _3870 = _3868;
    if (!_3844)
    {
        _3854 = _3826;
    }
    float _3872 = _3854;
    bool _3874 = !_3844;
    float _3876 = _3872;
    if (!_3874)
    {
        float _3878 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3880 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3882 = _3822 + _3880;
        float _3884 = rsqrt(_3814);
        float _3886 = _3882 * _3878;
        float _3888 = _3826 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3890 = _3886 * 0.15915493667125701904296875;
        float _3892 = _3890 * 6.283185482025146484375;
        float _3894 = sin(_3892);
        float _3896 = _3890 * 6.283185482025146484375;
        float _3898 = cos(_3896);
        float _3900 = fma(_3894, _3888, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3902 = _3884 * _3900;
        float _3904 = _3898 + (-1.0);
        float _3906 = fma(_3792, _3902, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3908 = fma(_3796, _3902, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3910 = _3904 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3912 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3914 = _3906 + _3912;
        float _3916 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3918 = _3908 + _3916;
        float _3920 = fma(_3826, _3898, _3910);
        float _3922 = _3914 * _3914;
        float _3924 = _3918 * _3918;
        _3876 = _3920;
        _3862 = _3922;
        _3858 = _3924;
        _3866 = _3906;
        _3870 = _3908;
    }
    float _3926 = _3876;
    float _3928 = _3862;
    float _3930 = _3858;
    float _3932 = _3866;
    float _3934 = _3870;
    float _3936 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3938 = _3926 + _3936;
    float _3940 = fma(_3710, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3810);
    float _3942 = fma(_3710, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3830);
    float _3944 = fma(_3710, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3834);
    float _3946 = fma(_3938, _3938, _3928);
    float _3948 = fma(_3740, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3836);
    float _3950 = fma(_3732, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3788);
    float _3952 = fma(_3740, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3838);
    float _3954 = _3946 + _3930;
    float _3956 = fma(_3740, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3840);
    float _3958 = fma(_3732, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3798);
    float _3960 = _3762 * _3842;
    float _3962 = fma(_3732, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3770);
    float _3964 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3966 = _3762 * _3940;
    float _3968 = _3762 * _3942;
    float _3970 = _3762 * _3944;
    float _3972 = sqrt(_3954);
    float _3974 = -_3948;
    float _3976 = _3960 * _3974;
    float _3978 = -_3952;
    float _3980 = _3960 * _3978;
    float _3982 = -_3956;
    float _3984 = _3960 * _3982;
    float _3986 = fma(_3964, _3950, _3966);
    float _3988 = fma(_3964, _3958, _3968);
    float _3990 = fma(_3964, _3962, _3970);
    float _3992 = fma(_3842, _3942, _3980);
    float _3994 = fma(_3842, _3940, _3976);
    float _3996 = fma(_3842, _3944, _3984);
    float _3998 = _3948 + _3986;
    float _4000 = _3952 + _3988;
    float _4002 = _3956 + _3990;
    out.m_82.x = _3950;
    out.m_82.y = _3958;
    out.m_82.z = _3962;
    bool _4004 = _3972 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4006 = isnan(_3972);
    bool _4008 = _4004 || _4006;
    bool _4010 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4012 = _4008 || _4010;
    out.m_84.x = _3994;
    out.m_84.y = _3992;
    out.m_84.z = _3996;
    out.m_86.x = _3998;
    out.m_86.y = _4000;
    out.m_86.z = _4002;
    float _4014 = _3966;
    float _4016 = _3994;
    if (!_4012)
    {
        _4014 = 1.0;
    }
    float _4018 = _4014;
    bool _4020 = !_4012;
    float _4022 = _4018;
    if (!_4020)
    {
        bool _4024 = _3972 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4026 = isnan(_3972);
        bool _4028 = _4024 || _4026;
        bool _4030 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4032 = _4028 || _4030;
        if (!_4032)
        {
            float _4034 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4036 = _3972 + _4034;
            float _4038 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4040 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4038;
            float _4042 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4044 = _4042 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4046 = 1.0 / _4040;
            float _4048 = _4036 * _4046;
            float _4050 = fma(_4048, _4044, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4022 = _4050;
            _4052 = true;
        }
        else
        {
            bool _4054 = _3972 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4056 = isnan(_3972);
            bool _4058 = _4054 || _4056;
            bool _4060 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4062 = _4058 || _4060;
            if (!_4062)
            {
                float _4064 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4066 = _3972 + _4064;
                float _4068 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4070 = _4068 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4072 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4074 = _4072 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4076 = 1.0 / _4070;
                float _4078 = _4066 * _4076;
                float _4080 = fma(_4078, _4074, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4022 = _4080;
                _4052 = true;
            }
            else
            {
                _4022 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4052 = false;
    float _4082 = _4022;
    float _4084 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4086 = _3926 + _4084;
    float _4088 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4090 = _3932 + _4088;
    float _4092 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4094 = _3934 + _4092;
    float _4096 = fma(_4086, _4082, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4098 = fma(_4090, _4082, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4100 = fma(_4094, _4082, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4102 = -_2854;
    float _4104 = _4102 + _4096;
    float _4106 = -_2782;
    float _4108 = _4106 + _4098;
    float _4110 = -_2872;
    float _4112 = _4110 + _4100;
    float _4114 = _4104 * _4104;
    float _4116 = fma(_4108, _4108, _4114);
    float _4118 = fma(_4112, _4112, _4116);
    float _4120 = sqrt(_4118);
    bool _4122 = _4120 > 0.0;
    float _4124 = _4090;
    float _4126 = _4120;
    float _4128 = _4094;
    float _4130 = _4098;
    if (!_4122)
    {
        _4124 = _4098;
    }
    float _4132 = _4124;
    float _4134 = _4132;
    float _4136 = _4132;
    if (!_4122)
    {
        _4126 = _4096;
    }
    float _4138 = _4126;
    float _4140 = _4138;
    if (!_4122)
    {
        _4128 = _4100;
    }
    float _4142 = _4128;
    bool _4144 = !_4122;
    float _4146 = _4142;
    if (!_4144)
    {
        float _4148 = _207 * _207;
        float _4150 = fma(_205, _205, _4148);
        float _4152 = rsqrt(_4118);
        float _4154 = fma(_209, _209, _4150);
        float _4156 = sqrt(_4154);
        float _4158 = _4108 * _4152;
        float _4160 = _4104 * _4152;
        float _4162 = _4112 * _4152;
        bool _4164 = _4156 > 0.0;
        float _4166 = _4152;
        float _4168 = _4156;
        _4016 = _4158;
        if (!_4164)
        {
            _4134 = _4098;
        }
        float _4170 = _4134;
        _4136 = _4170;
        if (!_4164)
        {
            _4166 = _4096;
        }
        float _4172 = _4166;
        _4140 = _4172;
        if (!_4164)
        {
            _4168 = _4100;
        }
        float _4174 = _4168;
        bool _4176 = !_4164;
        _4146 = _4174;
        if (!_4176)
        {
            float _4178 = rsqrt(_4154);
            float _4180 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4182 = _207 * _4178;
            float _4184 = _205 * _4178;
            float _4186 = _4160 * _4182;
            float _4188 = _209 * _4178;
            float _4190 = fma(_4158, _4184, _4186);
            float _4192 = _4180 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4194 = fma(_4162, _4188, _4190);
            float _4196 = _4194 * _4192;
            float _4198 = fma(_205, _4196, _4098);
            float _4200 = fma(_207, _4196, _4096);
            float _4202 = fma(_209, _4196, _4100);
            _4140 = _4200;
            _4136 = _4198;
            _4146 = _4202;
        }
    }
    float _4204 = _4140;
    float _4206 = _4136;
    float _4208 = _4146;
    float _4210 = _4016;
    float _4212 = -_3180;
    float _4214 = _4212 + _4204;
    float _4216 = -_3182;
    float _4218 = _4216 + _4206;
    float _4220 = -_3258;
    float _4222 = _4220 + _4208;
    float _4224 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4226 = _4214 + _4224;
    float _4228 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4230 = _4218 + _4228;
    float _4232 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4234 = _4222 + _4232;
    float _4236 = _4226 * _4226;
    float _4238 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4240 = fma(_4230, _4230, _4236);
    float _4242 = fma(_4234, _4234, _4240);
    float _4244 = rsqrt(_4242);
    float _4246 = sqrt(_4242);
    float _4248 = _4244 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4250 = _4230 * _4248;
    float _4252 = _4234 * _4248;
    float _4254 = _4250 * _4250;
    float _4256 = _4252 * _4252;
    float _4258 = _4254 + _4256;
    float _4260 = sqrt(_4258);
    bool _4262 = _4260 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4264 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4266 = _4260 + _4264;
    float _4268 = _4234;
    float _4270 = _4258;
    float _4272 = _4266;
    float _4274 = _4210;
    if (_4262)
    {
        float _4276 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4268 = _4276;
    }
    float _4278 = _4268;
    if (_4262)
    {
        float _4280 = rsqrt(_4258);
        _4270 = _4280;
    }
    float _4282 = _4270;
    float _4284 = _4282;
    if (_4262)
    {
        float _4286 = _4266 * _4278;
        _4272 = _4286;
    }
    float _4288 = _4272;
    if (_4262)
    {
        float _4290 = _4288 * 0.15915493667125701904296875;
        _221 = _4290;
    }
    float _4292 = _221;
    float _4294 = _4278;
    if (_4262)
    {
        float _4296 = _4292 * 6.283185482025146484375;
        float _4298 = sin(_4296);
        _4294 = _4298;
    }
    float _4300 = _4294;
    float _4302 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4304 = precise::max(0.0, _4302);
    float _4306 = _4236;
    float _4308 = _4304;
    if (_4262)
    {
        float _4310 = _4292 * 6.283185482025146484375;
        float _4312 = cos(_4310);
        _4306 = _4312;
    }
    float _4314 = _4306;
    float _4316 = -_4248;
    float _4318 = -_4304;
    float _4320 = fma(_4226, _4316, _4318);
    float _4322 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_4262)
    {
        float _4324 = _4320 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4308 = _4324;
    }
    float _4326 = _4308;
    float _4328 = _4214 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4330 = fma(_3566, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4332 = _4326;
    if (!_4262)
    {
        _4322 = _4250;
    }
    float _4334 = _4322;
    float _4336 = _4300;
    float _4338 = _4334;
    if (_4262)
    {
        float _4340 = fma(_4300, _4326, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4336 = _4340;
    }
    float _4342 = _4336;
    float _4344 = fma(_4218, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4328);
    float _4346 = floor(_4330);
    float _4348 = _4342;
    float _4350 = _4314;
    if (_4262)
    {
        float _4352 = _4314 + (-1.0);
        _4332 = _4352;
    }
    float _4354 = _4332;
    float _4356 = _4354;
    if (_4262)
    {
        float _4358 = _4282 * _4342;
        _4274 = _4358;
    }
    float _4360 = _4274;
    if (!_4262)
    {
        _4348 = _4320;
    }
    float _4362 = _4348;
    float _4364 = fma(_4222, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4344);
    float _4366 = _4362;
    if (_4262)
    {
        float _4368 = _4354 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4130 = _4368;
    }
    float _4370 = _4130;
    if (_4262)
    {
        float _4372 = _4250 * _4360;
        _4338 = _4372;
    }
    float _4374 = _4338;
    if (!_4262)
    {
        _4356 = _4252;
    }
    float _4376 = _4356;
    float _4378 = _4376;
    if (_4262)
    {
        float _4380 = _4252 * _4360;
        _4378 = _4380;
    }
    float _4382 = _4378;
    if (!_4262)
    {
        _4284 = _4254;
    }
    float _4384 = _4284;
    float _4386 = _4384;
    if (_4262)
    {
        float _4388 = fma(_4320, _4314, _4370);
        _4366 = _4388;
    }
    float _4390 = _4366;
    if (_4262)
    {
        float _4392 = _4374 * _4374;
        _4386 = _4392;
    }
    float _4394 = _4386;
    if (!_4262)
    {
        _4350 = _4256;
    }
    float _4396 = _4350;
    float _4398 = _4396;
    if (_4262)
    {
        float _4400 = _4382 * _4382;
        _4398 = _4400;
    }
    float _4402 = _4398;
    float _4404 = fma(_4390, _4390, _4394);
    float _4406 = _4214 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4408 = _4214 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4410 = -_4346;
    float _4412 = _4330 + _4410;
    float _4414 = _4404 + _4402;
    float _4416 = _4214 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4418 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4420 = fma(_4246, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4418);
    float _4422 = precise::clamp(_4420, 0.0, 1.0);
    float _4424 = fma(_4218, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4406);
    float _4426 = rsqrt(_4414);
    float _4428 = fma(_4218, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4416);
    float _4430 = _4364 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4432 = -_4422;
    float _4434 = _4432 + 1.0;
    float _4436 = fma(_4218, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4408);
    float _4438 = fma(_4222, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4428);
    float _4440 = fma(_4222, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4424);
    float _4442 = fma(_4222, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4436);
    float _4444 = _4438 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4446 = _4430 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4448 = _4440 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4450 = abs(_4434);
    float _4452 = log2(_4450);
    float _4454 = _4442 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4456 = fma(_4444, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4446);
    float _4458 = _4448 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4460 = _4426 * _4374;
    float _4462 = _4426 * _4390;
    float _4464 = fma(_4448, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4456);
    float _4466 = _4426 * _4382;
    float _4468 = -_4458;
    float _4470 = fma(_4468, _4238, 1.0);
    float _4472 = fma(_3588, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4474 = fma(_4454, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4464);
    float _4476 = _4460 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4478 = _4430 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4480 = floor(_4472);
    float _4482 = -_4476;
    float _4484 = fma(_4462, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4482);
    float _4486 = _4452 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4488 = fma(_4444, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4478);
    float _4490 = -_4466;
    float _4492 = fma(_4490, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4484);
    float _4494 = _4430 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4496 = log2(_4470);
    float _4498 = fma(_4448, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4488);
    float _4500 = fma(_4492, -0.5, 0.5);
    float _4502 = fma(_4492, 0.5, 0.5);
    float _4504 = fma(_4444, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4494);
    float _4506 = _4462 + 1.0;
    float _4508 = fma(_4502, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4510 = exp2(_4486);
    float _4512 = fma(_4448, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4504);
    float _4514 = -_4480;
    float _4516 = _4472 + _4514;
    float _4518 = fma(_4502, _4508, -0.212114393711090087890625);
    float _4520 = fma(_4454, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4512);
    float _4522 = fma(_4502, _4518, 1.570728778839111328125);
    float _4524 = 1.0 / _4474;
    float _4526 = sqrt(_4500);
    float _4528 = -_4462;
    float _4530 = fma(_4510, _4506, _4528);
    float _4532 = fma(_4454, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4498);
    float _4534 = _4496 * 0.693147182464599609375;
    float _4536 = fma(_4530, 0.5, 0.5);
    float _4538 = _4534 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4540 = _4520 * _4524;
    float _4542 = _4532 * _4524;
    float _4544 = fma(_4540, 0.5, 0.5);
    float _4546 = fma(_4542, -0.5, 0.5);
    float _4548 = _4526 * 0.636619746685028076171875;
    float2 _11874 = float2(_4412, _4516);
    float _4550 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11874, float2(0.0), isnan(_11874)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11874, float2(0.0), isnan(_11874)), level(0.0)).x;
    float3 _11885 = float3(_4544, _4546, _4538);
    float _4552 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11885, float3(0.0), isnan(_11885)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11885, float3(0.0), isnan(_11885)), level(0.0)).x;
    float _4554 = -_4522;
    float _4556 = fma(_4548, _4554, 1.0);
    float3 _11901 = float3(_4544, _4546, _4538);
    float4 _4559 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11901, float3(0.0), isnan(_11901)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11901, float3(0.0), isnan(_11901)), level(0.0)).xyzw;
    float _4561 = _4559.x;
    float _4563 = _4559.y;
    float _4565 = _4559.z;
    float _4567 = _4559.w;
    float2 _11917 = float2(_4556, _4536);
    float3 _4571 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11917, float2(0.0), isnan(_11917)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11917, float2(0.0), isnan(_11917)), level(0.0)).xyz;
    float _4573 = _4571.x;
    float _4575 = _4571.y;
    float _4577 = _4571.z;
    float _4579 = _3562 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4581 = _3562 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4583 = _4430 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4585 = in.m_88.x;
    float _4587 = fma(_3566, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4579);
    float _4589 = fma(_3566, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4581);
    float _4591 = fma(_4444, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4583);
    float _4593 = fma(_3588, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4587);
    float _4595 = fma(_3588, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4589);
    float _4597 = _4593 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4599 = _4595 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4601 = 1.0 / _4597;
    float _4603 = _4599 + _4597;
    float _4605 = _4603 * _4601;
    float _4607 = _4605 * 0.5;
    float _4609 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4611 = fma(_4607, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4609);
    float _4613 = 1.0 / _4611;
    float _4615 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4617 = _4613 * _4615;
    float _4619 = abs(_4617);
    float _4621 = log2(_4619);
    bool _4623 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4625 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4627 = _4623 || _4625;
    bool _4629 = isnan(0.5);
    bool _4631 = _4627 || _4629;
    float _4633 = fma(_4448, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4591);
    float _4635 = _4452 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4637 = _4520 + _4474;
    float _4639 = _4474 * 0.5;
    float _4641 = fma(_4454, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4633);
    float _4643 = exp2(_4635);
    float _4645 = _4637 * 0.5;
    float _4647 = fma(_4532, -0.5, _4639);
    float _4649 = _4621 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4651 = exp2(_4649);
    float _4653 = fma(_4651, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4655 = precise::clamp(_4653, 0.0, 1.0);
    bool _4657 = _4617 <= 8000.0;
    bool _4659 = isnan(_4617);
    bool _4661 = _4657 || _4659;
    bool _4663 = isnan(8000.0);
    bool _4665 = _4661 || _4663;
    float _4667 = float(_4665);
    float _4669 = fma(_4655, -2.0, 3.0);
    float _4671 = _4655 * _4655;
    float _4673 = _4671 * _4669;
    float _4675 = -_4673;
    float _4677 = _4675 + 1.0;
    float _4679 = fma(_4677, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4673);
    float _4681 = _4667 * _4679;
    float _4683 = _4641 + _4474;
    float _4685 = _4667;
    float _4687 = _4474;
    float _4689 = _4641;
    float _4691 = _4532;
    if (_4631)
    {
        _4685 = 1.0;
    }
    float _4693 = _4685;
    float _4695 = _4683 * 0.5;
    float _4697 = _4693;
    float _4699 = _4561;
    if (!_4631)
    {
        float _4701 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4703 = _4701 * 0.15915493667125701904296875;
        float _4705 = _4703 * 6.283185482025146484375;
        float _4707 = cos(_4705);
        float _4709 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4711 = _4709 * 0.15915493667125701904296875;
        float _4713 = _4703 * 6.283185482025146484375;
        float _4715 = sin(_4713);
        float _4717 = 1.0 / _4707;
        float _4719 = _4711 * 6.283185482025146484375;
        float _4721 = cos(_4719);
        float _4723 = _4715 * _4717;
        float _4725 = _4711 * 6.283185482025146484375;
        float _4727 = sin(_4725);
        float _4729 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4731 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4729;
        float _4733 = _4721 * _4723;
        float _4735 = 1.0 / _4731;
        float _4737 = 1.0 / _4733;
        float _4739 = _4727 * _4737;
        float _4741 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4743 = fma(_4617, _4739, _4741);
        float _4745 = _4743 * _4735;
        float _4747 = precise::clamp(_4745, 0.0, 1.0);
        _4697 = _4747;
    }
    float _4749 = _4697;
    float _4751 = _4681 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4753 = -_4643;
    float _4755 = _4753 + 1.0;
    float _4757 = -_4550;
    float _4759 = _4757 + 1.0;
    out.gl_Position.x = _4520;
    out.gl_Position.y = _4532;
    out.gl_Position.z = _4641;
    out.gl_Position.w = _4474;
    float _4761 = _4755 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4763 = _4759 * _4751;
    float _4765 = precise::clamp(_4763, 0.0, 1.0);
    bool _4767 = _4246 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4769 = isnan(_4246);
    bool _4771 = _4767 || _4769;
    bool _4773 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4775 = _4771 || _4773;
    out.m_90.x = _4645;
    out.m_90.y = _4647;
    out.m_90.z = _4695;
    out.m_90.w = _4474;
    float _4777 = _4761 * _4552;
    float _4779 = -_4765;
    float _4781 = fma(_4779, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4783 = _4567 * _4777;
    float _4785 = _4781 * _4585;
    float _4787 = _4577 * _4777;
    float _4789 = -_4761;
    float _4791 = _4789 + 1.0;
    float _4793 = _4785 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4795 = _4783;
    float _4797 = _4791;
    if (!_4775)
    {
        _4687 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4799 = _4687;
    float _4801 = fma(_4573, _4783, _4561);
    float _4803 = fma(_4575, _4783, _4563);
    float _4805 = _4567 * _4791;
    float _4807 = fma(_4567, _4787, _4565);
    out.m_92.x = _4793;
    float _4809 = _4749 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4811 = _4799;
    float _4813 = _4799;
    if (!_4775)
    {
        _4795 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4815 = _4795;
    out.m_94.x = _4801;
    out.m_94.y = _4803;
    out.m_94.z = _4807;
    out.m_94.w = _4805;
    float _4817 = _4815;
    float _4819 = _4815;
    if (!_4775)
    {
        _4699 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4821 = _4699;
    float _4823 = _4821;
    float _4825 = _4821;
    if (!_4775)
    {
        _4689 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4827 = _4689;
    float _4829 = _4827;
    float _4831 = _4827;
    if (!_4775)
    {
        _4691 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4833 = _4691;
    float _4835 = _4833;
    float _4837 = _4833;
    if (!_4775)
    {
        _4797 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4839 = _4797;
    bool _4841 = !_4775;
    float _4843 = _4839;
    float _4845 = _4839;
    if (!_4841)
    {
        bool _4847 = _4246 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4849 = isnan(_4246);
        bool _4851 = _4847 || _4849;
        bool _4853 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4855 = _4851 || _4853;
        if (!_4855)
        {
            float _4857 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4859 = _4246 + _4857;
            float _4861 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4863 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4861;
            float _4865 = 1.0 / _4863;
            float _4867 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4869 = _4867 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4871 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4873 = _4871 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4875 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4877 = _4875 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4879 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4881 = _4879 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4883 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4885 = _4883 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4887 = _4859 * _4865;
            float _4889 = precise::clamp(_4887, 0.0, 1.0);
            float _4891 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4893 = _4891 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4895 = fma(_4889, _4873, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4897 = fma(_4889, _4893, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4899 = fma(_4889, _4869, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4901 = fma(_4889, _4877, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4903 = fma(_4889, _4881, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4905 = fma(_4889, _4885, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4837 = _4899;
            _4825 = _4903;
            _4831 = _4897;
            _4819 = _4901;
            _4845 = _4895;
            _4813 = _4905;
            _4907 = true;
        }
        else
        {
            bool _4909 = _4246 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4911 = isnan(_4246);
            bool _4913 = _4909 || _4911;
            bool _4915 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4917 = _4913 || _4915;
            if (!_4917)
            {
                _4817 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4919 = _4817;
            _4819 = _4919;
            if (!_4917)
            {
                _4823 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4921 = _4823;
            _4825 = _4921;
            if (!_4917)
            {
                _4811 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4923 = _4811;
            _4813 = _4923;
            if (!_4917)
            {
                _4829 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4925 = _4829;
            _4831 = _4925;
            if (!_4917)
            {
                _4835 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4927 = _4835;
            _4837 = _4927;
            if (!_4917)
            {
                _4843 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4929 = _4843;
            bool _4931 = !_4917;
            _4845 = _4929;
            if (!_4931)
            {
                bool _4933 = _4246 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4935 = isnan(_4246);
                bool _4937 = _4933 || _4935;
                bool _4939 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4941 = _4937 || _4939;
                if (!_4941)
                {
                    float _4943 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4945 = _4246 + _4943;
                    float _4947 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4949 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4947;
                    float _4951 = 1.0 / _4949;
                    float _4953 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4955 = _4953 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4957 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4959 = _4957 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4961 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4963 = _4961 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4965 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4967 = _4965 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4969 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4971 = _4969 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4973 = _4945 * _4951;
                    float _4975 = precise::clamp(_4973, 0.0, 1.0);
                    float _4977 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4979 = _4977 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4981 = fma(_4975, _4959, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4983 = fma(_4975, _4979, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4985 = fma(_4975, _4955, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4987 = fma(_4975, _4963, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4989 = fma(_4975, _4967, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4991 = fma(_4975, _4971, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4837 = _4985;
                    _4825 = _4989;
                    _4831 = _4983;
                    _4819 = _4987;
                    _4845 = _4981;
                    _4813 = _4991;
                    _4907 = true;
                }
                else
                {
                    _4837 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4825 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4831 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4819 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4845 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4813 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4907 = false;
    float _4993 = _4837;
    float _4995 = _4825;
    float _4997 = _4831;
    float _4999 = _4819;
    float _5001 = _4845;
    float _5003 = _4813;
    float _5005 = fma(_4000, -0.5, 0.5);
    float _5007 = precise::clamp(_5005, 0.0, 1.0);
    float _5009 = -_4993;
    float _5011 = _4995 + _5009;
    float _5013 = _4809 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5015 = -_4997;
    float _5017 = _4999 + _5015;
    float _5019 = fma(_5007, _5011, _4993);
    out.m_96.x = 0.0;
    float _5021 = -_5001;
    float _5023 = _5003 + _5021;
    float _5025 = fma(_5007, _5017, _4997);
    float _5027 = _5019 * 0.586610972881317138671875;
    out.m_55.x = _5013;
    bool _5029 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5031 = fma(_5007, _5023, _5001);
    float _5033 = fma(_5025, 0.298911988735198974609375, _5027);
    bool _5035 = _4749 > 0.0;
    bool _5037 = isnan(_4749);
    bool _5039 = _5035 || _5037;
    bool _5041 = isnan(0.0);
    bool _5043 = _5039 || _5041;
    float _5045 = fma(_5031, 0.114477999508380889892578125, _5033);
    float _5047 = -_5045;
    float _5049 = _5025 + _5047;
    float _5051 = -_5045;
    float _5053 = _5019 + _5051;
    float _5055 = -_5045;
    float _5057 = _5031 + _5055;
    float _5059 = fma(_5049, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5045);
    float _5061 = fma(_5053, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5045);
    float _5063 = fma(_5057, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5045);
    bool _5065 = !_5029;
    if (!_5065)
    {
        float _5067 = -_4214;
        float _5069 = _5067 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5071 = -_4218;
        float _5073 = _5071 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5075 = -_4222;
        float _5077 = _5075 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5079 = _5069 * _5069;
        float _5081 = fma(_5073, _5073, _5079);
        float _5083 = fma(_5077, _5077, _5081);
        float _5085 = sqrt(_5083);
        float _5087 = rsqrt(_5083);
        float _5089 = -_5085;
        float _5091 = _5089 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5093 = _5091 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5095 = precise::clamp(_5093, 0.0, 1.0);
        float _5097 = _5073 * _5087;
        float _5099 = _5069 * _5087;
        float _5101 = abs(_5095);
        float _5103 = log2(_5101);
        float _5105 = _5077 * _5087;
        float _5107 = _5097 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5109 = _4000 * _5099;
        float _5111 = -_5099;
        float _5113 = -_5107;
        float _5115 = fma(_5111, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5113);
        float _5117 = fma(_3998, _5097, _5109);
        float _5119 = -_5105;
        float _5121 = fma(_5119, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5115);
        float _5123 = fma(_4002, _5105, _5117);
        float _5125 = precise::clamp(_5123, 0.0, 1.0);
        float _5127 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5129 = _5121 + _5127;
        float _5131 = _5103 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5133 = _5129 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5135 = precise::clamp(_5133, 0.0, 1.0);
        float _5137 = exp2(_5131);
        float _5139 = _5137 * _5135;
        float _5141 = _5125 * _5139;
        float _5143 = _5141 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5145 = _5141 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5147 = _5141 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _5143;
        out.m_96.y = _5145;
        out.m_96.z = _5147;
    }
    out.m_98.x = _5059;
    out.m_98.y = _5061;
    out.m_98.z = _5063;
    if (_5043)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_55.x = 0.0;
    float _5149 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5149;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

