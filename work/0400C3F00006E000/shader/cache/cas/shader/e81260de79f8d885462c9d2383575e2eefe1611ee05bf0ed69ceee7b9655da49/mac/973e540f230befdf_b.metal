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
    float4 m_64 [[user(locn0)]];
    float4 m_66 [[user(locn1)]];
    float4 m_55 [[user(locn2)]];
    float4 m_96 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_74 [[user(locn5)]];
    float4 m_88 [[user(locn6)]];
    float4 m_78 [[user(locn7)]];
    float4 m_76 [[user(locn8)]];
    float4 m_82 [[user(locn9)]];
    float4 m_84 [[user(locn10)]];
    float4 m_94 [[user(locn11)]];
    float4 m_90 [[user(locn12)]];
    float4 m_92 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_86 [[attribute(0)]];
    float4 m_68 [[attribute(1)]];
    float4 m_72 [[attribute(2)]];
    float4 m_70 [[attribute(3)]];
    float4 m_80 [[attribute(4)]];
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
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3271 = false;
    bool _2530 = false;
    bool _561 = false;
    bool _425 = false;
    bool _309 = false;
    bool _213 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_48.w;
    float _112 = in.m_50.w;
    float _114 = trunc(_110);
    int _117 = int(_114);
    float _119 = -_112;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _121;
    bool _125 = _117 >= 1;
    float _127 = 0.0;
    float _129 = _112;
    float _131 = _121;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _127;
    if (!_125)
    {
        out.m_55.x = 0.0;
    }
    int _135 = 0;
    if (!_125)
    {
        float _137 = _133 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3581 = as_type<float>(_139);
        out.gl_Position.z = _3581;
    }
    if (!_125)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _143 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_112);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = float(_117);
    bool _155 = _121 >= _153;
    bool _157 = !_151;
    bool _159 = _155 || _157;
    if (_159)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _129;
    if (_159)
    {
        out.m_55.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _141 = as_type<int>(_163);
    }
    int _165 = _141;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3636 = as_type<float>(_165);
        out.gl_Position.z = _3636;
    }
    if (_159)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = 1.0 / _153;
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _173 = _121 * _169;
    int _175 = as_type<int>(_167) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_167) & 2;
    bool _181 = _179 != 0;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_171;
    float _193 = _173;
    float _211;
    if (!_191)
    {
        float _195 = in.m_60.x;
        float _197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _203 = _201 * _197;
        float _205 = floor(_203);
        float _207 = -_205;
        float _209 = _203 + _207;
        _211 = _209;
        _213 = true;
    }
    else
    {
        _211 = _173;
    }
    _213 = false;
    float _215 = _211;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _219 = _215 + _217;
    bool _221 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _223 = isnan(_215);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _233;
    float _237 = -_231;
    float _239 = _237 + 1.0;
    bool _241 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _243 = 1.0 / _235;
    float _245 = _219 * _243;
    bool _247 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _249 = isnan(_215);
    bool _251 = _247 || _249;
    bool _253 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _255 = _251 || _253;
    float _257 = float(_255);
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _259;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _263;
    float _267 = _257 * _239;
    float _269 = fma(_261, _245, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _271 = fma(_265, _245, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _273 = -_257;
    float _275 = _273 + 1.0;
    float _277 = _269 * _267;
    float _279 = _271 * _267;
    float _281 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[143].x, _277);
    float _283 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[143].y, _279);
    float _285 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].x, _281);
    float _287 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].y, _283);
    bool _289 = !_241;
    float _307;
    if (!_289)
    {
        float _291 = in.m_60.x;
        float _293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _295 = _291 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _299 = _297 * _293;
        float _301 = floor(_299);
        float _303 = -_301;
        float _305 = _299 + _303;
        _307 = _305;
        _309 = true;
    }
    else
    {
        _307 = _173;
    }
    _309 = false;
    float _311 = _307;
    float _313 = in.m_62.x;
    float _315 = in.m_62.y;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _319 = _311 + _317;
    bool _321 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _323 = isnan(_311);
    bool _325 = _321 || _323;
    bool _327 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _329 = _325 || _327;
    float _331 = float(_329);
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _333;
    bool _337 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _339 = 1.0 / _335;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _341;
    float _345 = _287 * _315;
    float _347 = _319 * _339;
    bool _349 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _351 = isnan(_311);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = -_331;
    float _363 = _361 + 1.0;
    float _365 = _285 * _313;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _367;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _371;
    float _375 = _359 * _363;
    float _377 = fma(_343, _347, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _379 = fma(_369, _347, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _381 = fma(_373, _347, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _383 = -_359;
    float _385 = _383 + 1.0;
    float _387 = _377 * _375;
    float _389 = _379 * _375;
    float _391 = _381 * _375;
    float _393 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[107].y, _387);
    float _395 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[107].x, _389);
    float _397 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[107].z, _391);
    float _399 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[108].y, _393);
    float _401 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[108].x, _395);
    float _403 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[108].z, _397);
    bool _405 = !_337;
    float _423;
    if (!_405)
    {
        float _407 = in.m_60.x;
        float _409 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _411 = _407 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _413 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _415 = _413 * _409;
        float _417 = floor(_415);
        float _419 = -_417;
        float _421 = _415 + _419;
        _423 = _421;
        _425 = true;
    }
    else
    {
        _423 = _173;
    }
    _425 = false;
    float _427 = _423;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _433 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _435 = isnan(_427);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _441 = _437 || _439;
    float _443 = float(_441);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _449 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _451 = isnan(_427);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = 1.0 / _431;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _463;
    float _467 = -_443;
    float _469 = _467 + 1.0;
    bool _471 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _473 = isnan(_427);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    bool _483 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _485 = 1.0 / _447;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _491 = _465 * _461;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _495 = _427 + _493;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _499 = _427 + _497;
    float _501 = fma(_491, _495, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _503 = _459 * _469;
    float _505 = -_459;
    float _507 = _505 + 1.0;
    float _509 = _489 * _485;
    float _511 = -_481;
    float _513 = _511 + 1.0;
    float _515 = _501 * _503;
    float _517 = _403 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _519 = fma(_509, _499, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _521 = _443 * _513;
    float _523 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[115].x, _515);
    float _525 = _399 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _527 = _517 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _529 = fma(_519, _521, _523);
    float _531 = _401 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _533 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[117].x, _529);
    float _535 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _537 = _525 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _539 = _533 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _535;
    out.m_64.y = _537;
    out.m_64.z = _527;
    out.m_64.w = _539;
    bool _541 = !_483;
    float _559;
    if (!_541)
    {
        float _543 = in.m_60.x;
        float _545 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _547 = _543 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _549 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[11].w, _121);
        float _551 = _549 * _545;
        float _553 = floor(_551);
        float _555 = -_553;
        float _557 = _551 + _555;
        _559 = _557;
        _561 = true;
    }
    else
    {
        _559 = _173;
    }
    _561 = false;
    float _563 = _559;
    bool _565 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _567 = isnan(_563);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _573 = _569 || _571;
    float _575 = float(_573);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _581 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _583 = isnan(_563);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _593;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _599 = _563 + _597;
    float _601 = 1.0 / _579;
    float _603 = -_575;
    float _605 = _603 + 1.0;
    bool _607 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _609 = _591 * _605;
    float _611 = -_591;
    float _613 = _611 + 1.0;
    float _615 = _595 * _601;
    float _617 = fma(_615, _599, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _619 = _617 * _609;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _625 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[131].x, _619);
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _629 = _621 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _631 = _623 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _633 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[132].x, _625);
    float _635 = _627 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _637 = _633 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_66.x = _629;
    out.m_66.y = _631;
    out.m_66.z = _635;
    out.m_66.w = _637;
    bool _639 = !_607;
    if (!_639)
    {
        float _641 = in.m_60.x;
        float _643 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _645 = _641 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _647 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[14].x, _121);
        float _649 = _647 * _643;
        float _651 = floor(_649);
        float _653 = -_651;
        float _655 = _649 + _653;
        _193 = _655;
    }
    float _657 = _193;
    float _659 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _661 = int(_659);
    float _663 = in.m_60.x;
    float _665 = _365 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _669 = _667 != 0;
    float _671 = in.m_60.z;
    float _673 = in.m_60.w;
    float _675 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _677 = int(_675);
    int _679 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _681 = _679 != 0;
    float _683 = in.m_68.x;
    float _685 = in.m_68.y;
    float _687 = in.m_68.z;
    float _689 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _691 = log2(_689);
    float _693 = float(_661);
    float _695 = 0.0;
    if (!_669)
    {
        float _697 = in.m_60.y;
        _695 = _697;
    }
    float _699 = _695;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _705 = 0.0;
    if (!_669)
    {
        float _707 = in.m_60.z;
        _705 = _707;
    }
    float _709 = _705;
    float _711 = 1.0 / _693;
    float _713 = float(uint(_677));
    float _715 = _663 * 2.0;
    int _717 = ~_677;
    int _719 = _717 + 1;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _723 = _677 == 0;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _727 = 0.0;
    if (_669)
    {
        _727 = _663;
    }
    float _729 = _727;
    float _731 = 1.0 / _713;
    int _733 = ~_677;
    int _735 = _733 + 1;
    float _737 = _729;
    if (!_669)
    {
        _737 = _671;
    }
    float _739 = _737;
    float _741 = _711 * _121;
    float _743 = floor(_715);
    float _745 = 0.0;
    if (!_669)
    {
        _745 = _699;
    }
    float _747 = _745;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _751 = 0.0;
    float _753 = _747;
    if (!_669)
    {
        _751 = _747;
    }
    float _755 = _751;
    int _757 = as_type<int>(_731) + (-2);
    float _759 = trunc(_741);
    int _761 = int(_759);
    float _763 = 0.0;
    float _765 = _709;
    if (!_669)
    {
        _763 = _709;
    }
    float _767 = _763;
    float _769 = _755;
    int _771 = as_type<int>(_699);
    float _773 = _767;
    if (_669)
    {
        float _775 = in.m_60.x;
        float _777 = in.m_60.y;
        _769 = _775;
        _771 = as_type<int>(_777);
    }
    float _779 = _769;
    int _781 = _771;
    float _783 = float(uint(_761));
    float _785 = as_type<float>(_757) * _783;
    float _787 = trunc(_785);
    float _789 = precise::max(_787, 0.0);
    uint _792 = uint(_789);
    bool _794 = !_669;
    float _796 = _794 ? as_type<float>(_781) : _663;
    float _798 = fma(as_type<float>(_781), (*spvDescriptorSet0.vp_c9)._m0[88].w, _749);
    if (_669)
    {
        _753 = as_type<float>(_781);
    }
    float _800 = _753;
    float _802 = as_type<float>(_781) * 2.0;
    float _804 = _800;
    if (_669)
    {
        _773 = _800;
    }
    float _806 = _773;
    if (_669)
    {
        _765 = _800;
    }
    float _808 = _765;
    if (!_669)
    {
        _804 = _663;
    }
    float _810 = _804;
    float _812 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[83].w, _725);
    int _814 = _735 * int(_792);
    int _816 = _814 + _761;
    float _818 = _810 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _820 = float(uint(_816));
    float _822 = as_type<float>(_757) * _820;
    bool _824 = !_669;
    float _826 = _824 ? 1.2345600128173828125 : 1.0;
    float _828 = trunc(_822);
    float _830 = precise::max(_828, 0.0);
    uint _832 = uint(_830);
    float _834 = _826 * _796;
    float _836 = float(_677);
    int _838 = int(_792) + int(_832);
    float _840 = float(_761);
    float _842 = floor(_834);
    int _844 = _719 * _838;
    int _846 = _844 + _761;
    bool _848 = _840 >= _836;
    bool _850 = isnan(_840);
    bool _852 = _848 || _850;
    bool _854 = isnan(_836);
    bool _856 = _852 || _854;
    float _858 = float(_856);
    bool _860 = uint(_846) >= uint(_677);
    float _862 = trunc(_858);
    int _864 = int(_862);
    bool _866 = !_860;
    int _868 = _866 ? 0 : (-1);
    int _870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _872 = _870 != 0;
    int _874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _876 = _874 != 0;
    int _878 = ~_838;
    int _880 = _878 + _868;
    int _882 = _880 + 1;
    float _884 = -_842;
    float _886 = _834 + _884;
    float _888 = _836 * _121;
    int _890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _892 = _890 != 0;
    int _894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _896 = _894 != 0;
    int _898 = _677 * _882;
    int _900 = _898 + _761;
    float _902 = _836 * _886;
    float _904 = _888 * _169;
    int _906 = _677 + (-1);
    int _908 = ~_864;
    int _910 = _908 + 1;
    int _912 = _910 + 1;
    bool _914 = !_723;
    int _916 = _914 ? _900 : (-1);
    float _918 = trunc(_902);
    int _920 = int(_918);
    bool _922 = !_681;
    int _924 = _922 ? 0 : 1;
    bool _926 = !_872;
    int _928 = _926 ? 0 : 1;
    int _930 = _916 * _912;
    bool _932 = !_876;
    int _934 = _932 ? 0 : 1;
    int _936 = abs(_928);
    float _938 = trunc(_904);
    int _940 = int(_938);
    int _942 = abs(_934);
    int _944 = _864 * _906;
    int _946 = _944 + _930;
    int _948 = abs(_924);
    bool _950 = !_892;
    int _952 = _950 ? 0 : 1;
    int _954 = _920 * _948;
    int _956 = _954 + _761;
    bool _958 = !_896;
    int _960 = _958 ? 0 : 1;
    int _962 = abs(_952);
    int _964 = _946 * _942;
    int _966 = abs(_960);
    int _968 = _940 * _936;
    int _970 = _968 + _964;
    float _972 = in.m_70.x;
    float _974 = in.m_70.y;
    float _976 = in.m_70.z;
    int _978 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _980 = _978 != 0;
    int _982 = _956 * _962;
    int _984 = _982 + _970;
    int _986 = ~_677;
    int _988 = _986 + 1;
    float _990 = float(uint(_956));
    int _992 = _920 * _966;
    int _994 = _992 + _984;
    int _996 = ~_677;
    int _998 = _996 + 1;
    float _1000 = float(uint(_994));
    float _1002 = as_type<float>(_757) * _1000;
    float _1004 = trunc(_1002);
    float _1006 = precise::max(_1004, 0.0);
    uint _1008 = uint(_1006);
    int _1010 = _998 * int(_1008);
    int _1012 = _1010 + _994;
    float _1014 = float(uint(_1012));
    float _1016 = as_type<float>(_757) * _1014;
    float _1018 = trunc(_1016);
    float _1020 = precise::max(_1018, 0.0);
    uint _1022 = uint(_1020);
    int _1024 = int(_1008) + int(_1022);
    int _1026 = _988 * _1024;
    int _1028 = _1026 + _994;
    float _1030 = in.m_48.x;
    float _1032 = in.m_48.y;
    float _1034 = in.m_48.z;
    bool _1036 = uint(_1028) >= uint(_677);
    bool _1038 = !_1036;
    int _1040 = _1038 ? 0 : (-1);
    int _1042 = ~_1024;
    int _1044 = _1042 + _1040;
    int _1046 = _1044 + 1;
    int _1048 = _677 * _1046;
    int _1050 = _1048 + _994;
    bool _1052 = !_723;
    int _1054 = _1052 ? _1050 : (-1);
    float _1056 = _1032 * _685;
    int _1058 = _1054 & 3;
    bool _1060 = _1058 != 0;
    float _1062 = _1032 * _974;
    int _1064 = _1054 & 3;
    bool _1066 = _1064 != 0;
    float _1068 = fma(_1030, _683, _1056);
    bool _1070 = uint(_1058) > 1u;
    float _1072 = fma(_1030, _972, _1062);
    int _1074 = _1066 ? 0 : 1;
    float _1076 = fma(_1034, _687, _1068);
    bool _1078 = _673 > 0.5;
    float _1080 = fma(_1034, _976, _1072);
    int _1082 = ~_1074;
    int _1084 = _1082 + 1;
    int _1086 = _1084 + 1;
    float _1088 = -_189;
    int _1090 = _1078 ? as_type<int>(_1088) : as_type<int>(_189);
    int _1092 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1094 = _1092 != 0;
    bool _1096 = !_980;
    float _1098 = _1096 ? _189 : as_type<float>(_1090);
    int _1100 = _1086;
    if (!_1070)
    {
        int _1102 = ~_1074;
        int _1104 = _1102 + 1;
        _1100 = _1104;
    }
    int _1106 = _1100;
    float _1108 = in.m_72.x;
    float _1110 = in.m_72.y;
    float _1112 = in.m_72.z;
    bool _1114 = _671 > 0.5;
    int _1116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1118 = _1116 != 0;
    int _1120 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1122 = _1120 != 0;
    float _1124 = -_189;
    int _1126 = _1114 ? as_type<int>(_1124) : as_type<int>(_189);
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1130 = _1128 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1132 = -_185;
    int _1134 = _1114 ? as_type<int>(_1132) : as_type<int>(_185);
    bool _1136 = !_1122;
    float _1138 = _1136 ? _189 : as_type<float>(_1126);
    bool _1140 = uint(_1058) >= 2u;
    float _1142 = 1.0 / _1130;
    bool _1144 = !_1094;
    float _1146 = _1144 ? _185 : as_type<float>(_1134);
    int _1148 = _1140 ? 0 : 1;
    bool _1150 = _1058 != 3;
    int _1152 = ~_1148;
    int _1154 = _1152 + 1;
    int _1156 = _1154 + 1;
    int _1158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1160 = _1158 != 0;
    float _1162 = _1032 * _1110;
    float _1164 = _691 * _121;
    float _1166 = _739 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1170 = _1168 != 0;
    float _1172 = fma(_1030, _1108, _1162);
    int _1174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1176 = _1174 != 0;
    float _1178 = -_701;
    float _1180 = fma(_1166, 2.0, _1178);
    float _1182 = exp2(_1164);
    int _1184 = _1156;
    if (_1150)
    {
        int _1186 = ~_1148;
        int _1188 = _1186 + 1;
        _1184 = _1188;
    }
    int _1190 = _1184;
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1194 = _1192 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1196 = _663 > 0.5;
    float _1198 = fma(_1034, _1112, _1172);
    float _1200 = _671 * 2.0;
    float _1202 = -_185;
    int _1204 = _1196 ? as_type<int>(_1202) : as_type<int>(_185);
    float _1206 = 1.0 / _1194;
    bool _1208 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1210 = isnan(0.0);
    bool _1212 = _1208 || _1210;
    bool _1214 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1216 = _1212 || _1214;
    float _1218 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1220 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1218);
    float _1222 = _779 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1224 = -_1182;
    float _1226 = _1224 + 1.0;
    float _1228 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1230 = _1228 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1234 = _1232 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1236 = -_721;
    float _1238 = fma(_1222, 2.0, _1236);
    float _1240 = floor(_1200);
    float _1242 = _1216 ? _1226 : 0.0;
    float _1244 = _806 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1246 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1248 = isnan(1.0);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1254 = _1250 || _1252;
    float _1256 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1258 = 1.0 + _1256;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1262 = fma(_1244, -2.0, _703);
    float _1264 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1220);
    float _1266 = fma(_818, -2.0, _1260);
    float _1268 = 1.0 / _1258;
    float _1270 = -_121;
    float _1272 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1180);
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1276 = -_121;
    float _1278 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1238);
    float _1280 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1262);
    float _1282 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1266);
    float _1284 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1274);
    float _1286 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _812);
    float _1288 = 1.0 / _1230;
    float _1290 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1284);
    float _1292 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[87].w, _798);
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1296 = _1294 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1298 = as_type<float>(_757) * _990;
    if (_1254)
    {
        float _1300 = _1242 * _1268;
        _131 = _1300;
    }
    float _1302 = _131;
    bool _1304 = _743 >= 0.0;
    bool _1306 = isnan(_743);
    bool _1308 = _1304 || _1306;
    bool _1310 = isnan(0.0);
    bool _1312 = _1308 || _1310;
    float _1314 = floor(_802);
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1318 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1316;
    int _1320 = _1312 ? 0 : 1;
    float _1322 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1322;
    bool _1326 = _743 > 0.0;
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1330 = _1328 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1332 = 1.0 / _1234;
    int _1334 = ~_1320;
    int _1336 = _1334 + 1;
    int _1338 = _1336 + 1;
    float _1340 = _1318 * _1206;
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1344 = _1342 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1346 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1348 = isnan(_657);
    bool _1350 = _1346 || _1348;
    bool _1352 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1354 = _1350 || _1352;
    float _1356 = float(_1354);
    float _1358 = -_1264;
    float _1360 = _1358 + 1.0;
    int _1362 = ~_677;
    int _1364 = _1362 + 1;
    float _1366 = 1.0 / _1330;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1368;
    int _1372 = _1338;
    if (!_1326)
    {
        int _1374 = ~_1320;
        int _1376 = _1374 + 1;
        _1372 = _1376;
    }
    int _1378 = _1372;
    float _1380 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1382 = _1380 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _1384 = _1314 >= 0.0;
    bool _1386 = isnan(_1314);
    bool _1388 = _1384 || _1386;
    bool _1390 = isnan(0.0);
    bool _1392 = _1388 || _1390;
    float _1394 = -_1356;
    float _1396 = _1394 + 1.0;
    bool _1398 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1400 = isnan(_657);
    bool _1402 = _1398 || _1400;
    bool _1404 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1406 = _1402 || _1404;
    float _1408 = float(_1406);
    float _1410 = _1382 * _1288;
    float _1412 = 1.0 / _1296;
    int _1414 = _1392 ? 0 : 1;
    float _1416 = _1370 * _1332;
    bool _1418 = _1314 > 0.0;
    float _1420 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1422 = _1420 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1424 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1426 = _1424 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _1428 = ~_1414;
    int _1430 = _1428 + 1;
    int _1432 = _1430 + 1;
    float _1434 = 1.0 / _1344;
    float _1436 = _1422 * _1142;
    float _1438 = _1426 * _1366;
    float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1442 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1440;
    bool _1444 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1446 = isnan(_657);
    bool _1448 = _1444 || _1446;
    bool _1450 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1452 = _1448 || _1450;
    float _1454 = float(_1452);
    float _1456 = -_1292;
    float _1458 = _1456 + 1.0;
    int _1460 = abs(_1190);
    float _1462 = -_1290;
    float _1464 = _1462 + 1.0;
    float _1466 = _1324 * _1412;
    bool _1468 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1470 = isnan(_657);
    bool _1472 = _1468 || _1470;
    bool _1474 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1476 = _1472 || _1474;
    float _1478 = float(_1476);
    float _1480 = -_1454;
    float _1482 = _1480 + 1.0;
    int _1484 = _1432;
    if (!_1418)
    {
        int _1486 = ~_1414;
        int _1488 = _1486 + 1;
        _1484 = _1488;
    }
    int _1490 = _1484;
    float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1494 = _657 + _1492;
    bool _1496 = _1240 >= 0.0;
    bool _1498 = isnan(_1240);
    bool _1500 = _1496 || _1498;
    bool _1502 = isnan(0.0);
    bool _1504 = _1500 || _1502;
    float _1506 = -_1478;
    float _1508 = _1506 + 1.0;
    int _1510 = ~_1460;
    int _1512 = _1510 + 1;
    int _1514 = _1512 + 1;
    float _1516 = _1442 * _1434;
    bool _1518 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1520 = isnan(_657);
    bool _1522 = _1518 || _1520;
    bool _1524 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1526 = _1522 || _1524;
    float _1528 = float(_1526);
    float _1530 = fma(_1340, _1494, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _1532 = _1504 ? 0 : 1;
    float _1534 = -_1408;
    float _1536 = _1534 + 1.0;
    bool _1538 = _1240 > 0.0;
    float _1540 = _1528 * _1508;
    float _1542 = -_1528;
    float _1544 = _1542 + 1.0;
    bool _1546 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1548 = isnan(_657);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1554 = _1550 || _1552;
    float _1556 = float(_1554);
    float _1558 = _1454 * _1544;
    float _1560 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1562 = _657 + _1560;
    float _1564 = _1556 * _1482;
    float _1566 = -_1556;
    float _1568 = _1566 + 1.0;
    bool _1570 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1572 = isnan(_657);
    bool _1574 = _1570 || _1572;
    bool _1576 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1578 = _1574 || _1576;
    float _1580 = float(_1578);
    float _1582 = trunc(_1298);
    float _1584 = precise::max(_1582, 0.0);
    uint _1586 = uint(_1584);
    float _1588 = fma(_1410, _1562, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1590 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1592 = isnan(_657);
    bool _1594 = _1590 || _1592;
    bool _1596 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1598 = _1594 || _1596;
    float _1600 = float(_1598);
    float _1602 = _1408 * _1568;
    float _1604 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1606 = _657 + _1604;
    float _1608 = _1600 * _1536;
    float _1610 = -_1600;
    float _1612 = _1610 + 1.0;
    float _1614 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1616 = _657 + _1614;
    float _1618 = fma(_1416, _1606, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1620 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1622 = _657 + _1620;
    float _1624 = _1356 * _1612;
    float _1626 = _1580 * _1396;
    float _1628 = fma(_1436, _1616, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1630 = -_1580;
    float _1632 = _1630 + 1.0;
    int _1634 = _1364 * int(_1586);
    int _1636 = _1634 + _956;
    float _1638 = _1530 * _1626;
    float _1640 = fma(_1466, _1622, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _1642 = ~_1532;
    int _1644 = _1642 + 1;
    int _1646 = _1644 + 1;
    float _1648 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1650 = _657 + _1648;
    float _1652 = float(uint(_1636));
    float _1654 = fma(_1632, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1638);
    int _1656 = _1646;
    if (!_1538)
    {
        int _1658 = ~_1532;
        int _1660 = _1658 + 1;
        _1656 = _1660;
    }
    int _1662 = _1656;
    float _1664 = fma(_1438, _1650, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1666 = as_type<float>(_757) * _1652;
    float _1668 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1670 = _657 + _1668;
    float _1672 = fma(_1588, _1624, _1654);
    int _1674 = _1054 >> 31;
    float _1676 = as_type<float>(_781) + _663;
    float _1678 = fma(_1516, _1670, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1680 = _1146 + 0.5;
    int _1682 = _1674 & 3;
    float _1684 = trunc(_1666);
    float _1686 = precise::max(_1684, 0.0);
    uint _1688 = uint(_1686);
    float _1690 = _1676 + (-1.0);
    float _1692 = fma(_1680, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1278);
    float _1694 = _1198 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1696 = _1054 + _1682;
    float _1698 = _1076 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1700 = fma(_1618, _1608, _1672);
    float _1702 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1704 = _1694 + _1702;
    float _1706 = fma(_1690, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1708 = _1080 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1710 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1712 = _1698 + _1710;
    float _1714 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1716 = ~_677;
    int _1718 = _1716 + 1;
    float _1720 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1722 = _1708 + _1720;
    float _1724 = fma(_1628, _1602, _1700);
    float _1726 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1714);
    float _1728 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1730 = _1696 >> 2;
    float _1732 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1726);
    bool _1734 = !_1170;
    float _1736 = _1734 ? _185 : as_type<float>(_1204);
    float _1738 = fma(_1640, _1564, _1724);
    int _1740 = int(_1586) + int(_1688);
    bool _1742 = as_type<float>(_781) > 0.5;
    float _1744 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1746 = _1730 << 4;
    int _1748 = _1746 + 512;
    int _1750 = _1718 * _1740;
    int _1752 = _1750 + _956;
    float _1754 = -_185;
    int _1756 = _1742 ? as_type<int>(_1754) : as_type<int>(_185);
    float _1758 = fma(_1664, _1558, _1738);
    float _1760 = -_189;
    int _1762 = _1742 ? as_type<int>(_1760) : as_type<int>(_189);
    float _1764 = _1736 + 0.5;
    bool _1766 = _1732 >= 0.0;
    float _1768 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    uint _1770 = uint(int(uint(_1748) >> uint(2)));
    uint _1772 = uint(int(uint(int(_1770)) >> uint(2)));
    int _1774 = int(_1770) & 3;
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[int(_1772)][_1774];
    int _1778 = int(_1770) + 1;
    uint _1780 = uint(int(uint(_1778) >> uint(2)));
    int _1782 = _1778 & 3;
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[int(_1780)][_1782];
    bool _1786 = !_1118;
    float _1788 = _1786 ? _185 : as_type<float>(_1756);
    float _1790 = _1764 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1792 = uint(_1752) >= uint(_677);
    bool _1794 = !_1176;
    float _1796 = _1794 ? _189 : as_type<float>(_1762);
    float _1798 = _1788 + 0.5;
    bool _1800 = _1058 != 3;
    float _1802 = _1744 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _1804 = !_1792;
    int _1806 = _1804 ? 0 : (-1);
    float _1808 = -_1796;
    float _1810 = _1808 + 0.5;
    int _1812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1814 = _1812 != 0;
    int _1816 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1818 = _1816 != 0;
    int _1820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1822 = _1820 != 0;
    float _1824 = fma(_1802, _1798, _1272);
    int _1826 = _1748 + 8;
    uint _1828 = uint(int(uint(_1826) >> uint(2)));
    uint _1830 = uint(int(uint(int(_1828)) >> uint(2)));
    int _1832 = int(_1828) & 3;
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[int(_1830)][_1832];
    int _1836 = int(_1828) + 1;
    uint _1838 = uint(int(uint(_1836) >> uint(2)));
    int _1840 = _1836 & 3;
    float _1842 = (*spvDescriptorSet0.vp_c9)._m0[int(_1838)][_1840];
    float _1844 = _1724;
    int _1846 = as_type<int>(_1802);
    if (_1766)
    {
        _1844 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1848 = _1844;
    float _1850 = _1098 + (-0.5);
    bool _1852 = !_1060;
    int _1854 = _1852 ? 0 : 1;
    float _1856 = _1810 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1858 = -_1850;
    float _1860 = -_1280;
    float _1862 = fma(_1858, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1860);
    if (_1766)
    {
        float _1864 = _1848 * 5.0;
        _1846 = as_type<int>(_1864);
    }
    int _1866 = _1846;
    float _1868 = fma(_1678, _1540, _1758);
    float _1870 = -_1360;
    float _1872 = fma(_1146, _1870, _1692);
    float _1874 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1876 = abs(_1106);
    if (_1766)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6247 = as_type<float>(_1866);
        out.gl_Position.z = _6247;
    }
    float _1878 = -_1286;
    float _1880 = _1878 + 1.0;
    bool _1882 = !_1800;
    int _1884 = _1882 ? 0 : (-1);
    float _1886 = _1790 * _1728;
    int _1888 = ~_1740;
    int _1890 = _1888 + _1806;
    int _1892 = _1890 + 1;
    float _1894 = fma(_1098, _1880, _1862);
    float _1896 = _1704 * _1704;
    int _1898 = abs(_1884);
    float _1900 = _1768 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1902 = _677 * _1892;
    int _1904 = _1902 + _956;
    float _1906 = fma(_1712, _1712, _1896);
    bool _1908 = _677 == 0;
    float _1910 = _1138 + (-0.5);
    float _1912 = _1856 * _1874;
    int _1914 = abs(_1854);
    float _1916 = -_1900;
    float _1918 = -_1282;
    float _1920 = fma(_1916, _1910, _1918);
    int _1922 = ~_1876;
    int _1924 = _1922 + 1;
    int _1926 = _1924 + 1;
    float _1928 = -_1464;
    float _1930 = fma(_1788, _1928, _1824);
    out.m_74.x = _1886;
    out.m_74.y = _1912;
    out.m_74.z = _1872;
    out.m_74.w = _1894;
    float _1932 = fma(_1138, _1458, _1920);
    bool _1934 = !_1908;
    int _1936 = _1934 ? _1904 : (-1);
    float _1938 = fma(_1478, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1868);
    int _1940 = _1926 * as_type<int>(_1784);
    int _1942 = ~_1914;
    int _1944 = _1942 + 1;
    int _1946 = _1944 + 1;
    out.m_76.x = _1930;
    out.m_76.y = _1932;
    bool _1948 = !_1160;
    int _1950 = _1948 ? 0 : 1;
    int _1952 = _1946 * as_type<int>(_1776);
    int _1954 = _1952 + _1940;
    out.m_78.x = _1938;
    int _1956 = abs(_1950);
    float _1958 = _665 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _1960 = _1514 * as_type<int>(_1834);
    int _1962 = _1960 + _1954;
    float _1964 = fma(_1722, _1722, _1906);
    int _1966 = ~_1956;
    int _1968 = _1966 + 1;
    int _1970 = _1968 + 1;
    if (_1766)
    {
        out.m_55.x = 0.0;
    }
    int _1972 = ~_1898;
    int _1974 = _1972 + 1;
    int _1976 = _1974 + 1;
    bool _1978 = !_1814;
    int _1980 = _1978 ? 0 : 1;
    float _1982 = rsqrt(_1964);
    bool _1984 = !_1818;
    int _1986 = _1984 ? 0 : 1;
    int _1988 = _1976 * as_type<int>(_1842);
    int _1990 = _1988 + _1962;
    float _1992 = float(_1378);
    int _1994 = abs(_1986);
    int _1996 = _1990 * _1970;
    float _1998 = float(_1662);
    float _2000 = float(_1994);
    int _2002 = _1936 * _1956;
    int _2004 = _2002 + _1996;
    bool _2006 = !_1822;
    int _2008 = _2006 ? 0 : 1;
    float _2010 = in.m_80.x;
    float _2012 = in.m_80.y;
    float _2014 = in.m_80.z;
    float _2016 = _2000 * _1992;
    float _2018 = float(_2004);
    float _2020 = _1958 * _1982;
    int _2022 = abs(_1980);
    float _2024 = _663 + (-0.5);
    float _2026 = _1704 * _2020;
    float _2028 = _1712 * _2020;
    float _2030 = float(_2022);
    out.m_82.y = _2018;
    float _2032 = -_2026;
    float _2034 = _1704 + _2032;
    float _2036 = -_2028;
    float _2038 = _1712 + _2036;
    float _2040 = _2030 * _1998;
    float _2042 = _2034 * _2034;
    float _2044 = fma(_2038, _2038, _2042);
    float _2046 = _2014;
    if (_1766)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2048 = -_2026;
    float _2050 = _1694 + _2048;
    float _2052 = _1722 * _2020;
    float _2054 = _2040 * (-2.0);
    float _2056 = -_2028;
    float _2058 = _1698 + _2056;
    float _2060 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2062 = _2050 + _2060;
    float _2064 = fma(_2054, _2010, _2010);
    float _2066 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2068 = _2058 + _2066;
    float _2070 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2072 = fma(_1706, _2054, _1706);
    float _2074 = fma(_2024, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2064);
    float _2076 = -_2052;
    float _2078 = _1708 + _2076;
    float _2080 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2070);
    float _2082 = _671 + as_type<float>(_781);
    int _2084 = abs(_2008);
    float _2086 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2088 = _2078 + _2086;
    float _2090 = as_type<float>(_781) + (-0.5);
    float _2092 = _2082 + (-1.0);
    float _2094 = float(_1490);
    float _2096 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2080);
    float _2098 = _2016 * (-2.0);
    float _2100 = fma(_2092, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2102 = float(_2084);
    float _2104 = _671 + _663;
    float _2106 = fma(_2098, _2012, _2012);
    bool _2108 = _2096 >= 0.0;
    float _2110 = fma(_2100, _2098, _2100);
    float _2112 = -_2052;
    float _2114 = _1722 + _2112;
    float _2116 = fma(_2090, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2106);
    float _2118 = fma(_2072, _1302, _2074);
    float _2120 = _2102 * _2094;
    float _2122 = fma(_2110, _1302, _2116);
    float _2124 = _2104 + (-1.0);
    float _2126 = fma(_2114, _2114, _2044);
    float _2128 = _2118 * 0.15915493667125701904296875;
    float _2130 = _2120 * (-2.0);
    float _2132 = _2122 * 0.15915493667125701904296875;
    float _2134 = fma(_2124, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2136 = _2128 * 6.283185482025146484375;
    float _2138 = sin(_2136);
    float _2140 = fma(_2130, _2014, _2014);
    float _2142 = _671 + (-0.5);
    if (_2108)
    {
        _2046 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2144 = _2046;
    float _2146 = fma(_2134, _2130, _2134);
    int _2148 = as_type<int>(_2144);
    if (_2108)
    {
        out.m_55.x = 0.0;
    }
    float _2150 = fma(_2142, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2140);
    float _2152 = _2128 * 6.283185482025146484375;
    float _2154 = cos(_2152);
    if (_2108)
    {
        float _2156 = _2144 * 5.0;
        _2148 = as_type<int>(_2156);
    }
    int _2158 = _2148;
    float _2160 = fma(_2146, _1302, _2150);
    if (_2108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6688 = as_type<float>(_2158);
        out.gl_Position.z = _6688;
    }
    float _2162 = sqrt(_2126);
    float _2164 = _2160 * 0.15915493667125701904296875;
    float _2166 = _2132 * 6.283185482025146484375;
    float _2168 = sin(_2166);
    float _2170 = _2132 * 6.283185482025146484375;
    float _2172 = cos(_2170);
    if (_2108)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2174 = _2164 * 6.283185482025146484375;
    float _2176 = cos(_2174);
    float _2178 = _1982 * _2162;
    float _2180 = _345 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2182 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _189);
    float _2184 = _2138 * _2168;
    float _2186 = _2154 * _2172;
    float _2188 = _2178 * _2180;
    float _2190 = _665 * _2178;
    float _2192 = _2164 * 6.283185482025146484375;
    float _2194 = sin(_2192);
    float _2196 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _2198 = _2182 * _2188;
    float _2200 = _2138 * _2172;
    float _2202 = _2154 * _2168;
    float _2204 = _2196 * _2190;
    float _2206 = _2154 * _2176;
    float _2208 = _2138 * _2176;
    float _2210 = _2172 * _2176;
    float _2212 = _2168 * _2176;
    float _2214 = _2206 * _2198;
    float _2216 = _2178 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2218 = _2216 * 0.5;
    float _2220 = _2208 * _2198;
    float _2222 = fma(_2194, _2186, _2184);
    float _2224 = -_2198;
    float _2226 = _2194 * _2224;
    float _2228 = -_2200;
    float _2230 = fma(_2194, _2202, _2228);
    float _2232 = fma(_2222, _2204, _2214);
    float _2234 = -_2202;
    float _2236 = fma(_2194, _2200, _2234);
    float _2238 = fma(_2210, _2204, _2226);
    float _2240 = _2222 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2242 = fma(_2230, _2218, _2232);
    float _2244 = fma(_2194, _2184, _2186);
    float _2246 = fma(_2236, _2204, _2220);
    float _2248 = fma(_2212, _2218, _2238);
    float _2250 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2252 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2254 = fma(_2244, _2218, _2246);
    float _2256 = _2222 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2258 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2250);
    float _2260 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2252);
    float _2262 = _2222 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2264 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2256);
    float _2266 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2258);
    float _2268 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2260);
    float _2270 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2272 = _2266 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2274 = _2268 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2276 = -_2194;
    float _2278 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2270);
    float _2280 = _1698 + _2272;
    float _2282 = _1708 + _2274;
    float _2284 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2240);
    float _2286 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2262);
    float _2288 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2290 = _2280 + _2288;
    float _2292 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2294 = _2282 + _2292;
    float _2296 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2298 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2300 = _2290 * _2290;
    float _2302 = _2294 * _2294;
    float _2304 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2306 = -_2194;
    float _2308 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2296);
    float _2310 = -_2194;
    float _2312 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2298);
    float _2314 = _2300 + _2302;
    float _2316 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2304);
    float _2318 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2284);
    float _2320 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2264);
    float _2322 = sqrt(_2314);
    float _2324 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2316);
    float _2326 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2286);
    float _2328 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2330 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2332 = _2324 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2334 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2336 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2328);
    float _2338 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2330);
    float _2340 = _1694 + _2332;
    float _2342 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2334);
    bool _2344 = _2322 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2346 = _2296;
    float _2348 = _2212;
    float _2350 = _2230;
    float _2352 = _2328;
    float _2354 = _2330;
    float _2356 = _2318;
    if (!_2344)
    {
        _2346 = _2302;
    }
    float _2358 = _2346;
    float _2360 = _2358;
    if (!_2344)
    {
        _2348 = _2300;
    }
    float _2362 = _2348;
    float _2364 = _2362;
    if (!_2344)
    {
        _2350 = _2280;
    }
    float _2366 = _2350;
    float _2368 = _2366;
    if (!_2344)
    {
        _2352 = _2282;
    }
    float _2370 = _2352;
    float _2372 = _2370;
    if (!_2344)
    {
        _2354 = _2340;
    }
    float _2374 = _2354;
    bool _2376 = !_2344;
    float _2378 = _2374;
    if (!_2376)
    {
        float _2380 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2382 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2384 = _2322 + _2382;
        float _2386 = rsqrt(_2314);
        float _2388 = _2384 * _2380;
        float _2390 = _2340 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2392 = _2388 * 0.15915493667125701904296875;
        float _2394 = _2392 * 6.283185482025146484375;
        float _2396 = sin(_2394);
        float _2398 = _2392 * 6.283185482025146484375;
        float _2400 = cos(_2398);
        float _2402 = fma(_2396, _2390, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2404 = _2386 * _2402;
        float _2406 = _2400 + (-1.0);
        float _2408 = fma(_2290, _2404, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2410 = fma(_2294, _2404, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2412 = _2406 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2414 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2416 = _2408 + _2414;
        float _2418 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2420 = _2410 + _2418;
        float _2422 = fma(_2340, _2400, _2412);
        float _2424 = _2416 * _2416;
        float _2426 = _2420 * _2420;
        _2378 = _2422;
        _2364 = _2424;
        _2360 = _2426;
        _2368 = _2408;
        _2372 = _2410;
    }
    float _2428 = _2378;
    float _2430 = _2364;
    float _2432 = _2360;
    float _2434 = _2368;
    float _2436 = _2372;
    float _2438 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2440 = _2428 + _2438;
    float _2442 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2308);
    float _2444 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2278);
    float _2446 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2448 = fma(_2440, _2440, _2430);
    float _2450 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2312);
    float _2452 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2336);
    float _2454 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2338);
    float _2456 = _2448 + _2432;
    float _2458 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2342);
    float _2460 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2462 = _2446 * _2442;
    float _2464 = _2446 * _2444;
    float _2466 = _2446 * _2450;
    float _2468 = sqrt(_2456);
    float _2470 = fma(_2460, _2318, _2462);
    float _2472 = fma(_2460, _2320, _2464);
    float _2474 = fma(_2460, _2326, _2466);
    float _2476 = _2452 + _2470;
    float _2478 = _2454 + _2472;
    float _2480 = _2458 + _2474;
    out.m_84.x = _2476;
    out.m_84.y = _2478;
    out.m_84.z = _2480;
    bool _2482 = _2468 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2484 = isnan(_2468);
    bool _2486 = _2482 || _2484;
    bool _2488 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2490 = _2486 || _2488;
    float _2492 = _2428;
    float _2494 = _2464;
    if (!_2490)
    {
        _2356 = 1.0;
    }
    float _2496 = _2356;
    bool _2498 = !_2490;
    float _2500 = _2496;
    if (!_2498)
    {
        bool _2502 = _2468 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2504 = isnan(_2468);
        bool _2506 = _2502 || _2504;
        bool _2508 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2510 = _2506 || _2508;
        if (!_2510)
        {
            float _2512 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2514 = _2468 + _2512;
            float _2516 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2518 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2516;
            float _2520 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2522 = _2520 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2524 = 1.0 / _2518;
            float _2526 = _2514 * _2524;
            float _2528 = fma(_2526, _2522, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2500 = _2528;
            _2530 = true;
        }
        else
        {
            bool _2532 = _2468 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2534 = isnan(_2468);
            bool _2536 = _2532 || _2534;
            bool _2538 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2540 = _2536 || _2538;
            if (!_2540)
            {
                float _2542 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2544 = _2468 + _2542;
                float _2546 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2548 = _2546 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2550 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2552 = _2550 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2554 = 1.0 / _2548;
                float _2556 = _2544 * _2554;
                float _2558 = fma(_2556, _2552, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2500 = _2558;
                _2530 = true;
            }
            else
            {
                _2500 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2530 = false;
    float _2560 = _2500;
    float _2562 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2564 = _2428 + _2562;
    float _2566 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2568 = _2434 + _2566;
    float _2570 = fma(_2564, _2560, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2572 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2574 = _2436 + _2572;
    float _2576 = fma(_2568, _2560, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2578 = -_2026;
    float _2580 = _2578 + _2570;
    float _2582 = fma(_2574, _2560, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2584 = -_2028;
    float _2586 = _2584 + _2576;
    float _2588 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2590 = _2580 + _2588;
    float _2592 = -_2052;
    float _2594 = _2592 + _2582;
    float _2596 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2598 = _2586 + _2596;
    float _2600 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2602 = _2590 * _2590;
    float _2604 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2606 = _2594 + _2604;
    float _2608 = fma(_2598, _2598, _2602);
    float _2610 = fma(_2606, _2606, _2608);
    float _2612 = rsqrt(_2610);
    float _2614 = sqrt(_2610);
    float _2616 = _2612 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2618 = _2598 * _2616;
    float _2620 = _2606 * _2616;
    float _2622 = _2618 * _2618;
    float _2624 = _2620 * _2620;
    float _2626 = _2622 + _2624;
    float _2628 = sqrt(_2626);
    bool _2630 = _2628 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2632 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2634 = _2628 + _2632;
    float _2636 = _2606;
    float _2638 = _2626;
    float _2640 = _2634;
    if (_2630)
    {
        float _2642 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2636 = _2642;
    }
    float _2644 = _2636;
    if (_2630)
    {
        float _2646 = rsqrt(_2626);
        _2638 = _2646;
    }
    float _2648 = _2638;
    float _2650 = _2648;
    if (_2630)
    {
        float _2652 = _2634 * _2644;
        _2640 = _2652;
    }
    float _2654 = _2640;
    if (_2630)
    {
        float _2656 = _2654 * 0.15915493667125701904296875;
        _2492 = _2656;
    }
    float _2658 = _2492;
    float _2660 = _2644;
    float _2662 = _2658;
    if (_2630)
    {
        float _2664 = _2658 * 6.283185482025146484375;
        float _2666 = sin(_2664);
        _2660 = _2666;
    }
    float _2668 = _2660;
    float _2670 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2672 = precise::max(0.0, _2670);
    float _2674 = _2612;
    if (_2630)
    {
        float _2676 = _2658 * 6.283185482025146484375;
        float _2678 = cos(_2676);
        _2674 = _2678;
    }
    float _2680 = _2674;
    float _2682 = -_2616;
    float _2684 = -_2672;
    float _2686 = fma(_2590, _2682, _2684);
    float _2688 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _2690 = _2686;
    if (_2630)
    {
        float _2692 = _2686 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2494 = _2692;
    }
    float _2694 = _2494;
    float _2696 = _2694;
    if (!_2630)
    {
        _2662 = _2620;
    }
    float _2698 = _2662;
    float _2700 = fma(_2058, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2702 = _2668;
    float _2704 = _2698;
    if (_2630)
    {
        float _2706 = fma(_2668, _2694, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2696 = _2706;
    }
    float _2708 = _2696;
    float _2710 = _2708;
    if (!_2630)
    {
        _2702 = _2618;
    }
    float _2712 = _2702;
    float _2714 = floor(_2700);
    float _2716 = _2712;
    float _2718 = _2680;
    if (_2630)
    {
        float _2720 = _2680 + (-1.0);
        _2688 = _2720;
    }
    float _2722 = _2688;
    float _2724 = _2722;
    if (_2630)
    {
        float _2726 = _2648 * _2708;
        _2710 = _2726;
    }
    float _2728 = _2710;
    if (_2630)
    {
        float _2730 = _2722 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2650 = _2730;
    }
    float _2732 = _2650;
    if (_2630)
    {
        float _2734 = _2618 * _2728;
        _2716 = _2734;
    }
    float _2736 = _2716;
    if (!_2630)
    {
        _2724 = _2622;
    }
    float _2738 = _2724;
    float _2740 = _2738;
    if (_2630)
    {
        float _2742 = _2620 * _2728;
        _2704 = _2742;
    }
    float _2744 = _2704;
    if (_2630)
    {
        float _2746 = fma(_2686, _2680, _2732);
        _2690 = _2746;
    }
    float _2748 = _2690;
    if (_2630)
    {
        float _2750 = _2736 * _2736;
        _2740 = _2750;
    }
    float _2752 = _2740;
    if (!_2630)
    {
        _2718 = _2624;
    }
    float _2754 = _2718;
    float _2756 = _2754;
    if (_2630)
    {
        float _2758 = _2744 * _2744;
        _2756 = _2758;
    }
    float _2760 = _2756;
    float _2762 = _2580 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2764 = fma(_2748, _2748, _2752);
    float _2766 = _2580 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2768 = _2580 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2770 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2762);
    float _2772 = _2764 + _2760;
    float _2774 = _2580 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2776 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2766);
    float _2778 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2770);
    float _2780 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2782 = fma(_2614, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2780);
    float _2784 = precise::clamp(_2782, 0.0, 1.0);
    float _2786 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2774);
    float _2788 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2776);
    float _2790 = _2778 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2792 = rsqrt(_2772);
    float _2794 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2786);
    float _2796 = _2788 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2798 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2768);
    float _2800 = _2790 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2802 = _2794 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2804 = -_2784;
    float _2806 = _2804 + 1.0;
    float _2808 = _2796 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2810 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2798);
    float _2812 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2800);
    float _2814 = abs(_2806);
    float _2816 = log2(_2814);
    float _2818 = -_2808;
    float _2820 = fma(_2818, _2600, 1.0);
    float _2822 = _2810 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2824 = fma(_2796, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2812);
    float _2826 = -_2714;
    float _2828 = _2700 + _2826;
    float _2830 = _2792 * _2736;
    float _2832 = fma(_2822, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2824);
    float _2834 = _2792 * _2748;
    float _2836 = fma(_2078, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2838 = _2830 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2840 = _2792 * _2744;
    float _2842 = _2790 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2844 = floor(_2836);
    float _2846 = -_2838;
    float _2848 = fma(_2834, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2846);
    float _2850 = _2816 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2852 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2842);
    float _2854 = -_2840;
    float _2856 = fma(_2854, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2848);
    float _2858 = _2790 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2860 = log2(_2820);
    float _2862 = fma(_2856, -0.5, 0.5);
    float _2864 = fma(_2856, 0.5, 0.5);
    float _2866 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2858);
    float _2868 = fma(_2864, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2870 = fma(_2796, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2866);
    float _2872 = 1.0 / _2832;
    float _2874 = -_2844;
    float _2876 = _2836 + _2874;
    float _2878 = fma(_2796, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2852);
    float _2880 = fma(_2864, _2868, -0.212114393711090087890625);
    float _2882 = _2834 + 1.0;
    float _2884 = fma(_2822, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2878);
    float _2886 = fma(_2822, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2870);
    float _2888 = exp2(_2850);
    float _2890 = fma(_2864, _2880, 1.570728778839111328125);
    float _2892 = _2860 * 0.693147182464599609375;
    float _2894 = _2892 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2896 = sqrt(_2862);
    float _2898 = _2884 * _2872;
    float _2900 = _2886 * _2872;
    float _2902 = fma(_2898, 0.5, 0.5);
    float _2904 = fma(_2900, -0.5, 0.5);
    float _2906 = -_2834;
    float _2908 = fma(_2888, _2882, _2906);
    float2 _7959 = float2(_2828, _2876);
    float _2910 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7959, float2(0.0), isnan(_7959)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7959, float2(0.0), isnan(_7959)), level(0.0)).x;
    float3 _7970 = float3(_2902, _2904, _2894);
    float _2912 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7970, float3(0.0), isnan(_7970)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7970, float3(0.0), isnan(_7970)), level(0.0)).x;
    float _2914 = fma(_2908, 0.5, 0.5);
    float _2916 = _2896 * 0.636619746685028076171875;
    float _2918 = -_2890;
    float _2920 = fma(_2916, _2918, 1.0);
    float3 _7991 = float3(_2902, _2904, _2894);
    float4 _2923 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7991, float3(0.0), isnan(_7991)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7991, float3(0.0), isnan(_7991)), level(0.0)).xyzw;
    float _2925 = _2923.x;
    float _2927 = _2923.y;
    float _2929 = _2923.z;
    float _2931 = _2923.w;
    float2 _8007 = float2(_2920, _2914);
    float3 _2935 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8007, float2(0.0), isnan(_8007)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8007, float2(0.0), isnan(_8007)), level(0.0)).xyz;
    float _2937 = _2935.x;
    float _2939 = _2935.y;
    float _2941 = _2935.z;
    float _2943 = _2050 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2945 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2943);
    float _2947 = _2050 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2949 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2945);
    float _2951 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2947);
    float _2953 = _2949 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2955 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2951);
    float _2957 = 1.0 / _2953;
    float _2959 = _2955 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2961 = _2959 + _2953;
    float _2963 = _2961 * _2957;
    float _2965 = _2963 * 0.5;
    float _2967 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2969 = fma(_2965, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2967);
    float _2971 = 1.0 / _2969;
    float _2973 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2975 = _2971 * _2973;
    float _2977 = abs(_2975);
    float _2979 = log2(_2977);
    bool _2981 = _2975 <= 8000.0;
    bool _2983 = isnan(_2975);
    bool _2985 = _2981 || _2983;
    bool _2987 = isnan(8000.0);
    bool _2989 = _2985 || _2987;
    float _2991 = float(_2989);
    bool _2993 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2995 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2997 = _2993 || _2995;
    bool _2999 = isnan(0.5);
    bool _3001 = _2997 || _2999;
    float _3003 = _2979 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3005 = exp2(_3003);
    float _3007 = fma(_3005, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3009 = precise::clamp(_3007, 0.0, 1.0);
    float _3011 = _2790 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3013 = _2790;
    float _3015 = _2832;
    float _3017 = _2886;
    float _3019 = _2884;
    if (_3001)
    {
        _3013 = 1.0;
    }
    float _3021 = _3013;
    float _3023 = fma(_3009, -2.0, 3.0);
    float _3025 = _3009 * _3009;
    float _3027 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3011);
    float _3029 = in.m_86.x;
    float _3031 = _3025 * _3023;
    float _3033 = _2816 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3035 = fma(_2796, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3027);
    float _3037 = -_3031;
    float _3039 = _3037 + 1.0;
    float _3041 = exp2(_3033);
    float _3043 = fma(_2822, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3035);
    float _3045 = _2832 * 0.5;
    float _3047 = fma(_3039, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3031);
    float _3049 = _2884 + _2832;
    float _3051 = _3043 + _2832;
    float _3053 = fma(_2886, -0.5, _3045);
    float _3055 = _3049 * 0.5;
    float _3057 = _3051 * 0.5;
    float _3059 = _3021;
    float _3061 = _3043;
    float _3063 = _3053;
    float _3065 = _3055;
    if (!_3001)
    {
        float _3067 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3069 = _3067 * 0.15915493667125701904296875;
        float _3071 = _3069 * 6.283185482025146484375;
        float _3073 = cos(_3071);
        float _3075 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3077 = _3075 * 0.15915493667125701904296875;
        float _3079 = _3069 * 6.283185482025146484375;
        float _3081 = sin(_3079);
        float _3083 = 1.0 / _3073;
        float _3085 = _3077 * 6.283185482025146484375;
        float _3087 = cos(_3085);
        float _3089 = _3081 * _3083;
        float _3091 = _3077 * 6.283185482025146484375;
        float _3093 = sin(_3091);
        float _3095 = _3087 * _3089;
        float _3097 = 1.0 / _3095;
        float _3099 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3101 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3099;
        float _3103 = 1.0 / _3101;
        float _3105 = _3093 * _3097;
        float _3107 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3109 = fma(_2975, _3105, _3107);
        float _3111 = _3109 * _3103;
        float _3113 = precise::clamp(_3111, 0.0, 1.0);
        _3059 = _3113;
    }
    float _3115 = _3059;
    float _3117 = _2991 * _3047;
    float _3119 = -_3041;
    float _3121 = _3119 + 1.0;
    float _3123 = -_2910;
    float _3125 = _3123 + 1.0;
    float _3127 = _3117 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3129 = _3121 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3131 = _2614 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3133 = isnan(_2614);
    bool _3135 = _3131 || _3133;
    bool _3137 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3139 = _3135 || _3137;
    float _3141 = _3125 * _3127;
    float _3143 = precise::clamp(_3141, 0.0, 1.0);
    float _3145 = _3129 * _2912;
    float _3147 = -_3129;
    float _3149 = _3147 + 1.0;
    out.gl_Position.x = _2884;
    out.gl_Position.y = _2886;
    out.gl_Position.z = _3043;
    out.gl_Position.w = _2832;
    float _3151 = -_3143;
    float _3153 = fma(_3151, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3155 = _2931 * _3145;
    float _3157 = _2941 * _3145;
    float _3159 = _2931 * _3149;
    float _3161 = _3153 * _3029;
    float _3163 = fma(_2937, _3155, _2925);
    float _3165 = fma(_2939, _3155, _2927);
    float _3167 = fma(_2931, _3157, _2929);
    float _3169 = _3161 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_88.x = _3055;
    out.m_88.y = _3053;
    out.m_88.z = _3057;
    out.m_88.w = _2832;
    out.m_90.x = _3169;
    if (!_3139)
    {
        _3015 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3171 = _3015;
    float _3173 = _3171;
    float _3175 = _3171;
    if (!_3139)
    {
        _3061 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3177 = _3061;
    out.m_92.x = _3163;
    out.m_92.y = _3165;
    out.m_92.z = _3167;
    out.m_92.w = _3159;
    float _3179 = _3177;
    float _3181 = _3177;
    if (!_3139)
    {
        _3017 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3183 = _3017;
    float _3185 = _3183;
    float _3187 = _3183;
    if (!_3139)
    {
        _3019 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3189 = _3019;
    float _3191 = _3189;
    float _3193 = _3189;
    if (!_3139)
    {
        _3063 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3195 = _3063;
    float _3197 = _3115 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3199 = _3195;
    float _3201 = _3195;
    if (!_3139)
    {
        _3065 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3203 = _3065;
    bool _3205 = !_3139;
    float _3207 = _3203;
    float _3209 = _3203;
    if (!_3205)
    {
        bool _3211 = _2614 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3213 = isnan(_2614);
        bool _3215 = _3211 || _3213;
        bool _3217 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3219 = _3215 || _3217;
        if (!_3219)
        {
            float _3221 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3223 = _2614 + _3221;
            float _3225 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3227 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3225;
            float _3229 = 1.0 / _3227;
            float _3231 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3233 = _3231 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3235 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3237 = _3235 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3239 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3241 = _3239 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3243 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3245 = _3243 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3247 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3249 = _3247 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3251 = _3223 * _3229;
            float _3253 = precise::clamp(_3251, 0.0, 1.0);
            float _3255 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3257 = _3255 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3259 = fma(_3253, _3233, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3261 = fma(_3253, _3257, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3263 = fma(_3253, _3237, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3265 = fma(_3253, _3241, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3267 = fma(_3253, _3245, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3269 = fma(_3253, _3249, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3209 = _3261;
            _3187 = _3267;
            _3201 = _3259;
            _3181 = _3265;
            _3175 = _3263;
            _3193 = _3269;
            _3271 = true;
        }
        else
        {
            bool _3273 = _2614 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3275 = isnan(_2614);
            bool _3277 = _3273 || _3275;
            bool _3279 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3281 = _3277 || _3279;
            if (!_3281)
            {
                _3199 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3283 = _3199;
            _3201 = _3283;
            if (!_3281)
            {
                _3207 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3285 = _3207;
            _3209 = _3285;
            if (!_3281)
            {
                _3173 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3287 = _3173;
            _3175 = _3287;
            if (!_3281)
            {
                _3179 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3289 = _3179;
            _3181 = _3289;
            if (!_3281)
            {
                _3185 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3291 = _3185;
            _3187 = _3291;
            if (!_3281)
            {
                _3191 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3293 = _3191;
            bool _3295 = !_3281;
            _3193 = _3293;
            if (!_3295)
            {
                bool _3297 = _2614 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3299 = isnan(_2614);
                bool _3301 = _3297 || _3299;
                bool _3303 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3305 = _3301 || _3303;
                if (!_3305)
                {
                    float _3307 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3309 = _2614 + _3307;
                    float _3311 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3313 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3311;
                    float _3315 = 1.0 / _3313;
                    float _3317 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3319 = _3317 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3321 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3323 = _3321 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3325 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3327 = _3325 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3329 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3331 = _3329 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3333 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3335 = _3333 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3337 = _3309 * _3315;
                    float _3339 = precise::clamp(_3337, 0.0, 1.0);
                    float _3341 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3343 = _3341 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3345 = fma(_3339, _3319, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3347 = fma(_3339, _3343, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3349 = fma(_3339, _3323, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3351 = fma(_3339, _3327, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3353 = fma(_3339, _3331, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3355 = fma(_3339, _3335, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3209 = _3347;
                    _3187 = _3353;
                    _3201 = _3345;
                    _3181 = _3351;
                    _3175 = _3349;
                    _3193 = _3355;
                    _3271 = true;
                }
                else
                {
                    _3209 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3187 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3201 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3181 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3175 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3193 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3271 = false;
    float _3357 = _3209;
    float _3359 = _3187;
    float _3361 = _3201;
    float _3363 = _3181;
    float _3365 = _3175;
    float _3367 = _3193;
    float _3369 = fma(_2478, -0.5, 0.5);
    float _3371 = precise::clamp(_3369, 0.0, 1.0);
    float _3373 = -_3357;
    float _3375 = _3373 + _3359;
    float _3377 = -_3361;
    float _3379 = _3377 + _3363;
    out.m_94.x = 0.0;
    float _3381 = fma(_3371, _3375, _3357);
    float _3383 = -_3365;
    float _3385 = _3383 + _3367;
    float _3387 = fma(_3371, _3379, _3361);
    float _3389 = _3381 * 0.586610972881317138671875;
    bool _3391 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3393 = fma(_3371, _3385, _3365);
    float _3395 = _3197 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3397 = fma(_3387, 0.298911988735198974609375, _3389);
    bool _3399 = _3115 > 0.0;
    bool _3401 = isnan(_3115);
    bool _3403 = _3399 || _3401;
    bool _3405 = isnan(0.0);
    bool _3407 = _3403 || _3405;
    float _3409 = fma(_3393, 0.114477999508380889892578125, _3397);
    out.m_55.x = _3395;
    float _3411 = -_3409;
    float _3413 = _3387 + _3411;
    float _3415 = -_3409;
    float _3417 = _3381 + _3415;
    float _3419 = -_3409;
    float _3421 = _3393 + _3419;
    float _3423 = fma(_3413, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3409);
    float _3425 = fma(_3417, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3409);
    float _3427 = fma(_3421, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3409);
    bool _3429 = !_3391;
    if (!_3429)
    {
        float _3431 = -_2580;
        float _3433 = _3431 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3435 = -_2586;
        float _3437 = _3435 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3439 = -_2594;
        float _3441 = _3439 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3443 = _3433 * _3433;
        float _3445 = fma(_3437, _3437, _3443);
        float _3447 = fma(_3441, _3441, _3445);
        float _3449 = sqrt(_3447);
        float _3451 = rsqrt(_3447);
        float _3453 = -_3449;
        float _3455 = _3453 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3457 = _3455 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3459 = precise::clamp(_3457, 0.0, 1.0);
        float _3461 = _3437 * _3451;
        float _3463 = _3433 * _3451;
        float _3465 = abs(_3459);
        float _3467 = log2(_3465);
        float _3469 = _3441 * _3451;
        float _3471 = _3461 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3473 = _2478 * _3463;
        float _3475 = -_3463;
        float _3477 = -_3471;
        float _3479 = fma(_3475, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3477);
        float _3481 = fma(_2476, _3461, _3473);
        float _3483 = -_3469;
        float _3485 = fma(_3483, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3479);
        float _3487 = fma(_2480, _3469, _3481);
        float _3489 = precise::clamp(_3487, 0.0, 1.0);
        float _3491 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3493 = _3485 + _3491;
        float _3495 = _3467 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3497 = _3493 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3499 = precise::clamp(_3497, 0.0, 1.0);
        float _3501 = exp2(_3495);
        float _3503 = _3501 * _3499;
        float _3505 = _3489 * _3503;
        float _3507 = _3505 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3509 = _3505 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3511 = _3505 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_94.x = _3507;
        out.m_94.y = _3509;
        out.m_94.z = _3511;
    }
    out.m_96.x = _3423;
    out.m_96.y = _3425;
    out.m_96.z = _3427;
    if (_3407)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_55.x = 0.0;
    float _3513 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3513;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3271 = false;
    bool _2530 = false;
    bool _561 = false;
    bool _425 = false;
    bool _309 = false;
    bool _213 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_48.w;
    float _112 = in.m_50.w;
    float _114 = trunc(_110);
    int _117 = int(_114);
    float _119 = -_112;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _121;
    bool _125 = _117 >= 1;
    float _127 = 0.0;
    float _129 = _112;
    float _131 = _121;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _127;
    if (!_125)
    {
        out.m_55.x = 0.0;
    }
    int _135 = 0;
    if (!_125)
    {
        float _137 = _133 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3581 = as_type<float>(_139);
        out.gl_Position.z = _3581;
    }
    if (!_125)
    {
        return out;
    }
    bool _143 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_112);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = float(_117);
    bool _155 = _121 >= _153;
    bool _157 = !_151;
    bool _159 = _155 || _157;
    if (_159)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _129;
    if (_159)
    {
        out.m_55.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _141 = as_type<int>(_163);
    }
    int _165 = _141;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3636 = as_type<float>(_165);
        out.gl_Position.z = _3636;
    }
    if (_159)
    {
        return out;
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = 1.0 / _153;
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _173 = _121 * _169;
    int _175 = as_type<int>(_167) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_167) & 2;
    bool _181 = _179 != 0;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_171;
    float _193 = _173;
    float _211;
    if (!_191)
    {
        float _195 = in.m_60.x;
        float _197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _203 = _201 * _197;
        float _205 = floor(_203);
        float _207 = -_205;
        float _209 = _203 + _207;
        _211 = _209;
        _213 = true;
    }
    else
    {
        _211 = _173;
    }
    _213 = false;
    float _215 = _211;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _219 = _215 + _217;
    bool _221 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _223 = isnan(_215);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _233;
    float _237 = -_231;
    float _239 = _237 + 1.0;
    bool _241 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _243 = 1.0 / _235;
    float _245 = _219 * _243;
    bool _247 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _249 = isnan(_215);
    bool _251 = _247 || _249;
    bool _253 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _255 = _251 || _253;
    float _257 = float(_255);
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _259;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _263;
    float _267 = _257 * _239;
    float _269 = fma(_261, _245, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _271 = fma(_265, _245, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _273 = -_257;
    float _275 = _273 + 1.0;
    float _277 = _269 * _267;
    float _279 = _271 * _267;
    float _281 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[143].x, _277);
    float _283 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[143].y, _279);
    float _285 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].x, _281);
    float _287 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].y, _283);
    bool _289 = !_241;
    float _307;
    if (!_289)
    {
        float _291 = in.m_60.x;
        float _293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _295 = _291 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _299 = _297 * _293;
        float _301 = floor(_299);
        float _303 = -_301;
        float _305 = _299 + _303;
        _307 = _305;
        _309 = true;
    }
    else
    {
        _307 = _173;
    }
    _309 = false;
    float _311 = _307;
    float _313 = in.m_62.x;
    float _315 = in.m_62.y;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _319 = _311 + _317;
    bool _321 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _323 = isnan(_311);
    bool _325 = _321 || _323;
    bool _327 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _329 = _325 || _327;
    float _331 = float(_329);
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _333;
    bool _337 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _339 = 1.0 / _335;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _341;
    float _345 = _287 * _315;
    float _347 = _319 * _339;
    bool _349 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _351 = isnan(_311);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = -_331;
    float _363 = _361 + 1.0;
    float _365 = _285 * _313;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _367;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _371;
    float _375 = _359 * _363;
    float _377 = fma(_343, _347, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _379 = fma(_369, _347, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _381 = fma(_373, _347, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _383 = -_359;
    float _385 = _383 + 1.0;
    float _387 = _377 * _375;
    float _389 = _379 * _375;
    float _391 = _381 * _375;
    float _393 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[107].y, _387);
    float _395 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[107].x, _389);
    float _397 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[107].z, _391);
    float _399 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[108].y, _393);
    float _401 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[108].x, _395);
    float _403 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[108].z, _397);
    bool _405 = !_337;
    float _423;
    if (!_405)
    {
        float _407 = in.m_60.x;
        float _409 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _411 = _407 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _413 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _415 = _413 * _409;
        float _417 = floor(_415);
        float _419 = -_417;
        float _421 = _415 + _419;
        _423 = _421;
        _425 = true;
    }
    else
    {
        _423 = _173;
    }
    _425 = false;
    float _427 = _423;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _433 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _435 = isnan(_427);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _441 = _437 || _439;
    float _443 = float(_441);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _449 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _451 = isnan(_427);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = 1.0 / _431;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _463;
    float _467 = -_443;
    float _469 = _467 + 1.0;
    bool _471 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _473 = isnan(_427);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    bool _483 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _485 = 1.0 / _447;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _491 = _465 * _461;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _495 = _427 + _493;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _499 = _427 + _497;
    float _501 = fma(_491, _495, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _503 = _459 * _469;
    float _505 = -_459;
    float _507 = _505 + 1.0;
    float _509 = _489 * _485;
    float _511 = -_481;
    float _513 = _511 + 1.0;
    float _515 = _501 * _503;
    float _517 = _403 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _519 = fma(_509, _499, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _521 = _443 * _513;
    float _523 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[115].x, _515);
    float _525 = _399 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _527 = _517 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _529 = fma(_519, _521, _523);
    float _531 = _401 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _533 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[117].x, _529);
    float _535 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _537 = _525 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _539 = _533 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _535;
    out.m_64.y = _537;
    out.m_64.z = _527;
    out.m_64.w = _539;
    bool _541 = !_483;
    float _559;
    if (!_541)
    {
        float _543 = in.m_60.x;
        float _545 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _547 = _543 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _549 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[11].w, _121);
        float _551 = _549 * _545;
        float _553 = floor(_551);
        float _555 = -_553;
        float _557 = _551 + _555;
        _559 = _557;
        _561 = true;
    }
    else
    {
        _559 = _173;
    }
    _561 = false;
    float _563 = _559;
    bool _565 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _567 = isnan(_563);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _573 = _569 || _571;
    float _575 = float(_573);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _581 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _583 = isnan(_563);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _593;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _599 = _563 + _597;
    float _601 = 1.0 / _579;
    float _603 = -_575;
    float _605 = _603 + 1.0;
    bool _607 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _609 = _591 * _605;
    float _611 = -_591;
    float _613 = _611 + 1.0;
    float _615 = _595 * _601;
    float _617 = fma(_615, _599, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _619 = _617 * _609;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _625 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[131].x, _619);
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _629 = _621 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _631 = _623 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _633 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[132].x, _625);
    float _635 = _627 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _637 = _633 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_66.x = _629;
    out.m_66.y = _631;
    out.m_66.z = _635;
    out.m_66.w = _637;
    bool _639 = !_607;
    if (!_639)
    {
        float _641 = in.m_60.x;
        float _643 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _645 = _641 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _647 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[14].x, _121);
        float _649 = _647 * _643;
        float _651 = floor(_649);
        float _653 = -_651;
        float _655 = _649 + _653;
        _193 = _655;
    }
    float _657 = _193;
    float _659 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _661 = int(_659);
    float _663 = in.m_60.x;
    float _665 = _365 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _669 = _667 != 0;
    float _671 = in.m_60.z;
    float _673 = in.m_60.w;
    float _675 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _677 = int(_675);
    int _679 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _681 = _679 != 0;
    float _683 = in.m_68.x;
    float _685 = in.m_68.y;
    float _687 = in.m_68.z;
    float _689 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _691 = log2(_689);
    float _693 = float(_661);
    float _695 = 0.0;
    if (!_669)
    {
        float _697 = in.m_60.y;
        _695 = _697;
    }
    float _699 = _695;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _705 = 0.0;
    if (!_669)
    {
        float _707 = in.m_60.z;
        _705 = _707;
    }
    float _709 = _705;
    float _711 = 1.0 / _693;
    float _713 = float(uint(_677));
    float _715 = _663 * 2.0;
    int _717 = ~_677;
    int _719 = _717 + 1;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _723 = _677 == 0;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _727 = 0.0;
    if (_669)
    {
        _727 = _663;
    }
    float _729 = _727;
    float _731 = 1.0 / _713;
    int _733 = ~_677;
    int _735 = _733 + 1;
    float _737 = _729;
    if (!_669)
    {
        _737 = _671;
    }
    float _739 = _737;
    float _741 = _711 * _121;
    float _743 = floor(_715);
    float _745 = 0.0;
    if (!_669)
    {
        _745 = _699;
    }
    float _747 = _745;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _751 = 0.0;
    float _753 = _747;
    if (!_669)
    {
        _751 = _747;
    }
    float _755 = _751;
    int _757 = as_type<int>(_731) + (-2);
    float _759 = trunc(_741);
    int _761 = int(_759);
    float _763 = 0.0;
    float _765 = _709;
    if (!_669)
    {
        _763 = _709;
    }
    float _767 = _763;
    float _769 = _755;
    int _771 = as_type<int>(_699);
    float _773 = _767;
    if (_669)
    {
        float _775 = in.m_60.x;
        float _777 = in.m_60.y;
        _769 = _775;
        _771 = as_type<int>(_777);
    }
    float _779 = _769;
    int _781 = _771;
    float _783 = float(uint(_761));
    float _785 = as_type<float>(_757) * _783;
    float _787 = trunc(_785);
    float _789 = precise::max(_787, 0.0);
    uint _792 = uint(_789);
    bool _794 = !_669;
    float _796 = _794 ? as_type<float>(_781) : _663;
    float _798 = fma(as_type<float>(_781), (*spvDescriptorSet0.vp_c9)._m0[88].w, _749);
    if (_669)
    {
        _753 = as_type<float>(_781);
    }
    float _800 = _753;
    float _802 = as_type<float>(_781) * 2.0;
    float _804 = _800;
    if (_669)
    {
        _773 = _800;
    }
    float _806 = _773;
    if (_669)
    {
        _765 = _800;
    }
    float _808 = _765;
    if (!_669)
    {
        _804 = _663;
    }
    float _810 = _804;
    float _812 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[83].w, _725);
    int _814 = _735 * int(_792);
    int _816 = _814 + _761;
    float _818 = _810 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _820 = float(uint(_816));
    float _822 = as_type<float>(_757) * _820;
    bool _824 = !_669;
    float _826 = _824 ? 1.2345600128173828125 : 1.0;
    float _828 = trunc(_822);
    float _830 = precise::max(_828, 0.0);
    uint _832 = uint(_830);
    float _834 = _826 * _796;
    float _836 = float(_677);
    int _838 = int(_792) + int(_832);
    float _840 = float(_761);
    float _842 = floor(_834);
    int _844 = _719 * _838;
    int _846 = _844 + _761;
    bool _848 = _840 >= _836;
    bool _850 = isnan(_840);
    bool _852 = _848 || _850;
    bool _854 = isnan(_836);
    bool _856 = _852 || _854;
    float _858 = float(_856);
    bool _860 = uint(_846) >= uint(_677);
    float _862 = trunc(_858);
    int _864 = int(_862);
    bool _866 = !_860;
    int _868 = _866 ? 0 : (-1);
    int _870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _872 = _870 != 0;
    int _874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _876 = _874 != 0;
    int _878 = ~_838;
    int _880 = _878 + _868;
    int _882 = _880 + 1;
    float _884 = -_842;
    float _886 = _834 + _884;
    float _888 = _836 * _121;
    int _890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _892 = _890 != 0;
    int _894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _896 = _894 != 0;
    int _898 = _677 * _882;
    int _900 = _898 + _761;
    float _902 = _836 * _886;
    float _904 = _888 * _169;
    int _906 = _677 + (-1);
    int _908 = ~_864;
    int _910 = _908 + 1;
    int _912 = _910 + 1;
    bool _914 = !_723;
    int _916 = _914 ? _900 : (-1);
    float _918 = trunc(_902);
    int _920 = int(_918);
    bool _922 = !_681;
    int _924 = _922 ? 0 : 1;
    bool _926 = !_872;
    int _928 = _926 ? 0 : 1;
    int _930 = _916 * _912;
    bool _932 = !_876;
    int _934 = _932 ? 0 : 1;
    int _936 = abs(_928);
    float _938 = trunc(_904);
    int _940 = int(_938);
    int _942 = abs(_934);
    int _944 = _864 * _906;
    int _946 = _944 + _930;
    int _948 = abs(_924);
    bool _950 = !_892;
    int _952 = _950 ? 0 : 1;
    int _954 = _920 * _948;
    int _956 = _954 + _761;
    bool _958 = !_896;
    int _960 = _958 ? 0 : 1;
    int _962 = abs(_952);
    int _964 = _946 * _942;
    int _966 = abs(_960);
    int _968 = _940 * _936;
    int _970 = _968 + _964;
    float _972 = in.m_70.x;
    float _974 = in.m_70.y;
    float _976 = in.m_70.z;
    int _978 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _980 = _978 != 0;
    int _982 = _956 * _962;
    int _984 = _982 + _970;
    int _986 = ~_677;
    int _988 = _986 + 1;
    float _990 = float(uint(_956));
    int _992 = _920 * _966;
    int _994 = _992 + _984;
    int _996 = ~_677;
    int _998 = _996 + 1;
    float _1000 = float(uint(_994));
    float _1002 = as_type<float>(_757) * _1000;
    float _1004 = trunc(_1002);
    float _1006 = precise::max(_1004, 0.0);
    uint _1008 = uint(_1006);
    int _1010 = _998 * int(_1008);
    int _1012 = _1010 + _994;
    float _1014 = float(uint(_1012));
    float _1016 = as_type<float>(_757) * _1014;
    float _1018 = trunc(_1016);
    float _1020 = precise::max(_1018, 0.0);
    uint _1022 = uint(_1020);
    int _1024 = int(_1008) + int(_1022);
    int _1026 = _988 * _1024;
    int _1028 = _1026 + _994;
    float _1030 = in.m_48.x;
    float _1032 = in.m_48.y;
    float _1034 = in.m_48.z;
    bool _1036 = uint(_1028) >= uint(_677);
    bool _1038 = !_1036;
    int _1040 = _1038 ? 0 : (-1);
    int _1042 = ~_1024;
    int _1044 = _1042 + _1040;
    int _1046 = _1044 + 1;
    int _1048 = _677 * _1046;
    int _1050 = _1048 + _994;
    bool _1052 = !_723;
    int _1054 = _1052 ? _1050 : (-1);
    float _1056 = _1032 * _685;
    int _1058 = _1054 & 3;
    bool _1060 = _1058 != 0;
    float _1062 = _1032 * _974;
    int _1064 = _1054 & 3;
    bool _1066 = _1064 != 0;
    float _1068 = fma(_1030, _683, _1056);
    bool _1070 = uint(_1058) > 1u;
    float _1072 = fma(_1030, _972, _1062);
    int _1074 = _1066 ? 0 : 1;
    float _1076 = fma(_1034, _687, _1068);
    bool _1078 = _673 > 0.5;
    float _1080 = fma(_1034, _976, _1072);
    int _1082 = ~_1074;
    int _1084 = _1082 + 1;
    int _1086 = _1084 + 1;
    float _1088 = -_189;
    int _1090 = _1078 ? as_type<int>(_1088) : as_type<int>(_189);
    int _1092 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1094 = _1092 != 0;
    bool _1096 = !_980;
    float _1098 = _1096 ? _189 : as_type<float>(_1090);
    int _1100 = _1086;
    if (!_1070)
    {
        int _1102 = ~_1074;
        int _1104 = _1102 + 1;
        _1100 = _1104;
    }
    int _1106 = _1100;
    float _1108 = in.m_72.x;
    float _1110 = in.m_72.y;
    float _1112 = in.m_72.z;
    bool _1114 = _671 > 0.5;
    int _1116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1118 = _1116 != 0;
    int _1120 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1122 = _1120 != 0;
    float _1124 = -_189;
    int _1126 = _1114 ? as_type<int>(_1124) : as_type<int>(_189);
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1130 = _1128 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1132 = -_185;
    int _1134 = _1114 ? as_type<int>(_1132) : as_type<int>(_185);
    bool _1136 = !_1122;
    float _1138 = _1136 ? _189 : as_type<float>(_1126);
    bool _1140 = uint(_1058) >= 2u;
    float _1142 = 1.0 / _1130;
    bool _1144 = !_1094;
    float _1146 = _1144 ? _185 : as_type<float>(_1134);
    int _1148 = _1140 ? 0 : 1;
    bool _1150 = _1058 != 3;
    int _1152 = ~_1148;
    int _1154 = _1152 + 1;
    int _1156 = _1154 + 1;
    int _1158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1160 = _1158 != 0;
    float _1162 = _1032 * _1110;
    float _1164 = _691 * _121;
    float _1166 = _739 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1170 = _1168 != 0;
    float _1172 = fma(_1030, _1108, _1162);
    int _1174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1176 = _1174 != 0;
    float _1178 = -_701;
    float _1180 = fma(_1166, 2.0, _1178);
    float _1182 = exp2(_1164);
    int _1184 = _1156;
    if (_1150)
    {
        int _1186 = ~_1148;
        int _1188 = _1186 + 1;
        _1184 = _1188;
    }
    int _1190 = _1184;
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1194 = _1192 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1196 = _663 > 0.5;
    float _1198 = fma(_1034, _1112, _1172);
    float _1200 = _671 * 2.0;
    float _1202 = -_185;
    int _1204 = _1196 ? as_type<int>(_1202) : as_type<int>(_185);
    float _1206 = 1.0 / _1194;
    bool _1208 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1210 = isnan(0.0);
    bool _1212 = _1208 || _1210;
    bool _1214 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1216 = _1212 || _1214;
    float _1218 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1220 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1218);
    float _1222 = _779 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1224 = -_1182;
    float _1226 = _1224 + 1.0;
    float _1228 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1230 = _1228 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1234 = _1232 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1236 = -_721;
    float _1238 = fma(_1222, 2.0, _1236);
    float _1240 = floor(_1200);
    float _1242 = _1216 ? _1226 : 0.0;
    float _1244 = _806 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1246 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1248 = isnan(1.0);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1254 = _1250 || _1252;
    float _1256 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1258 = 1.0 + _1256;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1262 = fma(_1244, -2.0, _703);
    float _1264 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1220);
    float _1266 = fma(_818, -2.0, _1260);
    float _1268 = 1.0 / _1258;
    float _1270 = -_121;
    float _1272 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1180);
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1276 = -_121;
    float _1278 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1238);
    float _1280 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1262);
    float _1282 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1266);
    float _1284 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1274);
    float _1286 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _812);
    float _1288 = 1.0 / _1230;
    float _1290 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1284);
    float _1292 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[87].w, _798);
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1296 = _1294 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1298 = as_type<float>(_757) * _990;
    if (_1254)
    {
        float _1300 = _1242 * _1268;
        _131 = _1300;
    }
    float _1302 = _131;
    bool _1304 = _743 >= 0.0;
    bool _1306 = isnan(_743);
    bool _1308 = _1304 || _1306;
    bool _1310 = isnan(0.0);
    bool _1312 = _1308 || _1310;
    float _1314 = floor(_802);
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1318 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1316;
    int _1320 = _1312 ? 0 : 1;
    float _1322 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1322;
    bool _1326 = _743 > 0.0;
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1330 = _1328 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1332 = 1.0 / _1234;
    int _1334 = ~_1320;
    int _1336 = _1334 + 1;
    int _1338 = _1336 + 1;
    float _1340 = _1318 * _1206;
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1344 = _1342 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1346 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1348 = isnan(_657);
    bool _1350 = _1346 || _1348;
    bool _1352 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1354 = _1350 || _1352;
    float _1356 = float(_1354);
    float _1358 = -_1264;
    float _1360 = _1358 + 1.0;
    int _1362 = ~_677;
    int _1364 = _1362 + 1;
    float _1366 = 1.0 / _1330;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1368;
    int _1372 = _1338;
    if (!_1326)
    {
        int _1374 = ~_1320;
        int _1376 = _1374 + 1;
        _1372 = _1376;
    }
    int _1378 = _1372;
    float _1380 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1382 = _1380 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _1384 = _1314 >= 0.0;
    bool _1386 = isnan(_1314);
    bool _1388 = _1384 || _1386;
    bool _1390 = isnan(0.0);
    bool _1392 = _1388 || _1390;
    float _1394 = -_1356;
    float _1396 = _1394 + 1.0;
    bool _1398 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1400 = isnan(_657);
    bool _1402 = _1398 || _1400;
    bool _1404 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1406 = _1402 || _1404;
    float _1408 = float(_1406);
    float _1410 = _1382 * _1288;
    float _1412 = 1.0 / _1296;
    int _1414 = _1392 ? 0 : 1;
    float _1416 = _1370 * _1332;
    bool _1418 = _1314 > 0.0;
    float _1420 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1422 = _1420 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1424 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1426 = _1424 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _1428 = ~_1414;
    int _1430 = _1428 + 1;
    int _1432 = _1430 + 1;
    float _1434 = 1.0 / _1344;
    float _1436 = _1422 * _1142;
    float _1438 = _1426 * _1366;
    float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1442 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1440;
    bool _1444 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1446 = isnan(_657);
    bool _1448 = _1444 || _1446;
    bool _1450 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1452 = _1448 || _1450;
    float _1454 = float(_1452);
    float _1456 = -_1292;
    float _1458 = _1456 + 1.0;
    int _1460 = abs(_1190);
    float _1462 = -_1290;
    float _1464 = _1462 + 1.0;
    float _1466 = _1324 * _1412;
    bool _1468 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1470 = isnan(_657);
    bool _1472 = _1468 || _1470;
    bool _1474 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1476 = _1472 || _1474;
    float _1478 = float(_1476);
    float _1480 = -_1454;
    float _1482 = _1480 + 1.0;
    int _1484 = _1432;
    if (!_1418)
    {
        int _1486 = ~_1414;
        int _1488 = _1486 + 1;
        _1484 = _1488;
    }
    int _1490 = _1484;
    float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1494 = _657 + _1492;
    bool _1496 = _1240 >= 0.0;
    bool _1498 = isnan(_1240);
    bool _1500 = _1496 || _1498;
    bool _1502 = isnan(0.0);
    bool _1504 = _1500 || _1502;
    float _1506 = -_1478;
    float _1508 = _1506 + 1.0;
    int _1510 = ~_1460;
    int _1512 = _1510 + 1;
    int _1514 = _1512 + 1;
    float _1516 = _1442 * _1434;
    bool _1518 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1520 = isnan(_657);
    bool _1522 = _1518 || _1520;
    bool _1524 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1526 = _1522 || _1524;
    float _1528 = float(_1526);
    float _1530 = fma(_1340, _1494, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _1532 = _1504 ? 0 : 1;
    float _1534 = -_1408;
    float _1536 = _1534 + 1.0;
    bool _1538 = _1240 > 0.0;
    float _1540 = _1528 * _1508;
    float _1542 = -_1528;
    float _1544 = _1542 + 1.0;
    bool _1546 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1548 = isnan(_657);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1554 = _1550 || _1552;
    float _1556 = float(_1554);
    float _1558 = _1454 * _1544;
    float _1560 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1562 = _657 + _1560;
    float _1564 = _1556 * _1482;
    float _1566 = -_1556;
    float _1568 = _1566 + 1.0;
    bool _1570 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1572 = isnan(_657);
    bool _1574 = _1570 || _1572;
    bool _1576 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1578 = _1574 || _1576;
    float _1580 = float(_1578);
    float _1582 = trunc(_1298);
    float _1584 = precise::max(_1582, 0.0);
    uint _1586 = uint(_1584);
    float _1588 = fma(_1410, _1562, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1590 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1592 = isnan(_657);
    bool _1594 = _1590 || _1592;
    bool _1596 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1598 = _1594 || _1596;
    float _1600 = float(_1598);
    float _1602 = _1408 * _1568;
    float _1604 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1606 = _657 + _1604;
    float _1608 = _1600 * _1536;
    float _1610 = -_1600;
    float _1612 = _1610 + 1.0;
    float _1614 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1616 = _657 + _1614;
    float _1618 = fma(_1416, _1606, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1620 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1622 = _657 + _1620;
    float _1624 = _1356 * _1612;
    float _1626 = _1580 * _1396;
    float _1628 = fma(_1436, _1616, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1630 = -_1580;
    float _1632 = _1630 + 1.0;
    int _1634 = _1364 * int(_1586);
    int _1636 = _1634 + _956;
    float _1638 = _1530 * _1626;
    float _1640 = fma(_1466, _1622, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _1642 = ~_1532;
    int _1644 = _1642 + 1;
    int _1646 = _1644 + 1;
    float _1648 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1650 = _657 + _1648;
    float _1652 = float(uint(_1636));
    float _1654 = fma(_1632, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1638);
    int _1656 = _1646;
    if (!_1538)
    {
        int _1658 = ~_1532;
        int _1660 = _1658 + 1;
        _1656 = _1660;
    }
    int _1662 = _1656;
    float _1664 = fma(_1438, _1650, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1666 = as_type<float>(_757) * _1652;
    float _1668 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1670 = _657 + _1668;
    float _1672 = fma(_1588, _1624, _1654);
    int _1674 = _1054 >> 31;
    float _1676 = as_type<float>(_781) + _663;
    float _1678 = fma(_1516, _1670, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1680 = _1146 + 0.5;
    int _1682 = _1674 & 3;
    float _1684 = trunc(_1666);
    float _1686 = precise::max(_1684, 0.0);
    uint _1688 = uint(_1686);
    float _1690 = _1676 + (-1.0);
    float _1692 = fma(_1680, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1278);
    float _1694 = _1198 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1696 = _1054 + _1682;
    float _1698 = _1076 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1700 = fma(_1618, _1608, _1672);
    float _1702 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1704 = _1694 + _1702;
    float _1706 = fma(_1690, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1708 = _1080 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1710 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1712 = _1698 + _1710;
    float _1714 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1716 = ~_677;
    int _1718 = _1716 + 1;
    float _1720 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1722 = _1708 + _1720;
    float _1724 = fma(_1628, _1602, _1700);
    float _1726 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1714);
    float _1728 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1730 = _1696 >> 2;
    float _1732 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1726);
    bool _1734 = !_1170;
    float _1736 = _1734 ? _185 : as_type<float>(_1204);
    float _1738 = fma(_1640, _1564, _1724);
    int _1740 = int(_1586) + int(_1688);
    bool _1742 = as_type<float>(_781) > 0.5;
    float _1744 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1746 = _1730 << 4;
    int _1748 = _1746 + 512;
    int _1750 = _1718 * _1740;
    int _1752 = _1750 + _956;
    float _1754 = -_185;
    int _1756 = _1742 ? as_type<int>(_1754) : as_type<int>(_185);
    float _1758 = fma(_1664, _1558, _1738);
    float _1760 = -_189;
    int _1762 = _1742 ? as_type<int>(_1760) : as_type<int>(_189);
    float _1764 = _1736 + 0.5;
    bool _1766 = _1732 >= 0.0;
    float _1768 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    uint _1770 = uint(int(uint(_1748) >> uint(2)));
    uint _1772 = uint(int(uint(int(_1770)) >> uint(2)));
    int _1774 = int(_1770) & 3;
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[int(_1772)][_1774];
    int _1778 = int(_1770) + 1;
    uint _1780 = uint(int(uint(_1778) >> uint(2)));
    int _1782 = _1778 & 3;
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[int(_1780)][_1782];
    bool _1786 = !_1118;
    float _1788 = _1786 ? _185 : as_type<float>(_1756);
    float _1790 = _1764 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1792 = uint(_1752) >= uint(_677);
    bool _1794 = !_1176;
    float _1796 = _1794 ? _189 : as_type<float>(_1762);
    float _1798 = _1788 + 0.5;
    bool _1800 = _1058 != 3;
    float _1802 = _1744 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _1804 = !_1792;
    int _1806 = _1804 ? 0 : (-1);
    float _1808 = -_1796;
    float _1810 = _1808 + 0.5;
    int _1812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1814 = _1812 != 0;
    int _1816 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1818 = _1816 != 0;
    int _1820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1822 = _1820 != 0;
    float _1824 = fma(_1802, _1798, _1272);
    int _1826 = _1748 + 8;
    uint _1828 = uint(int(uint(_1826) >> uint(2)));
    uint _1830 = uint(int(uint(int(_1828)) >> uint(2)));
    int _1832 = int(_1828) & 3;
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[int(_1830)][_1832];
    int _1836 = int(_1828) + 1;
    uint _1838 = uint(int(uint(_1836) >> uint(2)));
    int _1840 = _1836 & 3;
    float _1842 = (*spvDescriptorSet0.vp_c9)._m0[int(_1838)][_1840];
    float _1844 = _1724;
    int _1846 = as_type<int>(_1802);
    if (_1766)
    {
        _1844 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1848 = _1844;
    float _1850 = _1098 + (-0.5);
    bool _1852 = !_1060;
    int _1854 = _1852 ? 0 : 1;
    float _1856 = _1810 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1858 = -_1850;
    float _1860 = -_1280;
    float _1862 = fma(_1858, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1860);
    if (_1766)
    {
        float _1864 = _1848 * 5.0;
        _1846 = as_type<int>(_1864);
    }
    int _1866 = _1846;
    float _1868 = fma(_1678, _1540, _1758);
    float _1870 = -_1360;
    float _1872 = fma(_1146, _1870, _1692);
    float _1874 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1876 = abs(_1106);
    if (_1766)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6247 = as_type<float>(_1866);
        out.gl_Position.z = _6247;
    }
    float _1878 = -_1286;
    float _1880 = _1878 + 1.0;
    bool _1882 = !_1800;
    int _1884 = _1882 ? 0 : (-1);
    float _1886 = _1790 * _1728;
    int _1888 = ~_1740;
    int _1890 = _1888 + _1806;
    int _1892 = _1890 + 1;
    float _1894 = fma(_1098, _1880, _1862);
    float _1896 = _1704 * _1704;
    int _1898 = abs(_1884);
    float _1900 = _1768 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1902 = _677 * _1892;
    int _1904 = _1902 + _956;
    float _1906 = fma(_1712, _1712, _1896);
    bool _1908 = _677 == 0;
    float _1910 = _1138 + (-0.5);
    float _1912 = _1856 * _1874;
    int _1914 = abs(_1854);
    float _1916 = -_1900;
    float _1918 = -_1282;
    float _1920 = fma(_1916, _1910, _1918);
    int _1922 = ~_1876;
    int _1924 = _1922 + 1;
    int _1926 = _1924 + 1;
    float _1928 = -_1464;
    float _1930 = fma(_1788, _1928, _1824);
    out.m_74.x = _1886;
    out.m_74.y = _1912;
    out.m_74.z = _1872;
    out.m_74.w = _1894;
    float _1932 = fma(_1138, _1458, _1920);
    bool _1934 = !_1908;
    int _1936 = _1934 ? _1904 : (-1);
    float _1938 = fma(_1478, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1868);
    int _1940 = _1926 * as_type<int>(_1784);
    int _1942 = ~_1914;
    int _1944 = _1942 + 1;
    int _1946 = _1944 + 1;
    out.m_76.x = _1930;
    out.m_76.y = _1932;
    bool _1948 = !_1160;
    int _1950 = _1948 ? 0 : 1;
    int _1952 = _1946 * as_type<int>(_1776);
    int _1954 = _1952 + _1940;
    out.m_78.x = _1938;
    int _1956 = abs(_1950);
    float _1958 = _665 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _1960 = _1514 * as_type<int>(_1834);
    int _1962 = _1960 + _1954;
    float _1964 = fma(_1722, _1722, _1906);
    int _1966 = ~_1956;
    int _1968 = _1966 + 1;
    int _1970 = _1968 + 1;
    if (_1766)
    {
        out.m_55.x = 0.0;
    }
    int _1972 = ~_1898;
    int _1974 = _1972 + 1;
    int _1976 = _1974 + 1;
    bool _1978 = !_1814;
    int _1980 = _1978 ? 0 : 1;
    float _1982 = rsqrt(_1964);
    bool _1984 = !_1818;
    int _1986 = _1984 ? 0 : 1;
    int _1988 = _1976 * as_type<int>(_1842);
    int _1990 = _1988 + _1962;
    float _1992 = float(_1378);
    int _1994 = abs(_1986);
    int _1996 = _1990 * _1970;
    float _1998 = float(_1662);
    float _2000 = float(_1994);
    int _2002 = _1936 * _1956;
    int _2004 = _2002 + _1996;
    bool _2006 = !_1822;
    int _2008 = _2006 ? 0 : 1;
    float _2010 = in.m_80.x;
    float _2012 = in.m_80.y;
    float _2014 = in.m_80.z;
    float _2016 = _2000 * _1992;
    float _2018 = float(_2004);
    float _2020 = _1958 * _1982;
    int _2022 = abs(_1980);
    float _2024 = _663 + (-0.5);
    float _2026 = _1704 * _2020;
    float _2028 = _1712 * _2020;
    float _2030 = float(_2022);
    out.m_82.y = _2018;
    float _2032 = -_2026;
    float _2034 = _1704 + _2032;
    float _2036 = -_2028;
    float _2038 = _1712 + _2036;
    float _2040 = _2030 * _1998;
    float _2042 = _2034 * _2034;
    float _2044 = fma(_2038, _2038, _2042);
    float _2046 = _2014;
    if (_1766)
    {
        return out;
    }
    float _2048 = -_2026;
    float _2050 = _1694 + _2048;
    float _2052 = _1722 * _2020;
    float _2054 = _2040 * (-2.0);
    float _2056 = -_2028;
    float _2058 = _1698 + _2056;
    float _2060 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2062 = _2050 + _2060;
    float _2064 = fma(_2054, _2010, _2010);
    float _2066 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2068 = _2058 + _2066;
    float _2070 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2072 = fma(_1706, _2054, _1706);
    float _2074 = fma(_2024, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2064);
    float _2076 = -_2052;
    float _2078 = _1708 + _2076;
    float _2080 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2070);
    float _2082 = _671 + as_type<float>(_781);
    int _2084 = abs(_2008);
    float _2086 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2088 = _2078 + _2086;
    float _2090 = as_type<float>(_781) + (-0.5);
    float _2092 = _2082 + (-1.0);
    float _2094 = float(_1490);
    float _2096 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2080);
    float _2098 = _2016 * (-2.0);
    float _2100 = fma(_2092, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2102 = float(_2084);
    float _2104 = _671 + _663;
    float _2106 = fma(_2098, _2012, _2012);
    bool _2108 = _2096 >= 0.0;
    float _2110 = fma(_2100, _2098, _2100);
    float _2112 = -_2052;
    float _2114 = _1722 + _2112;
    float _2116 = fma(_2090, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2106);
    float _2118 = fma(_2072, _1302, _2074);
    float _2120 = _2102 * _2094;
    float _2122 = fma(_2110, _1302, _2116);
    float _2124 = _2104 + (-1.0);
    float _2126 = fma(_2114, _2114, _2044);
    float _2128 = _2118 * 0.15915493667125701904296875;
    float _2130 = _2120 * (-2.0);
    float _2132 = _2122 * 0.15915493667125701904296875;
    float _2134 = fma(_2124, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2136 = _2128 * 6.283185482025146484375;
    float _2138 = sin(_2136);
    float _2140 = fma(_2130, _2014, _2014);
    float _2142 = _671 + (-0.5);
    if (_2108)
    {
        _2046 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2144 = _2046;
    float _2146 = fma(_2134, _2130, _2134);
    int _2148 = as_type<int>(_2144);
    if (_2108)
    {
        out.m_55.x = 0.0;
    }
    float _2150 = fma(_2142, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2140);
    float _2152 = _2128 * 6.283185482025146484375;
    float _2154 = cos(_2152);
    if (_2108)
    {
        float _2156 = _2144 * 5.0;
        _2148 = as_type<int>(_2156);
    }
    int _2158 = _2148;
    float _2160 = fma(_2146, _1302, _2150);
    if (_2108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6688 = as_type<float>(_2158);
        out.gl_Position.z = _6688;
    }
    float _2162 = sqrt(_2126);
    float _2164 = _2160 * 0.15915493667125701904296875;
    float _2166 = _2132 * 6.283185482025146484375;
    float _2168 = sin(_2166);
    float _2170 = _2132 * 6.283185482025146484375;
    float _2172 = cos(_2170);
    if (_2108)
    {
        return out;
    }
    float _2174 = _2164 * 6.283185482025146484375;
    float _2176 = cos(_2174);
    float _2178 = _1982 * _2162;
    float _2180 = _345 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2182 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _189);
    float _2184 = _2138 * _2168;
    float _2186 = _2154 * _2172;
    float _2188 = _2178 * _2180;
    float _2190 = _665 * _2178;
    float _2192 = _2164 * 6.283185482025146484375;
    float _2194 = sin(_2192);
    float _2196 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _2198 = _2182 * _2188;
    float _2200 = _2138 * _2172;
    float _2202 = _2154 * _2168;
    float _2204 = _2196 * _2190;
    float _2206 = _2154 * _2176;
    float _2208 = _2138 * _2176;
    float _2210 = _2172 * _2176;
    float _2212 = _2168 * _2176;
    float _2214 = _2206 * _2198;
    float _2216 = _2178 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2218 = _2216 * 0.5;
    float _2220 = _2208 * _2198;
    float _2222 = fma(_2194, _2186, _2184);
    float _2224 = -_2198;
    float _2226 = _2194 * _2224;
    float _2228 = -_2200;
    float _2230 = fma(_2194, _2202, _2228);
    float _2232 = fma(_2222, _2204, _2214);
    float _2234 = -_2202;
    float _2236 = fma(_2194, _2200, _2234);
    float _2238 = fma(_2210, _2204, _2226);
    float _2240 = _2222 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2242 = fma(_2230, _2218, _2232);
    float _2244 = fma(_2194, _2184, _2186);
    float _2246 = fma(_2236, _2204, _2220);
    float _2248 = fma(_2212, _2218, _2238);
    float _2250 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2252 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2254 = fma(_2244, _2218, _2246);
    float _2256 = _2222 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2258 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2250);
    float _2260 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2252);
    float _2262 = _2222 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2264 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2256);
    float _2266 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2258);
    float _2268 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2260);
    float _2270 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2272 = _2266 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2274 = _2268 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2276 = -_2194;
    float _2278 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2270);
    float _2280 = _1698 + _2272;
    float _2282 = _1708 + _2274;
    float _2284 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2240);
    float _2286 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2262);
    float _2288 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2290 = _2280 + _2288;
    float _2292 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2294 = _2282 + _2292;
    float _2296 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2298 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2300 = _2290 * _2290;
    float _2302 = _2294 * _2294;
    float _2304 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2306 = -_2194;
    float _2308 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2296);
    float _2310 = -_2194;
    float _2312 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2298);
    float _2314 = _2300 + _2302;
    float _2316 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2304);
    float _2318 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2284);
    float _2320 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2264);
    float _2322 = sqrt(_2314);
    float _2324 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2316);
    float _2326 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2286);
    float _2328 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2330 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2332 = _2324 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2334 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2336 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2328);
    float _2338 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2330);
    float _2340 = _1694 + _2332;
    float _2342 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2334);
    bool _2344 = _2322 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2346 = _2296;
    float _2348 = _2212;
    float _2350 = _2230;
    float _2352 = _2328;
    float _2354 = _2330;
    float _2356 = _2318;
    if (!_2344)
    {
        _2346 = _2302;
    }
    float _2358 = _2346;
    float _2360 = _2358;
    if (!_2344)
    {
        _2348 = _2300;
    }
    float _2362 = _2348;
    float _2364 = _2362;
    if (!_2344)
    {
        _2350 = _2280;
    }
    float _2366 = _2350;
    float _2368 = _2366;
    if (!_2344)
    {
        _2352 = _2282;
    }
    float _2370 = _2352;
    float _2372 = _2370;
    if (!_2344)
    {
        _2354 = _2340;
    }
    float _2374 = _2354;
    bool _2376 = !_2344;
    float _2378 = _2374;
    if (!_2376)
    {
        float _2380 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2382 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2384 = _2322 + _2382;
        float _2386 = rsqrt(_2314);
        float _2388 = _2384 * _2380;
        float _2390 = _2340 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2392 = _2388 * 0.15915493667125701904296875;
        float _2394 = _2392 * 6.283185482025146484375;
        float _2396 = sin(_2394);
        float _2398 = _2392 * 6.283185482025146484375;
        float _2400 = cos(_2398);
        float _2402 = fma(_2396, _2390, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2404 = _2386 * _2402;
        float _2406 = _2400 + (-1.0);
        float _2408 = fma(_2290, _2404, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2410 = fma(_2294, _2404, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2412 = _2406 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2414 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2416 = _2408 + _2414;
        float _2418 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2420 = _2410 + _2418;
        float _2422 = fma(_2340, _2400, _2412);
        float _2424 = _2416 * _2416;
        float _2426 = _2420 * _2420;
        _2378 = _2422;
        _2364 = _2424;
        _2360 = _2426;
        _2368 = _2408;
        _2372 = _2410;
    }
    float _2428 = _2378;
    float _2430 = _2364;
    float _2432 = _2360;
    float _2434 = _2368;
    float _2436 = _2372;
    float _2438 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2440 = _2428 + _2438;
    float _2442 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2308);
    float _2444 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2278);
    float _2446 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2448 = fma(_2440, _2440, _2430);
    float _2450 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2312);
    float _2452 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2336);
    float _2454 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2338);
    float _2456 = _2448 + _2432;
    float _2458 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2342);
    float _2460 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2462 = _2446 * _2442;
    float _2464 = _2446 * _2444;
    float _2466 = _2446 * _2450;
    float _2468 = sqrt(_2456);
    float _2470 = fma(_2460, _2318, _2462);
    float _2472 = fma(_2460, _2320, _2464);
    float _2474 = fma(_2460, _2326, _2466);
    float _2476 = _2452 + _2470;
    float _2478 = _2454 + _2472;
    float _2480 = _2458 + _2474;
    out.m_84.x = _2476;
    out.m_84.y = _2478;
    out.m_84.z = _2480;
    bool _2482 = _2468 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2484 = isnan(_2468);
    bool _2486 = _2482 || _2484;
    bool _2488 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2490 = _2486 || _2488;
    float _2492 = _2428;
    float _2494 = _2464;
    if (!_2490)
    {
        _2356 = 1.0;
    }
    float _2496 = _2356;
    bool _2498 = !_2490;
    float _2500 = _2496;
    if (!_2498)
    {
        bool _2502 = _2468 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2504 = isnan(_2468);
        bool _2506 = _2502 || _2504;
        bool _2508 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2510 = _2506 || _2508;
        if (!_2510)
        {
            float _2512 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2514 = _2468 + _2512;
            float _2516 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2518 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2516;
            float _2520 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2522 = _2520 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2524 = 1.0 / _2518;
            float _2526 = _2514 * _2524;
            float _2528 = fma(_2526, _2522, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2500 = _2528;
            _2530 = true;
        }
        else
        {
            bool _2532 = _2468 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2534 = isnan(_2468);
            bool _2536 = _2532 || _2534;
            bool _2538 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2540 = _2536 || _2538;
            if (!_2540)
            {
                float _2542 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2544 = _2468 + _2542;
                float _2546 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2548 = _2546 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2550 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2552 = _2550 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2554 = 1.0 / _2548;
                float _2556 = _2544 * _2554;
                float _2558 = fma(_2556, _2552, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2500 = _2558;
                _2530 = true;
            }
            else
            {
                _2500 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2530 = false;
    float _2560 = _2500;
    float _2562 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2564 = _2428 + _2562;
    float _2566 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2568 = _2434 + _2566;
    float _2570 = fma(_2564, _2560, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2572 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2574 = _2436 + _2572;
    float _2576 = fma(_2568, _2560, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2578 = -_2026;
    float _2580 = _2578 + _2570;
    float _2582 = fma(_2574, _2560, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2584 = -_2028;
    float _2586 = _2584 + _2576;
    float _2588 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2590 = _2580 + _2588;
    float _2592 = -_2052;
    float _2594 = _2592 + _2582;
    float _2596 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2598 = _2586 + _2596;
    float _2600 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2602 = _2590 * _2590;
    float _2604 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2606 = _2594 + _2604;
    float _2608 = fma(_2598, _2598, _2602);
    float _2610 = fma(_2606, _2606, _2608);
    float _2612 = rsqrt(_2610);
    float _2614 = sqrt(_2610);
    float _2616 = _2612 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2618 = _2598 * _2616;
    float _2620 = _2606 * _2616;
    float _2622 = _2618 * _2618;
    float _2624 = _2620 * _2620;
    float _2626 = _2622 + _2624;
    float _2628 = sqrt(_2626);
    bool _2630 = _2628 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2632 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2634 = _2628 + _2632;
    float _2636 = _2606;
    float _2638 = _2626;
    float _2640 = _2634;
    if (_2630)
    {
        float _2642 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2636 = _2642;
    }
    float _2644 = _2636;
    if (_2630)
    {
        float _2646 = rsqrt(_2626);
        _2638 = _2646;
    }
    float _2648 = _2638;
    float _2650 = _2648;
    if (_2630)
    {
        float _2652 = _2634 * _2644;
        _2640 = _2652;
    }
    float _2654 = _2640;
    if (_2630)
    {
        float _2656 = _2654 * 0.15915493667125701904296875;
        _2492 = _2656;
    }
    float _2658 = _2492;
    float _2660 = _2644;
    float _2662 = _2658;
    if (_2630)
    {
        float _2664 = _2658 * 6.283185482025146484375;
        float _2666 = sin(_2664);
        _2660 = _2666;
    }
    float _2668 = _2660;
    float _2670 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2672 = precise::max(0.0, _2670);
    float _2674 = _2612;
    if (_2630)
    {
        float _2676 = _2658 * 6.283185482025146484375;
        float _2678 = cos(_2676);
        _2674 = _2678;
    }
    float _2680 = _2674;
    float _2682 = -_2616;
    float _2684 = -_2672;
    float _2686 = fma(_2590, _2682, _2684);
    float _2688 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _2690 = _2686;
    if (_2630)
    {
        float _2692 = _2686 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2494 = _2692;
    }
    float _2694 = _2494;
    float _2696 = _2694;
    if (!_2630)
    {
        _2662 = _2620;
    }
    float _2698 = _2662;
    float _2700 = fma(_2058, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2702 = _2668;
    float _2704 = _2698;
    if (_2630)
    {
        float _2706 = fma(_2668, _2694, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2696 = _2706;
    }
    float _2708 = _2696;
    float _2710 = _2708;
    if (!_2630)
    {
        _2702 = _2618;
    }
    float _2712 = _2702;
    float _2714 = floor(_2700);
    float _2716 = _2712;
    float _2718 = _2680;
    if (_2630)
    {
        float _2720 = _2680 + (-1.0);
        _2688 = _2720;
    }
    float _2722 = _2688;
    float _2724 = _2722;
    if (_2630)
    {
        float _2726 = _2648 * _2708;
        _2710 = _2726;
    }
    float _2728 = _2710;
    if (_2630)
    {
        float _2730 = _2722 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2650 = _2730;
    }
    float _2732 = _2650;
    if (_2630)
    {
        float _2734 = _2618 * _2728;
        _2716 = _2734;
    }
    float _2736 = _2716;
    if (!_2630)
    {
        _2724 = _2622;
    }
    float _2738 = _2724;
    float _2740 = _2738;
    if (_2630)
    {
        float _2742 = _2620 * _2728;
        _2704 = _2742;
    }
    float _2744 = _2704;
    if (_2630)
    {
        float _2746 = fma(_2686, _2680, _2732);
        _2690 = _2746;
    }
    float _2748 = _2690;
    if (_2630)
    {
        float _2750 = _2736 * _2736;
        _2740 = _2750;
    }
    float _2752 = _2740;
    if (!_2630)
    {
        _2718 = _2624;
    }
    float _2754 = _2718;
    float _2756 = _2754;
    if (_2630)
    {
        float _2758 = _2744 * _2744;
        _2756 = _2758;
    }
    float _2760 = _2756;
    float _2762 = _2580 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2764 = fma(_2748, _2748, _2752);
    float _2766 = _2580 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2768 = _2580 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2770 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2762);
    float _2772 = _2764 + _2760;
    float _2774 = _2580 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2776 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2766);
    float _2778 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2770);
    float _2780 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2782 = fma(_2614, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2780);
    float _2784 = precise::clamp(_2782, 0.0, 1.0);
    float _2786 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2774);
    float _2788 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2776);
    float _2790 = _2778 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2792 = rsqrt(_2772);
    float _2794 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2786);
    float _2796 = _2788 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2798 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2768);
    float _2800 = _2790 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2802 = _2794 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2804 = -_2784;
    float _2806 = _2804 + 1.0;
    float _2808 = _2796 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2810 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2798);
    float _2812 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2800);
    float _2814 = abs(_2806);
    float _2816 = log2(_2814);
    float _2818 = -_2808;
    float _2820 = fma(_2818, _2600, 1.0);
    float _2822 = _2810 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2824 = fma(_2796, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2812);
    float _2826 = -_2714;
    float _2828 = _2700 + _2826;
    float _2830 = _2792 * _2736;
    float _2832 = fma(_2822, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2824);
    float _2834 = _2792 * _2748;
    float _2836 = fma(_2078, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2838 = _2830 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2840 = _2792 * _2744;
    float _2842 = _2790 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2844 = floor(_2836);
    float _2846 = -_2838;
    float _2848 = fma(_2834, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2846);
    float _2850 = _2816 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2852 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2842);
    float _2854 = -_2840;
    float _2856 = fma(_2854, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2848);
    float _2858 = _2790 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2860 = log2(_2820);
    float _2862 = fma(_2856, -0.5, 0.5);
    float _2864 = fma(_2856, 0.5, 0.5);
    float _2866 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2858);
    float _2868 = fma(_2864, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2870 = fma(_2796, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2866);
    float _2872 = 1.0 / _2832;
    float _2874 = -_2844;
    float _2876 = _2836 + _2874;
    float _2878 = fma(_2796, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2852);
    float _2880 = fma(_2864, _2868, -0.212114393711090087890625);
    float _2882 = _2834 + 1.0;
    float _2884 = fma(_2822, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2878);
    float _2886 = fma(_2822, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2870);
    float _2888 = exp2(_2850);
    float _2890 = fma(_2864, _2880, 1.570728778839111328125);
    float _2892 = _2860 * 0.693147182464599609375;
    float _2894 = _2892 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2896 = sqrt(_2862);
    float _2898 = _2884 * _2872;
    float _2900 = _2886 * _2872;
    float _2902 = fma(_2898, 0.5, 0.5);
    float _2904 = fma(_2900, -0.5, 0.5);
    float _2906 = -_2834;
    float _2908 = fma(_2888, _2882, _2906);
    float2 _7959 = float2(_2828, _2876);
    float _2910 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7959, float2(0.0), isnan(_7959)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7959, float2(0.0), isnan(_7959)), level(0.0)).x;
    float3 _7970 = float3(_2902, _2904, _2894);
    float _2912 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7970, float3(0.0), isnan(_7970)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7970, float3(0.0), isnan(_7970)), level(0.0)).x;
    float _2914 = fma(_2908, 0.5, 0.5);
    float _2916 = _2896 * 0.636619746685028076171875;
    float _2918 = -_2890;
    float _2920 = fma(_2916, _2918, 1.0);
    float3 _7991 = float3(_2902, _2904, _2894);
    float4 _2923 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7991, float3(0.0), isnan(_7991)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7991, float3(0.0), isnan(_7991)), level(0.0)).xyzw;
    float _2925 = _2923.x;
    float _2927 = _2923.y;
    float _2929 = _2923.z;
    float _2931 = _2923.w;
    float2 _8007 = float2(_2920, _2914);
    float3 _2935 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8007, float2(0.0), isnan(_8007)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8007, float2(0.0), isnan(_8007)), level(0.0)).xyz;
    float _2937 = _2935.x;
    float _2939 = _2935.y;
    float _2941 = _2935.z;
    float _2943 = _2050 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2945 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2943);
    float _2947 = _2050 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2949 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2945);
    float _2951 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2947);
    float _2953 = _2949 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2955 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2951);
    float _2957 = 1.0 / _2953;
    float _2959 = _2955 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2961 = _2959 + _2953;
    float _2963 = _2961 * _2957;
    float _2965 = _2963 * 0.5;
    float _2967 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2969 = fma(_2965, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2967);
    float _2971 = 1.0 / _2969;
    float _2973 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2975 = _2971 * _2973;
    float _2977 = abs(_2975);
    float _2979 = log2(_2977);
    bool _2981 = _2975 <= 8000.0;
    bool _2983 = isnan(_2975);
    bool _2985 = _2981 || _2983;
    bool _2987 = isnan(8000.0);
    bool _2989 = _2985 || _2987;
    float _2991 = float(_2989);
    bool _2993 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2995 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2997 = _2993 || _2995;
    bool _2999 = isnan(0.5);
    bool _3001 = _2997 || _2999;
    float _3003 = _2979 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3005 = exp2(_3003);
    float _3007 = fma(_3005, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3009 = precise::clamp(_3007, 0.0, 1.0);
    float _3011 = _2790 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3013 = _2790;
    float _3015 = _2832;
    float _3017 = _2886;
    float _3019 = _2884;
    if (_3001)
    {
        _3013 = 1.0;
    }
    float _3021 = _3013;
    float _3023 = fma(_3009, -2.0, 3.0);
    float _3025 = _3009 * _3009;
    float _3027 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3011);
    float _3029 = in.m_86.x;
    float _3031 = _3025 * _3023;
    float _3033 = _2816 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3035 = fma(_2796, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3027);
    float _3037 = -_3031;
    float _3039 = _3037 + 1.0;
    float _3041 = exp2(_3033);
    float _3043 = fma(_2822, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3035);
    float _3045 = _2832 * 0.5;
    float _3047 = fma(_3039, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3031);
    float _3049 = _2884 + _2832;
    float _3051 = _3043 + _2832;
    float _3053 = fma(_2886, -0.5, _3045);
    float _3055 = _3049 * 0.5;
    float _3057 = _3051 * 0.5;
    float _3059 = _3021;
    float _3061 = _3043;
    float _3063 = _3053;
    float _3065 = _3055;
    if (!_3001)
    {
        float _3067 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3069 = _3067 * 0.15915493667125701904296875;
        float _3071 = _3069 * 6.283185482025146484375;
        float _3073 = cos(_3071);
        float _3075 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3077 = _3075 * 0.15915493667125701904296875;
        float _3079 = _3069 * 6.283185482025146484375;
        float _3081 = sin(_3079);
        float _3083 = 1.0 / _3073;
        float _3085 = _3077 * 6.283185482025146484375;
        float _3087 = cos(_3085);
        float _3089 = _3081 * _3083;
        float _3091 = _3077 * 6.283185482025146484375;
        float _3093 = sin(_3091);
        float _3095 = _3087 * _3089;
        float _3097 = 1.0 / _3095;
        float _3099 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3101 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3099;
        float _3103 = 1.0 / _3101;
        float _3105 = _3093 * _3097;
        float _3107 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3109 = fma(_2975, _3105, _3107);
        float _3111 = _3109 * _3103;
        float _3113 = precise::clamp(_3111, 0.0, 1.0);
        _3059 = _3113;
    }
    float _3115 = _3059;
    float _3117 = _2991 * _3047;
    float _3119 = -_3041;
    float _3121 = _3119 + 1.0;
    float _3123 = -_2910;
    float _3125 = _3123 + 1.0;
    float _3127 = _3117 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3129 = _3121 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3131 = _2614 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3133 = isnan(_2614);
    bool _3135 = _3131 || _3133;
    bool _3137 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3139 = _3135 || _3137;
    float _3141 = _3125 * _3127;
    float _3143 = precise::clamp(_3141, 0.0, 1.0);
    float _3145 = _3129 * _2912;
    float _3147 = -_3129;
    float _3149 = _3147 + 1.0;
    out.gl_Position.x = _2884;
    out.gl_Position.y = _2886;
    out.gl_Position.z = _3043;
    out.gl_Position.w = _2832;
    float _3151 = -_3143;
    float _3153 = fma(_3151, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3155 = _2931 * _3145;
    float _3157 = _2941 * _3145;
    float _3159 = _2931 * _3149;
    float _3161 = _3153 * _3029;
    float _3163 = fma(_2937, _3155, _2925);
    float _3165 = fma(_2939, _3155, _2927);
    float _3167 = fma(_2931, _3157, _2929);
    float _3169 = _3161 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_88.x = _3055;
    out.m_88.y = _3053;
    out.m_88.z = _3057;
    out.m_88.w = _2832;
    out.m_90.x = _3169;
    if (!_3139)
    {
        _3015 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3171 = _3015;
    float _3173 = _3171;
    float _3175 = _3171;
    if (!_3139)
    {
        _3061 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3177 = _3061;
    out.m_92.x = _3163;
    out.m_92.y = _3165;
    out.m_92.z = _3167;
    out.m_92.w = _3159;
    float _3179 = _3177;
    float _3181 = _3177;
    if (!_3139)
    {
        _3017 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3183 = _3017;
    float _3185 = _3183;
    float _3187 = _3183;
    if (!_3139)
    {
        _3019 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3189 = _3019;
    float _3191 = _3189;
    float _3193 = _3189;
    if (!_3139)
    {
        _3063 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3195 = _3063;
    float _3197 = _3115 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3199 = _3195;
    float _3201 = _3195;
    if (!_3139)
    {
        _3065 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3203 = _3065;
    bool _3205 = !_3139;
    float _3207 = _3203;
    float _3209 = _3203;
    if (!_3205)
    {
        bool _3211 = _2614 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3213 = isnan(_2614);
        bool _3215 = _3211 || _3213;
        bool _3217 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3219 = _3215 || _3217;
        if (!_3219)
        {
            float _3221 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3223 = _2614 + _3221;
            float _3225 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3227 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3225;
            float _3229 = 1.0 / _3227;
            float _3231 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3233 = _3231 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3235 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3237 = _3235 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3239 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3241 = _3239 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3243 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3245 = _3243 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3247 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3249 = _3247 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3251 = _3223 * _3229;
            float _3253 = precise::clamp(_3251, 0.0, 1.0);
            float _3255 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3257 = _3255 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3259 = fma(_3253, _3233, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3261 = fma(_3253, _3257, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3263 = fma(_3253, _3237, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3265 = fma(_3253, _3241, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3267 = fma(_3253, _3245, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3269 = fma(_3253, _3249, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3209 = _3261;
            _3187 = _3267;
            _3201 = _3259;
            _3181 = _3265;
            _3175 = _3263;
            _3193 = _3269;
            _3271 = true;
        }
        else
        {
            bool _3273 = _2614 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3275 = isnan(_2614);
            bool _3277 = _3273 || _3275;
            bool _3279 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3281 = _3277 || _3279;
            if (!_3281)
            {
                _3199 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3283 = _3199;
            _3201 = _3283;
            if (!_3281)
            {
                _3207 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3285 = _3207;
            _3209 = _3285;
            if (!_3281)
            {
                _3173 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3287 = _3173;
            _3175 = _3287;
            if (!_3281)
            {
                _3179 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3289 = _3179;
            _3181 = _3289;
            if (!_3281)
            {
                _3185 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3291 = _3185;
            _3187 = _3291;
            if (!_3281)
            {
                _3191 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3293 = _3191;
            bool _3295 = !_3281;
            _3193 = _3293;
            if (!_3295)
            {
                bool _3297 = _2614 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3299 = isnan(_2614);
                bool _3301 = _3297 || _3299;
                bool _3303 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3305 = _3301 || _3303;
                if (!_3305)
                {
                    float _3307 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3309 = _2614 + _3307;
                    float _3311 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3313 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3311;
                    float _3315 = 1.0 / _3313;
                    float _3317 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3319 = _3317 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3321 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3323 = _3321 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3325 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3327 = _3325 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3329 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3331 = _3329 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3333 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3335 = _3333 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3337 = _3309 * _3315;
                    float _3339 = precise::clamp(_3337, 0.0, 1.0);
                    float _3341 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3343 = _3341 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3345 = fma(_3339, _3319, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3347 = fma(_3339, _3343, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3349 = fma(_3339, _3323, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3351 = fma(_3339, _3327, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3353 = fma(_3339, _3331, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3355 = fma(_3339, _3335, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3209 = _3347;
                    _3187 = _3353;
                    _3201 = _3345;
                    _3181 = _3351;
                    _3175 = _3349;
                    _3193 = _3355;
                    _3271 = true;
                }
                else
                {
                    _3209 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3187 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3201 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3181 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3175 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3193 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3271 = false;
    float _3357 = _3209;
    float _3359 = _3187;
    float _3361 = _3201;
    float _3363 = _3181;
    float _3365 = _3175;
    float _3367 = _3193;
    float _3369 = fma(_2478, -0.5, 0.5);
    float _3371 = precise::clamp(_3369, 0.0, 1.0);
    float _3373 = -_3357;
    float _3375 = _3373 + _3359;
    float _3377 = -_3361;
    float _3379 = _3377 + _3363;
    out.m_94.x = 0.0;
    float _3381 = fma(_3371, _3375, _3357);
    float _3383 = -_3365;
    float _3385 = _3383 + _3367;
    float _3387 = fma(_3371, _3379, _3361);
    float _3389 = _3381 * 0.586610972881317138671875;
    bool _3391 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3393 = fma(_3371, _3385, _3365);
    float _3395 = _3197 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3397 = fma(_3387, 0.298911988735198974609375, _3389);
    bool _3399 = _3115 > 0.0;
    bool _3401 = isnan(_3115);
    bool _3403 = _3399 || _3401;
    bool _3405 = isnan(0.0);
    bool _3407 = _3403 || _3405;
    float _3409 = fma(_3393, 0.114477999508380889892578125, _3397);
    out.m_55.x = _3395;
    float _3411 = -_3409;
    float _3413 = _3387 + _3411;
    float _3415 = -_3409;
    float _3417 = _3381 + _3415;
    float _3419 = -_3409;
    float _3421 = _3393 + _3419;
    float _3423 = fma(_3413, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3409);
    float _3425 = fma(_3417, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3409);
    float _3427 = fma(_3421, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3409);
    bool _3429 = !_3391;
    if (!_3429)
    {
        float _3431 = -_2580;
        float _3433 = _3431 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3435 = -_2586;
        float _3437 = _3435 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3439 = -_2594;
        float _3441 = _3439 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3443 = _3433 * _3433;
        float _3445 = fma(_3437, _3437, _3443);
        float _3447 = fma(_3441, _3441, _3445);
        float _3449 = sqrt(_3447);
        float _3451 = rsqrt(_3447);
        float _3453 = -_3449;
        float _3455 = _3453 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3457 = _3455 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3459 = precise::clamp(_3457, 0.0, 1.0);
        float _3461 = _3437 * _3451;
        float _3463 = _3433 * _3451;
        float _3465 = abs(_3459);
        float _3467 = log2(_3465);
        float _3469 = _3441 * _3451;
        float _3471 = _3461 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3473 = _2478 * _3463;
        float _3475 = -_3463;
        float _3477 = -_3471;
        float _3479 = fma(_3475, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3477);
        float _3481 = fma(_2476, _3461, _3473);
        float _3483 = -_3469;
        float _3485 = fma(_3483, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3479);
        float _3487 = fma(_2480, _3469, _3481);
        float _3489 = precise::clamp(_3487, 0.0, 1.0);
        float _3491 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3493 = _3485 + _3491;
        float _3495 = _3467 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3497 = _3493 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3499 = precise::clamp(_3497, 0.0, 1.0);
        float _3501 = exp2(_3495);
        float _3503 = _3501 * _3499;
        float _3505 = _3489 * _3503;
        float _3507 = _3505 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3509 = _3505 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3511 = _3505 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_94.x = _3507;
        out.m_94.y = _3509;
        out.m_94.z = _3511;
    }
    out.m_96.x = _3423;
    out.m_96.y = _3425;
    out.m_96.z = _3427;
    if (_3407)
    {
        return out;
    }
    out.m_55.x = 0.0;
    float _3513 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3513;
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
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3271 = false;
    bool _2530 = false;
    bool _561 = false;
    bool _425 = false;
    bool _309 = false;
    bool _213 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_48.w;
    float _112 = in.m_50.w;
    float _114 = trunc(_110);
    int _117 = int(_114);
    float _119 = -_112;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _121;
    bool _125 = _117 >= 1;
    float _127 = 0.0;
    float _129 = _112;
    float _131 = _121;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _127;
    if (!_125)
    {
        out.m_55.x = 0.0;
    }
    int _135 = 0;
    if (!_125)
    {
        float _137 = _133 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3581 = as_type<float>(_139);
        out.gl_Position.z = _3581;
    }
    if (!_125)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _143 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_112);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = float(_117);
    bool _155 = _121 >= _153;
    bool _157 = !_151;
    bool _159 = _155 || _157;
    if (_159)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _129;
    if (_159)
    {
        out.m_55.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _141 = as_type<int>(_163);
    }
    int _165 = _141;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3636 = as_type<float>(_165);
        out.gl_Position.z = _3636;
    }
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = 1.0 / _153;
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _173 = _121 * _169;
    int _175 = as_type<int>(_167) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_167) & 2;
    bool _181 = _179 != 0;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_171;
    float _193 = _173;
    float _211;
    if (!_191)
    {
        float _195 = in.m_60.x;
        float _197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _203 = _201 * _197;
        float _205 = floor(_203);
        float _207 = -_205;
        float _209 = _203 + _207;
        _211 = _209;
        _213 = true;
    }
    else
    {
        _211 = _173;
    }
    _213 = false;
    float _215 = _211;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _219 = _215 + _217;
    bool _221 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _223 = isnan(_215);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _233;
    float _237 = -_231;
    float _239 = _237 + 1.0;
    bool _241 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _243 = 1.0 / _235;
    float _245 = _219 * _243;
    bool _247 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _249 = isnan(_215);
    bool _251 = _247 || _249;
    bool _253 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _255 = _251 || _253;
    float _257 = float(_255);
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _259;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _263;
    float _267 = _257 * _239;
    float _269 = fma(_261, _245, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _271 = fma(_265, _245, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _273 = -_257;
    float _275 = _273 + 1.0;
    float _277 = _269 * _267;
    float _279 = _271 * _267;
    float _281 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[143].x, _277);
    float _283 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[143].y, _279);
    float _285 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].x, _281);
    float _287 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].y, _283);
    bool _289 = !_241;
    float _307;
    if (!_289)
    {
        float _291 = in.m_60.x;
        float _293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _295 = _291 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _299 = _297 * _293;
        float _301 = floor(_299);
        float _303 = -_301;
        float _305 = _299 + _303;
        _307 = _305;
        _309 = true;
    }
    else
    {
        _307 = _173;
    }
    _309 = false;
    float _311 = _307;
    float _313 = in.m_62.x;
    float _315 = in.m_62.y;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _319 = _311 + _317;
    bool _321 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _323 = isnan(_311);
    bool _325 = _321 || _323;
    bool _327 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _329 = _325 || _327;
    float _331 = float(_329);
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _333;
    bool _337 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _339 = 1.0 / _335;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _341;
    float _345 = _287 * _315;
    float _347 = _319 * _339;
    bool _349 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _351 = isnan(_311);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = -_331;
    float _363 = _361 + 1.0;
    float _365 = _285 * _313;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _367;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _371;
    float _375 = _359 * _363;
    float _377 = fma(_343, _347, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _379 = fma(_369, _347, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _381 = fma(_373, _347, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _383 = -_359;
    float _385 = _383 + 1.0;
    float _387 = _377 * _375;
    float _389 = _379 * _375;
    float _391 = _381 * _375;
    float _393 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[107].y, _387);
    float _395 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[107].x, _389);
    float _397 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[107].z, _391);
    float _399 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[108].y, _393);
    float _401 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[108].x, _395);
    float _403 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[108].z, _397);
    bool _405 = !_337;
    float _423;
    if (!_405)
    {
        float _407 = in.m_60.x;
        float _409 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _411 = _407 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _413 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _415 = _413 * _409;
        float _417 = floor(_415);
        float _419 = -_417;
        float _421 = _415 + _419;
        _423 = _421;
        _425 = true;
    }
    else
    {
        _423 = _173;
    }
    _425 = false;
    float _427 = _423;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _433 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _435 = isnan(_427);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _441 = _437 || _439;
    float _443 = float(_441);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _449 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _451 = isnan(_427);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = 1.0 / _431;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _463;
    float _467 = -_443;
    float _469 = _467 + 1.0;
    bool _471 = _427 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _473 = isnan(_427);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    bool _483 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _485 = 1.0 / _447;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _491 = _465 * _461;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _495 = _427 + _493;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _499 = _427 + _497;
    float _501 = fma(_491, _495, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _503 = _459 * _469;
    float _505 = -_459;
    float _507 = _505 + 1.0;
    float _509 = _489 * _485;
    float _511 = -_481;
    float _513 = _511 + 1.0;
    float _515 = _501 * _503;
    float _517 = _403 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _519 = fma(_509, _499, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _521 = _443 * _513;
    float _523 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[115].x, _515);
    float _525 = _399 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _527 = _517 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _529 = fma(_519, _521, _523);
    float _531 = _401 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _533 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[117].x, _529);
    float _535 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _537 = _525 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _539 = _533 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _535;
    out.m_64.y = _537;
    out.m_64.z = _527;
    out.m_64.w = _539;
    bool _541 = !_483;
    float _559;
    if (!_541)
    {
        float _543 = in.m_60.x;
        float _545 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _547 = _543 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _549 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[11].w, _121);
        float _551 = _549 * _545;
        float _553 = floor(_551);
        float _555 = -_553;
        float _557 = _551 + _555;
        _559 = _557;
        _561 = true;
    }
    else
    {
        _559 = _173;
    }
    _561 = false;
    float _563 = _559;
    bool _565 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _567 = isnan(_563);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _573 = _569 || _571;
    float _575 = float(_573);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _581 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _583 = isnan(_563);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _593;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _599 = _563 + _597;
    float _601 = 1.0 / _579;
    float _603 = -_575;
    float _605 = _603 + 1.0;
    bool _607 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _609 = _591 * _605;
    float _611 = -_591;
    float _613 = _611 + 1.0;
    float _615 = _595 * _601;
    float _617 = fma(_615, _599, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _619 = _617 * _609;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _625 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[131].x, _619);
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _629 = _621 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _631 = _623 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _633 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[132].x, _625);
    float _635 = _627 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _637 = _633 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_66.x = _629;
    out.m_66.y = _631;
    out.m_66.z = _635;
    out.m_66.w = _637;
    bool _639 = !_607;
    if (!_639)
    {
        float _641 = in.m_60.x;
        float _643 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _645 = _641 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _647 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[14].x, _121);
        float _649 = _647 * _643;
        float _651 = floor(_649);
        float _653 = -_651;
        float _655 = _649 + _653;
        _193 = _655;
    }
    float _657 = _193;
    float _659 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _661 = int(_659);
    float _663 = in.m_60.x;
    float _665 = _365 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _669 = _667 != 0;
    float _671 = in.m_60.z;
    float _673 = in.m_60.w;
    float _675 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _677 = int(_675);
    int _679 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _681 = _679 != 0;
    float _683 = in.m_68.x;
    float _685 = in.m_68.y;
    float _687 = in.m_68.z;
    float _689 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _691 = log2(_689);
    float _693 = float(_661);
    float _695 = 0.0;
    if (!_669)
    {
        float _697 = in.m_60.y;
        _695 = _697;
    }
    float _699 = _695;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _705 = 0.0;
    if (!_669)
    {
        float _707 = in.m_60.z;
        _705 = _707;
    }
    float _709 = _705;
    float _711 = 1.0 / _693;
    float _713 = float(uint(_677));
    float _715 = _663 * 2.0;
    int _717 = ~_677;
    int _719 = _717 + 1;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _723 = _677 == 0;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _727 = 0.0;
    if (_669)
    {
        _727 = _663;
    }
    float _729 = _727;
    float _731 = 1.0 / _713;
    int _733 = ~_677;
    int _735 = _733 + 1;
    float _737 = _729;
    if (!_669)
    {
        _737 = _671;
    }
    float _739 = _737;
    float _741 = _711 * _121;
    float _743 = floor(_715);
    float _745 = 0.0;
    if (!_669)
    {
        _745 = _699;
    }
    float _747 = _745;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _751 = 0.0;
    float _753 = _747;
    if (!_669)
    {
        _751 = _747;
    }
    float _755 = _751;
    int _757 = as_type<int>(_731) + (-2);
    float _759 = trunc(_741);
    int _761 = int(_759);
    float _763 = 0.0;
    float _765 = _709;
    if (!_669)
    {
        _763 = _709;
    }
    float _767 = _763;
    float _769 = _755;
    int _771 = as_type<int>(_699);
    float _773 = _767;
    if (_669)
    {
        float _775 = in.m_60.x;
        float _777 = in.m_60.y;
        _769 = _775;
        _771 = as_type<int>(_777);
    }
    float _779 = _769;
    int _781 = _771;
    float _783 = float(uint(_761));
    float _785 = as_type<float>(_757) * _783;
    float _787 = trunc(_785);
    float _789 = precise::max(_787, 0.0);
    uint _792 = uint(_789);
    bool _794 = !_669;
    float _796 = _794 ? as_type<float>(_781) : _663;
    float _798 = fma(as_type<float>(_781), (*spvDescriptorSet0.vp_c9)._m0[88].w, _749);
    if (_669)
    {
        _753 = as_type<float>(_781);
    }
    float _800 = _753;
    float _802 = as_type<float>(_781) * 2.0;
    float _804 = _800;
    if (_669)
    {
        _773 = _800;
    }
    float _806 = _773;
    if (_669)
    {
        _765 = _800;
    }
    float _808 = _765;
    if (!_669)
    {
        _804 = _663;
    }
    float _810 = _804;
    float _812 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[83].w, _725);
    int _814 = _735 * int(_792);
    int _816 = _814 + _761;
    float _818 = _810 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _820 = float(uint(_816));
    float _822 = as_type<float>(_757) * _820;
    bool _824 = !_669;
    float _826 = _824 ? 1.2345600128173828125 : 1.0;
    float _828 = trunc(_822);
    float _830 = precise::max(_828, 0.0);
    uint _832 = uint(_830);
    float _834 = _826 * _796;
    float _836 = float(_677);
    int _838 = int(_792) + int(_832);
    float _840 = float(_761);
    float _842 = floor(_834);
    int _844 = _719 * _838;
    int _846 = _844 + _761;
    bool _848 = _840 >= _836;
    bool _850 = isnan(_840);
    bool _852 = _848 || _850;
    bool _854 = isnan(_836);
    bool _856 = _852 || _854;
    float _858 = float(_856);
    bool _860 = uint(_846) >= uint(_677);
    float _862 = trunc(_858);
    int _864 = int(_862);
    bool _866 = !_860;
    int _868 = _866 ? 0 : (-1);
    int _870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _872 = _870 != 0;
    int _874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _876 = _874 != 0;
    int _878 = ~_838;
    int _880 = _878 + _868;
    int _882 = _880 + 1;
    float _884 = -_842;
    float _886 = _834 + _884;
    float _888 = _836 * _121;
    int _890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _892 = _890 != 0;
    int _894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _896 = _894 != 0;
    int _898 = _677 * _882;
    int _900 = _898 + _761;
    float _902 = _836 * _886;
    float _904 = _888 * _169;
    int _906 = _677 + (-1);
    int _908 = ~_864;
    int _910 = _908 + 1;
    int _912 = _910 + 1;
    bool _914 = !_723;
    int _916 = _914 ? _900 : (-1);
    float _918 = trunc(_902);
    int _920 = int(_918);
    bool _922 = !_681;
    int _924 = _922 ? 0 : 1;
    bool _926 = !_872;
    int _928 = _926 ? 0 : 1;
    int _930 = _916 * _912;
    bool _932 = !_876;
    int _934 = _932 ? 0 : 1;
    int _936 = abs(_928);
    float _938 = trunc(_904);
    int _940 = int(_938);
    int _942 = abs(_934);
    int _944 = _864 * _906;
    int _946 = _944 + _930;
    int _948 = abs(_924);
    bool _950 = !_892;
    int _952 = _950 ? 0 : 1;
    int _954 = _920 * _948;
    int _956 = _954 + _761;
    bool _958 = !_896;
    int _960 = _958 ? 0 : 1;
    int _962 = abs(_952);
    int _964 = _946 * _942;
    int _966 = abs(_960);
    int _968 = _940 * _936;
    int _970 = _968 + _964;
    float _972 = in.m_70.x;
    float _974 = in.m_70.y;
    float _976 = in.m_70.z;
    int _978 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _980 = _978 != 0;
    int _982 = _956 * _962;
    int _984 = _982 + _970;
    int _986 = ~_677;
    int _988 = _986 + 1;
    float _990 = float(uint(_956));
    int _992 = _920 * _966;
    int _994 = _992 + _984;
    int _996 = ~_677;
    int _998 = _996 + 1;
    float _1000 = float(uint(_994));
    float _1002 = as_type<float>(_757) * _1000;
    float _1004 = trunc(_1002);
    float _1006 = precise::max(_1004, 0.0);
    uint _1008 = uint(_1006);
    int _1010 = _998 * int(_1008);
    int _1012 = _1010 + _994;
    float _1014 = float(uint(_1012));
    float _1016 = as_type<float>(_757) * _1014;
    float _1018 = trunc(_1016);
    float _1020 = precise::max(_1018, 0.0);
    uint _1022 = uint(_1020);
    int _1024 = int(_1008) + int(_1022);
    int _1026 = _988 * _1024;
    int _1028 = _1026 + _994;
    float _1030 = in.m_48.x;
    float _1032 = in.m_48.y;
    float _1034 = in.m_48.z;
    bool _1036 = uint(_1028) >= uint(_677);
    bool _1038 = !_1036;
    int _1040 = _1038 ? 0 : (-1);
    int _1042 = ~_1024;
    int _1044 = _1042 + _1040;
    int _1046 = _1044 + 1;
    int _1048 = _677 * _1046;
    int _1050 = _1048 + _994;
    bool _1052 = !_723;
    int _1054 = _1052 ? _1050 : (-1);
    float _1056 = _1032 * _685;
    int _1058 = _1054 & 3;
    bool _1060 = _1058 != 0;
    float _1062 = _1032 * _974;
    int _1064 = _1054 & 3;
    bool _1066 = _1064 != 0;
    float _1068 = fma(_1030, _683, _1056);
    bool _1070 = uint(_1058) > 1u;
    float _1072 = fma(_1030, _972, _1062);
    int _1074 = _1066 ? 0 : 1;
    float _1076 = fma(_1034, _687, _1068);
    bool _1078 = _673 > 0.5;
    float _1080 = fma(_1034, _976, _1072);
    int _1082 = ~_1074;
    int _1084 = _1082 + 1;
    int _1086 = _1084 + 1;
    float _1088 = -_189;
    int _1090 = _1078 ? as_type<int>(_1088) : as_type<int>(_189);
    int _1092 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1094 = _1092 != 0;
    bool _1096 = !_980;
    float _1098 = _1096 ? _189 : as_type<float>(_1090);
    int _1100 = _1086;
    if (!_1070)
    {
        int _1102 = ~_1074;
        int _1104 = _1102 + 1;
        _1100 = _1104;
    }
    int _1106 = _1100;
    float _1108 = in.m_72.x;
    float _1110 = in.m_72.y;
    float _1112 = in.m_72.z;
    bool _1114 = _671 > 0.5;
    int _1116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1118 = _1116 != 0;
    int _1120 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1122 = _1120 != 0;
    float _1124 = -_189;
    int _1126 = _1114 ? as_type<int>(_1124) : as_type<int>(_189);
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1130 = _1128 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1132 = -_185;
    int _1134 = _1114 ? as_type<int>(_1132) : as_type<int>(_185);
    bool _1136 = !_1122;
    float _1138 = _1136 ? _189 : as_type<float>(_1126);
    bool _1140 = uint(_1058) >= 2u;
    float _1142 = 1.0 / _1130;
    bool _1144 = !_1094;
    float _1146 = _1144 ? _185 : as_type<float>(_1134);
    int _1148 = _1140 ? 0 : 1;
    bool _1150 = _1058 != 3;
    int _1152 = ~_1148;
    int _1154 = _1152 + 1;
    int _1156 = _1154 + 1;
    int _1158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1160 = _1158 != 0;
    float _1162 = _1032 * _1110;
    float _1164 = _691 * _121;
    float _1166 = _739 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1170 = _1168 != 0;
    float _1172 = fma(_1030, _1108, _1162);
    int _1174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1176 = _1174 != 0;
    float _1178 = -_701;
    float _1180 = fma(_1166, 2.0, _1178);
    float _1182 = exp2(_1164);
    int _1184 = _1156;
    if (_1150)
    {
        int _1186 = ~_1148;
        int _1188 = _1186 + 1;
        _1184 = _1188;
    }
    int _1190 = _1184;
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1194 = _1192 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1196 = _663 > 0.5;
    float _1198 = fma(_1034, _1112, _1172);
    float _1200 = _671 * 2.0;
    float _1202 = -_185;
    int _1204 = _1196 ? as_type<int>(_1202) : as_type<int>(_185);
    float _1206 = 1.0 / _1194;
    bool _1208 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1210 = isnan(0.0);
    bool _1212 = _1208 || _1210;
    bool _1214 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1216 = _1212 || _1214;
    float _1218 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1220 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1218);
    float _1222 = _779 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1224 = -_1182;
    float _1226 = _1224 + 1.0;
    float _1228 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1230 = _1228 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1234 = _1232 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1236 = -_721;
    float _1238 = fma(_1222, 2.0, _1236);
    float _1240 = floor(_1200);
    float _1242 = _1216 ? _1226 : 0.0;
    float _1244 = _806 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1246 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1248 = isnan(1.0);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1254 = _1250 || _1252;
    float _1256 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1258 = 1.0 + _1256;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1262 = fma(_1244, -2.0, _703);
    float _1264 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1220);
    float _1266 = fma(_818, -2.0, _1260);
    float _1268 = 1.0 / _1258;
    float _1270 = -_121;
    float _1272 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1180);
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1276 = -_121;
    float _1278 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1238);
    float _1280 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1262);
    float _1282 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1266);
    float _1284 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1274);
    float _1286 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _812);
    float _1288 = 1.0 / _1230;
    float _1290 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1284);
    float _1292 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[87].w, _798);
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1296 = _1294 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1298 = as_type<float>(_757) * _990;
    if (_1254)
    {
        float _1300 = _1242 * _1268;
        _131 = _1300;
    }
    float _1302 = _131;
    bool _1304 = _743 >= 0.0;
    bool _1306 = isnan(_743);
    bool _1308 = _1304 || _1306;
    bool _1310 = isnan(0.0);
    bool _1312 = _1308 || _1310;
    float _1314 = floor(_802);
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1318 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1316;
    int _1320 = _1312 ? 0 : 1;
    float _1322 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1322;
    bool _1326 = _743 > 0.0;
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1330 = _1328 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1332 = 1.0 / _1234;
    int _1334 = ~_1320;
    int _1336 = _1334 + 1;
    int _1338 = _1336 + 1;
    float _1340 = _1318 * _1206;
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1344 = _1342 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1346 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1348 = isnan(_657);
    bool _1350 = _1346 || _1348;
    bool _1352 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1354 = _1350 || _1352;
    float _1356 = float(_1354);
    float _1358 = -_1264;
    float _1360 = _1358 + 1.0;
    int _1362 = ~_677;
    int _1364 = _1362 + 1;
    float _1366 = 1.0 / _1330;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1368;
    int _1372 = _1338;
    if (!_1326)
    {
        int _1374 = ~_1320;
        int _1376 = _1374 + 1;
        _1372 = _1376;
    }
    int _1378 = _1372;
    float _1380 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1382 = _1380 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _1384 = _1314 >= 0.0;
    bool _1386 = isnan(_1314);
    bool _1388 = _1384 || _1386;
    bool _1390 = isnan(0.0);
    bool _1392 = _1388 || _1390;
    float _1394 = -_1356;
    float _1396 = _1394 + 1.0;
    bool _1398 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1400 = isnan(_657);
    bool _1402 = _1398 || _1400;
    bool _1404 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1406 = _1402 || _1404;
    float _1408 = float(_1406);
    float _1410 = _1382 * _1288;
    float _1412 = 1.0 / _1296;
    int _1414 = _1392 ? 0 : 1;
    float _1416 = _1370 * _1332;
    bool _1418 = _1314 > 0.0;
    float _1420 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1422 = _1420 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1424 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1426 = _1424 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _1428 = ~_1414;
    int _1430 = _1428 + 1;
    int _1432 = _1430 + 1;
    float _1434 = 1.0 / _1344;
    float _1436 = _1422 * _1142;
    float _1438 = _1426 * _1366;
    float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1442 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1440;
    bool _1444 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1446 = isnan(_657);
    bool _1448 = _1444 || _1446;
    bool _1450 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1452 = _1448 || _1450;
    float _1454 = float(_1452);
    float _1456 = -_1292;
    float _1458 = _1456 + 1.0;
    int _1460 = abs(_1190);
    float _1462 = -_1290;
    float _1464 = _1462 + 1.0;
    float _1466 = _1324 * _1412;
    bool _1468 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1470 = isnan(_657);
    bool _1472 = _1468 || _1470;
    bool _1474 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1476 = _1472 || _1474;
    float _1478 = float(_1476);
    float _1480 = -_1454;
    float _1482 = _1480 + 1.0;
    int _1484 = _1432;
    if (!_1418)
    {
        int _1486 = ~_1414;
        int _1488 = _1486 + 1;
        _1484 = _1488;
    }
    int _1490 = _1484;
    float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1494 = _657 + _1492;
    bool _1496 = _1240 >= 0.0;
    bool _1498 = isnan(_1240);
    bool _1500 = _1496 || _1498;
    bool _1502 = isnan(0.0);
    bool _1504 = _1500 || _1502;
    float _1506 = -_1478;
    float _1508 = _1506 + 1.0;
    int _1510 = ~_1460;
    int _1512 = _1510 + 1;
    int _1514 = _1512 + 1;
    float _1516 = _1442 * _1434;
    bool _1518 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1520 = isnan(_657);
    bool _1522 = _1518 || _1520;
    bool _1524 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1526 = _1522 || _1524;
    float _1528 = float(_1526);
    float _1530 = fma(_1340, _1494, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _1532 = _1504 ? 0 : 1;
    float _1534 = -_1408;
    float _1536 = _1534 + 1.0;
    bool _1538 = _1240 > 0.0;
    float _1540 = _1528 * _1508;
    float _1542 = -_1528;
    float _1544 = _1542 + 1.0;
    bool _1546 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1548 = isnan(_657);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1554 = _1550 || _1552;
    float _1556 = float(_1554);
    float _1558 = _1454 * _1544;
    float _1560 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1562 = _657 + _1560;
    float _1564 = _1556 * _1482;
    float _1566 = -_1556;
    float _1568 = _1566 + 1.0;
    bool _1570 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1572 = isnan(_657);
    bool _1574 = _1570 || _1572;
    bool _1576 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1578 = _1574 || _1576;
    float _1580 = float(_1578);
    float _1582 = trunc(_1298);
    float _1584 = precise::max(_1582, 0.0);
    uint _1586 = uint(_1584);
    float _1588 = fma(_1410, _1562, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1590 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1592 = isnan(_657);
    bool _1594 = _1590 || _1592;
    bool _1596 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1598 = _1594 || _1596;
    float _1600 = float(_1598);
    float _1602 = _1408 * _1568;
    float _1604 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1606 = _657 + _1604;
    float _1608 = _1600 * _1536;
    float _1610 = -_1600;
    float _1612 = _1610 + 1.0;
    float _1614 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1616 = _657 + _1614;
    float _1618 = fma(_1416, _1606, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1620 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1622 = _657 + _1620;
    float _1624 = _1356 * _1612;
    float _1626 = _1580 * _1396;
    float _1628 = fma(_1436, _1616, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1630 = -_1580;
    float _1632 = _1630 + 1.0;
    int _1634 = _1364 * int(_1586);
    int _1636 = _1634 + _956;
    float _1638 = _1530 * _1626;
    float _1640 = fma(_1466, _1622, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _1642 = ~_1532;
    int _1644 = _1642 + 1;
    int _1646 = _1644 + 1;
    float _1648 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1650 = _657 + _1648;
    float _1652 = float(uint(_1636));
    float _1654 = fma(_1632, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1638);
    int _1656 = _1646;
    if (!_1538)
    {
        int _1658 = ~_1532;
        int _1660 = _1658 + 1;
        _1656 = _1660;
    }
    int _1662 = _1656;
    float _1664 = fma(_1438, _1650, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1666 = as_type<float>(_757) * _1652;
    float _1668 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1670 = _657 + _1668;
    float _1672 = fma(_1588, _1624, _1654);
    int _1674 = _1054 >> 31;
    float _1676 = as_type<float>(_781) + _663;
    float _1678 = fma(_1516, _1670, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1680 = _1146 + 0.5;
    int _1682 = _1674 & 3;
    float _1684 = trunc(_1666);
    float _1686 = precise::max(_1684, 0.0);
    uint _1688 = uint(_1686);
    float _1690 = _1676 + (-1.0);
    float _1692 = fma(_1680, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1278);
    float _1694 = _1198 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1696 = _1054 + _1682;
    float _1698 = _1076 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1700 = fma(_1618, _1608, _1672);
    float _1702 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1704 = _1694 + _1702;
    float _1706 = fma(_1690, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1708 = _1080 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1710 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1712 = _1698 + _1710;
    float _1714 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1716 = ~_677;
    int _1718 = _1716 + 1;
    float _1720 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1722 = _1708 + _1720;
    float _1724 = fma(_1628, _1602, _1700);
    float _1726 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1714);
    float _1728 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1730 = _1696 >> 2;
    float _1732 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1726);
    bool _1734 = !_1170;
    float _1736 = _1734 ? _185 : as_type<float>(_1204);
    float _1738 = fma(_1640, _1564, _1724);
    int _1740 = int(_1586) + int(_1688);
    bool _1742 = as_type<float>(_781) > 0.5;
    float _1744 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1746 = _1730 << 4;
    int _1748 = _1746 + 512;
    int _1750 = _1718 * _1740;
    int _1752 = _1750 + _956;
    float _1754 = -_185;
    int _1756 = _1742 ? as_type<int>(_1754) : as_type<int>(_185);
    float _1758 = fma(_1664, _1558, _1738);
    float _1760 = -_189;
    int _1762 = _1742 ? as_type<int>(_1760) : as_type<int>(_189);
    float _1764 = _1736 + 0.5;
    bool _1766 = _1732 >= 0.0;
    float _1768 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    uint _1770 = uint(int(uint(_1748) >> uint(2)));
    uint _1772 = uint(int(uint(int(_1770)) >> uint(2)));
    int _1774 = int(_1770) & 3;
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[int(_1772)][_1774];
    int _1778 = int(_1770) + 1;
    uint _1780 = uint(int(uint(_1778) >> uint(2)));
    int _1782 = _1778 & 3;
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[int(_1780)][_1782];
    bool _1786 = !_1118;
    float _1788 = _1786 ? _185 : as_type<float>(_1756);
    float _1790 = _1764 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1792 = uint(_1752) >= uint(_677);
    bool _1794 = !_1176;
    float _1796 = _1794 ? _189 : as_type<float>(_1762);
    float _1798 = _1788 + 0.5;
    bool _1800 = _1058 != 3;
    float _1802 = _1744 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _1804 = !_1792;
    int _1806 = _1804 ? 0 : (-1);
    float _1808 = -_1796;
    float _1810 = _1808 + 0.5;
    int _1812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1814 = _1812 != 0;
    int _1816 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1818 = _1816 != 0;
    int _1820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1822 = _1820 != 0;
    float _1824 = fma(_1802, _1798, _1272);
    int _1826 = _1748 + 8;
    uint _1828 = uint(int(uint(_1826) >> uint(2)));
    uint _1830 = uint(int(uint(int(_1828)) >> uint(2)));
    int _1832 = int(_1828) & 3;
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[int(_1830)][_1832];
    int _1836 = int(_1828) + 1;
    uint _1838 = uint(int(uint(_1836) >> uint(2)));
    int _1840 = _1836 & 3;
    float _1842 = (*spvDescriptorSet0.vp_c9)._m0[int(_1838)][_1840];
    float _1844 = _1724;
    int _1846 = as_type<int>(_1802);
    if (_1766)
    {
        _1844 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1848 = _1844;
    float _1850 = _1098 + (-0.5);
    bool _1852 = !_1060;
    int _1854 = _1852 ? 0 : 1;
    float _1856 = _1810 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1858 = -_1850;
    float _1860 = -_1280;
    float _1862 = fma(_1858, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1860);
    if (_1766)
    {
        float _1864 = _1848 * 5.0;
        _1846 = as_type<int>(_1864);
    }
    int _1866 = _1846;
    float _1868 = fma(_1678, _1540, _1758);
    float _1870 = -_1360;
    float _1872 = fma(_1146, _1870, _1692);
    float _1874 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1876 = abs(_1106);
    if (_1766)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6247 = as_type<float>(_1866);
        out.gl_Position.z = _6247;
    }
    float _1878 = -_1286;
    float _1880 = _1878 + 1.0;
    bool _1882 = !_1800;
    int _1884 = _1882 ? 0 : (-1);
    float _1886 = _1790 * _1728;
    int _1888 = ~_1740;
    int _1890 = _1888 + _1806;
    int _1892 = _1890 + 1;
    float _1894 = fma(_1098, _1880, _1862);
    float _1896 = _1704 * _1704;
    int _1898 = abs(_1884);
    float _1900 = _1768 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1902 = _677 * _1892;
    int _1904 = _1902 + _956;
    float _1906 = fma(_1712, _1712, _1896);
    bool _1908 = _677 == 0;
    float _1910 = _1138 + (-0.5);
    float _1912 = _1856 * _1874;
    int _1914 = abs(_1854);
    float _1916 = -_1900;
    float _1918 = -_1282;
    float _1920 = fma(_1916, _1910, _1918);
    int _1922 = ~_1876;
    int _1924 = _1922 + 1;
    int _1926 = _1924 + 1;
    float _1928 = -_1464;
    float _1930 = fma(_1788, _1928, _1824);
    out.m_74.x = _1886;
    out.m_74.y = _1912;
    out.m_74.z = _1872;
    out.m_74.w = _1894;
    float _1932 = fma(_1138, _1458, _1920);
    bool _1934 = !_1908;
    int _1936 = _1934 ? _1904 : (-1);
    float _1938 = fma(_1478, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1868);
    int _1940 = _1926 * as_type<int>(_1784);
    int _1942 = ~_1914;
    int _1944 = _1942 + 1;
    int _1946 = _1944 + 1;
    out.m_76.x = _1930;
    out.m_76.y = _1932;
    bool _1948 = !_1160;
    int _1950 = _1948 ? 0 : 1;
    int _1952 = _1946 * as_type<int>(_1776);
    int _1954 = _1952 + _1940;
    out.m_78.x = _1938;
    int _1956 = abs(_1950);
    float _1958 = _665 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _1960 = _1514 * as_type<int>(_1834);
    int _1962 = _1960 + _1954;
    float _1964 = fma(_1722, _1722, _1906);
    int _1966 = ~_1956;
    int _1968 = _1966 + 1;
    int _1970 = _1968 + 1;
    if (_1766)
    {
        out.m_55.x = 0.0;
    }
    int _1972 = ~_1898;
    int _1974 = _1972 + 1;
    int _1976 = _1974 + 1;
    bool _1978 = !_1814;
    int _1980 = _1978 ? 0 : 1;
    float _1982 = rsqrt(_1964);
    bool _1984 = !_1818;
    int _1986 = _1984 ? 0 : 1;
    int _1988 = _1976 * as_type<int>(_1842);
    int _1990 = _1988 + _1962;
    float _1992 = float(_1378);
    int _1994 = abs(_1986);
    int _1996 = _1990 * _1970;
    float _1998 = float(_1662);
    float _2000 = float(_1994);
    int _2002 = _1936 * _1956;
    int _2004 = _2002 + _1996;
    bool _2006 = !_1822;
    int _2008 = _2006 ? 0 : 1;
    float _2010 = in.m_80.x;
    float _2012 = in.m_80.y;
    float _2014 = in.m_80.z;
    float _2016 = _2000 * _1992;
    float _2018 = float(_2004);
    float _2020 = _1958 * _1982;
    int _2022 = abs(_1980);
    float _2024 = _663 + (-0.5);
    float _2026 = _1704 * _2020;
    float _2028 = _1712 * _2020;
    float _2030 = float(_2022);
    out.m_82.y = _2018;
    float _2032 = -_2026;
    float _2034 = _1704 + _2032;
    float _2036 = -_2028;
    float _2038 = _1712 + _2036;
    float _2040 = _2030 * _1998;
    float _2042 = _2034 * _2034;
    float _2044 = fma(_2038, _2038, _2042);
    float _2046 = _2014;
    if (_1766)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2048 = -_2026;
    float _2050 = _1694 + _2048;
    float _2052 = _1722 * _2020;
    float _2054 = _2040 * (-2.0);
    float _2056 = -_2028;
    float _2058 = _1698 + _2056;
    float _2060 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2062 = _2050 + _2060;
    float _2064 = fma(_2054, _2010, _2010);
    float _2066 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2068 = _2058 + _2066;
    float _2070 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2072 = fma(_1706, _2054, _1706);
    float _2074 = fma(_2024, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2064);
    float _2076 = -_2052;
    float _2078 = _1708 + _2076;
    float _2080 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2070);
    float _2082 = _671 + as_type<float>(_781);
    int _2084 = abs(_2008);
    float _2086 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2088 = _2078 + _2086;
    float _2090 = as_type<float>(_781) + (-0.5);
    float _2092 = _2082 + (-1.0);
    float _2094 = float(_1490);
    float _2096 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2080);
    float _2098 = _2016 * (-2.0);
    float _2100 = fma(_2092, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2102 = float(_2084);
    float _2104 = _671 + _663;
    float _2106 = fma(_2098, _2012, _2012);
    bool _2108 = _2096 >= 0.0;
    float _2110 = fma(_2100, _2098, _2100);
    float _2112 = -_2052;
    float _2114 = _1722 + _2112;
    float _2116 = fma(_2090, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2106);
    float _2118 = fma(_2072, _1302, _2074);
    float _2120 = _2102 * _2094;
    float _2122 = fma(_2110, _1302, _2116);
    float _2124 = _2104 + (-1.0);
    float _2126 = fma(_2114, _2114, _2044);
    float _2128 = _2118 * 0.15915493667125701904296875;
    float _2130 = _2120 * (-2.0);
    float _2132 = _2122 * 0.15915493667125701904296875;
    float _2134 = fma(_2124, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2136 = _2128 * 6.283185482025146484375;
    float _2138 = sin(_2136);
    float _2140 = fma(_2130, _2014, _2014);
    float _2142 = _671 + (-0.5);
    if (_2108)
    {
        _2046 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2144 = _2046;
    float _2146 = fma(_2134, _2130, _2134);
    int _2148 = as_type<int>(_2144);
    if (_2108)
    {
        out.m_55.x = 0.0;
    }
    float _2150 = fma(_2142, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2140);
    float _2152 = _2128 * 6.283185482025146484375;
    float _2154 = cos(_2152);
    if (_2108)
    {
        float _2156 = _2144 * 5.0;
        _2148 = as_type<int>(_2156);
    }
    int _2158 = _2148;
    float _2160 = fma(_2146, _1302, _2150);
    if (_2108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6688 = as_type<float>(_2158);
        out.gl_Position.z = _6688;
    }
    float _2162 = sqrt(_2126);
    float _2164 = _2160 * 0.15915493667125701904296875;
    float _2166 = _2132 * 6.283185482025146484375;
    float _2168 = sin(_2166);
    float _2170 = _2132 * 6.283185482025146484375;
    float _2172 = cos(_2170);
    if (_2108)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2174 = _2164 * 6.283185482025146484375;
    float _2176 = cos(_2174);
    float _2178 = _1982 * _2162;
    float _2180 = _345 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2182 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _189);
    float _2184 = _2138 * _2168;
    float _2186 = _2154 * _2172;
    float _2188 = _2178 * _2180;
    float _2190 = _665 * _2178;
    float _2192 = _2164 * 6.283185482025146484375;
    float _2194 = sin(_2192);
    float _2196 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _2198 = _2182 * _2188;
    float _2200 = _2138 * _2172;
    float _2202 = _2154 * _2168;
    float _2204 = _2196 * _2190;
    float _2206 = _2154 * _2176;
    float _2208 = _2138 * _2176;
    float _2210 = _2172 * _2176;
    float _2212 = _2168 * _2176;
    float _2214 = _2206 * _2198;
    float _2216 = _2178 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2218 = _2216 * 0.5;
    float _2220 = _2208 * _2198;
    float _2222 = fma(_2194, _2186, _2184);
    float _2224 = -_2198;
    float _2226 = _2194 * _2224;
    float _2228 = -_2200;
    float _2230 = fma(_2194, _2202, _2228);
    float _2232 = fma(_2222, _2204, _2214);
    float _2234 = -_2202;
    float _2236 = fma(_2194, _2200, _2234);
    float _2238 = fma(_2210, _2204, _2226);
    float _2240 = _2222 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2242 = fma(_2230, _2218, _2232);
    float _2244 = fma(_2194, _2184, _2186);
    float _2246 = fma(_2236, _2204, _2220);
    float _2248 = fma(_2212, _2218, _2238);
    float _2250 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2252 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2254 = fma(_2244, _2218, _2246);
    float _2256 = _2222 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2258 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2250);
    float _2260 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2252);
    float _2262 = _2222 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2264 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2256);
    float _2266 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2258);
    float _2268 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2260);
    float _2270 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2272 = _2266 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2274 = _2268 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2276 = -_2194;
    float _2278 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2270);
    float _2280 = _1698 + _2272;
    float _2282 = _1708 + _2274;
    float _2284 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2240);
    float _2286 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2262);
    float _2288 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2290 = _2280 + _2288;
    float _2292 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2294 = _2282 + _2292;
    float _2296 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2298 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2300 = _2290 * _2290;
    float _2302 = _2294 * _2294;
    float _2304 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2306 = -_2194;
    float _2308 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2296);
    float _2310 = -_2194;
    float _2312 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2298);
    float _2314 = _2300 + _2302;
    float _2316 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2304);
    float _2318 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2284);
    float _2320 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2264);
    float _2322 = sqrt(_2314);
    float _2324 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2316);
    float _2326 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2286);
    float _2328 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2330 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2332 = _2324 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2334 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2336 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2328);
    float _2338 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2330);
    float _2340 = _1694 + _2332;
    float _2342 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2334);
    bool _2344 = _2322 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2346 = _2296;
    float _2348 = _2212;
    float _2350 = _2230;
    float _2352 = _2328;
    float _2354 = _2330;
    float _2356 = _2318;
    if (!_2344)
    {
        _2346 = _2302;
    }
    float _2358 = _2346;
    float _2360 = _2358;
    if (!_2344)
    {
        _2348 = _2300;
    }
    float _2362 = _2348;
    float _2364 = _2362;
    if (!_2344)
    {
        _2350 = _2280;
    }
    float _2366 = _2350;
    float _2368 = _2366;
    if (!_2344)
    {
        _2352 = _2282;
    }
    float _2370 = _2352;
    float _2372 = _2370;
    if (!_2344)
    {
        _2354 = _2340;
    }
    float _2374 = _2354;
    bool _2376 = !_2344;
    float _2378 = _2374;
    if (!_2376)
    {
        float _2380 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2382 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2384 = _2322 + _2382;
        float _2386 = rsqrt(_2314);
        float _2388 = _2384 * _2380;
        float _2390 = _2340 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2392 = _2388 * 0.15915493667125701904296875;
        float _2394 = _2392 * 6.283185482025146484375;
        float _2396 = sin(_2394);
        float _2398 = _2392 * 6.283185482025146484375;
        float _2400 = cos(_2398);
        float _2402 = fma(_2396, _2390, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2404 = _2386 * _2402;
        float _2406 = _2400 + (-1.0);
        float _2408 = fma(_2290, _2404, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2410 = fma(_2294, _2404, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2412 = _2406 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2414 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2416 = _2408 + _2414;
        float _2418 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2420 = _2410 + _2418;
        float _2422 = fma(_2340, _2400, _2412);
        float _2424 = _2416 * _2416;
        float _2426 = _2420 * _2420;
        _2378 = _2422;
        _2364 = _2424;
        _2360 = _2426;
        _2368 = _2408;
        _2372 = _2410;
    }
    float _2428 = _2378;
    float _2430 = _2364;
    float _2432 = _2360;
    float _2434 = _2368;
    float _2436 = _2372;
    float _2438 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2440 = _2428 + _2438;
    float _2442 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2308);
    float _2444 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2278);
    float _2446 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2448 = fma(_2440, _2440, _2430);
    float _2450 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2312);
    float _2452 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2336);
    float _2454 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2338);
    float _2456 = _2448 + _2432;
    float _2458 = fma(_2244, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2342);
    float _2460 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2462 = _2446 * _2442;
    float _2464 = _2446 * _2444;
    float _2466 = _2446 * _2450;
    float _2468 = sqrt(_2456);
    float _2470 = fma(_2460, _2318, _2462);
    float _2472 = fma(_2460, _2320, _2464);
    float _2474 = fma(_2460, _2326, _2466);
    float _2476 = _2452 + _2470;
    float _2478 = _2454 + _2472;
    float _2480 = _2458 + _2474;
    out.m_84.x = _2476;
    out.m_84.y = _2478;
    out.m_84.z = _2480;
    bool _2482 = _2468 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2484 = isnan(_2468);
    bool _2486 = _2482 || _2484;
    bool _2488 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2490 = _2486 || _2488;
    float _2492 = _2428;
    float _2494 = _2464;
    if (!_2490)
    {
        _2356 = 1.0;
    }
    float _2496 = _2356;
    bool _2498 = !_2490;
    float _2500 = _2496;
    if (!_2498)
    {
        bool _2502 = _2468 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2504 = isnan(_2468);
        bool _2506 = _2502 || _2504;
        bool _2508 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2510 = _2506 || _2508;
        if (!_2510)
        {
            float _2512 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2514 = _2468 + _2512;
            float _2516 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2518 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2516;
            float _2520 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2522 = _2520 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2524 = 1.0 / _2518;
            float _2526 = _2514 * _2524;
            float _2528 = fma(_2526, _2522, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2500 = _2528;
            _2530 = true;
        }
        else
        {
            bool _2532 = _2468 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2534 = isnan(_2468);
            bool _2536 = _2532 || _2534;
            bool _2538 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2540 = _2536 || _2538;
            if (!_2540)
            {
                float _2542 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2544 = _2468 + _2542;
                float _2546 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2548 = _2546 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2550 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2552 = _2550 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2554 = 1.0 / _2548;
                float _2556 = _2544 * _2554;
                float _2558 = fma(_2556, _2552, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2500 = _2558;
                _2530 = true;
            }
            else
            {
                _2500 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2530 = false;
    float _2560 = _2500;
    float _2562 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2564 = _2428 + _2562;
    float _2566 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2568 = _2434 + _2566;
    float _2570 = fma(_2564, _2560, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2572 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2574 = _2436 + _2572;
    float _2576 = fma(_2568, _2560, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2578 = -_2026;
    float _2580 = _2578 + _2570;
    float _2582 = fma(_2574, _2560, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2584 = -_2028;
    float _2586 = _2584 + _2576;
    float _2588 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2590 = _2580 + _2588;
    float _2592 = -_2052;
    float _2594 = _2592 + _2582;
    float _2596 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2598 = _2586 + _2596;
    float _2600 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2602 = _2590 * _2590;
    float _2604 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2606 = _2594 + _2604;
    float _2608 = fma(_2598, _2598, _2602);
    float _2610 = fma(_2606, _2606, _2608);
    float _2612 = rsqrt(_2610);
    float _2614 = sqrt(_2610);
    float _2616 = _2612 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2618 = _2598 * _2616;
    float _2620 = _2606 * _2616;
    float _2622 = _2618 * _2618;
    float _2624 = _2620 * _2620;
    float _2626 = _2622 + _2624;
    float _2628 = sqrt(_2626);
    bool _2630 = _2628 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2632 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2634 = _2628 + _2632;
    float _2636 = _2606;
    float _2638 = _2626;
    float _2640 = _2634;
    if (_2630)
    {
        float _2642 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2636 = _2642;
    }
    float _2644 = _2636;
    if (_2630)
    {
        float _2646 = rsqrt(_2626);
        _2638 = _2646;
    }
    float _2648 = _2638;
    float _2650 = _2648;
    if (_2630)
    {
        float _2652 = _2634 * _2644;
        _2640 = _2652;
    }
    float _2654 = _2640;
    if (_2630)
    {
        float _2656 = _2654 * 0.15915493667125701904296875;
        _2492 = _2656;
    }
    float _2658 = _2492;
    float _2660 = _2644;
    float _2662 = _2658;
    if (_2630)
    {
        float _2664 = _2658 * 6.283185482025146484375;
        float _2666 = sin(_2664);
        _2660 = _2666;
    }
    float _2668 = _2660;
    float _2670 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2672 = precise::max(0.0, _2670);
    float _2674 = _2612;
    if (_2630)
    {
        float _2676 = _2658 * 6.283185482025146484375;
        float _2678 = cos(_2676);
        _2674 = _2678;
    }
    float _2680 = _2674;
    float _2682 = -_2616;
    float _2684 = -_2672;
    float _2686 = fma(_2590, _2682, _2684);
    float _2688 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _2690 = _2686;
    if (_2630)
    {
        float _2692 = _2686 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2494 = _2692;
    }
    float _2694 = _2494;
    float _2696 = _2694;
    if (!_2630)
    {
        _2662 = _2620;
    }
    float _2698 = _2662;
    float _2700 = fma(_2058, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2702 = _2668;
    float _2704 = _2698;
    if (_2630)
    {
        float _2706 = fma(_2668, _2694, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2696 = _2706;
    }
    float _2708 = _2696;
    float _2710 = _2708;
    if (!_2630)
    {
        _2702 = _2618;
    }
    float _2712 = _2702;
    float _2714 = floor(_2700);
    float _2716 = _2712;
    float _2718 = _2680;
    if (_2630)
    {
        float _2720 = _2680 + (-1.0);
        _2688 = _2720;
    }
    float _2722 = _2688;
    float _2724 = _2722;
    if (_2630)
    {
        float _2726 = _2648 * _2708;
        _2710 = _2726;
    }
    float _2728 = _2710;
    if (_2630)
    {
        float _2730 = _2722 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2650 = _2730;
    }
    float _2732 = _2650;
    if (_2630)
    {
        float _2734 = _2618 * _2728;
        _2716 = _2734;
    }
    float _2736 = _2716;
    if (!_2630)
    {
        _2724 = _2622;
    }
    float _2738 = _2724;
    float _2740 = _2738;
    if (_2630)
    {
        float _2742 = _2620 * _2728;
        _2704 = _2742;
    }
    float _2744 = _2704;
    if (_2630)
    {
        float _2746 = fma(_2686, _2680, _2732);
        _2690 = _2746;
    }
    float _2748 = _2690;
    if (_2630)
    {
        float _2750 = _2736 * _2736;
        _2740 = _2750;
    }
    float _2752 = _2740;
    if (!_2630)
    {
        _2718 = _2624;
    }
    float _2754 = _2718;
    float _2756 = _2754;
    if (_2630)
    {
        float _2758 = _2744 * _2744;
        _2756 = _2758;
    }
    float _2760 = _2756;
    float _2762 = _2580 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2764 = fma(_2748, _2748, _2752);
    float _2766 = _2580 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2768 = _2580 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2770 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2762);
    float _2772 = _2764 + _2760;
    float _2774 = _2580 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2776 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2766);
    float _2778 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2770);
    float _2780 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2782 = fma(_2614, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2780);
    float _2784 = precise::clamp(_2782, 0.0, 1.0);
    float _2786 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2774);
    float _2788 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2776);
    float _2790 = _2778 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2792 = rsqrt(_2772);
    float _2794 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2786);
    float _2796 = _2788 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2798 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2768);
    float _2800 = _2790 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2802 = _2794 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2804 = -_2784;
    float _2806 = _2804 + 1.0;
    float _2808 = _2796 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2810 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2798);
    float _2812 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2800);
    float _2814 = abs(_2806);
    float _2816 = log2(_2814);
    float _2818 = -_2808;
    float _2820 = fma(_2818, _2600, 1.0);
    float _2822 = _2810 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2824 = fma(_2796, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2812);
    float _2826 = -_2714;
    float _2828 = _2700 + _2826;
    float _2830 = _2792 * _2736;
    float _2832 = fma(_2822, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2824);
    float _2834 = _2792 * _2748;
    float _2836 = fma(_2078, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2838 = _2830 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2840 = _2792 * _2744;
    float _2842 = _2790 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2844 = floor(_2836);
    float _2846 = -_2838;
    float _2848 = fma(_2834, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2846);
    float _2850 = _2816 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2852 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2842);
    float _2854 = -_2840;
    float _2856 = fma(_2854, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2848);
    float _2858 = _2790 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2860 = log2(_2820);
    float _2862 = fma(_2856, -0.5, 0.5);
    float _2864 = fma(_2856, 0.5, 0.5);
    float _2866 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2858);
    float _2868 = fma(_2864, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2870 = fma(_2796, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2866);
    float _2872 = 1.0 / _2832;
    float _2874 = -_2844;
    float _2876 = _2836 + _2874;
    float _2878 = fma(_2796, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2852);
    float _2880 = fma(_2864, _2868, -0.212114393711090087890625);
    float _2882 = _2834 + 1.0;
    float _2884 = fma(_2822, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2878);
    float _2886 = fma(_2822, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2870);
    float _2888 = exp2(_2850);
    float _2890 = fma(_2864, _2880, 1.570728778839111328125);
    float _2892 = _2860 * 0.693147182464599609375;
    float _2894 = _2892 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2896 = sqrt(_2862);
    float _2898 = _2884 * _2872;
    float _2900 = _2886 * _2872;
    float _2902 = fma(_2898, 0.5, 0.5);
    float _2904 = fma(_2900, -0.5, 0.5);
    float _2906 = -_2834;
    float _2908 = fma(_2888, _2882, _2906);
    float2 _7959 = float2(_2828, _2876);
    float _2910 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7959, float2(0.0), isnan(_7959)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7959, float2(0.0), isnan(_7959)), level(0.0)).x;
    float3 _7970 = float3(_2902, _2904, _2894);
    float _2912 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7970, float3(0.0), isnan(_7970)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7970, float3(0.0), isnan(_7970)), level(0.0)).x;
    float _2914 = fma(_2908, 0.5, 0.5);
    float _2916 = _2896 * 0.636619746685028076171875;
    float _2918 = -_2890;
    float _2920 = fma(_2916, _2918, 1.0);
    float3 _7991 = float3(_2902, _2904, _2894);
    float4 _2923 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7991, float3(0.0), isnan(_7991)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7991, float3(0.0), isnan(_7991)), level(0.0)).xyzw;
    float _2925 = _2923.x;
    float _2927 = _2923.y;
    float _2929 = _2923.z;
    float _2931 = _2923.w;
    float2 _8007 = float2(_2920, _2914);
    float3 _2935 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8007, float2(0.0), isnan(_8007)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8007, float2(0.0), isnan(_8007)), level(0.0)).xyz;
    float _2937 = _2935.x;
    float _2939 = _2935.y;
    float _2941 = _2935.z;
    float _2943 = _2050 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2945 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2943);
    float _2947 = _2050 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2949 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2945);
    float _2951 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2947);
    float _2953 = _2949 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2955 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2951);
    float _2957 = 1.0 / _2953;
    float _2959 = _2955 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2961 = _2959 + _2953;
    float _2963 = _2961 * _2957;
    float _2965 = _2963 * 0.5;
    float _2967 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2969 = fma(_2965, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2967);
    float _2971 = 1.0 / _2969;
    float _2973 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2975 = _2971 * _2973;
    float _2977 = abs(_2975);
    float _2979 = log2(_2977);
    bool _2981 = _2975 <= 8000.0;
    bool _2983 = isnan(_2975);
    bool _2985 = _2981 || _2983;
    bool _2987 = isnan(8000.0);
    bool _2989 = _2985 || _2987;
    float _2991 = float(_2989);
    bool _2993 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2995 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2997 = _2993 || _2995;
    bool _2999 = isnan(0.5);
    bool _3001 = _2997 || _2999;
    float _3003 = _2979 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3005 = exp2(_3003);
    float _3007 = fma(_3005, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3009 = precise::clamp(_3007, 0.0, 1.0);
    float _3011 = _2790 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3013 = _2790;
    float _3015 = _2832;
    float _3017 = _2886;
    float _3019 = _2884;
    if (_3001)
    {
        _3013 = 1.0;
    }
    float _3021 = _3013;
    float _3023 = fma(_3009, -2.0, 3.0);
    float _3025 = _3009 * _3009;
    float _3027 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3011);
    float _3029 = in.m_86.x;
    float _3031 = _3025 * _3023;
    float _3033 = _2816 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3035 = fma(_2796, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3027);
    float _3037 = -_3031;
    float _3039 = _3037 + 1.0;
    float _3041 = exp2(_3033);
    float _3043 = fma(_2822, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3035);
    float _3045 = _2832 * 0.5;
    float _3047 = fma(_3039, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3031);
    float _3049 = _2884 + _2832;
    float _3051 = _3043 + _2832;
    float _3053 = fma(_2886, -0.5, _3045);
    float _3055 = _3049 * 0.5;
    float _3057 = _3051 * 0.5;
    float _3059 = _3021;
    float _3061 = _3043;
    float _3063 = _3053;
    float _3065 = _3055;
    if (!_3001)
    {
        float _3067 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3069 = _3067 * 0.15915493667125701904296875;
        float _3071 = _3069 * 6.283185482025146484375;
        float _3073 = cos(_3071);
        float _3075 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3077 = _3075 * 0.15915493667125701904296875;
        float _3079 = _3069 * 6.283185482025146484375;
        float _3081 = sin(_3079);
        float _3083 = 1.0 / _3073;
        float _3085 = _3077 * 6.283185482025146484375;
        float _3087 = cos(_3085);
        float _3089 = _3081 * _3083;
        float _3091 = _3077 * 6.283185482025146484375;
        float _3093 = sin(_3091);
        float _3095 = _3087 * _3089;
        float _3097 = 1.0 / _3095;
        float _3099 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3101 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3099;
        float _3103 = 1.0 / _3101;
        float _3105 = _3093 * _3097;
        float _3107 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3109 = fma(_2975, _3105, _3107);
        float _3111 = _3109 * _3103;
        float _3113 = precise::clamp(_3111, 0.0, 1.0);
        _3059 = _3113;
    }
    float _3115 = _3059;
    float _3117 = _2991 * _3047;
    float _3119 = -_3041;
    float _3121 = _3119 + 1.0;
    float _3123 = -_2910;
    float _3125 = _3123 + 1.0;
    float _3127 = _3117 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3129 = _3121 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3131 = _2614 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3133 = isnan(_2614);
    bool _3135 = _3131 || _3133;
    bool _3137 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3139 = _3135 || _3137;
    float _3141 = _3125 * _3127;
    float _3143 = precise::clamp(_3141, 0.0, 1.0);
    float _3145 = _3129 * _2912;
    float _3147 = -_3129;
    float _3149 = _3147 + 1.0;
    out.gl_Position.x = _2884;
    out.gl_Position.y = _2886;
    out.gl_Position.z = _3043;
    out.gl_Position.w = _2832;
    float _3151 = -_3143;
    float _3153 = fma(_3151, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3155 = _2931 * _3145;
    float _3157 = _2941 * _3145;
    float _3159 = _2931 * _3149;
    float _3161 = _3153 * _3029;
    float _3163 = fma(_2937, _3155, _2925);
    float _3165 = fma(_2939, _3155, _2927);
    float _3167 = fma(_2931, _3157, _2929);
    float _3169 = _3161 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_88.x = _3055;
    out.m_88.y = _3053;
    out.m_88.z = _3057;
    out.m_88.w = _2832;
    out.m_90.x = _3169;
    if (!_3139)
    {
        _3015 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3171 = _3015;
    float _3173 = _3171;
    float _3175 = _3171;
    if (!_3139)
    {
        _3061 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3177 = _3061;
    out.m_92.x = _3163;
    out.m_92.y = _3165;
    out.m_92.z = _3167;
    out.m_92.w = _3159;
    float _3179 = _3177;
    float _3181 = _3177;
    if (!_3139)
    {
        _3017 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3183 = _3017;
    float _3185 = _3183;
    float _3187 = _3183;
    if (!_3139)
    {
        _3019 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3189 = _3019;
    float _3191 = _3189;
    float _3193 = _3189;
    if (!_3139)
    {
        _3063 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3195 = _3063;
    float _3197 = _3115 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3199 = _3195;
    float _3201 = _3195;
    if (!_3139)
    {
        _3065 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3203 = _3065;
    bool _3205 = !_3139;
    float _3207 = _3203;
    float _3209 = _3203;
    if (!_3205)
    {
        bool _3211 = _2614 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3213 = isnan(_2614);
        bool _3215 = _3211 || _3213;
        bool _3217 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3219 = _3215 || _3217;
        if (!_3219)
        {
            float _3221 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3223 = _2614 + _3221;
            float _3225 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3227 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3225;
            float _3229 = 1.0 / _3227;
            float _3231 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3233 = _3231 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3235 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3237 = _3235 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3239 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3241 = _3239 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3243 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3245 = _3243 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3247 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3249 = _3247 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3251 = _3223 * _3229;
            float _3253 = precise::clamp(_3251, 0.0, 1.0);
            float _3255 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3257 = _3255 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3259 = fma(_3253, _3233, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3261 = fma(_3253, _3257, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3263 = fma(_3253, _3237, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3265 = fma(_3253, _3241, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3267 = fma(_3253, _3245, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3269 = fma(_3253, _3249, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3209 = _3261;
            _3187 = _3267;
            _3201 = _3259;
            _3181 = _3265;
            _3175 = _3263;
            _3193 = _3269;
            _3271 = true;
        }
        else
        {
            bool _3273 = _2614 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3275 = isnan(_2614);
            bool _3277 = _3273 || _3275;
            bool _3279 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3281 = _3277 || _3279;
            if (!_3281)
            {
                _3199 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3283 = _3199;
            _3201 = _3283;
            if (!_3281)
            {
                _3207 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3285 = _3207;
            _3209 = _3285;
            if (!_3281)
            {
                _3173 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3287 = _3173;
            _3175 = _3287;
            if (!_3281)
            {
                _3179 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3289 = _3179;
            _3181 = _3289;
            if (!_3281)
            {
                _3185 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3291 = _3185;
            _3187 = _3291;
            if (!_3281)
            {
                _3191 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3293 = _3191;
            bool _3295 = !_3281;
            _3193 = _3293;
            if (!_3295)
            {
                bool _3297 = _2614 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3299 = isnan(_2614);
                bool _3301 = _3297 || _3299;
                bool _3303 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3305 = _3301 || _3303;
                if (!_3305)
                {
                    float _3307 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3309 = _2614 + _3307;
                    float _3311 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3313 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3311;
                    float _3315 = 1.0 / _3313;
                    float _3317 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3319 = _3317 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3321 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3323 = _3321 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3325 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3327 = _3325 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3329 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3331 = _3329 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3333 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3335 = _3333 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3337 = _3309 * _3315;
                    float _3339 = precise::clamp(_3337, 0.0, 1.0);
                    float _3341 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3343 = _3341 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3345 = fma(_3339, _3319, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3347 = fma(_3339, _3343, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3349 = fma(_3339, _3323, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3351 = fma(_3339, _3327, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3353 = fma(_3339, _3331, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3355 = fma(_3339, _3335, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3209 = _3347;
                    _3187 = _3353;
                    _3201 = _3345;
                    _3181 = _3351;
                    _3175 = _3349;
                    _3193 = _3355;
                    _3271 = true;
                }
                else
                {
                    _3209 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3187 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3201 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3181 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3175 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3193 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3271 = false;
    float _3357 = _3209;
    float _3359 = _3187;
    float _3361 = _3201;
    float _3363 = _3181;
    float _3365 = _3175;
    float _3367 = _3193;
    float _3369 = fma(_2478, -0.5, 0.5);
    float _3371 = precise::clamp(_3369, 0.0, 1.0);
    float _3373 = -_3357;
    float _3375 = _3373 + _3359;
    float _3377 = -_3361;
    float _3379 = _3377 + _3363;
    out.m_94.x = 0.0;
    float _3381 = fma(_3371, _3375, _3357);
    float _3383 = -_3365;
    float _3385 = _3383 + _3367;
    float _3387 = fma(_3371, _3379, _3361);
    float _3389 = _3381 * 0.586610972881317138671875;
    bool _3391 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3393 = fma(_3371, _3385, _3365);
    float _3395 = _3197 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3397 = fma(_3387, 0.298911988735198974609375, _3389);
    bool _3399 = _3115 > 0.0;
    bool _3401 = isnan(_3115);
    bool _3403 = _3399 || _3401;
    bool _3405 = isnan(0.0);
    bool _3407 = _3403 || _3405;
    float _3409 = fma(_3393, 0.114477999508380889892578125, _3397);
    out.m_55.x = _3395;
    float _3411 = -_3409;
    float _3413 = _3387 + _3411;
    float _3415 = -_3409;
    float _3417 = _3381 + _3415;
    float _3419 = -_3409;
    float _3421 = _3393 + _3419;
    float _3423 = fma(_3413, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3409);
    float _3425 = fma(_3417, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3409);
    float _3427 = fma(_3421, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3409);
    bool _3429 = !_3391;
    if (!_3429)
    {
        float _3431 = -_2580;
        float _3433 = _3431 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3435 = -_2586;
        float _3437 = _3435 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3439 = -_2594;
        float _3441 = _3439 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3443 = _3433 * _3433;
        float _3445 = fma(_3437, _3437, _3443);
        float _3447 = fma(_3441, _3441, _3445);
        float _3449 = sqrt(_3447);
        float _3451 = rsqrt(_3447);
        float _3453 = -_3449;
        float _3455 = _3453 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3457 = _3455 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3459 = precise::clamp(_3457, 0.0, 1.0);
        float _3461 = _3437 * _3451;
        float _3463 = _3433 * _3451;
        float _3465 = abs(_3459);
        float _3467 = log2(_3465);
        float _3469 = _3441 * _3451;
        float _3471 = _3461 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3473 = _2478 * _3463;
        float _3475 = -_3463;
        float _3477 = -_3471;
        float _3479 = fma(_3475, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3477);
        float _3481 = fma(_2476, _3461, _3473);
        float _3483 = -_3469;
        float _3485 = fma(_3483, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3479);
        float _3487 = fma(_2480, _3469, _3481);
        float _3489 = precise::clamp(_3487, 0.0, 1.0);
        float _3491 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3493 = _3485 + _3491;
        float _3495 = _3467 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3497 = _3493 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3499 = precise::clamp(_3497, 0.0, 1.0);
        float _3501 = exp2(_3495);
        float _3503 = _3501 * _3499;
        float _3505 = _3489 * _3503;
        float _3507 = _3505 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3509 = _3505 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3511 = _3505 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_94.x = _3507;
        out.m_94.y = _3509;
        out.m_94.z = _3511;
    }
    out.m_96.x = _3423;
    out.m_96.y = _3425;
    out.m_96.z = _3427;
    if (_3407)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_55.x = 0.0;
    float _3513 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3513;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

