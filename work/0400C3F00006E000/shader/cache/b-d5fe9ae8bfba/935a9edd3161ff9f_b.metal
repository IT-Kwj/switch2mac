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
    float4 m_76 [[user(locn5)]];
    float4 m_90 [[user(locn6)]];
    float4 m_70 [[user(locn7)]];
    float4 m_80 [[user(locn8)]];
    float4 m_72 [[user(locn9)]];
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
    float4 m_74 [[attribute(1)]];
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
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4977 = false;
    bool _4054 = false;
    bool _575 = false;
    bool _431 = false;
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
    float _131 = _114;
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
    if (!_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5286 = as_type<float>(_141);
        out.gl_Position.z = _5286;
    }
    if (!_127)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _143 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_114);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = float(_119);
    bool _155 = _123 >= _153;
    bool _157 = !_151;
    bool _159 = _155 || _157;
    float _161 = 1.0 / _153;
    if (_159)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _131;
    if (_159)
    {
        out.m_55.x = 0.0;
    }
    float _165 = _123 * _161;
    int _167 = 0;
    float _169 = _165;
    if (_159)
    {
        float _171 = _163 * 5.0;
        _167 = as_type<int>(_171);
    }
    int _173 = _167;
    out.m_53.x = _165;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5349 = as_type<float>(_173);
        out.gl_Position.z = _5349;
    }
    if (_159)
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
    bool _199 = !_185;
    float _201 = _199 ? (-0.5) : 0.5;
    float _203 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].x, _193);
    float _205 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].x, _195);
    float _207 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].x, _197);
    bool _209 = !_189;
    float _211 = _209 ? (-0.5) : 0.5;
    float _213 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[4].z, _203);
    float _215 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[5].z, _205);
    float _217 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[6].z, _207);
    bool _219 = !_191;
    float _221 = _217;
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
        _239 = _165;
    }
    _241 = false;
    float _243 = _239;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _247 = _243 + _245;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _251 = _243 + _249;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _255 = _243 + _253;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _257;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _263 = _261 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _265;
    bool _269 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _271 = isnan(_243);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = 1.0 / _259;
    bool _283 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _285 = 1.0 / _267;
    float _287 = 1.0 / _263;
    float _289 = _247 * _281;
    bool _291 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _293 = isnan(_243);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = -_279;
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
    float _331 = _321 * _325;
    float _333 = -_321;
    float _335 = _333 + 1.0;
    float _337 = _255 * _287;
    bool _339 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _341 = isnan(_243);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _351;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _361 = _359 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _363 = fma(_353, _289, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _365 = _349 * _335;
    float _367 = fma(_357, _289, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _369 = -_349;
    float _371 = _369 + 1.0;
    float _373 = _363 * _365;
    float _375 = _367 * _365;
    float _377 = fma(_329, _337, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _379 = fma(_361, _337, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _381 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].x, _373);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _383;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _387;
    float _391 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].y, _375);
    float _393 = fma(_377, _331, _381);
    float _395 = fma(_385, _309, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _397 = fma(_389, _309, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _399 = fma(_379, _331, _391);
    float _401 = fma(_395, _307, _393);
    float _403 = fma(_397, _307, _399);
    float _405 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[146].x, _401);
    float _407 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[146].y, _403);
    bool _409 = !_283;
    int _411 = as_type<int>(_405);
    float _429;
    if (!_409)
    {
        float _413 = in.m_62.x;
        float _415 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _417 = _413 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _419 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _421 = _419 * _415;
        float _423 = floor(_421);
        float _425 = -_423;
        float _427 = _421 + _425;
        _429 = _427;
        _431 = true;
    }
    else
    {
        _429 = _165;
    }
    _431 = false;
    float _433 = _429;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _437 = _433 + _435;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _441 = _439 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _443 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _445 = isnan(_433);
    bool _447 = _443 || _445;
    bool _449 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _451 = _447 || _449;
    float _453 = float(_451);
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _459 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _461 = isnan(_433);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _471;
    bool _475 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _477 = isnan(_433);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    float _487 = 1.0 / _441;
    float _489 = -_453;
    float _491 = _489 + 1.0;
    bool _493 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _495 = 1.0 / _457;
    float _497 = _473 * _487;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _501 = _499 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _503 = -_485;
    float _505 = _503 + 1.0;
    float _507 = fma(_497, _437, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _509 = _469 * _491;
    float _511 = -_469;
    float _513 = _511 + 1.0;
    float _515 = _453 * _505;
    float _517 = _501 * _495;
    float _519 = _507 * _509;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _523 = _433 + _521;
    float _525 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[115].x, _519);
    float _527 = fma(_517, _523, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _531 = fma(_527, _515, _525);
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _535 = _529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _537 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[117].x, _531);
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _541 = _533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _543 = in.m_64.x;
    float _545 = in.m_64.y;
    float _547 = _537 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _549 = _539 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_66.x = _535;
    out.m_66.y = _541;
    out.m_66.z = _549;
    out.m_66.w = _547;
    float _551 = _407 * _545;
    float _553 = _405 * _543;
    bool _555 = !_493;
    float _573;
    if (!_555)
    {
        float _557 = in.m_62.x;
        float _559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _561 = _557 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _563 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[11].w, _123);
        float _565 = _563 * _559;
        float _567 = floor(_565);
        float _569 = -_567;
        float _571 = _565 + _569;
        _573 = _571;
        _575 = true;
    }
    else
    {
        _573 = _165;
    }
    _575 = false;
    float _577 = _573;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _581 = _577 + _579;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _587 = _577 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _589 = isnan(_577);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _603 = _577 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _605 = isnan(_577);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _615;
    bool _619 = _577 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _621 = isnan(_577);
    bool _623 = _619 || _621;
    bool _625 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _627 = _623 || _625;
    float _629 = float(_627);
    float _631 = 1.0 / _585;
    float _633 = -_597;
    float _635 = _633 + 1.0;
    bool _637 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _639 = -_629;
    float _641 = _639 + 1.0;
    float _643 = 1.0 / _601;
    float _645 = _597 * _641;
    float _647 = _617 * _631;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _653 = fma(_647, _581, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _655 = _613 * _635;
    float _657 = -_613;
    float _659 = _657 + 1.0;
    float _661 = _651 * _643;
    float _663 = _653 * _655;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _667 = _577 + _665;
    float _669 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[131].x, _663);
    float _671 = fma(_661, _667, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _675 = fma(_671, _645, _669);
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _679 = _673 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _683 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[133].x, _675);
    float _685 = _677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _687 = _681 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _689 = _683 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_68.x = _679;
    out.m_68.y = _685;
    out.m_68.z = _687;
    out.m_68.w = _689;
    bool _691 = !_637;
    int _693 = as_type<int>(_687);
    if (!_691)
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
    float _727 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _729 = int(_727);
    float _731 = 0.0;
    if (_719)
    {
        _731 = 1.0;
    }
    float _733 = _731;
    float _735 = 0.0;
    float _737 = _733;
    if (_719)
    {
        _735 = 1.0;
    }
    float _739 = _735;
    float _741 = _739;
    if (_719)
    {
        _411 = 0;
    }
    int _743 = _411;
    float _745 = float(_723);
    float _747 = 1.0 / _725;
    int _749 = _743;
    if (_719)
    {
        _693 = 0;
    }
    int _751 = _693;
    float _753 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _755 = int(_753);
    float _757 = float(uint(_729));
    float _759 = 1.0 / _745;
    float _761 = _747 * _123;
    float _763 = 1.0 / _757;
    float _765 = float(uint(_755));
    int _767 = ~_755;
    int _769 = _767 + 1;
    float _771 = trunc(_761);
    int _773 = int(_771);
    float _775 = _759 * _123;
    float _777 = _759;
    float _779 = _725;
    int _781 = _751;
    if (_719)
    {
        float _783 = in.m_62.x;
        float _785 = in.m_62.y;
        _777 = _783;
        _779 = _785;
    }
    float _787 = _777;
    float _789 = _779;
    float _791 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _793 = int(_791);
    int _795 = as_type<int>(_763) + (-2);
    float _797 = 1.0 / _765;
    float _799 = float(uint(_773));
    float _801 = as_type<float>(_795) * _799;
    float _803 = trunc(_775);
    int _805 = int(_803);
    float _807 = float(uint(_793));
    float _809 = 0.0;
    float _811 = _787;
    float _813 = _789;
    float _815 = as_type<float>(_795);
    if (_719)
    {
        _809 = _787;
    }
    float _817 = _809;
    float _819 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _821 = int(_819);
    int _823 = as_type<int>(_797) + (-2);
    float _825 = _797;
    float _827 = _817;
    if (_719)
    {
        _825 = _789;
    }
    float _829 = _825;
    float _831 = 1.0 / _807;
    float _833 = float(uint(_805));
    float _835 = as_type<float>(_823) * _833;
    float _837 = trunc(_801);
    float _839 = precise::max(_837, 0.0);
    uint _842 = uint(_839);
    float _844 = float(_821);
    float _846 = 1.0 / _844;
    float _848 = trunc(_835);
    float _850 = precise::max(_848, 0.0);
    uint _852 = uint(_850);
    float _854 = _844;
    float _856 = _835;
    float _858 = _829;
    if (_719)
    {
        _854 = _817;
    }
    float _860 = _854;
    float _862 = _860;
    if (_719)
    {
        _856 = _817;
    }
    float _864 = _856;
    float _866 = _864;
    if (!_719)
    {
        float _868 = in.m_62.x;
        float _870 = in.m_62.y;
        float _872 = in.m_62.z;
        float _874 = _868 * 3.1415927410125732421875;
        float _876 = _874 * 0.15915493667125701904296875;
        float _878 = _870 * 3.1415927410125732421875;
        float _880 = _878 * 0.15915493667125701904296875;
        float _882 = _876 * 6.283185482025146484375;
        float _884 = sin(_882);
        float _886 = _880 * 6.283185482025146484375;
        float _888 = sin(_886);
        _737 = 7.345489978790283203125;
        _811 = _868;
        _741 = 5.839270114898681640625;
        _862 = _872;
        _827 = _870;
        _813 = _870;
        _858 = _888;
        _749 = 1;
        _781 = 2;
        _866 = _884;
    }
    float _890 = _737;
    float _892 = _811;
    float _894 = _741;
    float _896 = _862;
    float _898 = _827;
    float _900 = _813;
    float _902 = _858;
    int _904 = _749;
    int _906 = _781;
    float _908 = _866;
    int _910 = _769 * int(_852);
    int _912 = _910 + _805;
    float _914 = _890 * _892;
    float _916 = _894 * _896;
    float _918 = in.m_62.z;
    float _920 = in.m_62.w;
    float _922 = _890 * _898;
    float _924 = float(uint(_912));
    float _926 = floor(_914);
    float _928 = _846 * _123;
    float _930 = _892 * 2.0;
    float _932 = as_type<float>(_823) * _924;
    int _934 = ~_729;
    int _936 = _934 + 1;
    float _938 = float(_805);
    float _940 = trunc(_932);
    float _942 = precise::max(_940, 0.0);
    uint _944 = uint(_942);
    float _946 = float(_755);
    int _948 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _950 = _948 != 0;
    int _952 = _936 * int(_842);
    int _954 = _952 + _773;
    bool _956 = _900 > 0.5;
    float _958 = floor(_916);
    float _960 = -_926;
    float _962 = _914 + _960;
    int _964 = ~_729;
    int _966 = _964 + 1;
    float _968 = float(uint(_954));
    bool _970 = _920 > 0.5;
    float _972 = trunc(_928);
    int _974 = int(_972);
    float _976 = as_type<float>(_795) * _968;
    int _978 = int(_852) + int(_944);
    int _980 = as_type<int>(_831) + (-2);
    bool _982 = _918 > 0.5;
    float _984 = trunc(_976);
    float _986 = precise::max(_984, 0.0);
    uint _988 = uint(_986);
    float _990 = -_958;
    float _992 = _916 + _990;
    int _994 = ~_755;
    int _996 = _994 + 1;
    bool _998 = _938 >= _946;
    bool _1000 = isnan(_938);
    bool _1002 = _998 || _1000;
    bool _1004 = isnan(_946);
    bool _1006 = _1002 || _1004;
    float _1008 = float(_1006);
    int _1010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1012 = _1010 != 0;
    int _1014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1016 = _1014 != 0;
    int _1018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1020 = _1018 != 0;
    int _1022 = _996 * _978;
    int _1024 = _1022 + _805;
    float _1026 = float(uint(_974));
    float _1028 = floor(_922);
    float _1030 = -_201;
    int _1032 = _956 ? as_type<int>(_1030) : as_type<int>(_201);
    float _1034 = as_type<float>(_980) * _1026;
    float _1036 = -_211;
    int _1038 = _982 ? as_type<int>(_1036) : as_type<int>(_211);
    int _1040 = int(_842) + int(_988);
    float _1042 = trunc(_1034);
    float _1044 = precise::max(_1042, 0.0);
    uint _1046 = uint(_1044);
    float _1048 = _962 * _946;
    int _1050 = int(_970);
    int _1052 = _982 ? 2 : 0;
    int _1054 = _1050 | _1052;
    int _1056 = _950 ? 4 : 0;
    int _1058 = _1054 | _1056;
    int _1060 = _1012 ? 8 : 0;
    int _1062 = _1058 | _1060;
    int _1064 = _1016 ? 16 : 0;
    int _1066 = _1062 | _1064;
    int _1068 = _1020 ? 32 : 0;
    int _1070 = _1066 | _1068;
    int _1072 = _956 ? 64 : 0;
    int _1074 = _1070 | _1072;
    int _1076 = _1074 & 64;
    bool _1078 = !_1016;
    float _1080 = _1078 ? _201 : as_type<float>(_1032);
    float _1082 = float(_729);
    float _1084 = trunc(_1008);
    int _1086 = int(_1084);
    float _1088 = float(_773);
    float _1090 = _992 * _1082;
    int _1092 = ~_793;
    int _1094 = _1092 + 1;
    int _1096 = _966 * _1040;
    int _1098 = _1096 + _773;
    bool _1100 = !_950;
    int _1102 = _1100 ? 0 : 1;
    float _1104 = trunc(_1048);
    int _1106 = int(_1104);
    bool _1108 = !_1020;
    float _1110 = _1108 ? _211 : as_type<float>(_1038);
    int _1112 = _1094 * int(_1046);
    int _1114 = _1112 + _974;
    int _1116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1118 = _1116 != 0;
    int _1120 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1122 = _1120 != 0;
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1126 = _1124 != 0;
    bool _1128 = uint(_1024) >= uint(_755);
    bool _1130 = _1088 >= _1082;
    bool _1132 = isnan(_1088);
    bool _1134 = _1130 || _1132;
    bool _1136 = isnan(_1082);
    bool _1138 = _1134 || _1136;
    float _1140 = float(_1138);
    float _1142 = trunc(_1090);
    int _1144 = int(_1142);
    bool _1146 = !_1122;
    int _1148 = _1146 ? 0 : 1;
    bool _1150 = !_1118;
    int _1152 = _1150 ? 0 : 1;
    int _1154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1156 = _1154 != 0;
    bool _1158 = uint(_1098) >= uint(_729);
    float _1160 = trunc(_1140);
    int _1162 = int(_1160);
    bool _1164 = !_1128;
    int _1166 = _1164 ? 0 : (-1);
    bool _1168 = !_1126;
    int _1170 = _1168 ? 0 : 1;
    bool _1172 = !_1156;
    int _1174 = _1172 ? 0 : 1;
    bool _1176 = !_1158;
    int _1178 = _1176 ? 0 : (-1);
    float _1180 = floor(_930);
    float _1182 = -_1028;
    float _1184 = _922 + _1182;
    float _1186 = float(uint(_1114));
    int _1188 = abs(_1102);
    int _1190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1192 = _1190 != 0;
    int _1194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1196 = _1194 != 0;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1200 = _1198 != 0;
    float _1202 = as_type<float>(_980) * _1186;
    int _1204 = ~_978;
    int _1206 = _1204 + _1166;
    int _1208 = _1206 + 1;
    int _1210 = _1106 * _1188;
    int _1212 = _1210 + _805;
    int _1214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1216 = _1214 != 0;
    int _1218 = ~_1040;
    int _1220 = _1218 + _1178;
    int _1222 = _1220 + 1;
    int _1224 = _755 * _1208;
    int _1226 = _1224 + _805;
    bool _1228 = !_1196;
    int _1230 = _1228 ? 0 : 1;
    float _1232 = trunc(_1202);
    float _1234 = precise::max(_1232, 0.0);
    uint _1236 = uint(_1234);
    bool _1238 = !_1216;
    int _1240 = _1238 ? 0 : 1;
    int _1242 = _729 * _1222;
    int _1244 = _1242 + _773;
    bool _1246 = _1076 != 0;
    float _1248 = _161 * _123;
    bool _1250 = _755 == 0;
    bool _1252 = !_1192;
    int _1254 = _1252 ? 0 : 1;
    float _1256 = _946 * _1248;
    bool _1258 = _729 == 0;
    float _1260 = _1082 * _1248;
    int _1262 = ~_1086;
    int _1264 = _1262 + 1;
    int _1266 = _1264 + 1;
    bool _1268 = !_1250;
    int _1270 = _1268 ? _1226 : (-1);
    float _1272 = trunc(_1256);
    int _1274 = int(_1272);
    int _1276 = ~_1162;
    int _1278 = _1276 + 1;
    int _1280 = _1278 + 1;
    bool _1282 = !_1258;
    int _1284 = _1282 ? _1244 : (-1);
    int _1286 = _1270 * _1266;
    int _1288 = _755 + (-1);
    int _1290 = abs(_1148);
    int _1292 = _1284 * _1280;
    int _1294 = _729 + (-1);
    int _1296 = _1086 * _1288;
    int _1298 = _1296 + _1286;
    int _1300 = abs(_1230);
    float _1302 = trunc(_1260);
    int _1304 = int(_1302);
    int _1306 = abs(_1240);
    int _1308 = _1162 * _1294;
    int _1310 = _1308 + _1292;
    int _1312 = _1298 * _1290;
    int _1314 = abs(_1152);
    int _1316 = _1144 * _1306;
    int _1318 = _1316 + _773;
    int _1320 = ~_793;
    int _1322 = _1320 + 1;
    int _1324 = _1310 * _1300;
    int _1326 = abs(_1170);
    int _1328 = _1274 * _1314;
    int _1330 = _1328 + _1312;
    int _1332 = abs(_1174);
    int _1334 = _1212 * _1326;
    int _1336 = _1334 + _1330;
    int _1338 = int(_1046) + int(_1236);
    int _1340 = abs(_1254);
    int _1342 = _1322 * _1338;
    int _1344 = _1342 + _974;
    float _1346 = -_211;
    int _1348 = _970 ? as_type<int>(_1346) : as_type<int>(_211);
    int _1350 = _1106 * _1332;
    int _1352 = _1350 + _1336;
    float _1354 = -_201;
    int _1356 = _982 ? as_type<int>(_1354) : as_type<int>(_201);
    int _1358 = _1304 * _1340;
    int _1360 = _1358 + _1324;
    bool _1362 = uint(_1344) >= uint(_793);
    float _1364 = float(uint(_1352));
    float _1366 = float(_793);
    float _1368 = float(_974);
    float _1370 = as_type<float>(_823) * _1364;
    int _1372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1374 = _1372 != 0;
    float _1376 = _1366 * _1248;
    bool _1378 = !_1200;
    int _1380 = _1378 ? 0 : 1;
    float _1382 = trunc(_1370);
    float _1384 = precise::max(_1382, 0.0);
    uint _1386 = uint(_1384);
    bool _1388 = _1368 >= _1366;
    bool _1390 = isnan(_1368);
    bool _1392 = _1388 || _1390;
    bool _1394 = isnan(_1366);
    bool _1396 = _1392 || _1394;
    float _1398 = float(_1396);
    float _1400 = _1184 * _1366;
    int _1402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1404 = _1402 != 0;
    float _1406 = _900 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1408 = !_1374;
    int _1410 = _1408 ? 0 : 1;
    int _1412 = abs(_1380);
    float _1414 = trunc(_1398);
    int _1416 = int(_1414);
    bool _1418 = !_1012;
    float _1420 = _1418 ? _211 : as_type<float>(_1348);
    bool _1422 = !_1404;
    int _1424 = _1422 ? 0 : 1;
    int _1426 = abs(_1410);
    float _1428 = trunc(_1376);
    int _1430 = int(_1428);
    bool _1432 = !_1362;
    int _1434 = _1432 ? 0 : (-1);
    int _1436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1438 = _1436 != 0;
    int _1440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1442 = _1440 != 0;
    int _1444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1446 = _1444 != 0;
    int _1448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1450 = _1448 != 0;
    int _1452 = _1318 * _1412;
    int _1454 = _1452 + _1360;
    int _1456 = ~_1338;
    int _1458 = _1456 + _1434;
    int _1460 = _1458 + 1;
    bool _1462 = !_1442;
    int _1464 = _1462 ? 0 : 1;
    int _1466 = _1144 * _1426;
    int _1468 = _1466 + _1454;
    int _1470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1472 = _1470 != 0;
    int _1474 = _793 * _1460;
    int _1476 = _1474 + _974;
    int _1478 = ~_755;
    int _1480 = _1478 + 1;
    float _1482 = trunc(_1400);
    int _1484 = int(_1482);
    float _1486 = float(uint(_1468));
    bool _1488 = !_1438;
    int _1490 = _1488 ? 0 : 1;
    int _1492 = _1480 * int(_1386);
    int _1494 = _1492 + _1352;
    bool _1496 = _793 == 0;
    float _1498 = as_type<float>(_795) * _1486;
    int _1500 = ~_1416;
    int _1502 = _1500 + 1;
    int _1504 = _1502 + 1;
    float _1506 = float(uint(_1494));
    float _1508 = _1486;
    float _1510 = as_type<float>(_904);
    if (_1472)
    {
        float _1512 = in.m_62.w;
        _1508 = _1512;
    }
    float _1514 = _1508;
    bool _1516 = !_1496;
    int _1518 = _1516 ? _1476 : (-1);
    float _1520 = trunc(_1498);
    float _1522 = precise::max(_1520, 0.0);
    uint _1524 = uint(_1522);
    int _1526 = abs(_1464);
    float _1528 = as_type<float>(_823) * _1506;
    int _1530 = abs(_1424);
    int _1532 = _1518 * _1504;
    int _1534 = _793 + (-1);
    int _1536 = abs(_1490);
    float _1538 = trunc(_1528);
    float _1540 = precise::max(_1538, 0.0);
    uint _1542 = uint(_1540);
    int _1544 = _1416 * _1534;
    int _1546 = _1544 + _1532;
    int _1548 = _1546 * _1526;
    int _1550 = ~_729;
    int _1552 = _1550 + 1;
    int _1554 = _1484 * _1530;
    int _1556 = _1554 + _974;
    bool _1558 = _755 == 0;
    int _1560 = _1430 * _1536;
    int _1562 = _1560 + _1548;
    bool _1564 = !_1446;
    int _1566 = _1564 ? 0 : 1;
    int _1568 = _1552 * int(_1524);
    int _1570 = _1568 + _1468;
    int _1572 = ~_755;
    int _1574 = _1572 + 1;
    float _1576 = as_type<float>(_1530);
    if (_1472)
    {
        float _1578 = _1514 * 3.1415927410125732421875;
        _1576 = _1578;
    }
    float _1580 = _1576;
    int _1582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1584 = _1582 != 0;
    int _1586 = int(_1386) + int(_1542);
    float _1588 = _1580;
    if (_1472)
    {
        float _1590 = _1580 * 0.15915493667125701904296875;
        _1588 = _1590;
    }
    float _1592 = _1588;
    int _1594 = abs(_1566);
    bool _1596 = !_1450;
    int _1598 = _1596 ? 0 : 1;
    int _1600 = _1574 * _1586;
    int _1602 = _1600 + _1352;
    float _1604 = float(uint(_1570));
    float _1606 = _1592;
    if (_1472)
    {
        float _1608 = _1592 * 6.283185482025146484375;
        float _1610 = sin(_1608);
        _1606 = _1610;
    }
    float _1612 = _1606;
    int _1614 = abs(_1598);
    int _1616 = _1556 * _1594;
    int _1618 = _1616 + _1562;
    bool _1620 = uint(_1602) >= uint(_755);
    float _1622 = as_type<float>(_795) * _1604;
    float _1624 = as_type<float>(_1526);
    if (_1584)
    {
        float _1626 = in.m_62.x;
        _1624 = _1626;
    }
    float _1628 = _1624;
    float _1630 = float(uint(_1212));
    bool _1632 = !_1620;
    int _1634 = _1632 ? 0 : (-1);
    float _1636 = trunc(_1622);
    float _1638 = precise::max(_1636, 0.0);
    uint _1640 = uint(_1638);
    int _1642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1644 = _1642 != 0;
    float _1646 = as_type<float>(_823) * _1630;
    int _1648 = ~_1586;
    int _1650 = _1648 + _1634;
    int _1652 = _1650 + 1;
    int _1654 = _1484 * _1614;
    int _1656 = _1654 + _1618;
    bool _1658 = !_1644;
    float _1660 = _1658 ? _201 : as_type<float>(_1356);
    bool _1662 = _1644;
    if (_1472)
    {
        bool _1664 = _1612 > 0.5;
        _1662 = _1664;
    }
    bool _1666 = _1662;
    int _1668 = _755 * _1652;
    int _1670 = _1668 + _1352;
    float _1672 = trunc(_1646);
    float _1674 = precise::max(_1672, 0.0);
    uint _1676 = uint(_1674);
    float _1678 = float(uint(_1656));
    float _1680 = 0.0;
    float _1682 = _1678;
    if (!_1472)
    {
        _1680 = _201;
    }
    float _1684 = _1680;
    bool _1686 = !_1558;
    int _1688 = _1686 ? _1670 : (-1);
    float _1690 = as_type<float>(_980) * _1678;
    int _1692 = ~_755;
    int _1694 = _1692 + 1;
    float _1696 = _1684;
    if (_1472)
    {
        float _1698 = -_201;
        float _1700 = _1666 ? _1698 : _201;
        _1696 = _1700;
    }
    float _1702 = _1696;
    float _1704 = trunc(_1690);
    float _1706 = precise::max(_1704, 0.0);
    uint _1708 = uint(_1706);
    int _1710 = int(_1524) + int(_1640);
    if (_1584)
    {
        float _1712 = _1628 * 3.1415927410125732421875;
        _1682 = _1712;
    }
    float _1714 = _1682;
    int _1716 = _1688 & 3;
    bool _1718 = _1716 != 0;
    int _1720 = _1688 & 3;
    bool _1722 = _1720 != 0;
    float _1724 = _1714;
    if (_1584)
    {
        float _1726 = _1714 * 0.15915493667125701904296875;
        _1724 = _1726;
    }
    float _1728 = _1724;
    int _1730 = _1718 ? 0 : 1;
    bool _1732 = uint(_1720) > 1u;
    int _1734 = _1694 * int(_1676);
    int _1736 = _1734 + _1212;
    float _1738 = float(uint(_1318));
    float _1740 = _1728;
    if (_1584)
    {
        float _1742 = _1728 * 6.283185482025146484375;
        float _1744 = sin(_1742);
        _1740 = _1744;
    }
    float _1746 = _1740;
    int _1748 = ~_729;
    int _1750 = _1748 + 1;
    float _1752 = float(uint(_1736));
    float _1754 = as_type<float>(_795) * _1738;
    int _1756 = ~_793;
    int _1758 = _1756 + 1;
    float _1760 = trunc(_1754);
    float _1762 = precise::max(_1760, 0.0);
    uint _1764 = uint(_1762);
    int _1766 = ~_1730;
    int _1768 = _1766 + 1;
    int _1770 = _1768 + 1;
    float _1772 = as_type<float>(_823) * _1752;
    int _1774 = _1770;
    if (!_1732)
    {
        int _1776 = ~_1730;
        int _1778 = _1776 + 1;
        _1774 = _1778;
    }
    int _1780 = _1774;
    int _1782 = _1750 * _1710;
    int _1784 = _1782 + _1468;
    float _1786 = -_211;
    int _1788 = _1246 ? as_type<int>(_1786) : as_type<int>(_211);
    int _1790 = _1758 * int(_1708);
    int _1792 = _1790 + _1656;
    bool _1794 = uint(_1720) >= 2u;
    float _1796 = trunc(_1772);
    float _1798 = precise::max(_1796, 0.0);
    uint _1800 = uint(_1798);
    bool _1802 = uint(_1784) >= uint(_729);
    float _1804 = float(uint(_1792));
    int _1806 = _1794 ? 0 : 1;
    bool _1808 = _1720 != 3;
    float _1810 = as_type<float>(_980) * _1804;
    int _1812 = ~_729;
    int _1814 = _1812 + 1;
    bool _1816 = !_1802;
    int _1818 = _1816 ? 0 : (-1);
    float _1820 = trunc(_1810);
    float _1822 = precise::max(_1820, 0.0);
    uint _1824 = uint(_1822);
    int _1826 = ~_1806;
    int _1828 = _1826 + 1;
    int _1830 = _1828 + 1;
    int _1832 = _1814 * int(_1764);
    int _1834 = _1832 + _1318;
    int _1836 = ~_1710;
    int _1838 = _1836 + _1818;
    int _1840 = _1838 + 1;
    float _1842 = float(uint(_1834));
    int _1844 = _729 * _1840;
    int _1846 = _1844 + _1468;
    int _1848 = _1830;
    bool _1850 = _1808;
    float _1852 = as_type<float>(_1764);
    if (_1808)
    {
        int _1854 = ~_1806;
        int _1856 = _1854 + 1;
        _1848 = _1856;
    }
    int _1858 = _1848;
    if (_1584)
    {
        bool _1860 = _1746 > 0.5;
        _1850 = _1860;
    }
    bool _1862 = _1850;
    float _1864 = as_type<float>(_795) * _1842;
    bool _1866 = !_1258;
    int _1868 = _1866 ? _1846 : (-1);
    if (!_1584)
    {
        _815 = _211;
    }
    float _1870 = _815;
    int _1872 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1874 = _1872 != 0;
    float _1876 = trunc(_1864);
    float _1878 = precise::max(_1876, 0.0);
    uint _1880 = uint(_1878);
    float _1882 = _1870;
    if (_1584)
    {
        float _1884 = -_211;
        float _1886 = _1862 ? _1884 : _211;
        _1882 = _1886;
    }
    float _1888 = _1882;
    int _1890 = _1868 & 3;
    bool _1892 = _1890 != 0;
    bool _1894 = !_1874;
    float _1896 = _1894 ? _211 : as_type<float>(_1788);
    int _1898 = int(_1676) + int(_1800);
    bool _1900 = uint(_1890) > 1u;
    int _1902 = int(_1708) + int(_1824);
    float _1904 = _892 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1906 = ~_793;
    int _1908 = _1906 + 1;
    int _1910 = _1868 & 3;
    bool _1912 = _1910 != 0;
    int _1914 = ~_755;
    int _1916 = _1914 + 1;
    int _1918 = _1908 * _1902;
    int _1920 = _1918 + _1656;
    int _1922 = _1912 ? 0 : 1;
    int _1924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1926 = _1924 != 0;
    int _1928 = _1916 * _1898;
    int _1930 = _1928 + _1212;
    float _1932 = float(uint(_1556));
    bool _1934 = !_1926;
    int _1936 = _1934 ? 0 : 1;
    bool _1938 = uint(_1920) >= uint(_793);
    float _1940 = as_type<float>(_980) * _1932;
    int _1942 = ~_1922;
    int _1944 = _1942 + 1;
    int _1946 = _1944 + 1;
    int _1948 = _1946;
    if (!_1900)
    {
        int _1950 = ~_1922;
        int _1952 = _1950 + 1;
        _1948 = _1952;
    }
    int _1954 = _1948;
    float _1956 = trunc(_1940);
    float _1958 = precise::max(_1956, 0.0);
    uint _1960 = uint(_1958);
    bool _1962 = uint(_1930) >= uint(_755);
    bool _1964 = !_1938;
    int _1966 = _1964 ? 0 : (-1);
    bool _1968 = _1890 != 3;
    bool _1970 = !_1962;
    int _1972 = _1970 ? 0 : (-1);
    bool _1974 = uint(_1890) >= 2u;
    int _1976 = ~_1902;
    int _1978 = _1976 + _1966;
    int _1980 = _1978 + 1;
    int _1982 = ~_729;
    int _1984 = _1982 + 1;
    int _1986 = int(_1764) + int(_1880);
    int _1988 = _793 * _1980;
    int _1990 = _1988 + _1656;
    int _1992 = ~_793;
    int _1994 = _1992 + 1;
    int _1996 = _1974 ? 0 : 1;
    int _1998 = _1984 * _1986;
    int _2000 = _1998 + _1318;
    int _2002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2004 = _2002 != 0;
    int _2006 = ~_1996;
    int _2008 = _2006 + 1;
    int _2010 = _2008 + 1;
    int _2012 = _2010;
    float _2014 = as_type<float>(_1994);
    int _2016 = _1954;
    if (_1968)
    {
        int _2018 = ~_1996;
        int _2020 = _2018 + 1;
        _2012 = _2020;
    }
    int _2022 = _2012;
    int _2024 = _1994 * int(_1960);
    int _2026 = _2024 + _1556;
    int _2028 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2030 = _2028 != 0;
    bool _2032 = !_2004;
    int _2034 = _2032 ? 0 : 1;
    bool _2036 = uint(_2000) >= uint(_729);
    bool _2038 = !_1496;
    int _2040 = _2038 ? _1990 : (-1);
    bool _2042 = !_2030;
    int _2044 = _2042 ? 0 : 1;
    bool _2046 = !_2036;
    int _2048 = _2046 ? 0 : (-1);
    int _2050 = _2040 & 3;
    bool _2052 = _2050 != 0;
    float _2054 = float(uint(_2026));
    int _2056 = _2040 & 3;
    bool _2058 = _2056 != 0;
    int _2060 = _2052 ? 0 : 1;
    float _2062 = as_type<float>(_980) * _2054;
    bool _2064 = uint(_2056) > 1u;
    int _2066 = ~_2060;
    int _2068 = _2066 + 1;
    int _2070 = _2068 + 1;
    float _2072 = trunc(_2062);
    float _2074 = precise::max(_2072, 0.0);
    uint _2076 = uint(_2074);
    float _2078 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2080 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2082 = -_2078;
    float _2084 = fma(_1904, 2.0, _2082);
    int _2086 = _2070;
    float _2088 = as_type<float>(_1960);
    if (!_2064)
    {
        int _2090 = ~_2060;
        int _2092 = _2090 + 1;
        _2086 = _2092;
    }
    int _2094 = _2086;
    float _2096 = fma(_1406, -2.0, _2080);
    bool _2098 = uint(_2056) >= 2u;
    float _2100 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _2102 = ~_793;
    int _2104 = _2102 + 1;
    float _2106 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _2108 = _2098 ? 0 : 1;
    float _2110 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _2112 = _2056 != 3;
    float _2114 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2106);
    int _2116 = int(_1960) + int(_2076);
    float _2118 = _902 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _2120 = ~_2108;
    int _2122 = _2120 + 1;
    int _2124 = _2122 + 1;
    float _2126 = -_123;
    float _2128 = fma(_2126, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2084);
    int _2130 = _2104 * _2116;
    int _2132 = _2130 + _1556;
    float _2134 = fma(_2118, -2.0, _2110);
    float _2136 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2138 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2114);
    int _2140 = _2124;
    float _2142 = as_type<float>(_2132);
    if (_2112)
    {
        int _2144 = ~_2108;
        int _2146 = _2144 + 1;
        _2140 = _2146;
    }
    int _2148 = _2140;
    float _2150 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2152 = uint(_2132) >= uint(_793);
    float _2154 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2156 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2096);
    bool _2158 = !_2152;
    int _2160 = _2158 ? 0 : (-1);
    float _2162 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2134);
    bool _2164 = _892 > 0.5;
    float _2166 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2168 = -_201;
    int _2170 = _2164 ? as_type<int>(_2168) : as_type<int>(_201);
    bool _2172 = _904 != 1;
    float _2174 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2176 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2178 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2180 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2182 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2184 = _2182 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    if (!_2172)
    {
        _2088 = _900;
    }
    float _2186 = _2088;
    float _2188 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2190 = _2188 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2192 = 0.0;
    float _2194 = _2186;
    if (!_2172)
    {
        _2192 = _900;
    }
    float _2196 = _2192;
    float _2198 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2178);
    float _2200 = _2196;
    if (!_2172)
    {
        _1510 = _918;
    }
    float _2202 = _1510;
    float _2204 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2180);
    float _2206 = _2202;
    if (!_2172)
    {
        _1852 = _918;
    }
    float _2208 = _1852;
    float _2210 = 1.0 / _2184;
    float _2212 = _2208;
    if (_2172)
    {
        _2194 = _892;
    }
    float _2214 = _2194;
    float _2216 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2218 = _2216 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    if (_2172)
    {
        _2200 = _892;
    }
    float _2220 = _2200;
    if (_2172)
    {
        _2206 = _900;
    }
    float _2222 = _2206;
    float _2224 = _2214 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2172)
    {
        _2212 = _900;
    }
    float _2226 = _2212;
    float _2228 = 1.0 / _2190;
    bool _2230 = _906 != 2;
    float _2232 = -_2150;
    float _2234 = fma(_2224, 2.0, _2232);
    float _2236 = _2222 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2238 = fma(_2226, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2174);
    float _2240 = -_123;
    float _2242 = fma(_2240, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2234);
    float _2244 = fma(_2236, -2.0, _2166);
    float _2246 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2248 = _2246 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2250 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2238);
    float _2252 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2244);
    float _2254 = 1.0 / _2218;
    if (_2230)
    {
        _2142 = _892;
    }
    float _2256 = _2142;
    float _2258 = -_2250;
    float _2260 = _2258 + 1.0;
    float _2262 = _2256;
    if (_2230)
    {
        _2014 = _900;
    }
    float _2264 = _2014;
    float _2266 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2268 = _2266 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2270 = _2264;
    if (!_2230)
    {
        _2262 = _918;
    }
    float _2272 = _2262;
    if (!_2230)
    {
        _2270 = _892;
    }
    float _2274 = _2270;
    float _2276 = 1.0 / _2248;
    int _2278 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2280 = _2278 != 0;
    float _2282 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2136);
    float _2284 = _908 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2286 = _2272 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _2288 = !_2280;
    float _2290 = _2288 ? _201 : as_type<float>(_2170);
    float _2292 = _2274 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2294 = -_2100;
    float _2296 = fma(_2284, 2.0, _2294);
    float _2298 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2300 = log2(_2298);
    float _2302 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _2304 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2306 = isnan(0.0);
    bool _2308 = _2304 || _2306;
    bool _2310 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2312 = _2308 || _2310;
    float _2314 = -_2154;
    float _2316 = fma(_2286, 2.0, _2314);
    float _2318 = fma(_2220, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2302);
    float _2320 = fma(_2292, -2.0, _2176);
    float _2322 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2324 = -_123;
    float _2326 = fma(_2324, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2296);
    float _2328 = _900 * 2.0;
    float _2330 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2198);
    float _2332 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2334 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2322);
    float _2336 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2282);
    float _2338 = _2300 * _123;
    float _2340 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2332);
    float _2342 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2334);
    float _2344 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2204);
    float _2346 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2318);
    float _2348 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2340);
    float _2350 = exp2(_2338);
    float _2352 = -_123;
    float _2354 = fma(_2352, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2316);
    float _2356 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2320);
    float _2358 = _900 + _892;
    float _2360 = -_2336;
    float _2362 = _2360 + 1.0;
    int _2364 = ~_1986;
    int _2366 = _2364 + _2048;
    int _2368 = _2366 + 1;
    float _2370 = floor(_2328);
    float _2372 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2374 = _2372 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2376 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2378 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2376;
    float _2380 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2382 = _2380 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _2384 = _729 * _2368;
    int _2386 = _2384 + _1318;
    bool _2388 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2390 = isnan(_711);
    bool _2392 = _2388 || _2390;
    bool _2394 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2396 = _2392 || _2394;
    float _2398 = float(_2396);
    float _2400 = _2378 * _2228;
    float _2402 = _918 * 2.0;
    float _2404 = -_2350;
    float _2406 = _2404 + 1.0;
    float _2408 = 1.0 / _2268;
    float _2410 = in.m_48.x;
    float _2412 = in.m_48.y;
    float _2414 = in.m_48.z;
    float _2416 = _2358 + (-1.0);
    float _2418 = _2312 ? _2406 : 0.0;
    float _2420 = -_2342;
    float _2422 = _2420 + 1.0;
    bool _2424 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2426 = isnan(1.0);
    bool _2428 = _2424 || _2426;
    bool _2430 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2432 = _2428 || _2430;
    float _2434 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2436 = 1.0 + _2434;
    float _2438 = floor(_2402);
    float _2440 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2442 = _2440 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _2444 = _1868 >> 31;
    float _2446 = -_2348;
    float _2448 = _2446 + 1.0;
    int _2450 = ~_1898;
    int _2452 = _2450 + _1972;
    int _2454 = _2452 + 1;
    float _2456 = -_2344;
    float _2458 = _2456 + 1.0;
    int _2460 = _2444 & 3;
    float _2462 = 1.0 / _2436;
    float _2464 = _2382 * _2408;
    int _2466 = _755 * _2454;
    int _2468 = _2466 + _1212;
    int _2470 = _1868 + _2460;
    int _2472 = abs(_2148);
    float _2474 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2476 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2474;
    float _2478 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2480 = _711 + _2478;
    float _2482 = _2412 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2484 = 1.0 / _2442;
    int _2486 = _2470 >> 2;
    float _2488 = fma(_2410, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2482);
    bool _2490 = !_1892;
    int _2492 = _2490 ? 0 : 1;
    if (_2432)
    {
        float _2494 = _2418 * _2462;
        _133 = _2494;
    }
    float _2496 = _133;
    bool _2498 = _1180 >= 0.0;
    bool _2500 = isnan(_1180);
    bool _2502 = _2498 || _2500;
    bool _2504 = isnan(0.0);
    bool _2506 = _2502 || _2504;
    float _2508 = _2412 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2510 = _2412 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _2512 = _2506 ? 0 : 1;
    float _2514 = fma(_2410, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2508);
    bool _2516 = _1180 > 0.0;
    float _2518 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2520 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2518;
    float _2522 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2524 = _2522 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2526 = fma(_2410, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2510);
    float _2528 = fma(_2414, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2514);
    float _2530 = _2520 * _2210;
    float _2532 = _2524 * _2276;
    float _2534 = 1.0 / _2374;
    int _2536 = ~_2512;
    int _2538 = _2536 + 1;
    int _2540 = _2538 + 1;
    float _2542 = fma(_2530, _2480, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2544 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2546 = isnan(_711);
    bool _2548 = _2544 || _2546;
    bool _2550 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2552 = _2548 || _2550;
    float _2554 = float(_2552);
    float _2556 = _2528 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2558 = _2486 << 4;
    int _2560 = _2558 + 656;
    float _2562 = _2476 * _2484;
    int _2564 = _2540;
    if (!_2516)
    {
        int _2566 = ~_2512;
        int _2568 = _2566 + 1;
        _2564 = _2568;
    }
    int _2570 = _2564;
    float _2572 = -_2554;
    float _2574 = _2572 + 1.0;
    bool _2576 = _2370 >= 0.0;
    bool _2578 = isnan(_2370);
    bool _2580 = _2576 || _2578;
    bool _2582 = isnan(0.0);
    bool _2584 = _2580 || _2582;
    bool _2586 = !_1258;
    int _2588 = _2586 ? _2386 : (-1);
    int _2590 = _2584 ? 0 : 1;
    bool _2592 = _2370 > 0.0;
    float _2594 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2596 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2594;
    float _2598 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2600 = _2598 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _2602 = ~_2590;
    int _2604 = _2602 + 1;
    int _2606 = _2604 + 1;
    float _2608 = _2596 * _2254;
    bool _2610 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2612 = isnan(_711);
    bool _2614 = _2610 || _2612;
    bool _2616 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2618 = _2614 || _2616;
    float _2620 = float(_2618);
    float _2622 = _2600 * _2534;
    bool _2624 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2626 = isnan(_711);
    bool _2628 = _2624 || _2626;
    bool _2630 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2632 = _2628 || _2630;
    float _2634 = float(_2632);
    bool _2636 = !_1722;
    int _2638 = _2636 ? 0 : 1;
    float _2640 = -_2620;
    float _2642 = _2640 + 1.0;
    int _2644 = abs(_2492);
    float _2646 = -_2634;
    float _2648 = _2646 + 1.0;
    int _2650 = _2606;
    if (!_2592)
    {
        int _2652 = ~_2590;
        int _2654 = _2652 + 1;
        _2650 = _2654;
    }
    int _2656 = _2650;
    float _2658 = _2398 * _2642;
    int _2660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2662 = _2660 != 0;
    int _2664 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2666 = _2664 != 0;
    int _2668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2670 = _2668 != 0;
    float _2672 = -_2398;
    float _2674 = _2672 + 1.0;
    bool _2676 = _2438 >= 0.0;
    bool _2678 = isnan(_2438);
    bool _2680 = _2676 || _2678;
    bool _2682 = isnan(0.0);
    bool _2684 = _2680 || _2682;
    float _2686 = _2620 * _2648;
    bool _2688 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2690 = isnan(_711);
    bool _2692 = _2688 || _2690;
    bool _2694 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2696 = _2692 || _2694;
    float _2698 = float(_2696);
    int _2700 = _2684 ? 0 : 1;
    bool _2702 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2704 = isnan(_711);
    bool _2706 = _2702 || _2704;
    bool _2708 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2710 = _2706 || _2708;
    float _2712 = float(_2710);
    float _2714 = -_2698;
    float _2716 = _2714 + 1.0;
    bool _2718 = _2438 > 0.0;
    float _2720 = _2698 * _2674;
    float _2722 = fma(_2414, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2488);
    float _2724 = fma(_2414, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2526);
    float _2726 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2728 = _711 + _2726;
    float _2730 = _2712 * _2716;
    float _2732 = -_2712;
    float _2734 = _2732 + 1.0;
    bool _2736 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2738 = isnan(_711);
    bool _2740 = _2736 || _2738;
    bool _2742 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2744 = _2740 || _2742;
    float _2746 = float(_2744);
    float _2748 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2750 = _711 + _2748;
    float _2752 = fma(_2532, _2728, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2754 = _2554 * _2734;
    bool _2756 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2758 = isnan(_711);
    bool _2760 = _2756 || _2758;
    bool _2762 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2764 = _2760 || _2762;
    float _2766 = float(_2764);
    float _2768 = fma(_2400, _2750, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2770 = -_2746;
    float _2772 = _2770 + 1.0;
    float _2774 = _2746 * _2574;
    float _2776 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2778 = _711 + _2776;
    float _2780 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2782 = _711 + _2780;
    float _2784 = _2766 * _2772;
    float _2786 = -_2766;
    float _2788 = _2786 + 1.0;
    float _2790 = fma(_2464, _2778, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2792 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2794 = _711 + _2792;
    float _2796 = _2542 * _2784;
    float _2798 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2800 = _711 + _2798;
    float _2802 = _2722 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2804 = fma(_2622, _2794, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2806 = fma(_2788, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2796);
    float _2808 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2810 = _2556 + _2808;
    uint _2812 = uint(int(uint(_2560) >> uint(2)));
    uint _2814 = uint(int(uint(int(_2812)) >> uint(2)));
    int _2816 = int(_2812) & 3;
    float _2818 = (*spvDescriptorSet0.vp_c9)._m0[int(_2814)][_2816];
    int _2820 = int(_2812) + 1;
    uint _2822 = uint(int(uint(_2820) >> uint(2)));
    int _2824 = _2820 & 3;
    float _2826 = (*spvDescriptorSet0.vp_c9)._m0[int(_2822)][_2824];
    float _2828 = fma(_2562, _2800, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2830 = fma(_2752, _2774, _2806);
    float _2832 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2834 = _2802 + _2832;
    float _2836 = _2810 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2838 = _2724 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _2840 = _1890 != 3;
    float _2842 = fma(_2768, _2754, _2830);
    float _2844 = fma(_2834, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2836);
    float _2846 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2848 = _2838 + _2846;
    int _2850 = ~_2700;
    int _2852 = _2850 + 1;
    int _2854 = _2852 + 1;
    float _2856 = _892 + _918;
    int _2858 = _2854;
    float _2860 = _2658;
    if (!_2718)
    {
        int _2862 = ~_2700;
        int _2864 = _2862 + 1;
        _2858 = _2864;
    }
    int _2866 = _2858;
    float _2868 = _892 + (-0.5);
    float _2870 = fma(_2848, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2844);
    float _2872 = fma(_2608, _2782, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _2874 = _2560 + 8;
    uint _2876 = uint(int(uint(_2874) >> uint(2)));
    uint _2878 = uint(int(uint(int(_2876)) >> uint(2)));
    int _2880 = int(_2876) & 3;
    float _2882 = (*spvDescriptorSet0.vp_c9)._m0[int(_2878)][_2880];
    int _2884 = int(_2876) + 1;
    uint _2886 = uint(int(uint(_2884) >> uint(2)));
    int _2888 = _2884 & 3;
    float _2890 = (*spvDescriptorSet0.vp_c9)._m0[int(_2886)][_2888];
    bool _2892 = !_2840;
    int _2894 = _2892 ? 0 : (-1);
    float _2896 = fma(_2790, _2730, _2842);
    bool _2898 = _2870 >= 0.0;
    float _2900 = _900 + _918;
    float _2902 = _900 + (-0.5);
    float _2904 = fma(_2872, _2720, _2896);
    float _2906 = _1888 + (-0.5);
    float _2908 = _1702 + 0.5;
    float _2910 = fma(_2804, _2658, _2904);
    int _2912 = abs(_1954);
    float _2914 = -_2906;
    float _2916 = -_2162;
    float _2918 = fma(_2914, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2916);
    float _2920 = fma(_2416, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2922 = _2290 + 0.5;
    float _2924 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_2898)
    {
        _2860 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2926 = _2860;
    float _2928 = _1896 + (-0.5);
    int _2930 = ~_2912;
    int _2932 = _2930 + 1;
    int _2934 = _2932 + 1;
    float _2936 = fma(_2922, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2128);
    float _2938 = fma(_2908, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2326);
    float _2940 = -_2928;
    float _2942 = -_2156;
    float _2944 = fma(_2940, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2942);
    if (_2898)
    {
        float _2946 = _2926 * 5.0;
        _2016 = as_type<int>(_2946);
    }
    int _2948 = _2016;
    float _2950 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2952 = int(_2950);
    float _2954 = fma(_2828, _2686, _2910);
    int _2956 = abs(_2022);
    float _2958 = -_2362;
    float _2960 = fma(_2958, _1702, _2938);
    if (_2898)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9430 = as_type<float>(_2948);
        out.gl_Position.z = _9430;
    }
    float _2962 = -_2138;
    float _2964 = _2962 + 1.0;
    float _2966 = fma(_2634, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2954);
    float _2968 = _2924 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2970 = _2934 * as_type<int>(_2826);
    float _2972 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2974 = fma(_2964, _1888, _2918);
    bool _2976 = !_2662;
    int _2978 = _2976 ? 0 : 1;
    out.m_70.x = _2966;
    int _2980 = ~_2644;
    int _2982 = _2980 + 1;
    int _2984 = _2982 + 1;
    float _2986 = _1660 + 0.5;
    float _2988 = _1420 + (-0.5);
    int _2990 = _2984 * as_type<int>(_2818);
    int _2992 = _2990 + _2970;
    int _2994 = ~_2956;
    int _2996 = _2994 + 1;
    int _2998 = _2996 + 1;
    float _3000 = fma(_2968, _2986, _2242);
    int _3002 = abs(_2894);
    float _3004 = _2810 * _2810;
    out.m_72.x = _2960;
    out.m_72.y = _2974;
    int _3006 = _2998 * as_type<int>(_2882);
    int _3008 = _3006 + _2992;
    float _3010 = float(uint(_2952));
    float _3012 = fma(_2834, _2834, _3004);
    int _3014 = abs(_2034);
    float _3016 = _2972 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3018 = ~_3002;
    int _3020 = _3018 + 1;
    int _3022 = _3020 + 1;
    if (_2898)
    {
        out.m_55.x = 0.0;
    }
    float _3024 = 1.0 / _3010;
    int _3026 = ~_3014;
    int _3028 = _3026 + 1;
    int _3030 = _3028 + 1;
    float _3032 = -_3016;
    float _3034 = -_2252;
    float _3036 = fma(_3032, _2988, _3034);
    int _3038 = _3022 * as_type<int>(_2890);
    int _3040 = _3038 + _3008;
    float _3042 = fma(_2848, _2848, _3012);
    int _3044 = abs(_2952);
    float _3046 = _553 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _3048 = _3040 * _3030;
    float _3050 = rsqrt(_3042);
    int _3052 = _1688 >> 31;
    int _3054 = _2588 * _3014;
    int _3056 = _3054 + _3048;
    float _3058 = float(uint(_3044));
    int _3060 = _3052 & 3;
    int _3062 = as_type<int>(_3024) + (-2);
    float _3064 = float(uint(_3056));
    float _3066 = 1.0 / _3058;
    int _3068 = _1688 + _3060;
    float _3070 = _3046 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _3072 = _2040 >> 31;
    float _3074 = as_type<float>(_3062) * _3064;
    int _3076 = abs(_2978);
    float _3078 = _3070 * _3050;
    int _3080 = _3072 & 3;
    int _3082 = ~_2952;
    int _3084 = _3082 + 1;
    float _3086 = trunc(_3074);
    float _3088 = precise::max(_3086, 0.0);
    uint _3090 = uint(_3088);
    float _3092 = _2834 * _3078;
    int _3094 = _2040 + _3080;
    float _3096 = _2810 * _3078;
    float _3098 = float(_2866);
    float _3100 = -_3092;
    float _3102 = _2834 + _3100;
    int _3104 = _3068 >> 2;
    float _3106 = -_3096;
    float _3108 = _2810 + _3106;
    int _3110 = abs(_3056);
    float _3112 = in.m_74.x;
    float _3114 = in.m_74.y;
    float _3116 = in.m_74.z;
    int _3118 = _3104 << 4;
    int _3120 = _3118 + 368;
    float _3122 = _3108 * _3108;
    int _3124 = _3094 >> 2;
    float _3126 = fma(_3102, _3102, _3122);
    int _3128 = as_type<int>(_3066) + (-2);
    int _3130 = _3084 * int(_3090);
    int _3132 = _3130 + _3056;
    float _3134 = float(uint(_3110));
    uint _3136 = uint(int(uint(_3120) >> uint(2)));
    uint _3138 = uint(int(uint(int(_3136)) >> uint(2)));
    int _3140 = int(_3136) & 3;
    float _3142 = (*spvDescriptorSet0.vp_c9)._m0[int(_3138)][_3140];
    int _3144 = int(_3136) + 1;
    uint _3146 = uint(int(uint(_3144) >> uint(2)));
    int _3148 = _3144 & 3;
    float _3150 = (*spvDescriptorSet0.vp_c9)._m0[int(_3146)][_3148];
    float _3152 = float(_3076);
    int _3154 = _3124 << 4;
    int _3156 = _3154 + 800;
    float _3158 = as_type<float>(_3128) * _3134;
    float _3160 = float(uint(_3132));
    float _3162 = _3152 * _3098;
    float _3164 = -_2330;
    float _3166 = _3164 + 1.0;
    uint _3168 = uint(int(uint(_3156) >> uint(2)));
    uint _3170 = uint(int(uint(int(_3168)) >> uint(2)));
    int _3172 = int(_3168) & 3;
    float _3174 = (*spvDescriptorSet0.vp_c9)._m0[int(_3170)][_3172];
    int _3176 = int(_3168) + 1;
    uint _3178 = uint(int(uint(_3176) >> uint(2)));
    int _3180 = _3176 & 3;
    float _3182 = (*spvDescriptorSet0.vp_c9)._m0[int(_3178)][_3180];
    float _3184 = trunc(_3158);
    float _3186 = precise::max(_3184, 0.0);
    uint _3188 = uint(_3186);
    float _3190 = -_2346;
    float _3192 = _3190 + 1.0;
    float _3194 = fma(_1896, _3166, _2944);
    float _3196 = as_type<float>(_3062) * _3160;
    float _3198 = _2848 * _3078;
    float _3200 = -_2422;
    float _3202 = fma(_2290, _3200, _2936);
    float _3204 = -_3192;
    float _3206 = fma(_1660, _3204, _3000);
    float _3208 = fma(_1420, _2260, _3036);
    int _3210 = ~_3044;
    int _3212 = _3210 + 1;
    float _3214 = _3162 * (-2.0);
    float _3216 = trunc(_3196);
    float _3218 = precise::max(_3216, 0.0);
    uint _3220 = uint(_3218);
    int _3222 = abs(_2638);
    out.m_76.x = _3202;
    out.m_76.y = _3194;
    out.m_76.z = _3206;
    out.m_76.w = _3208;
    float _3224 = fma(_3214, _3112, _3112);
    int _3226 = ~_2116;
    int _3228 = _3226 + _2160;
    int _3230 = _3228 + 1;
    float _3232 = -_3198;
    float _3234 = _2848 + _3232;
    int _3236 = _3212 * int(_3188);
    int _3238 = _3236 + _3110;
    float _3240 = fma(_2868, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3224);
    int _3242 = abs(_1936);
    int _3244 = _3120 + 8;
    uint _3246 = uint(int(uint(_3244) >> uint(2)));
    uint _3248 = uint(int(uint(int(_3246)) >> uint(2)));
    int _3250 = int(_3246) & 3;
    float _3252 = (*spvDescriptorSet0.vp_c9)._m0[int(_3248)][_3250];
    int _3254 = int(_3246) + 1;
    uint _3256 = uint(int(uint(_3254) >> uint(2)));
    int _3258 = _3254 & 3;
    float _3260 = (*spvDescriptorSet0.vp_c9)._m0[int(_3256)][_3258];
    int _3262 = _793 * _3230;
    int _3264 = _3262 + _1556;
    int _3266 = abs(_2044);
    float _3268 = fma(_2920, _3214, _2920);
    float _3270 = fma(_3234, _3234, _3126);
    float _3272 = fma(_3268, _2496, _3240);
    int _3274 = _3156 + 8;
    uint _3276 = uint(int(uint(_3274) >> uint(2)));
    uint _3278 = uint(int(uint(int(_3276)) >> uint(2)));
    int _3280 = int(_3276) & 3;
    float _3282 = (*spvDescriptorSet0.vp_c9)._m0[int(_3278)][_3280];
    int _3284 = int(_3276) + 1;
    uint _3286 = uint(int(uint(_3284) >> uint(2)));
    int _3288 = _3284 & 3;
    float _3290 = (*spvDescriptorSet0.vp_c9)._m0[int(_3286)][_3288];
    float _3292 = float(uint(_3238));
    int _3294 = abs(_1780);
    int _3296 = int(_3090) + int(_3220);
    float _3298 = as_type<float>(_3128) * _3292;
    int _3300 = ~_2952;
    int _3302 = _3300 + 1;
    int _3304 = ~_3294;
    int _3306 = _3304 + 1;
    int _3308 = _3306 + 1;
    bool _3310 = !_2058;
    int _3312 = _3310 ? 0 : 1;
    float _3314 = trunc(_3298);
    float _3316 = precise::max(_3314, 0.0);
    uint _3318 = uint(_3316);
    int _3320 = abs(_2094);
    int _3322 = _3302 * _3296;
    int _3324 = _3322 + _3056;
    bool _3326 = _1720 != 3;
    int _3328 = _3308 * as_type<int>(_3150);
    int _3330 = ~_3320;
    int _3332 = _3330 + 1;
    int _3334 = _3332 + 1;
    bool _3336 = !_3326;
    int _3338 = _3336 ? 0 : (-1);
    bool _3340 = uint(_3324) >= uint(_2952);
    int _3342 = _3334 * as_type<int>(_3182);
    int _3344 = abs(_3312);
    int _3346 = ~_3222;
    int _3348 = _3346 + 1;
    int _3350 = _3348 + 1;
    int _3352 = ~_3044;
    int _3354 = _3352 + 1;
    int _3356 = int(_3188) + int(_3318);
    int _3358 = _3350 * as_type<int>(_3142);
    int _3360 = _3358 + _3328;
    bool _3362 = !_3340;
    int _3364 = _3362 ? 0 : (-1);
    bool _3366 = _2056 != 3;
    int _3368 = _3354 * _3356;
    int _3370 = _3368 + _3110;
    int _3372 = ~_3296;
    int _3374 = _3372 + _3364;
    int _3376 = _3374 + 1;
    int _3378 = abs(_1858);
    int _3380 = ~_3344;
    int _3382 = _3380 + 1;
    int _3384 = _3382 + 1;
    int _3386 = _2952 * _3376;
    int _3388 = _3386 + _3056;
    bool _3390 = !_3366;
    int _3392 = _3390 ? 0 : (-1);
    bool _3394 = uint(_3370) >= uint(_3044);
    int _3396 = _3384 * as_type<int>(_3174);
    int _3398 = _3396 + _3342;
    int _3400 = ~_3378;
    int _3402 = _3400 + 1;
    int _3404 = _3402 + 1;
    float _3406 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3408 = ~_2472;
    int _3410 = _3408 + 1;
    int _3412 = _3410 + 1;
    int _3414 = _3056 ^ _2952;
    int _3416 = _3404 * as_type<int>(_3252);
    int _3418 = _3416 + _3360;
    bool _3420 = !_3394;
    int _3422 = _3420 ? 0 : (-1);
    int _3424 = _3412 * as_type<int>(_3282);
    int _3426 = _3424 + _3398;
    int _3428 = abs(_3338);
    float _3430 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    uint _3432 = uint(int(uint(_3414) >> uint(31)));
    int _3434 = abs(_3392);
    int _3436 = ~_3422;
    int _3438 = _3356 + _3436;
    int _3440 = _3438 + 1;
    int _3442 = ~_3428;
    int _3444 = _3442 + 1;
    int _3446 = _3444 + 1;
    float _3448 = _3406 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3450 = ~int(_3432);
    int _3452 = _3450 + 1;
    int _3454 = ~_3434;
    int _3456 = _3454 + 1;
    int _3458 = _3456 + 1;
    int _3460 = _3446 * as_type<int>(_3260);
    int _3462 = _3460 + _3418;
    bool _3464 = _2952 == 0;
    int _3466 = _3440 ^ _3452;
    int _3468 = _3458 * as_type<int>(_3290);
    int _3470 = _3468 + _3426;
    int _3472 = ~_3266;
    int _3474 = _3472 + 1;
    int _3476 = _3474 + 1;
    bool _3478 = !_3464;
    int _3480 = _3478 ? _3388 : (-1);
    bool _3482 = _2952 == 0;
    int _3484 = _3470 * _3476;
    int _3486 = ~_3452;
    int _3488 = _3486 + _3466;
    int _3490 = _3488 + 1;
    int _3492 = ~_3242;
    int _3494 = _3492 + 1;
    int _3496 = _3494 + 1;
    bool _3498 = _755 == 0;
    bool _3500 = !_3482;
    int _3502 = _3500 ? _3490 : (-1);
    int _3504 = _3462 * _3496;
    bool _3506 = !_3498;
    int _3508 = _3506 ? _2468 : (-1);
    float _3510 = _1110 + (-0.5);
    float _3512 = float(_3480);
    float _3514 = float(_3502);
    float _3516 = _3430 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3518 = _3508 * _3242;
    int _3520 = _3518 + _3504;
    float _3522 = fma(_3448, _3512, _2354);
    bool _3524 = !_1496;
    int _3526 = _3524 ? _3264 : (-1);
    float _3528 = -_2356;
    float _3530 = fma(_3516, _3514, _3528);
    bool _3532 = !_2666;
    int _3534 = _3532 ? 0 : 1;
    float _3536 = _1080 + 0.5;
    int _3538 = _3526 * _3266;
    int _3540 = _3538 + _3484;
    int _3542 = abs(_3534);
    float _3544 = fma(_3448, _3536, _3522);
    float _3546 = -_3516;
    float _3548 = fma(_3546, _3510, _3530);
    float _3550 = float(_3520);
    float _3552 = -_2448;
    float _3554 = fma(_1080, _3552, _3544);
    float _3556 = float(_3540);
    float _3558 = fma(_1110, _2458, _3548);
    float _3560 = float(_2570);
    out.m_78.x = _3550;
    float _3562 = float(_3542);
    out.m_78.w = _3556;
    bool _3564 = !_2670;
    int _3566 = _3564 ? 0 : 1;
    float _3568 = _3562 * _3560;
    out.m_80.x = _3554;
    out.m_80.y = _3558;
    float _3570 = _3116;
    if (_2898)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3572 = -_3096;
    float _3574 = _2556 + _3572;
    float _3576 = -_3092;
    float _3578 = _2802 + _3576;
    float _3580 = -_3198;
    float _3582 = _2838 + _3580;
    int _3584 = abs(_3566);
    float _3586 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3588 = _3574 + _3586;
    float _3590 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3592 = _3578 + _3590;
    float _3594 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3596 = _3582 + _3594;
    float _3598 = _2900 + (-1.0);
    float _3600 = _3588 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3602 = _3568 * (-2.0);
    float _3604 = float(_2656);
    float _3606 = fma(_3598, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3608 = fma(_3592, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3600);
    float _3610 = float(_3584);
    float _3612 = _2856 + (-1.0);
    float _3614 = _3272 * 0.15915493667125701904296875;
    float _3616 = fma(_3596, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3608);
    float _3618 = fma(_3602, _3114, _3114);
    float _3620 = fma(_3606, _3602, _3606);
    float _3622 = _3610 * _3604;
    float _3624 = fma(_2902, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3618);
    bool _3626 = _3616 >= 0.0;
    float _3628 = _3622 * (-2.0);
    float _3630 = sqrt(_3270);
    float _3632 = fma(_3620, _2496, _3624);
    float _3634 = fma(_3612, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3636 = fma(_3628, _3116, _3116);
    float _3638 = _918 + (-0.5);
    float _3640 = _3632 * 0.15915493667125701904296875;
    float _3642 = fma(_3634, _3628, _3634);
    float _3644 = _3614 * 6.283185482025146484375;
    float _3646 = sin(_3644);
    float _3648 = fma(_3638, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3636);
    float _3650 = _3592;
    float _3652 = _3578;
    if (_3626)
    {
        _3570 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3654 = _3570;
    int _3656 = as_type<int>(_3654);
    if (_3626)
    {
        out.m_55.x = 0.0;
    }
    float _3658 = fma(_3642, _2496, _3648);
    float _3660 = _3614 * 6.283185482025146484375;
    float _3662 = cos(_3660);
    if (_3626)
    {
        float _3664 = _3654 * 5.0;
        _3656 = as_type<int>(_3664);
    }
    int _3666 = _3656;
    float _3668 = _3658 * 0.15915493667125701904296875;
    if (_3626)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10450 = as_type<float>(_3666);
        out.gl_Position.z = _10450;
    }
    float _3670 = _3640 * 6.283185482025146484375;
    float _3672 = sin(_3670);
    float _3674 = _3640 * 6.283185482025146484375;
    float _3676 = cos(_3674);
    if (_3626)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3678 = _3668 * 6.283185482025146484375;
    float _3680 = cos(_3678);
    float _3682 = _3050 * _3630;
    float _3684 = _551 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3686 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _211);
    float _3688 = _3662 * _3676;
    float _3690 = _3046 * _3682;
    float _3692 = _3682 * _3684;
    float _3694 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _201);
    float _3696 = _3668 * 6.283185482025146484375;
    float _3698 = sin(_3696);
    float _3700 = _3646 * _3676;
    float _3702 = _3686 * _3692;
    float _3704 = _3646 * _3672;
    float _3706 = _3662 * _3672;
    float _3708 = _3694 * _3690;
    float _3710 = _211 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3712 = _3662 * _3680;
    float _3714 = _3646 * _3680;
    float _3716 = _3676 * _3680;
    float _3718 = _3672 * _3680;
    float _3720 = _3712 * _3702;
    float _3722 = _3682 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3724 = _3722 * 0.5;
    float _3726 = fma(_3698, _3688, _3704);
    float _3728 = -_3700;
    float _3730 = fma(_3698, _3706, _3728);
    float _3732 = -_3702;
    float _3734 = _3698 * _3732;
    float _3736 = -_3706;
    float _3738 = fma(_3698, _3700, _3736);
    float _3740 = fma(_3726, _3708, _3720);
    float _3742 = _3714 * _3702;
    float _3744 = fma(_3716, _3708, _3734);
    float _3746 = fma(_3698, _3704, _3688);
    float _3748 = fma(_3730, _3724, _3740);
    float _3750 = fma(_3738, _3708, _3742);
    float _3752 = fma(_3718, _3724, _3744);
    float _3754 = _3748 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3756 = _3748 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3758 = fma(_3746, _3724, _3750);
    float _3760 = _3748 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3762 = fma(_3752, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3754);
    float _3764 = fma(_3752, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3756);
    float _3766 = fma(_3758, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3762);
    float _3768 = fma(_3758, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3764);
    float _3770 = _3766 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3772 = _3768 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3774 = _3726 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3776 = _2802 + _3770;
    float _3778 = _2838 + _3772;
    float _3780 = _3726 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3782 = fma(_3716, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3774);
    float _3784 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3786 = _3776 + _3784;
    float _3788 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3790 = _3778 + _3788;
    float _3792 = fma(_3716, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3780);
    float _3794 = fma(_3752, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3760);
    float _3796 = _3786 * _3786;
    float _3798 = _3790 * _3790;
    float _3800 = _3726 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3802 = fma(_3710, _3710, 1.0);
    float _3804 = fma(_3758, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3794);
    float _3806 = _3796 + _3798;
    float _3808 = fma(_3716, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3800);
    float _3810 = rsqrt(_3802);
    float _3812 = _3712 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3814 = _3712 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3816 = _3712 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3818 = _3804 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3820 = -_3698;
    float _3822 = fma(_3820, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3812);
    float _3824 = -_3698;
    float _3826 = fma(_3824, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3814);
    float _3828 = -_3698;
    float _3830 = fma(_3828, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3816);
    float _3832 = sqrt(_3806);
    float _3834 = _3730 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3836 = _3730 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3838 = _3730 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3840 = _2556 + _3818;
    float _3842 = fma(_3718, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3834);
    float _3844 = fma(_3718, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3836);
    float _3846 = fma(_3718, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3838);
    bool _3848 = _3832 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3850 = _3836;
    float _3852 = _3834;
    float _3854 = _3838;
    float _3856 = _3718;
    float _3858 = _3804;
    if (!_3848)
    {
        _3850 = _3798;
    }
    float _3860 = _3850;
    float _3862 = _3860;
    if (!_3848)
    {
        _3852 = _3796;
    }
    float _3864 = _3852;
    float _3866 = _3864;
    if (!_3848)
    {
        _3854 = _3776;
    }
    float _3868 = _3854;
    float _3870 = _3868;
    if (!_3848)
    {
        _3856 = _3778;
    }
    float _3872 = _3856;
    float _3874 = _3872;
    if (!_3848)
    {
        _3858 = _3840;
    }
    float _3876 = _3858;
    bool _3878 = !_3848;
    float _3880 = _3876;
    if (!_3878)
    {
        float _3882 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3884 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3886 = _3832 + _3884;
        float _3888 = rsqrt(_3806);
        float _3890 = _3886 * _3882;
        float _3892 = _3840 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3894 = _3890 * 0.15915493667125701904296875;
        float _3896 = _3894 * 6.283185482025146484375;
        float _3898 = sin(_3896);
        float _3900 = _3894 * 6.283185482025146484375;
        float _3902 = cos(_3900);
        float _3904 = fma(_3898, _3892, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3906 = _3888 * _3904;
        float _3908 = _3902 + (-1.0);
        float _3910 = fma(_3786, _3906, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3912 = fma(_3790, _3906, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3914 = _3908 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3916 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3918 = _3910 + _3916;
        float _3920 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3922 = _3912 + _3920;
        float _3924 = fma(_3840, _3902, _3914);
        float _3926 = _3918 * _3918;
        float _3928 = _3922 * _3922;
        _3880 = _3924;
        _3866 = _3926;
        _3862 = _3928;
        _3870 = _3910;
        _3874 = _3912;
    }
    float _3930 = _3880;
    float _3932 = _3866;
    float _3934 = _3862;
    float _3936 = _3870;
    float _3938 = _3874;
    float _3940 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3942 = _3930 + _3940;
    float _3944 = fma(_3714, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3822);
    float _3946 = fma(_3714, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3826);
    float _3948 = fma(_3714, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3830);
    float _3950 = fma(_3942, _3942, _3932);
    float _3952 = fma(_3746, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3842);
    float _3954 = fma(_3746, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3844);
    float _3956 = fma(_3746, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3846);
    float _3958 = _3950 + _3934;
    float _3960 = _3710 * _3810;
    float _3962 = fma(_3738, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3792);
    float _3964 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3966 = _3710 * _3944;
    float _3968 = fma(_3738, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3782);
    float _3970 = _3710 * _3946;
    float _3972 = fma(_3738, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3808);
    float _3974 = _3710 * _3948;
    float _3976 = -_3952;
    float _3978 = _3960 * _3976;
    float _3980 = -_3954;
    float _3982 = _3960 * _3980;
    float _3984 = -_3956;
    float _3986 = _3960 * _3984;
    float _3988 = fma(_3964, _3962, _3966);
    float _3990 = sqrt(_3958);
    float _3992 = fma(_3964, _3968, _3970);
    float _3994 = fma(_3964, _3972, _3974);
    float _3996 = fma(_3810, _3944, _3978);
    float _3998 = fma(_3810, _3946, _3982);
    float _4000 = _3954 + _3992;
    float _4002 = fma(_3810, _3948, _3986);
    float _4004 = _3952 + _3988;
    float _4006 = _3956 + _3994;
    out.m_82.x = _3962;
    out.m_82.y = _3968;
    out.m_82.z = _3972;
    out.m_84.x = _3996;
    out.m_84.y = _3998;
    out.m_84.z = _4002;
    bool _4008 = _3990 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4010 = isnan(_3990);
    bool _4012 = _4008 || _4010;
    bool _4014 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4016 = _4012 || _4014;
    out.m_86.x = _4004;
    out.m_86.y = _4000;
    out.m_86.z = _4006;
    float _4018 = _3964;
    if (!_4016)
    {
        _4018 = 1.0;
    }
    float _4020 = _4018;
    bool _4022 = !_4016;
    float _4024 = _4020;
    if (!_4022)
    {
        bool _4026 = _3990 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4028 = isnan(_3990);
        bool _4030 = _4026 || _4028;
        bool _4032 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4034 = _4030 || _4032;
        if (!_4034)
        {
            float _4036 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4038 = _3990 + _4036;
            float _4040 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4042 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4040;
            float _4044 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4046 = _4044 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4048 = 1.0 / _4042;
            float _4050 = _4038 * _4048;
            float _4052 = fma(_4050, _4046, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4024 = _4052;
            _4054 = true;
        }
        else
        {
            bool _4056 = _3990 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4058 = isnan(_3990);
            bool _4060 = _4056 || _4058;
            bool _4062 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4064 = _4060 || _4062;
            if (!_4064)
            {
                float _4066 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4068 = _3990 + _4066;
                float _4070 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4072 = _4070 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4074 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4076 = _4074 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4078 = 1.0 / _4072;
                float _4080 = _4068 * _4078;
                float _4082 = fma(_4080, _4076, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4024 = _4082;
                _4054 = true;
            }
            else
            {
                _4024 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4054 = false;
    float _4084 = _4024;
    float _4086 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4088 = _3930 + _4086;
    float _4090 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4092 = _3936 + _4090;
    float _4094 = _3574 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4096 = fma(_4088, _4084, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4098 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4100 = _3938 + _4098;
    float _4102 = fma(_4092, _4084, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4104 = fma(_3578, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4094);
    float _4106 = -_2556;
    float _4108 = _4106 + _4096;
    float _4110 = fma(_4100, _4084, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4112 = -_2802;
    float _4114 = _4112 + _4102;
    float _4116 = fma(_3582, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4104);
    float _4118 = _4108 * _4108;
    float _4120 = -_2838;
    float _4122 = _4120 + _4110;
    float _4124 = _3574 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4126 = _4116 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4128 = fma(_4114, _4114, _4118);
    float _4130 = fma(_3578, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4124);
    float _4132 = 1.0 / _4126;
    float _4134 = fma(_4122, _4122, _4128);
    float _4136 = fma(_3582, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4130);
    float _4138 = _4136 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4140 = sqrt(_4134);
    float _4142 = _4138 + _4126;
    float _4144 = _4142 * _4132;
    float _4146 = _4144 * 0.5;
    bool _4148 = _4140 > 0.0;
    float _4150 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4152 = fma(_4146, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4150);
    float _4154 = 1.0 / _4152;
    bool _4156 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4158 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4160 = _4156 || _4158;
    bool _4162 = isnan(0.5);
    bool _4164 = _4160 || _4162;
    bool _4166 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4168 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4170 = _4166 || _4168;
    bool _4172 = isnan(0.5);
    bool _4174 = _4170 || _4172;
    float _4176 = _4116;
    float _4178 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4180 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _4182 = _4114;
    if (!_4148)
    {
        _4176 = _4102;
    }
    float _4184 = _4176;
    float _4186 = _4184;
    float _4188 = _4184;
    if (!_4148)
    {
        _4178 = _4096;
    }
    float _4190 = _4178;
    float _4192 = _4190;
    float _4194 = _4190;
    if (!_4148)
    {
        _4180 = _4110;
    }
    float _4196 = _4180;
    bool _4198 = !_4148;
    float _4200 = _4196;
    if (!_4198)
    {
        float _4202 = _215 * _215;
        float _4204 = rsqrt(_4134);
        float _4206 = fma(_213, _213, _4202);
        float _4208 = fma(_217, _217, _4206);
        float _4210 = sqrt(_4208);
        float _4212 = _4114 * _4204;
        float _4214 = _4108 * _4204;
        float _4216 = _4122 * _4204;
        bool _4218 = _4210 > 0.0;
        float _4220 = _4210;
        if (!_4218)
        {
            _4186 = _4102;
        }
        float _4222 = _4186;
        _4188 = _4222;
        if (!_4218)
        {
            _4192 = _4096;
        }
        float _4224 = _4192;
        _4194 = _4224;
        if (!_4218)
        {
            _4220 = _4110;
        }
        float _4226 = _4220;
        bool _4228 = !_4218;
        _4200 = _4226;
        if (!_4228)
        {
            float _4230 = rsqrt(_4208);
            float _4232 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4234 = _215 * _4230;
            float _4236 = _213 * _4230;
            float _4238 = _4214 * _4234;
            float _4240 = _217 * _4230;
            float _4242 = fma(_4212, _4236, _4238);
            float _4244 = _4232 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4246 = fma(_4216, _4240, _4242);
            float _4248 = _4246 * _4244;
            float _4250 = fma(_213, _4248, _4102);
            float _4252 = fma(_215, _4248, _4096);
            float _4254 = fma(_217, _4248, _4110);
            _4188 = _4250;
            _4194 = _4252;
            _4200 = _4254;
        }
    }
    float _4256 = _4188;
    float _4258 = _4194;
    float _4260 = _4200;
    float _4262 = -_3092;
    float _4264 = _4262 + _4256;
    float _4266 = -_3096;
    float _4268 = _4266 + _4258;
    float _4270 = -_3198;
    float _4272 = _4270 + _4260;
    float _4274 = _4268;
    float _4276 = _4264;
    float _4278 = _4272;
    if (_4174)
    {
        _221 = 1.0;
    }
    float _4280 = _221;
    float _4282 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4284 = _4154 * _4282;
    float _4286 = _4280;
    if (!_4164)
    {
        float _4288 = _3588 * _3588;
        float _4290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4292 = -_2838;
        float _4294 = _4292 + _4260;
        float _4296 = -_2556;
        float _4298 = _4296 + _4258;
        float _4300 = fma(_3592, _3592, _4288);
        float _4302 = -_2802;
        float _4304 = _4302 + _4256;
        float _4306 = fma(_3596, _3596, _4300);
        float _4308 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4310 = sqrt(_4306);
        float _4312 = 1.0 / _3682;
        float _4314 = _4308 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4316 = precise::min(_4310, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4318 = _4316 * _4290;
        float _4320 = _4318 * _4312;
        float _4322 = _4314 * _4320;
        float _4324 = _4294 * _4320;
        float _4326 = fma(_4298, _4322, _3574);
        float _4328 = fma(_4304, _4322, _3578);
        float _4330 = fma(_4314, _4324, _3582);
        _4274 = _4326;
        _4276 = _4328;
        _4278 = _4330;
        _3650 = _4310;
    }
    float _4332 = _4274;
    float _4334 = _4276;
    float _4336 = _4278;
    float _4338 = _3650;
    float _4340 = _4338;
    if (!_4174)
    {
        float _4342 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4344 = _4342 * 0.15915493667125701904296875;
        float _4346 = _4344 * 6.283185482025146484375;
        float _4348 = cos(_4346);
        float _4350 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4352 = _4350 * 0.15915493667125701904296875;
        float _4354 = _4344 * 6.283185482025146484375;
        float _4356 = sin(_4354);
        float _4358 = 1.0 / _4348;
        float _4360 = _4352 * 6.283185482025146484375;
        float _4362 = cos(_4360);
        float _4364 = _4356 * _4358;
        float _4366 = _4352 * 6.283185482025146484375;
        float _4368 = sin(_4366);
        float _4370 = _4362 * _4364;
        float _4372 = 1.0 / _4370;
        float _4374 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4376 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4374;
        float _4378 = 1.0 / _4376;
        float _4380 = _4368 * _4372;
        float _4382 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4384 = fma(_4284, _4380, _4382);
        float _4386 = _4384 * _4378;
        float _4388 = precise::clamp(_4386, 0.0, 1.0);
        _4340 = _4344;
        _4286 = _4388;
    }
    float _4390 = _4340;
    float _4392 = _4286;
    float _4394 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4396 = _4332 + _4394;
    float _4398 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4400 = _4334 + _4398;
    float _4402 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4404 = _4336 + _4402;
    float _4406 = _4396 * _4396;
    float _4408 = fma(_4400, _4400, _4406);
    float _4410 = fma(_3578, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4412 = fma(_4404, _4404, _4408);
    float _4414 = rsqrt(_4412);
    float _4416 = sqrt(_4412);
    float _4418 = _4414 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4420 = _4400 * _4418;
    float _4422 = _4404 * _4418;
    float _4424 = _4420 * _4420;
    float _4426 = _4422 * _4422;
    float _4428 = _4424 + _4426;
    float _4430 = sqrt(_4428);
    bool _4432 = _4430 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4434 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4436 = _4430 + _4434;
    float _4438 = _4414;
    float _4440 = _4428;
    float _4442 = _4436;
    float _4444 = _4390;
    float _4446 = _4396;
    if (_4432)
    {
        float _4448 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4438 = _4448;
    }
    float _4450 = _4438;
    if (!_4432)
    {
        _3652 = _4420;
    }
    float _4452 = _3652;
    float _4454 = _4452;
    if (_4432)
    {
        float _4456 = rsqrt(_4428);
        _4440 = _4456;
    }
    float _4458 = _4440;
    if (_4432)
    {
        float _4460 = _4436 * _4450;
        _4442 = _4460;
    }
    float _4462 = _4442;
    if (_4432)
    {
        float _4464 = _4462 * 0.15915493667125701904296875;
        _4444 = _4464;
    }
    float _4466 = _4444;
    float _4468 = _4404;
    float _4470 = _4466;
    if (_4432)
    {
        float _4472 = _4466 * 6.283185482025146484375;
        float _4474 = sin(_4472);
        _4468 = _4474;
    }
    float _4476 = _4468;
    float _4478 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4480 = precise::max(0.0, _4478);
    float _4482 = _4450;
    float _4484 = _4480;
    if (_4432)
    {
        float _4486 = _4466 * 6.283185482025146484375;
        float _4488 = cos(_4486);
        _4482 = _4488;
    }
    float _4490 = _4482;
    float _4492 = -_4418;
    float _4494 = -_4480;
    float _4496 = fma(_4396, _4492, _4494);
    if (_4432)
    {
        float _4498 = _4496 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4446 = _4498;
    }
    float _4500 = _4446;
    float _4502 = _4476;
    float _4504 = _4500;
    if (_4432)
    {
        float _4506 = fma(_4476, _4500, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4502 = _4506;
    }
    float _4508 = _4502;
    float _4510 = _4508;
    if (!_4432)
    {
        _4504 = _4496;
    }
    float _4512 = _4504;
    float _4514 = _4512;
    float _4516 = _4490;
    if (_4432)
    {
        float _4518 = _4490 + (-1.0);
        _4484 = _4518;
    }
    float _4520 = _4484;
    float _4522 = _4520;
    if (_4432)
    {
        float _4524 = _4458 * _4508;
        _4182 = _4524;
    }
    float _4526 = _4182;
    if (!_4432)
    {
        _4510 = _4424;
    }
    float _4528 = _4510;
    float _4530 = _4332 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4532 = _4528;
    if (_4432)
    {
        float _4534 = _4520 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4470 = _4534;
    }
    float _4536 = _4470;
    if (_4432)
    {
        float _4538 = _4420 * _4526;
        _4454 = _4538;
    }
    float _4540 = _4454;
    if (!_4432)
    {
        _4522 = _4422;
    }
    float _4542 = _4522;
    float _4544 = _4542;
    if (_4432)
    {
        float _4546 = _4422 * _4526;
        _4544 = _4546;
    }
    float _4548 = _4544;
    if (_4432)
    {
        float _4550 = fma(_4496, _4490, _4536);
        _4514 = _4550;
    }
    float _4552 = _4514;
    if (_4432)
    {
        float _4554 = _4540 * _4540;
        _4532 = _4554;
    }
    float _4556 = _4532;
    if (!_4432)
    {
        _4516 = _4426;
    }
    float _4558 = _4516;
    float _4560 = _4558;
    if (_4432)
    {
        float _4562 = _4548 * _4548;
        _4560 = _4562;
    }
    float _4564 = _4560;
    float _4566 = fma(_4552, _4552, _4556);
    float _4568 = _4332 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4570 = floor(_4410);
    float _4572 = _4566 + _4564;
    float _4574 = fma(_4334, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4568);
    float _4576 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4578 = fma(_4416, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4576);
    float _4580 = precise::clamp(_4578, 0.0, 1.0);
    float _4582 = fma(_3582, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4584 = fma(_4336, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4574);
    float _4586 = -_4580;
    float _4588 = _4586 + 1.0;
    float _4590 = rsqrt(_4572);
    float _4592 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4594 = _4584 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4596 = _4332 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4598 = _4594 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4600 = fma(_4334, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4596);
    float _4602 = abs(_4588);
    float _4604 = log2(_4602);
    float _4606 = -_4570;
    float _4608 = _4410 + _4606;
    float _4610 = -_4598;
    float _4612 = fma(_4610, _4592, 1.0);
    float _4614 = _4332 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4616 = fma(_4336, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4600);
    float _4618 = fma(_4334, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4530);
    float _4620 = _4590 * _4540;
    float _4622 = _4590 * _4552;
    float _4624 = _4590 * _4548;
    float _4626 = fma(_4334, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4614);
    float _4628 = _4620 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4630 = _4616 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4632 = floor(_4582);
    float _4634 = fma(_4336, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4626);
    float _4636 = -_4628;
    float _4638 = fma(_4622, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4636);
    float _4640 = _4630 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4642 = fma(_4336, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4618);
    float _4644 = _4634 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4646 = -_4624;
    float _4648 = fma(_4646, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4638);
    float _4650 = _4604 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4652 = log2(_4612);
    float _4654 = fma(_4644, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4640);
    float _4656 = fma(_4648, -0.5, 0.5);
    float _4658 = fma(_4648, 0.5, 0.5);
    float _4660 = _4630 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4662 = fma(_4594, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4654);
    float _4664 = _4622 + 1.0;
    float _4666 = sqrt(_4656);
    float _4668 = _4642 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4670 = -_4632;
    float _4672 = _4582 + _4670;
    float _4674 = fma(_4658, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4676 = fma(_4644, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4660);
    float _4678 = fma(_4668, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4662);
    float _4680 = _4630 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4682 = fma(_4658, _4674, -0.212114393711090087890625);
    float _4684 = exp2(_4650);
    float _4686 = fma(_4594, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4676);
    float _4688 = fma(_4644, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4680);
    float _4690 = fma(_4658, _4682, 1.570728778839111328125);
    float _4692 = _4652 * 0.693147182464599609375;
    float _4694 = fma(_4594, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4688);
    float _4696 = fma(_4668, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4686);
    float _4698 = 1.0 / _4678;
    float _4700 = _4666 * 0.636619746685028076171875;
    float _4702 = fma(_4668, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4694);
    float _4704 = _4692 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4706 = -_4690;
    float _4708 = fma(_4700, _4706, 1.0);
    float2 _12180 = float2(_4608, _4672);
    float _4710 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12180, float2(0.0), isnan(_12180)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12180, float2(0.0), isnan(_12180)), level(0.0)).x;
    float _4712 = -_4622;
    float _4714 = fma(_4684, _4664, _4712);
    float _4716 = fma(_4714, 0.5, 0.5);
    float _4718 = _4702 * _4698;
    float _4720 = _4696 * _4698;
    float _4722 = fma(_4718, 0.5, 0.5);
    float _4724 = fma(_4720, -0.5, 0.5);
    float3 _12209 = float3(_4722, _4724, _4704);
    float _4726 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12209, float3(0.0), isnan(_12209)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12209, float3(0.0), isnan(_12209)), level(0.0)).x;
    float3 _12220 = float3(_4722, _4724, _4704);
    float4 _4729 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12220, float3(0.0), isnan(_12220)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12220, float3(0.0), isnan(_12220)), level(0.0)).xyzw;
    float _4731 = _4729.x;
    float _4733 = _4729.y;
    float _4735 = _4729.z;
    float _4737 = _4729.w;
    float2 _12236 = float2(_4708, _4716);
    float3 _4741 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12236, float2(0.0), isnan(_12236)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12236, float2(0.0), isnan(_12236)), level(0.0)).xyz;
    float _4743 = _4741.x;
    float _4745 = _4741.y;
    float _4747 = _4741.z;
    float _4749 = abs(_4284);
    float _4751 = log2(_4749);
    float _4753 = _4630 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _4755 = _4416 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4757 = isnan(_4416);
    bool _4759 = _4755 || _4757;
    bool _4761 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4763 = _4759 || _4761;
    float _4765 = fma(_4644, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4753);
    float _4767 = fma(_4594, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4765);
    bool _4769 = _4284 <= 8000.0;
    bool _4771 = isnan(_4284);
    bool _4773 = _4769 || _4771;
    bool _4775 = isnan(8000.0);
    bool _4777 = _4773 || _4775;
    float _4779 = float(_4777);
    float _4781 = _4678 * 0.5;
    float _4783 = fma(_4668, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4767);
    float _4785 = _4751 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4787 = in.m_88.x;
    float _4789 = fma(_4696, -0.5, _4781);
    out.gl_Position.x = _4702;
    out.gl_Position.y = _4696;
    out.gl_Position.z = _4783;
    out.gl_Position.w = _4678;
    float _4791 = exp2(_4785);
    float _4793 = _4696;
    float _4795 = _4783;
    float _4797 = _4702;
    float _4799 = _4678;
    if (!_4763)
    {
        _4793 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4801 = _4793;
    float _4803 = fma(_4791, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4805 = precise::clamp(_4803, 0.0, 1.0);
    float _4807 = _4783 + _4678;
    float _4809 = _4801;
    float _4811 = _4801;
    if (!_4763)
    {
        _4795 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4813 = _4795;
    float _4815 = fma(_4805, -2.0, 3.0);
    float _4817 = _4805 * _4805;
    float _4819 = _4807 * 0.5;
    float _4821 = _4817 * _4815;
    float _4823 = _4604 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4825 = _4702 + _4678;
    float _4827 = _4813;
    float _4829 = _4813;
    if (!_4763)
    {
        _4797 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4831 = _4797;
    float _4833 = -_4821;
    float _4835 = _4833 + 1.0;
    float _4837 = _4825 * 0.5;
    float _4839 = exp2(_4823);
    float _4841 = fma(_4835, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4821);
    float _4843 = _4779 * _4841;
    float _4845 = _4831;
    float _4847 = _4831;
    if (!_4763)
    {
        _4799 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4849 = _4799;
    float _4851 = _4843 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_90.x = _4837;
    out.m_90.y = _4789;
    out.m_90.z = _4819;
    out.m_90.w = _4678;
    float _4853 = -_4839;
    float _4855 = _4853 + 1.0;
    float _4857 = _4855 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4859 = -_4710;
    float _4861 = _4859 + 1.0;
    float _4863 = _4861 * _4851;
    float _4865 = precise::clamp(_4863, 0.0, 1.0);
    float _4867 = -_4865;
    float _4869 = fma(_4867, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4871 = _4869 * _4787;
    float _4873 = _4871 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4875 = _4857 * _4726;
    float _4877 = -_4857;
    float _4879 = _4877 + 1.0;
    out.m_92.x = _4873;
    float _4881 = _4737 * _4875;
    float _4883 = _4747 * _4875;
    float _4885 = _4737 * _4879;
    float _4887 = fma(_4743, _4881, _4731);
    float _4889 = fma(_4745, _4881, _4733);
    float _4891 = fma(_4737, _4883, _4735);
    float _4893 = _4392 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4895 = _4881;
    float _4897 = _4735;
    float _4899 = _4849;
    float _4901 = _4849;
    if (!_4763)
    {
        _4895 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4903 = _4895;
    float _4905 = _4903;
    float _4907 = _4903;
    if (!_4763)
    {
        _4897 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4909 = _4897;
    out.m_94.x = _4887;
    out.m_94.y = _4889;
    out.m_94.z = _4891;
    out.m_94.w = _4885;
    bool _4911 = !_4763;
    float _4913 = _4909;
    float _4915 = _4909;
    if (!_4911)
    {
        bool _4917 = _4416 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4919 = isnan(_4416);
        bool _4921 = _4917 || _4919;
        bool _4923 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4925 = _4921 || _4923;
        if (!_4925)
        {
            float _4927 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4929 = _4416 + _4927;
            float _4931 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4933 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4931;
            float _4935 = 1.0 / _4933;
            float _4937 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4939 = _4937 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4941 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4943 = _4941 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4945 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4947 = _4945 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4949 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4951 = _4949 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4953 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4955 = _4953 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4957 = _4929 * _4935;
            float _4959 = precise::clamp(_4957, 0.0, 1.0);
            float _4961 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4963 = _4961 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4965 = fma(_4959, _4943, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4967 = fma(_4959, _4963, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4969 = fma(_4959, _4939, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4971 = fma(_4959, _4947, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4973 = fma(_4959, _4951, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4975 = fma(_4959, _4955, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4811 = _4969;
            _4915 = _4973;
            _4829 = _4967;
            _4907 = _4971;
            _4847 = _4965;
            _4901 = _4975;
            _4977 = true;
        }
        else
        {
            bool _4979 = _4416 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4981 = isnan(_4416);
            bool _4983 = _4979 || _4981;
            bool _4985 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4987 = _4983 || _4985;
            if (!_4987)
            {
                _4905 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4989 = _4905;
            _4907 = _4989;
            if (!_4987)
            {
                _4913 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4991 = _4913;
            _4915 = _4991;
            if (!_4987)
            {
                _4899 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4993 = _4899;
            _4901 = _4993;
            if (!_4987)
            {
                _4827 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4995 = _4827;
            _4829 = _4995;
            if (!_4987)
            {
                _4809 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4997 = _4809;
            _4811 = _4997;
            if (!_4987)
            {
                _4845 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4999 = _4845;
            bool _5001 = !_4987;
            _4847 = _4999;
            if (!_5001)
            {
                bool _5003 = _4416 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5005 = isnan(_4416);
                bool _5007 = _5003 || _5005;
                bool _5009 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5011 = _5007 || _5009;
                if (!_5011)
                {
                    float _5013 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5015 = _4416 + _5013;
                    float _5017 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5019 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5017;
                    float _5021 = 1.0 / _5019;
                    float _5023 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5025 = _5023 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5027 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5029 = _5027 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5031 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5033 = _5031 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5035 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5037 = _5035 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5039 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5041 = _5039 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5043 = _5015 * _5021;
                    float _5045 = precise::clamp(_5043, 0.0, 1.0);
                    float _5047 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5049 = _5047 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5051 = fma(_5045, _5029, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5053 = fma(_5045, _5049, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5055 = fma(_5045, _5025, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5057 = fma(_5045, _5033, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5059 = fma(_5045, _5037, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5061 = fma(_5045, _5041, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4811 = _5055;
                    _4915 = _5059;
                    _4829 = _5053;
                    _4907 = _5057;
                    _4847 = _5051;
                    _4901 = _5061;
                    _4977 = true;
                }
                else
                {
                    _4811 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4915 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4829 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4907 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4847 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4901 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4977 = false;
    float _5063 = _4811;
    float _5065 = _4915;
    float _5067 = _4829;
    float _5069 = _4907;
    float _5071 = _4847;
    float _5073 = _4901;
    float _5075 = _4893 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5077 = fma(_4000, -0.5, 0.5);
    float _5079 = precise::clamp(_5077, 0.0, 1.0);
    float _5081 = -_5063;
    float _5083 = _5065 + _5081;
    float _5085 = -_5067;
    float _5087 = _5069 + _5085;
    out.m_55.x = _5075;
    float _5089 = fma(_5079, _5083, _5063);
    float _5091 = -_5071;
    float _5093 = _5073 + _5091;
    float _5095 = fma(_5079, _5087, _5067);
    float _5097 = _5089 * 0.586610972881317138671875;
    bool _5099 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5101 = fma(_5079, _5093, _5071);
    out.m_96.x = 0.0;
    float _5103 = fma(_5095, 0.298911988735198974609375, _5097);
    bool _5105 = _4392 > 0.0;
    bool _5107 = isnan(_4392);
    bool _5109 = _5105 || _5107;
    bool _5111 = isnan(0.0);
    bool _5113 = _5109 || _5111;
    float _5115 = fma(_5101, 0.114477999508380889892578125, _5103);
    float _5117 = -_5115;
    float _5119 = _5095 + _5117;
    float _5121 = -_5115;
    float _5123 = _5089 + _5121;
    float _5125 = -_5115;
    float _5127 = _5101 + _5125;
    float _5129 = fma(_5119, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5115);
    float _5131 = fma(_5123, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5115);
    float _5133 = fma(_5127, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5115);
    bool _5135 = !_5099;
    if (!_5135)
    {
        float _5137 = -_4332;
        float _5139 = _5137 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5141 = -_4334;
        float _5143 = _5141 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5145 = -_4336;
        float _5147 = _5145 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5149 = _5139 * _5139;
        float _5151 = fma(_5143, _5143, _5149);
        float _5153 = fma(_5147, _5147, _5151);
        float _5155 = sqrt(_5153);
        float _5157 = rsqrt(_5153);
        float _5159 = -_5155;
        float _5161 = _5159 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5163 = _5161 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5165 = precise::clamp(_5163, 0.0, 1.0);
        float _5167 = _5143 * _5157;
        float _5169 = _5139 * _5157;
        float _5171 = abs(_5165);
        float _5173 = log2(_5171);
        float _5175 = _5147 * _5157;
        float _5177 = _5167 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5179 = _4000 * _5169;
        float _5181 = -_5169;
        float _5183 = -_5177;
        float _5185 = fma(_5181, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5183);
        float _5187 = fma(_4004, _5167, _5179);
        float _5189 = -_5175;
        float _5191 = fma(_5189, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5185);
        float _5193 = fma(_4006, _5175, _5187);
        float _5195 = precise::clamp(_5193, 0.0, 1.0);
        float _5197 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5199 = _5191 + _5197;
        float _5201 = _5173 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5203 = _5199 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5205 = precise::clamp(_5203, 0.0, 1.0);
        float _5207 = exp2(_5201);
        float _5209 = _5207 * _5205;
        float _5211 = _5195 * _5209;
        float _5213 = _5211 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5215 = _5211 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5217 = _5211 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _5213;
        out.m_96.y = _5215;
        out.m_96.z = _5217;
    }
    out.m_98.x = _5129;
    out.m_98.y = _5131;
    out.m_98.z = _5133;
    if (_5113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_55.x = 0.0;
    float _5219 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5219;
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
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4977 = false;
    bool _4054 = false;
    bool _575 = false;
    bool _431 = false;
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
    float _131 = _114;
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
    if (!_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5286 = as_type<float>(_141);
        out.gl_Position.z = _5286;
    }
    if (!_127)
    {
        return out;
    }
    bool _143 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_114);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = float(_119);
    bool _155 = _123 >= _153;
    bool _157 = !_151;
    bool _159 = _155 || _157;
    float _161 = 1.0 / _153;
    if (_159)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _131;
    if (_159)
    {
        out.m_55.x = 0.0;
    }
    float _165 = _123 * _161;
    int _167 = 0;
    float _169 = _165;
    if (_159)
    {
        float _171 = _163 * 5.0;
        _167 = as_type<int>(_171);
    }
    int _173 = _167;
    out.m_53.x = _165;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5349 = as_type<float>(_173);
        out.gl_Position.z = _5349;
    }
    if (_159)
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
    bool _199 = !_185;
    float _201 = _199 ? (-0.5) : 0.5;
    float _203 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].x, _193);
    float _205 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].x, _195);
    float _207 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].x, _197);
    bool _209 = !_189;
    float _211 = _209 ? (-0.5) : 0.5;
    float _213 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[4].z, _203);
    float _215 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[5].z, _205);
    float _217 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[6].z, _207);
    bool _219 = !_191;
    float _221 = _217;
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
        _239 = _165;
    }
    _241 = false;
    float _243 = _239;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _247 = _243 + _245;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _251 = _243 + _249;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _255 = _243 + _253;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _257;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _263 = _261 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _265;
    bool _269 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _271 = isnan(_243);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = 1.0 / _259;
    bool _283 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _285 = 1.0 / _267;
    float _287 = 1.0 / _263;
    float _289 = _247 * _281;
    bool _291 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _293 = isnan(_243);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = -_279;
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
    float _331 = _321 * _325;
    float _333 = -_321;
    float _335 = _333 + 1.0;
    float _337 = _255 * _287;
    bool _339 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _341 = isnan(_243);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _351;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _361 = _359 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _363 = fma(_353, _289, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _365 = _349 * _335;
    float _367 = fma(_357, _289, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _369 = -_349;
    float _371 = _369 + 1.0;
    float _373 = _363 * _365;
    float _375 = _367 * _365;
    float _377 = fma(_329, _337, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _379 = fma(_361, _337, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _381 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].x, _373);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _383;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _387;
    float _391 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].y, _375);
    float _393 = fma(_377, _331, _381);
    float _395 = fma(_385, _309, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _397 = fma(_389, _309, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _399 = fma(_379, _331, _391);
    float _401 = fma(_395, _307, _393);
    float _403 = fma(_397, _307, _399);
    float _405 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[146].x, _401);
    float _407 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[146].y, _403);
    bool _409 = !_283;
    int _411 = as_type<int>(_405);
    float _429;
    if (!_409)
    {
        float _413 = in.m_62.x;
        float _415 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _417 = _413 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _419 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _421 = _419 * _415;
        float _423 = floor(_421);
        float _425 = -_423;
        float _427 = _421 + _425;
        _429 = _427;
        _431 = true;
    }
    else
    {
        _429 = _165;
    }
    _431 = false;
    float _433 = _429;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _437 = _433 + _435;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _441 = _439 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _443 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _445 = isnan(_433);
    bool _447 = _443 || _445;
    bool _449 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _451 = _447 || _449;
    float _453 = float(_451);
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _459 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _461 = isnan(_433);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _471;
    bool _475 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _477 = isnan(_433);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    float _487 = 1.0 / _441;
    float _489 = -_453;
    float _491 = _489 + 1.0;
    bool _493 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _495 = 1.0 / _457;
    float _497 = _473 * _487;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _501 = _499 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _503 = -_485;
    float _505 = _503 + 1.0;
    float _507 = fma(_497, _437, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _509 = _469 * _491;
    float _511 = -_469;
    float _513 = _511 + 1.0;
    float _515 = _453 * _505;
    float _517 = _501 * _495;
    float _519 = _507 * _509;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _523 = _433 + _521;
    float _525 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[115].x, _519);
    float _527 = fma(_517, _523, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _531 = fma(_527, _515, _525);
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _535 = _529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _537 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[117].x, _531);
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _541 = _533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _543 = in.m_64.x;
    float _545 = in.m_64.y;
    float _547 = _537 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _549 = _539 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_66.x = _535;
    out.m_66.y = _541;
    out.m_66.z = _549;
    out.m_66.w = _547;
    float _551 = _407 * _545;
    float _553 = _405 * _543;
    bool _555 = !_493;
    float _573;
    if (!_555)
    {
        float _557 = in.m_62.x;
        float _559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _561 = _557 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _563 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[11].w, _123);
        float _565 = _563 * _559;
        float _567 = floor(_565);
        float _569 = -_567;
        float _571 = _565 + _569;
        _573 = _571;
        _575 = true;
    }
    else
    {
        _573 = _165;
    }
    _575 = false;
    float _577 = _573;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _581 = _577 + _579;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _587 = _577 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _589 = isnan(_577);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _603 = _577 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _605 = isnan(_577);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _615;
    bool _619 = _577 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _621 = isnan(_577);
    bool _623 = _619 || _621;
    bool _625 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _627 = _623 || _625;
    float _629 = float(_627);
    float _631 = 1.0 / _585;
    float _633 = -_597;
    float _635 = _633 + 1.0;
    bool _637 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _639 = -_629;
    float _641 = _639 + 1.0;
    float _643 = 1.0 / _601;
    float _645 = _597 * _641;
    float _647 = _617 * _631;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _653 = fma(_647, _581, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _655 = _613 * _635;
    float _657 = -_613;
    float _659 = _657 + 1.0;
    float _661 = _651 * _643;
    float _663 = _653 * _655;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _667 = _577 + _665;
    float _669 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[131].x, _663);
    float _671 = fma(_661, _667, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _675 = fma(_671, _645, _669);
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _679 = _673 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _683 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[133].x, _675);
    float _685 = _677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _687 = _681 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _689 = _683 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_68.x = _679;
    out.m_68.y = _685;
    out.m_68.z = _687;
    out.m_68.w = _689;
    bool _691 = !_637;
    int _693 = as_type<int>(_687);
    if (!_691)
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
    float _727 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _729 = int(_727);
    float _731 = 0.0;
    if (_719)
    {
        _731 = 1.0;
    }
    float _733 = _731;
    float _735 = 0.0;
    float _737 = _733;
    if (_719)
    {
        _735 = 1.0;
    }
    float _739 = _735;
    float _741 = _739;
    if (_719)
    {
        _411 = 0;
    }
    int _743 = _411;
    float _745 = float(_723);
    float _747 = 1.0 / _725;
    int _749 = _743;
    if (_719)
    {
        _693 = 0;
    }
    int _751 = _693;
    float _753 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _755 = int(_753);
    float _757 = float(uint(_729));
    float _759 = 1.0 / _745;
    float _761 = _747 * _123;
    float _763 = 1.0 / _757;
    float _765 = float(uint(_755));
    int _767 = ~_755;
    int _769 = _767 + 1;
    float _771 = trunc(_761);
    int _773 = int(_771);
    float _775 = _759 * _123;
    float _777 = _759;
    float _779 = _725;
    int _781 = _751;
    if (_719)
    {
        float _783 = in.m_62.x;
        float _785 = in.m_62.y;
        _777 = _783;
        _779 = _785;
    }
    float _787 = _777;
    float _789 = _779;
    float _791 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _793 = int(_791);
    int _795 = as_type<int>(_763) + (-2);
    float _797 = 1.0 / _765;
    float _799 = float(uint(_773));
    float _801 = as_type<float>(_795) * _799;
    float _803 = trunc(_775);
    int _805 = int(_803);
    float _807 = float(uint(_793));
    float _809 = 0.0;
    float _811 = _787;
    float _813 = _789;
    float _815 = as_type<float>(_795);
    if (_719)
    {
        _809 = _787;
    }
    float _817 = _809;
    float _819 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _821 = int(_819);
    int _823 = as_type<int>(_797) + (-2);
    float _825 = _797;
    float _827 = _817;
    if (_719)
    {
        _825 = _789;
    }
    float _829 = _825;
    float _831 = 1.0 / _807;
    float _833 = float(uint(_805));
    float _835 = as_type<float>(_823) * _833;
    float _837 = trunc(_801);
    float _839 = precise::max(_837, 0.0);
    uint _842 = uint(_839);
    float _844 = float(_821);
    float _846 = 1.0 / _844;
    float _848 = trunc(_835);
    float _850 = precise::max(_848, 0.0);
    uint _852 = uint(_850);
    float _854 = _844;
    float _856 = _835;
    float _858 = _829;
    if (_719)
    {
        _854 = _817;
    }
    float _860 = _854;
    float _862 = _860;
    if (_719)
    {
        _856 = _817;
    }
    float _864 = _856;
    float _866 = _864;
    if (!_719)
    {
        float _868 = in.m_62.x;
        float _870 = in.m_62.y;
        float _872 = in.m_62.z;
        float _874 = _868 * 3.1415927410125732421875;
        float _876 = _874 * 0.15915493667125701904296875;
        float _878 = _870 * 3.1415927410125732421875;
        float _880 = _878 * 0.15915493667125701904296875;
        float _882 = _876 * 6.283185482025146484375;
        float _884 = sin(_882);
        float _886 = _880 * 6.283185482025146484375;
        float _888 = sin(_886);
        _737 = 7.345489978790283203125;
        _811 = _868;
        _741 = 5.839270114898681640625;
        _862 = _872;
        _827 = _870;
        _813 = _870;
        _858 = _888;
        _749 = 1;
        _781 = 2;
        _866 = _884;
    }
    float _890 = _737;
    float _892 = _811;
    float _894 = _741;
    float _896 = _862;
    float _898 = _827;
    float _900 = _813;
    float _902 = _858;
    int _904 = _749;
    int _906 = _781;
    float _908 = _866;
    int _910 = _769 * int(_852);
    int _912 = _910 + _805;
    float _914 = _890 * _892;
    float _916 = _894 * _896;
    float _918 = in.m_62.z;
    float _920 = in.m_62.w;
    float _922 = _890 * _898;
    float _924 = float(uint(_912));
    float _926 = floor(_914);
    float _928 = _846 * _123;
    float _930 = _892 * 2.0;
    float _932 = as_type<float>(_823) * _924;
    int _934 = ~_729;
    int _936 = _934 + 1;
    float _938 = float(_805);
    float _940 = trunc(_932);
    float _942 = precise::max(_940, 0.0);
    uint _944 = uint(_942);
    float _946 = float(_755);
    int _948 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _950 = _948 != 0;
    int _952 = _936 * int(_842);
    int _954 = _952 + _773;
    bool _956 = _900 > 0.5;
    float _958 = floor(_916);
    float _960 = -_926;
    float _962 = _914 + _960;
    int _964 = ~_729;
    int _966 = _964 + 1;
    float _968 = float(uint(_954));
    bool _970 = _920 > 0.5;
    float _972 = trunc(_928);
    int _974 = int(_972);
    float _976 = as_type<float>(_795) * _968;
    int _978 = int(_852) + int(_944);
    int _980 = as_type<int>(_831) + (-2);
    bool _982 = _918 > 0.5;
    float _984 = trunc(_976);
    float _986 = precise::max(_984, 0.0);
    uint _988 = uint(_986);
    float _990 = -_958;
    float _992 = _916 + _990;
    int _994 = ~_755;
    int _996 = _994 + 1;
    bool _998 = _938 >= _946;
    bool _1000 = isnan(_938);
    bool _1002 = _998 || _1000;
    bool _1004 = isnan(_946);
    bool _1006 = _1002 || _1004;
    float _1008 = float(_1006);
    int _1010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1012 = _1010 != 0;
    int _1014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1016 = _1014 != 0;
    int _1018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1020 = _1018 != 0;
    int _1022 = _996 * _978;
    int _1024 = _1022 + _805;
    float _1026 = float(uint(_974));
    float _1028 = floor(_922);
    float _1030 = -_201;
    int _1032 = _956 ? as_type<int>(_1030) : as_type<int>(_201);
    float _1034 = as_type<float>(_980) * _1026;
    float _1036 = -_211;
    int _1038 = _982 ? as_type<int>(_1036) : as_type<int>(_211);
    int _1040 = int(_842) + int(_988);
    float _1042 = trunc(_1034);
    float _1044 = precise::max(_1042, 0.0);
    uint _1046 = uint(_1044);
    float _1048 = _962 * _946;
    int _1050 = int(_970);
    int _1052 = _982 ? 2 : 0;
    int _1054 = _1050 | _1052;
    int _1056 = _950 ? 4 : 0;
    int _1058 = _1054 | _1056;
    int _1060 = _1012 ? 8 : 0;
    int _1062 = _1058 | _1060;
    int _1064 = _1016 ? 16 : 0;
    int _1066 = _1062 | _1064;
    int _1068 = _1020 ? 32 : 0;
    int _1070 = _1066 | _1068;
    int _1072 = _956 ? 64 : 0;
    int _1074 = _1070 | _1072;
    int _1076 = _1074 & 64;
    bool _1078 = !_1016;
    float _1080 = _1078 ? _201 : as_type<float>(_1032);
    float _1082 = float(_729);
    float _1084 = trunc(_1008);
    int _1086 = int(_1084);
    float _1088 = float(_773);
    float _1090 = _992 * _1082;
    int _1092 = ~_793;
    int _1094 = _1092 + 1;
    int _1096 = _966 * _1040;
    int _1098 = _1096 + _773;
    bool _1100 = !_950;
    int _1102 = _1100 ? 0 : 1;
    float _1104 = trunc(_1048);
    int _1106 = int(_1104);
    bool _1108 = !_1020;
    float _1110 = _1108 ? _211 : as_type<float>(_1038);
    int _1112 = _1094 * int(_1046);
    int _1114 = _1112 + _974;
    int _1116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1118 = _1116 != 0;
    int _1120 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1122 = _1120 != 0;
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1126 = _1124 != 0;
    bool _1128 = uint(_1024) >= uint(_755);
    bool _1130 = _1088 >= _1082;
    bool _1132 = isnan(_1088);
    bool _1134 = _1130 || _1132;
    bool _1136 = isnan(_1082);
    bool _1138 = _1134 || _1136;
    float _1140 = float(_1138);
    float _1142 = trunc(_1090);
    int _1144 = int(_1142);
    bool _1146 = !_1122;
    int _1148 = _1146 ? 0 : 1;
    bool _1150 = !_1118;
    int _1152 = _1150 ? 0 : 1;
    int _1154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1156 = _1154 != 0;
    bool _1158 = uint(_1098) >= uint(_729);
    float _1160 = trunc(_1140);
    int _1162 = int(_1160);
    bool _1164 = !_1128;
    int _1166 = _1164 ? 0 : (-1);
    bool _1168 = !_1126;
    int _1170 = _1168 ? 0 : 1;
    bool _1172 = !_1156;
    int _1174 = _1172 ? 0 : 1;
    bool _1176 = !_1158;
    int _1178 = _1176 ? 0 : (-1);
    float _1180 = floor(_930);
    float _1182 = -_1028;
    float _1184 = _922 + _1182;
    float _1186 = float(uint(_1114));
    int _1188 = abs(_1102);
    int _1190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1192 = _1190 != 0;
    int _1194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1196 = _1194 != 0;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1200 = _1198 != 0;
    float _1202 = as_type<float>(_980) * _1186;
    int _1204 = ~_978;
    int _1206 = _1204 + _1166;
    int _1208 = _1206 + 1;
    int _1210 = _1106 * _1188;
    int _1212 = _1210 + _805;
    int _1214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1216 = _1214 != 0;
    int _1218 = ~_1040;
    int _1220 = _1218 + _1178;
    int _1222 = _1220 + 1;
    int _1224 = _755 * _1208;
    int _1226 = _1224 + _805;
    bool _1228 = !_1196;
    int _1230 = _1228 ? 0 : 1;
    float _1232 = trunc(_1202);
    float _1234 = precise::max(_1232, 0.0);
    uint _1236 = uint(_1234);
    bool _1238 = !_1216;
    int _1240 = _1238 ? 0 : 1;
    int _1242 = _729 * _1222;
    int _1244 = _1242 + _773;
    bool _1246 = _1076 != 0;
    float _1248 = _161 * _123;
    bool _1250 = _755 == 0;
    bool _1252 = !_1192;
    int _1254 = _1252 ? 0 : 1;
    float _1256 = _946 * _1248;
    bool _1258 = _729 == 0;
    float _1260 = _1082 * _1248;
    int _1262 = ~_1086;
    int _1264 = _1262 + 1;
    int _1266 = _1264 + 1;
    bool _1268 = !_1250;
    int _1270 = _1268 ? _1226 : (-1);
    float _1272 = trunc(_1256);
    int _1274 = int(_1272);
    int _1276 = ~_1162;
    int _1278 = _1276 + 1;
    int _1280 = _1278 + 1;
    bool _1282 = !_1258;
    int _1284 = _1282 ? _1244 : (-1);
    int _1286 = _1270 * _1266;
    int _1288 = _755 + (-1);
    int _1290 = abs(_1148);
    int _1292 = _1284 * _1280;
    int _1294 = _729 + (-1);
    int _1296 = _1086 * _1288;
    int _1298 = _1296 + _1286;
    int _1300 = abs(_1230);
    float _1302 = trunc(_1260);
    int _1304 = int(_1302);
    int _1306 = abs(_1240);
    int _1308 = _1162 * _1294;
    int _1310 = _1308 + _1292;
    int _1312 = _1298 * _1290;
    int _1314 = abs(_1152);
    int _1316 = _1144 * _1306;
    int _1318 = _1316 + _773;
    int _1320 = ~_793;
    int _1322 = _1320 + 1;
    int _1324 = _1310 * _1300;
    int _1326 = abs(_1170);
    int _1328 = _1274 * _1314;
    int _1330 = _1328 + _1312;
    int _1332 = abs(_1174);
    int _1334 = _1212 * _1326;
    int _1336 = _1334 + _1330;
    int _1338 = int(_1046) + int(_1236);
    int _1340 = abs(_1254);
    int _1342 = _1322 * _1338;
    int _1344 = _1342 + _974;
    float _1346 = -_211;
    int _1348 = _970 ? as_type<int>(_1346) : as_type<int>(_211);
    int _1350 = _1106 * _1332;
    int _1352 = _1350 + _1336;
    float _1354 = -_201;
    int _1356 = _982 ? as_type<int>(_1354) : as_type<int>(_201);
    int _1358 = _1304 * _1340;
    int _1360 = _1358 + _1324;
    bool _1362 = uint(_1344) >= uint(_793);
    float _1364 = float(uint(_1352));
    float _1366 = float(_793);
    float _1368 = float(_974);
    float _1370 = as_type<float>(_823) * _1364;
    int _1372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1374 = _1372 != 0;
    float _1376 = _1366 * _1248;
    bool _1378 = !_1200;
    int _1380 = _1378 ? 0 : 1;
    float _1382 = trunc(_1370);
    float _1384 = precise::max(_1382, 0.0);
    uint _1386 = uint(_1384);
    bool _1388 = _1368 >= _1366;
    bool _1390 = isnan(_1368);
    bool _1392 = _1388 || _1390;
    bool _1394 = isnan(_1366);
    bool _1396 = _1392 || _1394;
    float _1398 = float(_1396);
    float _1400 = _1184 * _1366;
    int _1402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1404 = _1402 != 0;
    float _1406 = _900 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1408 = !_1374;
    int _1410 = _1408 ? 0 : 1;
    int _1412 = abs(_1380);
    float _1414 = trunc(_1398);
    int _1416 = int(_1414);
    bool _1418 = !_1012;
    float _1420 = _1418 ? _211 : as_type<float>(_1348);
    bool _1422 = !_1404;
    int _1424 = _1422 ? 0 : 1;
    int _1426 = abs(_1410);
    float _1428 = trunc(_1376);
    int _1430 = int(_1428);
    bool _1432 = !_1362;
    int _1434 = _1432 ? 0 : (-1);
    int _1436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1438 = _1436 != 0;
    int _1440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1442 = _1440 != 0;
    int _1444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1446 = _1444 != 0;
    int _1448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1450 = _1448 != 0;
    int _1452 = _1318 * _1412;
    int _1454 = _1452 + _1360;
    int _1456 = ~_1338;
    int _1458 = _1456 + _1434;
    int _1460 = _1458 + 1;
    bool _1462 = !_1442;
    int _1464 = _1462 ? 0 : 1;
    int _1466 = _1144 * _1426;
    int _1468 = _1466 + _1454;
    int _1470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1472 = _1470 != 0;
    int _1474 = _793 * _1460;
    int _1476 = _1474 + _974;
    int _1478 = ~_755;
    int _1480 = _1478 + 1;
    float _1482 = trunc(_1400);
    int _1484 = int(_1482);
    float _1486 = float(uint(_1468));
    bool _1488 = !_1438;
    int _1490 = _1488 ? 0 : 1;
    int _1492 = _1480 * int(_1386);
    int _1494 = _1492 + _1352;
    bool _1496 = _793 == 0;
    float _1498 = as_type<float>(_795) * _1486;
    int _1500 = ~_1416;
    int _1502 = _1500 + 1;
    int _1504 = _1502 + 1;
    float _1506 = float(uint(_1494));
    float _1508 = _1486;
    float _1510 = as_type<float>(_904);
    if (_1472)
    {
        float _1512 = in.m_62.w;
        _1508 = _1512;
    }
    float _1514 = _1508;
    bool _1516 = !_1496;
    int _1518 = _1516 ? _1476 : (-1);
    float _1520 = trunc(_1498);
    float _1522 = precise::max(_1520, 0.0);
    uint _1524 = uint(_1522);
    int _1526 = abs(_1464);
    float _1528 = as_type<float>(_823) * _1506;
    int _1530 = abs(_1424);
    int _1532 = _1518 * _1504;
    int _1534 = _793 + (-1);
    int _1536 = abs(_1490);
    float _1538 = trunc(_1528);
    float _1540 = precise::max(_1538, 0.0);
    uint _1542 = uint(_1540);
    int _1544 = _1416 * _1534;
    int _1546 = _1544 + _1532;
    int _1548 = _1546 * _1526;
    int _1550 = ~_729;
    int _1552 = _1550 + 1;
    int _1554 = _1484 * _1530;
    int _1556 = _1554 + _974;
    bool _1558 = _755 == 0;
    int _1560 = _1430 * _1536;
    int _1562 = _1560 + _1548;
    bool _1564 = !_1446;
    int _1566 = _1564 ? 0 : 1;
    int _1568 = _1552 * int(_1524);
    int _1570 = _1568 + _1468;
    int _1572 = ~_755;
    int _1574 = _1572 + 1;
    float _1576 = as_type<float>(_1530);
    if (_1472)
    {
        float _1578 = _1514 * 3.1415927410125732421875;
        _1576 = _1578;
    }
    float _1580 = _1576;
    int _1582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1584 = _1582 != 0;
    int _1586 = int(_1386) + int(_1542);
    float _1588 = _1580;
    if (_1472)
    {
        float _1590 = _1580 * 0.15915493667125701904296875;
        _1588 = _1590;
    }
    float _1592 = _1588;
    int _1594 = abs(_1566);
    bool _1596 = !_1450;
    int _1598 = _1596 ? 0 : 1;
    int _1600 = _1574 * _1586;
    int _1602 = _1600 + _1352;
    float _1604 = float(uint(_1570));
    float _1606 = _1592;
    if (_1472)
    {
        float _1608 = _1592 * 6.283185482025146484375;
        float _1610 = sin(_1608);
        _1606 = _1610;
    }
    float _1612 = _1606;
    int _1614 = abs(_1598);
    int _1616 = _1556 * _1594;
    int _1618 = _1616 + _1562;
    bool _1620 = uint(_1602) >= uint(_755);
    float _1622 = as_type<float>(_795) * _1604;
    float _1624 = as_type<float>(_1526);
    if (_1584)
    {
        float _1626 = in.m_62.x;
        _1624 = _1626;
    }
    float _1628 = _1624;
    float _1630 = float(uint(_1212));
    bool _1632 = !_1620;
    int _1634 = _1632 ? 0 : (-1);
    float _1636 = trunc(_1622);
    float _1638 = precise::max(_1636, 0.0);
    uint _1640 = uint(_1638);
    int _1642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1644 = _1642 != 0;
    float _1646 = as_type<float>(_823) * _1630;
    int _1648 = ~_1586;
    int _1650 = _1648 + _1634;
    int _1652 = _1650 + 1;
    int _1654 = _1484 * _1614;
    int _1656 = _1654 + _1618;
    bool _1658 = !_1644;
    float _1660 = _1658 ? _201 : as_type<float>(_1356);
    bool _1662 = _1644;
    if (_1472)
    {
        bool _1664 = _1612 > 0.5;
        _1662 = _1664;
    }
    bool _1666 = _1662;
    int _1668 = _755 * _1652;
    int _1670 = _1668 + _1352;
    float _1672 = trunc(_1646);
    float _1674 = precise::max(_1672, 0.0);
    uint _1676 = uint(_1674);
    float _1678 = float(uint(_1656));
    float _1680 = 0.0;
    float _1682 = _1678;
    if (!_1472)
    {
        _1680 = _201;
    }
    float _1684 = _1680;
    bool _1686 = !_1558;
    int _1688 = _1686 ? _1670 : (-1);
    float _1690 = as_type<float>(_980) * _1678;
    int _1692 = ~_755;
    int _1694 = _1692 + 1;
    float _1696 = _1684;
    if (_1472)
    {
        float _1698 = -_201;
        float _1700 = _1666 ? _1698 : _201;
        _1696 = _1700;
    }
    float _1702 = _1696;
    float _1704 = trunc(_1690);
    float _1706 = precise::max(_1704, 0.0);
    uint _1708 = uint(_1706);
    int _1710 = int(_1524) + int(_1640);
    if (_1584)
    {
        float _1712 = _1628 * 3.1415927410125732421875;
        _1682 = _1712;
    }
    float _1714 = _1682;
    int _1716 = _1688 & 3;
    bool _1718 = _1716 != 0;
    int _1720 = _1688 & 3;
    bool _1722 = _1720 != 0;
    float _1724 = _1714;
    if (_1584)
    {
        float _1726 = _1714 * 0.15915493667125701904296875;
        _1724 = _1726;
    }
    float _1728 = _1724;
    int _1730 = _1718 ? 0 : 1;
    bool _1732 = uint(_1720) > 1u;
    int _1734 = _1694 * int(_1676);
    int _1736 = _1734 + _1212;
    float _1738 = float(uint(_1318));
    float _1740 = _1728;
    if (_1584)
    {
        float _1742 = _1728 * 6.283185482025146484375;
        float _1744 = sin(_1742);
        _1740 = _1744;
    }
    float _1746 = _1740;
    int _1748 = ~_729;
    int _1750 = _1748 + 1;
    float _1752 = float(uint(_1736));
    float _1754 = as_type<float>(_795) * _1738;
    int _1756 = ~_793;
    int _1758 = _1756 + 1;
    float _1760 = trunc(_1754);
    float _1762 = precise::max(_1760, 0.0);
    uint _1764 = uint(_1762);
    int _1766 = ~_1730;
    int _1768 = _1766 + 1;
    int _1770 = _1768 + 1;
    float _1772 = as_type<float>(_823) * _1752;
    int _1774 = _1770;
    if (!_1732)
    {
        int _1776 = ~_1730;
        int _1778 = _1776 + 1;
        _1774 = _1778;
    }
    int _1780 = _1774;
    int _1782 = _1750 * _1710;
    int _1784 = _1782 + _1468;
    float _1786 = -_211;
    int _1788 = _1246 ? as_type<int>(_1786) : as_type<int>(_211);
    int _1790 = _1758 * int(_1708);
    int _1792 = _1790 + _1656;
    bool _1794 = uint(_1720) >= 2u;
    float _1796 = trunc(_1772);
    float _1798 = precise::max(_1796, 0.0);
    uint _1800 = uint(_1798);
    bool _1802 = uint(_1784) >= uint(_729);
    float _1804 = float(uint(_1792));
    int _1806 = _1794 ? 0 : 1;
    bool _1808 = _1720 != 3;
    float _1810 = as_type<float>(_980) * _1804;
    int _1812 = ~_729;
    int _1814 = _1812 + 1;
    bool _1816 = !_1802;
    int _1818 = _1816 ? 0 : (-1);
    float _1820 = trunc(_1810);
    float _1822 = precise::max(_1820, 0.0);
    uint _1824 = uint(_1822);
    int _1826 = ~_1806;
    int _1828 = _1826 + 1;
    int _1830 = _1828 + 1;
    int _1832 = _1814 * int(_1764);
    int _1834 = _1832 + _1318;
    int _1836 = ~_1710;
    int _1838 = _1836 + _1818;
    int _1840 = _1838 + 1;
    float _1842 = float(uint(_1834));
    int _1844 = _729 * _1840;
    int _1846 = _1844 + _1468;
    int _1848 = _1830;
    bool _1850 = _1808;
    float _1852 = as_type<float>(_1764);
    if (_1808)
    {
        int _1854 = ~_1806;
        int _1856 = _1854 + 1;
        _1848 = _1856;
    }
    int _1858 = _1848;
    if (_1584)
    {
        bool _1860 = _1746 > 0.5;
        _1850 = _1860;
    }
    bool _1862 = _1850;
    float _1864 = as_type<float>(_795) * _1842;
    bool _1866 = !_1258;
    int _1868 = _1866 ? _1846 : (-1);
    if (!_1584)
    {
        _815 = _211;
    }
    float _1870 = _815;
    int _1872 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1874 = _1872 != 0;
    float _1876 = trunc(_1864);
    float _1878 = precise::max(_1876, 0.0);
    uint _1880 = uint(_1878);
    float _1882 = _1870;
    if (_1584)
    {
        float _1884 = -_211;
        float _1886 = _1862 ? _1884 : _211;
        _1882 = _1886;
    }
    float _1888 = _1882;
    int _1890 = _1868 & 3;
    bool _1892 = _1890 != 0;
    bool _1894 = !_1874;
    float _1896 = _1894 ? _211 : as_type<float>(_1788);
    int _1898 = int(_1676) + int(_1800);
    bool _1900 = uint(_1890) > 1u;
    int _1902 = int(_1708) + int(_1824);
    float _1904 = _892 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1906 = ~_793;
    int _1908 = _1906 + 1;
    int _1910 = _1868 & 3;
    bool _1912 = _1910 != 0;
    int _1914 = ~_755;
    int _1916 = _1914 + 1;
    int _1918 = _1908 * _1902;
    int _1920 = _1918 + _1656;
    int _1922 = _1912 ? 0 : 1;
    int _1924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1926 = _1924 != 0;
    int _1928 = _1916 * _1898;
    int _1930 = _1928 + _1212;
    float _1932 = float(uint(_1556));
    bool _1934 = !_1926;
    int _1936 = _1934 ? 0 : 1;
    bool _1938 = uint(_1920) >= uint(_793);
    float _1940 = as_type<float>(_980) * _1932;
    int _1942 = ~_1922;
    int _1944 = _1942 + 1;
    int _1946 = _1944 + 1;
    int _1948 = _1946;
    if (!_1900)
    {
        int _1950 = ~_1922;
        int _1952 = _1950 + 1;
        _1948 = _1952;
    }
    int _1954 = _1948;
    float _1956 = trunc(_1940);
    float _1958 = precise::max(_1956, 0.0);
    uint _1960 = uint(_1958);
    bool _1962 = uint(_1930) >= uint(_755);
    bool _1964 = !_1938;
    int _1966 = _1964 ? 0 : (-1);
    bool _1968 = _1890 != 3;
    bool _1970 = !_1962;
    int _1972 = _1970 ? 0 : (-1);
    bool _1974 = uint(_1890) >= 2u;
    int _1976 = ~_1902;
    int _1978 = _1976 + _1966;
    int _1980 = _1978 + 1;
    int _1982 = ~_729;
    int _1984 = _1982 + 1;
    int _1986 = int(_1764) + int(_1880);
    int _1988 = _793 * _1980;
    int _1990 = _1988 + _1656;
    int _1992 = ~_793;
    int _1994 = _1992 + 1;
    int _1996 = _1974 ? 0 : 1;
    int _1998 = _1984 * _1986;
    int _2000 = _1998 + _1318;
    int _2002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2004 = _2002 != 0;
    int _2006 = ~_1996;
    int _2008 = _2006 + 1;
    int _2010 = _2008 + 1;
    int _2012 = _2010;
    float _2014 = as_type<float>(_1994);
    int _2016 = _1954;
    if (_1968)
    {
        int _2018 = ~_1996;
        int _2020 = _2018 + 1;
        _2012 = _2020;
    }
    int _2022 = _2012;
    int _2024 = _1994 * int(_1960);
    int _2026 = _2024 + _1556;
    int _2028 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2030 = _2028 != 0;
    bool _2032 = !_2004;
    int _2034 = _2032 ? 0 : 1;
    bool _2036 = uint(_2000) >= uint(_729);
    bool _2038 = !_1496;
    int _2040 = _2038 ? _1990 : (-1);
    bool _2042 = !_2030;
    int _2044 = _2042 ? 0 : 1;
    bool _2046 = !_2036;
    int _2048 = _2046 ? 0 : (-1);
    int _2050 = _2040 & 3;
    bool _2052 = _2050 != 0;
    float _2054 = float(uint(_2026));
    int _2056 = _2040 & 3;
    bool _2058 = _2056 != 0;
    int _2060 = _2052 ? 0 : 1;
    float _2062 = as_type<float>(_980) * _2054;
    bool _2064 = uint(_2056) > 1u;
    int _2066 = ~_2060;
    int _2068 = _2066 + 1;
    int _2070 = _2068 + 1;
    float _2072 = trunc(_2062);
    float _2074 = precise::max(_2072, 0.0);
    uint _2076 = uint(_2074);
    float _2078 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2080 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2082 = -_2078;
    float _2084 = fma(_1904, 2.0, _2082);
    int _2086 = _2070;
    float _2088 = as_type<float>(_1960);
    if (!_2064)
    {
        int _2090 = ~_2060;
        int _2092 = _2090 + 1;
        _2086 = _2092;
    }
    int _2094 = _2086;
    float _2096 = fma(_1406, -2.0, _2080);
    bool _2098 = uint(_2056) >= 2u;
    float _2100 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _2102 = ~_793;
    int _2104 = _2102 + 1;
    float _2106 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _2108 = _2098 ? 0 : 1;
    float _2110 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _2112 = _2056 != 3;
    float _2114 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2106);
    int _2116 = int(_1960) + int(_2076);
    float _2118 = _902 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _2120 = ~_2108;
    int _2122 = _2120 + 1;
    int _2124 = _2122 + 1;
    float _2126 = -_123;
    float _2128 = fma(_2126, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2084);
    int _2130 = _2104 * _2116;
    int _2132 = _2130 + _1556;
    float _2134 = fma(_2118, -2.0, _2110);
    float _2136 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2138 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2114);
    int _2140 = _2124;
    float _2142 = as_type<float>(_2132);
    if (_2112)
    {
        int _2144 = ~_2108;
        int _2146 = _2144 + 1;
        _2140 = _2146;
    }
    int _2148 = _2140;
    float _2150 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2152 = uint(_2132) >= uint(_793);
    float _2154 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2156 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2096);
    bool _2158 = !_2152;
    int _2160 = _2158 ? 0 : (-1);
    float _2162 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2134);
    bool _2164 = _892 > 0.5;
    float _2166 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2168 = -_201;
    int _2170 = _2164 ? as_type<int>(_2168) : as_type<int>(_201);
    bool _2172 = _904 != 1;
    float _2174 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2176 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2178 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2180 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2182 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2184 = _2182 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    if (!_2172)
    {
        _2088 = _900;
    }
    float _2186 = _2088;
    float _2188 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2190 = _2188 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2192 = 0.0;
    float _2194 = _2186;
    if (!_2172)
    {
        _2192 = _900;
    }
    float _2196 = _2192;
    float _2198 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2178);
    float _2200 = _2196;
    if (!_2172)
    {
        _1510 = _918;
    }
    float _2202 = _1510;
    float _2204 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2180);
    float _2206 = _2202;
    if (!_2172)
    {
        _1852 = _918;
    }
    float _2208 = _1852;
    float _2210 = 1.0 / _2184;
    float _2212 = _2208;
    if (_2172)
    {
        _2194 = _892;
    }
    float _2214 = _2194;
    float _2216 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2218 = _2216 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    if (_2172)
    {
        _2200 = _892;
    }
    float _2220 = _2200;
    if (_2172)
    {
        _2206 = _900;
    }
    float _2222 = _2206;
    float _2224 = _2214 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2172)
    {
        _2212 = _900;
    }
    float _2226 = _2212;
    float _2228 = 1.0 / _2190;
    bool _2230 = _906 != 2;
    float _2232 = -_2150;
    float _2234 = fma(_2224, 2.0, _2232);
    float _2236 = _2222 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2238 = fma(_2226, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2174);
    float _2240 = -_123;
    float _2242 = fma(_2240, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2234);
    float _2244 = fma(_2236, -2.0, _2166);
    float _2246 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2248 = _2246 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2250 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2238);
    float _2252 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2244);
    float _2254 = 1.0 / _2218;
    if (_2230)
    {
        _2142 = _892;
    }
    float _2256 = _2142;
    float _2258 = -_2250;
    float _2260 = _2258 + 1.0;
    float _2262 = _2256;
    if (_2230)
    {
        _2014 = _900;
    }
    float _2264 = _2014;
    float _2266 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2268 = _2266 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2270 = _2264;
    if (!_2230)
    {
        _2262 = _918;
    }
    float _2272 = _2262;
    if (!_2230)
    {
        _2270 = _892;
    }
    float _2274 = _2270;
    float _2276 = 1.0 / _2248;
    int _2278 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2280 = _2278 != 0;
    float _2282 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2136);
    float _2284 = _908 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2286 = _2272 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _2288 = !_2280;
    float _2290 = _2288 ? _201 : as_type<float>(_2170);
    float _2292 = _2274 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2294 = -_2100;
    float _2296 = fma(_2284, 2.0, _2294);
    float _2298 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2300 = log2(_2298);
    float _2302 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _2304 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2306 = isnan(0.0);
    bool _2308 = _2304 || _2306;
    bool _2310 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2312 = _2308 || _2310;
    float _2314 = -_2154;
    float _2316 = fma(_2286, 2.0, _2314);
    float _2318 = fma(_2220, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2302);
    float _2320 = fma(_2292, -2.0, _2176);
    float _2322 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2324 = -_123;
    float _2326 = fma(_2324, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2296);
    float _2328 = _900 * 2.0;
    float _2330 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2198);
    float _2332 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2334 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2322);
    float _2336 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2282);
    float _2338 = _2300 * _123;
    float _2340 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2332);
    float _2342 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2334);
    float _2344 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2204);
    float _2346 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2318);
    float _2348 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2340);
    float _2350 = exp2(_2338);
    float _2352 = -_123;
    float _2354 = fma(_2352, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2316);
    float _2356 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2320);
    float _2358 = _900 + _892;
    float _2360 = -_2336;
    float _2362 = _2360 + 1.0;
    int _2364 = ~_1986;
    int _2366 = _2364 + _2048;
    int _2368 = _2366 + 1;
    float _2370 = floor(_2328);
    float _2372 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2374 = _2372 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2376 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2378 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2376;
    float _2380 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2382 = _2380 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _2384 = _729 * _2368;
    int _2386 = _2384 + _1318;
    bool _2388 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2390 = isnan(_711);
    bool _2392 = _2388 || _2390;
    bool _2394 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2396 = _2392 || _2394;
    float _2398 = float(_2396);
    float _2400 = _2378 * _2228;
    float _2402 = _918 * 2.0;
    float _2404 = -_2350;
    float _2406 = _2404 + 1.0;
    float _2408 = 1.0 / _2268;
    float _2410 = in.m_48.x;
    float _2412 = in.m_48.y;
    float _2414 = in.m_48.z;
    float _2416 = _2358 + (-1.0);
    float _2418 = _2312 ? _2406 : 0.0;
    float _2420 = -_2342;
    float _2422 = _2420 + 1.0;
    bool _2424 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2426 = isnan(1.0);
    bool _2428 = _2424 || _2426;
    bool _2430 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2432 = _2428 || _2430;
    float _2434 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2436 = 1.0 + _2434;
    float _2438 = floor(_2402);
    float _2440 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2442 = _2440 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _2444 = _1868 >> 31;
    float _2446 = -_2348;
    float _2448 = _2446 + 1.0;
    int _2450 = ~_1898;
    int _2452 = _2450 + _1972;
    int _2454 = _2452 + 1;
    float _2456 = -_2344;
    float _2458 = _2456 + 1.0;
    int _2460 = _2444 & 3;
    float _2462 = 1.0 / _2436;
    float _2464 = _2382 * _2408;
    int _2466 = _755 * _2454;
    int _2468 = _2466 + _1212;
    int _2470 = _1868 + _2460;
    int _2472 = abs(_2148);
    float _2474 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2476 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2474;
    float _2478 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2480 = _711 + _2478;
    float _2482 = _2412 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2484 = 1.0 / _2442;
    int _2486 = _2470 >> 2;
    float _2488 = fma(_2410, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2482);
    bool _2490 = !_1892;
    int _2492 = _2490 ? 0 : 1;
    if (_2432)
    {
        float _2494 = _2418 * _2462;
        _133 = _2494;
    }
    float _2496 = _133;
    bool _2498 = _1180 >= 0.0;
    bool _2500 = isnan(_1180);
    bool _2502 = _2498 || _2500;
    bool _2504 = isnan(0.0);
    bool _2506 = _2502 || _2504;
    float _2508 = _2412 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2510 = _2412 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _2512 = _2506 ? 0 : 1;
    float _2514 = fma(_2410, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2508);
    bool _2516 = _1180 > 0.0;
    float _2518 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2520 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2518;
    float _2522 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2524 = _2522 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2526 = fma(_2410, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2510);
    float _2528 = fma(_2414, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2514);
    float _2530 = _2520 * _2210;
    float _2532 = _2524 * _2276;
    float _2534 = 1.0 / _2374;
    int _2536 = ~_2512;
    int _2538 = _2536 + 1;
    int _2540 = _2538 + 1;
    float _2542 = fma(_2530, _2480, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2544 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2546 = isnan(_711);
    bool _2548 = _2544 || _2546;
    bool _2550 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2552 = _2548 || _2550;
    float _2554 = float(_2552);
    float _2556 = _2528 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2558 = _2486 << 4;
    int _2560 = _2558 + 656;
    float _2562 = _2476 * _2484;
    int _2564 = _2540;
    if (!_2516)
    {
        int _2566 = ~_2512;
        int _2568 = _2566 + 1;
        _2564 = _2568;
    }
    int _2570 = _2564;
    float _2572 = -_2554;
    float _2574 = _2572 + 1.0;
    bool _2576 = _2370 >= 0.0;
    bool _2578 = isnan(_2370);
    bool _2580 = _2576 || _2578;
    bool _2582 = isnan(0.0);
    bool _2584 = _2580 || _2582;
    bool _2586 = !_1258;
    int _2588 = _2586 ? _2386 : (-1);
    int _2590 = _2584 ? 0 : 1;
    bool _2592 = _2370 > 0.0;
    float _2594 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2596 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2594;
    float _2598 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2600 = _2598 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _2602 = ~_2590;
    int _2604 = _2602 + 1;
    int _2606 = _2604 + 1;
    float _2608 = _2596 * _2254;
    bool _2610 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2612 = isnan(_711);
    bool _2614 = _2610 || _2612;
    bool _2616 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2618 = _2614 || _2616;
    float _2620 = float(_2618);
    float _2622 = _2600 * _2534;
    bool _2624 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2626 = isnan(_711);
    bool _2628 = _2624 || _2626;
    bool _2630 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2632 = _2628 || _2630;
    float _2634 = float(_2632);
    bool _2636 = !_1722;
    int _2638 = _2636 ? 0 : 1;
    float _2640 = -_2620;
    float _2642 = _2640 + 1.0;
    int _2644 = abs(_2492);
    float _2646 = -_2634;
    float _2648 = _2646 + 1.0;
    int _2650 = _2606;
    if (!_2592)
    {
        int _2652 = ~_2590;
        int _2654 = _2652 + 1;
        _2650 = _2654;
    }
    int _2656 = _2650;
    float _2658 = _2398 * _2642;
    int _2660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2662 = _2660 != 0;
    int _2664 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2666 = _2664 != 0;
    int _2668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2670 = _2668 != 0;
    float _2672 = -_2398;
    float _2674 = _2672 + 1.0;
    bool _2676 = _2438 >= 0.0;
    bool _2678 = isnan(_2438);
    bool _2680 = _2676 || _2678;
    bool _2682 = isnan(0.0);
    bool _2684 = _2680 || _2682;
    float _2686 = _2620 * _2648;
    bool _2688 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2690 = isnan(_711);
    bool _2692 = _2688 || _2690;
    bool _2694 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2696 = _2692 || _2694;
    float _2698 = float(_2696);
    int _2700 = _2684 ? 0 : 1;
    bool _2702 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2704 = isnan(_711);
    bool _2706 = _2702 || _2704;
    bool _2708 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2710 = _2706 || _2708;
    float _2712 = float(_2710);
    float _2714 = -_2698;
    float _2716 = _2714 + 1.0;
    bool _2718 = _2438 > 0.0;
    float _2720 = _2698 * _2674;
    float _2722 = fma(_2414, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2488);
    float _2724 = fma(_2414, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2526);
    float _2726 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2728 = _711 + _2726;
    float _2730 = _2712 * _2716;
    float _2732 = -_2712;
    float _2734 = _2732 + 1.0;
    bool _2736 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2738 = isnan(_711);
    bool _2740 = _2736 || _2738;
    bool _2742 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2744 = _2740 || _2742;
    float _2746 = float(_2744);
    float _2748 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2750 = _711 + _2748;
    float _2752 = fma(_2532, _2728, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2754 = _2554 * _2734;
    bool _2756 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2758 = isnan(_711);
    bool _2760 = _2756 || _2758;
    bool _2762 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2764 = _2760 || _2762;
    float _2766 = float(_2764);
    float _2768 = fma(_2400, _2750, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2770 = -_2746;
    float _2772 = _2770 + 1.0;
    float _2774 = _2746 * _2574;
    float _2776 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2778 = _711 + _2776;
    float _2780 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2782 = _711 + _2780;
    float _2784 = _2766 * _2772;
    float _2786 = -_2766;
    float _2788 = _2786 + 1.0;
    float _2790 = fma(_2464, _2778, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2792 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2794 = _711 + _2792;
    float _2796 = _2542 * _2784;
    float _2798 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2800 = _711 + _2798;
    float _2802 = _2722 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2804 = fma(_2622, _2794, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2806 = fma(_2788, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2796);
    float _2808 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2810 = _2556 + _2808;
    uint _2812 = uint(int(uint(_2560) >> uint(2)));
    uint _2814 = uint(int(uint(int(_2812)) >> uint(2)));
    int _2816 = int(_2812) & 3;
    float _2818 = (*spvDescriptorSet0.vp_c9)._m0[int(_2814)][_2816];
    int _2820 = int(_2812) + 1;
    uint _2822 = uint(int(uint(_2820) >> uint(2)));
    int _2824 = _2820 & 3;
    float _2826 = (*spvDescriptorSet0.vp_c9)._m0[int(_2822)][_2824];
    float _2828 = fma(_2562, _2800, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2830 = fma(_2752, _2774, _2806);
    float _2832 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2834 = _2802 + _2832;
    float _2836 = _2810 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2838 = _2724 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _2840 = _1890 != 3;
    float _2842 = fma(_2768, _2754, _2830);
    float _2844 = fma(_2834, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2836);
    float _2846 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2848 = _2838 + _2846;
    int _2850 = ~_2700;
    int _2852 = _2850 + 1;
    int _2854 = _2852 + 1;
    float _2856 = _892 + _918;
    int _2858 = _2854;
    float _2860 = _2658;
    if (!_2718)
    {
        int _2862 = ~_2700;
        int _2864 = _2862 + 1;
        _2858 = _2864;
    }
    int _2866 = _2858;
    float _2868 = _892 + (-0.5);
    float _2870 = fma(_2848, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2844);
    float _2872 = fma(_2608, _2782, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _2874 = _2560 + 8;
    uint _2876 = uint(int(uint(_2874) >> uint(2)));
    uint _2878 = uint(int(uint(int(_2876)) >> uint(2)));
    int _2880 = int(_2876) & 3;
    float _2882 = (*spvDescriptorSet0.vp_c9)._m0[int(_2878)][_2880];
    int _2884 = int(_2876) + 1;
    uint _2886 = uint(int(uint(_2884) >> uint(2)));
    int _2888 = _2884 & 3;
    float _2890 = (*spvDescriptorSet0.vp_c9)._m0[int(_2886)][_2888];
    bool _2892 = !_2840;
    int _2894 = _2892 ? 0 : (-1);
    float _2896 = fma(_2790, _2730, _2842);
    bool _2898 = _2870 >= 0.0;
    float _2900 = _900 + _918;
    float _2902 = _900 + (-0.5);
    float _2904 = fma(_2872, _2720, _2896);
    float _2906 = _1888 + (-0.5);
    float _2908 = _1702 + 0.5;
    float _2910 = fma(_2804, _2658, _2904);
    int _2912 = abs(_1954);
    float _2914 = -_2906;
    float _2916 = -_2162;
    float _2918 = fma(_2914, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2916);
    float _2920 = fma(_2416, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2922 = _2290 + 0.5;
    float _2924 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_2898)
    {
        _2860 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2926 = _2860;
    float _2928 = _1896 + (-0.5);
    int _2930 = ~_2912;
    int _2932 = _2930 + 1;
    int _2934 = _2932 + 1;
    float _2936 = fma(_2922, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2128);
    float _2938 = fma(_2908, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2326);
    float _2940 = -_2928;
    float _2942 = -_2156;
    float _2944 = fma(_2940, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2942);
    if (_2898)
    {
        float _2946 = _2926 * 5.0;
        _2016 = as_type<int>(_2946);
    }
    int _2948 = _2016;
    float _2950 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2952 = int(_2950);
    float _2954 = fma(_2828, _2686, _2910);
    int _2956 = abs(_2022);
    float _2958 = -_2362;
    float _2960 = fma(_2958, _1702, _2938);
    if (_2898)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9430 = as_type<float>(_2948);
        out.gl_Position.z = _9430;
    }
    float _2962 = -_2138;
    float _2964 = _2962 + 1.0;
    float _2966 = fma(_2634, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2954);
    float _2968 = _2924 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2970 = _2934 * as_type<int>(_2826);
    float _2972 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2974 = fma(_2964, _1888, _2918);
    bool _2976 = !_2662;
    int _2978 = _2976 ? 0 : 1;
    out.m_70.x = _2966;
    int _2980 = ~_2644;
    int _2982 = _2980 + 1;
    int _2984 = _2982 + 1;
    float _2986 = _1660 + 0.5;
    float _2988 = _1420 + (-0.5);
    int _2990 = _2984 * as_type<int>(_2818);
    int _2992 = _2990 + _2970;
    int _2994 = ~_2956;
    int _2996 = _2994 + 1;
    int _2998 = _2996 + 1;
    float _3000 = fma(_2968, _2986, _2242);
    int _3002 = abs(_2894);
    float _3004 = _2810 * _2810;
    out.m_72.x = _2960;
    out.m_72.y = _2974;
    int _3006 = _2998 * as_type<int>(_2882);
    int _3008 = _3006 + _2992;
    float _3010 = float(uint(_2952));
    float _3012 = fma(_2834, _2834, _3004);
    int _3014 = abs(_2034);
    float _3016 = _2972 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3018 = ~_3002;
    int _3020 = _3018 + 1;
    int _3022 = _3020 + 1;
    if (_2898)
    {
        out.m_55.x = 0.0;
    }
    float _3024 = 1.0 / _3010;
    int _3026 = ~_3014;
    int _3028 = _3026 + 1;
    int _3030 = _3028 + 1;
    float _3032 = -_3016;
    float _3034 = -_2252;
    float _3036 = fma(_3032, _2988, _3034);
    int _3038 = _3022 * as_type<int>(_2890);
    int _3040 = _3038 + _3008;
    float _3042 = fma(_2848, _2848, _3012);
    int _3044 = abs(_2952);
    float _3046 = _553 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _3048 = _3040 * _3030;
    float _3050 = rsqrt(_3042);
    int _3052 = _1688 >> 31;
    int _3054 = _2588 * _3014;
    int _3056 = _3054 + _3048;
    float _3058 = float(uint(_3044));
    int _3060 = _3052 & 3;
    int _3062 = as_type<int>(_3024) + (-2);
    float _3064 = float(uint(_3056));
    float _3066 = 1.0 / _3058;
    int _3068 = _1688 + _3060;
    float _3070 = _3046 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _3072 = _2040 >> 31;
    float _3074 = as_type<float>(_3062) * _3064;
    int _3076 = abs(_2978);
    float _3078 = _3070 * _3050;
    int _3080 = _3072 & 3;
    int _3082 = ~_2952;
    int _3084 = _3082 + 1;
    float _3086 = trunc(_3074);
    float _3088 = precise::max(_3086, 0.0);
    uint _3090 = uint(_3088);
    float _3092 = _2834 * _3078;
    int _3094 = _2040 + _3080;
    float _3096 = _2810 * _3078;
    float _3098 = float(_2866);
    float _3100 = -_3092;
    float _3102 = _2834 + _3100;
    int _3104 = _3068 >> 2;
    float _3106 = -_3096;
    float _3108 = _2810 + _3106;
    int _3110 = abs(_3056);
    float _3112 = in.m_74.x;
    float _3114 = in.m_74.y;
    float _3116 = in.m_74.z;
    int _3118 = _3104 << 4;
    int _3120 = _3118 + 368;
    float _3122 = _3108 * _3108;
    int _3124 = _3094 >> 2;
    float _3126 = fma(_3102, _3102, _3122);
    int _3128 = as_type<int>(_3066) + (-2);
    int _3130 = _3084 * int(_3090);
    int _3132 = _3130 + _3056;
    float _3134 = float(uint(_3110));
    uint _3136 = uint(int(uint(_3120) >> uint(2)));
    uint _3138 = uint(int(uint(int(_3136)) >> uint(2)));
    int _3140 = int(_3136) & 3;
    float _3142 = (*spvDescriptorSet0.vp_c9)._m0[int(_3138)][_3140];
    int _3144 = int(_3136) + 1;
    uint _3146 = uint(int(uint(_3144) >> uint(2)));
    int _3148 = _3144 & 3;
    float _3150 = (*spvDescriptorSet0.vp_c9)._m0[int(_3146)][_3148];
    float _3152 = float(_3076);
    int _3154 = _3124 << 4;
    int _3156 = _3154 + 800;
    float _3158 = as_type<float>(_3128) * _3134;
    float _3160 = float(uint(_3132));
    float _3162 = _3152 * _3098;
    float _3164 = -_2330;
    float _3166 = _3164 + 1.0;
    uint _3168 = uint(int(uint(_3156) >> uint(2)));
    uint _3170 = uint(int(uint(int(_3168)) >> uint(2)));
    int _3172 = int(_3168) & 3;
    float _3174 = (*spvDescriptorSet0.vp_c9)._m0[int(_3170)][_3172];
    int _3176 = int(_3168) + 1;
    uint _3178 = uint(int(uint(_3176) >> uint(2)));
    int _3180 = _3176 & 3;
    float _3182 = (*spvDescriptorSet0.vp_c9)._m0[int(_3178)][_3180];
    float _3184 = trunc(_3158);
    float _3186 = precise::max(_3184, 0.0);
    uint _3188 = uint(_3186);
    float _3190 = -_2346;
    float _3192 = _3190 + 1.0;
    float _3194 = fma(_1896, _3166, _2944);
    float _3196 = as_type<float>(_3062) * _3160;
    float _3198 = _2848 * _3078;
    float _3200 = -_2422;
    float _3202 = fma(_2290, _3200, _2936);
    float _3204 = -_3192;
    float _3206 = fma(_1660, _3204, _3000);
    float _3208 = fma(_1420, _2260, _3036);
    int _3210 = ~_3044;
    int _3212 = _3210 + 1;
    float _3214 = _3162 * (-2.0);
    float _3216 = trunc(_3196);
    float _3218 = precise::max(_3216, 0.0);
    uint _3220 = uint(_3218);
    int _3222 = abs(_2638);
    out.m_76.x = _3202;
    out.m_76.y = _3194;
    out.m_76.z = _3206;
    out.m_76.w = _3208;
    float _3224 = fma(_3214, _3112, _3112);
    int _3226 = ~_2116;
    int _3228 = _3226 + _2160;
    int _3230 = _3228 + 1;
    float _3232 = -_3198;
    float _3234 = _2848 + _3232;
    int _3236 = _3212 * int(_3188);
    int _3238 = _3236 + _3110;
    float _3240 = fma(_2868, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3224);
    int _3242 = abs(_1936);
    int _3244 = _3120 + 8;
    uint _3246 = uint(int(uint(_3244) >> uint(2)));
    uint _3248 = uint(int(uint(int(_3246)) >> uint(2)));
    int _3250 = int(_3246) & 3;
    float _3252 = (*spvDescriptorSet0.vp_c9)._m0[int(_3248)][_3250];
    int _3254 = int(_3246) + 1;
    uint _3256 = uint(int(uint(_3254) >> uint(2)));
    int _3258 = _3254 & 3;
    float _3260 = (*spvDescriptorSet0.vp_c9)._m0[int(_3256)][_3258];
    int _3262 = _793 * _3230;
    int _3264 = _3262 + _1556;
    int _3266 = abs(_2044);
    float _3268 = fma(_2920, _3214, _2920);
    float _3270 = fma(_3234, _3234, _3126);
    float _3272 = fma(_3268, _2496, _3240);
    int _3274 = _3156 + 8;
    uint _3276 = uint(int(uint(_3274) >> uint(2)));
    uint _3278 = uint(int(uint(int(_3276)) >> uint(2)));
    int _3280 = int(_3276) & 3;
    float _3282 = (*spvDescriptorSet0.vp_c9)._m0[int(_3278)][_3280];
    int _3284 = int(_3276) + 1;
    uint _3286 = uint(int(uint(_3284) >> uint(2)));
    int _3288 = _3284 & 3;
    float _3290 = (*spvDescriptorSet0.vp_c9)._m0[int(_3286)][_3288];
    float _3292 = float(uint(_3238));
    int _3294 = abs(_1780);
    int _3296 = int(_3090) + int(_3220);
    float _3298 = as_type<float>(_3128) * _3292;
    int _3300 = ~_2952;
    int _3302 = _3300 + 1;
    int _3304 = ~_3294;
    int _3306 = _3304 + 1;
    int _3308 = _3306 + 1;
    bool _3310 = !_2058;
    int _3312 = _3310 ? 0 : 1;
    float _3314 = trunc(_3298);
    float _3316 = precise::max(_3314, 0.0);
    uint _3318 = uint(_3316);
    int _3320 = abs(_2094);
    int _3322 = _3302 * _3296;
    int _3324 = _3322 + _3056;
    bool _3326 = _1720 != 3;
    int _3328 = _3308 * as_type<int>(_3150);
    int _3330 = ~_3320;
    int _3332 = _3330 + 1;
    int _3334 = _3332 + 1;
    bool _3336 = !_3326;
    int _3338 = _3336 ? 0 : (-1);
    bool _3340 = uint(_3324) >= uint(_2952);
    int _3342 = _3334 * as_type<int>(_3182);
    int _3344 = abs(_3312);
    int _3346 = ~_3222;
    int _3348 = _3346 + 1;
    int _3350 = _3348 + 1;
    int _3352 = ~_3044;
    int _3354 = _3352 + 1;
    int _3356 = int(_3188) + int(_3318);
    int _3358 = _3350 * as_type<int>(_3142);
    int _3360 = _3358 + _3328;
    bool _3362 = !_3340;
    int _3364 = _3362 ? 0 : (-1);
    bool _3366 = _2056 != 3;
    int _3368 = _3354 * _3356;
    int _3370 = _3368 + _3110;
    int _3372 = ~_3296;
    int _3374 = _3372 + _3364;
    int _3376 = _3374 + 1;
    int _3378 = abs(_1858);
    int _3380 = ~_3344;
    int _3382 = _3380 + 1;
    int _3384 = _3382 + 1;
    int _3386 = _2952 * _3376;
    int _3388 = _3386 + _3056;
    bool _3390 = !_3366;
    int _3392 = _3390 ? 0 : (-1);
    bool _3394 = uint(_3370) >= uint(_3044);
    int _3396 = _3384 * as_type<int>(_3174);
    int _3398 = _3396 + _3342;
    int _3400 = ~_3378;
    int _3402 = _3400 + 1;
    int _3404 = _3402 + 1;
    float _3406 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3408 = ~_2472;
    int _3410 = _3408 + 1;
    int _3412 = _3410 + 1;
    int _3414 = _3056 ^ _2952;
    int _3416 = _3404 * as_type<int>(_3252);
    int _3418 = _3416 + _3360;
    bool _3420 = !_3394;
    int _3422 = _3420 ? 0 : (-1);
    int _3424 = _3412 * as_type<int>(_3282);
    int _3426 = _3424 + _3398;
    int _3428 = abs(_3338);
    float _3430 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    uint _3432 = uint(int(uint(_3414) >> uint(31)));
    int _3434 = abs(_3392);
    int _3436 = ~_3422;
    int _3438 = _3356 + _3436;
    int _3440 = _3438 + 1;
    int _3442 = ~_3428;
    int _3444 = _3442 + 1;
    int _3446 = _3444 + 1;
    float _3448 = _3406 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3450 = ~int(_3432);
    int _3452 = _3450 + 1;
    int _3454 = ~_3434;
    int _3456 = _3454 + 1;
    int _3458 = _3456 + 1;
    int _3460 = _3446 * as_type<int>(_3260);
    int _3462 = _3460 + _3418;
    bool _3464 = _2952 == 0;
    int _3466 = _3440 ^ _3452;
    int _3468 = _3458 * as_type<int>(_3290);
    int _3470 = _3468 + _3426;
    int _3472 = ~_3266;
    int _3474 = _3472 + 1;
    int _3476 = _3474 + 1;
    bool _3478 = !_3464;
    int _3480 = _3478 ? _3388 : (-1);
    bool _3482 = _2952 == 0;
    int _3484 = _3470 * _3476;
    int _3486 = ~_3452;
    int _3488 = _3486 + _3466;
    int _3490 = _3488 + 1;
    int _3492 = ~_3242;
    int _3494 = _3492 + 1;
    int _3496 = _3494 + 1;
    bool _3498 = _755 == 0;
    bool _3500 = !_3482;
    int _3502 = _3500 ? _3490 : (-1);
    int _3504 = _3462 * _3496;
    bool _3506 = !_3498;
    int _3508 = _3506 ? _2468 : (-1);
    float _3510 = _1110 + (-0.5);
    float _3512 = float(_3480);
    float _3514 = float(_3502);
    float _3516 = _3430 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3518 = _3508 * _3242;
    int _3520 = _3518 + _3504;
    float _3522 = fma(_3448, _3512, _2354);
    bool _3524 = !_1496;
    int _3526 = _3524 ? _3264 : (-1);
    float _3528 = -_2356;
    float _3530 = fma(_3516, _3514, _3528);
    bool _3532 = !_2666;
    int _3534 = _3532 ? 0 : 1;
    float _3536 = _1080 + 0.5;
    int _3538 = _3526 * _3266;
    int _3540 = _3538 + _3484;
    int _3542 = abs(_3534);
    float _3544 = fma(_3448, _3536, _3522);
    float _3546 = -_3516;
    float _3548 = fma(_3546, _3510, _3530);
    float _3550 = float(_3520);
    float _3552 = -_2448;
    float _3554 = fma(_1080, _3552, _3544);
    float _3556 = float(_3540);
    float _3558 = fma(_1110, _2458, _3548);
    float _3560 = float(_2570);
    out.m_78.x = _3550;
    float _3562 = float(_3542);
    out.m_78.w = _3556;
    bool _3564 = !_2670;
    int _3566 = _3564 ? 0 : 1;
    float _3568 = _3562 * _3560;
    out.m_80.x = _3554;
    out.m_80.y = _3558;
    float _3570 = _3116;
    if (_2898)
    {
        return out;
    }
    float _3572 = -_3096;
    float _3574 = _2556 + _3572;
    float _3576 = -_3092;
    float _3578 = _2802 + _3576;
    float _3580 = -_3198;
    float _3582 = _2838 + _3580;
    int _3584 = abs(_3566);
    float _3586 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3588 = _3574 + _3586;
    float _3590 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3592 = _3578 + _3590;
    float _3594 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3596 = _3582 + _3594;
    float _3598 = _2900 + (-1.0);
    float _3600 = _3588 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3602 = _3568 * (-2.0);
    float _3604 = float(_2656);
    float _3606 = fma(_3598, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3608 = fma(_3592, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3600);
    float _3610 = float(_3584);
    float _3612 = _2856 + (-1.0);
    float _3614 = _3272 * 0.15915493667125701904296875;
    float _3616 = fma(_3596, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3608);
    float _3618 = fma(_3602, _3114, _3114);
    float _3620 = fma(_3606, _3602, _3606);
    float _3622 = _3610 * _3604;
    float _3624 = fma(_2902, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3618);
    bool _3626 = _3616 >= 0.0;
    float _3628 = _3622 * (-2.0);
    float _3630 = sqrt(_3270);
    float _3632 = fma(_3620, _2496, _3624);
    float _3634 = fma(_3612, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3636 = fma(_3628, _3116, _3116);
    float _3638 = _918 + (-0.5);
    float _3640 = _3632 * 0.15915493667125701904296875;
    float _3642 = fma(_3634, _3628, _3634);
    float _3644 = _3614 * 6.283185482025146484375;
    float _3646 = sin(_3644);
    float _3648 = fma(_3638, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3636);
    float _3650 = _3592;
    float _3652 = _3578;
    if (_3626)
    {
        _3570 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3654 = _3570;
    int _3656 = as_type<int>(_3654);
    if (_3626)
    {
        out.m_55.x = 0.0;
    }
    float _3658 = fma(_3642, _2496, _3648);
    float _3660 = _3614 * 6.283185482025146484375;
    float _3662 = cos(_3660);
    if (_3626)
    {
        float _3664 = _3654 * 5.0;
        _3656 = as_type<int>(_3664);
    }
    int _3666 = _3656;
    float _3668 = _3658 * 0.15915493667125701904296875;
    if (_3626)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10450 = as_type<float>(_3666);
        out.gl_Position.z = _10450;
    }
    float _3670 = _3640 * 6.283185482025146484375;
    float _3672 = sin(_3670);
    float _3674 = _3640 * 6.283185482025146484375;
    float _3676 = cos(_3674);
    if (_3626)
    {
        return out;
    }
    float _3678 = _3668 * 6.283185482025146484375;
    float _3680 = cos(_3678);
    float _3682 = _3050 * _3630;
    float _3684 = _551 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3686 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _211);
    float _3688 = _3662 * _3676;
    float _3690 = _3046 * _3682;
    float _3692 = _3682 * _3684;
    float _3694 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _201);
    float _3696 = _3668 * 6.283185482025146484375;
    float _3698 = sin(_3696);
    float _3700 = _3646 * _3676;
    float _3702 = _3686 * _3692;
    float _3704 = _3646 * _3672;
    float _3706 = _3662 * _3672;
    float _3708 = _3694 * _3690;
    float _3710 = _211 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3712 = _3662 * _3680;
    float _3714 = _3646 * _3680;
    float _3716 = _3676 * _3680;
    float _3718 = _3672 * _3680;
    float _3720 = _3712 * _3702;
    float _3722 = _3682 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3724 = _3722 * 0.5;
    float _3726 = fma(_3698, _3688, _3704);
    float _3728 = -_3700;
    float _3730 = fma(_3698, _3706, _3728);
    float _3732 = -_3702;
    float _3734 = _3698 * _3732;
    float _3736 = -_3706;
    float _3738 = fma(_3698, _3700, _3736);
    float _3740 = fma(_3726, _3708, _3720);
    float _3742 = _3714 * _3702;
    float _3744 = fma(_3716, _3708, _3734);
    float _3746 = fma(_3698, _3704, _3688);
    float _3748 = fma(_3730, _3724, _3740);
    float _3750 = fma(_3738, _3708, _3742);
    float _3752 = fma(_3718, _3724, _3744);
    float _3754 = _3748 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3756 = _3748 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3758 = fma(_3746, _3724, _3750);
    float _3760 = _3748 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3762 = fma(_3752, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3754);
    float _3764 = fma(_3752, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3756);
    float _3766 = fma(_3758, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3762);
    float _3768 = fma(_3758, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3764);
    float _3770 = _3766 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3772 = _3768 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3774 = _3726 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3776 = _2802 + _3770;
    float _3778 = _2838 + _3772;
    float _3780 = _3726 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3782 = fma(_3716, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3774);
    float _3784 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3786 = _3776 + _3784;
    float _3788 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3790 = _3778 + _3788;
    float _3792 = fma(_3716, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3780);
    float _3794 = fma(_3752, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3760);
    float _3796 = _3786 * _3786;
    float _3798 = _3790 * _3790;
    float _3800 = _3726 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3802 = fma(_3710, _3710, 1.0);
    float _3804 = fma(_3758, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3794);
    float _3806 = _3796 + _3798;
    float _3808 = fma(_3716, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3800);
    float _3810 = rsqrt(_3802);
    float _3812 = _3712 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3814 = _3712 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3816 = _3712 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3818 = _3804 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3820 = -_3698;
    float _3822 = fma(_3820, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3812);
    float _3824 = -_3698;
    float _3826 = fma(_3824, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3814);
    float _3828 = -_3698;
    float _3830 = fma(_3828, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3816);
    float _3832 = sqrt(_3806);
    float _3834 = _3730 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3836 = _3730 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3838 = _3730 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3840 = _2556 + _3818;
    float _3842 = fma(_3718, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3834);
    float _3844 = fma(_3718, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3836);
    float _3846 = fma(_3718, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3838);
    bool _3848 = _3832 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3850 = _3836;
    float _3852 = _3834;
    float _3854 = _3838;
    float _3856 = _3718;
    float _3858 = _3804;
    if (!_3848)
    {
        _3850 = _3798;
    }
    float _3860 = _3850;
    float _3862 = _3860;
    if (!_3848)
    {
        _3852 = _3796;
    }
    float _3864 = _3852;
    float _3866 = _3864;
    if (!_3848)
    {
        _3854 = _3776;
    }
    float _3868 = _3854;
    float _3870 = _3868;
    if (!_3848)
    {
        _3856 = _3778;
    }
    float _3872 = _3856;
    float _3874 = _3872;
    if (!_3848)
    {
        _3858 = _3840;
    }
    float _3876 = _3858;
    bool _3878 = !_3848;
    float _3880 = _3876;
    if (!_3878)
    {
        float _3882 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3884 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3886 = _3832 + _3884;
        float _3888 = rsqrt(_3806);
        float _3890 = _3886 * _3882;
        float _3892 = _3840 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3894 = _3890 * 0.15915493667125701904296875;
        float _3896 = _3894 * 6.283185482025146484375;
        float _3898 = sin(_3896);
        float _3900 = _3894 * 6.283185482025146484375;
        float _3902 = cos(_3900);
        float _3904 = fma(_3898, _3892, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3906 = _3888 * _3904;
        float _3908 = _3902 + (-1.0);
        float _3910 = fma(_3786, _3906, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3912 = fma(_3790, _3906, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3914 = _3908 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3916 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3918 = _3910 + _3916;
        float _3920 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3922 = _3912 + _3920;
        float _3924 = fma(_3840, _3902, _3914);
        float _3926 = _3918 * _3918;
        float _3928 = _3922 * _3922;
        _3880 = _3924;
        _3866 = _3926;
        _3862 = _3928;
        _3870 = _3910;
        _3874 = _3912;
    }
    float _3930 = _3880;
    float _3932 = _3866;
    float _3934 = _3862;
    float _3936 = _3870;
    float _3938 = _3874;
    float _3940 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3942 = _3930 + _3940;
    float _3944 = fma(_3714, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3822);
    float _3946 = fma(_3714, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3826);
    float _3948 = fma(_3714, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3830);
    float _3950 = fma(_3942, _3942, _3932);
    float _3952 = fma(_3746, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3842);
    float _3954 = fma(_3746, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3844);
    float _3956 = fma(_3746, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3846);
    float _3958 = _3950 + _3934;
    float _3960 = _3710 * _3810;
    float _3962 = fma(_3738, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3792);
    float _3964 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3966 = _3710 * _3944;
    float _3968 = fma(_3738, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3782);
    float _3970 = _3710 * _3946;
    float _3972 = fma(_3738, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3808);
    float _3974 = _3710 * _3948;
    float _3976 = -_3952;
    float _3978 = _3960 * _3976;
    float _3980 = -_3954;
    float _3982 = _3960 * _3980;
    float _3984 = -_3956;
    float _3986 = _3960 * _3984;
    float _3988 = fma(_3964, _3962, _3966);
    float _3990 = sqrt(_3958);
    float _3992 = fma(_3964, _3968, _3970);
    float _3994 = fma(_3964, _3972, _3974);
    float _3996 = fma(_3810, _3944, _3978);
    float _3998 = fma(_3810, _3946, _3982);
    float _4000 = _3954 + _3992;
    float _4002 = fma(_3810, _3948, _3986);
    float _4004 = _3952 + _3988;
    float _4006 = _3956 + _3994;
    out.m_82.x = _3962;
    out.m_82.y = _3968;
    out.m_82.z = _3972;
    out.m_84.x = _3996;
    out.m_84.y = _3998;
    out.m_84.z = _4002;
    bool _4008 = _3990 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4010 = isnan(_3990);
    bool _4012 = _4008 || _4010;
    bool _4014 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4016 = _4012 || _4014;
    out.m_86.x = _4004;
    out.m_86.y = _4000;
    out.m_86.z = _4006;
    float _4018 = _3964;
    if (!_4016)
    {
        _4018 = 1.0;
    }
    float _4020 = _4018;
    bool _4022 = !_4016;
    float _4024 = _4020;
    if (!_4022)
    {
        bool _4026 = _3990 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4028 = isnan(_3990);
        bool _4030 = _4026 || _4028;
        bool _4032 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4034 = _4030 || _4032;
        if (!_4034)
        {
            float _4036 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4038 = _3990 + _4036;
            float _4040 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4042 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4040;
            float _4044 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4046 = _4044 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4048 = 1.0 / _4042;
            float _4050 = _4038 * _4048;
            float _4052 = fma(_4050, _4046, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4024 = _4052;
            _4054 = true;
        }
        else
        {
            bool _4056 = _3990 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4058 = isnan(_3990);
            bool _4060 = _4056 || _4058;
            bool _4062 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4064 = _4060 || _4062;
            if (!_4064)
            {
                float _4066 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4068 = _3990 + _4066;
                float _4070 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4072 = _4070 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4074 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4076 = _4074 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4078 = 1.0 / _4072;
                float _4080 = _4068 * _4078;
                float _4082 = fma(_4080, _4076, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4024 = _4082;
                _4054 = true;
            }
            else
            {
                _4024 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4054 = false;
    float _4084 = _4024;
    float _4086 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4088 = _3930 + _4086;
    float _4090 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4092 = _3936 + _4090;
    float _4094 = _3574 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4096 = fma(_4088, _4084, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4098 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4100 = _3938 + _4098;
    float _4102 = fma(_4092, _4084, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4104 = fma(_3578, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4094);
    float _4106 = -_2556;
    float _4108 = _4106 + _4096;
    float _4110 = fma(_4100, _4084, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4112 = -_2802;
    float _4114 = _4112 + _4102;
    float _4116 = fma(_3582, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4104);
    float _4118 = _4108 * _4108;
    float _4120 = -_2838;
    float _4122 = _4120 + _4110;
    float _4124 = _3574 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4126 = _4116 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4128 = fma(_4114, _4114, _4118);
    float _4130 = fma(_3578, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4124);
    float _4132 = 1.0 / _4126;
    float _4134 = fma(_4122, _4122, _4128);
    float _4136 = fma(_3582, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4130);
    float _4138 = _4136 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4140 = sqrt(_4134);
    float _4142 = _4138 + _4126;
    float _4144 = _4142 * _4132;
    float _4146 = _4144 * 0.5;
    bool _4148 = _4140 > 0.0;
    float _4150 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4152 = fma(_4146, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4150);
    float _4154 = 1.0 / _4152;
    bool _4156 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4158 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4160 = _4156 || _4158;
    bool _4162 = isnan(0.5);
    bool _4164 = _4160 || _4162;
    bool _4166 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4168 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4170 = _4166 || _4168;
    bool _4172 = isnan(0.5);
    bool _4174 = _4170 || _4172;
    float _4176 = _4116;
    float _4178 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4180 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _4182 = _4114;
    if (!_4148)
    {
        _4176 = _4102;
    }
    float _4184 = _4176;
    float _4186 = _4184;
    float _4188 = _4184;
    if (!_4148)
    {
        _4178 = _4096;
    }
    float _4190 = _4178;
    float _4192 = _4190;
    float _4194 = _4190;
    if (!_4148)
    {
        _4180 = _4110;
    }
    float _4196 = _4180;
    bool _4198 = !_4148;
    float _4200 = _4196;
    if (!_4198)
    {
        float _4202 = _215 * _215;
        float _4204 = rsqrt(_4134);
        float _4206 = fma(_213, _213, _4202);
        float _4208 = fma(_217, _217, _4206);
        float _4210 = sqrt(_4208);
        float _4212 = _4114 * _4204;
        float _4214 = _4108 * _4204;
        float _4216 = _4122 * _4204;
        bool _4218 = _4210 > 0.0;
        float _4220 = _4210;
        if (!_4218)
        {
            _4186 = _4102;
        }
        float _4222 = _4186;
        _4188 = _4222;
        if (!_4218)
        {
            _4192 = _4096;
        }
        float _4224 = _4192;
        _4194 = _4224;
        if (!_4218)
        {
            _4220 = _4110;
        }
        float _4226 = _4220;
        bool _4228 = !_4218;
        _4200 = _4226;
        if (!_4228)
        {
            float _4230 = rsqrt(_4208);
            float _4232 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4234 = _215 * _4230;
            float _4236 = _213 * _4230;
            float _4238 = _4214 * _4234;
            float _4240 = _217 * _4230;
            float _4242 = fma(_4212, _4236, _4238);
            float _4244 = _4232 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4246 = fma(_4216, _4240, _4242);
            float _4248 = _4246 * _4244;
            float _4250 = fma(_213, _4248, _4102);
            float _4252 = fma(_215, _4248, _4096);
            float _4254 = fma(_217, _4248, _4110);
            _4188 = _4250;
            _4194 = _4252;
            _4200 = _4254;
        }
    }
    float _4256 = _4188;
    float _4258 = _4194;
    float _4260 = _4200;
    float _4262 = -_3092;
    float _4264 = _4262 + _4256;
    float _4266 = -_3096;
    float _4268 = _4266 + _4258;
    float _4270 = -_3198;
    float _4272 = _4270 + _4260;
    float _4274 = _4268;
    float _4276 = _4264;
    float _4278 = _4272;
    if (_4174)
    {
        _221 = 1.0;
    }
    float _4280 = _221;
    float _4282 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4284 = _4154 * _4282;
    float _4286 = _4280;
    if (!_4164)
    {
        float _4288 = _3588 * _3588;
        float _4290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4292 = -_2838;
        float _4294 = _4292 + _4260;
        float _4296 = -_2556;
        float _4298 = _4296 + _4258;
        float _4300 = fma(_3592, _3592, _4288);
        float _4302 = -_2802;
        float _4304 = _4302 + _4256;
        float _4306 = fma(_3596, _3596, _4300);
        float _4308 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4310 = sqrt(_4306);
        float _4312 = 1.0 / _3682;
        float _4314 = _4308 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4316 = precise::min(_4310, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4318 = _4316 * _4290;
        float _4320 = _4318 * _4312;
        float _4322 = _4314 * _4320;
        float _4324 = _4294 * _4320;
        float _4326 = fma(_4298, _4322, _3574);
        float _4328 = fma(_4304, _4322, _3578);
        float _4330 = fma(_4314, _4324, _3582);
        _4274 = _4326;
        _4276 = _4328;
        _4278 = _4330;
        _3650 = _4310;
    }
    float _4332 = _4274;
    float _4334 = _4276;
    float _4336 = _4278;
    float _4338 = _3650;
    float _4340 = _4338;
    if (!_4174)
    {
        float _4342 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4344 = _4342 * 0.15915493667125701904296875;
        float _4346 = _4344 * 6.283185482025146484375;
        float _4348 = cos(_4346);
        float _4350 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4352 = _4350 * 0.15915493667125701904296875;
        float _4354 = _4344 * 6.283185482025146484375;
        float _4356 = sin(_4354);
        float _4358 = 1.0 / _4348;
        float _4360 = _4352 * 6.283185482025146484375;
        float _4362 = cos(_4360);
        float _4364 = _4356 * _4358;
        float _4366 = _4352 * 6.283185482025146484375;
        float _4368 = sin(_4366);
        float _4370 = _4362 * _4364;
        float _4372 = 1.0 / _4370;
        float _4374 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4376 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4374;
        float _4378 = 1.0 / _4376;
        float _4380 = _4368 * _4372;
        float _4382 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4384 = fma(_4284, _4380, _4382);
        float _4386 = _4384 * _4378;
        float _4388 = precise::clamp(_4386, 0.0, 1.0);
        _4340 = _4344;
        _4286 = _4388;
    }
    float _4390 = _4340;
    float _4392 = _4286;
    float _4394 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4396 = _4332 + _4394;
    float _4398 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4400 = _4334 + _4398;
    float _4402 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4404 = _4336 + _4402;
    float _4406 = _4396 * _4396;
    float _4408 = fma(_4400, _4400, _4406);
    float _4410 = fma(_3578, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4412 = fma(_4404, _4404, _4408);
    float _4414 = rsqrt(_4412);
    float _4416 = sqrt(_4412);
    float _4418 = _4414 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4420 = _4400 * _4418;
    float _4422 = _4404 * _4418;
    float _4424 = _4420 * _4420;
    float _4426 = _4422 * _4422;
    float _4428 = _4424 + _4426;
    float _4430 = sqrt(_4428);
    bool _4432 = _4430 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4434 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4436 = _4430 + _4434;
    float _4438 = _4414;
    float _4440 = _4428;
    float _4442 = _4436;
    float _4444 = _4390;
    float _4446 = _4396;
    if (_4432)
    {
        float _4448 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4438 = _4448;
    }
    float _4450 = _4438;
    if (!_4432)
    {
        _3652 = _4420;
    }
    float _4452 = _3652;
    float _4454 = _4452;
    if (_4432)
    {
        float _4456 = rsqrt(_4428);
        _4440 = _4456;
    }
    float _4458 = _4440;
    if (_4432)
    {
        float _4460 = _4436 * _4450;
        _4442 = _4460;
    }
    float _4462 = _4442;
    if (_4432)
    {
        float _4464 = _4462 * 0.15915493667125701904296875;
        _4444 = _4464;
    }
    float _4466 = _4444;
    float _4468 = _4404;
    float _4470 = _4466;
    if (_4432)
    {
        float _4472 = _4466 * 6.283185482025146484375;
        float _4474 = sin(_4472);
        _4468 = _4474;
    }
    float _4476 = _4468;
    float _4478 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4480 = precise::max(0.0, _4478);
    float _4482 = _4450;
    float _4484 = _4480;
    if (_4432)
    {
        float _4486 = _4466 * 6.283185482025146484375;
        float _4488 = cos(_4486);
        _4482 = _4488;
    }
    float _4490 = _4482;
    float _4492 = -_4418;
    float _4494 = -_4480;
    float _4496 = fma(_4396, _4492, _4494);
    if (_4432)
    {
        float _4498 = _4496 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4446 = _4498;
    }
    float _4500 = _4446;
    float _4502 = _4476;
    float _4504 = _4500;
    if (_4432)
    {
        float _4506 = fma(_4476, _4500, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4502 = _4506;
    }
    float _4508 = _4502;
    float _4510 = _4508;
    if (!_4432)
    {
        _4504 = _4496;
    }
    float _4512 = _4504;
    float _4514 = _4512;
    float _4516 = _4490;
    if (_4432)
    {
        float _4518 = _4490 + (-1.0);
        _4484 = _4518;
    }
    float _4520 = _4484;
    float _4522 = _4520;
    if (_4432)
    {
        float _4524 = _4458 * _4508;
        _4182 = _4524;
    }
    float _4526 = _4182;
    if (!_4432)
    {
        _4510 = _4424;
    }
    float _4528 = _4510;
    float _4530 = _4332 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4532 = _4528;
    if (_4432)
    {
        float _4534 = _4520 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4470 = _4534;
    }
    float _4536 = _4470;
    if (_4432)
    {
        float _4538 = _4420 * _4526;
        _4454 = _4538;
    }
    float _4540 = _4454;
    if (!_4432)
    {
        _4522 = _4422;
    }
    float _4542 = _4522;
    float _4544 = _4542;
    if (_4432)
    {
        float _4546 = _4422 * _4526;
        _4544 = _4546;
    }
    float _4548 = _4544;
    if (_4432)
    {
        float _4550 = fma(_4496, _4490, _4536);
        _4514 = _4550;
    }
    float _4552 = _4514;
    if (_4432)
    {
        float _4554 = _4540 * _4540;
        _4532 = _4554;
    }
    float _4556 = _4532;
    if (!_4432)
    {
        _4516 = _4426;
    }
    float _4558 = _4516;
    float _4560 = _4558;
    if (_4432)
    {
        float _4562 = _4548 * _4548;
        _4560 = _4562;
    }
    float _4564 = _4560;
    float _4566 = fma(_4552, _4552, _4556);
    float _4568 = _4332 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4570 = floor(_4410);
    float _4572 = _4566 + _4564;
    float _4574 = fma(_4334, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4568);
    float _4576 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4578 = fma(_4416, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4576);
    float _4580 = precise::clamp(_4578, 0.0, 1.0);
    float _4582 = fma(_3582, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4584 = fma(_4336, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4574);
    float _4586 = -_4580;
    float _4588 = _4586 + 1.0;
    float _4590 = rsqrt(_4572);
    float _4592 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4594 = _4584 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4596 = _4332 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4598 = _4594 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4600 = fma(_4334, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4596);
    float _4602 = abs(_4588);
    float _4604 = log2(_4602);
    float _4606 = -_4570;
    float _4608 = _4410 + _4606;
    float _4610 = -_4598;
    float _4612 = fma(_4610, _4592, 1.0);
    float _4614 = _4332 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4616 = fma(_4336, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4600);
    float _4618 = fma(_4334, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4530);
    float _4620 = _4590 * _4540;
    float _4622 = _4590 * _4552;
    float _4624 = _4590 * _4548;
    float _4626 = fma(_4334, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4614);
    float _4628 = _4620 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4630 = _4616 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4632 = floor(_4582);
    float _4634 = fma(_4336, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4626);
    float _4636 = -_4628;
    float _4638 = fma(_4622, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4636);
    float _4640 = _4630 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4642 = fma(_4336, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4618);
    float _4644 = _4634 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4646 = -_4624;
    float _4648 = fma(_4646, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4638);
    float _4650 = _4604 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4652 = log2(_4612);
    float _4654 = fma(_4644, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4640);
    float _4656 = fma(_4648, -0.5, 0.5);
    float _4658 = fma(_4648, 0.5, 0.5);
    float _4660 = _4630 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4662 = fma(_4594, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4654);
    float _4664 = _4622 + 1.0;
    float _4666 = sqrt(_4656);
    float _4668 = _4642 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4670 = -_4632;
    float _4672 = _4582 + _4670;
    float _4674 = fma(_4658, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4676 = fma(_4644, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4660);
    float _4678 = fma(_4668, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4662);
    float _4680 = _4630 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4682 = fma(_4658, _4674, -0.212114393711090087890625);
    float _4684 = exp2(_4650);
    float _4686 = fma(_4594, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4676);
    float _4688 = fma(_4644, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4680);
    float _4690 = fma(_4658, _4682, 1.570728778839111328125);
    float _4692 = _4652 * 0.693147182464599609375;
    float _4694 = fma(_4594, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4688);
    float _4696 = fma(_4668, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4686);
    float _4698 = 1.0 / _4678;
    float _4700 = _4666 * 0.636619746685028076171875;
    float _4702 = fma(_4668, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4694);
    float _4704 = _4692 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4706 = -_4690;
    float _4708 = fma(_4700, _4706, 1.0);
    float2 _12180 = float2(_4608, _4672);
    float _4710 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12180, float2(0.0), isnan(_12180)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12180, float2(0.0), isnan(_12180)), level(0.0)).x;
    float _4712 = -_4622;
    float _4714 = fma(_4684, _4664, _4712);
    float _4716 = fma(_4714, 0.5, 0.5);
    float _4718 = _4702 * _4698;
    float _4720 = _4696 * _4698;
    float _4722 = fma(_4718, 0.5, 0.5);
    float _4724 = fma(_4720, -0.5, 0.5);
    float3 _12209 = float3(_4722, _4724, _4704);
    float _4726 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12209, float3(0.0), isnan(_12209)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12209, float3(0.0), isnan(_12209)), level(0.0)).x;
    float3 _12220 = float3(_4722, _4724, _4704);
    float4 _4729 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12220, float3(0.0), isnan(_12220)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12220, float3(0.0), isnan(_12220)), level(0.0)).xyzw;
    float _4731 = _4729.x;
    float _4733 = _4729.y;
    float _4735 = _4729.z;
    float _4737 = _4729.w;
    float2 _12236 = float2(_4708, _4716);
    float3 _4741 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12236, float2(0.0), isnan(_12236)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12236, float2(0.0), isnan(_12236)), level(0.0)).xyz;
    float _4743 = _4741.x;
    float _4745 = _4741.y;
    float _4747 = _4741.z;
    float _4749 = abs(_4284);
    float _4751 = log2(_4749);
    float _4753 = _4630 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _4755 = _4416 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4757 = isnan(_4416);
    bool _4759 = _4755 || _4757;
    bool _4761 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4763 = _4759 || _4761;
    float _4765 = fma(_4644, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4753);
    float _4767 = fma(_4594, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4765);
    bool _4769 = _4284 <= 8000.0;
    bool _4771 = isnan(_4284);
    bool _4773 = _4769 || _4771;
    bool _4775 = isnan(8000.0);
    bool _4777 = _4773 || _4775;
    float _4779 = float(_4777);
    float _4781 = _4678 * 0.5;
    float _4783 = fma(_4668, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4767);
    float _4785 = _4751 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4787 = in.m_88.x;
    float _4789 = fma(_4696, -0.5, _4781);
    out.gl_Position.x = _4702;
    out.gl_Position.y = _4696;
    out.gl_Position.z = _4783;
    out.gl_Position.w = _4678;
    float _4791 = exp2(_4785);
    float _4793 = _4696;
    float _4795 = _4783;
    float _4797 = _4702;
    float _4799 = _4678;
    if (!_4763)
    {
        _4793 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4801 = _4793;
    float _4803 = fma(_4791, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4805 = precise::clamp(_4803, 0.0, 1.0);
    float _4807 = _4783 + _4678;
    float _4809 = _4801;
    float _4811 = _4801;
    if (!_4763)
    {
        _4795 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4813 = _4795;
    float _4815 = fma(_4805, -2.0, 3.0);
    float _4817 = _4805 * _4805;
    float _4819 = _4807 * 0.5;
    float _4821 = _4817 * _4815;
    float _4823 = _4604 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4825 = _4702 + _4678;
    float _4827 = _4813;
    float _4829 = _4813;
    if (!_4763)
    {
        _4797 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4831 = _4797;
    float _4833 = -_4821;
    float _4835 = _4833 + 1.0;
    float _4837 = _4825 * 0.5;
    float _4839 = exp2(_4823);
    float _4841 = fma(_4835, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4821);
    float _4843 = _4779 * _4841;
    float _4845 = _4831;
    float _4847 = _4831;
    if (!_4763)
    {
        _4799 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4849 = _4799;
    float _4851 = _4843 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_90.x = _4837;
    out.m_90.y = _4789;
    out.m_90.z = _4819;
    out.m_90.w = _4678;
    float _4853 = -_4839;
    float _4855 = _4853 + 1.0;
    float _4857 = _4855 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4859 = -_4710;
    float _4861 = _4859 + 1.0;
    float _4863 = _4861 * _4851;
    float _4865 = precise::clamp(_4863, 0.0, 1.0);
    float _4867 = -_4865;
    float _4869 = fma(_4867, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4871 = _4869 * _4787;
    float _4873 = _4871 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4875 = _4857 * _4726;
    float _4877 = -_4857;
    float _4879 = _4877 + 1.0;
    out.m_92.x = _4873;
    float _4881 = _4737 * _4875;
    float _4883 = _4747 * _4875;
    float _4885 = _4737 * _4879;
    float _4887 = fma(_4743, _4881, _4731);
    float _4889 = fma(_4745, _4881, _4733);
    float _4891 = fma(_4737, _4883, _4735);
    float _4893 = _4392 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4895 = _4881;
    float _4897 = _4735;
    float _4899 = _4849;
    float _4901 = _4849;
    if (!_4763)
    {
        _4895 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4903 = _4895;
    float _4905 = _4903;
    float _4907 = _4903;
    if (!_4763)
    {
        _4897 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4909 = _4897;
    out.m_94.x = _4887;
    out.m_94.y = _4889;
    out.m_94.z = _4891;
    out.m_94.w = _4885;
    bool _4911 = !_4763;
    float _4913 = _4909;
    float _4915 = _4909;
    if (!_4911)
    {
        bool _4917 = _4416 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4919 = isnan(_4416);
        bool _4921 = _4917 || _4919;
        bool _4923 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4925 = _4921 || _4923;
        if (!_4925)
        {
            float _4927 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4929 = _4416 + _4927;
            float _4931 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4933 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4931;
            float _4935 = 1.0 / _4933;
            float _4937 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4939 = _4937 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4941 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4943 = _4941 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4945 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4947 = _4945 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4949 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4951 = _4949 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4953 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4955 = _4953 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4957 = _4929 * _4935;
            float _4959 = precise::clamp(_4957, 0.0, 1.0);
            float _4961 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4963 = _4961 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4965 = fma(_4959, _4943, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4967 = fma(_4959, _4963, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4969 = fma(_4959, _4939, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4971 = fma(_4959, _4947, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4973 = fma(_4959, _4951, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4975 = fma(_4959, _4955, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4811 = _4969;
            _4915 = _4973;
            _4829 = _4967;
            _4907 = _4971;
            _4847 = _4965;
            _4901 = _4975;
            _4977 = true;
        }
        else
        {
            bool _4979 = _4416 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4981 = isnan(_4416);
            bool _4983 = _4979 || _4981;
            bool _4985 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4987 = _4983 || _4985;
            if (!_4987)
            {
                _4905 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4989 = _4905;
            _4907 = _4989;
            if (!_4987)
            {
                _4913 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4991 = _4913;
            _4915 = _4991;
            if (!_4987)
            {
                _4899 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4993 = _4899;
            _4901 = _4993;
            if (!_4987)
            {
                _4827 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4995 = _4827;
            _4829 = _4995;
            if (!_4987)
            {
                _4809 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4997 = _4809;
            _4811 = _4997;
            if (!_4987)
            {
                _4845 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4999 = _4845;
            bool _5001 = !_4987;
            _4847 = _4999;
            if (!_5001)
            {
                bool _5003 = _4416 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5005 = isnan(_4416);
                bool _5007 = _5003 || _5005;
                bool _5009 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5011 = _5007 || _5009;
                if (!_5011)
                {
                    float _5013 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5015 = _4416 + _5013;
                    float _5017 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5019 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5017;
                    float _5021 = 1.0 / _5019;
                    float _5023 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5025 = _5023 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5027 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5029 = _5027 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5031 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5033 = _5031 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5035 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5037 = _5035 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5039 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5041 = _5039 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5043 = _5015 * _5021;
                    float _5045 = precise::clamp(_5043, 0.0, 1.0);
                    float _5047 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5049 = _5047 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5051 = fma(_5045, _5029, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5053 = fma(_5045, _5049, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5055 = fma(_5045, _5025, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5057 = fma(_5045, _5033, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5059 = fma(_5045, _5037, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5061 = fma(_5045, _5041, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4811 = _5055;
                    _4915 = _5059;
                    _4829 = _5053;
                    _4907 = _5057;
                    _4847 = _5051;
                    _4901 = _5061;
                    _4977 = true;
                }
                else
                {
                    _4811 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4915 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4829 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4907 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4847 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4901 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4977 = false;
    float _5063 = _4811;
    float _5065 = _4915;
    float _5067 = _4829;
    float _5069 = _4907;
    float _5071 = _4847;
    float _5073 = _4901;
    float _5075 = _4893 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5077 = fma(_4000, -0.5, 0.5);
    float _5079 = precise::clamp(_5077, 0.0, 1.0);
    float _5081 = -_5063;
    float _5083 = _5065 + _5081;
    float _5085 = -_5067;
    float _5087 = _5069 + _5085;
    out.m_55.x = _5075;
    float _5089 = fma(_5079, _5083, _5063);
    float _5091 = -_5071;
    float _5093 = _5073 + _5091;
    float _5095 = fma(_5079, _5087, _5067);
    float _5097 = _5089 * 0.586610972881317138671875;
    bool _5099 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5101 = fma(_5079, _5093, _5071);
    out.m_96.x = 0.0;
    float _5103 = fma(_5095, 0.298911988735198974609375, _5097);
    bool _5105 = _4392 > 0.0;
    bool _5107 = isnan(_4392);
    bool _5109 = _5105 || _5107;
    bool _5111 = isnan(0.0);
    bool _5113 = _5109 || _5111;
    float _5115 = fma(_5101, 0.114477999508380889892578125, _5103);
    float _5117 = -_5115;
    float _5119 = _5095 + _5117;
    float _5121 = -_5115;
    float _5123 = _5089 + _5121;
    float _5125 = -_5115;
    float _5127 = _5101 + _5125;
    float _5129 = fma(_5119, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5115);
    float _5131 = fma(_5123, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5115);
    float _5133 = fma(_5127, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5115);
    bool _5135 = !_5099;
    if (!_5135)
    {
        float _5137 = -_4332;
        float _5139 = _5137 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5141 = -_4334;
        float _5143 = _5141 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5145 = -_4336;
        float _5147 = _5145 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5149 = _5139 * _5139;
        float _5151 = fma(_5143, _5143, _5149);
        float _5153 = fma(_5147, _5147, _5151);
        float _5155 = sqrt(_5153);
        float _5157 = rsqrt(_5153);
        float _5159 = -_5155;
        float _5161 = _5159 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5163 = _5161 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5165 = precise::clamp(_5163, 0.0, 1.0);
        float _5167 = _5143 * _5157;
        float _5169 = _5139 * _5157;
        float _5171 = abs(_5165);
        float _5173 = log2(_5171);
        float _5175 = _5147 * _5157;
        float _5177 = _5167 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5179 = _4000 * _5169;
        float _5181 = -_5169;
        float _5183 = -_5177;
        float _5185 = fma(_5181, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5183);
        float _5187 = fma(_4004, _5167, _5179);
        float _5189 = -_5175;
        float _5191 = fma(_5189, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5185);
        float _5193 = fma(_4006, _5175, _5187);
        float _5195 = precise::clamp(_5193, 0.0, 1.0);
        float _5197 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5199 = _5191 + _5197;
        float _5201 = _5173 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5203 = _5199 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5205 = precise::clamp(_5203, 0.0, 1.0);
        float _5207 = exp2(_5201);
        float _5209 = _5207 * _5205;
        float _5211 = _5195 * _5209;
        float _5213 = _5211 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5215 = _5211 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5217 = _5211 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _5213;
        out.m_96.y = _5215;
        out.m_96.z = _5217;
    }
    out.m_98.x = _5129;
    out.m_98.y = _5131;
    out.m_98.z = _5133;
    if (_5113)
    {
        return out;
    }
    out.m_55.x = 0.0;
    float _5219 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5219;
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
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4977 = false;
    bool _4054 = false;
    bool _575 = false;
    bool _431 = false;
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
    float _131 = _114;
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
    if (!_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5286 = as_type<float>(_141);
        out.gl_Position.z = _5286;
    }
    if (!_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _143 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_114);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = float(_119);
    bool _155 = _123 >= _153;
    bool _157 = !_151;
    bool _159 = _155 || _157;
    float _161 = 1.0 / _153;
    if (_159)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _131;
    if (_159)
    {
        out.m_55.x = 0.0;
    }
    float _165 = _123 * _161;
    int _167 = 0;
    float _169 = _165;
    if (_159)
    {
        float _171 = _163 * 5.0;
        _167 = as_type<int>(_171);
    }
    int _173 = _167;
    out.m_53.x = _165;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5349 = as_type<float>(_173);
        out.gl_Position.z = _5349;
    }
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    bool _199 = !_185;
    float _201 = _199 ? (-0.5) : 0.5;
    float _203 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].x, _193);
    float _205 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].x, _195);
    float _207 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].x, _197);
    bool _209 = !_189;
    float _211 = _209 ? (-0.5) : 0.5;
    float _213 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[4].z, _203);
    float _215 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[5].z, _205);
    float _217 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[6].z, _207);
    bool _219 = !_191;
    float _221 = _217;
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
        _239 = _165;
    }
    _241 = false;
    float _243 = _239;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _247 = _243 + _245;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _251 = _243 + _249;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _255 = _243 + _253;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _257;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _263 = _261 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _265;
    bool _269 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _271 = isnan(_243);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = 1.0 / _259;
    bool _283 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _285 = 1.0 / _267;
    float _287 = 1.0 / _263;
    float _289 = _247 * _281;
    bool _291 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _293 = isnan(_243);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = -_279;
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
    float _331 = _321 * _325;
    float _333 = -_321;
    float _335 = _333 + 1.0;
    float _337 = _255 * _287;
    bool _339 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _341 = isnan(_243);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _351;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _361 = _359 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _363 = fma(_353, _289, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _365 = _349 * _335;
    float _367 = fma(_357, _289, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _369 = -_349;
    float _371 = _369 + 1.0;
    float _373 = _363 * _365;
    float _375 = _367 * _365;
    float _377 = fma(_329, _337, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _379 = fma(_361, _337, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _381 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].x, _373);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _383;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _387;
    float _391 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].y, _375);
    float _393 = fma(_377, _331, _381);
    float _395 = fma(_385, _309, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _397 = fma(_389, _309, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _399 = fma(_379, _331, _391);
    float _401 = fma(_395, _307, _393);
    float _403 = fma(_397, _307, _399);
    float _405 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[146].x, _401);
    float _407 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[146].y, _403);
    bool _409 = !_283;
    int _411 = as_type<int>(_405);
    float _429;
    if (!_409)
    {
        float _413 = in.m_62.x;
        float _415 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _417 = _413 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _419 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _421 = _419 * _415;
        float _423 = floor(_421);
        float _425 = -_423;
        float _427 = _421 + _425;
        _429 = _427;
        _431 = true;
    }
    else
    {
        _429 = _165;
    }
    _431 = false;
    float _433 = _429;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _437 = _433 + _435;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _441 = _439 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _443 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _445 = isnan(_433);
    bool _447 = _443 || _445;
    bool _449 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _451 = _447 || _449;
    float _453 = float(_451);
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _459 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _461 = isnan(_433);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _471;
    bool _475 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _477 = isnan(_433);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    float _487 = 1.0 / _441;
    float _489 = -_453;
    float _491 = _489 + 1.0;
    bool _493 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _495 = 1.0 / _457;
    float _497 = _473 * _487;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _501 = _499 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _503 = -_485;
    float _505 = _503 + 1.0;
    float _507 = fma(_497, _437, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _509 = _469 * _491;
    float _511 = -_469;
    float _513 = _511 + 1.0;
    float _515 = _453 * _505;
    float _517 = _501 * _495;
    float _519 = _507 * _509;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _523 = _433 + _521;
    float _525 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[115].x, _519);
    float _527 = fma(_517, _523, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _531 = fma(_527, _515, _525);
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _535 = _529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _537 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[117].x, _531);
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _541 = _533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _543 = in.m_64.x;
    float _545 = in.m_64.y;
    float _547 = _537 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _549 = _539 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_66.x = _535;
    out.m_66.y = _541;
    out.m_66.z = _549;
    out.m_66.w = _547;
    float _551 = _407 * _545;
    float _553 = _405 * _543;
    bool _555 = !_493;
    float _573;
    if (!_555)
    {
        float _557 = in.m_62.x;
        float _559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _561 = _557 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _563 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[11].w, _123);
        float _565 = _563 * _559;
        float _567 = floor(_565);
        float _569 = -_567;
        float _571 = _565 + _569;
        _573 = _571;
        _575 = true;
    }
    else
    {
        _573 = _165;
    }
    _575 = false;
    float _577 = _573;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _581 = _577 + _579;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _587 = _577 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _589 = isnan(_577);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _603 = _577 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _605 = isnan(_577);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _615;
    bool _619 = _577 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _621 = isnan(_577);
    bool _623 = _619 || _621;
    bool _625 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _627 = _623 || _625;
    float _629 = float(_627);
    float _631 = 1.0 / _585;
    float _633 = -_597;
    float _635 = _633 + 1.0;
    bool _637 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _639 = -_629;
    float _641 = _639 + 1.0;
    float _643 = 1.0 / _601;
    float _645 = _597 * _641;
    float _647 = _617 * _631;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _653 = fma(_647, _581, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _655 = _613 * _635;
    float _657 = -_613;
    float _659 = _657 + 1.0;
    float _661 = _651 * _643;
    float _663 = _653 * _655;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _667 = _577 + _665;
    float _669 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[131].x, _663);
    float _671 = fma(_661, _667, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _675 = fma(_671, _645, _669);
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _679 = _673 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _683 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[133].x, _675);
    float _685 = _677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _687 = _681 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _689 = _683 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_68.x = _679;
    out.m_68.y = _685;
    out.m_68.z = _687;
    out.m_68.w = _689;
    bool _691 = !_637;
    int _693 = as_type<int>(_687);
    if (!_691)
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
    float _727 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _729 = int(_727);
    float _731 = 0.0;
    if (_719)
    {
        _731 = 1.0;
    }
    float _733 = _731;
    float _735 = 0.0;
    float _737 = _733;
    if (_719)
    {
        _735 = 1.0;
    }
    float _739 = _735;
    float _741 = _739;
    if (_719)
    {
        _411 = 0;
    }
    int _743 = _411;
    float _745 = float(_723);
    float _747 = 1.0 / _725;
    int _749 = _743;
    if (_719)
    {
        _693 = 0;
    }
    int _751 = _693;
    float _753 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _755 = int(_753);
    float _757 = float(uint(_729));
    float _759 = 1.0 / _745;
    float _761 = _747 * _123;
    float _763 = 1.0 / _757;
    float _765 = float(uint(_755));
    int _767 = ~_755;
    int _769 = _767 + 1;
    float _771 = trunc(_761);
    int _773 = int(_771);
    float _775 = _759 * _123;
    float _777 = _759;
    float _779 = _725;
    int _781 = _751;
    if (_719)
    {
        float _783 = in.m_62.x;
        float _785 = in.m_62.y;
        _777 = _783;
        _779 = _785;
    }
    float _787 = _777;
    float _789 = _779;
    float _791 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _793 = int(_791);
    int _795 = as_type<int>(_763) + (-2);
    float _797 = 1.0 / _765;
    float _799 = float(uint(_773));
    float _801 = as_type<float>(_795) * _799;
    float _803 = trunc(_775);
    int _805 = int(_803);
    float _807 = float(uint(_793));
    float _809 = 0.0;
    float _811 = _787;
    float _813 = _789;
    float _815 = as_type<float>(_795);
    if (_719)
    {
        _809 = _787;
    }
    float _817 = _809;
    float _819 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _821 = int(_819);
    int _823 = as_type<int>(_797) + (-2);
    float _825 = _797;
    float _827 = _817;
    if (_719)
    {
        _825 = _789;
    }
    float _829 = _825;
    float _831 = 1.0 / _807;
    float _833 = float(uint(_805));
    float _835 = as_type<float>(_823) * _833;
    float _837 = trunc(_801);
    float _839 = precise::max(_837, 0.0);
    uint _842 = uint(_839);
    float _844 = float(_821);
    float _846 = 1.0 / _844;
    float _848 = trunc(_835);
    float _850 = precise::max(_848, 0.0);
    uint _852 = uint(_850);
    float _854 = _844;
    float _856 = _835;
    float _858 = _829;
    if (_719)
    {
        _854 = _817;
    }
    float _860 = _854;
    float _862 = _860;
    if (_719)
    {
        _856 = _817;
    }
    float _864 = _856;
    float _866 = _864;
    if (!_719)
    {
        float _868 = in.m_62.x;
        float _870 = in.m_62.y;
        float _872 = in.m_62.z;
        float _874 = _868 * 3.1415927410125732421875;
        float _876 = _874 * 0.15915493667125701904296875;
        float _878 = _870 * 3.1415927410125732421875;
        float _880 = _878 * 0.15915493667125701904296875;
        float _882 = _876 * 6.283185482025146484375;
        float _884 = sin(_882);
        float _886 = _880 * 6.283185482025146484375;
        float _888 = sin(_886);
        _737 = 7.345489978790283203125;
        _811 = _868;
        _741 = 5.839270114898681640625;
        _862 = _872;
        _827 = _870;
        _813 = _870;
        _858 = _888;
        _749 = 1;
        _781 = 2;
        _866 = _884;
    }
    float _890 = _737;
    float _892 = _811;
    float _894 = _741;
    float _896 = _862;
    float _898 = _827;
    float _900 = _813;
    float _902 = _858;
    int _904 = _749;
    int _906 = _781;
    float _908 = _866;
    int _910 = _769 * int(_852);
    int _912 = _910 + _805;
    float _914 = _890 * _892;
    float _916 = _894 * _896;
    float _918 = in.m_62.z;
    float _920 = in.m_62.w;
    float _922 = _890 * _898;
    float _924 = float(uint(_912));
    float _926 = floor(_914);
    float _928 = _846 * _123;
    float _930 = _892 * 2.0;
    float _932 = as_type<float>(_823) * _924;
    int _934 = ~_729;
    int _936 = _934 + 1;
    float _938 = float(_805);
    float _940 = trunc(_932);
    float _942 = precise::max(_940, 0.0);
    uint _944 = uint(_942);
    float _946 = float(_755);
    int _948 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _950 = _948 != 0;
    int _952 = _936 * int(_842);
    int _954 = _952 + _773;
    bool _956 = _900 > 0.5;
    float _958 = floor(_916);
    float _960 = -_926;
    float _962 = _914 + _960;
    int _964 = ~_729;
    int _966 = _964 + 1;
    float _968 = float(uint(_954));
    bool _970 = _920 > 0.5;
    float _972 = trunc(_928);
    int _974 = int(_972);
    float _976 = as_type<float>(_795) * _968;
    int _978 = int(_852) + int(_944);
    int _980 = as_type<int>(_831) + (-2);
    bool _982 = _918 > 0.5;
    float _984 = trunc(_976);
    float _986 = precise::max(_984, 0.0);
    uint _988 = uint(_986);
    float _990 = -_958;
    float _992 = _916 + _990;
    int _994 = ~_755;
    int _996 = _994 + 1;
    bool _998 = _938 >= _946;
    bool _1000 = isnan(_938);
    bool _1002 = _998 || _1000;
    bool _1004 = isnan(_946);
    bool _1006 = _1002 || _1004;
    float _1008 = float(_1006);
    int _1010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1012 = _1010 != 0;
    int _1014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1016 = _1014 != 0;
    int _1018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1020 = _1018 != 0;
    int _1022 = _996 * _978;
    int _1024 = _1022 + _805;
    float _1026 = float(uint(_974));
    float _1028 = floor(_922);
    float _1030 = -_201;
    int _1032 = _956 ? as_type<int>(_1030) : as_type<int>(_201);
    float _1034 = as_type<float>(_980) * _1026;
    float _1036 = -_211;
    int _1038 = _982 ? as_type<int>(_1036) : as_type<int>(_211);
    int _1040 = int(_842) + int(_988);
    float _1042 = trunc(_1034);
    float _1044 = precise::max(_1042, 0.0);
    uint _1046 = uint(_1044);
    float _1048 = _962 * _946;
    int _1050 = int(_970);
    int _1052 = _982 ? 2 : 0;
    int _1054 = _1050 | _1052;
    int _1056 = _950 ? 4 : 0;
    int _1058 = _1054 | _1056;
    int _1060 = _1012 ? 8 : 0;
    int _1062 = _1058 | _1060;
    int _1064 = _1016 ? 16 : 0;
    int _1066 = _1062 | _1064;
    int _1068 = _1020 ? 32 : 0;
    int _1070 = _1066 | _1068;
    int _1072 = _956 ? 64 : 0;
    int _1074 = _1070 | _1072;
    int _1076 = _1074 & 64;
    bool _1078 = !_1016;
    float _1080 = _1078 ? _201 : as_type<float>(_1032);
    float _1082 = float(_729);
    float _1084 = trunc(_1008);
    int _1086 = int(_1084);
    float _1088 = float(_773);
    float _1090 = _992 * _1082;
    int _1092 = ~_793;
    int _1094 = _1092 + 1;
    int _1096 = _966 * _1040;
    int _1098 = _1096 + _773;
    bool _1100 = !_950;
    int _1102 = _1100 ? 0 : 1;
    float _1104 = trunc(_1048);
    int _1106 = int(_1104);
    bool _1108 = !_1020;
    float _1110 = _1108 ? _211 : as_type<float>(_1038);
    int _1112 = _1094 * int(_1046);
    int _1114 = _1112 + _974;
    int _1116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1118 = _1116 != 0;
    int _1120 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1122 = _1120 != 0;
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1126 = _1124 != 0;
    bool _1128 = uint(_1024) >= uint(_755);
    bool _1130 = _1088 >= _1082;
    bool _1132 = isnan(_1088);
    bool _1134 = _1130 || _1132;
    bool _1136 = isnan(_1082);
    bool _1138 = _1134 || _1136;
    float _1140 = float(_1138);
    float _1142 = trunc(_1090);
    int _1144 = int(_1142);
    bool _1146 = !_1122;
    int _1148 = _1146 ? 0 : 1;
    bool _1150 = !_1118;
    int _1152 = _1150 ? 0 : 1;
    int _1154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1156 = _1154 != 0;
    bool _1158 = uint(_1098) >= uint(_729);
    float _1160 = trunc(_1140);
    int _1162 = int(_1160);
    bool _1164 = !_1128;
    int _1166 = _1164 ? 0 : (-1);
    bool _1168 = !_1126;
    int _1170 = _1168 ? 0 : 1;
    bool _1172 = !_1156;
    int _1174 = _1172 ? 0 : 1;
    bool _1176 = !_1158;
    int _1178 = _1176 ? 0 : (-1);
    float _1180 = floor(_930);
    float _1182 = -_1028;
    float _1184 = _922 + _1182;
    float _1186 = float(uint(_1114));
    int _1188 = abs(_1102);
    int _1190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1192 = _1190 != 0;
    int _1194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1196 = _1194 != 0;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1200 = _1198 != 0;
    float _1202 = as_type<float>(_980) * _1186;
    int _1204 = ~_978;
    int _1206 = _1204 + _1166;
    int _1208 = _1206 + 1;
    int _1210 = _1106 * _1188;
    int _1212 = _1210 + _805;
    int _1214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1216 = _1214 != 0;
    int _1218 = ~_1040;
    int _1220 = _1218 + _1178;
    int _1222 = _1220 + 1;
    int _1224 = _755 * _1208;
    int _1226 = _1224 + _805;
    bool _1228 = !_1196;
    int _1230 = _1228 ? 0 : 1;
    float _1232 = trunc(_1202);
    float _1234 = precise::max(_1232, 0.0);
    uint _1236 = uint(_1234);
    bool _1238 = !_1216;
    int _1240 = _1238 ? 0 : 1;
    int _1242 = _729 * _1222;
    int _1244 = _1242 + _773;
    bool _1246 = _1076 != 0;
    float _1248 = _161 * _123;
    bool _1250 = _755 == 0;
    bool _1252 = !_1192;
    int _1254 = _1252 ? 0 : 1;
    float _1256 = _946 * _1248;
    bool _1258 = _729 == 0;
    float _1260 = _1082 * _1248;
    int _1262 = ~_1086;
    int _1264 = _1262 + 1;
    int _1266 = _1264 + 1;
    bool _1268 = !_1250;
    int _1270 = _1268 ? _1226 : (-1);
    float _1272 = trunc(_1256);
    int _1274 = int(_1272);
    int _1276 = ~_1162;
    int _1278 = _1276 + 1;
    int _1280 = _1278 + 1;
    bool _1282 = !_1258;
    int _1284 = _1282 ? _1244 : (-1);
    int _1286 = _1270 * _1266;
    int _1288 = _755 + (-1);
    int _1290 = abs(_1148);
    int _1292 = _1284 * _1280;
    int _1294 = _729 + (-1);
    int _1296 = _1086 * _1288;
    int _1298 = _1296 + _1286;
    int _1300 = abs(_1230);
    float _1302 = trunc(_1260);
    int _1304 = int(_1302);
    int _1306 = abs(_1240);
    int _1308 = _1162 * _1294;
    int _1310 = _1308 + _1292;
    int _1312 = _1298 * _1290;
    int _1314 = abs(_1152);
    int _1316 = _1144 * _1306;
    int _1318 = _1316 + _773;
    int _1320 = ~_793;
    int _1322 = _1320 + 1;
    int _1324 = _1310 * _1300;
    int _1326 = abs(_1170);
    int _1328 = _1274 * _1314;
    int _1330 = _1328 + _1312;
    int _1332 = abs(_1174);
    int _1334 = _1212 * _1326;
    int _1336 = _1334 + _1330;
    int _1338 = int(_1046) + int(_1236);
    int _1340 = abs(_1254);
    int _1342 = _1322 * _1338;
    int _1344 = _1342 + _974;
    float _1346 = -_211;
    int _1348 = _970 ? as_type<int>(_1346) : as_type<int>(_211);
    int _1350 = _1106 * _1332;
    int _1352 = _1350 + _1336;
    float _1354 = -_201;
    int _1356 = _982 ? as_type<int>(_1354) : as_type<int>(_201);
    int _1358 = _1304 * _1340;
    int _1360 = _1358 + _1324;
    bool _1362 = uint(_1344) >= uint(_793);
    float _1364 = float(uint(_1352));
    float _1366 = float(_793);
    float _1368 = float(_974);
    float _1370 = as_type<float>(_823) * _1364;
    int _1372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1374 = _1372 != 0;
    float _1376 = _1366 * _1248;
    bool _1378 = !_1200;
    int _1380 = _1378 ? 0 : 1;
    float _1382 = trunc(_1370);
    float _1384 = precise::max(_1382, 0.0);
    uint _1386 = uint(_1384);
    bool _1388 = _1368 >= _1366;
    bool _1390 = isnan(_1368);
    bool _1392 = _1388 || _1390;
    bool _1394 = isnan(_1366);
    bool _1396 = _1392 || _1394;
    float _1398 = float(_1396);
    float _1400 = _1184 * _1366;
    int _1402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1404 = _1402 != 0;
    float _1406 = _900 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1408 = !_1374;
    int _1410 = _1408 ? 0 : 1;
    int _1412 = abs(_1380);
    float _1414 = trunc(_1398);
    int _1416 = int(_1414);
    bool _1418 = !_1012;
    float _1420 = _1418 ? _211 : as_type<float>(_1348);
    bool _1422 = !_1404;
    int _1424 = _1422 ? 0 : 1;
    int _1426 = abs(_1410);
    float _1428 = trunc(_1376);
    int _1430 = int(_1428);
    bool _1432 = !_1362;
    int _1434 = _1432 ? 0 : (-1);
    int _1436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1438 = _1436 != 0;
    int _1440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1442 = _1440 != 0;
    int _1444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1446 = _1444 != 0;
    int _1448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1450 = _1448 != 0;
    int _1452 = _1318 * _1412;
    int _1454 = _1452 + _1360;
    int _1456 = ~_1338;
    int _1458 = _1456 + _1434;
    int _1460 = _1458 + 1;
    bool _1462 = !_1442;
    int _1464 = _1462 ? 0 : 1;
    int _1466 = _1144 * _1426;
    int _1468 = _1466 + _1454;
    int _1470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1472 = _1470 != 0;
    int _1474 = _793 * _1460;
    int _1476 = _1474 + _974;
    int _1478 = ~_755;
    int _1480 = _1478 + 1;
    float _1482 = trunc(_1400);
    int _1484 = int(_1482);
    float _1486 = float(uint(_1468));
    bool _1488 = !_1438;
    int _1490 = _1488 ? 0 : 1;
    int _1492 = _1480 * int(_1386);
    int _1494 = _1492 + _1352;
    bool _1496 = _793 == 0;
    float _1498 = as_type<float>(_795) * _1486;
    int _1500 = ~_1416;
    int _1502 = _1500 + 1;
    int _1504 = _1502 + 1;
    float _1506 = float(uint(_1494));
    float _1508 = _1486;
    float _1510 = as_type<float>(_904);
    if (_1472)
    {
        float _1512 = in.m_62.w;
        _1508 = _1512;
    }
    float _1514 = _1508;
    bool _1516 = !_1496;
    int _1518 = _1516 ? _1476 : (-1);
    float _1520 = trunc(_1498);
    float _1522 = precise::max(_1520, 0.0);
    uint _1524 = uint(_1522);
    int _1526 = abs(_1464);
    float _1528 = as_type<float>(_823) * _1506;
    int _1530 = abs(_1424);
    int _1532 = _1518 * _1504;
    int _1534 = _793 + (-1);
    int _1536 = abs(_1490);
    float _1538 = trunc(_1528);
    float _1540 = precise::max(_1538, 0.0);
    uint _1542 = uint(_1540);
    int _1544 = _1416 * _1534;
    int _1546 = _1544 + _1532;
    int _1548 = _1546 * _1526;
    int _1550 = ~_729;
    int _1552 = _1550 + 1;
    int _1554 = _1484 * _1530;
    int _1556 = _1554 + _974;
    bool _1558 = _755 == 0;
    int _1560 = _1430 * _1536;
    int _1562 = _1560 + _1548;
    bool _1564 = !_1446;
    int _1566 = _1564 ? 0 : 1;
    int _1568 = _1552 * int(_1524);
    int _1570 = _1568 + _1468;
    int _1572 = ~_755;
    int _1574 = _1572 + 1;
    float _1576 = as_type<float>(_1530);
    if (_1472)
    {
        float _1578 = _1514 * 3.1415927410125732421875;
        _1576 = _1578;
    }
    float _1580 = _1576;
    int _1582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1584 = _1582 != 0;
    int _1586 = int(_1386) + int(_1542);
    float _1588 = _1580;
    if (_1472)
    {
        float _1590 = _1580 * 0.15915493667125701904296875;
        _1588 = _1590;
    }
    float _1592 = _1588;
    int _1594 = abs(_1566);
    bool _1596 = !_1450;
    int _1598 = _1596 ? 0 : 1;
    int _1600 = _1574 * _1586;
    int _1602 = _1600 + _1352;
    float _1604 = float(uint(_1570));
    float _1606 = _1592;
    if (_1472)
    {
        float _1608 = _1592 * 6.283185482025146484375;
        float _1610 = sin(_1608);
        _1606 = _1610;
    }
    float _1612 = _1606;
    int _1614 = abs(_1598);
    int _1616 = _1556 * _1594;
    int _1618 = _1616 + _1562;
    bool _1620 = uint(_1602) >= uint(_755);
    float _1622 = as_type<float>(_795) * _1604;
    float _1624 = as_type<float>(_1526);
    if (_1584)
    {
        float _1626 = in.m_62.x;
        _1624 = _1626;
    }
    float _1628 = _1624;
    float _1630 = float(uint(_1212));
    bool _1632 = !_1620;
    int _1634 = _1632 ? 0 : (-1);
    float _1636 = trunc(_1622);
    float _1638 = precise::max(_1636, 0.0);
    uint _1640 = uint(_1638);
    int _1642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1644 = _1642 != 0;
    float _1646 = as_type<float>(_823) * _1630;
    int _1648 = ~_1586;
    int _1650 = _1648 + _1634;
    int _1652 = _1650 + 1;
    int _1654 = _1484 * _1614;
    int _1656 = _1654 + _1618;
    bool _1658 = !_1644;
    float _1660 = _1658 ? _201 : as_type<float>(_1356);
    bool _1662 = _1644;
    if (_1472)
    {
        bool _1664 = _1612 > 0.5;
        _1662 = _1664;
    }
    bool _1666 = _1662;
    int _1668 = _755 * _1652;
    int _1670 = _1668 + _1352;
    float _1672 = trunc(_1646);
    float _1674 = precise::max(_1672, 0.0);
    uint _1676 = uint(_1674);
    float _1678 = float(uint(_1656));
    float _1680 = 0.0;
    float _1682 = _1678;
    if (!_1472)
    {
        _1680 = _201;
    }
    float _1684 = _1680;
    bool _1686 = !_1558;
    int _1688 = _1686 ? _1670 : (-1);
    float _1690 = as_type<float>(_980) * _1678;
    int _1692 = ~_755;
    int _1694 = _1692 + 1;
    float _1696 = _1684;
    if (_1472)
    {
        float _1698 = -_201;
        float _1700 = _1666 ? _1698 : _201;
        _1696 = _1700;
    }
    float _1702 = _1696;
    float _1704 = trunc(_1690);
    float _1706 = precise::max(_1704, 0.0);
    uint _1708 = uint(_1706);
    int _1710 = int(_1524) + int(_1640);
    if (_1584)
    {
        float _1712 = _1628 * 3.1415927410125732421875;
        _1682 = _1712;
    }
    float _1714 = _1682;
    int _1716 = _1688 & 3;
    bool _1718 = _1716 != 0;
    int _1720 = _1688 & 3;
    bool _1722 = _1720 != 0;
    float _1724 = _1714;
    if (_1584)
    {
        float _1726 = _1714 * 0.15915493667125701904296875;
        _1724 = _1726;
    }
    float _1728 = _1724;
    int _1730 = _1718 ? 0 : 1;
    bool _1732 = uint(_1720) > 1u;
    int _1734 = _1694 * int(_1676);
    int _1736 = _1734 + _1212;
    float _1738 = float(uint(_1318));
    float _1740 = _1728;
    if (_1584)
    {
        float _1742 = _1728 * 6.283185482025146484375;
        float _1744 = sin(_1742);
        _1740 = _1744;
    }
    float _1746 = _1740;
    int _1748 = ~_729;
    int _1750 = _1748 + 1;
    float _1752 = float(uint(_1736));
    float _1754 = as_type<float>(_795) * _1738;
    int _1756 = ~_793;
    int _1758 = _1756 + 1;
    float _1760 = trunc(_1754);
    float _1762 = precise::max(_1760, 0.0);
    uint _1764 = uint(_1762);
    int _1766 = ~_1730;
    int _1768 = _1766 + 1;
    int _1770 = _1768 + 1;
    float _1772 = as_type<float>(_823) * _1752;
    int _1774 = _1770;
    if (!_1732)
    {
        int _1776 = ~_1730;
        int _1778 = _1776 + 1;
        _1774 = _1778;
    }
    int _1780 = _1774;
    int _1782 = _1750 * _1710;
    int _1784 = _1782 + _1468;
    float _1786 = -_211;
    int _1788 = _1246 ? as_type<int>(_1786) : as_type<int>(_211);
    int _1790 = _1758 * int(_1708);
    int _1792 = _1790 + _1656;
    bool _1794 = uint(_1720) >= 2u;
    float _1796 = trunc(_1772);
    float _1798 = precise::max(_1796, 0.0);
    uint _1800 = uint(_1798);
    bool _1802 = uint(_1784) >= uint(_729);
    float _1804 = float(uint(_1792));
    int _1806 = _1794 ? 0 : 1;
    bool _1808 = _1720 != 3;
    float _1810 = as_type<float>(_980) * _1804;
    int _1812 = ~_729;
    int _1814 = _1812 + 1;
    bool _1816 = !_1802;
    int _1818 = _1816 ? 0 : (-1);
    float _1820 = trunc(_1810);
    float _1822 = precise::max(_1820, 0.0);
    uint _1824 = uint(_1822);
    int _1826 = ~_1806;
    int _1828 = _1826 + 1;
    int _1830 = _1828 + 1;
    int _1832 = _1814 * int(_1764);
    int _1834 = _1832 + _1318;
    int _1836 = ~_1710;
    int _1838 = _1836 + _1818;
    int _1840 = _1838 + 1;
    float _1842 = float(uint(_1834));
    int _1844 = _729 * _1840;
    int _1846 = _1844 + _1468;
    int _1848 = _1830;
    bool _1850 = _1808;
    float _1852 = as_type<float>(_1764);
    if (_1808)
    {
        int _1854 = ~_1806;
        int _1856 = _1854 + 1;
        _1848 = _1856;
    }
    int _1858 = _1848;
    if (_1584)
    {
        bool _1860 = _1746 > 0.5;
        _1850 = _1860;
    }
    bool _1862 = _1850;
    float _1864 = as_type<float>(_795) * _1842;
    bool _1866 = !_1258;
    int _1868 = _1866 ? _1846 : (-1);
    if (!_1584)
    {
        _815 = _211;
    }
    float _1870 = _815;
    int _1872 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1874 = _1872 != 0;
    float _1876 = trunc(_1864);
    float _1878 = precise::max(_1876, 0.0);
    uint _1880 = uint(_1878);
    float _1882 = _1870;
    if (_1584)
    {
        float _1884 = -_211;
        float _1886 = _1862 ? _1884 : _211;
        _1882 = _1886;
    }
    float _1888 = _1882;
    int _1890 = _1868 & 3;
    bool _1892 = _1890 != 0;
    bool _1894 = !_1874;
    float _1896 = _1894 ? _211 : as_type<float>(_1788);
    int _1898 = int(_1676) + int(_1800);
    bool _1900 = uint(_1890) > 1u;
    int _1902 = int(_1708) + int(_1824);
    float _1904 = _892 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1906 = ~_793;
    int _1908 = _1906 + 1;
    int _1910 = _1868 & 3;
    bool _1912 = _1910 != 0;
    int _1914 = ~_755;
    int _1916 = _1914 + 1;
    int _1918 = _1908 * _1902;
    int _1920 = _1918 + _1656;
    int _1922 = _1912 ? 0 : 1;
    int _1924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1926 = _1924 != 0;
    int _1928 = _1916 * _1898;
    int _1930 = _1928 + _1212;
    float _1932 = float(uint(_1556));
    bool _1934 = !_1926;
    int _1936 = _1934 ? 0 : 1;
    bool _1938 = uint(_1920) >= uint(_793);
    float _1940 = as_type<float>(_980) * _1932;
    int _1942 = ~_1922;
    int _1944 = _1942 + 1;
    int _1946 = _1944 + 1;
    int _1948 = _1946;
    if (!_1900)
    {
        int _1950 = ~_1922;
        int _1952 = _1950 + 1;
        _1948 = _1952;
    }
    int _1954 = _1948;
    float _1956 = trunc(_1940);
    float _1958 = precise::max(_1956, 0.0);
    uint _1960 = uint(_1958);
    bool _1962 = uint(_1930) >= uint(_755);
    bool _1964 = !_1938;
    int _1966 = _1964 ? 0 : (-1);
    bool _1968 = _1890 != 3;
    bool _1970 = !_1962;
    int _1972 = _1970 ? 0 : (-1);
    bool _1974 = uint(_1890) >= 2u;
    int _1976 = ~_1902;
    int _1978 = _1976 + _1966;
    int _1980 = _1978 + 1;
    int _1982 = ~_729;
    int _1984 = _1982 + 1;
    int _1986 = int(_1764) + int(_1880);
    int _1988 = _793 * _1980;
    int _1990 = _1988 + _1656;
    int _1992 = ~_793;
    int _1994 = _1992 + 1;
    int _1996 = _1974 ? 0 : 1;
    int _1998 = _1984 * _1986;
    int _2000 = _1998 + _1318;
    int _2002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2004 = _2002 != 0;
    int _2006 = ~_1996;
    int _2008 = _2006 + 1;
    int _2010 = _2008 + 1;
    int _2012 = _2010;
    float _2014 = as_type<float>(_1994);
    int _2016 = _1954;
    if (_1968)
    {
        int _2018 = ~_1996;
        int _2020 = _2018 + 1;
        _2012 = _2020;
    }
    int _2022 = _2012;
    int _2024 = _1994 * int(_1960);
    int _2026 = _2024 + _1556;
    int _2028 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2030 = _2028 != 0;
    bool _2032 = !_2004;
    int _2034 = _2032 ? 0 : 1;
    bool _2036 = uint(_2000) >= uint(_729);
    bool _2038 = !_1496;
    int _2040 = _2038 ? _1990 : (-1);
    bool _2042 = !_2030;
    int _2044 = _2042 ? 0 : 1;
    bool _2046 = !_2036;
    int _2048 = _2046 ? 0 : (-1);
    int _2050 = _2040 & 3;
    bool _2052 = _2050 != 0;
    float _2054 = float(uint(_2026));
    int _2056 = _2040 & 3;
    bool _2058 = _2056 != 0;
    int _2060 = _2052 ? 0 : 1;
    float _2062 = as_type<float>(_980) * _2054;
    bool _2064 = uint(_2056) > 1u;
    int _2066 = ~_2060;
    int _2068 = _2066 + 1;
    int _2070 = _2068 + 1;
    float _2072 = trunc(_2062);
    float _2074 = precise::max(_2072, 0.0);
    uint _2076 = uint(_2074);
    float _2078 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2080 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2082 = -_2078;
    float _2084 = fma(_1904, 2.0, _2082);
    int _2086 = _2070;
    float _2088 = as_type<float>(_1960);
    if (!_2064)
    {
        int _2090 = ~_2060;
        int _2092 = _2090 + 1;
        _2086 = _2092;
    }
    int _2094 = _2086;
    float _2096 = fma(_1406, -2.0, _2080);
    bool _2098 = uint(_2056) >= 2u;
    float _2100 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _2102 = ~_793;
    int _2104 = _2102 + 1;
    float _2106 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _2108 = _2098 ? 0 : 1;
    float _2110 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _2112 = _2056 != 3;
    float _2114 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2106);
    int _2116 = int(_1960) + int(_2076);
    float _2118 = _902 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _2120 = ~_2108;
    int _2122 = _2120 + 1;
    int _2124 = _2122 + 1;
    float _2126 = -_123;
    float _2128 = fma(_2126, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2084);
    int _2130 = _2104 * _2116;
    int _2132 = _2130 + _1556;
    float _2134 = fma(_2118, -2.0, _2110);
    float _2136 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2138 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2114);
    int _2140 = _2124;
    float _2142 = as_type<float>(_2132);
    if (_2112)
    {
        int _2144 = ~_2108;
        int _2146 = _2144 + 1;
        _2140 = _2146;
    }
    int _2148 = _2140;
    float _2150 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2152 = uint(_2132) >= uint(_793);
    float _2154 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2156 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2096);
    bool _2158 = !_2152;
    int _2160 = _2158 ? 0 : (-1);
    float _2162 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2134);
    bool _2164 = _892 > 0.5;
    float _2166 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2168 = -_201;
    int _2170 = _2164 ? as_type<int>(_2168) : as_type<int>(_201);
    bool _2172 = _904 != 1;
    float _2174 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2176 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2178 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2180 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2182 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2184 = _2182 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    if (!_2172)
    {
        _2088 = _900;
    }
    float _2186 = _2088;
    float _2188 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2190 = _2188 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2192 = 0.0;
    float _2194 = _2186;
    if (!_2172)
    {
        _2192 = _900;
    }
    float _2196 = _2192;
    float _2198 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2178);
    float _2200 = _2196;
    if (!_2172)
    {
        _1510 = _918;
    }
    float _2202 = _1510;
    float _2204 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2180);
    float _2206 = _2202;
    if (!_2172)
    {
        _1852 = _918;
    }
    float _2208 = _1852;
    float _2210 = 1.0 / _2184;
    float _2212 = _2208;
    if (_2172)
    {
        _2194 = _892;
    }
    float _2214 = _2194;
    float _2216 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2218 = _2216 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    if (_2172)
    {
        _2200 = _892;
    }
    float _2220 = _2200;
    if (_2172)
    {
        _2206 = _900;
    }
    float _2222 = _2206;
    float _2224 = _2214 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2172)
    {
        _2212 = _900;
    }
    float _2226 = _2212;
    float _2228 = 1.0 / _2190;
    bool _2230 = _906 != 2;
    float _2232 = -_2150;
    float _2234 = fma(_2224, 2.0, _2232);
    float _2236 = _2222 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2238 = fma(_2226, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2174);
    float _2240 = -_123;
    float _2242 = fma(_2240, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2234);
    float _2244 = fma(_2236, -2.0, _2166);
    float _2246 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2248 = _2246 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2250 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2238);
    float _2252 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2244);
    float _2254 = 1.0 / _2218;
    if (_2230)
    {
        _2142 = _892;
    }
    float _2256 = _2142;
    float _2258 = -_2250;
    float _2260 = _2258 + 1.0;
    float _2262 = _2256;
    if (_2230)
    {
        _2014 = _900;
    }
    float _2264 = _2014;
    float _2266 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2268 = _2266 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2270 = _2264;
    if (!_2230)
    {
        _2262 = _918;
    }
    float _2272 = _2262;
    if (!_2230)
    {
        _2270 = _892;
    }
    float _2274 = _2270;
    float _2276 = 1.0 / _2248;
    int _2278 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2280 = _2278 != 0;
    float _2282 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2136);
    float _2284 = _908 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2286 = _2272 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _2288 = !_2280;
    float _2290 = _2288 ? _201 : as_type<float>(_2170);
    float _2292 = _2274 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2294 = -_2100;
    float _2296 = fma(_2284, 2.0, _2294);
    float _2298 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2300 = log2(_2298);
    float _2302 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _2304 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2306 = isnan(0.0);
    bool _2308 = _2304 || _2306;
    bool _2310 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2312 = _2308 || _2310;
    float _2314 = -_2154;
    float _2316 = fma(_2286, 2.0, _2314);
    float _2318 = fma(_2220, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2302);
    float _2320 = fma(_2292, -2.0, _2176);
    float _2322 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2324 = -_123;
    float _2326 = fma(_2324, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2296);
    float _2328 = _900 * 2.0;
    float _2330 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2198);
    float _2332 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2334 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2322);
    float _2336 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2282);
    float _2338 = _2300 * _123;
    float _2340 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2332);
    float _2342 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2334);
    float _2344 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2204);
    float _2346 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2318);
    float _2348 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2340);
    float _2350 = exp2(_2338);
    float _2352 = -_123;
    float _2354 = fma(_2352, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2316);
    float _2356 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2320);
    float _2358 = _900 + _892;
    float _2360 = -_2336;
    float _2362 = _2360 + 1.0;
    int _2364 = ~_1986;
    int _2366 = _2364 + _2048;
    int _2368 = _2366 + 1;
    float _2370 = floor(_2328);
    float _2372 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2374 = _2372 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2376 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2378 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2376;
    float _2380 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2382 = _2380 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _2384 = _729 * _2368;
    int _2386 = _2384 + _1318;
    bool _2388 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2390 = isnan(_711);
    bool _2392 = _2388 || _2390;
    bool _2394 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2396 = _2392 || _2394;
    float _2398 = float(_2396);
    float _2400 = _2378 * _2228;
    float _2402 = _918 * 2.0;
    float _2404 = -_2350;
    float _2406 = _2404 + 1.0;
    float _2408 = 1.0 / _2268;
    float _2410 = in.m_48.x;
    float _2412 = in.m_48.y;
    float _2414 = in.m_48.z;
    float _2416 = _2358 + (-1.0);
    float _2418 = _2312 ? _2406 : 0.0;
    float _2420 = -_2342;
    float _2422 = _2420 + 1.0;
    bool _2424 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2426 = isnan(1.0);
    bool _2428 = _2424 || _2426;
    bool _2430 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2432 = _2428 || _2430;
    float _2434 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2436 = 1.0 + _2434;
    float _2438 = floor(_2402);
    float _2440 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2442 = _2440 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _2444 = _1868 >> 31;
    float _2446 = -_2348;
    float _2448 = _2446 + 1.0;
    int _2450 = ~_1898;
    int _2452 = _2450 + _1972;
    int _2454 = _2452 + 1;
    float _2456 = -_2344;
    float _2458 = _2456 + 1.0;
    int _2460 = _2444 & 3;
    float _2462 = 1.0 / _2436;
    float _2464 = _2382 * _2408;
    int _2466 = _755 * _2454;
    int _2468 = _2466 + _1212;
    int _2470 = _1868 + _2460;
    int _2472 = abs(_2148);
    float _2474 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2476 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2474;
    float _2478 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2480 = _711 + _2478;
    float _2482 = _2412 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2484 = 1.0 / _2442;
    int _2486 = _2470 >> 2;
    float _2488 = fma(_2410, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2482);
    bool _2490 = !_1892;
    int _2492 = _2490 ? 0 : 1;
    if (_2432)
    {
        float _2494 = _2418 * _2462;
        _133 = _2494;
    }
    float _2496 = _133;
    bool _2498 = _1180 >= 0.0;
    bool _2500 = isnan(_1180);
    bool _2502 = _2498 || _2500;
    bool _2504 = isnan(0.0);
    bool _2506 = _2502 || _2504;
    float _2508 = _2412 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2510 = _2412 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _2512 = _2506 ? 0 : 1;
    float _2514 = fma(_2410, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2508);
    bool _2516 = _1180 > 0.0;
    float _2518 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2520 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2518;
    float _2522 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2524 = _2522 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2526 = fma(_2410, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2510);
    float _2528 = fma(_2414, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2514);
    float _2530 = _2520 * _2210;
    float _2532 = _2524 * _2276;
    float _2534 = 1.0 / _2374;
    int _2536 = ~_2512;
    int _2538 = _2536 + 1;
    int _2540 = _2538 + 1;
    float _2542 = fma(_2530, _2480, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2544 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2546 = isnan(_711);
    bool _2548 = _2544 || _2546;
    bool _2550 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2552 = _2548 || _2550;
    float _2554 = float(_2552);
    float _2556 = _2528 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2558 = _2486 << 4;
    int _2560 = _2558 + 656;
    float _2562 = _2476 * _2484;
    int _2564 = _2540;
    if (!_2516)
    {
        int _2566 = ~_2512;
        int _2568 = _2566 + 1;
        _2564 = _2568;
    }
    int _2570 = _2564;
    float _2572 = -_2554;
    float _2574 = _2572 + 1.0;
    bool _2576 = _2370 >= 0.0;
    bool _2578 = isnan(_2370);
    bool _2580 = _2576 || _2578;
    bool _2582 = isnan(0.0);
    bool _2584 = _2580 || _2582;
    bool _2586 = !_1258;
    int _2588 = _2586 ? _2386 : (-1);
    int _2590 = _2584 ? 0 : 1;
    bool _2592 = _2370 > 0.0;
    float _2594 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2596 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2594;
    float _2598 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2600 = _2598 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _2602 = ~_2590;
    int _2604 = _2602 + 1;
    int _2606 = _2604 + 1;
    float _2608 = _2596 * _2254;
    bool _2610 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2612 = isnan(_711);
    bool _2614 = _2610 || _2612;
    bool _2616 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2618 = _2614 || _2616;
    float _2620 = float(_2618);
    float _2622 = _2600 * _2534;
    bool _2624 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2626 = isnan(_711);
    bool _2628 = _2624 || _2626;
    bool _2630 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2632 = _2628 || _2630;
    float _2634 = float(_2632);
    bool _2636 = !_1722;
    int _2638 = _2636 ? 0 : 1;
    float _2640 = -_2620;
    float _2642 = _2640 + 1.0;
    int _2644 = abs(_2492);
    float _2646 = -_2634;
    float _2648 = _2646 + 1.0;
    int _2650 = _2606;
    if (!_2592)
    {
        int _2652 = ~_2590;
        int _2654 = _2652 + 1;
        _2650 = _2654;
    }
    int _2656 = _2650;
    float _2658 = _2398 * _2642;
    int _2660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2662 = _2660 != 0;
    int _2664 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2666 = _2664 != 0;
    int _2668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2670 = _2668 != 0;
    float _2672 = -_2398;
    float _2674 = _2672 + 1.0;
    bool _2676 = _2438 >= 0.0;
    bool _2678 = isnan(_2438);
    bool _2680 = _2676 || _2678;
    bool _2682 = isnan(0.0);
    bool _2684 = _2680 || _2682;
    float _2686 = _2620 * _2648;
    bool _2688 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2690 = isnan(_711);
    bool _2692 = _2688 || _2690;
    bool _2694 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2696 = _2692 || _2694;
    float _2698 = float(_2696);
    int _2700 = _2684 ? 0 : 1;
    bool _2702 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2704 = isnan(_711);
    bool _2706 = _2702 || _2704;
    bool _2708 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2710 = _2706 || _2708;
    float _2712 = float(_2710);
    float _2714 = -_2698;
    float _2716 = _2714 + 1.0;
    bool _2718 = _2438 > 0.0;
    float _2720 = _2698 * _2674;
    float _2722 = fma(_2414, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2488);
    float _2724 = fma(_2414, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2526);
    float _2726 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2728 = _711 + _2726;
    float _2730 = _2712 * _2716;
    float _2732 = -_2712;
    float _2734 = _2732 + 1.0;
    bool _2736 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2738 = isnan(_711);
    bool _2740 = _2736 || _2738;
    bool _2742 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2744 = _2740 || _2742;
    float _2746 = float(_2744);
    float _2748 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2750 = _711 + _2748;
    float _2752 = fma(_2532, _2728, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2754 = _2554 * _2734;
    bool _2756 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2758 = isnan(_711);
    bool _2760 = _2756 || _2758;
    bool _2762 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2764 = _2760 || _2762;
    float _2766 = float(_2764);
    float _2768 = fma(_2400, _2750, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2770 = -_2746;
    float _2772 = _2770 + 1.0;
    float _2774 = _2746 * _2574;
    float _2776 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2778 = _711 + _2776;
    float _2780 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2782 = _711 + _2780;
    float _2784 = _2766 * _2772;
    float _2786 = -_2766;
    float _2788 = _2786 + 1.0;
    float _2790 = fma(_2464, _2778, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2792 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2794 = _711 + _2792;
    float _2796 = _2542 * _2784;
    float _2798 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2800 = _711 + _2798;
    float _2802 = _2722 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2804 = fma(_2622, _2794, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2806 = fma(_2788, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2796);
    float _2808 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2810 = _2556 + _2808;
    uint _2812 = uint(int(uint(_2560) >> uint(2)));
    uint _2814 = uint(int(uint(int(_2812)) >> uint(2)));
    int _2816 = int(_2812) & 3;
    float _2818 = (*spvDescriptorSet0.vp_c9)._m0[int(_2814)][_2816];
    int _2820 = int(_2812) + 1;
    uint _2822 = uint(int(uint(_2820) >> uint(2)));
    int _2824 = _2820 & 3;
    float _2826 = (*spvDescriptorSet0.vp_c9)._m0[int(_2822)][_2824];
    float _2828 = fma(_2562, _2800, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2830 = fma(_2752, _2774, _2806);
    float _2832 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2834 = _2802 + _2832;
    float _2836 = _2810 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2838 = _2724 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _2840 = _1890 != 3;
    float _2842 = fma(_2768, _2754, _2830);
    float _2844 = fma(_2834, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2836);
    float _2846 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2848 = _2838 + _2846;
    int _2850 = ~_2700;
    int _2852 = _2850 + 1;
    int _2854 = _2852 + 1;
    float _2856 = _892 + _918;
    int _2858 = _2854;
    float _2860 = _2658;
    if (!_2718)
    {
        int _2862 = ~_2700;
        int _2864 = _2862 + 1;
        _2858 = _2864;
    }
    int _2866 = _2858;
    float _2868 = _892 + (-0.5);
    float _2870 = fma(_2848, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2844);
    float _2872 = fma(_2608, _2782, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _2874 = _2560 + 8;
    uint _2876 = uint(int(uint(_2874) >> uint(2)));
    uint _2878 = uint(int(uint(int(_2876)) >> uint(2)));
    int _2880 = int(_2876) & 3;
    float _2882 = (*spvDescriptorSet0.vp_c9)._m0[int(_2878)][_2880];
    int _2884 = int(_2876) + 1;
    uint _2886 = uint(int(uint(_2884) >> uint(2)));
    int _2888 = _2884 & 3;
    float _2890 = (*spvDescriptorSet0.vp_c9)._m0[int(_2886)][_2888];
    bool _2892 = !_2840;
    int _2894 = _2892 ? 0 : (-1);
    float _2896 = fma(_2790, _2730, _2842);
    bool _2898 = _2870 >= 0.0;
    float _2900 = _900 + _918;
    float _2902 = _900 + (-0.5);
    float _2904 = fma(_2872, _2720, _2896);
    float _2906 = _1888 + (-0.5);
    float _2908 = _1702 + 0.5;
    float _2910 = fma(_2804, _2658, _2904);
    int _2912 = abs(_1954);
    float _2914 = -_2906;
    float _2916 = -_2162;
    float _2918 = fma(_2914, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2916);
    float _2920 = fma(_2416, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2922 = _2290 + 0.5;
    float _2924 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_2898)
    {
        _2860 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2926 = _2860;
    float _2928 = _1896 + (-0.5);
    int _2930 = ~_2912;
    int _2932 = _2930 + 1;
    int _2934 = _2932 + 1;
    float _2936 = fma(_2922, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2128);
    float _2938 = fma(_2908, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2326);
    float _2940 = -_2928;
    float _2942 = -_2156;
    float _2944 = fma(_2940, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2942);
    if (_2898)
    {
        float _2946 = _2926 * 5.0;
        _2016 = as_type<int>(_2946);
    }
    int _2948 = _2016;
    float _2950 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2952 = int(_2950);
    float _2954 = fma(_2828, _2686, _2910);
    int _2956 = abs(_2022);
    float _2958 = -_2362;
    float _2960 = fma(_2958, _1702, _2938);
    if (_2898)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9430 = as_type<float>(_2948);
        out.gl_Position.z = _9430;
    }
    float _2962 = -_2138;
    float _2964 = _2962 + 1.0;
    float _2966 = fma(_2634, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2954);
    float _2968 = _2924 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2970 = _2934 * as_type<int>(_2826);
    float _2972 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2974 = fma(_2964, _1888, _2918);
    bool _2976 = !_2662;
    int _2978 = _2976 ? 0 : 1;
    out.m_70.x = _2966;
    int _2980 = ~_2644;
    int _2982 = _2980 + 1;
    int _2984 = _2982 + 1;
    float _2986 = _1660 + 0.5;
    float _2988 = _1420 + (-0.5);
    int _2990 = _2984 * as_type<int>(_2818);
    int _2992 = _2990 + _2970;
    int _2994 = ~_2956;
    int _2996 = _2994 + 1;
    int _2998 = _2996 + 1;
    float _3000 = fma(_2968, _2986, _2242);
    int _3002 = abs(_2894);
    float _3004 = _2810 * _2810;
    out.m_72.x = _2960;
    out.m_72.y = _2974;
    int _3006 = _2998 * as_type<int>(_2882);
    int _3008 = _3006 + _2992;
    float _3010 = float(uint(_2952));
    float _3012 = fma(_2834, _2834, _3004);
    int _3014 = abs(_2034);
    float _3016 = _2972 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3018 = ~_3002;
    int _3020 = _3018 + 1;
    int _3022 = _3020 + 1;
    if (_2898)
    {
        out.m_55.x = 0.0;
    }
    float _3024 = 1.0 / _3010;
    int _3026 = ~_3014;
    int _3028 = _3026 + 1;
    int _3030 = _3028 + 1;
    float _3032 = -_3016;
    float _3034 = -_2252;
    float _3036 = fma(_3032, _2988, _3034);
    int _3038 = _3022 * as_type<int>(_2890);
    int _3040 = _3038 + _3008;
    float _3042 = fma(_2848, _2848, _3012);
    int _3044 = abs(_2952);
    float _3046 = _553 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _3048 = _3040 * _3030;
    float _3050 = rsqrt(_3042);
    int _3052 = _1688 >> 31;
    int _3054 = _2588 * _3014;
    int _3056 = _3054 + _3048;
    float _3058 = float(uint(_3044));
    int _3060 = _3052 & 3;
    int _3062 = as_type<int>(_3024) + (-2);
    float _3064 = float(uint(_3056));
    float _3066 = 1.0 / _3058;
    int _3068 = _1688 + _3060;
    float _3070 = _3046 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _3072 = _2040 >> 31;
    float _3074 = as_type<float>(_3062) * _3064;
    int _3076 = abs(_2978);
    float _3078 = _3070 * _3050;
    int _3080 = _3072 & 3;
    int _3082 = ~_2952;
    int _3084 = _3082 + 1;
    float _3086 = trunc(_3074);
    float _3088 = precise::max(_3086, 0.0);
    uint _3090 = uint(_3088);
    float _3092 = _2834 * _3078;
    int _3094 = _2040 + _3080;
    float _3096 = _2810 * _3078;
    float _3098 = float(_2866);
    float _3100 = -_3092;
    float _3102 = _2834 + _3100;
    int _3104 = _3068 >> 2;
    float _3106 = -_3096;
    float _3108 = _2810 + _3106;
    int _3110 = abs(_3056);
    float _3112 = in.m_74.x;
    float _3114 = in.m_74.y;
    float _3116 = in.m_74.z;
    int _3118 = _3104 << 4;
    int _3120 = _3118 + 368;
    float _3122 = _3108 * _3108;
    int _3124 = _3094 >> 2;
    float _3126 = fma(_3102, _3102, _3122);
    int _3128 = as_type<int>(_3066) + (-2);
    int _3130 = _3084 * int(_3090);
    int _3132 = _3130 + _3056;
    float _3134 = float(uint(_3110));
    uint _3136 = uint(int(uint(_3120) >> uint(2)));
    uint _3138 = uint(int(uint(int(_3136)) >> uint(2)));
    int _3140 = int(_3136) & 3;
    float _3142 = (*spvDescriptorSet0.vp_c9)._m0[int(_3138)][_3140];
    int _3144 = int(_3136) + 1;
    uint _3146 = uint(int(uint(_3144) >> uint(2)));
    int _3148 = _3144 & 3;
    float _3150 = (*spvDescriptorSet0.vp_c9)._m0[int(_3146)][_3148];
    float _3152 = float(_3076);
    int _3154 = _3124 << 4;
    int _3156 = _3154 + 800;
    float _3158 = as_type<float>(_3128) * _3134;
    float _3160 = float(uint(_3132));
    float _3162 = _3152 * _3098;
    float _3164 = -_2330;
    float _3166 = _3164 + 1.0;
    uint _3168 = uint(int(uint(_3156) >> uint(2)));
    uint _3170 = uint(int(uint(int(_3168)) >> uint(2)));
    int _3172 = int(_3168) & 3;
    float _3174 = (*spvDescriptorSet0.vp_c9)._m0[int(_3170)][_3172];
    int _3176 = int(_3168) + 1;
    uint _3178 = uint(int(uint(_3176) >> uint(2)));
    int _3180 = _3176 & 3;
    float _3182 = (*spvDescriptorSet0.vp_c9)._m0[int(_3178)][_3180];
    float _3184 = trunc(_3158);
    float _3186 = precise::max(_3184, 0.0);
    uint _3188 = uint(_3186);
    float _3190 = -_2346;
    float _3192 = _3190 + 1.0;
    float _3194 = fma(_1896, _3166, _2944);
    float _3196 = as_type<float>(_3062) * _3160;
    float _3198 = _2848 * _3078;
    float _3200 = -_2422;
    float _3202 = fma(_2290, _3200, _2936);
    float _3204 = -_3192;
    float _3206 = fma(_1660, _3204, _3000);
    float _3208 = fma(_1420, _2260, _3036);
    int _3210 = ~_3044;
    int _3212 = _3210 + 1;
    float _3214 = _3162 * (-2.0);
    float _3216 = trunc(_3196);
    float _3218 = precise::max(_3216, 0.0);
    uint _3220 = uint(_3218);
    int _3222 = abs(_2638);
    out.m_76.x = _3202;
    out.m_76.y = _3194;
    out.m_76.z = _3206;
    out.m_76.w = _3208;
    float _3224 = fma(_3214, _3112, _3112);
    int _3226 = ~_2116;
    int _3228 = _3226 + _2160;
    int _3230 = _3228 + 1;
    float _3232 = -_3198;
    float _3234 = _2848 + _3232;
    int _3236 = _3212 * int(_3188);
    int _3238 = _3236 + _3110;
    float _3240 = fma(_2868, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3224);
    int _3242 = abs(_1936);
    int _3244 = _3120 + 8;
    uint _3246 = uint(int(uint(_3244) >> uint(2)));
    uint _3248 = uint(int(uint(int(_3246)) >> uint(2)));
    int _3250 = int(_3246) & 3;
    float _3252 = (*spvDescriptorSet0.vp_c9)._m0[int(_3248)][_3250];
    int _3254 = int(_3246) + 1;
    uint _3256 = uint(int(uint(_3254) >> uint(2)));
    int _3258 = _3254 & 3;
    float _3260 = (*spvDescriptorSet0.vp_c9)._m0[int(_3256)][_3258];
    int _3262 = _793 * _3230;
    int _3264 = _3262 + _1556;
    int _3266 = abs(_2044);
    float _3268 = fma(_2920, _3214, _2920);
    float _3270 = fma(_3234, _3234, _3126);
    float _3272 = fma(_3268, _2496, _3240);
    int _3274 = _3156 + 8;
    uint _3276 = uint(int(uint(_3274) >> uint(2)));
    uint _3278 = uint(int(uint(int(_3276)) >> uint(2)));
    int _3280 = int(_3276) & 3;
    float _3282 = (*spvDescriptorSet0.vp_c9)._m0[int(_3278)][_3280];
    int _3284 = int(_3276) + 1;
    uint _3286 = uint(int(uint(_3284) >> uint(2)));
    int _3288 = _3284 & 3;
    float _3290 = (*spvDescriptorSet0.vp_c9)._m0[int(_3286)][_3288];
    float _3292 = float(uint(_3238));
    int _3294 = abs(_1780);
    int _3296 = int(_3090) + int(_3220);
    float _3298 = as_type<float>(_3128) * _3292;
    int _3300 = ~_2952;
    int _3302 = _3300 + 1;
    int _3304 = ~_3294;
    int _3306 = _3304 + 1;
    int _3308 = _3306 + 1;
    bool _3310 = !_2058;
    int _3312 = _3310 ? 0 : 1;
    float _3314 = trunc(_3298);
    float _3316 = precise::max(_3314, 0.0);
    uint _3318 = uint(_3316);
    int _3320 = abs(_2094);
    int _3322 = _3302 * _3296;
    int _3324 = _3322 + _3056;
    bool _3326 = _1720 != 3;
    int _3328 = _3308 * as_type<int>(_3150);
    int _3330 = ~_3320;
    int _3332 = _3330 + 1;
    int _3334 = _3332 + 1;
    bool _3336 = !_3326;
    int _3338 = _3336 ? 0 : (-1);
    bool _3340 = uint(_3324) >= uint(_2952);
    int _3342 = _3334 * as_type<int>(_3182);
    int _3344 = abs(_3312);
    int _3346 = ~_3222;
    int _3348 = _3346 + 1;
    int _3350 = _3348 + 1;
    int _3352 = ~_3044;
    int _3354 = _3352 + 1;
    int _3356 = int(_3188) + int(_3318);
    int _3358 = _3350 * as_type<int>(_3142);
    int _3360 = _3358 + _3328;
    bool _3362 = !_3340;
    int _3364 = _3362 ? 0 : (-1);
    bool _3366 = _2056 != 3;
    int _3368 = _3354 * _3356;
    int _3370 = _3368 + _3110;
    int _3372 = ~_3296;
    int _3374 = _3372 + _3364;
    int _3376 = _3374 + 1;
    int _3378 = abs(_1858);
    int _3380 = ~_3344;
    int _3382 = _3380 + 1;
    int _3384 = _3382 + 1;
    int _3386 = _2952 * _3376;
    int _3388 = _3386 + _3056;
    bool _3390 = !_3366;
    int _3392 = _3390 ? 0 : (-1);
    bool _3394 = uint(_3370) >= uint(_3044);
    int _3396 = _3384 * as_type<int>(_3174);
    int _3398 = _3396 + _3342;
    int _3400 = ~_3378;
    int _3402 = _3400 + 1;
    int _3404 = _3402 + 1;
    float _3406 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3408 = ~_2472;
    int _3410 = _3408 + 1;
    int _3412 = _3410 + 1;
    int _3414 = _3056 ^ _2952;
    int _3416 = _3404 * as_type<int>(_3252);
    int _3418 = _3416 + _3360;
    bool _3420 = !_3394;
    int _3422 = _3420 ? 0 : (-1);
    int _3424 = _3412 * as_type<int>(_3282);
    int _3426 = _3424 + _3398;
    int _3428 = abs(_3338);
    float _3430 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    uint _3432 = uint(int(uint(_3414) >> uint(31)));
    int _3434 = abs(_3392);
    int _3436 = ~_3422;
    int _3438 = _3356 + _3436;
    int _3440 = _3438 + 1;
    int _3442 = ~_3428;
    int _3444 = _3442 + 1;
    int _3446 = _3444 + 1;
    float _3448 = _3406 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3450 = ~int(_3432);
    int _3452 = _3450 + 1;
    int _3454 = ~_3434;
    int _3456 = _3454 + 1;
    int _3458 = _3456 + 1;
    int _3460 = _3446 * as_type<int>(_3260);
    int _3462 = _3460 + _3418;
    bool _3464 = _2952 == 0;
    int _3466 = _3440 ^ _3452;
    int _3468 = _3458 * as_type<int>(_3290);
    int _3470 = _3468 + _3426;
    int _3472 = ~_3266;
    int _3474 = _3472 + 1;
    int _3476 = _3474 + 1;
    bool _3478 = !_3464;
    int _3480 = _3478 ? _3388 : (-1);
    bool _3482 = _2952 == 0;
    int _3484 = _3470 * _3476;
    int _3486 = ~_3452;
    int _3488 = _3486 + _3466;
    int _3490 = _3488 + 1;
    int _3492 = ~_3242;
    int _3494 = _3492 + 1;
    int _3496 = _3494 + 1;
    bool _3498 = _755 == 0;
    bool _3500 = !_3482;
    int _3502 = _3500 ? _3490 : (-1);
    int _3504 = _3462 * _3496;
    bool _3506 = !_3498;
    int _3508 = _3506 ? _2468 : (-1);
    float _3510 = _1110 + (-0.5);
    float _3512 = float(_3480);
    float _3514 = float(_3502);
    float _3516 = _3430 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3518 = _3508 * _3242;
    int _3520 = _3518 + _3504;
    float _3522 = fma(_3448, _3512, _2354);
    bool _3524 = !_1496;
    int _3526 = _3524 ? _3264 : (-1);
    float _3528 = -_2356;
    float _3530 = fma(_3516, _3514, _3528);
    bool _3532 = !_2666;
    int _3534 = _3532 ? 0 : 1;
    float _3536 = _1080 + 0.5;
    int _3538 = _3526 * _3266;
    int _3540 = _3538 + _3484;
    int _3542 = abs(_3534);
    float _3544 = fma(_3448, _3536, _3522);
    float _3546 = -_3516;
    float _3548 = fma(_3546, _3510, _3530);
    float _3550 = float(_3520);
    float _3552 = -_2448;
    float _3554 = fma(_1080, _3552, _3544);
    float _3556 = float(_3540);
    float _3558 = fma(_1110, _2458, _3548);
    float _3560 = float(_2570);
    out.m_78.x = _3550;
    float _3562 = float(_3542);
    out.m_78.w = _3556;
    bool _3564 = !_2670;
    int _3566 = _3564 ? 0 : 1;
    float _3568 = _3562 * _3560;
    out.m_80.x = _3554;
    out.m_80.y = _3558;
    float _3570 = _3116;
    if (_2898)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3572 = -_3096;
    float _3574 = _2556 + _3572;
    float _3576 = -_3092;
    float _3578 = _2802 + _3576;
    float _3580 = -_3198;
    float _3582 = _2838 + _3580;
    int _3584 = abs(_3566);
    float _3586 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3588 = _3574 + _3586;
    float _3590 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3592 = _3578 + _3590;
    float _3594 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3596 = _3582 + _3594;
    float _3598 = _2900 + (-1.0);
    float _3600 = _3588 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3602 = _3568 * (-2.0);
    float _3604 = float(_2656);
    float _3606 = fma(_3598, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3608 = fma(_3592, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3600);
    float _3610 = float(_3584);
    float _3612 = _2856 + (-1.0);
    float _3614 = _3272 * 0.15915493667125701904296875;
    float _3616 = fma(_3596, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3608);
    float _3618 = fma(_3602, _3114, _3114);
    float _3620 = fma(_3606, _3602, _3606);
    float _3622 = _3610 * _3604;
    float _3624 = fma(_2902, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3618);
    bool _3626 = _3616 >= 0.0;
    float _3628 = _3622 * (-2.0);
    float _3630 = sqrt(_3270);
    float _3632 = fma(_3620, _2496, _3624);
    float _3634 = fma(_3612, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3636 = fma(_3628, _3116, _3116);
    float _3638 = _918 + (-0.5);
    float _3640 = _3632 * 0.15915493667125701904296875;
    float _3642 = fma(_3634, _3628, _3634);
    float _3644 = _3614 * 6.283185482025146484375;
    float _3646 = sin(_3644);
    float _3648 = fma(_3638, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3636);
    float _3650 = _3592;
    float _3652 = _3578;
    if (_3626)
    {
        _3570 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3654 = _3570;
    int _3656 = as_type<int>(_3654);
    if (_3626)
    {
        out.m_55.x = 0.0;
    }
    float _3658 = fma(_3642, _2496, _3648);
    float _3660 = _3614 * 6.283185482025146484375;
    float _3662 = cos(_3660);
    if (_3626)
    {
        float _3664 = _3654 * 5.0;
        _3656 = as_type<int>(_3664);
    }
    int _3666 = _3656;
    float _3668 = _3658 * 0.15915493667125701904296875;
    if (_3626)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10450 = as_type<float>(_3666);
        out.gl_Position.z = _10450;
    }
    float _3670 = _3640 * 6.283185482025146484375;
    float _3672 = sin(_3670);
    float _3674 = _3640 * 6.283185482025146484375;
    float _3676 = cos(_3674);
    if (_3626)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3678 = _3668 * 6.283185482025146484375;
    float _3680 = cos(_3678);
    float _3682 = _3050 * _3630;
    float _3684 = _551 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3686 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _211);
    float _3688 = _3662 * _3676;
    float _3690 = _3046 * _3682;
    float _3692 = _3682 * _3684;
    float _3694 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _201);
    float _3696 = _3668 * 6.283185482025146484375;
    float _3698 = sin(_3696);
    float _3700 = _3646 * _3676;
    float _3702 = _3686 * _3692;
    float _3704 = _3646 * _3672;
    float _3706 = _3662 * _3672;
    float _3708 = _3694 * _3690;
    float _3710 = _211 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3712 = _3662 * _3680;
    float _3714 = _3646 * _3680;
    float _3716 = _3676 * _3680;
    float _3718 = _3672 * _3680;
    float _3720 = _3712 * _3702;
    float _3722 = _3682 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3724 = _3722 * 0.5;
    float _3726 = fma(_3698, _3688, _3704);
    float _3728 = -_3700;
    float _3730 = fma(_3698, _3706, _3728);
    float _3732 = -_3702;
    float _3734 = _3698 * _3732;
    float _3736 = -_3706;
    float _3738 = fma(_3698, _3700, _3736);
    float _3740 = fma(_3726, _3708, _3720);
    float _3742 = _3714 * _3702;
    float _3744 = fma(_3716, _3708, _3734);
    float _3746 = fma(_3698, _3704, _3688);
    float _3748 = fma(_3730, _3724, _3740);
    float _3750 = fma(_3738, _3708, _3742);
    float _3752 = fma(_3718, _3724, _3744);
    float _3754 = _3748 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3756 = _3748 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3758 = fma(_3746, _3724, _3750);
    float _3760 = _3748 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3762 = fma(_3752, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3754);
    float _3764 = fma(_3752, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3756);
    float _3766 = fma(_3758, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3762);
    float _3768 = fma(_3758, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3764);
    float _3770 = _3766 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3772 = _3768 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3774 = _3726 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3776 = _2802 + _3770;
    float _3778 = _2838 + _3772;
    float _3780 = _3726 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3782 = fma(_3716, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3774);
    float _3784 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3786 = _3776 + _3784;
    float _3788 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3790 = _3778 + _3788;
    float _3792 = fma(_3716, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3780);
    float _3794 = fma(_3752, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3760);
    float _3796 = _3786 * _3786;
    float _3798 = _3790 * _3790;
    float _3800 = _3726 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3802 = fma(_3710, _3710, 1.0);
    float _3804 = fma(_3758, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3794);
    float _3806 = _3796 + _3798;
    float _3808 = fma(_3716, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3800);
    float _3810 = rsqrt(_3802);
    float _3812 = _3712 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3814 = _3712 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3816 = _3712 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3818 = _3804 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3820 = -_3698;
    float _3822 = fma(_3820, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3812);
    float _3824 = -_3698;
    float _3826 = fma(_3824, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3814);
    float _3828 = -_3698;
    float _3830 = fma(_3828, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3816);
    float _3832 = sqrt(_3806);
    float _3834 = _3730 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3836 = _3730 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3838 = _3730 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3840 = _2556 + _3818;
    float _3842 = fma(_3718, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3834);
    float _3844 = fma(_3718, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3836);
    float _3846 = fma(_3718, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3838);
    bool _3848 = _3832 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3850 = _3836;
    float _3852 = _3834;
    float _3854 = _3838;
    float _3856 = _3718;
    float _3858 = _3804;
    if (!_3848)
    {
        _3850 = _3798;
    }
    float _3860 = _3850;
    float _3862 = _3860;
    if (!_3848)
    {
        _3852 = _3796;
    }
    float _3864 = _3852;
    float _3866 = _3864;
    if (!_3848)
    {
        _3854 = _3776;
    }
    float _3868 = _3854;
    float _3870 = _3868;
    if (!_3848)
    {
        _3856 = _3778;
    }
    float _3872 = _3856;
    float _3874 = _3872;
    if (!_3848)
    {
        _3858 = _3840;
    }
    float _3876 = _3858;
    bool _3878 = !_3848;
    float _3880 = _3876;
    if (!_3878)
    {
        float _3882 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3884 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3886 = _3832 + _3884;
        float _3888 = rsqrt(_3806);
        float _3890 = _3886 * _3882;
        float _3892 = _3840 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3894 = _3890 * 0.15915493667125701904296875;
        float _3896 = _3894 * 6.283185482025146484375;
        float _3898 = sin(_3896);
        float _3900 = _3894 * 6.283185482025146484375;
        float _3902 = cos(_3900);
        float _3904 = fma(_3898, _3892, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3906 = _3888 * _3904;
        float _3908 = _3902 + (-1.0);
        float _3910 = fma(_3786, _3906, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3912 = fma(_3790, _3906, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3914 = _3908 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3916 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3918 = _3910 + _3916;
        float _3920 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3922 = _3912 + _3920;
        float _3924 = fma(_3840, _3902, _3914);
        float _3926 = _3918 * _3918;
        float _3928 = _3922 * _3922;
        _3880 = _3924;
        _3866 = _3926;
        _3862 = _3928;
        _3870 = _3910;
        _3874 = _3912;
    }
    float _3930 = _3880;
    float _3932 = _3866;
    float _3934 = _3862;
    float _3936 = _3870;
    float _3938 = _3874;
    float _3940 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3942 = _3930 + _3940;
    float _3944 = fma(_3714, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3822);
    float _3946 = fma(_3714, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3826);
    float _3948 = fma(_3714, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3830);
    float _3950 = fma(_3942, _3942, _3932);
    float _3952 = fma(_3746, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3842);
    float _3954 = fma(_3746, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3844);
    float _3956 = fma(_3746, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3846);
    float _3958 = _3950 + _3934;
    float _3960 = _3710 * _3810;
    float _3962 = fma(_3738, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3792);
    float _3964 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3966 = _3710 * _3944;
    float _3968 = fma(_3738, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3782);
    float _3970 = _3710 * _3946;
    float _3972 = fma(_3738, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3808);
    float _3974 = _3710 * _3948;
    float _3976 = -_3952;
    float _3978 = _3960 * _3976;
    float _3980 = -_3954;
    float _3982 = _3960 * _3980;
    float _3984 = -_3956;
    float _3986 = _3960 * _3984;
    float _3988 = fma(_3964, _3962, _3966);
    float _3990 = sqrt(_3958);
    float _3992 = fma(_3964, _3968, _3970);
    float _3994 = fma(_3964, _3972, _3974);
    float _3996 = fma(_3810, _3944, _3978);
    float _3998 = fma(_3810, _3946, _3982);
    float _4000 = _3954 + _3992;
    float _4002 = fma(_3810, _3948, _3986);
    float _4004 = _3952 + _3988;
    float _4006 = _3956 + _3994;
    out.m_82.x = _3962;
    out.m_82.y = _3968;
    out.m_82.z = _3972;
    out.m_84.x = _3996;
    out.m_84.y = _3998;
    out.m_84.z = _4002;
    bool _4008 = _3990 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4010 = isnan(_3990);
    bool _4012 = _4008 || _4010;
    bool _4014 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4016 = _4012 || _4014;
    out.m_86.x = _4004;
    out.m_86.y = _4000;
    out.m_86.z = _4006;
    float _4018 = _3964;
    if (!_4016)
    {
        _4018 = 1.0;
    }
    float _4020 = _4018;
    bool _4022 = !_4016;
    float _4024 = _4020;
    if (!_4022)
    {
        bool _4026 = _3990 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4028 = isnan(_3990);
        bool _4030 = _4026 || _4028;
        bool _4032 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4034 = _4030 || _4032;
        if (!_4034)
        {
            float _4036 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4038 = _3990 + _4036;
            float _4040 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4042 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4040;
            float _4044 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4046 = _4044 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4048 = 1.0 / _4042;
            float _4050 = _4038 * _4048;
            float _4052 = fma(_4050, _4046, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4024 = _4052;
            _4054 = true;
        }
        else
        {
            bool _4056 = _3990 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4058 = isnan(_3990);
            bool _4060 = _4056 || _4058;
            bool _4062 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4064 = _4060 || _4062;
            if (!_4064)
            {
                float _4066 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4068 = _3990 + _4066;
                float _4070 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4072 = _4070 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4074 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4076 = _4074 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4078 = 1.0 / _4072;
                float _4080 = _4068 * _4078;
                float _4082 = fma(_4080, _4076, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4024 = _4082;
                _4054 = true;
            }
            else
            {
                _4024 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4054 = false;
    float _4084 = _4024;
    float _4086 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4088 = _3930 + _4086;
    float _4090 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4092 = _3936 + _4090;
    float _4094 = _3574 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4096 = fma(_4088, _4084, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4098 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4100 = _3938 + _4098;
    float _4102 = fma(_4092, _4084, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4104 = fma(_3578, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4094);
    float _4106 = -_2556;
    float _4108 = _4106 + _4096;
    float _4110 = fma(_4100, _4084, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4112 = -_2802;
    float _4114 = _4112 + _4102;
    float _4116 = fma(_3582, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4104);
    float _4118 = _4108 * _4108;
    float _4120 = -_2838;
    float _4122 = _4120 + _4110;
    float _4124 = _3574 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4126 = _4116 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4128 = fma(_4114, _4114, _4118);
    float _4130 = fma(_3578, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4124);
    float _4132 = 1.0 / _4126;
    float _4134 = fma(_4122, _4122, _4128);
    float _4136 = fma(_3582, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4130);
    float _4138 = _4136 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4140 = sqrt(_4134);
    float _4142 = _4138 + _4126;
    float _4144 = _4142 * _4132;
    float _4146 = _4144 * 0.5;
    bool _4148 = _4140 > 0.0;
    float _4150 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4152 = fma(_4146, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4150);
    float _4154 = 1.0 / _4152;
    bool _4156 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4158 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4160 = _4156 || _4158;
    bool _4162 = isnan(0.5);
    bool _4164 = _4160 || _4162;
    bool _4166 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4168 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4170 = _4166 || _4168;
    bool _4172 = isnan(0.5);
    bool _4174 = _4170 || _4172;
    float _4176 = _4116;
    float _4178 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4180 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _4182 = _4114;
    if (!_4148)
    {
        _4176 = _4102;
    }
    float _4184 = _4176;
    float _4186 = _4184;
    float _4188 = _4184;
    if (!_4148)
    {
        _4178 = _4096;
    }
    float _4190 = _4178;
    float _4192 = _4190;
    float _4194 = _4190;
    if (!_4148)
    {
        _4180 = _4110;
    }
    float _4196 = _4180;
    bool _4198 = !_4148;
    float _4200 = _4196;
    if (!_4198)
    {
        float _4202 = _215 * _215;
        float _4204 = rsqrt(_4134);
        float _4206 = fma(_213, _213, _4202);
        float _4208 = fma(_217, _217, _4206);
        float _4210 = sqrt(_4208);
        float _4212 = _4114 * _4204;
        float _4214 = _4108 * _4204;
        float _4216 = _4122 * _4204;
        bool _4218 = _4210 > 0.0;
        float _4220 = _4210;
        if (!_4218)
        {
            _4186 = _4102;
        }
        float _4222 = _4186;
        _4188 = _4222;
        if (!_4218)
        {
            _4192 = _4096;
        }
        float _4224 = _4192;
        _4194 = _4224;
        if (!_4218)
        {
            _4220 = _4110;
        }
        float _4226 = _4220;
        bool _4228 = !_4218;
        _4200 = _4226;
        if (!_4228)
        {
            float _4230 = rsqrt(_4208);
            float _4232 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4234 = _215 * _4230;
            float _4236 = _213 * _4230;
            float _4238 = _4214 * _4234;
            float _4240 = _217 * _4230;
            float _4242 = fma(_4212, _4236, _4238);
            float _4244 = _4232 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4246 = fma(_4216, _4240, _4242);
            float _4248 = _4246 * _4244;
            float _4250 = fma(_213, _4248, _4102);
            float _4252 = fma(_215, _4248, _4096);
            float _4254 = fma(_217, _4248, _4110);
            _4188 = _4250;
            _4194 = _4252;
            _4200 = _4254;
        }
    }
    float _4256 = _4188;
    float _4258 = _4194;
    float _4260 = _4200;
    float _4262 = -_3092;
    float _4264 = _4262 + _4256;
    float _4266 = -_3096;
    float _4268 = _4266 + _4258;
    float _4270 = -_3198;
    float _4272 = _4270 + _4260;
    float _4274 = _4268;
    float _4276 = _4264;
    float _4278 = _4272;
    if (_4174)
    {
        _221 = 1.0;
    }
    float _4280 = _221;
    float _4282 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4284 = _4154 * _4282;
    float _4286 = _4280;
    if (!_4164)
    {
        float _4288 = _3588 * _3588;
        float _4290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4292 = -_2838;
        float _4294 = _4292 + _4260;
        float _4296 = -_2556;
        float _4298 = _4296 + _4258;
        float _4300 = fma(_3592, _3592, _4288);
        float _4302 = -_2802;
        float _4304 = _4302 + _4256;
        float _4306 = fma(_3596, _3596, _4300);
        float _4308 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4310 = sqrt(_4306);
        float _4312 = 1.0 / _3682;
        float _4314 = _4308 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4316 = precise::min(_4310, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4318 = _4316 * _4290;
        float _4320 = _4318 * _4312;
        float _4322 = _4314 * _4320;
        float _4324 = _4294 * _4320;
        float _4326 = fma(_4298, _4322, _3574);
        float _4328 = fma(_4304, _4322, _3578);
        float _4330 = fma(_4314, _4324, _3582);
        _4274 = _4326;
        _4276 = _4328;
        _4278 = _4330;
        _3650 = _4310;
    }
    float _4332 = _4274;
    float _4334 = _4276;
    float _4336 = _4278;
    float _4338 = _3650;
    float _4340 = _4338;
    if (!_4174)
    {
        float _4342 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4344 = _4342 * 0.15915493667125701904296875;
        float _4346 = _4344 * 6.283185482025146484375;
        float _4348 = cos(_4346);
        float _4350 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4352 = _4350 * 0.15915493667125701904296875;
        float _4354 = _4344 * 6.283185482025146484375;
        float _4356 = sin(_4354);
        float _4358 = 1.0 / _4348;
        float _4360 = _4352 * 6.283185482025146484375;
        float _4362 = cos(_4360);
        float _4364 = _4356 * _4358;
        float _4366 = _4352 * 6.283185482025146484375;
        float _4368 = sin(_4366);
        float _4370 = _4362 * _4364;
        float _4372 = 1.0 / _4370;
        float _4374 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4376 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4374;
        float _4378 = 1.0 / _4376;
        float _4380 = _4368 * _4372;
        float _4382 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4384 = fma(_4284, _4380, _4382);
        float _4386 = _4384 * _4378;
        float _4388 = precise::clamp(_4386, 0.0, 1.0);
        _4340 = _4344;
        _4286 = _4388;
    }
    float _4390 = _4340;
    float _4392 = _4286;
    float _4394 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4396 = _4332 + _4394;
    float _4398 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4400 = _4334 + _4398;
    float _4402 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4404 = _4336 + _4402;
    float _4406 = _4396 * _4396;
    float _4408 = fma(_4400, _4400, _4406);
    float _4410 = fma(_3578, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4412 = fma(_4404, _4404, _4408);
    float _4414 = rsqrt(_4412);
    float _4416 = sqrt(_4412);
    float _4418 = _4414 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4420 = _4400 * _4418;
    float _4422 = _4404 * _4418;
    float _4424 = _4420 * _4420;
    float _4426 = _4422 * _4422;
    float _4428 = _4424 + _4426;
    float _4430 = sqrt(_4428);
    bool _4432 = _4430 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4434 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4436 = _4430 + _4434;
    float _4438 = _4414;
    float _4440 = _4428;
    float _4442 = _4436;
    float _4444 = _4390;
    float _4446 = _4396;
    if (_4432)
    {
        float _4448 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4438 = _4448;
    }
    float _4450 = _4438;
    if (!_4432)
    {
        _3652 = _4420;
    }
    float _4452 = _3652;
    float _4454 = _4452;
    if (_4432)
    {
        float _4456 = rsqrt(_4428);
        _4440 = _4456;
    }
    float _4458 = _4440;
    if (_4432)
    {
        float _4460 = _4436 * _4450;
        _4442 = _4460;
    }
    float _4462 = _4442;
    if (_4432)
    {
        float _4464 = _4462 * 0.15915493667125701904296875;
        _4444 = _4464;
    }
    float _4466 = _4444;
    float _4468 = _4404;
    float _4470 = _4466;
    if (_4432)
    {
        float _4472 = _4466 * 6.283185482025146484375;
        float _4474 = sin(_4472);
        _4468 = _4474;
    }
    float _4476 = _4468;
    float _4478 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4480 = precise::max(0.0, _4478);
    float _4482 = _4450;
    float _4484 = _4480;
    if (_4432)
    {
        float _4486 = _4466 * 6.283185482025146484375;
        float _4488 = cos(_4486);
        _4482 = _4488;
    }
    float _4490 = _4482;
    float _4492 = -_4418;
    float _4494 = -_4480;
    float _4496 = fma(_4396, _4492, _4494);
    if (_4432)
    {
        float _4498 = _4496 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4446 = _4498;
    }
    float _4500 = _4446;
    float _4502 = _4476;
    float _4504 = _4500;
    if (_4432)
    {
        float _4506 = fma(_4476, _4500, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4502 = _4506;
    }
    float _4508 = _4502;
    float _4510 = _4508;
    if (!_4432)
    {
        _4504 = _4496;
    }
    float _4512 = _4504;
    float _4514 = _4512;
    float _4516 = _4490;
    if (_4432)
    {
        float _4518 = _4490 + (-1.0);
        _4484 = _4518;
    }
    float _4520 = _4484;
    float _4522 = _4520;
    if (_4432)
    {
        float _4524 = _4458 * _4508;
        _4182 = _4524;
    }
    float _4526 = _4182;
    if (!_4432)
    {
        _4510 = _4424;
    }
    float _4528 = _4510;
    float _4530 = _4332 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4532 = _4528;
    if (_4432)
    {
        float _4534 = _4520 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4470 = _4534;
    }
    float _4536 = _4470;
    if (_4432)
    {
        float _4538 = _4420 * _4526;
        _4454 = _4538;
    }
    float _4540 = _4454;
    if (!_4432)
    {
        _4522 = _4422;
    }
    float _4542 = _4522;
    float _4544 = _4542;
    if (_4432)
    {
        float _4546 = _4422 * _4526;
        _4544 = _4546;
    }
    float _4548 = _4544;
    if (_4432)
    {
        float _4550 = fma(_4496, _4490, _4536);
        _4514 = _4550;
    }
    float _4552 = _4514;
    if (_4432)
    {
        float _4554 = _4540 * _4540;
        _4532 = _4554;
    }
    float _4556 = _4532;
    if (!_4432)
    {
        _4516 = _4426;
    }
    float _4558 = _4516;
    float _4560 = _4558;
    if (_4432)
    {
        float _4562 = _4548 * _4548;
        _4560 = _4562;
    }
    float _4564 = _4560;
    float _4566 = fma(_4552, _4552, _4556);
    float _4568 = _4332 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4570 = floor(_4410);
    float _4572 = _4566 + _4564;
    float _4574 = fma(_4334, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4568);
    float _4576 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4578 = fma(_4416, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4576);
    float _4580 = precise::clamp(_4578, 0.0, 1.0);
    float _4582 = fma(_3582, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4584 = fma(_4336, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4574);
    float _4586 = -_4580;
    float _4588 = _4586 + 1.0;
    float _4590 = rsqrt(_4572);
    float _4592 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4594 = _4584 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4596 = _4332 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4598 = _4594 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4600 = fma(_4334, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4596);
    float _4602 = abs(_4588);
    float _4604 = log2(_4602);
    float _4606 = -_4570;
    float _4608 = _4410 + _4606;
    float _4610 = -_4598;
    float _4612 = fma(_4610, _4592, 1.0);
    float _4614 = _4332 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4616 = fma(_4336, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4600);
    float _4618 = fma(_4334, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4530);
    float _4620 = _4590 * _4540;
    float _4622 = _4590 * _4552;
    float _4624 = _4590 * _4548;
    float _4626 = fma(_4334, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4614);
    float _4628 = _4620 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4630 = _4616 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4632 = floor(_4582);
    float _4634 = fma(_4336, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4626);
    float _4636 = -_4628;
    float _4638 = fma(_4622, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4636);
    float _4640 = _4630 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4642 = fma(_4336, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4618);
    float _4644 = _4634 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4646 = -_4624;
    float _4648 = fma(_4646, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4638);
    float _4650 = _4604 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4652 = log2(_4612);
    float _4654 = fma(_4644, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4640);
    float _4656 = fma(_4648, -0.5, 0.5);
    float _4658 = fma(_4648, 0.5, 0.5);
    float _4660 = _4630 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4662 = fma(_4594, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4654);
    float _4664 = _4622 + 1.0;
    float _4666 = sqrt(_4656);
    float _4668 = _4642 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4670 = -_4632;
    float _4672 = _4582 + _4670;
    float _4674 = fma(_4658, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4676 = fma(_4644, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4660);
    float _4678 = fma(_4668, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4662);
    float _4680 = _4630 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4682 = fma(_4658, _4674, -0.212114393711090087890625);
    float _4684 = exp2(_4650);
    float _4686 = fma(_4594, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4676);
    float _4688 = fma(_4644, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4680);
    float _4690 = fma(_4658, _4682, 1.570728778839111328125);
    float _4692 = _4652 * 0.693147182464599609375;
    float _4694 = fma(_4594, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4688);
    float _4696 = fma(_4668, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4686);
    float _4698 = 1.0 / _4678;
    float _4700 = _4666 * 0.636619746685028076171875;
    float _4702 = fma(_4668, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4694);
    float _4704 = _4692 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4706 = -_4690;
    float _4708 = fma(_4700, _4706, 1.0);
    float2 _12180 = float2(_4608, _4672);
    float _4710 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12180, float2(0.0), isnan(_12180)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12180, float2(0.0), isnan(_12180)), level(0.0)).x;
    float _4712 = -_4622;
    float _4714 = fma(_4684, _4664, _4712);
    float _4716 = fma(_4714, 0.5, 0.5);
    float _4718 = _4702 * _4698;
    float _4720 = _4696 * _4698;
    float _4722 = fma(_4718, 0.5, 0.5);
    float _4724 = fma(_4720, -0.5, 0.5);
    float3 _12209 = float3(_4722, _4724, _4704);
    float _4726 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12209, float3(0.0), isnan(_12209)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12209, float3(0.0), isnan(_12209)), level(0.0)).x;
    float3 _12220 = float3(_4722, _4724, _4704);
    float4 _4729 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12220, float3(0.0), isnan(_12220)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12220, float3(0.0), isnan(_12220)), level(0.0)).xyzw;
    float _4731 = _4729.x;
    float _4733 = _4729.y;
    float _4735 = _4729.z;
    float _4737 = _4729.w;
    float2 _12236 = float2(_4708, _4716);
    float3 _4741 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12236, float2(0.0), isnan(_12236)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12236, float2(0.0), isnan(_12236)), level(0.0)).xyz;
    float _4743 = _4741.x;
    float _4745 = _4741.y;
    float _4747 = _4741.z;
    float _4749 = abs(_4284);
    float _4751 = log2(_4749);
    float _4753 = _4630 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _4755 = _4416 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4757 = isnan(_4416);
    bool _4759 = _4755 || _4757;
    bool _4761 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4763 = _4759 || _4761;
    float _4765 = fma(_4644, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4753);
    float _4767 = fma(_4594, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4765);
    bool _4769 = _4284 <= 8000.0;
    bool _4771 = isnan(_4284);
    bool _4773 = _4769 || _4771;
    bool _4775 = isnan(8000.0);
    bool _4777 = _4773 || _4775;
    float _4779 = float(_4777);
    float _4781 = _4678 * 0.5;
    float _4783 = fma(_4668, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4767);
    float _4785 = _4751 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4787 = in.m_88.x;
    float _4789 = fma(_4696, -0.5, _4781);
    out.gl_Position.x = _4702;
    out.gl_Position.y = _4696;
    out.gl_Position.z = _4783;
    out.gl_Position.w = _4678;
    float _4791 = exp2(_4785);
    float _4793 = _4696;
    float _4795 = _4783;
    float _4797 = _4702;
    float _4799 = _4678;
    if (!_4763)
    {
        _4793 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4801 = _4793;
    float _4803 = fma(_4791, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4805 = precise::clamp(_4803, 0.0, 1.0);
    float _4807 = _4783 + _4678;
    float _4809 = _4801;
    float _4811 = _4801;
    if (!_4763)
    {
        _4795 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4813 = _4795;
    float _4815 = fma(_4805, -2.0, 3.0);
    float _4817 = _4805 * _4805;
    float _4819 = _4807 * 0.5;
    float _4821 = _4817 * _4815;
    float _4823 = _4604 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4825 = _4702 + _4678;
    float _4827 = _4813;
    float _4829 = _4813;
    if (!_4763)
    {
        _4797 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4831 = _4797;
    float _4833 = -_4821;
    float _4835 = _4833 + 1.0;
    float _4837 = _4825 * 0.5;
    float _4839 = exp2(_4823);
    float _4841 = fma(_4835, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4821);
    float _4843 = _4779 * _4841;
    float _4845 = _4831;
    float _4847 = _4831;
    if (!_4763)
    {
        _4799 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4849 = _4799;
    float _4851 = _4843 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_90.x = _4837;
    out.m_90.y = _4789;
    out.m_90.z = _4819;
    out.m_90.w = _4678;
    float _4853 = -_4839;
    float _4855 = _4853 + 1.0;
    float _4857 = _4855 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4859 = -_4710;
    float _4861 = _4859 + 1.0;
    float _4863 = _4861 * _4851;
    float _4865 = precise::clamp(_4863, 0.0, 1.0);
    float _4867 = -_4865;
    float _4869 = fma(_4867, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4871 = _4869 * _4787;
    float _4873 = _4871 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4875 = _4857 * _4726;
    float _4877 = -_4857;
    float _4879 = _4877 + 1.0;
    out.m_92.x = _4873;
    float _4881 = _4737 * _4875;
    float _4883 = _4747 * _4875;
    float _4885 = _4737 * _4879;
    float _4887 = fma(_4743, _4881, _4731);
    float _4889 = fma(_4745, _4881, _4733);
    float _4891 = fma(_4737, _4883, _4735);
    float _4893 = _4392 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4895 = _4881;
    float _4897 = _4735;
    float _4899 = _4849;
    float _4901 = _4849;
    if (!_4763)
    {
        _4895 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4903 = _4895;
    float _4905 = _4903;
    float _4907 = _4903;
    if (!_4763)
    {
        _4897 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4909 = _4897;
    out.m_94.x = _4887;
    out.m_94.y = _4889;
    out.m_94.z = _4891;
    out.m_94.w = _4885;
    bool _4911 = !_4763;
    float _4913 = _4909;
    float _4915 = _4909;
    if (!_4911)
    {
        bool _4917 = _4416 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4919 = isnan(_4416);
        bool _4921 = _4917 || _4919;
        bool _4923 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4925 = _4921 || _4923;
        if (!_4925)
        {
            float _4927 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4929 = _4416 + _4927;
            float _4931 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4933 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4931;
            float _4935 = 1.0 / _4933;
            float _4937 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4939 = _4937 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4941 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4943 = _4941 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4945 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4947 = _4945 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4949 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4951 = _4949 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4953 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4955 = _4953 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4957 = _4929 * _4935;
            float _4959 = precise::clamp(_4957, 0.0, 1.0);
            float _4961 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4963 = _4961 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4965 = fma(_4959, _4943, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4967 = fma(_4959, _4963, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4969 = fma(_4959, _4939, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4971 = fma(_4959, _4947, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4973 = fma(_4959, _4951, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4975 = fma(_4959, _4955, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4811 = _4969;
            _4915 = _4973;
            _4829 = _4967;
            _4907 = _4971;
            _4847 = _4965;
            _4901 = _4975;
            _4977 = true;
        }
        else
        {
            bool _4979 = _4416 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4981 = isnan(_4416);
            bool _4983 = _4979 || _4981;
            bool _4985 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4987 = _4983 || _4985;
            if (!_4987)
            {
                _4905 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4989 = _4905;
            _4907 = _4989;
            if (!_4987)
            {
                _4913 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4991 = _4913;
            _4915 = _4991;
            if (!_4987)
            {
                _4899 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4993 = _4899;
            _4901 = _4993;
            if (!_4987)
            {
                _4827 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4995 = _4827;
            _4829 = _4995;
            if (!_4987)
            {
                _4809 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4997 = _4809;
            _4811 = _4997;
            if (!_4987)
            {
                _4845 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4999 = _4845;
            bool _5001 = !_4987;
            _4847 = _4999;
            if (!_5001)
            {
                bool _5003 = _4416 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5005 = isnan(_4416);
                bool _5007 = _5003 || _5005;
                bool _5009 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5011 = _5007 || _5009;
                if (!_5011)
                {
                    float _5013 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5015 = _4416 + _5013;
                    float _5017 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5019 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5017;
                    float _5021 = 1.0 / _5019;
                    float _5023 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5025 = _5023 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5027 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5029 = _5027 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5031 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5033 = _5031 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5035 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5037 = _5035 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5039 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5041 = _5039 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5043 = _5015 * _5021;
                    float _5045 = precise::clamp(_5043, 0.0, 1.0);
                    float _5047 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5049 = _5047 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5051 = fma(_5045, _5029, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5053 = fma(_5045, _5049, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5055 = fma(_5045, _5025, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5057 = fma(_5045, _5033, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5059 = fma(_5045, _5037, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5061 = fma(_5045, _5041, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4811 = _5055;
                    _4915 = _5059;
                    _4829 = _5053;
                    _4907 = _5057;
                    _4847 = _5051;
                    _4901 = _5061;
                    _4977 = true;
                }
                else
                {
                    _4811 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4915 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4829 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4907 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4847 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4901 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4977 = false;
    float _5063 = _4811;
    float _5065 = _4915;
    float _5067 = _4829;
    float _5069 = _4907;
    float _5071 = _4847;
    float _5073 = _4901;
    float _5075 = _4893 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5077 = fma(_4000, -0.5, 0.5);
    float _5079 = precise::clamp(_5077, 0.0, 1.0);
    float _5081 = -_5063;
    float _5083 = _5065 + _5081;
    float _5085 = -_5067;
    float _5087 = _5069 + _5085;
    out.m_55.x = _5075;
    float _5089 = fma(_5079, _5083, _5063);
    float _5091 = -_5071;
    float _5093 = _5073 + _5091;
    float _5095 = fma(_5079, _5087, _5067);
    float _5097 = _5089 * 0.586610972881317138671875;
    bool _5099 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5101 = fma(_5079, _5093, _5071);
    out.m_96.x = 0.0;
    float _5103 = fma(_5095, 0.298911988735198974609375, _5097);
    bool _5105 = _4392 > 0.0;
    bool _5107 = isnan(_4392);
    bool _5109 = _5105 || _5107;
    bool _5111 = isnan(0.0);
    bool _5113 = _5109 || _5111;
    float _5115 = fma(_5101, 0.114477999508380889892578125, _5103);
    float _5117 = -_5115;
    float _5119 = _5095 + _5117;
    float _5121 = -_5115;
    float _5123 = _5089 + _5121;
    float _5125 = -_5115;
    float _5127 = _5101 + _5125;
    float _5129 = fma(_5119, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5115);
    float _5131 = fma(_5123, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5115);
    float _5133 = fma(_5127, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5115);
    bool _5135 = !_5099;
    if (!_5135)
    {
        float _5137 = -_4332;
        float _5139 = _5137 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5141 = -_4334;
        float _5143 = _5141 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5145 = -_4336;
        float _5147 = _5145 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5149 = _5139 * _5139;
        float _5151 = fma(_5143, _5143, _5149);
        float _5153 = fma(_5147, _5147, _5151);
        float _5155 = sqrt(_5153);
        float _5157 = rsqrt(_5153);
        float _5159 = -_5155;
        float _5161 = _5159 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5163 = _5161 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5165 = precise::clamp(_5163, 0.0, 1.0);
        float _5167 = _5143 * _5157;
        float _5169 = _5139 * _5157;
        float _5171 = abs(_5165);
        float _5173 = log2(_5171);
        float _5175 = _5147 * _5157;
        float _5177 = _5167 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5179 = _4000 * _5169;
        float _5181 = -_5169;
        float _5183 = -_5177;
        float _5185 = fma(_5181, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5183);
        float _5187 = fma(_4004, _5167, _5179);
        float _5189 = -_5175;
        float _5191 = fma(_5189, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5185);
        float _5193 = fma(_4006, _5175, _5187);
        float _5195 = precise::clamp(_5193, 0.0, 1.0);
        float _5197 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5199 = _5191 + _5197;
        float _5201 = _5173 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5203 = _5199 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5205 = precise::clamp(_5203, 0.0, 1.0);
        float _5207 = exp2(_5201);
        float _5209 = _5207 * _5205;
        float _5211 = _5195 * _5209;
        float _5213 = _5211 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5215 = _5211 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5217 = _5211 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _5213;
        out.m_96.y = _5215;
        out.m_96.z = _5217;
    }
    out.m_98.x = _5129;
    out.m_98.y = _5131;
    out.m_98.z = _5133;
    if (_5113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_55.x = 0.0;
    float _5219 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5219;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

