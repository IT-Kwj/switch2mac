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
    float4 m_100 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_74 [[user(locn5)]];
    float4 m_90 [[user(locn6)]];
    float4 m_72 [[user(locn7)]];
    float4 m_80 [[user(locn8)]];
    float4 m_70 [[user(locn9)]];
    float4 m_78 [[user(locn10)]];
    float4 m_84 [[user(locn11)]];
    float4 m_86 [[user(locn12)]];
    float4 m_92 [[user(locn13)]];
    float4 m_82 [[user(locn14)]];
    float4 m_98 [[user(locn15)]];
    float4 m_94 [[user(locn16)]];
    float4 m_96 [[user(locn17)]];
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
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4905 = false;
    bool _4052 = false;
    bool _575 = false;
    bool _431 = false;
    bool _243 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_48.w;
    float _116 = in.m_50.w;
    float _118 = trunc(_114);
    int _121 = int(_118);
    float _123 = -_116;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _125;
    bool _129 = _121 >= 1;
    float _131 = 0.0;
    float _133 = as_type<float>(_121);
    float _135 = _125;
    if (!_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _131;
    if (!_129)
    {
        out.m_55.x = 0.0;
    }
    int _139 = 0;
    if (!_129)
    {
        float _141 = _137 * 5.0;
        _139 = as_type<int>(_141);
    }
    int _143 = _139;
    int _145 = _143;
    if (!_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5216 = as_type<float>(_143);
        out.gl_Position.z = _5216;
    }
    if (!_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _147 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _149 = isnan(_116);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _155 = _151 || _153;
    float _157 = float(_121);
    bool _159 = _125 >= _157;
    bool _161 = !_155;
    bool _163 = _159 || _161;
    float _165 = 1.0 / _157;
    if (_163)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _133;
    if (_163)
    {
        out.m_55.x = 0.0;
    }
    float _169 = _125 * _165;
    float _171 = _169;
    if (_163)
    {
        float _173 = _167 * 5.0;
        _145 = as_type<int>(_173);
    }
    int _175 = _145;
    out.m_53.x = _169;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5279 = as_type<float>(_175);
        out.gl_Position.z = _5279;
    }
    if (_163)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _177 = as_type<float>(int(gl_VertexIndex));
    float _179 = in.m_60.x;
    float _181 = in.m_60.y;
    float _183 = in.m_60.z;
    int _185 = as_type<int>(_177) & 1;
    bool _187 = _185 != 0;
    int _189 = as_type<int>(_177) & 2;
    bool _191 = _189 != 0;
    bool _193 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _195 = _181 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _197 = _181 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _199 = _181 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _201 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[4].x, _195);
    float _203 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[5].x, _197);
    float _205 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[6].x, _199);
    float _207 = fma(_183, (*spvDescriptorSet0.vp_c10)._m0[4].z, _201);
    float _209 = fma(_183, (*spvDescriptorSet0.vp_c10)._m0[5].z, _203);
    float _211 = fma(_183, (*spvDescriptorSet0.vp_c10)._m0[6].z, _205);
    bool _213 = !_187;
    float _215 = _213 ? (-0.5) : 0.5;
    bool _217 = !_191;
    float _219 = _217 ? (-0.5) : 0.5;
    bool _221 = !_193;
    float _223 = _211;
    float _241;
    if (!_221)
    {
        float _225 = in.m_62.x;
        float _227 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _229 = _225 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _231 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _233 = _231 * _227;
        float _235 = floor(_233);
        float _237 = -_235;
        float _239 = _233 + _237;
        _241 = _239;
        _243 = true;
    }
    else
    {
        _241 = _169;
    }
    _243 = false;
    float _245 = _241;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _249 = _245 + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _253 = _245 + _251;
    bool _255 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _257 = isnan(_245);
    bool _259 = _255 || _257;
    bool _261 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _263 = _259 || _261;
    float _265 = float(_263);
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _267;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _273 = _271 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _277 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _275;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _281 = _245 + _279;
    float _283 = 1.0 / _269;
    bool _285 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _287 = 1.0 / _277;
    float _289 = 1.0 / _273;
    float _291 = _249 * _283;
    bool _293 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _295 = isnan(_245);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = -_265;
    float _307 = _305 + 1.0;
    float _309 = _303 * _307;
    float _311 = _253 * _287;
    bool _313 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _315 = isnan(_245);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = -_303;
    float _327 = _325 + 1.0;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _333 = _281 * _289;
    bool _335 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _337 = isnan(_245);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _347;
    float _351 = _323 * _327;
    float _353 = -_323;
    float _355 = _353 + 1.0;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _363 = _361 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _365 = fma(_349, _291, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _367 = _345 * _355;
    float _369 = fma(_359, _291, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _371 = fma(_331, _333, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _373 = fma(_363, _333, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _375 = -_345;
    float _377 = _375 + 1.0;
    float _379 = _365 * _367;
    float _381 = _369 * _367;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _383;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _387;
    float _391 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[143].x, _379);
    float _393 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[143].y, _381);
    float _395 = fma(_385, _311, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _397 = fma(_389, _311, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _399 = fma(_371, _351, _391);
    float _401 = fma(_373, _351, _393);
    float _403 = fma(_395, _309, _399);
    float _405 = fma(_397, _309, _401);
    float _407 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[146].x, _403);
    float _409 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[146].y, _405);
    bool _411 = !_285;
    float _429;
    if (!_411)
    {
        float _413 = in.m_62.x;
        float _415 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _417 = _413 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _419 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _421 = _419 * _415;
        float _423 = floor(_421);
        float _425 = -_423;
        float _427 = _421 + _425;
        _429 = _427;
        _431 = true;
    }
    else
    {
        _429 = _169;
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
    float _535 = in.m_64.x;
    float _537 = in.m_64.y;
    float _539 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[117].x, _531);
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _543 = _529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _545 = _533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _547 = _539 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _549 = _541 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_66.x = _543;
    out.m_66.y = _545;
    out.m_66.z = _549;
    out.m_66.w = _547;
    float _551 = _409 * _537;
    float _553 = _407 * _535;
    bool _555 = !_493;
    float _573;
    if (!_555)
    {
        float _557 = in.m_62.x;
        float _559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _561 = _557 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _563 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[11].w, _125);
        float _565 = _563 * _559;
        float _567 = floor(_565);
        float _569 = -_567;
        float _571 = _565 + _569;
        _573 = _571;
        _575 = true;
    }
    else
    {
        _573 = _169;
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
    float _639 = 1.0 / _601;
    float _641 = _617 * _631;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _645 = _643 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _647 = fma(_641, _581, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _649 = _613 * _635;
    float _651 = -_629;
    float _653 = _651 + 1.0;
    float _655 = -_613;
    float _657 = _655 + 1.0;
    float _659 = _645 * _639;
    float _661 = _647 * _649;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _665 = _577 + _663;
    float _667 = _597 * _653;
    float _669 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[131].x, _661);
    float _671 = fma(_659, _665, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _673 = fma(_671, _667, _669);
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _681 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[133].x, _673);
    float _683 = _675 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _685 = _677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _687 = _679 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _689 = _681 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_68.x = _683;
    out.m_68.y = _685;
    out.m_68.z = _687;
    out.m_68.w = _689;
    bool _691 = !_637;
    float _693 = _667;
    float _695 = _689;
    if (!_691)
    {
        float _697 = in.m_62.x;
        float _699 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _701 = _697 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _703 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[14].x, _125);
        float _705 = _703 * _699;
        float _707 = floor(_705);
        float _709 = -_707;
        float _711 = _705 + _709;
        _171 = _711;
    }
    float _713 = _171;
    float _715 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _717 = int(_715);
    int _719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _721 = _719 != 0;
    float _723 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _725 = int(_723);
    float _727 = float(_717);
    float _729 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _731 = int(_729);
    float _733 = 0.0;
    if (_721)
    {
        _733 = 1.0;
    }
    float _735 = _733;
    float _737 = _735;
    if (_721)
    {
        _693 = 1.0;
    }
    float _739 = _693;
    float _741 = float(_725);
    float _743 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _745 = int(_743);
    float _747 = 1.0 / _741;
    float _749 = float(uint(_731));
    int _751 = ~_731;
    int _753 = _751 + 1;
    float _755 = 1.0 / _727;
    float _757 = float(uint(_745));
    float _759 = _747 * _125;
    float _761 = 1.0 / _749;
    float _763 = _755 * _125;
    float _765 = 1.0 / _757;
    float _767 = _741;
    float _769 = _755;
    float _771 = _739;
    if (_721)
    {
        float _773 = in.m_62.x;
        float _775 = in.m_62.y;
        _767 = _773;
        _769 = _775;
    }
    float _777 = _767;
    float _779 = _769;
    float _781 = trunc(_759);
    int _783 = int(_781);
    int _785 = as_type<int>(_761) + (-2);
    float _787 = trunc(_763);
    int _789 = int(_787);
    int _791 = as_type<int>(_765) + (-2);
    float _793 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _795 = int(_793);
    float _797 = float(uint(_783));
    int _799 = as_type<int>(_797);
    float _801 = _777;
    float _803 = _779;
    if (_721)
    {
        _695 = _779;
    }
    float _805 = _695;
    float _807 = as_type<float>(_785) * _797;
    float _809 = _805;
    if (_721)
    {
        _799 = 0;
    }
    int _811 = _799;
    float _813 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _815 = int(_813);
    float _817 = float(uint(_789));
    float _819 = as_type<float>(_791) * _817;
    float _821 = _817;
    int _823 = _811;
    if (_721)
    {
        _821 = _777;
    }
    float _825 = _821;
    float _827 = trunc(_807);
    float _829 = precise::max(_827, 0.0);
    uint _832 = uint(_829);
    float _834 = float(uint(_795));
    float _836 = 0.0;
    int _838 = as_type<int>(_834);
    float _840 = _825;
    if (_721)
    {
        _836 = _825;
    }
    float _842 = _836;
    float _844 = trunc(_819);
    float _846 = precise::max(_844, 0.0);
    uint _848 = uint(_846);
    float _850 = float(_815);
    float _852 = 1.0 / _850;
    float _854 = 1.0 / _834;
    float _856 = _850;
    float _858 = _842;
    if (_721)
    {
        _856 = _825;
    }
    float _860 = _856;
    float _862 = _860;
    if (_721)
    {
        _838 = 0;
    }
    int _864 = _838;
    int _866 = _864;
    if (!_721)
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
        _801 = _868;
        _840 = _870;
        _771 = 5.839270114898681640625;
        _862 = _872;
        _803 = _870;
        _858 = _884;
        _823 = 1;
        _866 = 2;
        _809 = _888;
    }
    float _890 = _737;
    float _892 = _801;
    float _894 = _840;
    float _896 = _771;
    float _898 = _862;
    float _900 = _803;
    float _902 = _858;
    int _904 = _823;
    int _906 = _866;
    float _908 = _809;
    float _910 = in.m_62.z;
    float _912 = in.m_62.w;
    int _914 = ~_745;
    int _916 = _914 + 1;
    int _918 = _753 * int(_832);
    int _920 = _918 + _783;
    float _922 = _852 * _125;
    float _924 = _890 * _892;
    float _926 = _890 * _894;
    int _928 = _916 * int(_848);
    int _930 = _928 + _789;
    float _932 = float(uint(_920));
    float _934 = floor(_924);
    float _936 = _896 * _898;
    float _938 = _165 * _125;
    float _940 = float(uint(_930));
    float _942 = as_type<float>(_785) * _932;
    float _944 = float(_731);
    float _946 = _892 * 2.0;
    float _948 = trunc(_922);
    int _950 = int(_948);
    float _952 = float(_783);
    float _954 = _892 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _958 = _956 != 0;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _962 = _713 + _960;
    bool _964 = _900 > 0.5;
    int _966 = ~_731;
    int _968 = _966 + 1;
    float _970 = trunc(_942);
    float _972 = precise::max(_970, 0.0);
    uint _974 = uint(_972);
    bool _976 = _912 > 0.5;
    float _978 = as_type<float>(_791) * _940;
    float _980 = -_934;
    float _982 = _924 + _980;
    int _984 = as_type<int>(_854) + (-2);
    bool _986 = _910 > 0.5;
    float _988 = floor(_936);
    float _990 = float(uint(_950));
    bool _992 = _952 >= _944;
    bool _994 = isnan(_952);
    bool _996 = _992 || _994;
    bool _998 = isnan(_944);
    bool _1000 = _996 || _998;
    float _1002 = float(_1000);
    int _1004 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1006 = _1004 != 0;
    int _1008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1010 = _1008 != 0;
    int _1012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1014 = _1012 != 0;
    float _1016 = as_type<float>(_984) * _990;
    float _1018 = -_215;
    int _1020 = _964 ? as_type<int>(_1018) : as_type<int>(_215);
    float _1022 = trunc(_978);
    float _1024 = precise::max(_1022, 0.0);
    uint _1026 = uint(_1024);
    int _1028 = int(_832) + int(_974);
    int _1030 = ~_745;
    int _1032 = _1030 + 1;
    int _1034 = _968 * _1028;
    int _1036 = _1034 + _783;
    int _1038 = int(_976);
    int _1040 = _986 ? 2 : 0;
    int _1042 = _1038 | _1040;
    int _1044 = _958 ? 4 : 0;
    int _1046 = _1042 | _1044;
    int _1048 = _1006 ? 8 : 0;
    int _1050 = _1046 | _1048;
    int _1052 = _1010 ? 16 : 0;
    int _1054 = _1050 | _1052;
    int _1056 = _1014 ? 32 : 0;
    int _1058 = _1054 | _1056;
    int _1060 = _964 ? 64 : 0;
    int _1062 = _1058 | _1060;
    int _1064 = _1062 & 64;
    float _1066 = trunc(_1016);
    float _1068 = precise::max(_1066, 0.0);
    uint _1070 = uint(_1068);
    float _1072 = -_988;
    float _1074 = _936 + _1072;
    float _1076 = -_219;
    int _1078 = _986 ? as_type<int>(_1076) : as_type<int>(_219);
    bool _1080 = !_958;
    int _1082 = _1080 ? 0 : 1;
    bool _1084 = !_1014;
    float _1086 = _1084 ? _219 : as_type<float>(_1078);
    float _1088 = _982 * _944;
    int _1090 = int(_848) + int(_1026);
    float _1092 = floor(_926);
    float _1094 = _944 * _938;
    float _1096 = float(_745);
    float _1098 = float(_789);
    int _1100 = _1032 * _1090;
    int _1102 = _1100 + _789;
    int _1104 = abs(_1082);
    float _1106 = trunc(_1002);
    int _1108 = int(_1106);
    float _1110 = _1074 * _1096;
    int _1112 = _731 + (-1);
    float _1114 = trunc(_1088);
    int _1116 = int(_1114);
    bool _1118 = !_1010;
    float _1120 = _1118 ? _215 : as_type<float>(_1020);
    int _1122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1124 = _1122 != 0;
    int _1126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1128 = _1126 != 0;
    int _1130 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1132 = _1130 != 0;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    bool _1136 = uint(_1036) >= uint(_731);
    int _1138 = ~_795;
    int _1140 = _1138 + 1;
    float _1142 = trunc(_1094);
    int _1144 = int(_1142);
    bool _1146 = !_1128;
    int _1148 = _1146 ? 0 : 1;
    float _1150 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1134);
    bool _1152 = !_1124;
    int _1154 = _1152 ? 0 : 1;
    int _1156 = _1140 * int(_1070);
    int _1158 = _1156 + _950;
    int _1160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1162 = _1160 != 0;
    float _1164 = _902 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _1166 = uint(_1102) >= uint(_745);
    float _1168 = trunc(_1110);
    int _1170 = int(_1168);
    bool _1172 = _1098 >= _1096;
    bool _1174 = isnan(_1098);
    bool _1176 = _1172 || _1174;
    bool _1178 = isnan(_1096);
    bool _1180 = _1176 || _1178;
    float _1182 = float(_1180);
    float _1184 = _1096 * _938;
    bool _1186 = !_1132;
    int _1188 = _1186 ? 0 : 1;
    float _1190 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1150);
    bool _1192 = !_1162;
    int _1194 = _1192 ? 0 : 1;
    bool _1196 = !_1166;
    int _1198 = _1196 ? 0 : (-1);
    float _1200 = trunc(_1182);
    int _1202 = int(_1200);
    int _1204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1206 = _1204 != 0;
    int _1208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1210 = _1208 != 0;
    int _1212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1214 = _1212 != 0;
    float _1216 = -_1190;
    float _1218 = _1216 + 1.0;
    bool _1220 = !_1136;
    int _1222 = _1220 ? 0 : (-1);
    int _1224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1226 = _1224 != 0;
    int _1228 = ~_1028;
    int _1230 = _1228 + _1222;
    int _1232 = _1230 + 1;
    float _1234 = trunc(_1184);
    int _1236 = int(_1234);
    float _1238 = -_1092;
    float _1240 = _926 + _1238;
    float _1242 = float(uint(_1158));
    bool _1244 = !_1210;
    int _1246 = _1244 ? 0 : 1;
    bool _1248 = _1064 != 0;
    float _1250 = as_type<float>(_984) * _1242;
    float _1252 = floor(_946);
    int _1254 = ~_1090;
    int _1256 = _1254 + _1198;
    int _1258 = _1256 + 1;
    bool _1260 = !_1226;
    int _1262 = _1260 ? 0 : 1;
    int _1264 = _1116 * _1104;
    int _1266 = _1264 + _783;
    bool _1268 = _731 == 0;
    int _1270 = _731 * _1232;
    int _1272 = _1270 + _783;
    bool _1274 = !_1206;
    int _1276 = _1274 ? 0 : 1;
    int _1278 = _745 * _1258;
    int _1280 = _1278 + _789;
    bool _1282 = _745 == 0;
    float _1284 = trunc(_1250);
    float _1286 = precise::max(_1284, 0.0);
    uint _1288 = uint(_1286);
    int _1290 = ~_1108;
    int _1292 = _1290 + 1;
    int _1294 = _1292 + 1;
    bool _1296 = !_1268;
    int _1298 = _1296 ? _1272 : (-1);
    int _1300 = ~_1202;
    int _1302 = _1300 + 1;
    int _1304 = _1302 + 1;
    bool _1306 = !_1282;
    int _1308 = _1306 ? _1280 : (-1);
    int _1310 = _1298 * _1294;
    int _1312 = abs(_1148);
    int _1314 = _745 + (-1);
    int _1316 = _1308 * _1304;
    int _1318 = abs(_1246);
    int _1320 = _1108 * _1112;
    int _1322 = _1320 + _1310;
    int _1324 = abs(_1154);
    int _1326 = _1202 * _1314;
    int _1328 = _1326 + _1316;
    int _1330 = _1322 * _1312;
    int _1332 = abs(_1188);
    int _1334 = abs(_1262);
    int _1336 = _1328 * _1318;
    int _1338 = abs(_1194);
    int _1340 = _1170 * _1334;
    int _1342 = _1340 + _789;
    int _1344 = _1144 * _1324;
    int _1346 = _1344 + _1330;
    int _1348 = int(_1070) + int(_1288);
    int _1350 = ~_795;
    int _1352 = _1350 + 1;
    int _1354 = _1266 * _1332;
    int _1356 = _1354 + _1346;
    int _1358 = abs(_1276);
    int _1360 = _1352 * _1348;
    int _1362 = _1360 + _950;
    float _1364 = -_219;
    int _1366 = _976 ? as_type<int>(_1364) : as_type<int>(_219);
    int _1368 = _1116 * _1338;
    int _1370 = _1368 + _1356;
    bool _1372 = uint(_1362) >= uint(_795);
    float _1374 = float(uint(_1370));
    int _1376 = _1236 * _1358;
    int _1378 = _1376 + _1336;
    float _1380 = float(_795);
    float _1382 = -_215;
    int _1384 = _986 ? as_type<int>(_1382) : as_type<int>(_215);
    float _1386 = as_type<float>(_785) * _1374;
    float _1388 = float(_950);
    float _1390 = _1240 * _1380;
    int _1392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1394 = _1392 != 0;
    float _1396 = trunc(_1386);
    float _1398 = precise::max(_1396, 0.0);
    uint _1400 = uint(_1398);
    bool _1402 = _1388 >= _1380;
    bool _1404 = isnan(_1388);
    bool _1406 = _1402 || _1404;
    bool _1408 = isnan(_1380);
    bool _1410 = _1406 || _1408;
    float _1412 = float(_1410);
    float _1414 = _1380 * _938;
    bool _1416 = !_1214;
    int _1418 = _1416 ? 0 : 1;
    int _1420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1422 = _1420 != 0;
    bool _1424 = !_1394;
    int _1426 = _1424 ? 0 : 1;
    float _1428 = trunc(_1412);
    int _1430 = int(_1428);
    bool _1432 = !_1422;
    int _1434 = _1432 ? 0 : 1;
    int _1436 = abs(_1418);
    int _1438 = abs(_1426);
    bool _1440 = !_1006;
    float _1442 = _1440 ? _219 : as_type<float>(_1366);
    int _1444 = _1342 * _1436;
    int _1446 = _1444 + _1378;
    bool _1448 = !_1372;
    int _1450 = _1448 ? 0 : (-1);
    float _1452 = trunc(_1414);
    int _1454 = int(_1452);
    int _1456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1458 = _1456 != 0;
    int _1460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1462 = _1460 != 0;
    int _1464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1466 = _1464 != 0;
    int _1468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1470 = _1468 != 0;
    int _1472 = ~_1348;
    int _1474 = _1472 + _1450;
    int _1476 = _1474 + 1;
    bool _1478 = !_1462;
    int _1480 = _1478 ? 0 : 1;
    int _1482 = _1170 * _1438;
    int _1484 = _1482 + _1446;
    int _1486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1488 = _1486 != 0;
    int _1490 = _795 * _1476;
    int _1492 = _1490 + _950;
    int _1494 = ~_731;
    int _1496 = _1494 + 1;
    float _1498 = trunc(_1390);
    int _1500 = int(_1498);
    bool _1502 = !_1458;
    int _1504 = _1502 ? 0 : 1;
    bool _1506 = _795 == 0;
    int _1508 = _1496 * int(_1400);
    int _1510 = _1508 + _1370;
    float _1512 = float(uint(_1484));
    int _1514 = ~_1430;
    int _1516 = _1514 + 1;
    int _1518 = _1516 + 1;
    bool _1520 = !_1506;
    int _1522 = _1520 ? _1492 : (-1);
    float _1524 = as_type<float>(_791) * _1512;
    float _1526 = float(uint(_1510));
    float _1528 = _1512;
    float _1530 = as_type<float>(_1370);
    float _1532 = as_type<float>(_1070);
    if (_1488)
    {
        float _1534 = in.m_62.w;
        _1528 = _1534;
    }
    float _1536 = _1528;
    int _1538 = abs(_1480);
    int _1540 = _1522 * _1518;
    int _1542 = _795 + (-1);
    float _1544 = as_type<float>(_785) * _1526;
    float _1546 = trunc(_1524);
    float _1548 = precise::max(_1546, 0.0);
    uint _1550 = uint(_1548);
    int _1552 = abs(_1434);
    int _1554 = abs(_1504);
    int _1556 = _1430 * _1542;
    int _1558 = _1556 + _1540;
    float _1560 = trunc(_1544);
    float _1562 = precise::max(_1560, 0.0);
    uint _1564 = uint(_1562);
    int _1566 = _1558 * _1538;
    int _1568 = ~_745;
    int _1570 = _1568 + 1;
    int _1572 = _1500 * _1552;
    int _1574 = _1572 + _950;
    bool _1576 = _731 == 0;
    int _1578 = _1454 * _1554;
    int _1580 = _1578 + _1566;
    bool _1582 = !_1466;
    int _1584 = _1582 ? 0 : 1;
    int _1586 = ~_731;
    int _1588 = _1586 + 1;
    int _1590 = _1570 * int(_1550);
    int _1592 = _1590 + _1484;
    float _1594 = as_type<float>(_1552);
    if (_1488)
    {
        float _1596 = _1536 * 3.1415927410125732421875;
        _1594 = _1596;
    }
    float _1598 = _1594;
    int _1600 = abs(_1584);
    bool _1602 = !_1470;
    int _1604 = _1602 ? 0 : 1;
    float _1606 = _1598;
    if (_1488)
    {
        float _1608 = _1598 * 0.15915493667125701904296875;
        _1606 = _1608;
    }
    float _1610 = _1606;
    int _1612 = int(_1400) + int(_1564);
    float _1614 = float(uint(_1592));
    int _1616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1618 = _1616 != 0;
    int _1620 = _1588 * _1612;
    int _1622 = _1620 + _1370;
    int _1624 = abs(_1604);
    float _1626 = as_type<float>(_791) * _1614;
    float _1628 = _1610;
    if (_1488)
    {
        float _1630 = _1610 * 6.283185482025146484375;
        float _1632 = sin(_1630);
        _1628 = _1632;
    }
    float _1634 = _1628;
    float _1636 = 0.0;
    if (!_1488)
    {
        _1636 = _215;
    }
    float _1638 = _1636;
    bool _1640 = uint(_1622) >= uint(_731);
    int _1642 = _1574 * _1600;
    int _1644 = _1642 + _1580;
    float _1646 = float(uint(_1266));
    float _1648 = trunc(_1626);
    float _1650 = precise::max(_1648, 0.0);
    uint _1652 = uint(_1650);
    bool _1654 = !_1640;
    int _1656 = _1654 ? 0 : (-1);
    float _1658 = as_type<float>(_1564);
    float _1660 = _1638;
    if (_1618)
    {
        float _1662 = in.m_62.x;
        _1658 = _1662;
    }
    float _1664 = _1658;
    int _1666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1668 = _1666 != 0;
    float _1670 = as_type<float>(_785) * _1646;
    int _1672 = ~_1612;
    int _1674 = _1672 + _1656;
    int _1676 = _1674 + 1;
    int _1678 = _1500 * _1624;
    int _1680 = _1678 + _1644;
    bool _1682 = !_1668;
    float _1684 = _1682 ? _215 : as_type<float>(_1384);
    bool _1686 = _1668;
    if (_1488)
    {
        bool _1688 = _1634 > 0.5;
        _1686 = _1688;
    }
    bool _1690 = _1686;
    float _1692 = trunc(_1670);
    float _1694 = precise::max(_1692, 0.0);
    uint _1696 = uint(_1694);
    int _1698 = _731 * _1676;
    int _1700 = _1698 + _1370;
    float _1702 = float(uint(_1680));
    if (_1488)
    {
        float _1704 = -_215;
        float _1706 = _1690 ? _1704 : _215;
        _1660 = _1706;
    }
    float _1708 = _1660;
    bool _1710 = !_1576;
    int _1712 = _1710 ? _1700 : (-1);
    int _1714 = int(_1550) + int(_1652);
    float _1716 = as_type<float>(_984) * _1702;
    int _1718 = _1712 & 3;
    bool _1720 = _1718 != 0;
    int _1722 = _1712 & 3;
    bool _1724 = _1722 != 0;
    float _1726 = trunc(_1716);
    float _1728 = precise::max(_1726, 0.0);
    uint _1730 = uint(_1728);
    int _1732 = ~_731;
    int _1734 = _1732 + 1;
    int _1736 = _1720 ? 0 : 1;
    float _1738 = _1708;
    if (_1618)
    {
        float _1740 = _1664 * 3.1415927410125732421875;
        _1530 = _1740;
    }
    float _1742 = _1530;
    bool _1744 = uint(_1722) > 1u;
    int _1746 = _1734 * int(_1696);
    int _1748 = _1746 + _1266;
    float _1750 = float(uint(_1342));
    float _1752 = _1742;
    if (_1618)
    {
        float _1754 = _1742 * 0.15915493667125701904296875;
        _1752 = _1754;
    }
    float _1756 = _1752;
    int _1758 = ~_745;
    int _1760 = _1758 + 1;
    float _1762 = float(uint(_1748));
    float _1764 = as_type<float>(_791) * _1750;
    int _1766 = ~_795;
    int _1768 = _1766 + 1;
    int _1770 = _1760 * _1714;
    int _1772 = _1770 + _1484;
    int _1774 = ~_1736;
    int _1776 = _1774 + 1;
    int _1778 = _1776 + 1;
    float _1780 = as_type<float>(_785) * _1762;
    float _1782 = trunc(_1764);
    float _1784 = precise::max(_1782, 0.0);
    uint _1786 = uint(_1784);
    int _1788 = _1768 * int(_1730);
    int _1790 = _1788 + _1680;
    int _1792 = _1778;
    if (!_1744)
    {
        int _1794 = ~_1736;
        int _1796 = _1794 + 1;
        _1792 = _1796;
    }
    int _1798 = _1792;
    float _1800 = -_219;
    int _1802 = _1248 ? as_type<int>(_1800) : as_type<int>(_219);
    bool _1804 = uint(_1722) >= 2u;
    bool _1806 = uint(_1772) >= uint(_745);
    float _1808 = _1756;
    if (_1618)
    {
        float _1810 = _1756 * 6.283185482025146484375;
        float _1812 = sin(_1810);
        _1808 = _1812;
    }
    float _1814 = _1808;
    float _1816 = float(uint(_1790));
    int _1818 = _1804 ? 0 : 1;
    bool _1820 = _1722 != 3;
    float _1822 = as_type<float>(_984) * _1816;
    bool _1824 = !_1806;
    int _1826 = _1824 ? 0 : (-1);
    float _1828 = trunc(_1780);
    float _1830 = precise::max(_1828, 0.0);
    uint _1832 = uint(_1830);
    int _1834 = ~_745;
    int _1836 = _1834 + 1;
    int _1838 = ~_1714;
    int _1840 = _1838 + _1826;
    int _1842 = _1840 + 1;
    int _1844 = ~_1818;
    int _1846 = _1844 + 1;
    int _1848 = _1846 + 1;
    int _1850 = _1836 * int(_1786);
    int _1852 = _1850 + _1342;
    float _1854 = 0.0;
    int _1856 = _1848;
    bool _1858 = _1820;
    if (!_1618)
    {
        _1854 = _219;
    }
    float _1860 = _1854;
    float _1862 = trunc(_1822);
    float _1864 = precise::max(_1862, 0.0);
    uint _1866 = uint(_1864);
    int _1868 = _745 * _1842;
    int _1870 = _1868 + _1484;
    float _1872 = _1860;
    if (_1820)
    {
        int _1874 = ~_1818;
        int _1876 = _1874 + 1;
        _1856 = _1876;
    }
    int _1878 = _1856;
    if (_1618)
    {
        bool _1880 = _1814 > 0.5;
        _1858 = _1880;
    }
    bool _1882 = _1858;
    bool _1884 = !_1282;
    int _1886 = _1884 ? _1870 : (-1);
    float _1888 = float(uint(_1852));
    if (_1618)
    {
        float _1890 = -_219;
        float _1892 = _1882 ? _1890 : _219;
        _1872 = _1892;
    }
    float _1894 = _1872;
    int _1896 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1898 = _1896 != 0;
    float _1900 = as_type<float>(_791) * _1888;
    int _1902 = _1886 & 3;
    bool _1904 = _1902 != 0;
    int _1906 = int(_1696) + int(_1832);
    bool _1908 = !_1898;
    float _1910 = _1908 ? _219 : as_type<float>(_1802);
    float _1912 = trunc(_1900);
    float _1914 = precise::max(_1912, 0.0);
    uint _1916 = uint(_1914);
    bool _1918 = uint(_1902) > 1u;
    int _1920 = int(_1730) + int(_1866);
    int _1922 = ~_795;
    int _1924 = _1922 + 1;
    int _1926 = _1886 & 3;
    bool _1928 = _1926 != 0;
    int _1930 = ~_731;
    int _1932 = _1930 + 1;
    int _1934 = _1924 * _1920;
    int _1936 = _1934 + _1680;
    int _1938 = _1928 ? 0 : 1;
    float _1940 = float(uint(_1574));
    int _1942 = _1932 * _1906;
    int _1944 = _1942 + _1266;
    int _1946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1948 = _1946 != 0;
    int _1950 = ~_1938;
    int _1952 = _1950 + 1;
    int _1954 = _1952 + 1;
    float _1956 = as_type<float>(_984) * _1940;
    bool _1958 = !_1948;
    int _1960 = _1958 ? 0 : 1;
    bool _1962 = uint(_1936) >= uint(_795);
    int _1964 = _1954;
    float _1966 = as_type<float>(_1866);
    if (!_1918)
    {
        int _1968 = ~_1938;
        int _1970 = _1968 + 1;
        _1964 = _1970;
    }
    int _1972 = _1964;
    float _1974 = trunc(_1956);
    float _1976 = precise::max(_1974, 0.0);
    uint _1978 = uint(_1976);
    bool _1980 = uint(_1944) >= uint(_731);
    bool _1982 = !_1962;
    int _1984 = _1982 ? 0 : (-1);
    bool _1986 = _1902 != 3;
    int _1988 = ~_745;
    int _1990 = _1988 + 1;
    bool _1992 = !_1980;
    int _1994 = _1992 ? 0 : (-1);
    bool _1996 = uint(_1902) >= 2u;
    int _1998 = int(_1786) + int(_1916);
    int _2000 = ~_1920;
    int _2002 = _2000 + _1984;
    int _2004 = _2002 + 1;
    int _2006 = ~_795;
    int _2008 = _2006 + 1;
    int _2010 = _795 * _2004;
    int _2012 = _2010 + _1680;
    int _2014 = _1996 ? 0 : 1;
    int _2016 = _1990 * _1998;
    int _2018 = _2016 + _1342;
    int _2020 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2022 = _2020 != 0;
    int _2024 = ~_2014;
    int _2026 = _2024 + 1;
    int _2028 = _2026 + 1;
    int _2030 = _2028;
    float _2032 = as_type<float>(_2012);
    if (_1986)
    {
        int _2034 = ~_2014;
        int _2036 = _2034 + 1;
        _2030 = _2036;
    }
    int _2038 = _2030;
    int _2040 = _2008 * int(_1978);
    int _2042 = _2040 + _1574;
    int _2044 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2046 = _2044 != 0;
    bool _2048 = !_2022;
    int _2050 = _2048 ? 0 : 1;
    bool _2052 = uint(_2018) >= uint(_745);
    bool _2054 = !_1506;
    int _2056 = _2054 ? _2012 : (-1);
    bool _2058 = !_2046;
    int _2060 = _2058 ? 0 : 1;
    bool _2062 = !_2052;
    int _2064 = _2062 ? 0 : (-1);
    int _2066 = _2056 & 3;
    bool _2068 = _2066 != 0;
    int _2070 = _2056 & 3;
    bool _2072 = _2070 != 0;
    float _2074 = float(uint(_2042));
    int _2076 = _2068 ? 0 : 1;
    bool _2078 = uint(_2070) > 1u;
    float _2080 = as_type<float>(_984) * _2074;
    int _2082 = ~_2076;
    int _2084 = _2082 + 1;
    int _2086 = _2084 + 1;
    int _2088 = ~_795;
    int _2090 = _2088 + 1;
    float _2092 = trunc(_2080);
    float _2094 = precise::max(_2092, 0.0);
    uint _2096 = uint(_2094);
    float _2098 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2100 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    int _2102 = _2086;
    float _2104 = as_type<float>(_1978);
    if (!_2078)
    {
        int _2106 = ~_2076;
        int _2108 = _2106 + 1;
        _2102 = _2108;
    }
    int _2110 = _2102;
    float _2112 = -_2098;
    float _2114 = fma(_1164, 2.0, _2112);
    bool _2116 = uint(_2070) >= 2u;
    float _2118 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2120 = -_125;
    float _2122 = fma(_2120, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2114);
    int _2124 = _2116 ? 0 : 1;
    bool _2126 = _2070 != 3;
    float _2128 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2130 = int(_1978) + int(_2096);
    int _2132 = ~_2124;
    int _2134 = _2132 + 1;
    int _2136 = _2134 + 1;
    int _2138 = _2090 * _2130;
    int _2140 = _2138 + _1574;
    float _2142 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2144 = _2136;
    if (_2126)
    {
        int _2146 = ~_2124;
        int _2148 = _2146 + 1;
        _2144 = _2148;
    }
    int _2150 = _2144;
    float _2152 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2154 = uint(_2140) >= uint(_795);
    float _2156 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2158 = !_2154;
    int _2160 = _2158 ? 0 : (-1);
    float _2162 = -_2156;
    float _2164 = fma(_954, 2.0, _2162);
    bool _2166 = _892 > 0.5;
    float _2168 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2170 = _2168 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2172 = -_125;
    float _2174 = fma(_2172, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2164);
    float _2176 = -_215;
    int _2178 = _2166 ? as_type<int>(_2176) : as_type<int>(_215);
    float _2180 = 1.0 / _2170;
    bool _2182 = _904 != 1;
    float _2184 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2186 = in.m_48.x;
    float _2188 = in.m_48.y;
    float _2190 = in.m_48.z;
    int _2192 = abs(_2038);
    float _2194 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _2196 = ~_1906;
    int _2198 = _2196 + _1994;
    int _2200 = _2198 + 1;
    int _2202 = abs(_1798);
    float _2204 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2194);
    float _2206 = 0.0;
    if (!_2182)
    {
        _2206 = _900;
    }
    float _2208 = _2206;
    int _2210 = _731 * _2200;
    int _2212 = _2210 + _1266;
    float _2214 = 0.0;
    float _2216 = _2208;
    if (!_2182)
    {
        _2214 = _900;
    }
    float _2218 = _2214;
    float _2220 = _2218;
    if (!_2182)
    {
        _1966 = _910;
    }
    float _2222 = _1966;
    float _2224 = _2222;
    if (!_2182)
    {
        _1532 = _910;
    }
    float _2226 = _1532;
    float _2228 = _2226;
    if (_2182)
    {
        _2216 = _892;
    }
    float _2230 = _2216;
    if (_2182)
    {
        _2220 = _892;
    }
    float _2232 = _2220;
    if (_2182)
    {
        _2224 = _900;
    }
    float _2234 = _2224;
    float _2236 = _2188 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    if (_2182)
    {
        _2228 = _900;
    }
    float _2238 = _2228;
    float _2240 = _2188 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _2242 = _906 != 2;
    float _2244 = fma(_2186, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2236);
    float _2246 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2248 = _2188 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2250 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2252 = log2(_2250);
    float _2254 = fma(_2186, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2240);
    float _2256 = fma(_2186, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2248);
    float _2258 = _900 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2260 = fma(_2232, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2128);
    float _2262 = fma(_2190, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2254);
    float _2264 = fma(_2258, -2.0, _2246);
    float _2266 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    if (_2242)
    {
        _2104 = _892;
    }
    float _2268 = _2104;
    float _2270 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2260);
    float _2272 = _2268;
    if (_2242)
    {
        _2032 = _900;
    }
    float _2274 = _2032;
    float _2276 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2266);
    float _2278 = _2274;
    if (!_2242)
    {
        _2272 = _910;
    }
    float _2280 = _2272;
    float _2282 = _908 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2284 = _2252 * _125;
    if (!_2242)
    {
        _2278 = _892;
    }
    float _2286 = _2278;
    float _2288 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2264);
    int _2290 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2292 = _2290 != 0;
    float _2294 = fma(_2282, -2.0, _2100);
    float _2296 = exp2(_2284);
    bool _2298 = !_2292;
    float _2300 = _2298 ? _215 : as_type<float>(_2178);
    float _2302 = _2230 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _2304 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2306 = isnan(0.0);
    bool _2308 = _2304 || _2306;
    bool _2310 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2312 = _2308 || _2310;
    float _2314 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2316 = -_2118;
    float _2318 = fma(_2302, 2.0, _2316);
    float _2320 = _2280 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2322 = fma(_2238, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2314);
    float _2324 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2326 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2324;
    float _2328 = _2234 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2330 = -_2142;
    float _2332 = fma(_2320, 2.0, _2330);
    float _2334 = _2326 * _2180;
    float _2336 = -_2296;
    float _2338 = _2336 + 1.0;
    float _2340 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2342 = _2340 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2344 = fma(_2328, -2.0, _2152);
    float _2346 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2348 = _2346 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2350 = _2312 ? _2338 : 0.0;
    float _2352 = 1.0 / _2342;
    bool _2354 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2356 = isnan(1.0);
    bool _2358 = _2354 || _2356;
    bool _2360 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2362 = _2358 || _2360;
    float _2364 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2366 = 1.0 + _2364;
    float _2368 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2370 = _2368 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2372 = _2286 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2374 = 1.0 / _2366;
    float _2376 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2378 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2380 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2382 = fma(_2372, -2.0, _2184);
    float _2384 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2376);
    float _2386 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2378);
    float _2388 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2380);
    float _2390 = 1.0 / _2370;
    float _2392 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2394 = _2392 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2396 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2384);
    float _2398 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2386);
    float _2400 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2204);
    float _2402 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2388);
    float _2404 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2276);
    float _2406 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2294);
    float _2408 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2322);
    float _2410 = -_125;
    float _2412 = fma(_2410, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2318);
    float _2414 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2344);
    float _2416 = -_125;
    float _2418 = fma(_2416, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2332);
    float _2420 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2382);
    if (_2362)
    {
        float _2422 = _2350 * _2374;
        _135 = _2422;
    }
    float _2424 = _135;
    float _2426 = _900 * 2.0;
    bool _2428 = _1252 >= 0.0;
    bool _2430 = isnan(_1252);
    bool _2432 = _2428 || _2430;
    bool _2434 = isnan(0.0);
    bool _2436 = _2432 || _2434;
    float _2438 = 1.0 / _2394;
    float _2440 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2442 = _2440 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _2444 = _2436 ? 0 : 1;
    float _2446 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2448 = _2446 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _2450 = _1252 > 0.0;
    float _2452 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2454 = _2452 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2456 = floor(_2426);
    float _2458 = _2448 * _2390;
    float _2460 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2462 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2460;
    float _2464 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2466 = _2464 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2468 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2470 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2468;
    float _2472 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2474 = _2472 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2476 = fma(_2190, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2256);
    float _2478 = -_2408;
    float _2480 = _2478 + 1.0;
    float _2482 = 1.0 / _2348;
    float _2484 = _2474 * _2352;
    float _2486 = _2470 * _2438;
    int _2488 = ~_2444;
    int _2490 = _2488 + 1;
    int _2492 = _2490 + 1;
    float _2494 = -_2400;
    float _2496 = _2494 + 1.0;
    int _2498 = _2492;
    if (!_2450)
    {
        int _2500 = ~_2444;
        int _2502 = _2500 + 1;
        _2498 = _2502;
    }
    int _2504 = _2498;
    float _2506 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2508 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2506;
    float _2510 = 1.0 / _2442;
    bool _2512 = _2456 >= 0.0;
    bool _2514 = isnan(_2456);
    bool _2516 = _2512 || _2514;
    bool _2518 = isnan(0.0);
    bool _2520 = _2516 || _2518;
    float _2522 = -_2402;
    float _2524 = _2522 + 1.0;
    int _2526 = abs(_2110);
    int _2528 = _2520 ? 0 : 1;
    bool _2530 = _2456 > 0.0;
    float _2532 = 1.0 / _2454;
    float _2534 = _2462 * _2482;
    bool _2536 = _713 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2538 = isnan(_713);
    bool _2540 = _2536 || _2538;
    bool _2542 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2544 = _2540 || _2542;
    float _2546 = float(_2544);
    bool _2548 = _713 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2550 = isnan(_713);
    bool _2552 = _2548 || _2550;
    bool _2554 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2556 = _2552 || _2554;
    float _2558 = float(_2556);
    int _2560 = ~_2526;
    int _2562 = _2560 + 1;
    int _2564 = _2562 + 1;
    float _2566 = _2466 * _2510;
    int _2568 = ~_1998;
    int _2570 = _2568 + _2064;
    int _2572 = _2570 + 1;
    float _2574 = _910 * 2.0;
    int _2576 = ~_2528;
    int _2578 = _2576 + 1;
    int _2580 = _2578 + 1;
    int _2582 = _2580;
    if (!_2530)
    {
        int _2584 = ~_2528;
        int _2586 = _2584 + 1;
        _2582 = _2586;
    }
    int _2588 = _2582;
    int _2590 = _745 * _2572;
    int _2592 = _2590 + _1342;
    bool _2594 = _713 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2596 = isnan(_713);
    bool _2598 = _2594 || _2596;
    bool _2600 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2602 = _2598 || _2600;
    float _2604 = float(_2602);
    float _2606 = _2508 * _2532;
    bool _2608 = _713 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2610 = isnan(_713);
    bool _2612 = _2608 || _2610;
    bool _2614 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2616 = _2612 || _2614;
    float _2618 = float(_2616);
    float _2620 = -_2546;
    float _2622 = _2620 + 1.0;
    float _2624 = floor(_2574);
    bool _2626 = !_1282;
    int _2628 = _2626 ? _2592 : (-1);
    float _2630 = _2618 * _2622;
    float _2632 = -_2618;
    float _2634 = _2632 + 1.0;
    float _2636 = -_2558;
    float _2638 = _2636 + 1.0;
    bool _2640 = !_1904;
    int _2642 = _2640 ? 0 : 1;
    int _2644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2646 = _2644 != 0;
    int _2648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2650 = _2648 != 0;
    int _2652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2654 = _2652 != 0;
    float _2656 = _2604 * _2638;
    int _2658 = _1886 >> 31;
    float _2660 = -_2604;
    float _2662 = _2660 + 1.0;
    bool _2664 = _713 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2666 = isnan(_713);
    bool _2668 = _2664 || _2666;
    bool _2670 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2672 = _2668 || _2670;
    float _2674 = float(_2672);
    float _2676 = _2558 * _2634;
    int _2678 = _2658 & 3;
    bool _2680 = _713 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2682 = isnan(_713);
    bool _2684 = _2680 || _2682;
    bool _2686 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2688 = _2684 || _2686;
    float _2690 = float(_2688);
    float _2692 = -_2674;
    float _2694 = _2692 + 1.0;
    int _2696 = _1886 + _2678;
    float _2698 = _2674 * _2662;
    bool _2700 = _2624 >= 0.0;
    bool _2702 = isnan(_2624);
    bool _2704 = _2700 || _2702;
    bool _2706 = isnan(0.0);
    bool _2708 = _2704 || _2706;
    float _2710 = _2690 * _2694;
    int _2712 = _2696 >> 2;
    float _2714 = -_2690;
    float _2716 = _2714 + 1.0;
    bool _2718 = _713 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2720 = isnan(_713);
    bool _2722 = _2718 || _2720;
    bool _2724 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2726 = _2722 || _2724;
    float _2728 = float(_2726);
    float _2730 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2732 = _713 + _2730;
    int _2734 = _2708 ? 0 : 1;
    int _2736 = _2712 << 4;
    int _2738 = _2736 + 656;
    float _2740 = fma(_2334, _2732, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2742 = _2624 > 0.0;
    float _2744 = _2728 * _2716;
    float _2746 = -_2728;
    float _2748 = _2746 + 1.0;
    float _2750 = fma(_2190, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2244);
    bool _2752 = _713 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2754 = isnan(_713);
    bool _2756 = _2752 || _2754;
    bool _2758 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2760 = _2756 || _2758;
    float _2762 = float(_2760);
    uint _2764 = uint(int(uint(_2738) >> uint(2)));
    uint _2766 = uint(int(uint(int(_2764)) >> uint(2)));
    int _2768 = int(_2764) & 3;
    float _2770 = (*spvDescriptorSet0.vp_c9)._m0[int(_2766)][_2768];
    int _2772 = int(_2764) + 1;
    uint _2774 = uint(int(uint(_2772) >> uint(2)));
    int _2776 = _2772 & 3;
    float _2778 = (*spvDescriptorSet0.vp_c9)._m0[int(_2774)][_2776];
    float _2780 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2782 = _713 + _2780;
    float _2784 = _2750 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _2786 = abs(_2642);
    float _2788 = _2762 * _2748;
    float _2790 = fma(_2458, _962, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2792 = -_2762;
    float _2794 = _2792 + 1.0;
    float _2796 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2798 = _713 + _2796;
    float _2800 = _2740 * _2788;
    float _2802 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2804 = _713 + _2802;
    float _2806 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2808 = _713 + _2806;
    float _2810 = fma(_2484, _2798, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2812 = fma(_2794, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2800);
    float _2814 = fma(_2486, _2782, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2816 = fma(_2534, _2804, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2818 = _900 + _892;
    int _2820 = _2738 + 8;
    uint _2822 = uint(int(uint(_2820) >> uint(2)));
    uint _2824 = uint(int(uint(int(_2822)) >> uint(2)));
    int _2826 = int(_2822) & 3;
    float _2828 = (*spvDescriptorSet0.vp_c9)._m0[int(_2824)][_2826];
    int _2830 = int(_2822) + 1;
    uint _2832 = uint(int(uint(_2830) >> uint(2)));
    int _2834 = _2830 & 3;
    float _2836 = (*spvDescriptorSet0.vp_c9)._m0[int(_2832)][_2834];
    float _2838 = fma(_2790, _2744, _2812);
    float _2840 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2842 = _713 + _2840;
    int _2844 = ~_2734;
    int _2846 = _2844 + 1;
    int _2848 = _2846 + 1;
    float _2850 = _900 + (-0.5);
    float _2852 = fma(_2814, _2710, _2838);
    float _2854 = fma(_2566, _2842, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2856 = _2262 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2858 = _2848;
    if (!_2742)
    {
        int _2860 = ~_2734;
        int _2862 = _2860 + 1;
        _2858 = _2862;
    }
    int _2864 = _2858;
    float _2866 = _900 + _910;
    float _2868 = fma(_2810, _2698, _2852);
    float _2870 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2872 = _2856 + _2870;
    float _2874 = _2476 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2876 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2878 = _2784 + _2876;
    int _2880 = abs(_1972);
    float _2882 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2884 = fma(_2606, _2808, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2886 = _892 + _910;
    int _2888 = ~_2880;
    int _2890 = _2888 + 1;
    int _2892 = _2890 + 1;
    float _2894 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2882);
    bool _2896 = !_1724;
    int _2898 = _2896 ? 0 : 1;
    float _2900 = _892 + (-0.5);
    bool _2902 = _1902 != 3;
    float _2904 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2906 = int(_2904);
    float _2908 = _2818 + (-1.0);
    float _2910 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2912 = _2874 + _2910;
    float _2914 = fma(_2816, _2656, _2868);
    int _2916 = abs(_2050);
    float _2918 = _1708 + 0.5;
    float _2920 = fma(_2908, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2922 = _2892 * as_type<int>(_2778);
    int _2924 = ~_2786;
    int _2926 = _2924 + 1;
    int _2928 = _2926 + 1;
    float _2930 = fma(_2912, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2894);
    bool _2932 = !_2902;
    int _2934 = _2932 ? 0 : (-1);
    float _2936 = fma(_2918, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2122);
    float _2938 = fma(_2854, _2676, _2914);
    int _2940 = _2928 * as_type<int>(_2770);
    int _2942 = _2940 + _2922;
    int _2944 = abs(_2934);
    float _2946 = fma(_2884, _2630, _2938);
    int _2948 = ~_2192;
    int _2950 = _2948 + 1;
    int _2952 = _2950 + 1;
    int _2954 = ~_2944;
    int _2956 = _2954 + 1;
    int _2958 = _2956 + 1;
    float _2960 = fma(_2546, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2946);
    float _2962 = float(uint(_2906));
    int _2964 = _2952 * as_type<int>(_2828);
    int _2966 = _2964 + _2942;
    int _2968 = ~_2916;
    int _2970 = _2968 + 1;
    int _2972 = _2970 + 1;
    float _2974 = _1894 + (-0.5);
    bool _2976 = _2930 >= 0.0;
    int _2978 = _2958 * as_type<int>(_2836);
    int _2980 = _2978 + _2966;
    float _2982 = 1.0 / _2962;
    float _2984 = -_2974;
    float _2986 = -_2406;
    float _2988 = fma(_2984, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2986);
    float _2990 = _2300 + 0.5;
    int _2992 = _2980 * _2972;
    float _2994 = -_2404;
    float _2996 = _2994 + 1.0;
    float _2998 = _1910 + (-0.5);
    float _3000 = fma(_2990, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2174);
    float _3002 = -_1218;
    float _3004 = fma(_3002, _1708, _2936);
    float _3006 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3008 = _2628 * _2916;
    int _3010 = _3008 + _2992;
    float _3012 = fma(_2996, _1894, _2988);
    if (_2976)
    {
        _1738 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3014 = _1738;
    float _3016 = _1684 + 0.5;
    float _3018 = -_2998;
    float _3020 = -_2288;
    float _3022 = fma(_3018, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3020);
    float _3024 = float(uint(_3010));
    float _3026 = _1442 + (-0.5);
    float _3028 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3030 = as_type<int>(_2982) + (-2);
    int _3032 = as_type<int>(_2982);
    if (_2976)
    {
        float _3034 = _3014 * 5.0;
        _3032 = as_type<int>(_3034);
    }
    int _3036 = _3032;
    out.m_70.x = _3004;
    out.m_70.y = _3012;
    bool _3038 = !_2646;
    int _3040 = _3038 ? 0 : 1;
    float _3042 = as_type<float>(_3030) * _3024;
    int _3044 = abs(_2898);
    float _3046 = _3006 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_2976)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9474 = as_type<float>(_3036);
        out.gl_Position.z = _9474;
    }
    float _3048 = trunc(_3042);
    float _3050 = precise::max(_3048, 0.0);
    uint _3052 = uint(_3050);
    int _3054 = abs(_3040);
    float _3056 = fma(_3046, _3016, _2412);
    int _3058 = ~_2906;
    int _3060 = _3058 + 1;
    out.m_72.x = _2960;
    int _3062 = abs(_1960);
    float _3064 = _3028 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3066 = abs(_2906);
    if (_2976)
    {
        out.m_55.x = 0.0;
    }
    float _3068 = -_3064;
    float _3070 = -_2414;
    float _3072 = fma(_3068, _3026, _3070);
    float _3074 = _2872 * _2872;
    int _3076 = _1712 >> 31;
    float _3078 = fma(_1442, _2480, _3072);
    float _3080 = float(uint(_3066));
    float _3082 = fma(_2878, _2878, _3074);
    int _3084 = _2056 >> 31;
    int _3086 = _3060 * int(_3052);
    int _3088 = _3086 + _3010;
    int _3090 = _3076 & 3;
    float _3092 = 1.0 / _3080;
    int _3094 = _3084 & 3;
    int _3096 = _1712 + _3090;
    float _3098 = fma(_2912, _2912, _3082);
    float _3100 = -_2396;
    float _3102 = _3100 + 1.0;
    int _3104 = _2056 + _3094;
    float _3106 = _553 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3108 = rsqrt(_3098);
    float _3110 = -_3102;
    float _3112 = fma(_2300, _3110, _3000);
    int _3114 = abs(_3010);
    float _3116 = _3106 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _3118 = _3096 >> 2;
    int _3120 = _3104 >> 2;
    float _3122 = -_2270;
    float _3124 = _3122 + 1.0;
    int _3126 = as_type<int>(_3092) + (-2);
    float _3128 = -_2398;
    float _3130 = _3128 + 1.0;
    float _3132 = float(uint(_3114));
    float _3134 = -_3124;
    float _3136 = fma(_1684, _3134, _3056);
    float _3138 = float(uint(_3088));
    float _3140 = fma(_1910, _3130, _3022);
    int _3142 = _3118 << 4;
    int _3144 = _3142 + 368;
    float _3146 = as_type<float>(_3126) * _3132;
    int _3148 = _3120 << 4;
    int _3150 = _3148 + 800;
    float _3152 = as_type<float>(_3030) * _3138;
    float _3154 = _3116 * _3108;
    uint _3156 = uint(int(uint(_3144) >> uint(2)));
    uint _3158 = uint(int(uint(int(_3156)) >> uint(2)));
    int _3160 = int(_3156) & 3;
    float _3162 = (*spvDescriptorSet0.vp_c9)._m0[int(_3158)][_3160];
    int _3164 = int(_3156) + 1;
    uint _3166 = uint(int(uint(_3164) >> uint(2)));
    int _3168 = _3164 & 3;
    float _3170 = (*spvDescriptorSet0.vp_c9)._m0[int(_3166)][_3168];
    int _3172 = ~_3066;
    int _3174 = _3172 + 1;
    float _3176 = trunc(_3146);
    float _3178 = precise::max(_3176, 0.0);
    uint _3180 = uint(_3178);
    float _3182 = _2872 * _3154;
    float _3184 = _2878 * _3154;
    out.m_74.x = _3112;
    out.m_74.y = _3140;
    out.m_74.z = _3136;
    out.m_74.w = _3078;
    float _3186 = -_3182;
    float _3188 = _2872 + _3186;
    uint _3190 = uint(int(uint(_3150) >> uint(2)));
    uint _3192 = uint(int(uint(int(_3190)) >> uint(2)));
    int _3194 = int(_3190) & 3;
    float _3196 = (*spvDescriptorSet0.vp_c9)._m0[int(_3192)][_3194];
    int _3198 = int(_3190) + 1;
    uint _3200 = uint(int(uint(_3198) >> uint(2)));
    int _3202 = _3198 & 3;
    float _3204 = (*spvDescriptorSet0.vp_c9)._m0[int(_3200)][_3202];
    float _3206 = -_3184;
    float _3208 = _2878 + _3206;
    float _3210 = float(_2864);
    float _3212 = _3188 * _3188;
    float _3214 = float(_3054);
    float _3216 = trunc(_3152);
    float _3218 = precise::max(_3216, 0.0);
    uint _3220 = uint(_3218);
    int _3222 = ~_2130;
    int _3224 = _3222 + _2160;
    int _3226 = _3224 + 1;
    float _3228 = fma(_3208, _3208, _3212);
    int _3230 = _3144 + 8;
    uint _3232 = uint(int(uint(_3230) >> uint(2)));
    uint _3234 = uint(int(uint(int(_3232)) >> uint(2)));
    int _3236 = int(_3232) & 3;
    float _3238 = (*spvDescriptorSet0.vp_c9)._m0[int(_3234)][_3236];
    int _3240 = int(_3232) + 1;
    uint _3242 = uint(int(uint(_3240) >> uint(2)));
    int _3244 = _3240 & 3;
    float _3246 = (*spvDescriptorSet0.vp_c9)._m0[int(_3242)][_3244];
    float _3248 = _3214 * _3210;
    int _3250 = _3174 * int(_3180);
    int _3252 = _3250 + _3114;
    bool _3254 = _731 == 0;
    int _3256 = _795 * _3226;
    int _3258 = _3256 + _1574;
    float _3260 = float(uint(_3252));
    int _3262 = _3150 + 8;
    uint _3264 = uint(int(uint(_3262) >> uint(2)));
    uint _3266 = uint(int(uint(int(_3264)) >> uint(2)));
    int _3268 = int(_3264) & 3;
    float _3270 = (*spvDescriptorSet0.vp_c9)._m0[int(_3266)][_3268];
    int _3272 = int(_3264) + 1;
    uint _3274 = uint(int(uint(_3272) >> uint(2)));
    int _3276 = _3272 & 3;
    float _3278 = (*spvDescriptorSet0.vp_c9)._m0[int(_3274)][_3276];
    int _3280 = ~_2906;
    int _3282 = _3280 + 1;
    int _3284 = ~_2202;
    int _3286 = _3284 + 1;
    int _3288 = _3286 + 1;
    float _3290 = as_type<float>(_3126) * _3260;
    int _3292 = int(_3052) + int(_3220);
    bool _3294 = !_2072;
    int _3296 = _3294 ? 0 : 1;
    float _3298 = trunc(_3290);
    float _3300 = precise::max(_3298, 0.0);
    uint _3302 = uint(_3300);
    bool _3304 = _1722 != 3;
    int _3306 = _3282 * _3292;
    int _3308 = _3306 + _3010;
    int _3310 = ~_3066;
    int _3312 = _3310 + 1;
    bool _3314 = !_3254;
    int _3316 = _3314 ? _2212 : (-1);
    bool _3318 = !_1506;
    int _3320 = _3318 ? _3258 : (-1);
    int _3322 = _3288 * as_type<int>(_3170);
    bool _3324 = !_3304;
    int _3326 = _3324 ? 0 : (-1);
    bool _3328 = uint(_3308) >= uint(_2906);
    int _3330 = int(_3180) + int(_3302);
    bool _3332 = !_3328;
    int _3334 = _3332 ? 0 : (-1);
    int _3336 = _2564 * as_type<int>(_3204);
    int _3338 = abs(_3296);
    int _3340 = _3312 * _3330;
    int _3342 = _3340 + _3114;
    int _3344 = ~_3338;
    int _3346 = _3344 + 1;
    int _3348 = _3346 + 1;
    bool _3350 = _2070 != 3;
    int _3352 = ~_3044;
    int _3354 = _3352 + 1;
    int _3356 = _3354 + 1;
    int _3358 = _3348 * as_type<int>(_3196);
    int _3360 = _3358 + _3336;
    int _3362 = ~_3292;
    int _3364 = _3362 + _3334;
    int _3366 = _3364 + 1;
    bool _3368 = !_3350;
    int _3370 = _3368 ? 0 : (-1);
    int _3372 = _3356 * as_type<int>(_3162);
    int _3374 = _3372 + _3322;
    bool _3376 = uint(_3342) >= uint(_3066);
    int _3378 = _2906 * _3366;
    int _3380 = _3378 + _3010;
    int _3382 = abs(_2150);
    bool _3384 = !_3376;
    int _3386 = _3384 ? 0 : (-1);
    int _3388 = abs(_1878);
    bool _3390 = _2906 == 0;
    int _3392 = ~_3382;
    int _3394 = _3392 + 1;
    int _3396 = _3394 + 1;
    int _3398 = abs(_3326);
    int _3400 = ~_3388;
    int _3402 = _3400 + 1;
    int _3404 = _3402 + 1;
    int _3406 = _3396 * as_type<int>(_3270);
    int _3408 = _3406 + _3360;
    bool _3410 = !_3390;
    int _3412 = _3410 ? _3380 : (-1);
    float _3414 = _1120 + 0.5;
    bool _3416 = _2906 == 0;
    int _3418 = _3404 * as_type<int>(_3238);
    int _3420 = _3418 + _3374;
    int _3422 = _3010 ^ _2906;
    int _3424 = abs(_3370);
    int _3426 = ~_3398;
    int _3428 = _3426 + 1;
    int _3430 = _3428 + 1;
    float _3432 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    uint _3434 = uint(int(uint(_3422) >> uint(31)));
    int _3436 = ~_3424;
    int _3438 = _3436 + 1;
    int _3440 = _3438 + 1;
    int _3442 = _3430 * as_type<int>(_3246);
    int _3444 = _3442 + _3420;
    int _3446 = ~_3386;
    int _3448 = _3330 + _3446;
    int _3450 = _3448 + 1;
    int _3452 = ~int(_3434);
    int _3454 = _3452 + 1;
    float _3456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3458 = abs(_2060);
    int _3460 = _3440 * as_type<int>(_3278);
    int _3462 = _3460 + _3408;
    int _3464 = _3450 ^ _3454;
    int _3466 = ~_3062;
    int _3468 = _3466 + 1;
    int _3470 = _3468 + 1;
    int _3472 = ~_3454;
    int _3474 = _3472 + _3464;
    int _3476 = _3474 + 1;
    float _3478 = _3432 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3480 = in.m_76.x;
    float _3482 = in.m_76.y;
    float _3484 = in.m_76.z;
    int _3486 = ~_3458;
    int _3488 = _3486 + 1;
    int _3490 = _3488 + 1;
    int _3492 = _3444 * _3470;
    bool _3494 = !_3416;
    int _3496 = _3494 ? _3476 : (-1);
    float _3498 = float(_3412);
    int _3500 = _3462 * _3490;
    float _3502 = float(_3496);
    float _3504 = _3456 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3506 = _3316 * _3062;
    int _3508 = _3506 + _3492;
    float _3510 = fma(_3478, _3498, _2418);
    int _3512 = _3320 * _3458;
    int _3514 = _3512 + _3500;
    float _3516 = -_2420;
    float _3518 = fma(_3504, _3502, _3516);
    float _3520 = _1086 + (-0.5);
    float _3522 = fma(_3478, _3414, _3510);
    float _3524 = _3248 * (-2.0);
    float _3526 = -_3504;
    float _3528 = fma(_3526, _3520, _3518);
    float _3530 = float(_3508);
    float _3532 = -_2496;
    float _3534 = fma(_1120, _3532, _3522);
    float _3536 = float(_3514);
    float _3538 = fma(_1086, _2524, _3528);
    float _3540 = fma(_2920, _3524, _2920);
    float _3542 = _2912 * _3154;
    float _3544 = fma(_3524, _3480, _3480);
    bool _3546 = !_2650;
    int _3548 = _3546 ? 0 : 1;
    out.m_78.x = _3530;
    float _3550 = -_3542;
    float _3552 = _2912 + _3550;
    bool _3554 = !_2654;
    int _3556 = _3554 ? 0 : 1;
    out.m_78.w = _3536;
    int _3558 = abs(_3548);
    out.m_80.x = _3534;
    out.m_80.y = _3538;
    float _3560 = _3484;
    if (_2976)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3562 = -_3182;
    float _3564 = _2856 + _3562;
    float _3566 = float(_2504);
    float _3568 = -_3184;
    float _3570 = _2784 + _3568;
    float _3572 = float(_3558);
    float _3574 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3576 = _3564 + _3574;
    float _3578 = fma(_2900, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3544);
    float _3580 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3582 = _3570 + _3580;
    float _3584 = _3572 * _3566;
    int _3586 = abs(_3556);
    float _3588 = _3576 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3590 = -_3542;
    float _3592 = _2874 + _3590;
    float _3594 = fma(_3540, _2424, _3578);
    float _3596 = _2866 + (-1.0);
    float _3598 = fma(_3582, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3588);
    float _3600 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3602 = _3592 + _3600;
    float _3604 = float(_2588);
    float _3606 = fma(_3596, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3608 = float(_3586);
    float _3610 = fma(_3602, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3598);
    float _3612 = _3584 * (-2.0);
    float _3614 = _2886 + (-1.0);
    float _3616 = _910 + (-0.5);
    float _3618 = _3608 * _3604;
    float _3620 = fma(_3612, _3482, _3482);
    float _3622 = fma(_3606, _3612, _3606);
    bool _3624 = _3610 >= 0.0;
    float _3626 = _3618 * (-2.0);
    float _3628 = fma(_2850, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3620);
    float _3630 = fma(_3552, _3552, _3228);
    float _3632 = _3594 * 0.15915493667125701904296875;
    float _3634 = fma(_3622, _2424, _3628);
    float _3636 = fma(_3626, _3484, _3484);
    float _3638 = fma(_3614, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3640 = _3632 * 6.283185482025146484375;
    float _3642 = sin(_3640);
    float _3644 = _3634 * 0.15915493667125701904296875;
    float _3646 = fma(_3616, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3636);
    float _3648 = fma(_3638, _3626, _3638);
    if (_3624)
    {
        _3560 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3650 = _3560;
    int _3652 = as_type<int>(_3650);
    if (_3624)
    {
        out.m_55.x = 0.0;
    }
    float _3654 = fma(_3648, _2424, _3646);
    float _3656 = sqrt(_3630);
    if (_3624)
    {
        float _3658 = _3650 * 5.0;
        _3652 = as_type<int>(_3658);
    }
    int _3660 = _3652;
    float _3662 = _3654 * 0.15915493667125701904296875;
    if (_3624)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10373 = as_type<float>(_3660);
        out.gl_Position.z = _10373;
    }
    float _3664 = _3632 * 6.283185482025146484375;
    float _3666 = cos(_3664);
    float _3668 = _3644 * 6.283185482025146484375;
    float _3670 = sin(_3668);
    float _3672 = _3644 * 6.283185482025146484375;
    float _3674 = cos(_3672);
    if (_3624)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3676 = _3662 * 6.283185482025146484375;
    float _3678 = cos(_3676);
    float _3680 = _3108 * _3656;
    float _3682 = _551 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3684 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _219);
    float _3686 = _3666 * _3674;
    float _3688 = _3106 * _3680;
    float _3690 = _3680 * _3682;
    float _3692 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _215);
    float _3694 = _3662 * 6.283185482025146484375;
    float _3696 = sin(_3694);
    float _3698 = _3642 * _3674;
    float _3700 = _3684 * _3690;
    float _3702 = _3642 * _3670;
    float _3704 = _3666 * _3670;
    float _3706 = _3692 * _3688;
    float _3708 = _219 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3710 = _3666 * _3678;
    float _3712 = _3674 * _3678;
    float _3714 = _3642 * _3678;
    float _3716 = _3670 * _3678;
    float _3718 = _3710 * _3700;
    float _3720 = _3680 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3722 = _3720 * 0.5;
    float _3724 = fma(_3696, _3686, _3702);
    float _3726 = -_3698;
    float _3728 = fma(_3696, _3704, _3726);
    float _3730 = -_3700;
    float _3732 = _3696 * _3730;
    float _3734 = -_3704;
    float _3736 = fma(_3696, _3698, _3734);
    float _3738 = fma(_3724, _3706, _3718);
    float _3740 = _3714 * _3700;
    float _3742 = fma(_3712, _3706, _3732);
    float _3744 = fma(_3696, _3702, _3686);
    float _3746 = fma(_3728, _3722, _3738);
    float _3748 = fma(_3736, _3706, _3740);
    float _3750 = fma(_3716, _3722, _3742);
    float _3752 = _3724 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3754 = _3746 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3756 = _3746 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3758 = fma(_3744, _3722, _3748);
    float _3760 = fma(_3712, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3752);
    float _3762 = fma(_3750, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3754);
    float _3764 = fma(_3750, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3756);
    float _3766 = _3728 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3768 = _3728 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3770 = fma(_3758, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3762);
    float _3772 = fma(_3758, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3764);
    float _3774 = fma(_3716, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3768);
    float _3776 = _3770 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3778 = _3772 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3780 = _3724 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3782 = _2784 + _3776;
    float _3784 = _2874 + _3778;
    float _3786 = _3724 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3788 = _3746 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3790 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3792 = _3782 + _3790;
    float _3794 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3796 = _3784 + _3794;
    float _3798 = fma(_3712, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3780);
    float _3800 = fma(_3750, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3788);
    float _3802 = _3792 * _3792;
    float _3804 = _3796 * _3796;
    float _3806 = fma(_3712, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3786);
    float _3808 = fma(_3758, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3800);
    float _3810 = _3710 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3812 = _3802 + _3804;
    float _3814 = _3710 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3816 = _3808 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3818 = _3710 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3820 = sqrt(_3812);
    float _3822 = fma(_3708, _3708, 1.0);
    float _3824 = _3728 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3826 = _2856 + _3816;
    float _3828 = -_3696;
    float _3830 = fma(_3828, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3810);
    float _3832 = -_3696;
    float _3834 = fma(_3832, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3814);
    float _3836 = -_3696;
    float _3838 = fma(_3836, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3818);
    float _3840 = fma(_3716, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3824);
    float _3842 = rsqrt(_3822);
    float _3844 = fma(_3716, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3766);
    bool _3846 = _3820 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3848 = _3716;
    float _3850 = _3810;
    float _3852 = _3808;
    float _3854 = _3822;
    float _3856 = _3824;
    if (!_3846)
    {
        _3848 = _3804;
    }
    float _3858 = _3848;
    float _3860 = _3858;
    if (!_3846)
    {
        _3850 = _3802;
    }
    float _3862 = _3850;
    float _3864 = _3862;
    if (!_3846)
    {
        _3852 = _3782;
    }
    float _3866 = _3852;
    float _3868 = _3866;
    if (!_3846)
    {
        _3854 = _3784;
    }
    float _3870 = _3854;
    float _3872 = _3870;
    if (!_3846)
    {
        _3856 = _3826;
    }
    float _3874 = _3856;
    bool _3876 = !_3846;
    float _3878 = _3874;
    if (!_3876)
    {
        float _3880 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3882 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3884 = _3820 + _3882;
        float _3886 = rsqrt(_3812);
        float _3888 = _3884 * _3880;
        float _3890 = _3826 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3892 = _3888 * 0.15915493667125701904296875;
        float _3894 = _3892 * 6.283185482025146484375;
        float _3896 = sin(_3894);
        float _3898 = _3892 * 6.283185482025146484375;
        float _3900 = cos(_3898);
        float _3902 = fma(_3896, _3890, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3904 = _3886 * _3902;
        float _3906 = _3900 + (-1.0);
        float _3908 = fma(_3792, _3904, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3910 = fma(_3796, _3904, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3912 = _3906 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3914 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3916 = _3908 + _3914;
        float _3918 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3920 = _3910 + _3918;
        float _3922 = fma(_3826, _3900, _3912);
        float _3924 = _3916 * _3916;
        float _3926 = _3920 * _3920;
        _3878 = _3922;
        _3864 = _3924;
        _3860 = _3926;
        _3868 = _3908;
        _3872 = _3910;
    }
    float _3928 = _3878;
    float _3930 = _3864;
    float _3932 = _3860;
    float _3934 = _3868;
    float _3936 = _3872;
    float _3938 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3940 = _3928 + _3938;
    float _3942 = fma(_3714, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3830);
    float _3944 = fma(_3714, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3834);
    float _3946 = fma(_3714, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3838);
    float _3948 = fma(_3940, _3940, _3930);
    float _3950 = fma(_3744, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3840);
    float _3952 = fma(_3744, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3844);
    float _3954 = fma(_3744, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3774);
    float _3956 = _3948 + _3932;
    float _3958 = _3708 * _3842;
    float _3960 = fma(_3736, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3806);
    float _3962 = fma(_3736, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3798);
    float _3964 = _215 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3966 = _3708 * _3942;
    float _3968 = _3708 * _3944;
    float _3970 = fma(_3736, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3760);
    float _3972 = _3708 * _3946;
    float _3974 = -_3950;
    float _3976 = _3958 * _3974;
    float _3978 = -_3952;
    float _3980 = _3958 * _3978;
    float _3982 = -_3954;
    float _3984 = _3958 * _3982;
    float _3986 = sqrt(_3956);
    float _3988 = fma(_3964, _3960, _3966);
    float _3990 = fma(_3964, _3962, _3968);
    float _3992 = fma(_3964, _3970, _3972);
    float _3994 = fma(_3842, _3942, _3976);
    float _3996 = fma(_3842, _3944, _3980);
    float _3998 = fma(_3842, _3946, _3984);
    float _4000 = _3950 + _3988;
    float _4002 = _3952 + _3990;
    float _4004 = _3954 + _3992;
    out.m_82.x = _3960;
    out.m_82.y = _3962;
    out.m_82.z = _3970;
    out.m_84.x = _3994;
    out.m_84.y = _3996;
    out.m_84.z = _3998;
    bool _4006 = _3986 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4008 = isnan(_3986);
    bool _4010 = _4006 || _4008;
    bool _4012 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4014 = _4010 || _4012;
    out.m_86.x = _4000;
    out.m_86.y = _4002;
    out.m_86.z = _4004;
    float _4016 = _3990;
    if (!_4014)
    {
        _4016 = 1.0;
    }
    float _4018 = _4016;
    bool _4020 = !_4014;
    float _4022 = _4018;
    if (!_4020)
    {
        bool _4024 = _3986 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4026 = isnan(_3986);
        bool _4028 = _4024 || _4026;
        bool _4030 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4032 = _4028 || _4030;
        if (!_4032)
        {
            float _4034 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4036 = _3986 + _4034;
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
            bool _4054 = _3986 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4056 = isnan(_3986);
            bool _4058 = _4054 || _4056;
            bool _4060 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4062 = _4058 || _4060;
            if (!_4062)
            {
                float _4064 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4066 = _3986 + _4064;
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
    float _4086 = _3928 + _4084;
    float _4088 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4090 = _3934 + _4088;
    float _4092 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4094 = _3936 + _4092;
    float _4096 = fma(_4086, _4082, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4098 = fma(_4090, _4082, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4100 = fma(_4094, _4082, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4102 = -_2856;
    float _4104 = _4102 + _4096;
    float _4106 = -_2784;
    float _4108 = _4106 + _4098;
    float _4110 = -_2874;
    float _4112 = _4110 + _4100;
    float _4114 = _4104 * _4104;
    float _4116 = fma(_4108, _4108, _4114);
    float _4118 = fma(_4112, _4112, _4116);
    float _4120 = sqrt(_4118);
    bool _4122 = _4120 > 0.0;
    float _4124 = _4090;
    float _4126 = _4120;
    float _4128 = _4094;
    if (!_4122)
    {
        _4124 = _4098;
    }
    float _4130 = _4124;
    float _4132 = _4130;
    float _4134 = _4130;
    if (!_4122)
    {
        _4126 = _4096;
    }
    float _4136 = _4126;
    float _4138 = _4136;
    if (!_4122)
    {
        _4128 = _4100;
    }
    float _4140 = _4128;
    bool _4142 = !_4122;
    float _4144 = _4140;
    if (!_4142)
    {
        float _4146 = _209 * _209;
        float _4148 = fma(_207, _207, _4146);
        float _4150 = rsqrt(_4118);
        float _4152 = fma(_211, _211, _4148);
        float _4154 = sqrt(_4152);
        float _4156 = _4108 * _4150;
        float _4158 = _4104 * _4150;
        float _4160 = _4112 * _4150;
        bool _4162 = _4154 > 0.0;
        float _4164 = _4150;
        float _4166 = _4154;
        if (!_4162)
        {
            _4132 = _4098;
        }
        float _4168 = _4132;
        _4134 = _4168;
        if (!_4162)
        {
            _4164 = _4096;
        }
        float _4170 = _4164;
        _4138 = _4170;
        if (!_4162)
        {
            _4166 = _4100;
        }
        float _4172 = _4166;
        bool _4174 = !_4162;
        _4144 = _4172;
        if (!_4174)
        {
            float _4176 = rsqrt(_4152);
            float _4178 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4180 = _209 * _4176;
            float _4182 = _207 * _4176;
            float _4184 = _4158 * _4180;
            float _4186 = _211 * _4176;
            float _4188 = fma(_4156, _4182, _4184);
            float _4190 = _4178 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4192 = fma(_4160, _4186, _4188);
            float _4194 = _4192 * _4190;
            float _4196 = fma(_207, _4194, _4098);
            float _4198 = fma(_209, _4194, _4096);
            float _4200 = fma(_211, _4194, _4100);
            _4138 = _4198;
            _4134 = _4196;
            _4144 = _4200;
        }
    }
    float _4202 = _4138;
    float _4204 = _4134;
    float _4206 = _4144;
    float _4208 = -_3182;
    float _4210 = _4208 + _4202;
    float _4212 = -_3184;
    float _4214 = _4212 + _4204;
    float _4216 = -_3542;
    float _4218 = _4216 + _4206;
    float _4220 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4222 = _4210 + _4220;
    float _4224 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4226 = _4214 + _4224;
    float _4228 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4230 = _4218 + _4228;
    float _4232 = _4222 * _4222;
    float _4234 = fma(_3570, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4236 = fma(_4226, _4226, _4232);
    float _4238 = floor(_4234);
    float _4240 = fma(_3592, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4242 = fma(_4230, _4230, _4236);
    float _4244 = rsqrt(_4242);
    float _4246 = sqrt(_4242);
    float _4248 = -_4238;
    float _4250 = _4234 + _4248;
    float _4252 = _4244 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4254 = floor(_4240);
    float _4256 = _4226 * _4252;
    float _4258 = _4230 * _4252;
    float _4260 = _4256 * _4256;
    float _4262 = _4258 * _4258;
    float _4264 = _4260 + _4262;
    float _4266 = sqrt(_4264);
    bool _4268 = _4266 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4270 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4272 = _4266 + _4270;
    float _4274 = _4230;
    float _4276 = _4264;
    float _4278 = _4272;
    float _4280 = _4222;
    float _4282 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_4268)
    {
        float _4284 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4274 = _4284;
    }
    float _4286 = _4274;
    if (_4268)
    {
        float _4288 = rsqrt(_4264);
        _4276 = _4288;
    }
    float _4290 = _4276;
    if (_4268)
    {
        float _4292 = _4272 * _4286;
        _4278 = _4292;
    }
    float _4294 = _4278;
    if (_4268)
    {
        float _4296 = _4294 * 0.15915493667125701904296875;
        _223 = _4296;
    }
    float _4298 = _223;
    float _4300 = _4236;
    float _4302 = _4298;
    if (_4268)
    {
        float _4304 = _4298 * 6.283185482025146484375;
        float _4306 = sin(_4304);
        _4300 = _4306;
    }
    float _4308 = _4300;
    float _4310 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4312 = precise::max(0.0, _4310);
    float _4314 = _4244;
    float _4316 = _4312;
    float _4318 = _4310;
    if (_4268)
    {
        float _4320 = _4298 * 6.283185482025146484375;
        float _4322 = cos(_4320);
        _4314 = _4322;
    }
    float _4324 = _4314;
    float _4326 = -_4252;
    float _4328 = -_4312;
    float _4330 = fma(_4222, _4326, _4328);
    if (!_4268)
    {
        _4280 = _4256;
    }
    float _4332 = _4280;
    float _4334 = _4332;
    if (_4268)
    {
        float _4336 = _4330 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4316 = _4336;
    }
    float _4338 = _4316;
    float _4340 = _4308;
    float _4342 = _4338;
    if (_4268)
    {
        float _4344 = fma(_4308, _4338, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4340 = _4344;
    }
    float _4346 = _4340;
    float _4348 = _4346;
    if (!_4268)
    {
        _4342 = _4330;
    }
    float _4350 = _4342;
    float _4352 = _4350;
    float _4354 = _4324;
    if (_4268)
    {
        float _4356 = _4324 + (-1.0);
        _4318 = _4356;
    }
    float _4358 = _4318;
    float _4360 = _4358;
    if (_4268)
    {
        float _4362 = _4290 * _4346;
        _4282 = _4362;
    }
    float _4364 = _4282;
    if (!_4268)
    {
        _4348 = _4260;
    }
    float _4366 = _4348;
    float _4368 = _4210 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4370 = _4366;
    if (_4268)
    {
        float _4372 = _4358 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4302 = _4372;
    }
    float _4374 = _4302;
    if (_4268)
    {
        float _4376 = _4256 * _4364;
        _4334 = _4376;
    }
    float _4378 = _4334;
    if (!_4268)
    {
        _4360 = _4258;
    }
    float _4380 = _4360;
    float _4382 = _4380;
    if (_4268)
    {
        float _4384 = _4258 * _4364;
        _4382 = _4384;
    }
    float _4386 = _4382;
    if (_4268)
    {
        float _4388 = fma(_4330, _4324, _4374);
        _4352 = _4388;
    }
    float _4390 = _4352;
    if (_4268)
    {
        float _4392 = _4378 * _4378;
        _4370 = _4392;
    }
    float _4394 = _4370;
    if (!_4268)
    {
        _4354 = _4262;
    }
    float _4396 = _4354;
    float _4398 = _4396;
    if (_4268)
    {
        float _4400 = _4386 * _4386;
        _4398 = _4400;
    }
    float _4402 = _4398;
    float _4404 = _4210 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4406 = fma(_4390, _4390, _4394);
    float _4408 = fma(_4214, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4368);
    float _4410 = _4210 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4412 = fma(_4214, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4404);
    float _4414 = _4406 + _4402;
    float _4416 = _4210 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4418 = fma(_4218, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4408);
    float _4420 = fma(_4218, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4412);
    float _4422 = rsqrt(_4414);
    float _4424 = fma(_4214, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4416);
    float _4426 = _4418 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4428 = _4420 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4430 = fma(_4218, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4424);
    float _4432 = fma(_4214, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4410);
    float _4434 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4436 = fma(_4246, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4434);
    float _4438 = precise::clamp(_4436, 0.0, 1.0);
    float _4440 = _4430 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4442 = _4426 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4444 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4446 = _4428 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4448 = fma(_4218, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4432);
    float _4450 = fma(_4440, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4442);
    float _4452 = -_4438;
    float _4454 = _4452 + 1.0;
    float _4456 = -_4446;
    float _4458 = fma(_4456, _4444, 1.0);
    float _4460 = _4448 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4462 = fma(_4428, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4450);
    float _4464 = _4422 * _4378;
    float _4466 = _4422 * _4386;
    float _4468 = abs(_4454);
    float _4470 = log2(_4468);
    float _4472 = fma(_4460, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4462);
    float _4474 = _4422 * _4390;
    float _4476 = _4464 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4478 = _4426 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4480 = -_4254;
    float _4482 = _4240 + _4480;
    float _4484 = _4474 + 1.0;
    float _4486 = -_4476;
    float _4488 = fma(_4474, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4486);
    float _4490 = log2(_4458);
    float _4492 = fma(_4440, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4478);
    float _4494 = -_4466;
    float _4496 = fma(_4494, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4488);
    float _4498 = _4426 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4500 = fma(_4496, -0.5, 0.5);
    float _4502 = _4470 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4504 = 1.0 / _4472;
    float _4506 = fma(_4496, 0.5, 0.5);
    float _4508 = fma(_4440, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4498);
    float _4510 = fma(_4506, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4512 = fma(_4428, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4492);
    float _4514 = exp2(_4502);
    float _4516 = fma(_4506, _4510, -0.212114393711090087890625);
    float _4518 = fma(_4460, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4512);
    float _4520 = _4490 * 0.693147182464599609375;
    float _4522 = fma(_4506, _4516, 1.570728778839111328125);
    float _4524 = _4520 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4526 = sqrt(_4500);
    float _4528 = fma(_4428, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4508);
    float _4530 = _4518 * _4504;
    float _4532 = fma(_4460, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4528);
    float _4534 = fma(_4530, -0.5, 0.5);
    float _4536 = -_4474;
    float _4538 = fma(_4514, _4484, _4536);
    float _4540 = _4532 * _4504;
    float _4542 = fma(_4538, 0.5, 0.5);
    float _4544 = fma(_4540, 0.5, 0.5);
    float _4546 = _4526 * 0.636619746685028076171875;
    float2 _11869 = float2(_4250, _4482);
    float _4548 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11869, float2(0.0), isnan(_11869)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11869, float2(0.0), isnan(_11869)), level(0.0)).x;
    float3 _11880 = float3(_4544, _4534, _4524);
    float _4550 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11880, float3(0.0), isnan(_11880)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11880, float3(0.0), isnan(_11880)), level(0.0)).x;
    float3 _11891 = float3(_4544, _4534, _4524);
    float4 _4553 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11891, float3(0.0), isnan(_11891)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11891, float3(0.0), isnan(_11891)), level(0.0)).xyzw;
    float _4555 = _4553.x;
    float _4557 = _4553.y;
    float _4559 = _4553.z;
    float _4561 = _4553.w;
    float _4563 = -_4522;
    float _4565 = fma(_4546, _4563, 1.0);
    float2 _11912 = float2(_4565, _4542);
    float3 _4569 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11912, float2(0.0), isnan(_11912)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11912, float2(0.0), isnan(_11912)), level(0.0)).xyz;
    float _4571 = _4569.x;
    float _4573 = _4569.y;
    float _4575 = _4569.z;
    float _4577 = _3564 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4579 = _3564 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4581 = _4426 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4583 = _4470 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4585 = fma(_3570, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4577);
    float _4587 = fma(_3570, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4579);
    float _4589 = in.m_88.x;
    float _4591 = fma(_3592, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4585);
    float _4593 = fma(_3592, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4587);
    float _4595 = fma(_4440, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4581);
    float _4597 = _4591 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4599 = _4593 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4601 = fma(_4428, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4595);
    float _4603 = 1.0 / _4597;
    float _4605 = _4599 + _4597;
    float _4607 = _4532 + _4472;
    float _4609 = fma(_4460, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4601);
    float _4611 = _4607 * 0.5;
    float _4613 = exp2(_4583);
    float _4615 = _4605 * _4603;
    float _4617 = _4615 * 0.5;
    float _4619 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4621 = fma(_4617, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4619);
    float _4623 = 1.0 / _4621;
    float _4625 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4627 = _4623 * _4625;
    float _4629 = abs(_4627);
    float _4631 = log2(_4629);
    bool _4633 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4635 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4637 = _4633 || _4635;
    bool _4639 = isnan(0.5);
    bool _4641 = _4637 || _4639;
    float _4643 = _4631 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4645 = exp2(_4643);
    float _4647 = fma(_4645, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4649 = precise::clamp(_4647, 0.0, 1.0);
    bool _4651 = _4627 <= 8000.0;
    bool _4653 = isnan(_4627);
    bool _4655 = _4651 || _4653;
    bool _4657 = isnan(8000.0);
    bool _4659 = _4655 || _4657;
    float _4661 = float(_4659);
    float _4663 = fma(_4649, -2.0, 3.0);
    float _4665 = _4649 * _4649;
    float _4667 = _4665 * _4663;
    float _4669 = _4609 + _4472;
    float _4671 = -_4667;
    float _4673 = _4671 + 1.0;
    float _4675 = _4669 * 0.5;
    float _4677 = fma(_4673, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4667);
    float _4679 = _4661 * _4677;
    float _4681 = _4472 * 0.5;
    float _4683 = _4661;
    float _4685 = _4518;
    float _4687 = _4532;
    if (_4641)
    {
        _4683 = 1.0;
    }
    float _4689 = _4683;
    float _4691 = fma(_4518, -0.5, _4681);
    float _4693 = _4689;
    float _4695 = _4557;
    float _4697 = _4555;
    if (!_4641)
    {
        float _4699 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4701 = _4699 * 0.15915493667125701904296875;
        float _4703 = _4701 * 6.283185482025146484375;
        float _4705 = cos(_4703);
        float _4707 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4709 = _4707 * 0.15915493667125701904296875;
        float _4711 = _4701 * 6.283185482025146484375;
        float _4713 = sin(_4711);
        float _4715 = 1.0 / _4705;
        float _4717 = _4709 * 6.283185482025146484375;
        float _4719 = cos(_4717);
        float _4721 = _4713 * _4715;
        float _4723 = _4709 * 6.283185482025146484375;
        float _4725 = sin(_4723);
        float _4727 = _4719 * _4721;
        float _4729 = 1.0 / _4727;
        float _4731 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4733 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4731;
        float _4735 = 1.0 / _4733;
        float _4737 = _4725 * _4729;
        float _4739 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4741 = fma(_4627, _4737, _4739);
        float _4743 = _4741 * _4735;
        float _4745 = precise::clamp(_4743, 0.0, 1.0);
        _4693 = _4745;
    }
    float _4747 = _4693;
    float _4749 = _4679 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4751 = -_4613;
    float _4753 = _4751 + 1.0;
    float _4755 = -_4548;
    float _4757 = _4755 + 1.0;
    out.m_90.x = _4611;
    out.m_90.y = _4691;
    out.m_90.z = _4675;
    out.m_90.w = _4472;
    float _4759 = _4753 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4761 = _4757 * _4749;
    float _4763 = precise::clamp(_4761, 0.0, 1.0);
    bool _4765 = _4246 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4767 = isnan(_4246);
    bool _4769 = _4765 || _4767;
    bool _4771 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4773 = _4769 || _4771;
    out.m_92.x = _4214;
    out.m_92.y = _4210;
    out.m_92.z = _4218;
    float _4775 = _4759 * _4550;
    float _4777 = -_4763;
    float _4779 = fma(_4777, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4781 = -_4759;
    float _4783 = _4781 + 1.0;
    float _4785 = _4561 * _4775;
    float _4787 = _4779 * _4589;
    float _4789 = _4575 * _4775;
    out.gl_Position.x = _4532;
    out.gl_Position.y = _4518;
    out.gl_Position.z = _4609;
    out.gl_Position.w = _4472;
    float _4791 = fma(_4571, _4785, _4555);
    float _4793 = fma(_4573, _4785, _4557);
    float _4795 = _4787 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4797 = _4561 * _4783;
    float _4799 = fma(_4561, _4789, _4559);
    float _4801 = _4747 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4803 = _4785;
    float _4805 = _4783;
    if (!_4773)
    {
        _4695 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4807 = _4695;
    out.m_94.x = _4795;
    float _4809 = _4807;
    float _4811 = _4807;
    if (!_4773)
    {
        _4697 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4813 = _4697;
    float _4815 = _4813;
    float _4817 = _4813;
    if (!_4773)
    {
        _4803 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4819 = _4803;
    out.m_96.x = _4791;
    out.m_96.y = _4793;
    out.m_96.z = _4799;
    out.m_96.w = _4797;
    float _4821 = _4819;
    float _4823 = _4819;
    if (!_4773)
    {
        _4685 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4825 = _4685;
    float _4827 = _4825;
    float _4829 = _4825;
    if (!_4773)
    {
        _4687 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4831 = _4687;
    float _4833 = _4831;
    float _4835 = _4831;
    if (!_4773)
    {
        _4805 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4837 = _4805;
    bool _4839 = !_4773;
    float _4841 = _4837;
    float _4843 = _4837;
    if (!_4839)
    {
        bool _4845 = _4246 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4847 = isnan(_4246);
        bool _4849 = _4845 || _4847;
        bool _4851 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4853 = _4849 || _4851;
        if (!_4853)
        {
            float _4855 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4857 = _4246 + _4855;
            float _4859 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4861 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4859;
            float _4863 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4865 = _4863 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4867 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4869 = _4867 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4871 = 1.0 / _4861;
            float _4873 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4875 = _4873 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4877 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4879 = _4877 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4881 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4883 = _4881 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4885 = _4857 * _4871;
            float _4887 = precise::clamp(_4885, 0.0, 1.0);
            float _4889 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4891 = _4889 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4893 = fma(_4887, _4865, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4895 = fma(_4887, _4869, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4897 = fma(_4887, _4891, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4899 = fma(_4887, _4875, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4901 = fma(_4887, _4879, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4903 = fma(_4887, _4883, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4823 = _4893;
            _4835 = _4901;
            _4817 = _4895;
            _4829 = _4899;
            _4843 = _4897;
            _4811 = _4903;
            _4905 = true;
        }
        else
        {
            bool _4907 = _4246 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4909 = isnan(_4246);
            bool _4911 = _4907 || _4909;
            bool _4913 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4915 = _4911 || _4913;
            if (!_4915)
            {
                _4827 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4917 = _4827;
            _4829 = _4917;
            if (!_4915)
            {
                _4833 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4919 = _4833;
            _4835 = _4919;
            if (!_4915)
            {
                _4809 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4921 = _4809;
            _4811 = _4921;
            if (!_4915)
            {
                _4815 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4923 = _4815;
            _4817 = _4923;
            if (!_4915)
            {
                _4821 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4925 = _4821;
            _4823 = _4925;
            if (!_4915)
            {
                _4841 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4927 = _4841;
            bool _4929 = !_4915;
            _4843 = _4927;
            if (!_4929)
            {
                bool _4931 = _4246 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4933 = isnan(_4246);
                bool _4935 = _4931 || _4933;
                bool _4937 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4939 = _4935 || _4937;
                if (!_4939)
                {
                    float _4941 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4943 = _4246 + _4941;
                    float _4945 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4947 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4945;
                    float _4949 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4951 = _4949 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4953 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4955 = _4953 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4957 = 1.0 / _4947;
                    float _4959 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4961 = _4959 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4963 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4965 = _4963 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4967 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4969 = _4967 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4971 = _4943 * _4957;
                    float _4973 = precise::clamp(_4971, 0.0, 1.0);
                    float _4975 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4977 = _4975 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4979 = fma(_4973, _4951, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4981 = fma(_4973, _4955, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4983 = fma(_4973, _4977, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4985 = fma(_4973, _4961, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4987 = fma(_4973, _4965, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4989 = fma(_4973, _4969, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4823 = _4979;
                    _4835 = _4987;
                    _4817 = _4981;
                    _4829 = _4985;
                    _4843 = _4983;
                    _4811 = _4989;
                    _4905 = true;
                }
                else
                {
                    _4823 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4835 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4817 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4829 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4843 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4811 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4905 = false;
    float _4991 = _4823;
    float _4993 = _4835;
    float _4995 = _4817;
    float _4997 = _4829;
    float _4999 = _4843;
    float _5001 = _4811;
    float _5003 = fma(_4002, -0.5, 0.5);
    float _5005 = precise::clamp(_5003, 0.0, 1.0);
    float _5007 = -_4991;
    float _5009 = _4993 + _5007;
    float _5011 = _4801 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5013 = -_4995;
    float _5015 = _4997 + _5013;
    float _5017 = fma(_5005, _5009, _4991);
    out.m_98.x = 0.0;
    float _5019 = -_4999;
    float _5021 = _5001 + _5019;
    float _5023 = fma(_5005, _5015, _4995);
    float _5025 = _5017 * 0.586610972881317138671875;
    out.m_55.x = _5011;
    bool _5027 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5029 = fma(_5005, _5021, _4999);
    float _5031 = fma(_5023, 0.298911988735198974609375, _5025);
    bool _5033 = _4747 > 0.0;
    bool _5035 = isnan(_4747);
    bool _5037 = _5033 || _5035;
    bool _5039 = isnan(0.0);
    bool _5041 = _5037 || _5039;
    float _5043 = fma(_5029, 0.114477999508380889892578125, _5031);
    float _5045 = -_5043;
    float _5047 = _5023 + _5045;
    float _5049 = -_5043;
    float _5051 = _5017 + _5049;
    float _5053 = -_5043;
    float _5055 = _5029 + _5053;
    float _5057 = fma(_5047, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5043);
    float _5059 = fma(_5051, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5043);
    float _5061 = fma(_5055, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5043);
    bool _5063 = !_5027;
    if (!_5063)
    {
        float _5065 = -_4210;
        float _5067 = _5065 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5069 = -_4214;
        float _5071 = _5069 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5073 = -_4218;
        float _5075 = _5073 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5077 = _5067 * _5067;
        float _5079 = fma(_5071, _5071, _5077);
        float _5081 = fma(_5075, _5075, _5079);
        float _5083 = sqrt(_5081);
        float _5085 = rsqrt(_5081);
        float _5087 = -_5083;
        float _5089 = _5087 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5091 = _5089 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5093 = precise::clamp(_5091, 0.0, 1.0);
        float _5095 = _5071 * _5085;
        float _5097 = _5067 * _5085;
        float _5099 = abs(_5093);
        float _5101 = log2(_5099);
        float _5103 = _5075 * _5085;
        float _5105 = _5095 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5107 = _4002 * _5097;
        float _5109 = -_5097;
        float _5111 = -_5105;
        float _5113 = fma(_5109, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5111);
        float _5115 = fma(_4000, _5095, _5107);
        float _5117 = -_5103;
        float _5119 = fma(_5117, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5113);
        float _5121 = fma(_4004, _5103, _5115);
        float _5123 = precise::clamp(_5121, 0.0, 1.0);
        float _5125 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5127 = _5119 + _5125;
        float _5129 = _5101 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5131 = _5127 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5133 = precise::clamp(_5131, 0.0, 1.0);
        float _5135 = exp2(_5129);
        float _5137 = _5135 * _5133;
        float _5139 = _5123 * _5137;
        float _5141 = _5139 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5143 = _5139 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5145 = _5139 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_98.x = _5141;
        out.m_98.y = _5143;
        out.m_98.z = _5145;
    }
    out.m_100.x = _5057;
    out.m_100.y = _5059;
    out.m_100.z = _5061;
    if (_5041)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_55.x = 0.0;
    float _5147 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5147;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4905 = false;
    bool _4052 = false;
    bool _575 = false;
    bool _431 = false;
    bool _243 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_48.w;
    float _116 = in.m_50.w;
    float _118 = trunc(_114);
    int _121 = int(_118);
    float _123 = -_116;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _125;
    bool _129 = _121 >= 1;
    float _131 = 0.0;
    float _133 = as_type<float>(_121);
    float _135 = _125;
    if (!_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _131;
    if (!_129)
    {
        out.m_55.x = 0.0;
    }
    int _139 = 0;
    if (!_129)
    {
        float _141 = _137 * 5.0;
        _139 = as_type<int>(_141);
    }
    int _143 = _139;
    int _145 = _143;
    if (!_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5216 = as_type<float>(_143);
        out.gl_Position.z = _5216;
    }
    if (!_129)
    {
        return out;
    }
    bool _147 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _149 = isnan(_116);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _155 = _151 || _153;
    float _157 = float(_121);
    bool _159 = _125 >= _157;
    bool _161 = !_155;
    bool _163 = _159 || _161;
    float _165 = 1.0 / _157;
    if (_163)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _133;
    if (_163)
    {
        out.m_55.x = 0.0;
    }
    float _169 = _125 * _165;
    float _171 = _169;
    if (_163)
    {
        float _173 = _167 * 5.0;
        _145 = as_type<int>(_173);
    }
    int _175 = _145;
    out.m_53.x = _169;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5279 = as_type<float>(_175);
        out.gl_Position.z = _5279;
    }
    if (_163)
    {
        return out;
    }
    float _177 = as_type<float>(int(gl_VertexIndex));
    float _179 = in.m_60.x;
    float _181 = in.m_60.y;
    float _183 = in.m_60.z;
    int _185 = as_type<int>(_177) & 1;
    bool _187 = _185 != 0;
    int _189 = as_type<int>(_177) & 2;
    bool _191 = _189 != 0;
    bool _193 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _195 = _181 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _197 = _181 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _199 = _181 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _201 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[4].x, _195);
    float _203 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[5].x, _197);
    float _205 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[6].x, _199);
    float _207 = fma(_183, (*spvDescriptorSet0.vp_c10)._m0[4].z, _201);
    float _209 = fma(_183, (*spvDescriptorSet0.vp_c10)._m0[5].z, _203);
    float _211 = fma(_183, (*spvDescriptorSet0.vp_c10)._m0[6].z, _205);
    bool _213 = !_187;
    float _215 = _213 ? (-0.5) : 0.5;
    bool _217 = !_191;
    float _219 = _217 ? (-0.5) : 0.5;
    bool _221 = !_193;
    float _223 = _211;
    float _241;
    if (!_221)
    {
        float _225 = in.m_62.x;
        float _227 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _229 = _225 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _231 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _233 = _231 * _227;
        float _235 = floor(_233);
        float _237 = -_235;
        float _239 = _233 + _237;
        _241 = _239;
        _243 = true;
    }
    else
    {
        _241 = _169;
    }
    _243 = false;
    float _245 = _241;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _249 = _245 + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _253 = _245 + _251;
    bool _255 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _257 = isnan(_245);
    bool _259 = _255 || _257;
    bool _261 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _263 = _259 || _261;
    float _265 = float(_263);
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _267;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _273 = _271 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _277 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _275;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _281 = _245 + _279;
    float _283 = 1.0 / _269;
    bool _285 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _287 = 1.0 / _277;
    float _289 = 1.0 / _273;
    float _291 = _249 * _283;
    bool _293 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _295 = isnan(_245);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = -_265;
    float _307 = _305 + 1.0;
    float _309 = _303 * _307;
    float _311 = _253 * _287;
    bool _313 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _315 = isnan(_245);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = -_303;
    float _327 = _325 + 1.0;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _333 = _281 * _289;
    bool _335 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _337 = isnan(_245);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _347;
    float _351 = _323 * _327;
    float _353 = -_323;
    float _355 = _353 + 1.0;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _363 = _361 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _365 = fma(_349, _291, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _367 = _345 * _355;
    float _369 = fma(_359, _291, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _371 = fma(_331, _333, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _373 = fma(_363, _333, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _375 = -_345;
    float _377 = _375 + 1.0;
    float _379 = _365 * _367;
    float _381 = _369 * _367;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _383;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _387;
    float _391 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[143].x, _379);
    float _393 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[143].y, _381);
    float _395 = fma(_385, _311, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _397 = fma(_389, _311, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _399 = fma(_371, _351, _391);
    float _401 = fma(_373, _351, _393);
    float _403 = fma(_395, _309, _399);
    float _405 = fma(_397, _309, _401);
    float _407 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[146].x, _403);
    float _409 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[146].y, _405);
    bool _411 = !_285;
    float _429;
    if (!_411)
    {
        float _413 = in.m_62.x;
        float _415 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _417 = _413 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _419 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _421 = _419 * _415;
        float _423 = floor(_421);
        float _425 = -_423;
        float _427 = _421 + _425;
        _429 = _427;
        _431 = true;
    }
    else
    {
        _429 = _169;
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
    float _535 = in.m_64.x;
    float _537 = in.m_64.y;
    float _539 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[117].x, _531);
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _543 = _529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _545 = _533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _547 = _539 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _549 = _541 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_66.x = _543;
    out.m_66.y = _545;
    out.m_66.z = _549;
    out.m_66.w = _547;
    float _551 = _409 * _537;
    float _553 = _407 * _535;
    bool _555 = !_493;
    float _573;
    if (!_555)
    {
        float _557 = in.m_62.x;
        float _559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _561 = _557 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _563 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[11].w, _125);
        float _565 = _563 * _559;
        float _567 = floor(_565);
        float _569 = -_567;
        float _571 = _565 + _569;
        _573 = _571;
        _575 = true;
    }
    else
    {
        _573 = _169;
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
    float _639 = 1.0 / _601;
    float _641 = _617 * _631;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _645 = _643 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _647 = fma(_641, _581, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _649 = _613 * _635;
    float _651 = -_629;
    float _653 = _651 + 1.0;
    float _655 = -_613;
    float _657 = _655 + 1.0;
    float _659 = _645 * _639;
    float _661 = _647 * _649;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _665 = _577 + _663;
    float _667 = _597 * _653;
    float _669 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[131].x, _661);
    float _671 = fma(_659, _665, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _673 = fma(_671, _667, _669);
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _681 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[133].x, _673);
    float _683 = _675 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _685 = _677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _687 = _679 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _689 = _681 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_68.x = _683;
    out.m_68.y = _685;
    out.m_68.z = _687;
    out.m_68.w = _689;
    bool _691 = !_637;
    float _693 = _667;
    float _695 = _689;
    if (!_691)
    {
        float _697 = in.m_62.x;
        float _699 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _701 = _697 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _703 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[14].x, _125);
        float _705 = _703 * _699;
        float _707 = floor(_705);
        float _709 = -_707;
        float _711 = _705 + _709;
        _171 = _711;
    }
    float _713 = _171;
    float _715 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _717 = int(_715);
    int _719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _721 = _719 != 0;
    float _723 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _725 = int(_723);
    float _727 = float(_717);
    float _729 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _731 = int(_729);
    float _733 = 0.0;
    if (_721)
    {
        _733 = 1.0;
    }
    float _735 = _733;
    float _737 = _735;
    if (_721)
    {
        _693 = 1.0;
    }
    float _739 = _693;
    float _741 = float(_725);
    float _743 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _745 = int(_743);
    float _747 = 1.0 / _741;
    float _749 = float(uint(_731));
    int _751 = ~_731;
    int _753 = _751 + 1;
    float _755 = 1.0 / _727;
    float _757 = float(uint(_745));
    float _759 = _747 * _125;
    float _761 = 1.0 / _749;
    float _763 = _755 * _125;
    float _765 = 1.0 / _757;
    float _767 = _741;
    float _769 = _755;
    float _771 = _739;
    if (_721)
    {
        float _773 = in.m_62.x;
        float _775 = in.m_62.y;
        _767 = _773;
        _769 = _775;
    }
    float _777 = _767;
    float _779 = _769;
    float _781 = trunc(_759);
    int _783 = int(_781);
    int _785 = as_type<int>(_761) + (-2);
    float _787 = trunc(_763);
    int _789 = int(_787);
    int _791 = as_type<int>(_765) + (-2);
    float _793 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _795 = int(_793);
    float _797 = float(uint(_783));
    int _799 = as_type<int>(_797);
    float _801 = _777;
    float _803 = _779;
    if (_721)
    {
        _695 = _779;
    }
    float _805 = _695;
    float _807 = as_type<float>(_785) * _797;
    float _809 = _805;
    if (_721)
    {
        _799 = 0;
    }
    int _811 = _799;
    float _813 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _815 = int(_813);
    float _817 = float(uint(_789));
    float _819 = as_type<float>(_791) * _817;
    float _821 = _817;
    int _823 = _811;
    if (_721)
    {
        _821 = _777;
    }
    float _825 = _821;
    float _827 = trunc(_807);
    float _829 = precise::max(_827, 0.0);
    uint _832 = uint(_829);
    float _834 = float(uint(_795));
    float _836 = 0.0;
    int _838 = as_type<int>(_834);
    float _840 = _825;
    if (_721)
    {
        _836 = _825;
    }
    float _842 = _836;
    float _844 = trunc(_819);
    float _846 = precise::max(_844, 0.0);
    uint _848 = uint(_846);
    float _850 = float(_815);
    float _852 = 1.0 / _850;
    float _854 = 1.0 / _834;
    float _856 = _850;
    float _858 = _842;
    if (_721)
    {
        _856 = _825;
    }
    float _860 = _856;
    float _862 = _860;
    if (_721)
    {
        _838 = 0;
    }
    int _864 = _838;
    int _866 = _864;
    if (!_721)
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
        _801 = _868;
        _840 = _870;
        _771 = 5.839270114898681640625;
        _862 = _872;
        _803 = _870;
        _858 = _884;
        _823 = 1;
        _866 = 2;
        _809 = _888;
    }
    float _890 = _737;
    float _892 = _801;
    float _894 = _840;
    float _896 = _771;
    float _898 = _862;
    float _900 = _803;
    float _902 = _858;
    int _904 = _823;
    int _906 = _866;
    float _908 = _809;
    float _910 = in.m_62.z;
    float _912 = in.m_62.w;
    int _914 = ~_745;
    int _916 = _914 + 1;
    int _918 = _753 * int(_832);
    int _920 = _918 + _783;
    float _922 = _852 * _125;
    float _924 = _890 * _892;
    float _926 = _890 * _894;
    int _928 = _916 * int(_848);
    int _930 = _928 + _789;
    float _932 = float(uint(_920));
    float _934 = floor(_924);
    float _936 = _896 * _898;
    float _938 = _165 * _125;
    float _940 = float(uint(_930));
    float _942 = as_type<float>(_785) * _932;
    float _944 = float(_731);
    float _946 = _892 * 2.0;
    float _948 = trunc(_922);
    int _950 = int(_948);
    float _952 = float(_783);
    float _954 = _892 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _958 = _956 != 0;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _962 = _713 + _960;
    bool _964 = _900 > 0.5;
    int _966 = ~_731;
    int _968 = _966 + 1;
    float _970 = trunc(_942);
    float _972 = precise::max(_970, 0.0);
    uint _974 = uint(_972);
    bool _976 = _912 > 0.5;
    float _978 = as_type<float>(_791) * _940;
    float _980 = -_934;
    float _982 = _924 + _980;
    int _984 = as_type<int>(_854) + (-2);
    bool _986 = _910 > 0.5;
    float _988 = floor(_936);
    float _990 = float(uint(_950));
    bool _992 = _952 >= _944;
    bool _994 = isnan(_952);
    bool _996 = _992 || _994;
    bool _998 = isnan(_944);
    bool _1000 = _996 || _998;
    float _1002 = float(_1000);
    int _1004 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1006 = _1004 != 0;
    int _1008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1010 = _1008 != 0;
    int _1012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1014 = _1012 != 0;
    float _1016 = as_type<float>(_984) * _990;
    float _1018 = -_215;
    int _1020 = _964 ? as_type<int>(_1018) : as_type<int>(_215);
    float _1022 = trunc(_978);
    float _1024 = precise::max(_1022, 0.0);
    uint _1026 = uint(_1024);
    int _1028 = int(_832) + int(_974);
    int _1030 = ~_745;
    int _1032 = _1030 + 1;
    int _1034 = _968 * _1028;
    int _1036 = _1034 + _783;
    int _1038 = int(_976);
    int _1040 = _986 ? 2 : 0;
    int _1042 = _1038 | _1040;
    int _1044 = _958 ? 4 : 0;
    int _1046 = _1042 | _1044;
    int _1048 = _1006 ? 8 : 0;
    int _1050 = _1046 | _1048;
    int _1052 = _1010 ? 16 : 0;
    int _1054 = _1050 | _1052;
    int _1056 = _1014 ? 32 : 0;
    int _1058 = _1054 | _1056;
    int _1060 = _964 ? 64 : 0;
    int _1062 = _1058 | _1060;
    int _1064 = _1062 & 64;
    float _1066 = trunc(_1016);
    float _1068 = precise::max(_1066, 0.0);
    uint _1070 = uint(_1068);
    float _1072 = -_988;
    float _1074 = _936 + _1072;
    float _1076 = -_219;
    int _1078 = _986 ? as_type<int>(_1076) : as_type<int>(_219);
    bool _1080 = !_958;
    int _1082 = _1080 ? 0 : 1;
    bool _1084 = !_1014;
    float _1086 = _1084 ? _219 : as_type<float>(_1078);
    float _1088 = _982 * _944;
    int _1090 = int(_848) + int(_1026);
    float _1092 = floor(_926);
    float _1094 = _944 * _938;
    float _1096 = float(_745);
    float _1098 = float(_789);
    int _1100 = _1032 * _1090;
    int _1102 = _1100 + _789;
    int _1104 = abs(_1082);
    float _1106 = trunc(_1002);
    int _1108 = int(_1106);
    float _1110 = _1074 * _1096;
    int _1112 = _731 + (-1);
    float _1114 = trunc(_1088);
    int _1116 = int(_1114);
    bool _1118 = !_1010;
    float _1120 = _1118 ? _215 : as_type<float>(_1020);
    int _1122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1124 = _1122 != 0;
    int _1126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1128 = _1126 != 0;
    int _1130 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1132 = _1130 != 0;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    bool _1136 = uint(_1036) >= uint(_731);
    int _1138 = ~_795;
    int _1140 = _1138 + 1;
    float _1142 = trunc(_1094);
    int _1144 = int(_1142);
    bool _1146 = !_1128;
    int _1148 = _1146 ? 0 : 1;
    float _1150 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1134);
    bool _1152 = !_1124;
    int _1154 = _1152 ? 0 : 1;
    int _1156 = _1140 * int(_1070);
    int _1158 = _1156 + _950;
    int _1160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1162 = _1160 != 0;
    float _1164 = _902 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _1166 = uint(_1102) >= uint(_745);
    float _1168 = trunc(_1110);
    int _1170 = int(_1168);
    bool _1172 = _1098 >= _1096;
    bool _1174 = isnan(_1098);
    bool _1176 = _1172 || _1174;
    bool _1178 = isnan(_1096);
    bool _1180 = _1176 || _1178;
    float _1182 = float(_1180);
    float _1184 = _1096 * _938;
    bool _1186 = !_1132;
    int _1188 = _1186 ? 0 : 1;
    float _1190 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1150);
    bool _1192 = !_1162;
    int _1194 = _1192 ? 0 : 1;
    bool _1196 = !_1166;
    int _1198 = _1196 ? 0 : (-1);
    float _1200 = trunc(_1182);
    int _1202 = int(_1200);
    int _1204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1206 = _1204 != 0;
    int _1208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1210 = _1208 != 0;
    int _1212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1214 = _1212 != 0;
    float _1216 = -_1190;
    float _1218 = _1216 + 1.0;
    bool _1220 = !_1136;
    int _1222 = _1220 ? 0 : (-1);
    int _1224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1226 = _1224 != 0;
    int _1228 = ~_1028;
    int _1230 = _1228 + _1222;
    int _1232 = _1230 + 1;
    float _1234 = trunc(_1184);
    int _1236 = int(_1234);
    float _1238 = -_1092;
    float _1240 = _926 + _1238;
    float _1242 = float(uint(_1158));
    bool _1244 = !_1210;
    int _1246 = _1244 ? 0 : 1;
    bool _1248 = _1064 != 0;
    float _1250 = as_type<float>(_984) * _1242;
    float _1252 = floor(_946);
    int _1254 = ~_1090;
    int _1256 = _1254 + _1198;
    int _1258 = _1256 + 1;
    bool _1260 = !_1226;
    int _1262 = _1260 ? 0 : 1;
    int _1264 = _1116 * _1104;
    int _1266 = _1264 + _783;
    bool _1268 = _731 == 0;
    int _1270 = _731 * _1232;
    int _1272 = _1270 + _783;
    bool _1274 = !_1206;
    int _1276 = _1274 ? 0 : 1;
    int _1278 = _745 * _1258;
    int _1280 = _1278 + _789;
    bool _1282 = _745 == 0;
    float _1284 = trunc(_1250);
    float _1286 = precise::max(_1284, 0.0);
    uint _1288 = uint(_1286);
    int _1290 = ~_1108;
    int _1292 = _1290 + 1;
    int _1294 = _1292 + 1;
    bool _1296 = !_1268;
    int _1298 = _1296 ? _1272 : (-1);
    int _1300 = ~_1202;
    int _1302 = _1300 + 1;
    int _1304 = _1302 + 1;
    bool _1306 = !_1282;
    int _1308 = _1306 ? _1280 : (-1);
    int _1310 = _1298 * _1294;
    int _1312 = abs(_1148);
    int _1314 = _745 + (-1);
    int _1316 = _1308 * _1304;
    int _1318 = abs(_1246);
    int _1320 = _1108 * _1112;
    int _1322 = _1320 + _1310;
    int _1324 = abs(_1154);
    int _1326 = _1202 * _1314;
    int _1328 = _1326 + _1316;
    int _1330 = _1322 * _1312;
    int _1332 = abs(_1188);
    int _1334 = abs(_1262);
    int _1336 = _1328 * _1318;
    int _1338 = abs(_1194);
    int _1340 = _1170 * _1334;
    int _1342 = _1340 + _789;
    int _1344 = _1144 * _1324;
    int _1346 = _1344 + _1330;
    int _1348 = int(_1070) + int(_1288);
    int _1350 = ~_795;
    int _1352 = _1350 + 1;
    int _1354 = _1266 * _1332;
    int _1356 = _1354 + _1346;
    int _1358 = abs(_1276);
    int _1360 = _1352 * _1348;
    int _1362 = _1360 + _950;
    float _1364 = -_219;
    int _1366 = _976 ? as_type<int>(_1364) : as_type<int>(_219);
    int _1368 = _1116 * _1338;
    int _1370 = _1368 + _1356;
    bool _1372 = uint(_1362) >= uint(_795);
    float _1374 = float(uint(_1370));
    int _1376 = _1236 * _1358;
    int _1378 = _1376 + _1336;
    float _1380 = float(_795);
    float _1382 = -_215;
    int _1384 = _986 ? as_type<int>(_1382) : as_type<int>(_215);
    float _1386 = as_type<float>(_785) * _1374;
    float _1388 = float(_950);
    float _1390 = _1240 * _1380;
    int _1392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1394 = _1392 != 0;
    float _1396 = trunc(_1386);
    float _1398 = precise::max(_1396, 0.0);
    uint _1400 = uint(_1398);
    bool _1402 = _1388 >= _1380;
    bool _1404 = isnan(_1388);
    bool _1406 = _1402 || _1404;
    bool _1408 = isnan(_1380);
    bool _1410 = _1406 || _1408;
    float _1412 = float(_1410);
    float _1414 = _1380 * _938;
    bool _1416 = !_1214;
    int _1418 = _1416 ? 0 : 1;
    int _1420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1422 = _1420 != 0;
    bool _1424 = !_1394;
    int _1426 = _1424 ? 0 : 1;
    float _1428 = trunc(_1412);
    int _1430 = int(_1428);
    bool _1432 = !_1422;
    int _1434 = _1432 ? 0 : 1;
    int _1436 = abs(_1418);
    int _1438 = abs(_1426);
    bool _1440 = !_1006;
    float _1442 = _1440 ? _219 : as_type<float>(_1366);
    int _1444 = _1342 * _1436;
    int _1446 = _1444 + _1378;
    bool _1448 = !_1372;
    int _1450 = _1448 ? 0 : (-1);
    float _1452 = trunc(_1414);
    int _1454 = int(_1452);
    int _1456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1458 = _1456 != 0;
    int _1460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1462 = _1460 != 0;
    int _1464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1466 = _1464 != 0;
    int _1468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1470 = _1468 != 0;
    int _1472 = ~_1348;
    int _1474 = _1472 + _1450;
    int _1476 = _1474 + 1;
    bool _1478 = !_1462;
    int _1480 = _1478 ? 0 : 1;
    int _1482 = _1170 * _1438;
    int _1484 = _1482 + _1446;
    int _1486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1488 = _1486 != 0;
    int _1490 = _795 * _1476;
    int _1492 = _1490 + _950;
    int _1494 = ~_731;
    int _1496 = _1494 + 1;
    float _1498 = trunc(_1390);
    int _1500 = int(_1498);
    bool _1502 = !_1458;
    int _1504 = _1502 ? 0 : 1;
    bool _1506 = _795 == 0;
    int _1508 = _1496 * int(_1400);
    int _1510 = _1508 + _1370;
    float _1512 = float(uint(_1484));
    int _1514 = ~_1430;
    int _1516 = _1514 + 1;
    int _1518 = _1516 + 1;
    bool _1520 = !_1506;
    int _1522 = _1520 ? _1492 : (-1);
    float _1524 = as_type<float>(_791) * _1512;
    float _1526 = float(uint(_1510));
    float _1528 = _1512;
    float _1530 = as_type<float>(_1370);
    float _1532 = as_type<float>(_1070);
    if (_1488)
    {
        float _1534 = in.m_62.w;
        _1528 = _1534;
    }
    float _1536 = _1528;
    int _1538 = abs(_1480);
    int _1540 = _1522 * _1518;
    int _1542 = _795 + (-1);
    float _1544 = as_type<float>(_785) * _1526;
    float _1546 = trunc(_1524);
    float _1548 = precise::max(_1546, 0.0);
    uint _1550 = uint(_1548);
    int _1552 = abs(_1434);
    int _1554 = abs(_1504);
    int _1556 = _1430 * _1542;
    int _1558 = _1556 + _1540;
    float _1560 = trunc(_1544);
    float _1562 = precise::max(_1560, 0.0);
    uint _1564 = uint(_1562);
    int _1566 = _1558 * _1538;
    int _1568 = ~_745;
    int _1570 = _1568 + 1;
    int _1572 = _1500 * _1552;
    int _1574 = _1572 + _950;
    bool _1576 = _731 == 0;
    int _1578 = _1454 * _1554;
    int _1580 = _1578 + _1566;
    bool _1582 = !_1466;
    int _1584 = _1582 ? 0 : 1;
    int _1586 = ~_731;
    int _1588 = _1586 + 1;
    int _1590 = _1570 * int(_1550);
    int _1592 = _1590 + _1484;
    float _1594 = as_type<float>(_1552);
    if (_1488)
    {
        float _1596 = _1536 * 3.1415927410125732421875;
        _1594 = _1596;
    }
    float _1598 = _1594;
    int _1600 = abs(_1584);
    bool _1602 = !_1470;
    int _1604 = _1602 ? 0 : 1;
    float _1606 = _1598;
    if (_1488)
    {
        float _1608 = _1598 * 0.15915493667125701904296875;
        _1606 = _1608;
    }
    float _1610 = _1606;
    int _1612 = int(_1400) + int(_1564);
    float _1614 = float(uint(_1592));
    int _1616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1618 = _1616 != 0;
    int _1620 = _1588 * _1612;
    int _1622 = _1620 + _1370;
    int _1624 = abs(_1604);
    float _1626 = as_type<float>(_791) * _1614;
    float _1628 = _1610;
    if (_1488)
    {
        float _1630 = _1610 * 6.283185482025146484375;
        float _1632 = sin(_1630);
        _1628 = _1632;
    }
    float _1634 = _1628;
    float _1636 = 0.0;
    if (!_1488)
    {
        _1636 = _215;
    }
    float _1638 = _1636;
    bool _1640 = uint(_1622) >= uint(_731);
    int _1642 = _1574 * _1600;
    int _1644 = _1642 + _1580;
    float _1646 = float(uint(_1266));
    float _1648 = trunc(_1626);
    float _1650 = precise::max(_1648, 0.0);
    uint _1652 = uint(_1650);
    bool _1654 = !_1640;
    int _1656 = _1654 ? 0 : (-1);
    float _1658 = as_type<float>(_1564);
    float _1660 = _1638;
    if (_1618)
    {
        float _1662 = in.m_62.x;
        _1658 = _1662;
    }
    float _1664 = _1658;
    int _1666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1668 = _1666 != 0;
    float _1670 = as_type<float>(_785) * _1646;
    int _1672 = ~_1612;
    int _1674 = _1672 + _1656;
    int _1676 = _1674 + 1;
    int _1678 = _1500 * _1624;
    int _1680 = _1678 + _1644;
    bool _1682 = !_1668;
    float _1684 = _1682 ? _215 : as_type<float>(_1384);
    bool _1686 = _1668;
    if (_1488)
    {
        bool _1688 = _1634 > 0.5;
        _1686 = _1688;
    }
    bool _1690 = _1686;
    float _1692 = trunc(_1670);
    float _1694 = precise::max(_1692, 0.0);
    uint _1696 = uint(_1694);
    int _1698 = _731 * _1676;
    int _1700 = _1698 + _1370;
    float _1702 = float(uint(_1680));
    if (_1488)
    {
        float _1704 = -_215;
        float _1706 = _1690 ? _1704 : _215;
        _1660 = _1706;
    }
    float _1708 = _1660;
    bool _1710 = !_1576;
    int _1712 = _1710 ? _1700 : (-1);
    int _1714 = int(_1550) + int(_1652);
    float _1716 = as_type<float>(_984) * _1702;
    int _1718 = _1712 & 3;
    bool _1720 = _1718 != 0;
    int _1722 = _1712 & 3;
    bool _1724 = _1722 != 0;
    float _1726 = trunc(_1716);
    float _1728 = precise::max(_1726, 0.0);
    uint _1730 = uint(_1728);
    int _1732 = ~_731;
    int _1734 = _1732 + 1;
    int _1736 = _1720 ? 0 : 1;
    float _1738 = _1708;
    if (_1618)
    {
        float _1740 = _1664 * 3.1415927410125732421875;
        _1530 = _1740;
    }
    float _1742 = _1530;
    bool _1744 = uint(_1722) > 1u;
    int _1746 = _1734 * int(_1696);
    int _1748 = _1746 + _1266;
    float _1750 = float(uint(_1342));
    float _1752 = _1742;
    if (_1618)
    {
        float _1754 = _1742 * 0.15915493667125701904296875;
        _1752 = _1754;
    }
    float _1756 = _1752;
    int _1758 = ~_745;
    int _1760 = _1758 + 1;
    float _1762 = float(uint(_1748));
    float _1764 = as_type<float>(_791) * _1750;
    int _1766 = ~_795;
    int _1768 = _1766 + 1;
    int _1770 = _1760 * _1714;
    int _1772 = _1770 + _1484;
    int _1774 = ~_1736;
    int _1776 = _1774 + 1;
    int _1778 = _1776 + 1;
    float _1780 = as_type<float>(_785) * _1762;
    float _1782 = trunc(_1764);
    float _1784 = precise::max(_1782, 0.0);
    uint _1786 = uint(_1784);
    int _1788 = _1768 * int(_1730);
    int _1790 = _1788 + _1680;
    int _1792 = _1778;
    if (!_1744)
    {
        int _1794 = ~_1736;
        int _1796 = _1794 + 1;
        _1792 = _1796;
    }
    int _1798 = _1792;
    float _1800 = -_219;
    int _1802 = _1248 ? as_type<int>(_1800) : as_type<int>(_219);
    bool _1804 = uint(_1722) >= 2u;
    bool _1806 = uint(_1772) >= uint(_745);
    float _1808 = _1756;
    if (_1618)
    {
        float _1810 = _1756 * 6.283185482025146484375;
        float _1812 = sin(_1810);
        _1808 = _1812;
    }
    float _1814 = _1808;
    float _1816 = float(uint(_1790));
    int _1818 = _1804 ? 0 : 1;
    bool _1820 = _1722 != 3;
    float _1822 = as_type<float>(_984) * _1816;
    bool _1824 = !_1806;
    int _1826 = _1824 ? 0 : (-1);
    float _1828 = trunc(_1780);
    float _1830 = precise::max(_1828, 0.0);
    uint _1832 = uint(_1830);
    int _1834 = ~_745;
    int _1836 = _1834 + 1;
    int _1838 = ~_1714;
    int _1840 = _1838 + _1826;
    int _1842 = _1840 + 1;
    int _1844 = ~_1818;
    int _1846 = _1844 + 1;
    int _1848 = _1846 + 1;
    int _1850 = _1836 * int(_1786);
    int _1852 = _1850 + _1342;
    float _1854 = 0.0;
    int _1856 = _1848;
    bool _1858 = _1820;
    if (!_1618)
    {
        _1854 = _219;
    }
    float _1860 = _1854;
    float _1862 = trunc(_1822);
    float _1864 = precise::max(_1862, 0.0);
    uint _1866 = uint(_1864);
    int _1868 = _745 * _1842;
    int _1870 = _1868 + _1484;
    float _1872 = _1860;
    if (_1820)
    {
        int _1874 = ~_1818;
        int _1876 = _1874 + 1;
        _1856 = _1876;
    }
    int _1878 = _1856;
    if (_1618)
    {
        bool _1880 = _1814 > 0.5;
        _1858 = _1880;
    }
    bool _1882 = _1858;
    bool _1884 = !_1282;
    int _1886 = _1884 ? _1870 : (-1);
    float _1888 = float(uint(_1852));
    if (_1618)
    {
        float _1890 = -_219;
        float _1892 = _1882 ? _1890 : _219;
        _1872 = _1892;
    }
    float _1894 = _1872;
    int _1896 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1898 = _1896 != 0;
    float _1900 = as_type<float>(_791) * _1888;
    int _1902 = _1886 & 3;
    bool _1904 = _1902 != 0;
    int _1906 = int(_1696) + int(_1832);
    bool _1908 = !_1898;
    float _1910 = _1908 ? _219 : as_type<float>(_1802);
    float _1912 = trunc(_1900);
    float _1914 = precise::max(_1912, 0.0);
    uint _1916 = uint(_1914);
    bool _1918 = uint(_1902) > 1u;
    int _1920 = int(_1730) + int(_1866);
    int _1922 = ~_795;
    int _1924 = _1922 + 1;
    int _1926 = _1886 & 3;
    bool _1928 = _1926 != 0;
    int _1930 = ~_731;
    int _1932 = _1930 + 1;
    int _1934 = _1924 * _1920;
    int _1936 = _1934 + _1680;
    int _1938 = _1928 ? 0 : 1;
    float _1940 = float(uint(_1574));
    int _1942 = _1932 * _1906;
    int _1944 = _1942 + _1266;
    int _1946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1948 = _1946 != 0;
    int _1950 = ~_1938;
    int _1952 = _1950 + 1;
    int _1954 = _1952 + 1;
    float _1956 = as_type<float>(_984) * _1940;
    bool _1958 = !_1948;
    int _1960 = _1958 ? 0 : 1;
    bool _1962 = uint(_1936) >= uint(_795);
    int _1964 = _1954;
    float _1966 = as_type<float>(_1866);
    if (!_1918)
    {
        int _1968 = ~_1938;
        int _1970 = _1968 + 1;
        _1964 = _1970;
    }
    int _1972 = _1964;
    float _1974 = trunc(_1956);
    float _1976 = precise::max(_1974, 0.0);
    uint _1978 = uint(_1976);
    bool _1980 = uint(_1944) >= uint(_731);
    bool _1982 = !_1962;
    int _1984 = _1982 ? 0 : (-1);
    bool _1986 = _1902 != 3;
    int _1988 = ~_745;
    int _1990 = _1988 + 1;
    bool _1992 = !_1980;
    int _1994 = _1992 ? 0 : (-1);
    bool _1996 = uint(_1902) >= 2u;
    int _1998 = int(_1786) + int(_1916);
    int _2000 = ~_1920;
    int _2002 = _2000 + _1984;
    int _2004 = _2002 + 1;
    int _2006 = ~_795;
    int _2008 = _2006 + 1;
    int _2010 = _795 * _2004;
    int _2012 = _2010 + _1680;
    int _2014 = _1996 ? 0 : 1;
    int _2016 = _1990 * _1998;
    int _2018 = _2016 + _1342;
    int _2020 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2022 = _2020 != 0;
    int _2024 = ~_2014;
    int _2026 = _2024 + 1;
    int _2028 = _2026 + 1;
    int _2030 = _2028;
    float _2032 = as_type<float>(_2012);
    if (_1986)
    {
        int _2034 = ~_2014;
        int _2036 = _2034 + 1;
        _2030 = _2036;
    }
    int _2038 = _2030;
    int _2040 = _2008 * int(_1978);
    int _2042 = _2040 + _1574;
    int _2044 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2046 = _2044 != 0;
    bool _2048 = !_2022;
    int _2050 = _2048 ? 0 : 1;
    bool _2052 = uint(_2018) >= uint(_745);
    bool _2054 = !_1506;
    int _2056 = _2054 ? _2012 : (-1);
    bool _2058 = !_2046;
    int _2060 = _2058 ? 0 : 1;
    bool _2062 = !_2052;
    int _2064 = _2062 ? 0 : (-1);
    int _2066 = _2056 & 3;
    bool _2068 = _2066 != 0;
    int _2070 = _2056 & 3;
    bool _2072 = _2070 != 0;
    float _2074 = float(uint(_2042));
    int _2076 = _2068 ? 0 : 1;
    bool _2078 = uint(_2070) > 1u;
    float _2080 = as_type<float>(_984) * _2074;
    int _2082 = ~_2076;
    int _2084 = _2082 + 1;
    int _2086 = _2084 + 1;
    int _2088 = ~_795;
    int _2090 = _2088 + 1;
    float _2092 = trunc(_2080);
    float _2094 = precise::max(_2092, 0.0);
    uint _2096 = uint(_2094);
    float _2098 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2100 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    int _2102 = _2086;
    float _2104 = as_type<float>(_1978);
    if (!_2078)
    {
        int _2106 = ~_2076;
        int _2108 = _2106 + 1;
        _2102 = _2108;
    }
    int _2110 = _2102;
    float _2112 = -_2098;
    float _2114 = fma(_1164, 2.0, _2112);
    bool _2116 = uint(_2070) >= 2u;
    float _2118 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2120 = -_125;
    float _2122 = fma(_2120, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2114);
    int _2124 = _2116 ? 0 : 1;
    bool _2126 = _2070 != 3;
    float _2128 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2130 = int(_1978) + int(_2096);
    int _2132 = ~_2124;
    int _2134 = _2132 + 1;
    int _2136 = _2134 + 1;
    int _2138 = _2090 * _2130;
    int _2140 = _2138 + _1574;
    float _2142 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2144 = _2136;
    if (_2126)
    {
        int _2146 = ~_2124;
        int _2148 = _2146 + 1;
        _2144 = _2148;
    }
    int _2150 = _2144;
    float _2152 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2154 = uint(_2140) >= uint(_795);
    float _2156 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2158 = !_2154;
    int _2160 = _2158 ? 0 : (-1);
    float _2162 = -_2156;
    float _2164 = fma(_954, 2.0, _2162);
    bool _2166 = _892 > 0.5;
    float _2168 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2170 = _2168 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2172 = -_125;
    float _2174 = fma(_2172, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2164);
    float _2176 = -_215;
    int _2178 = _2166 ? as_type<int>(_2176) : as_type<int>(_215);
    float _2180 = 1.0 / _2170;
    bool _2182 = _904 != 1;
    float _2184 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2186 = in.m_48.x;
    float _2188 = in.m_48.y;
    float _2190 = in.m_48.z;
    int _2192 = abs(_2038);
    float _2194 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _2196 = ~_1906;
    int _2198 = _2196 + _1994;
    int _2200 = _2198 + 1;
    int _2202 = abs(_1798);
    float _2204 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2194);
    float _2206 = 0.0;
    if (!_2182)
    {
        _2206 = _900;
    }
    float _2208 = _2206;
    int _2210 = _731 * _2200;
    int _2212 = _2210 + _1266;
    float _2214 = 0.0;
    float _2216 = _2208;
    if (!_2182)
    {
        _2214 = _900;
    }
    float _2218 = _2214;
    float _2220 = _2218;
    if (!_2182)
    {
        _1966 = _910;
    }
    float _2222 = _1966;
    float _2224 = _2222;
    if (!_2182)
    {
        _1532 = _910;
    }
    float _2226 = _1532;
    float _2228 = _2226;
    if (_2182)
    {
        _2216 = _892;
    }
    float _2230 = _2216;
    if (_2182)
    {
        _2220 = _892;
    }
    float _2232 = _2220;
    if (_2182)
    {
        _2224 = _900;
    }
    float _2234 = _2224;
    float _2236 = _2188 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    if (_2182)
    {
        _2228 = _900;
    }
    float _2238 = _2228;
    float _2240 = _2188 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _2242 = _906 != 2;
    float _2244 = fma(_2186, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2236);
    float _2246 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2248 = _2188 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2250 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2252 = log2(_2250);
    float _2254 = fma(_2186, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2240);
    float _2256 = fma(_2186, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2248);
    float _2258 = _900 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2260 = fma(_2232, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2128);
    float _2262 = fma(_2190, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2254);
    float _2264 = fma(_2258, -2.0, _2246);
    float _2266 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    if (_2242)
    {
        _2104 = _892;
    }
    float _2268 = _2104;
    float _2270 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2260);
    float _2272 = _2268;
    if (_2242)
    {
        _2032 = _900;
    }
    float _2274 = _2032;
    float _2276 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2266);
    float _2278 = _2274;
    if (!_2242)
    {
        _2272 = _910;
    }
    float _2280 = _2272;
    float _2282 = _908 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2284 = _2252 * _125;
    if (!_2242)
    {
        _2278 = _892;
    }
    float _2286 = _2278;
    float _2288 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2264);
    int _2290 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2292 = _2290 != 0;
    float _2294 = fma(_2282, -2.0, _2100);
    float _2296 = exp2(_2284);
    bool _2298 = !_2292;
    float _2300 = _2298 ? _215 : as_type<float>(_2178);
    float _2302 = _2230 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _2304 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2306 = isnan(0.0);
    bool _2308 = _2304 || _2306;
    bool _2310 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2312 = _2308 || _2310;
    float _2314 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2316 = -_2118;
    float _2318 = fma(_2302, 2.0, _2316);
    float _2320 = _2280 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2322 = fma(_2238, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2314);
    float _2324 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2326 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2324;
    float _2328 = _2234 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2330 = -_2142;
    float _2332 = fma(_2320, 2.0, _2330);
    float _2334 = _2326 * _2180;
    float _2336 = -_2296;
    float _2338 = _2336 + 1.0;
    float _2340 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2342 = _2340 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2344 = fma(_2328, -2.0, _2152);
    float _2346 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2348 = _2346 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2350 = _2312 ? _2338 : 0.0;
    float _2352 = 1.0 / _2342;
    bool _2354 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2356 = isnan(1.0);
    bool _2358 = _2354 || _2356;
    bool _2360 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2362 = _2358 || _2360;
    float _2364 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2366 = 1.0 + _2364;
    float _2368 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2370 = _2368 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2372 = _2286 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2374 = 1.0 / _2366;
    float _2376 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2378 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2380 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2382 = fma(_2372, -2.0, _2184);
    float _2384 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2376);
    float _2386 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2378);
    float _2388 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2380);
    float _2390 = 1.0 / _2370;
    float _2392 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2394 = _2392 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2396 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2384);
    float _2398 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2386);
    float _2400 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2204);
    float _2402 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2388);
    float _2404 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2276);
    float _2406 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2294);
    float _2408 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2322);
    float _2410 = -_125;
    float _2412 = fma(_2410, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2318);
    float _2414 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2344);
    float _2416 = -_125;
    float _2418 = fma(_2416, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2332);
    float _2420 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2382);
    if (_2362)
    {
        float _2422 = _2350 * _2374;
        _135 = _2422;
    }
    float _2424 = _135;
    float _2426 = _900 * 2.0;
    bool _2428 = _1252 >= 0.0;
    bool _2430 = isnan(_1252);
    bool _2432 = _2428 || _2430;
    bool _2434 = isnan(0.0);
    bool _2436 = _2432 || _2434;
    float _2438 = 1.0 / _2394;
    float _2440 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2442 = _2440 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _2444 = _2436 ? 0 : 1;
    float _2446 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2448 = _2446 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _2450 = _1252 > 0.0;
    float _2452 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2454 = _2452 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2456 = floor(_2426);
    float _2458 = _2448 * _2390;
    float _2460 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2462 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2460;
    float _2464 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2466 = _2464 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2468 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2470 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2468;
    float _2472 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2474 = _2472 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2476 = fma(_2190, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2256);
    float _2478 = -_2408;
    float _2480 = _2478 + 1.0;
    float _2482 = 1.0 / _2348;
    float _2484 = _2474 * _2352;
    float _2486 = _2470 * _2438;
    int _2488 = ~_2444;
    int _2490 = _2488 + 1;
    int _2492 = _2490 + 1;
    float _2494 = -_2400;
    float _2496 = _2494 + 1.0;
    int _2498 = _2492;
    if (!_2450)
    {
        int _2500 = ~_2444;
        int _2502 = _2500 + 1;
        _2498 = _2502;
    }
    int _2504 = _2498;
    float _2506 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2508 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2506;
    float _2510 = 1.0 / _2442;
    bool _2512 = _2456 >= 0.0;
    bool _2514 = isnan(_2456);
    bool _2516 = _2512 || _2514;
    bool _2518 = isnan(0.0);
    bool _2520 = _2516 || _2518;
    float _2522 = -_2402;
    float _2524 = _2522 + 1.0;
    int _2526 = abs(_2110);
    int _2528 = _2520 ? 0 : 1;
    bool _2530 = _2456 > 0.0;
    float _2532 = 1.0 / _2454;
    float _2534 = _2462 * _2482;
    bool _2536 = _713 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2538 = isnan(_713);
    bool _2540 = _2536 || _2538;
    bool _2542 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2544 = _2540 || _2542;
    float _2546 = float(_2544);
    bool _2548 = _713 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2550 = isnan(_713);
    bool _2552 = _2548 || _2550;
    bool _2554 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2556 = _2552 || _2554;
    float _2558 = float(_2556);
    int _2560 = ~_2526;
    int _2562 = _2560 + 1;
    int _2564 = _2562 + 1;
    float _2566 = _2466 * _2510;
    int _2568 = ~_1998;
    int _2570 = _2568 + _2064;
    int _2572 = _2570 + 1;
    float _2574 = _910 * 2.0;
    int _2576 = ~_2528;
    int _2578 = _2576 + 1;
    int _2580 = _2578 + 1;
    int _2582 = _2580;
    if (!_2530)
    {
        int _2584 = ~_2528;
        int _2586 = _2584 + 1;
        _2582 = _2586;
    }
    int _2588 = _2582;
    int _2590 = _745 * _2572;
    int _2592 = _2590 + _1342;
    bool _2594 = _713 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2596 = isnan(_713);
    bool _2598 = _2594 || _2596;
    bool _2600 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2602 = _2598 || _2600;
    float _2604 = float(_2602);
    float _2606 = _2508 * _2532;
    bool _2608 = _713 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2610 = isnan(_713);
    bool _2612 = _2608 || _2610;
    bool _2614 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2616 = _2612 || _2614;
    float _2618 = float(_2616);
    float _2620 = -_2546;
    float _2622 = _2620 + 1.0;
    float _2624 = floor(_2574);
    bool _2626 = !_1282;
    int _2628 = _2626 ? _2592 : (-1);
    float _2630 = _2618 * _2622;
    float _2632 = -_2618;
    float _2634 = _2632 + 1.0;
    float _2636 = -_2558;
    float _2638 = _2636 + 1.0;
    bool _2640 = !_1904;
    int _2642 = _2640 ? 0 : 1;
    int _2644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2646 = _2644 != 0;
    int _2648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2650 = _2648 != 0;
    int _2652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2654 = _2652 != 0;
    float _2656 = _2604 * _2638;
    int _2658 = _1886 >> 31;
    float _2660 = -_2604;
    float _2662 = _2660 + 1.0;
    bool _2664 = _713 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2666 = isnan(_713);
    bool _2668 = _2664 || _2666;
    bool _2670 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2672 = _2668 || _2670;
    float _2674 = float(_2672);
    float _2676 = _2558 * _2634;
    int _2678 = _2658 & 3;
    bool _2680 = _713 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2682 = isnan(_713);
    bool _2684 = _2680 || _2682;
    bool _2686 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2688 = _2684 || _2686;
    float _2690 = float(_2688);
    float _2692 = -_2674;
    float _2694 = _2692 + 1.0;
    int _2696 = _1886 + _2678;
    float _2698 = _2674 * _2662;
    bool _2700 = _2624 >= 0.0;
    bool _2702 = isnan(_2624);
    bool _2704 = _2700 || _2702;
    bool _2706 = isnan(0.0);
    bool _2708 = _2704 || _2706;
    float _2710 = _2690 * _2694;
    int _2712 = _2696 >> 2;
    float _2714 = -_2690;
    float _2716 = _2714 + 1.0;
    bool _2718 = _713 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2720 = isnan(_713);
    bool _2722 = _2718 || _2720;
    bool _2724 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2726 = _2722 || _2724;
    float _2728 = float(_2726);
    float _2730 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2732 = _713 + _2730;
    int _2734 = _2708 ? 0 : 1;
    int _2736 = _2712 << 4;
    int _2738 = _2736 + 656;
    float _2740 = fma(_2334, _2732, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2742 = _2624 > 0.0;
    float _2744 = _2728 * _2716;
    float _2746 = -_2728;
    float _2748 = _2746 + 1.0;
    float _2750 = fma(_2190, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2244);
    bool _2752 = _713 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2754 = isnan(_713);
    bool _2756 = _2752 || _2754;
    bool _2758 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2760 = _2756 || _2758;
    float _2762 = float(_2760);
    uint _2764 = uint(int(uint(_2738) >> uint(2)));
    uint _2766 = uint(int(uint(int(_2764)) >> uint(2)));
    int _2768 = int(_2764) & 3;
    float _2770 = (*spvDescriptorSet0.vp_c9)._m0[int(_2766)][_2768];
    int _2772 = int(_2764) + 1;
    uint _2774 = uint(int(uint(_2772) >> uint(2)));
    int _2776 = _2772 & 3;
    float _2778 = (*spvDescriptorSet0.vp_c9)._m0[int(_2774)][_2776];
    float _2780 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2782 = _713 + _2780;
    float _2784 = _2750 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _2786 = abs(_2642);
    float _2788 = _2762 * _2748;
    float _2790 = fma(_2458, _962, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2792 = -_2762;
    float _2794 = _2792 + 1.0;
    float _2796 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2798 = _713 + _2796;
    float _2800 = _2740 * _2788;
    float _2802 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2804 = _713 + _2802;
    float _2806 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2808 = _713 + _2806;
    float _2810 = fma(_2484, _2798, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2812 = fma(_2794, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2800);
    float _2814 = fma(_2486, _2782, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2816 = fma(_2534, _2804, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2818 = _900 + _892;
    int _2820 = _2738 + 8;
    uint _2822 = uint(int(uint(_2820) >> uint(2)));
    uint _2824 = uint(int(uint(int(_2822)) >> uint(2)));
    int _2826 = int(_2822) & 3;
    float _2828 = (*spvDescriptorSet0.vp_c9)._m0[int(_2824)][_2826];
    int _2830 = int(_2822) + 1;
    uint _2832 = uint(int(uint(_2830) >> uint(2)));
    int _2834 = _2830 & 3;
    float _2836 = (*spvDescriptorSet0.vp_c9)._m0[int(_2832)][_2834];
    float _2838 = fma(_2790, _2744, _2812);
    float _2840 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2842 = _713 + _2840;
    int _2844 = ~_2734;
    int _2846 = _2844 + 1;
    int _2848 = _2846 + 1;
    float _2850 = _900 + (-0.5);
    float _2852 = fma(_2814, _2710, _2838);
    float _2854 = fma(_2566, _2842, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2856 = _2262 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2858 = _2848;
    if (!_2742)
    {
        int _2860 = ~_2734;
        int _2862 = _2860 + 1;
        _2858 = _2862;
    }
    int _2864 = _2858;
    float _2866 = _900 + _910;
    float _2868 = fma(_2810, _2698, _2852);
    float _2870 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2872 = _2856 + _2870;
    float _2874 = _2476 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2876 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2878 = _2784 + _2876;
    int _2880 = abs(_1972);
    float _2882 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2884 = fma(_2606, _2808, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2886 = _892 + _910;
    int _2888 = ~_2880;
    int _2890 = _2888 + 1;
    int _2892 = _2890 + 1;
    float _2894 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2882);
    bool _2896 = !_1724;
    int _2898 = _2896 ? 0 : 1;
    float _2900 = _892 + (-0.5);
    bool _2902 = _1902 != 3;
    float _2904 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2906 = int(_2904);
    float _2908 = _2818 + (-1.0);
    float _2910 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2912 = _2874 + _2910;
    float _2914 = fma(_2816, _2656, _2868);
    int _2916 = abs(_2050);
    float _2918 = _1708 + 0.5;
    float _2920 = fma(_2908, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2922 = _2892 * as_type<int>(_2778);
    int _2924 = ~_2786;
    int _2926 = _2924 + 1;
    int _2928 = _2926 + 1;
    float _2930 = fma(_2912, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2894);
    bool _2932 = !_2902;
    int _2934 = _2932 ? 0 : (-1);
    float _2936 = fma(_2918, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2122);
    float _2938 = fma(_2854, _2676, _2914);
    int _2940 = _2928 * as_type<int>(_2770);
    int _2942 = _2940 + _2922;
    int _2944 = abs(_2934);
    float _2946 = fma(_2884, _2630, _2938);
    int _2948 = ~_2192;
    int _2950 = _2948 + 1;
    int _2952 = _2950 + 1;
    int _2954 = ~_2944;
    int _2956 = _2954 + 1;
    int _2958 = _2956 + 1;
    float _2960 = fma(_2546, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2946);
    float _2962 = float(uint(_2906));
    int _2964 = _2952 * as_type<int>(_2828);
    int _2966 = _2964 + _2942;
    int _2968 = ~_2916;
    int _2970 = _2968 + 1;
    int _2972 = _2970 + 1;
    float _2974 = _1894 + (-0.5);
    bool _2976 = _2930 >= 0.0;
    int _2978 = _2958 * as_type<int>(_2836);
    int _2980 = _2978 + _2966;
    float _2982 = 1.0 / _2962;
    float _2984 = -_2974;
    float _2986 = -_2406;
    float _2988 = fma(_2984, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2986);
    float _2990 = _2300 + 0.5;
    int _2992 = _2980 * _2972;
    float _2994 = -_2404;
    float _2996 = _2994 + 1.0;
    float _2998 = _1910 + (-0.5);
    float _3000 = fma(_2990, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2174);
    float _3002 = -_1218;
    float _3004 = fma(_3002, _1708, _2936);
    float _3006 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3008 = _2628 * _2916;
    int _3010 = _3008 + _2992;
    float _3012 = fma(_2996, _1894, _2988);
    if (_2976)
    {
        _1738 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3014 = _1738;
    float _3016 = _1684 + 0.5;
    float _3018 = -_2998;
    float _3020 = -_2288;
    float _3022 = fma(_3018, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3020);
    float _3024 = float(uint(_3010));
    float _3026 = _1442 + (-0.5);
    float _3028 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3030 = as_type<int>(_2982) + (-2);
    int _3032 = as_type<int>(_2982);
    if (_2976)
    {
        float _3034 = _3014 * 5.0;
        _3032 = as_type<int>(_3034);
    }
    int _3036 = _3032;
    out.m_70.x = _3004;
    out.m_70.y = _3012;
    bool _3038 = !_2646;
    int _3040 = _3038 ? 0 : 1;
    float _3042 = as_type<float>(_3030) * _3024;
    int _3044 = abs(_2898);
    float _3046 = _3006 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_2976)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9474 = as_type<float>(_3036);
        out.gl_Position.z = _9474;
    }
    float _3048 = trunc(_3042);
    float _3050 = precise::max(_3048, 0.0);
    uint _3052 = uint(_3050);
    int _3054 = abs(_3040);
    float _3056 = fma(_3046, _3016, _2412);
    int _3058 = ~_2906;
    int _3060 = _3058 + 1;
    out.m_72.x = _2960;
    int _3062 = abs(_1960);
    float _3064 = _3028 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3066 = abs(_2906);
    if (_2976)
    {
        out.m_55.x = 0.0;
    }
    float _3068 = -_3064;
    float _3070 = -_2414;
    float _3072 = fma(_3068, _3026, _3070);
    float _3074 = _2872 * _2872;
    int _3076 = _1712 >> 31;
    float _3078 = fma(_1442, _2480, _3072);
    float _3080 = float(uint(_3066));
    float _3082 = fma(_2878, _2878, _3074);
    int _3084 = _2056 >> 31;
    int _3086 = _3060 * int(_3052);
    int _3088 = _3086 + _3010;
    int _3090 = _3076 & 3;
    float _3092 = 1.0 / _3080;
    int _3094 = _3084 & 3;
    int _3096 = _1712 + _3090;
    float _3098 = fma(_2912, _2912, _3082);
    float _3100 = -_2396;
    float _3102 = _3100 + 1.0;
    int _3104 = _2056 + _3094;
    float _3106 = _553 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3108 = rsqrt(_3098);
    float _3110 = -_3102;
    float _3112 = fma(_2300, _3110, _3000);
    int _3114 = abs(_3010);
    float _3116 = _3106 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _3118 = _3096 >> 2;
    int _3120 = _3104 >> 2;
    float _3122 = -_2270;
    float _3124 = _3122 + 1.0;
    int _3126 = as_type<int>(_3092) + (-2);
    float _3128 = -_2398;
    float _3130 = _3128 + 1.0;
    float _3132 = float(uint(_3114));
    float _3134 = -_3124;
    float _3136 = fma(_1684, _3134, _3056);
    float _3138 = float(uint(_3088));
    float _3140 = fma(_1910, _3130, _3022);
    int _3142 = _3118 << 4;
    int _3144 = _3142 + 368;
    float _3146 = as_type<float>(_3126) * _3132;
    int _3148 = _3120 << 4;
    int _3150 = _3148 + 800;
    float _3152 = as_type<float>(_3030) * _3138;
    float _3154 = _3116 * _3108;
    uint _3156 = uint(int(uint(_3144) >> uint(2)));
    uint _3158 = uint(int(uint(int(_3156)) >> uint(2)));
    int _3160 = int(_3156) & 3;
    float _3162 = (*spvDescriptorSet0.vp_c9)._m0[int(_3158)][_3160];
    int _3164 = int(_3156) + 1;
    uint _3166 = uint(int(uint(_3164) >> uint(2)));
    int _3168 = _3164 & 3;
    float _3170 = (*spvDescriptorSet0.vp_c9)._m0[int(_3166)][_3168];
    int _3172 = ~_3066;
    int _3174 = _3172 + 1;
    float _3176 = trunc(_3146);
    float _3178 = precise::max(_3176, 0.0);
    uint _3180 = uint(_3178);
    float _3182 = _2872 * _3154;
    float _3184 = _2878 * _3154;
    out.m_74.x = _3112;
    out.m_74.y = _3140;
    out.m_74.z = _3136;
    out.m_74.w = _3078;
    float _3186 = -_3182;
    float _3188 = _2872 + _3186;
    uint _3190 = uint(int(uint(_3150) >> uint(2)));
    uint _3192 = uint(int(uint(int(_3190)) >> uint(2)));
    int _3194 = int(_3190) & 3;
    float _3196 = (*spvDescriptorSet0.vp_c9)._m0[int(_3192)][_3194];
    int _3198 = int(_3190) + 1;
    uint _3200 = uint(int(uint(_3198) >> uint(2)));
    int _3202 = _3198 & 3;
    float _3204 = (*spvDescriptorSet0.vp_c9)._m0[int(_3200)][_3202];
    float _3206 = -_3184;
    float _3208 = _2878 + _3206;
    float _3210 = float(_2864);
    float _3212 = _3188 * _3188;
    float _3214 = float(_3054);
    float _3216 = trunc(_3152);
    float _3218 = precise::max(_3216, 0.0);
    uint _3220 = uint(_3218);
    int _3222 = ~_2130;
    int _3224 = _3222 + _2160;
    int _3226 = _3224 + 1;
    float _3228 = fma(_3208, _3208, _3212);
    int _3230 = _3144 + 8;
    uint _3232 = uint(int(uint(_3230) >> uint(2)));
    uint _3234 = uint(int(uint(int(_3232)) >> uint(2)));
    int _3236 = int(_3232) & 3;
    float _3238 = (*spvDescriptorSet0.vp_c9)._m0[int(_3234)][_3236];
    int _3240 = int(_3232) + 1;
    uint _3242 = uint(int(uint(_3240) >> uint(2)));
    int _3244 = _3240 & 3;
    float _3246 = (*spvDescriptorSet0.vp_c9)._m0[int(_3242)][_3244];
    float _3248 = _3214 * _3210;
    int _3250 = _3174 * int(_3180);
    int _3252 = _3250 + _3114;
    bool _3254 = _731 == 0;
    int _3256 = _795 * _3226;
    int _3258 = _3256 + _1574;
    float _3260 = float(uint(_3252));
    int _3262 = _3150 + 8;
    uint _3264 = uint(int(uint(_3262) >> uint(2)));
    uint _3266 = uint(int(uint(int(_3264)) >> uint(2)));
    int _3268 = int(_3264) & 3;
    float _3270 = (*spvDescriptorSet0.vp_c9)._m0[int(_3266)][_3268];
    int _3272 = int(_3264) + 1;
    uint _3274 = uint(int(uint(_3272) >> uint(2)));
    int _3276 = _3272 & 3;
    float _3278 = (*spvDescriptorSet0.vp_c9)._m0[int(_3274)][_3276];
    int _3280 = ~_2906;
    int _3282 = _3280 + 1;
    int _3284 = ~_2202;
    int _3286 = _3284 + 1;
    int _3288 = _3286 + 1;
    float _3290 = as_type<float>(_3126) * _3260;
    int _3292 = int(_3052) + int(_3220);
    bool _3294 = !_2072;
    int _3296 = _3294 ? 0 : 1;
    float _3298 = trunc(_3290);
    float _3300 = precise::max(_3298, 0.0);
    uint _3302 = uint(_3300);
    bool _3304 = _1722 != 3;
    int _3306 = _3282 * _3292;
    int _3308 = _3306 + _3010;
    int _3310 = ~_3066;
    int _3312 = _3310 + 1;
    bool _3314 = !_3254;
    int _3316 = _3314 ? _2212 : (-1);
    bool _3318 = !_1506;
    int _3320 = _3318 ? _3258 : (-1);
    int _3322 = _3288 * as_type<int>(_3170);
    bool _3324 = !_3304;
    int _3326 = _3324 ? 0 : (-1);
    bool _3328 = uint(_3308) >= uint(_2906);
    int _3330 = int(_3180) + int(_3302);
    bool _3332 = !_3328;
    int _3334 = _3332 ? 0 : (-1);
    int _3336 = _2564 * as_type<int>(_3204);
    int _3338 = abs(_3296);
    int _3340 = _3312 * _3330;
    int _3342 = _3340 + _3114;
    int _3344 = ~_3338;
    int _3346 = _3344 + 1;
    int _3348 = _3346 + 1;
    bool _3350 = _2070 != 3;
    int _3352 = ~_3044;
    int _3354 = _3352 + 1;
    int _3356 = _3354 + 1;
    int _3358 = _3348 * as_type<int>(_3196);
    int _3360 = _3358 + _3336;
    int _3362 = ~_3292;
    int _3364 = _3362 + _3334;
    int _3366 = _3364 + 1;
    bool _3368 = !_3350;
    int _3370 = _3368 ? 0 : (-1);
    int _3372 = _3356 * as_type<int>(_3162);
    int _3374 = _3372 + _3322;
    bool _3376 = uint(_3342) >= uint(_3066);
    int _3378 = _2906 * _3366;
    int _3380 = _3378 + _3010;
    int _3382 = abs(_2150);
    bool _3384 = !_3376;
    int _3386 = _3384 ? 0 : (-1);
    int _3388 = abs(_1878);
    bool _3390 = _2906 == 0;
    int _3392 = ~_3382;
    int _3394 = _3392 + 1;
    int _3396 = _3394 + 1;
    int _3398 = abs(_3326);
    int _3400 = ~_3388;
    int _3402 = _3400 + 1;
    int _3404 = _3402 + 1;
    int _3406 = _3396 * as_type<int>(_3270);
    int _3408 = _3406 + _3360;
    bool _3410 = !_3390;
    int _3412 = _3410 ? _3380 : (-1);
    float _3414 = _1120 + 0.5;
    bool _3416 = _2906 == 0;
    int _3418 = _3404 * as_type<int>(_3238);
    int _3420 = _3418 + _3374;
    int _3422 = _3010 ^ _2906;
    int _3424 = abs(_3370);
    int _3426 = ~_3398;
    int _3428 = _3426 + 1;
    int _3430 = _3428 + 1;
    float _3432 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    uint _3434 = uint(int(uint(_3422) >> uint(31)));
    int _3436 = ~_3424;
    int _3438 = _3436 + 1;
    int _3440 = _3438 + 1;
    int _3442 = _3430 * as_type<int>(_3246);
    int _3444 = _3442 + _3420;
    int _3446 = ~_3386;
    int _3448 = _3330 + _3446;
    int _3450 = _3448 + 1;
    int _3452 = ~int(_3434);
    int _3454 = _3452 + 1;
    float _3456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3458 = abs(_2060);
    int _3460 = _3440 * as_type<int>(_3278);
    int _3462 = _3460 + _3408;
    int _3464 = _3450 ^ _3454;
    int _3466 = ~_3062;
    int _3468 = _3466 + 1;
    int _3470 = _3468 + 1;
    int _3472 = ~_3454;
    int _3474 = _3472 + _3464;
    int _3476 = _3474 + 1;
    float _3478 = _3432 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3480 = in.m_76.x;
    float _3482 = in.m_76.y;
    float _3484 = in.m_76.z;
    int _3486 = ~_3458;
    int _3488 = _3486 + 1;
    int _3490 = _3488 + 1;
    int _3492 = _3444 * _3470;
    bool _3494 = !_3416;
    int _3496 = _3494 ? _3476 : (-1);
    float _3498 = float(_3412);
    int _3500 = _3462 * _3490;
    float _3502 = float(_3496);
    float _3504 = _3456 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3506 = _3316 * _3062;
    int _3508 = _3506 + _3492;
    float _3510 = fma(_3478, _3498, _2418);
    int _3512 = _3320 * _3458;
    int _3514 = _3512 + _3500;
    float _3516 = -_2420;
    float _3518 = fma(_3504, _3502, _3516);
    float _3520 = _1086 + (-0.5);
    float _3522 = fma(_3478, _3414, _3510);
    float _3524 = _3248 * (-2.0);
    float _3526 = -_3504;
    float _3528 = fma(_3526, _3520, _3518);
    float _3530 = float(_3508);
    float _3532 = -_2496;
    float _3534 = fma(_1120, _3532, _3522);
    float _3536 = float(_3514);
    float _3538 = fma(_1086, _2524, _3528);
    float _3540 = fma(_2920, _3524, _2920);
    float _3542 = _2912 * _3154;
    float _3544 = fma(_3524, _3480, _3480);
    bool _3546 = !_2650;
    int _3548 = _3546 ? 0 : 1;
    out.m_78.x = _3530;
    float _3550 = -_3542;
    float _3552 = _2912 + _3550;
    bool _3554 = !_2654;
    int _3556 = _3554 ? 0 : 1;
    out.m_78.w = _3536;
    int _3558 = abs(_3548);
    out.m_80.x = _3534;
    out.m_80.y = _3538;
    float _3560 = _3484;
    if (_2976)
    {
        return out;
    }
    float _3562 = -_3182;
    float _3564 = _2856 + _3562;
    float _3566 = float(_2504);
    float _3568 = -_3184;
    float _3570 = _2784 + _3568;
    float _3572 = float(_3558);
    float _3574 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3576 = _3564 + _3574;
    float _3578 = fma(_2900, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3544);
    float _3580 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3582 = _3570 + _3580;
    float _3584 = _3572 * _3566;
    int _3586 = abs(_3556);
    float _3588 = _3576 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3590 = -_3542;
    float _3592 = _2874 + _3590;
    float _3594 = fma(_3540, _2424, _3578);
    float _3596 = _2866 + (-1.0);
    float _3598 = fma(_3582, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3588);
    float _3600 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3602 = _3592 + _3600;
    float _3604 = float(_2588);
    float _3606 = fma(_3596, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3608 = float(_3586);
    float _3610 = fma(_3602, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3598);
    float _3612 = _3584 * (-2.0);
    float _3614 = _2886 + (-1.0);
    float _3616 = _910 + (-0.5);
    float _3618 = _3608 * _3604;
    float _3620 = fma(_3612, _3482, _3482);
    float _3622 = fma(_3606, _3612, _3606);
    bool _3624 = _3610 >= 0.0;
    float _3626 = _3618 * (-2.0);
    float _3628 = fma(_2850, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3620);
    float _3630 = fma(_3552, _3552, _3228);
    float _3632 = _3594 * 0.15915493667125701904296875;
    float _3634 = fma(_3622, _2424, _3628);
    float _3636 = fma(_3626, _3484, _3484);
    float _3638 = fma(_3614, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3640 = _3632 * 6.283185482025146484375;
    float _3642 = sin(_3640);
    float _3644 = _3634 * 0.15915493667125701904296875;
    float _3646 = fma(_3616, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3636);
    float _3648 = fma(_3638, _3626, _3638);
    if (_3624)
    {
        _3560 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3650 = _3560;
    int _3652 = as_type<int>(_3650);
    if (_3624)
    {
        out.m_55.x = 0.0;
    }
    float _3654 = fma(_3648, _2424, _3646);
    float _3656 = sqrt(_3630);
    if (_3624)
    {
        float _3658 = _3650 * 5.0;
        _3652 = as_type<int>(_3658);
    }
    int _3660 = _3652;
    float _3662 = _3654 * 0.15915493667125701904296875;
    if (_3624)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10373 = as_type<float>(_3660);
        out.gl_Position.z = _10373;
    }
    float _3664 = _3632 * 6.283185482025146484375;
    float _3666 = cos(_3664);
    float _3668 = _3644 * 6.283185482025146484375;
    float _3670 = sin(_3668);
    float _3672 = _3644 * 6.283185482025146484375;
    float _3674 = cos(_3672);
    if (_3624)
    {
        return out;
    }
    float _3676 = _3662 * 6.283185482025146484375;
    float _3678 = cos(_3676);
    float _3680 = _3108 * _3656;
    float _3682 = _551 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3684 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _219);
    float _3686 = _3666 * _3674;
    float _3688 = _3106 * _3680;
    float _3690 = _3680 * _3682;
    float _3692 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _215);
    float _3694 = _3662 * 6.283185482025146484375;
    float _3696 = sin(_3694);
    float _3698 = _3642 * _3674;
    float _3700 = _3684 * _3690;
    float _3702 = _3642 * _3670;
    float _3704 = _3666 * _3670;
    float _3706 = _3692 * _3688;
    float _3708 = _219 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3710 = _3666 * _3678;
    float _3712 = _3674 * _3678;
    float _3714 = _3642 * _3678;
    float _3716 = _3670 * _3678;
    float _3718 = _3710 * _3700;
    float _3720 = _3680 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3722 = _3720 * 0.5;
    float _3724 = fma(_3696, _3686, _3702);
    float _3726 = -_3698;
    float _3728 = fma(_3696, _3704, _3726);
    float _3730 = -_3700;
    float _3732 = _3696 * _3730;
    float _3734 = -_3704;
    float _3736 = fma(_3696, _3698, _3734);
    float _3738 = fma(_3724, _3706, _3718);
    float _3740 = _3714 * _3700;
    float _3742 = fma(_3712, _3706, _3732);
    float _3744 = fma(_3696, _3702, _3686);
    float _3746 = fma(_3728, _3722, _3738);
    float _3748 = fma(_3736, _3706, _3740);
    float _3750 = fma(_3716, _3722, _3742);
    float _3752 = _3724 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3754 = _3746 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3756 = _3746 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3758 = fma(_3744, _3722, _3748);
    float _3760 = fma(_3712, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3752);
    float _3762 = fma(_3750, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3754);
    float _3764 = fma(_3750, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3756);
    float _3766 = _3728 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3768 = _3728 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3770 = fma(_3758, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3762);
    float _3772 = fma(_3758, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3764);
    float _3774 = fma(_3716, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3768);
    float _3776 = _3770 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3778 = _3772 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3780 = _3724 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3782 = _2784 + _3776;
    float _3784 = _2874 + _3778;
    float _3786 = _3724 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3788 = _3746 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3790 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3792 = _3782 + _3790;
    float _3794 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3796 = _3784 + _3794;
    float _3798 = fma(_3712, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3780);
    float _3800 = fma(_3750, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3788);
    float _3802 = _3792 * _3792;
    float _3804 = _3796 * _3796;
    float _3806 = fma(_3712, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3786);
    float _3808 = fma(_3758, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3800);
    float _3810 = _3710 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3812 = _3802 + _3804;
    float _3814 = _3710 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3816 = _3808 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3818 = _3710 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3820 = sqrt(_3812);
    float _3822 = fma(_3708, _3708, 1.0);
    float _3824 = _3728 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3826 = _2856 + _3816;
    float _3828 = -_3696;
    float _3830 = fma(_3828, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3810);
    float _3832 = -_3696;
    float _3834 = fma(_3832, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3814);
    float _3836 = -_3696;
    float _3838 = fma(_3836, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3818);
    float _3840 = fma(_3716, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3824);
    float _3842 = rsqrt(_3822);
    float _3844 = fma(_3716, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3766);
    bool _3846 = _3820 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3848 = _3716;
    float _3850 = _3810;
    float _3852 = _3808;
    float _3854 = _3822;
    float _3856 = _3824;
    if (!_3846)
    {
        _3848 = _3804;
    }
    float _3858 = _3848;
    float _3860 = _3858;
    if (!_3846)
    {
        _3850 = _3802;
    }
    float _3862 = _3850;
    float _3864 = _3862;
    if (!_3846)
    {
        _3852 = _3782;
    }
    float _3866 = _3852;
    float _3868 = _3866;
    if (!_3846)
    {
        _3854 = _3784;
    }
    float _3870 = _3854;
    float _3872 = _3870;
    if (!_3846)
    {
        _3856 = _3826;
    }
    float _3874 = _3856;
    bool _3876 = !_3846;
    float _3878 = _3874;
    if (!_3876)
    {
        float _3880 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3882 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3884 = _3820 + _3882;
        float _3886 = rsqrt(_3812);
        float _3888 = _3884 * _3880;
        float _3890 = _3826 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3892 = _3888 * 0.15915493667125701904296875;
        float _3894 = _3892 * 6.283185482025146484375;
        float _3896 = sin(_3894);
        float _3898 = _3892 * 6.283185482025146484375;
        float _3900 = cos(_3898);
        float _3902 = fma(_3896, _3890, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3904 = _3886 * _3902;
        float _3906 = _3900 + (-1.0);
        float _3908 = fma(_3792, _3904, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3910 = fma(_3796, _3904, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3912 = _3906 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3914 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3916 = _3908 + _3914;
        float _3918 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3920 = _3910 + _3918;
        float _3922 = fma(_3826, _3900, _3912);
        float _3924 = _3916 * _3916;
        float _3926 = _3920 * _3920;
        _3878 = _3922;
        _3864 = _3924;
        _3860 = _3926;
        _3868 = _3908;
        _3872 = _3910;
    }
    float _3928 = _3878;
    float _3930 = _3864;
    float _3932 = _3860;
    float _3934 = _3868;
    float _3936 = _3872;
    float _3938 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3940 = _3928 + _3938;
    float _3942 = fma(_3714, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3830);
    float _3944 = fma(_3714, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3834);
    float _3946 = fma(_3714, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3838);
    float _3948 = fma(_3940, _3940, _3930);
    float _3950 = fma(_3744, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3840);
    float _3952 = fma(_3744, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3844);
    float _3954 = fma(_3744, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3774);
    float _3956 = _3948 + _3932;
    float _3958 = _3708 * _3842;
    float _3960 = fma(_3736, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3806);
    float _3962 = fma(_3736, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3798);
    float _3964 = _215 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3966 = _3708 * _3942;
    float _3968 = _3708 * _3944;
    float _3970 = fma(_3736, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3760);
    float _3972 = _3708 * _3946;
    float _3974 = -_3950;
    float _3976 = _3958 * _3974;
    float _3978 = -_3952;
    float _3980 = _3958 * _3978;
    float _3982 = -_3954;
    float _3984 = _3958 * _3982;
    float _3986 = sqrt(_3956);
    float _3988 = fma(_3964, _3960, _3966);
    float _3990 = fma(_3964, _3962, _3968);
    float _3992 = fma(_3964, _3970, _3972);
    float _3994 = fma(_3842, _3942, _3976);
    float _3996 = fma(_3842, _3944, _3980);
    float _3998 = fma(_3842, _3946, _3984);
    float _4000 = _3950 + _3988;
    float _4002 = _3952 + _3990;
    float _4004 = _3954 + _3992;
    out.m_82.x = _3960;
    out.m_82.y = _3962;
    out.m_82.z = _3970;
    out.m_84.x = _3994;
    out.m_84.y = _3996;
    out.m_84.z = _3998;
    bool _4006 = _3986 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4008 = isnan(_3986);
    bool _4010 = _4006 || _4008;
    bool _4012 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4014 = _4010 || _4012;
    out.m_86.x = _4000;
    out.m_86.y = _4002;
    out.m_86.z = _4004;
    float _4016 = _3990;
    if (!_4014)
    {
        _4016 = 1.0;
    }
    float _4018 = _4016;
    bool _4020 = !_4014;
    float _4022 = _4018;
    if (!_4020)
    {
        bool _4024 = _3986 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4026 = isnan(_3986);
        bool _4028 = _4024 || _4026;
        bool _4030 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4032 = _4028 || _4030;
        if (!_4032)
        {
            float _4034 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4036 = _3986 + _4034;
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
            bool _4054 = _3986 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4056 = isnan(_3986);
            bool _4058 = _4054 || _4056;
            bool _4060 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4062 = _4058 || _4060;
            if (!_4062)
            {
                float _4064 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4066 = _3986 + _4064;
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
    float _4086 = _3928 + _4084;
    float _4088 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4090 = _3934 + _4088;
    float _4092 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4094 = _3936 + _4092;
    float _4096 = fma(_4086, _4082, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4098 = fma(_4090, _4082, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4100 = fma(_4094, _4082, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4102 = -_2856;
    float _4104 = _4102 + _4096;
    float _4106 = -_2784;
    float _4108 = _4106 + _4098;
    float _4110 = -_2874;
    float _4112 = _4110 + _4100;
    float _4114 = _4104 * _4104;
    float _4116 = fma(_4108, _4108, _4114);
    float _4118 = fma(_4112, _4112, _4116);
    float _4120 = sqrt(_4118);
    bool _4122 = _4120 > 0.0;
    float _4124 = _4090;
    float _4126 = _4120;
    float _4128 = _4094;
    if (!_4122)
    {
        _4124 = _4098;
    }
    float _4130 = _4124;
    float _4132 = _4130;
    float _4134 = _4130;
    if (!_4122)
    {
        _4126 = _4096;
    }
    float _4136 = _4126;
    float _4138 = _4136;
    if (!_4122)
    {
        _4128 = _4100;
    }
    float _4140 = _4128;
    bool _4142 = !_4122;
    float _4144 = _4140;
    if (!_4142)
    {
        float _4146 = _209 * _209;
        float _4148 = fma(_207, _207, _4146);
        float _4150 = rsqrt(_4118);
        float _4152 = fma(_211, _211, _4148);
        float _4154 = sqrt(_4152);
        float _4156 = _4108 * _4150;
        float _4158 = _4104 * _4150;
        float _4160 = _4112 * _4150;
        bool _4162 = _4154 > 0.0;
        float _4164 = _4150;
        float _4166 = _4154;
        if (!_4162)
        {
            _4132 = _4098;
        }
        float _4168 = _4132;
        _4134 = _4168;
        if (!_4162)
        {
            _4164 = _4096;
        }
        float _4170 = _4164;
        _4138 = _4170;
        if (!_4162)
        {
            _4166 = _4100;
        }
        float _4172 = _4166;
        bool _4174 = !_4162;
        _4144 = _4172;
        if (!_4174)
        {
            float _4176 = rsqrt(_4152);
            float _4178 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4180 = _209 * _4176;
            float _4182 = _207 * _4176;
            float _4184 = _4158 * _4180;
            float _4186 = _211 * _4176;
            float _4188 = fma(_4156, _4182, _4184);
            float _4190 = _4178 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4192 = fma(_4160, _4186, _4188);
            float _4194 = _4192 * _4190;
            float _4196 = fma(_207, _4194, _4098);
            float _4198 = fma(_209, _4194, _4096);
            float _4200 = fma(_211, _4194, _4100);
            _4138 = _4198;
            _4134 = _4196;
            _4144 = _4200;
        }
    }
    float _4202 = _4138;
    float _4204 = _4134;
    float _4206 = _4144;
    float _4208 = -_3182;
    float _4210 = _4208 + _4202;
    float _4212 = -_3184;
    float _4214 = _4212 + _4204;
    float _4216 = -_3542;
    float _4218 = _4216 + _4206;
    float _4220 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4222 = _4210 + _4220;
    float _4224 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4226 = _4214 + _4224;
    float _4228 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4230 = _4218 + _4228;
    float _4232 = _4222 * _4222;
    float _4234 = fma(_3570, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4236 = fma(_4226, _4226, _4232);
    float _4238 = floor(_4234);
    float _4240 = fma(_3592, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4242 = fma(_4230, _4230, _4236);
    float _4244 = rsqrt(_4242);
    float _4246 = sqrt(_4242);
    float _4248 = -_4238;
    float _4250 = _4234 + _4248;
    float _4252 = _4244 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4254 = floor(_4240);
    float _4256 = _4226 * _4252;
    float _4258 = _4230 * _4252;
    float _4260 = _4256 * _4256;
    float _4262 = _4258 * _4258;
    float _4264 = _4260 + _4262;
    float _4266 = sqrt(_4264);
    bool _4268 = _4266 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4270 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4272 = _4266 + _4270;
    float _4274 = _4230;
    float _4276 = _4264;
    float _4278 = _4272;
    float _4280 = _4222;
    float _4282 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_4268)
    {
        float _4284 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4274 = _4284;
    }
    float _4286 = _4274;
    if (_4268)
    {
        float _4288 = rsqrt(_4264);
        _4276 = _4288;
    }
    float _4290 = _4276;
    if (_4268)
    {
        float _4292 = _4272 * _4286;
        _4278 = _4292;
    }
    float _4294 = _4278;
    if (_4268)
    {
        float _4296 = _4294 * 0.15915493667125701904296875;
        _223 = _4296;
    }
    float _4298 = _223;
    float _4300 = _4236;
    float _4302 = _4298;
    if (_4268)
    {
        float _4304 = _4298 * 6.283185482025146484375;
        float _4306 = sin(_4304);
        _4300 = _4306;
    }
    float _4308 = _4300;
    float _4310 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4312 = precise::max(0.0, _4310);
    float _4314 = _4244;
    float _4316 = _4312;
    float _4318 = _4310;
    if (_4268)
    {
        float _4320 = _4298 * 6.283185482025146484375;
        float _4322 = cos(_4320);
        _4314 = _4322;
    }
    float _4324 = _4314;
    float _4326 = -_4252;
    float _4328 = -_4312;
    float _4330 = fma(_4222, _4326, _4328);
    if (!_4268)
    {
        _4280 = _4256;
    }
    float _4332 = _4280;
    float _4334 = _4332;
    if (_4268)
    {
        float _4336 = _4330 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4316 = _4336;
    }
    float _4338 = _4316;
    float _4340 = _4308;
    float _4342 = _4338;
    if (_4268)
    {
        float _4344 = fma(_4308, _4338, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4340 = _4344;
    }
    float _4346 = _4340;
    float _4348 = _4346;
    if (!_4268)
    {
        _4342 = _4330;
    }
    float _4350 = _4342;
    float _4352 = _4350;
    float _4354 = _4324;
    if (_4268)
    {
        float _4356 = _4324 + (-1.0);
        _4318 = _4356;
    }
    float _4358 = _4318;
    float _4360 = _4358;
    if (_4268)
    {
        float _4362 = _4290 * _4346;
        _4282 = _4362;
    }
    float _4364 = _4282;
    if (!_4268)
    {
        _4348 = _4260;
    }
    float _4366 = _4348;
    float _4368 = _4210 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4370 = _4366;
    if (_4268)
    {
        float _4372 = _4358 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4302 = _4372;
    }
    float _4374 = _4302;
    if (_4268)
    {
        float _4376 = _4256 * _4364;
        _4334 = _4376;
    }
    float _4378 = _4334;
    if (!_4268)
    {
        _4360 = _4258;
    }
    float _4380 = _4360;
    float _4382 = _4380;
    if (_4268)
    {
        float _4384 = _4258 * _4364;
        _4382 = _4384;
    }
    float _4386 = _4382;
    if (_4268)
    {
        float _4388 = fma(_4330, _4324, _4374);
        _4352 = _4388;
    }
    float _4390 = _4352;
    if (_4268)
    {
        float _4392 = _4378 * _4378;
        _4370 = _4392;
    }
    float _4394 = _4370;
    if (!_4268)
    {
        _4354 = _4262;
    }
    float _4396 = _4354;
    float _4398 = _4396;
    if (_4268)
    {
        float _4400 = _4386 * _4386;
        _4398 = _4400;
    }
    float _4402 = _4398;
    float _4404 = _4210 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4406 = fma(_4390, _4390, _4394);
    float _4408 = fma(_4214, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4368);
    float _4410 = _4210 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4412 = fma(_4214, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4404);
    float _4414 = _4406 + _4402;
    float _4416 = _4210 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4418 = fma(_4218, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4408);
    float _4420 = fma(_4218, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4412);
    float _4422 = rsqrt(_4414);
    float _4424 = fma(_4214, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4416);
    float _4426 = _4418 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4428 = _4420 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4430 = fma(_4218, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4424);
    float _4432 = fma(_4214, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4410);
    float _4434 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4436 = fma(_4246, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4434);
    float _4438 = precise::clamp(_4436, 0.0, 1.0);
    float _4440 = _4430 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4442 = _4426 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4444 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4446 = _4428 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4448 = fma(_4218, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4432);
    float _4450 = fma(_4440, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4442);
    float _4452 = -_4438;
    float _4454 = _4452 + 1.0;
    float _4456 = -_4446;
    float _4458 = fma(_4456, _4444, 1.0);
    float _4460 = _4448 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4462 = fma(_4428, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4450);
    float _4464 = _4422 * _4378;
    float _4466 = _4422 * _4386;
    float _4468 = abs(_4454);
    float _4470 = log2(_4468);
    float _4472 = fma(_4460, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4462);
    float _4474 = _4422 * _4390;
    float _4476 = _4464 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4478 = _4426 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4480 = -_4254;
    float _4482 = _4240 + _4480;
    float _4484 = _4474 + 1.0;
    float _4486 = -_4476;
    float _4488 = fma(_4474, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4486);
    float _4490 = log2(_4458);
    float _4492 = fma(_4440, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4478);
    float _4494 = -_4466;
    float _4496 = fma(_4494, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4488);
    float _4498 = _4426 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4500 = fma(_4496, -0.5, 0.5);
    float _4502 = _4470 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4504 = 1.0 / _4472;
    float _4506 = fma(_4496, 0.5, 0.5);
    float _4508 = fma(_4440, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4498);
    float _4510 = fma(_4506, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4512 = fma(_4428, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4492);
    float _4514 = exp2(_4502);
    float _4516 = fma(_4506, _4510, -0.212114393711090087890625);
    float _4518 = fma(_4460, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4512);
    float _4520 = _4490 * 0.693147182464599609375;
    float _4522 = fma(_4506, _4516, 1.570728778839111328125);
    float _4524 = _4520 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4526 = sqrt(_4500);
    float _4528 = fma(_4428, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4508);
    float _4530 = _4518 * _4504;
    float _4532 = fma(_4460, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4528);
    float _4534 = fma(_4530, -0.5, 0.5);
    float _4536 = -_4474;
    float _4538 = fma(_4514, _4484, _4536);
    float _4540 = _4532 * _4504;
    float _4542 = fma(_4538, 0.5, 0.5);
    float _4544 = fma(_4540, 0.5, 0.5);
    float _4546 = _4526 * 0.636619746685028076171875;
    float2 _11869 = float2(_4250, _4482);
    float _4548 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11869, float2(0.0), isnan(_11869)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11869, float2(0.0), isnan(_11869)), level(0.0)).x;
    float3 _11880 = float3(_4544, _4534, _4524);
    float _4550 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11880, float3(0.0), isnan(_11880)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11880, float3(0.0), isnan(_11880)), level(0.0)).x;
    float3 _11891 = float3(_4544, _4534, _4524);
    float4 _4553 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11891, float3(0.0), isnan(_11891)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11891, float3(0.0), isnan(_11891)), level(0.0)).xyzw;
    float _4555 = _4553.x;
    float _4557 = _4553.y;
    float _4559 = _4553.z;
    float _4561 = _4553.w;
    float _4563 = -_4522;
    float _4565 = fma(_4546, _4563, 1.0);
    float2 _11912 = float2(_4565, _4542);
    float3 _4569 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11912, float2(0.0), isnan(_11912)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11912, float2(0.0), isnan(_11912)), level(0.0)).xyz;
    float _4571 = _4569.x;
    float _4573 = _4569.y;
    float _4575 = _4569.z;
    float _4577 = _3564 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4579 = _3564 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4581 = _4426 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4583 = _4470 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4585 = fma(_3570, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4577);
    float _4587 = fma(_3570, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4579);
    float _4589 = in.m_88.x;
    float _4591 = fma(_3592, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4585);
    float _4593 = fma(_3592, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4587);
    float _4595 = fma(_4440, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4581);
    float _4597 = _4591 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4599 = _4593 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4601 = fma(_4428, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4595);
    float _4603 = 1.0 / _4597;
    float _4605 = _4599 + _4597;
    float _4607 = _4532 + _4472;
    float _4609 = fma(_4460, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4601);
    float _4611 = _4607 * 0.5;
    float _4613 = exp2(_4583);
    float _4615 = _4605 * _4603;
    float _4617 = _4615 * 0.5;
    float _4619 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4621 = fma(_4617, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4619);
    float _4623 = 1.0 / _4621;
    float _4625 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4627 = _4623 * _4625;
    float _4629 = abs(_4627);
    float _4631 = log2(_4629);
    bool _4633 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4635 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4637 = _4633 || _4635;
    bool _4639 = isnan(0.5);
    bool _4641 = _4637 || _4639;
    float _4643 = _4631 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4645 = exp2(_4643);
    float _4647 = fma(_4645, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4649 = precise::clamp(_4647, 0.0, 1.0);
    bool _4651 = _4627 <= 8000.0;
    bool _4653 = isnan(_4627);
    bool _4655 = _4651 || _4653;
    bool _4657 = isnan(8000.0);
    bool _4659 = _4655 || _4657;
    float _4661 = float(_4659);
    float _4663 = fma(_4649, -2.0, 3.0);
    float _4665 = _4649 * _4649;
    float _4667 = _4665 * _4663;
    float _4669 = _4609 + _4472;
    float _4671 = -_4667;
    float _4673 = _4671 + 1.0;
    float _4675 = _4669 * 0.5;
    float _4677 = fma(_4673, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4667);
    float _4679 = _4661 * _4677;
    float _4681 = _4472 * 0.5;
    float _4683 = _4661;
    float _4685 = _4518;
    float _4687 = _4532;
    if (_4641)
    {
        _4683 = 1.0;
    }
    float _4689 = _4683;
    float _4691 = fma(_4518, -0.5, _4681);
    float _4693 = _4689;
    float _4695 = _4557;
    float _4697 = _4555;
    if (!_4641)
    {
        float _4699 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4701 = _4699 * 0.15915493667125701904296875;
        float _4703 = _4701 * 6.283185482025146484375;
        float _4705 = cos(_4703);
        float _4707 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4709 = _4707 * 0.15915493667125701904296875;
        float _4711 = _4701 * 6.283185482025146484375;
        float _4713 = sin(_4711);
        float _4715 = 1.0 / _4705;
        float _4717 = _4709 * 6.283185482025146484375;
        float _4719 = cos(_4717);
        float _4721 = _4713 * _4715;
        float _4723 = _4709 * 6.283185482025146484375;
        float _4725 = sin(_4723);
        float _4727 = _4719 * _4721;
        float _4729 = 1.0 / _4727;
        float _4731 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4733 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4731;
        float _4735 = 1.0 / _4733;
        float _4737 = _4725 * _4729;
        float _4739 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4741 = fma(_4627, _4737, _4739);
        float _4743 = _4741 * _4735;
        float _4745 = precise::clamp(_4743, 0.0, 1.0);
        _4693 = _4745;
    }
    float _4747 = _4693;
    float _4749 = _4679 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4751 = -_4613;
    float _4753 = _4751 + 1.0;
    float _4755 = -_4548;
    float _4757 = _4755 + 1.0;
    out.m_90.x = _4611;
    out.m_90.y = _4691;
    out.m_90.z = _4675;
    out.m_90.w = _4472;
    float _4759 = _4753 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4761 = _4757 * _4749;
    float _4763 = precise::clamp(_4761, 0.0, 1.0);
    bool _4765 = _4246 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4767 = isnan(_4246);
    bool _4769 = _4765 || _4767;
    bool _4771 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4773 = _4769 || _4771;
    out.m_92.x = _4214;
    out.m_92.y = _4210;
    out.m_92.z = _4218;
    float _4775 = _4759 * _4550;
    float _4777 = -_4763;
    float _4779 = fma(_4777, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4781 = -_4759;
    float _4783 = _4781 + 1.0;
    float _4785 = _4561 * _4775;
    float _4787 = _4779 * _4589;
    float _4789 = _4575 * _4775;
    out.gl_Position.x = _4532;
    out.gl_Position.y = _4518;
    out.gl_Position.z = _4609;
    out.gl_Position.w = _4472;
    float _4791 = fma(_4571, _4785, _4555);
    float _4793 = fma(_4573, _4785, _4557);
    float _4795 = _4787 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4797 = _4561 * _4783;
    float _4799 = fma(_4561, _4789, _4559);
    float _4801 = _4747 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4803 = _4785;
    float _4805 = _4783;
    if (!_4773)
    {
        _4695 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4807 = _4695;
    out.m_94.x = _4795;
    float _4809 = _4807;
    float _4811 = _4807;
    if (!_4773)
    {
        _4697 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4813 = _4697;
    float _4815 = _4813;
    float _4817 = _4813;
    if (!_4773)
    {
        _4803 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4819 = _4803;
    out.m_96.x = _4791;
    out.m_96.y = _4793;
    out.m_96.z = _4799;
    out.m_96.w = _4797;
    float _4821 = _4819;
    float _4823 = _4819;
    if (!_4773)
    {
        _4685 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4825 = _4685;
    float _4827 = _4825;
    float _4829 = _4825;
    if (!_4773)
    {
        _4687 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4831 = _4687;
    float _4833 = _4831;
    float _4835 = _4831;
    if (!_4773)
    {
        _4805 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4837 = _4805;
    bool _4839 = !_4773;
    float _4841 = _4837;
    float _4843 = _4837;
    if (!_4839)
    {
        bool _4845 = _4246 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4847 = isnan(_4246);
        bool _4849 = _4845 || _4847;
        bool _4851 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4853 = _4849 || _4851;
        if (!_4853)
        {
            float _4855 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4857 = _4246 + _4855;
            float _4859 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4861 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4859;
            float _4863 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4865 = _4863 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4867 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4869 = _4867 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4871 = 1.0 / _4861;
            float _4873 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4875 = _4873 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4877 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4879 = _4877 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4881 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4883 = _4881 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4885 = _4857 * _4871;
            float _4887 = precise::clamp(_4885, 0.0, 1.0);
            float _4889 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4891 = _4889 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4893 = fma(_4887, _4865, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4895 = fma(_4887, _4869, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4897 = fma(_4887, _4891, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4899 = fma(_4887, _4875, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4901 = fma(_4887, _4879, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4903 = fma(_4887, _4883, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4823 = _4893;
            _4835 = _4901;
            _4817 = _4895;
            _4829 = _4899;
            _4843 = _4897;
            _4811 = _4903;
            _4905 = true;
        }
        else
        {
            bool _4907 = _4246 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4909 = isnan(_4246);
            bool _4911 = _4907 || _4909;
            bool _4913 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4915 = _4911 || _4913;
            if (!_4915)
            {
                _4827 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4917 = _4827;
            _4829 = _4917;
            if (!_4915)
            {
                _4833 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4919 = _4833;
            _4835 = _4919;
            if (!_4915)
            {
                _4809 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4921 = _4809;
            _4811 = _4921;
            if (!_4915)
            {
                _4815 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4923 = _4815;
            _4817 = _4923;
            if (!_4915)
            {
                _4821 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4925 = _4821;
            _4823 = _4925;
            if (!_4915)
            {
                _4841 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4927 = _4841;
            bool _4929 = !_4915;
            _4843 = _4927;
            if (!_4929)
            {
                bool _4931 = _4246 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4933 = isnan(_4246);
                bool _4935 = _4931 || _4933;
                bool _4937 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4939 = _4935 || _4937;
                if (!_4939)
                {
                    float _4941 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4943 = _4246 + _4941;
                    float _4945 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4947 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4945;
                    float _4949 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4951 = _4949 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4953 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4955 = _4953 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4957 = 1.0 / _4947;
                    float _4959 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4961 = _4959 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4963 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4965 = _4963 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4967 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4969 = _4967 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4971 = _4943 * _4957;
                    float _4973 = precise::clamp(_4971, 0.0, 1.0);
                    float _4975 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4977 = _4975 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4979 = fma(_4973, _4951, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4981 = fma(_4973, _4955, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4983 = fma(_4973, _4977, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4985 = fma(_4973, _4961, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4987 = fma(_4973, _4965, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4989 = fma(_4973, _4969, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4823 = _4979;
                    _4835 = _4987;
                    _4817 = _4981;
                    _4829 = _4985;
                    _4843 = _4983;
                    _4811 = _4989;
                    _4905 = true;
                }
                else
                {
                    _4823 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4835 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4817 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4829 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4843 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4811 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4905 = false;
    float _4991 = _4823;
    float _4993 = _4835;
    float _4995 = _4817;
    float _4997 = _4829;
    float _4999 = _4843;
    float _5001 = _4811;
    float _5003 = fma(_4002, -0.5, 0.5);
    float _5005 = precise::clamp(_5003, 0.0, 1.0);
    float _5007 = -_4991;
    float _5009 = _4993 + _5007;
    float _5011 = _4801 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5013 = -_4995;
    float _5015 = _4997 + _5013;
    float _5017 = fma(_5005, _5009, _4991);
    out.m_98.x = 0.0;
    float _5019 = -_4999;
    float _5021 = _5001 + _5019;
    float _5023 = fma(_5005, _5015, _4995);
    float _5025 = _5017 * 0.586610972881317138671875;
    out.m_55.x = _5011;
    bool _5027 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5029 = fma(_5005, _5021, _4999);
    float _5031 = fma(_5023, 0.298911988735198974609375, _5025);
    bool _5033 = _4747 > 0.0;
    bool _5035 = isnan(_4747);
    bool _5037 = _5033 || _5035;
    bool _5039 = isnan(0.0);
    bool _5041 = _5037 || _5039;
    float _5043 = fma(_5029, 0.114477999508380889892578125, _5031);
    float _5045 = -_5043;
    float _5047 = _5023 + _5045;
    float _5049 = -_5043;
    float _5051 = _5017 + _5049;
    float _5053 = -_5043;
    float _5055 = _5029 + _5053;
    float _5057 = fma(_5047, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5043);
    float _5059 = fma(_5051, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5043);
    float _5061 = fma(_5055, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5043);
    bool _5063 = !_5027;
    if (!_5063)
    {
        float _5065 = -_4210;
        float _5067 = _5065 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5069 = -_4214;
        float _5071 = _5069 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5073 = -_4218;
        float _5075 = _5073 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5077 = _5067 * _5067;
        float _5079 = fma(_5071, _5071, _5077);
        float _5081 = fma(_5075, _5075, _5079);
        float _5083 = sqrt(_5081);
        float _5085 = rsqrt(_5081);
        float _5087 = -_5083;
        float _5089 = _5087 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5091 = _5089 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5093 = precise::clamp(_5091, 0.0, 1.0);
        float _5095 = _5071 * _5085;
        float _5097 = _5067 * _5085;
        float _5099 = abs(_5093);
        float _5101 = log2(_5099);
        float _5103 = _5075 * _5085;
        float _5105 = _5095 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5107 = _4002 * _5097;
        float _5109 = -_5097;
        float _5111 = -_5105;
        float _5113 = fma(_5109, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5111);
        float _5115 = fma(_4000, _5095, _5107);
        float _5117 = -_5103;
        float _5119 = fma(_5117, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5113);
        float _5121 = fma(_4004, _5103, _5115);
        float _5123 = precise::clamp(_5121, 0.0, 1.0);
        float _5125 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5127 = _5119 + _5125;
        float _5129 = _5101 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5131 = _5127 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5133 = precise::clamp(_5131, 0.0, 1.0);
        float _5135 = exp2(_5129);
        float _5137 = _5135 * _5133;
        float _5139 = _5123 * _5137;
        float _5141 = _5139 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5143 = _5139 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5145 = _5139 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_98.x = _5141;
        out.m_98.y = _5143;
        out.m_98.z = _5145;
    }
    out.m_100.x = _5057;
    out.m_100.y = _5059;
    out.m_100.z = _5061;
    if (_5041)
    {
        return out;
    }
    out.m_55.x = 0.0;
    float _5147 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5147;
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
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4905 = false;
    bool _4052 = false;
    bool _575 = false;
    bool _431 = false;
    bool _243 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_48.w;
    float _116 = in.m_50.w;
    float _118 = trunc(_114);
    int _121 = int(_118);
    float _123 = -_116;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _125;
    bool _129 = _121 >= 1;
    float _131 = 0.0;
    float _133 = as_type<float>(_121);
    float _135 = _125;
    if (!_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _131;
    if (!_129)
    {
        out.m_55.x = 0.0;
    }
    int _139 = 0;
    if (!_129)
    {
        float _141 = _137 * 5.0;
        _139 = as_type<int>(_141);
    }
    int _143 = _139;
    int _145 = _143;
    if (!_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5216 = as_type<float>(_143);
        out.gl_Position.z = _5216;
    }
    if (!_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _147 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _149 = isnan(_116);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _155 = _151 || _153;
    float _157 = float(_121);
    bool _159 = _125 >= _157;
    bool _161 = !_155;
    bool _163 = _159 || _161;
    float _165 = 1.0 / _157;
    if (_163)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _133;
    if (_163)
    {
        out.m_55.x = 0.0;
    }
    float _169 = _125 * _165;
    float _171 = _169;
    if (_163)
    {
        float _173 = _167 * 5.0;
        _145 = as_type<int>(_173);
    }
    int _175 = _145;
    out.m_53.x = _169;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5279 = as_type<float>(_175);
        out.gl_Position.z = _5279;
    }
    if (_163)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _177 = as_type<float>(int(gl_VertexIndex));
    float _179 = in.m_60.x;
    float _181 = in.m_60.y;
    float _183 = in.m_60.z;
    int _185 = as_type<int>(_177) & 1;
    bool _187 = _185 != 0;
    int _189 = as_type<int>(_177) & 2;
    bool _191 = _189 != 0;
    bool _193 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _195 = _181 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _197 = _181 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _199 = _181 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _201 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[4].x, _195);
    float _203 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[5].x, _197);
    float _205 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[6].x, _199);
    float _207 = fma(_183, (*spvDescriptorSet0.vp_c10)._m0[4].z, _201);
    float _209 = fma(_183, (*spvDescriptorSet0.vp_c10)._m0[5].z, _203);
    float _211 = fma(_183, (*spvDescriptorSet0.vp_c10)._m0[6].z, _205);
    bool _213 = !_187;
    float _215 = _213 ? (-0.5) : 0.5;
    bool _217 = !_191;
    float _219 = _217 ? (-0.5) : 0.5;
    bool _221 = !_193;
    float _223 = _211;
    float _241;
    if (!_221)
    {
        float _225 = in.m_62.x;
        float _227 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _229 = _225 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _231 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _233 = _231 * _227;
        float _235 = floor(_233);
        float _237 = -_235;
        float _239 = _233 + _237;
        _241 = _239;
        _243 = true;
    }
    else
    {
        _241 = _169;
    }
    _243 = false;
    float _245 = _241;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _249 = _245 + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _253 = _245 + _251;
    bool _255 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _257 = isnan(_245);
    bool _259 = _255 || _257;
    bool _261 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _263 = _259 || _261;
    float _265 = float(_263);
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _267;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _273 = _271 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _277 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _275;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _281 = _245 + _279;
    float _283 = 1.0 / _269;
    bool _285 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _287 = 1.0 / _277;
    float _289 = 1.0 / _273;
    float _291 = _249 * _283;
    bool _293 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _295 = isnan(_245);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = -_265;
    float _307 = _305 + 1.0;
    float _309 = _303 * _307;
    float _311 = _253 * _287;
    bool _313 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _315 = isnan(_245);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = -_303;
    float _327 = _325 + 1.0;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _333 = _281 * _289;
    bool _335 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _337 = isnan(_245);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _347;
    float _351 = _323 * _327;
    float _353 = -_323;
    float _355 = _353 + 1.0;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _363 = _361 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _365 = fma(_349, _291, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _367 = _345 * _355;
    float _369 = fma(_359, _291, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _371 = fma(_331, _333, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _373 = fma(_363, _333, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _375 = -_345;
    float _377 = _375 + 1.0;
    float _379 = _365 * _367;
    float _381 = _369 * _367;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _383;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _387;
    float _391 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[143].x, _379);
    float _393 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[143].y, _381);
    float _395 = fma(_385, _311, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _397 = fma(_389, _311, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _399 = fma(_371, _351, _391);
    float _401 = fma(_373, _351, _393);
    float _403 = fma(_395, _309, _399);
    float _405 = fma(_397, _309, _401);
    float _407 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[146].x, _403);
    float _409 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[146].y, _405);
    bool _411 = !_285;
    float _429;
    if (!_411)
    {
        float _413 = in.m_62.x;
        float _415 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _417 = _413 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _419 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _421 = _419 * _415;
        float _423 = floor(_421);
        float _425 = -_423;
        float _427 = _421 + _425;
        _429 = _427;
        _431 = true;
    }
    else
    {
        _429 = _169;
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
    float _535 = in.m_64.x;
    float _537 = in.m_64.y;
    float _539 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[117].x, _531);
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _543 = _529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _545 = _533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _547 = _539 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _549 = _541 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_66.x = _543;
    out.m_66.y = _545;
    out.m_66.z = _549;
    out.m_66.w = _547;
    float _551 = _409 * _537;
    float _553 = _407 * _535;
    bool _555 = !_493;
    float _573;
    if (!_555)
    {
        float _557 = in.m_62.x;
        float _559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _561 = _557 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _563 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[11].w, _125);
        float _565 = _563 * _559;
        float _567 = floor(_565);
        float _569 = -_567;
        float _571 = _565 + _569;
        _573 = _571;
        _575 = true;
    }
    else
    {
        _573 = _169;
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
    float _639 = 1.0 / _601;
    float _641 = _617 * _631;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _645 = _643 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _647 = fma(_641, _581, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _649 = _613 * _635;
    float _651 = -_629;
    float _653 = _651 + 1.0;
    float _655 = -_613;
    float _657 = _655 + 1.0;
    float _659 = _645 * _639;
    float _661 = _647 * _649;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _665 = _577 + _663;
    float _667 = _597 * _653;
    float _669 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[131].x, _661);
    float _671 = fma(_659, _665, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _673 = fma(_671, _667, _669);
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _681 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[133].x, _673);
    float _683 = _675 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _685 = _677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _687 = _679 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _689 = _681 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_68.x = _683;
    out.m_68.y = _685;
    out.m_68.z = _687;
    out.m_68.w = _689;
    bool _691 = !_637;
    float _693 = _667;
    float _695 = _689;
    if (!_691)
    {
        float _697 = in.m_62.x;
        float _699 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _701 = _697 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _703 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[14].x, _125);
        float _705 = _703 * _699;
        float _707 = floor(_705);
        float _709 = -_707;
        float _711 = _705 + _709;
        _171 = _711;
    }
    float _713 = _171;
    float _715 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _717 = int(_715);
    int _719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _721 = _719 != 0;
    float _723 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _725 = int(_723);
    float _727 = float(_717);
    float _729 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _731 = int(_729);
    float _733 = 0.0;
    if (_721)
    {
        _733 = 1.0;
    }
    float _735 = _733;
    float _737 = _735;
    if (_721)
    {
        _693 = 1.0;
    }
    float _739 = _693;
    float _741 = float(_725);
    float _743 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _745 = int(_743);
    float _747 = 1.0 / _741;
    float _749 = float(uint(_731));
    int _751 = ~_731;
    int _753 = _751 + 1;
    float _755 = 1.0 / _727;
    float _757 = float(uint(_745));
    float _759 = _747 * _125;
    float _761 = 1.0 / _749;
    float _763 = _755 * _125;
    float _765 = 1.0 / _757;
    float _767 = _741;
    float _769 = _755;
    float _771 = _739;
    if (_721)
    {
        float _773 = in.m_62.x;
        float _775 = in.m_62.y;
        _767 = _773;
        _769 = _775;
    }
    float _777 = _767;
    float _779 = _769;
    float _781 = trunc(_759);
    int _783 = int(_781);
    int _785 = as_type<int>(_761) + (-2);
    float _787 = trunc(_763);
    int _789 = int(_787);
    int _791 = as_type<int>(_765) + (-2);
    float _793 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _795 = int(_793);
    float _797 = float(uint(_783));
    int _799 = as_type<int>(_797);
    float _801 = _777;
    float _803 = _779;
    if (_721)
    {
        _695 = _779;
    }
    float _805 = _695;
    float _807 = as_type<float>(_785) * _797;
    float _809 = _805;
    if (_721)
    {
        _799 = 0;
    }
    int _811 = _799;
    float _813 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _815 = int(_813);
    float _817 = float(uint(_789));
    float _819 = as_type<float>(_791) * _817;
    float _821 = _817;
    int _823 = _811;
    if (_721)
    {
        _821 = _777;
    }
    float _825 = _821;
    float _827 = trunc(_807);
    float _829 = precise::max(_827, 0.0);
    uint _832 = uint(_829);
    float _834 = float(uint(_795));
    float _836 = 0.0;
    int _838 = as_type<int>(_834);
    float _840 = _825;
    if (_721)
    {
        _836 = _825;
    }
    float _842 = _836;
    float _844 = trunc(_819);
    float _846 = precise::max(_844, 0.0);
    uint _848 = uint(_846);
    float _850 = float(_815);
    float _852 = 1.0 / _850;
    float _854 = 1.0 / _834;
    float _856 = _850;
    float _858 = _842;
    if (_721)
    {
        _856 = _825;
    }
    float _860 = _856;
    float _862 = _860;
    if (_721)
    {
        _838 = 0;
    }
    int _864 = _838;
    int _866 = _864;
    if (!_721)
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
        _801 = _868;
        _840 = _870;
        _771 = 5.839270114898681640625;
        _862 = _872;
        _803 = _870;
        _858 = _884;
        _823 = 1;
        _866 = 2;
        _809 = _888;
    }
    float _890 = _737;
    float _892 = _801;
    float _894 = _840;
    float _896 = _771;
    float _898 = _862;
    float _900 = _803;
    float _902 = _858;
    int _904 = _823;
    int _906 = _866;
    float _908 = _809;
    float _910 = in.m_62.z;
    float _912 = in.m_62.w;
    int _914 = ~_745;
    int _916 = _914 + 1;
    int _918 = _753 * int(_832);
    int _920 = _918 + _783;
    float _922 = _852 * _125;
    float _924 = _890 * _892;
    float _926 = _890 * _894;
    int _928 = _916 * int(_848);
    int _930 = _928 + _789;
    float _932 = float(uint(_920));
    float _934 = floor(_924);
    float _936 = _896 * _898;
    float _938 = _165 * _125;
    float _940 = float(uint(_930));
    float _942 = as_type<float>(_785) * _932;
    float _944 = float(_731);
    float _946 = _892 * 2.0;
    float _948 = trunc(_922);
    int _950 = int(_948);
    float _952 = float(_783);
    float _954 = _892 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _958 = _956 != 0;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _962 = _713 + _960;
    bool _964 = _900 > 0.5;
    int _966 = ~_731;
    int _968 = _966 + 1;
    float _970 = trunc(_942);
    float _972 = precise::max(_970, 0.0);
    uint _974 = uint(_972);
    bool _976 = _912 > 0.5;
    float _978 = as_type<float>(_791) * _940;
    float _980 = -_934;
    float _982 = _924 + _980;
    int _984 = as_type<int>(_854) + (-2);
    bool _986 = _910 > 0.5;
    float _988 = floor(_936);
    float _990 = float(uint(_950));
    bool _992 = _952 >= _944;
    bool _994 = isnan(_952);
    bool _996 = _992 || _994;
    bool _998 = isnan(_944);
    bool _1000 = _996 || _998;
    float _1002 = float(_1000);
    int _1004 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1006 = _1004 != 0;
    int _1008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1010 = _1008 != 0;
    int _1012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1014 = _1012 != 0;
    float _1016 = as_type<float>(_984) * _990;
    float _1018 = -_215;
    int _1020 = _964 ? as_type<int>(_1018) : as_type<int>(_215);
    float _1022 = trunc(_978);
    float _1024 = precise::max(_1022, 0.0);
    uint _1026 = uint(_1024);
    int _1028 = int(_832) + int(_974);
    int _1030 = ~_745;
    int _1032 = _1030 + 1;
    int _1034 = _968 * _1028;
    int _1036 = _1034 + _783;
    int _1038 = int(_976);
    int _1040 = _986 ? 2 : 0;
    int _1042 = _1038 | _1040;
    int _1044 = _958 ? 4 : 0;
    int _1046 = _1042 | _1044;
    int _1048 = _1006 ? 8 : 0;
    int _1050 = _1046 | _1048;
    int _1052 = _1010 ? 16 : 0;
    int _1054 = _1050 | _1052;
    int _1056 = _1014 ? 32 : 0;
    int _1058 = _1054 | _1056;
    int _1060 = _964 ? 64 : 0;
    int _1062 = _1058 | _1060;
    int _1064 = _1062 & 64;
    float _1066 = trunc(_1016);
    float _1068 = precise::max(_1066, 0.0);
    uint _1070 = uint(_1068);
    float _1072 = -_988;
    float _1074 = _936 + _1072;
    float _1076 = -_219;
    int _1078 = _986 ? as_type<int>(_1076) : as_type<int>(_219);
    bool _1080 = !_958;
    int _1082 = _1080 ? 0 : 1;
    bool _1084 = !_1014;
    float _1086 = _1084 ? _219 : as_type<float>(_1078);
    float _1088 = _982 * _944;
    int _1090 = int(_848) + int(_1026);
    float _1092 = floor(_926);
    float _1094 = _944 * _938;
    float _1096 = float(_745);
    float _1098 = float(_789);
    int _1100 = _1032 * _1090;
    int _1102 = _1100 + _789;
    int _1104 = abs(_1082);
    float _1106 = trunc(_1002);
    int _1108 = int(_1106);
    float _1110 = _1074 * _1096;
    int _1112 = _731 + (-1);
    float _1114 = trunc(_1088);
    int _1116 = int(_1114);
    bool _1118 = !_1010;
    float _1120 = _1118 ? _215 : as_type<float>(_1020);
    int _1122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1124 = _1122 != 0;
    int _1126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1128 = _1126 != 0;
    int _1130 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1132 = _1130 != 0;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    bool _1136 = uint(_1036) >= uint(_731);
    int _1138 = ~_795;
    int _1140 = _1138 + 1;
    float _1142 = trunc(_1094);
    int _1144 = int(_1142);
    bool _1146 = !_1128;
    int _1148 = _1146 ? 0 : 1;
    float _1150 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1134);
    bool _1152 = !_1124;
    int _1154 = _1152 ? 0 : 1;
    int _1156 = _1140 * int(_1070);
    int _1158 = _1156 + _950;
    int _1160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1162 = _1160 != 0;
    float _1164 = _902 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _1166 = uint(_1102) >= uint(_745);
    float _1168 = trunc(_1110);
    int _1170 = int(_1168);
    bool _1172 = _1098 >= _1096;
    bool _1174 = isnan(_1098);
    bool _1176 = _1172 || _1174;
    bool _1178 = isnan(_1096);
    bool _1180 = _1176 || _1178;
    float _1182 = float(_1180);
    float _1184 = _1096 * _938;
    bool _1186 = !_1132;
    int _1188 = _1186 ? 0 : 1;
    float _1190 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1150);
    bool _1192 = !_1162;
    int _1194 = _1192 ? 0 : 1;
    bool _1196 = !_1166;
    int _1198 = _1196 ? 0 : (-1);
    float _1200 = trunc(_1182);
    int _1202 = int(_1200);
    int _1204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1206 = _1204 != 0;
    int _1208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1210 = _1208 != 0;
    int _1212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1214 = _1212 != 0;
    float _1216 = -_1190;
    float _1218 = _1216 + 1.0;
    bool _1220 = !_1136;
    int _1222 = _1220 ? 0 : (-1);
    int _1224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1226 = _1224 != 0;
    int _1228 = ~_1028;
    int _1230 = _1228 + _1222;
    int _1232 = _1230 + 1;
    float _1234 = trunc(_1184);
    int _1236 = int(_1234);
    float _1238 = -_1092;
    float _1240 = _926 + _1238;
    float _1242 = float(uint(_1158));
    bool _1244 = !_1210;
    int _1246 = _1244 ? 0 : 1;
    bool _1248 = _1064 != 0;
    float _1250 = as_type<float>(_984) * _1242;
    float _1252 = floor(_946);
    int _1254 = ~_1090;
    int _1256 = _1254 + _1198;
    int _1258 = _1256 + 1;
    bool _1260 = !_1226;
    int _1262 = _1260 ? 0 : 1;
    int _1264 = _1116 * _1104;
    int _1266 = _1264 + _783;
    bool _1268 = _731 == 0;
    int _1270 = _731 * _1232;
    int _1272 = _1270 + _783;
    bool _1274 = !_1206;
    int _1276 = _1274 ? 0 : 1;
    int _1278 = _745 * _1258;
    int _1280 = _1278 + _789;
    bool _1282 = _745 == 0;
    float _1284 = trunc(_1250);
    float _1286 = precise::max(_1284, 0.0);
    uint _1288 = uint(_1286);
    int _1290 = ~_1108;
    int _1292 = _1290 + 1;
    int _1294 = _1292 + 1;
    bool _1296 = !_1268;
    int _1298 = _1296 ? _1272 : (-1);
    int _1300 = ~_1202;
    int _1302 = _1300 + 1;
    int _1304 = _1302 + 1;
    bool _1306 = !_1282;
    int _1308 = _1306 ? _1280 : (-1);
    int _1310 = _1298 * _1294;
    int _1312 = abs(_1148);
    int _1314 = _745 + (-1);
    int _1316 = _1308 * _1304;
    int _1318 = abs(_1246);
    int _1320 = _1108 * _1112;
    int _1322 = _1320 + _1310;
    int _1324 = abs(_1154);
    int _1326 = _1202 * _1314;
    int _1328 = _1326 + _1316;
    int _1330 = _1322 * _1312;
    int _1332 = abs(_1188);
    int _1334 = abs(_1262);
    int _1336 = _1328 * _1318;
    int _1338 = abs(_1194);
    int _1340 = _1170 * _1334;
    int _1342 = _1340 + _789;
    int _1344 = _1144 * _1324;
    int _1346 = _1344 + _1330;
    int _1348 = int(_1070) + int(_1288);
    int _1350 = ~_795;
    int _1352 = _1350 + 1;
    int _1354 = _1266 * _1332;
    int _1356 = _1354 + _1346;
    int _1358 = abs(_1276);
    int _1360 = _1352 * _1348;
    int _1362 = _1360 + _950;
    float _1364 = -_219;
    int _1366 = _976 ? as_type<int>(_1364) : as_type<int>(_219);
    int _1368 = _1116 * _1338;
    int _1370 = _1368 + _1356;
    bool _1372 = uint(_1362) >= uint(_795);
    float _1374 = float(uint(_1370));
    int _1376 = _1236 * _1358;
    int _1378 = _1376 + _1336;
    float _1380 = float(_795);
    float _1382 = -_215;
    int _1384 = _986 ? as_type<int>(_1382) : as_type<int>(_215);
    float _1386 = as_type<float>(_785) * _1374;
    float _1388 = float(_950);
    float _1390 = _1240 * _1380;
    int _1392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1394 = _1392 != 0;
    float _1396 = trunc(_1386);
    float _1398 = precise::max(_1396, 0.0);
    uint _1400 = uint(_1398);
    bool _1402 = _1388 >= _1380;
    bool _1404 = isnan(_1388);
    bool _1406 = _1402 || _1404;
    bool _1408 = isnan(_1380);
    bool _1410 = _1406 || _1408;
    float _1412 = float(_1410);
    float _1414 = _1380 * _938;
    bool _1416 = !_1214;
    int _1418 = _1416 ? 0 : 1;
    int _1420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1422 = _1420 != 0;
    bool _1424 = !_1394;
    int _1426 = _1424 ? 0 : 1;
    float _1428 = trunc(_1412);
    int _1430 = int(_1428);
    bool _1432 = !_1422;
    int _1434 = _1432 ? 0 : 1;
    int _1436 = abs(_1418);
    int _1438 = abs(_1426);
    bool _1440 = !_1006;
    float _1442 = _1440 ? _219 : as_type<float>(_1366);
    int _1444 = _1342 * _1436;
    int _1446 = _1444 + _1378;
    bool _1448 = !_1372;
    int _1450 = _1448 ? 0 : (-1);
    float _1452 = trunc(_1414);
    int _1454 = int(_1452);
    int _1456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1458 = _1456 != 0;
    int _1460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1462 = _1460 != 0;
    int _1464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1466 = _1464 != 0;
    int _1468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1470 = _1468 != 0;
    int _1472 = ~_1348;
    int _1474 = _1472 + _1450;
    int _1476 = _1474 + 1;
    bool _1478 = !_1462;
    int _1480 = _1478 ? 0 : 1;
    int _1482 = _1170 * _1438;
    int _1484 = _1482 + _1446;
    int _1486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1488 = _1486 != 0;
    int _1490 = _795 * _1476;
    int _1492 = _1490 + _950;
    int _1494 = ~_731;
    int _1496 = _1494 + 1;
    float _1498 = trunc(_1390);
    int _1500 = int(_1498);
    bool _1502 = !_1458;
    int _1504 = _1502 ? 0 : 1;
    bool _1506 = _795 == 0;
    int _1508 = _1496 * int(_1400);
    int _1510 = _1508 + _1370;
    float _1512 = float(uint(_1484));
    int _1514 = ~_1430;
    int _1516 = _1514 + 1;
    int _1518 = _1516 + 1;
    bool _1520 = !_1506;
    int _1522 = _1520 ? _1492 : (-1);
    float _1524 = as_type<float>(_791) * _1512;
    float _1526 = float(uint(_1510));
    float _1528 = _1512;
    float _1530 = as_type<float>(_1370);
    float _1532 = as_type<float>(_1070);
    if (_1488)
    {
        float _1534 = in.m_62.w;
        _1528 = _1534;
    }
    float _1536 = _1528;
    int _1538 = abs(_1480);
    int _1540 = _1522 * _1518;
    int _1542 = _795 + (-1);
    float _1544 = as_type<float>(_785) * _1526;
    float _1546 = trunc(_1524);
    float _1548 = precise::max(_1546, 0.0);
    uint _1550 = uint(_1548);
    int _1552 = abs(_1434);
    int _1554 = abs(_1504);
    int _1556 = _1430 * _1542;
    int _1558 = _1556 + _1540;
    float _1560 = trunc(_1544);
    float _1562 = precise::max(_1560, 0.0);
    uint _1564 = uint(_1562);
    int _1566 = _1558 * _1538;
    int _1568 = ~_745;
    int _1570 = _1568 + 1;
    int _1572 = _1500 * _1552;
    int _1574 = _1572 + _950;
    bool _1576 = _731 == 0;
    int _1578 = _1454 * _1554;
    int _1580 = _1578 + _1566;
    bool _1582 = !_1466;
    int _1584 = _1582 ? 0 : 1;
    int _1586 = ~_731;
    int _1588 = _1586 + 1;
    int _1590 = _1570 * int(_1550);
    int _1592 = _1590 + _1484;
    float _1594 = as_type<float>(_1552);
    if (_1488)
    {
        float _1596 = _1536 * 3.1415927410125732421875;
        _1594 = _1596;
    }
    float _1598 = _1594;
    int _1600 = abs(_1584);
    bool _1602 = !_1470;
    int _1604 = _1602 ? 0 : 1;
    float _1606 = _1598;
    if (_1488)
    {
        float _1608 = _1598 * 0.15915493667125701904296875;
        _1606 = _1608;
    }
    float _1610 = _1606;
    int _1612 = int(_1400) + int(_1564);
    float _1614 = float(uint(_1592));
    int _1616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1618 = _1616 != 0;
    int _1620 = _1588 * _1612;
    int _1622 = _1620 + _1370;
    int _1624 = abs(_1604);
    float _1626 = as_type<float>(_791) * _1614;
    float _1628 = _1610;
    if (_1488)
    {
        float _1630 = _1610 * 6.283185482025146484375;
        float _1632 = sin(_1630);
        _1628 = _1632;
    }
    float _1634 = _1628;
    float _1636 = 0.0;
    if (!_1488)
    {
        _1636 = _215;
    }
    float _1638 = _1636;
    bool _1640 = uint(_1622) >= uint(_731);
    int _1642 = _1574 * _1600;
    int _1644 = _1642 + _1580;
    float _1646 = float(uint(_1266));
    float _1648 = trunc(_1626);
    float _1650 = precise::max(_1648, 0.0);
    uint _1652 = uint(_1650);
    bool _1654 = !_1640;
    int _1656 = _1654 ? 0 : (-1);
    float _1658 = as_type<float>(_1564);
    float _1660 = _1638;
    if (_1618)
    {
        float _1662 = in.m_62.x;
        _1658 = _1662;
    }
    float _1664 = _1658;
    int _1666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1668 = _1666 != 0;
    float _1670 = as_type<float>(_785) * _1646;
    int _1672 = ~_1612;
    int _1674 = _1672 + _1656;
    int _1676 = _1674 + 1;
    int _1678 = _1500 * _1624;
    int _1680 = _1678 + _1644;
    bool _1682 = !_1668;
    float _1684 = _1682 ? _215 : as_type<float>(_1384);
    bool _1686 = _1668;
    if (_1488)
    {
        bool _1688 = _1634 > 0.5;
        _1686 = _1688;
    }
    bool _1690 = _1686;
    float _1692 = trunc(_1670);
    float _1694 = precise::max(_1692, 0.0);
    uint _1696 = uint(_1694);
    int _1698 = _731 * _1676;
    int _1700 = _1698 + _1370;
    float _1702 = float(uint(_1680));
    if (_1488)
    {
        float _1704 = -_215;
        float _1706 = _1690 ? _1704 : _215;
        _1660 = _1706;
    }
    float _1708 = _1660;
    bool _1710 = !_1576;
    int _1712 = _1710 ? _1700 : (-1);
    int _1714 = int(_1550) + int(_1652);
    float _1716 = as_type<float>(_984) * _1702;
    int _1718 = _1712 & 3;
    bool _1720 = _1718 != 0;
    int _1722 = _1712 & 3;
    bool _1724 = _1722 != 0;
    float _1726 = trunc(_1716);
    float _1728 = precise::max(_1726, 0.0);
    uint _1730 = uint(_1728);
    int _1732 = ~_731;
    int _1734 = _1732 + 1;
    int _1736 = _1720 ? 0 : 1;
    float _1738 = _1708;
    if (_1618)
    {
        float _1740 = _1664 * 3.1415927410125732421875;
        _1530 = _1740;
    }
    float _1742 = _1530;
    bool _1744 = uint(_1722) > 1u;
    int _1746 = _1734 * int(_1696);
    int _1748 = _1746 + _1266;
    float _1750 = float(uint(_1342));
    float _1752 = _1742;
    if (_1618)
    {
        float _1754 = _1742 * 0.15915493667125701904296875;
        _1752 = _1754;
    }
    float _1756 = _1752;
    int _1758 = ~_745;
    int _1760 = _1758 + 1;
    float _1762 = float(uint(_1748));
    float _1764 = as_type<float>(_791) * _1750;
    int _1766 = ~_795;
    int _1768 = _1766 + 1;
    int _1770 = _1760 * _1714;
    int _1772 = _1770 + _1484;
    int _1774 = ~_1736;
    int _1776 = _1774 + 1;
    int _1778 = _1776 + 1;
    float _1780 = as_type<float>(_785) * _1762;
    float _1782 = trunc(_1764);
    float _1784 = precise::max(_1782, 0.0);
    uint _1786 = uint(_1784);
    int _1788 = _1768 * int(_1730);
    int _1790 = _1788 + _1680;
    int _1792 = _1778;
    if (!_1744)
    {
        int _1794 = ~_1736;
        int _1796 = _1794 + 1;
        _1792 = _1796;
    }
    int _1798 = _1792;
    float _1800 = -_219;
    int _1802 = _1248 ? as_type<int>(_1800) : as_type<int>(_219);
    bool _1804 = uint(_1722) >= 2u;
    bool _1806 = uint(_1772) >= uint(_745);
    float _1808 = _1756;
    if (_1618)
    {
        float _1810 = _1756 * 6.283185482025146484375;
        float _1812 = sin(_1810);
        _1808 = _1812;
    }
    float _1814 = _1808;
    float _1816 = float(uint(_1790));
    int _1818 = _1804 ? 0 : 1;
    bool _1820 = _1722 != 3;
    float _1822 = as_type<float>(_984) * _1816;
    bool _1824 = !_1806;
    int _1826 = _1824 ? 0 : (-1);
    float _1828 = trunc(_1780);
    float _1830 = precise::max(_1828, 0.0);
    uint _1832 = uint(_1830);
    int _1834 = ~_745;
    int _1836 = _1834 + 1;
    int _1838 = ~_1714;
    int _1840 = _1838 + _1826;
    int _1842 = _1840 + 1;
    int _1844 = ~_1818;
    int _1846 = _1844 + 1;
    int _1848 = _1846 + 1;
    int _1850 = _1836 * int(_1786);
    int _1852 = _1850 + _1342;
    float _1854 = 0.0;
    int _1856 = _1848;
    bool _1858 = _1820;
    if (!_1618)
    {
        _1854 = _219;
    }
    float _1860 = _1854;
    float _1862 = trunc(_1822);
    float _1864 = precise::max(_1862, 0.0);
    uint _1866 = uint(_1864);
    int _1868 = _745 * _1842;
    int _1870 = _1868 + _1484;
    float _1872 = _1860;
    if (_1820)
    {
        int _1874 = ~_1818;
        int _1876 = _1874 + 1;
        _1856 = _1876;
    }
    int _1878 = _1856;
    if (_1618)
    {
        bool _1880 = _1814 > 0.5;
        _1858 = _1880;
    }
    bool _1882 = _1858;
    bool _1884 = !_1282;
    int _1886 = _1884 ? _1870 : (-1);
    float _1888 = float(uint(_1852));
    if (_1618)
    {
        float _1890 = -_219;
        float _1892 = _1882 ? _1890 : _219;
        _1872 = _1892;
    }
    float _1894 = _1872;
    int _1896 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1898 = _1896 != 0;
    float _1900 = as_type<float>(_791) * _1888;
    int _1902 = _1886 & 3;
    bool _1904 = _1902 != 0;
    int _1906 = int(_1696) + int(_1832);
    bool _1908 = !_1898;
    float _1910 = _1908 ? _219 : as_type<float>(_1802);
    float _1912 = trunc(_1900);
    float _1914 = precise::max(_1912, 0.0);
    uint _1916 = uint(_1914);
    bool _1918 = uint(_1902) > 1u;
    int _1920 = int(_1730) + int(_1866);
    int _1922 = ~_795;
    int _1924 = _1922 + 1;
    int _1926 = _1886 & 3;
    bool _1928 = _1926 != 0;
    int _1930 = ~_731;
    int _1932 = _1930 + 1;
    int _1934 = _1924 * _1920;
    int _1936 = _1934 + _1680;
    int _1938 = _1928 ? 0 : 1;
    float _1940 = float(uint(_1574));
    int _1942 = _1932 * _1906;
    int _1944 = _1942 + _1266;
    int _1946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1948 = _1946 != 0;
    int _1950 = ~_1938;
    int _1952 = _1950 + 1;
    int _1954 = _1952 + 1;
    float _1956 = as_type<float>(_984) * _1940;
    bool _1958 = !_1948;
    int _1960 = _1958 ? 0 : 1;
    bool _1962 = uint(_1936) >= uint(_795);
    int _1964 = _1954;
    float _1966 = as_type<float>(_1866);
    if (!_1918)
    {
        int _1968 = ~_1938;
        int _1970 = _1968 + 1;
        _1964 = _1970;
    }
    int _1972 = _1964;
    float _1974 = trunc(_1956);
    float _1976 = precise::max(_1974, 0.0);
    uint _1978 = uint(_1976);
    bool _1980 = uint(_1944) >= uint(_731);
    bool _1982 = !_1962;
    int _1984 = _1982 ? 0 : (-1);
    bool _1986 = _1902 != 3;
    int _1988 = ~_745;
    int _1990 = _1988 + 1;
    bool _1992 = !_1980;
    int _1994 = _1992 ? 0 : (-1);
    bool _1996 = uint(_1902) >= 2u;
    int _1998 = int(_1786) + int(_1916);
    int _2000 = ~_1920;
    int _2002 = _2000 + _1984;
    int _2004 = _2002 + 1;
    int _2006 = ~_795;
    int _2008 = _2006 + 1;
    int _2010 = _795 * _2004;
    int _2012 = _2010 + _1680;
    int _2014 = _1996 ? 0 : 1;
    int _2016 = _1990 * _1998;
    int _2018 = _2016 + _1342;
    int _2020 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2022 = _2020 != 0;
    int _2024 = ~_2014;
    int _2026 = _2024 + 1;
    int _2028 = _2026 + 1;
    int _2030 = _2028;
    float _2032 = as_type<float>(_2012);
    if (_1986)
    {
        int _2034 = ~_2014;
        int _2036 = _2034 + 1;
        _2030 = _2036;
    }
    int _2038 = _2030;
    int _2040 = _2008 * int(_1978);
    int _2042 = _2040 + _1574;
    int _2044 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2046 = _2044 != 0;
    bool _2048 = !_2022;
    int _2050 = _2048 ? 0 : 1;
    bool _2052 = uint(_2018) >= uint(_745);
    bool _2054 = !_1506;
    int _2056 = _2054 ? _2012 : (-1);
    bool _2058 = !_2046;
    int _2060 = _2058 ? 0 : 1;
    bool _2062 = !_2052;
    int _2064 = _2062 ? 0 : (-1);
    int _2066 = _2056 & 3;
    bool _2068 = _2066 != 0;
    int _2070 = _2056 & 3;
    bool _2072 = _2070 != 0;
    float _2074 = float(uint(_2042));
    int _2076 = _2068 ? 0 : 1;
    bool _2078 = uint(_2070) > 1u;
    float _2080 = as_type<float>(_984) * _2074;
    int _2082 = ~_2076;
    int _2084 = _2082 + 1;
    int _2086 = _2084 + 1;
    int _2088 = ~_795;
    int _2090 = _2088 + 1;
    float _2092 = trunc(_2080);
    float _2094 = precise::max(_2092, 0.0);
    uint _2096 = uint(_2094);
    float _2098 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2100 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    int _2102 = _2086;
    float _2104 = as_type<float>(_1978);
    if (!_2078)
    {
        int _2106 = ~_2076;
        int _2108 = _2106 + 1;
        _2102 = _2108;
    }
    int _2110 = _2102;
    float _2112 = -_2098;
    float _2114 = fma(_1164, 2.0, _2112);
    bool _2116 = uint(_2070) >= 2u;
    float _2118 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2120 = -_125;
    float _2122 = fma(_2120, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2114);
    int _2124 = _2116 ? 0 : 1;
    bool _2126 = _2070 != 3;
    float _2128 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2130 = int(_1978) + int(_2096);
    int _2132 = ~_2124;
    int _2134 = _2132 + 1;
    int _2136 = _2134 + 1;
    int _2138 = _2090 * _2130;
    int _2140 = _2138 + _1574;
    float _2142 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2144 = _2136;
    if (_2126)
    {
        int _2146 = ~_2124;
        int _2148 = _2146 + 1;
        _2144 = _2148;
    }
    int _2150 = _2144;
    float _2152 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2154 = uint(_2140) >= uint(_795);
    float _2156 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2158 = !_2154;
    int _2160 = _2158 ? 0 : (-1);
    float _2162 = -_2156;
    float _2164 = fma(_954, 2.0, _2162);
    bool _2166 = _892 > 0.5;
    float _2168 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2170 = _2168 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2172 = -_125;
    float _2174 = fma(_2172, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2164);
    float _2176 = -_215;
    int _2178 = _2166 ? as_type<int>(_2176) : as_type<int>(_215);
    float _2180 = 1.0 / _2170;
    bool _2182 = _904 != 1;
    float _2184 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2186 = in.m_48.x;
    float _2188 = in.m_48.y;
    float _2190 = in.m_48.z;
    int _2192 = abs(_2038);
    float _2194 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _2196 = ~_1906;
    int _2198 = _2196 + _1994;
    int _2200 = _2198 + 1;
    int _2202 = abs(_1798);
    float _2204 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2194);
    float _2206 = 0.0;
    if (!_2182)
    {
        _2206 = _900;
    }
    float _2208 = _2206;
    int _2210 = _731 * _2200;
    int _2212 = _2210 + _1266;
    float _2214 = 0.0;
    float _2216 = _2208;
    if (!_2182)
    {
        _2214 = _900;
    }
    float _2218 = _2214;
    float _2220 = _2218;
    if (!_2182)
    {
        _1966 = _910;
    }
    float _2222 = _1966;
    float _2224 = _2222;
    if (!_2182)
    {
        _1532 = _910;
    }
    float _2226 = _1532;
    float _2228 = _2226;
    if (_2182)
    {
        _2216 = _892;
    }
    float _2230 = _2216;
    if (_2182)
    {
        _2220 = _892;
    }
    float _2232 = _2220;
    if (_2182)
    {
        _2224 = _900;
    }
    float _2234 = _2224;
    float _2236 = _2188 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    if (_2182)
    {
        _2228 = _900;
    }
    float _2238 = _2228;
    float _2240 = _2188 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _2242 = _906 != 2;
    float _2244 = fma(_2186, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2236);
    float _2246 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2248 = _2188 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2250 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2252 = log2(_2250);
    float _2254 = fma(_2186, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2240);
    float _2256 = fma(_2186, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2248);
    float _2258 = _900 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2260 = fma(_2232, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2128);
    float _2262 = fma(_2190, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2254);
    float _2264 = fma(_2258, -2.0, _2246);
    float _2266 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    if (_2242)
    {
        _2104 = _892;
    }
    float _2268 = _2104;
    float _2270 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2260);
    float _2272 = _2268;
    if (_2242)
    {
        _2032 = _900;
    }
    float _2274 = _2032;
    float _2276 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2266);
    float _2278 = _2274;
    if (!_2242)
    {
        _2272 = _910;
    }
    float _2280 = _2272;
    float _2282 = _908 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2284 = _2252 * _125;
    if (!_2242)
    {
        _2278 = _892;
    }
    float _2286 = _2278;
    float _2288 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2264);
    int _2290 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2292 = _2290 != 0;
    float _2294 = fma(_2282, -2.0, _2100);
    float _2296 = exp2(_2284);
    bool _2298 = !_2292;
    float _2300 = _2298 ? _215 : as_type<float>(_2178);
    float _2302 = _2230 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _2304 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2306 = isnan(0.0);
    bool _2308 = _2304 || _2306;
    bool _2310 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2312 = _2308 || _2310;
    float _2314 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2316 = -_2118;
    float _2318 = fma(_2302, 2.0, _2316);
    float _2320 = _2280 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2322 = fma(_2238, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2314);
    float _2324 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2326 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2324;
    float _2328 = _2234 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2330 = -_2142;
    float _2332 = fma(_2320, 2.0, _2330);
    float _2334 = _2326 * _2180;
    float _2336 = -_2296;
    float _2338 = _2336 + 1.0;
    float _2340 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2342 = _2340 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2344 = fma(_2328, -2.0, _2152);
    float _2346 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2348 = _2346 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2350 = _2312 ? _2338 : 0.0;
    float _2352 = 1.0 / _2342;
    bool _2354 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2356 = isnan(1.0);
    bool _2358 = _2354 || _2356;
    bool _2360 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2362 = _2358 || _2360;
    float _2364 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2366 = 1.0 + _2364;
    float _2368 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2370 = _2368 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2372 = _2286 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2374 = 1.0 / _2366;
    float _2376 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2378 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2380 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2382 = fma(_2372, -2.0, _2184);
    float _2384 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2376);
    float _2386 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2378);
    float _2388 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2380);
    float _2390 = 1.0 / _2370;
    float _2392 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2394 = _2392 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2396 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2384);
    float _2398 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2386);
    float _2400 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2204);
    float _2402 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2388);
    float _2404 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2276);
    float _2406 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2294);
    float _2408 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2322);
    float _2410 = -_125;
    float _2412 = fma(_2410, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2318);
    float _2414 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2344);
    float _2416 = -_125;
    float _2418 = fma(_2416, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2332);
    float _2420 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2382);
    if (_2362)
    {
        float _2422 = _2350 * _2374;
        _135 = _2422;
    }
    float _2424 = _135;
    float _2426 = _900 * 2.0;
    bool _2428 = _1252 >= 0.0;
    bool _2430 = isnan(_1252);
    bool _2432 = _2428 || _2430;
    bool _2434 = isnan(0.0);
    bool _2436 = _2432 || _2434;
    float _2438 = 1.0 / _2394;
    float _2440 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2442 = _2440 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _2444 = _2436 ? 0 : 1;
    float _2446 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2448 = _2446 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _2450 = _1252 > 0.0;
    float _2452 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2454 = _2452 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2456 = floor(_2426);
    float _2458 = _2448 * _2390;
    float _2460 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2462 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2460;
    float _2464 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2466 = _2464 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2468 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2470 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2468;
    float _2472 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2474 = _2472 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2476 = fma(_2190, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2256);
    float _2478 = -_2408;
    float _2480 = _2478 + 1.0;
    float _2482 = 1.0 / _2348;
    float _2484 = _2474 * _2352;
    float _2486 = _2470 * _2438;
    int _2488 = ~_2444;
    int _2490 = _2488 + 1;
    int _2492 = _2490 + 1;
    float _2494 = -_2400;
    float _2496 = _2494 + 1.0;
    int _2498 = _2492;
    if (!_2450)
    {
        int _2500 = ~_2444;
        int _2502 = _2500 + 1;
        _2498 = _2502;
    }
    int _2504 = _2498;
    float _2506 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2508 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2506;
    float _2510 = 1.0 / _2442;
    bool _2512 = _2456 >= 0.0;
    bool _2514 = isnan(_2456);
    bool _2516 = _2512 || _2514;
    bool _2518 = isnan(0.0);
    bool _2520 = _2516 || _2518;
    float _2522 = -_2402;
    float _2524 = _2522 + 1.0;
    int _2526 = abs(_2110);
    int _2528 = _2520 ? 0 : 1;
    bool _2530 = _2456 > 0.0;
    float _2532 = 1.0 / _2454;
    float _2534 = _2462 * _2482;
    bool _2536 = _713 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2538 = isnan(_713);
    bool _2540 = _2536 || _2538;
    bool _2542 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2544 = _2540 || _2542;
    float _2546 = float(_2544);
    bool _2548 = _713 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2550 = isnan(_713);
    bool _2552 = _2548 || _2550;
    bool _2554 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2556 = _2552 || _2554;
    float _2558 = float(_2556);
    int _2560 = ~_2526;
    int _2562 = _2560 + 1;
    int _2564 = _2562 + 1;
    float _2566 = _2466 * _2510;
    int _2568 = ~_1998;
    int _2570 = _2568 + _2064;
    int _2572 = _2570 + 1;
    float _2574 = _910 * 2.0;
    int _2576 = ~_2528;
    int _2578 = _2576 + 1;
    int _2580 = _2578 + 1;
    int _2582 = _2580;
    if (!_2530)
    {
        int _2584 = ~_2528;
        int _2586 = _2584 + 1;
        _2582 = _2586;
    }
    int _2588 = _2582;
    int _2590 = _745 * _2572;
    int _2592 = _2590 + _1342;
    bool _2594 = _713 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2596 = isnan(_713);
    bool _2598 = _2594 || _2596;
    bool _2600 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2602 = _2598 || _2600;
    float _2604 = float(_2602);
    float _2606 = _2508 * _2532;
    bool _2608 = _713 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2610 = isnan(_713);
    bool _2612 = _2608 || _2610;
    bool _2614 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2616 = _2612 || _2614;
    float _2618 = float(_2616);
    float _2620 = -_2546;
    float _2622 = _2620 + 1.0;
    float _2624 = floor(_2574);
    bool _2626 = !_1282;
    int _2628 = _2626 ? _2592 : (-1);
    float _2630 = _2618 * _2622;
    float _2632 = -_2618;
    float _2634 = _2632 + 1.0;
    float _2636 = -_2558;
    float _2638 = _2636 + 1.0;
    bool _2640 = !_1904;
    int _2642 = _2640 ? 0 : 1;
    int _2644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2646 = _2644 != 0;
    int _2648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2650 = _2648 != 0;
    int _2652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2654 = _2652 != 0;
    float _2656 = _2604 * _2638;
    int _2658 = _1886 >> 31;
    float _2660 = -_2604;
    float _2662 = _2660 + 1.0;
    bool _2664 = _713 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2666 = isnan(_713);
    bool _2668 = _2664 || _2666;
    bool _2670 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2672 = _2668 || _2670;
    float _2674 = float(_2672);
    float _2676 = _2558 * _2634;
    int _2678 = _2658 & 3;
    bool _2680 = _713 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2682 = isnan(_713);
    bool _2684 = _2680 || _2682;
    bool _2686 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2688 = _2684 || _2686;
    float _2690 = float(_2688);
    float _2692 = -_2674;
    float _2694 = _2692 + 1.0;
    int _2696 = _1886 + _2678;
    float _2698 = _2674 * _2662;
    bool _2700 = _2624 >= 0.0;
    bool _2702 = isnan(_2624);
    bool _2704 = _2700 || _2702;
    bool _2706 = isnan(0.0);
    bool _2708 = _2704 || _2706;
    float _2710 = _2690 * _2694;
    int _2712 = _2696 >> 2;
    float _2714 = -_2690;
    float _2716 = _2714 + 1.0;
    bool _2718 = _713 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2720 = isnan(_713);
    bool _2722 = _2718 || _2720;
    bool _2724 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2726 = _2722 || _2724;
    float _2728 = float(_2726);
    float _2730 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2732 = _713 + _2730;
    int _2734 = _2708 ? 0 : 1;
    int _2736 = _2712 << 4;
    int _2738 = _2736 + 656;
    float _2740 = fma(_2334, _2732, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2742 = _2624 > 0.0;
    float _2744 = _2728 * _2716;
    float _2746 = -_2728;
    float _2748 = _2746 + 1.0;
    float _2750 = fma(_2190, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2244);
    bool _2752 = _713 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2754 = isnan(_713);
    bool _2756 = _2752 || _2754;
    bool _2758 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2760 = _2756 || _2758;
    float _2762 = float(_2760);
    uint _2764 = uint(int(uint(_2738) >> uint(2)));
    uint _2766 = uint(int(uint(int(_2764)) >> uint(2)));
    int _2768 = int(_2764) & 3;
    float _2770 = (*spvDescriptorSet0.vp_c9)._m0[int(_2766)][_2768];
    int _2772 = int(_2764) + 1;
    uint _2774 = uint(int(uint(_2772) >> uint(2)));
    int _2776 = _2772 & 3;
    float _2778 = (*spvDescriptorSet0.vp_c9)._m0[int(_2774)][_2776];
    float _2780 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2782 = _713 + _2780;
    float _2784 = _2750 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _2786 = abs(_2642);
    float _2788 = _2762 * _2748;
    float _2790 = fma(_2458, _962, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2792 = -_2762;
    float _2794 = _2792 + 1.0;
    float _2796 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2798 = _713 + _2796;
    float _2800 = _2740 * _2788;
    float _2802 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2804 = _713 + _2802;
    float _2806 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2808 = _713 + _2806;
    float _2810 = fma(_2484, _2798, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2812 = fma(_2794, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2800);
    float _2814 = fma(_2486, _2782, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2816 = fma(_2534, _2804, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2818 = _900 + _892;
    int _2820 = _2738 + 8;
    uint _2822 = uint(int(uint(_2820) >> uint(2)));
    uint _2824 = uint(int(uint(int(_2822)) >> uint(2)));
    int _2826 = int(_2822) & 3;
    float _2828 = (*spvDescriptorSet0.vp_c9)._m0[int(_2824)][_2826];
    int _2830 = int(_2822) + 1;
    uint _2832 = uint(int(uint(_2830) >> uint(2)));
    int _2834 = _2830 & 3;
    float _2836 = (*spvDescriptorSet0.vp_c9)._m0[int(_2832)][_2834];
    float _2838 = fma(_2790, _2744, _2812);
    float _2840 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2842 = _713 + _2840;
    int _2844 = ~_2734;
    int _2846 = _2844 + 1;
    int _2848 = _2846 + 1;
    float _2850 = _900 + (-0.5);
    float _2852 = fma(_2814, _2710, _2838);
    float _2854 = fma(_2566, _2842, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2856 = _2262 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2858 = _2848;
    if (!_2742)
    {
        int _2860 = ~_2734;
        int _2862 = _2860 + 1;
        _2858 = _2862;
    }
    int _2864 = _2858;
    float _2866 = _900 + _910;
    float _2868 = fma(_2810, _2698, _2852);
    float _2870 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2872 = _2856 + _2870;
    float _2874 = _2476 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2876 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2878 = _2784 + _2876;
    int _2880 = abs(_1972);
    float _2882 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2884 = fma(_2606, _2808, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2886 = _892 + _910;
    int _2888 = ~_2880;
    int _2890 = _2888 + 1;
    int _2892 = _2890 + 1;
    float _2894 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2882);
    bool _2896 = !_1724;
    int _2898 = _2896 ? 0 : 1;
    float _2900 = _892 + (-0.5);
    bool _2902 = _1902 != 3;
    float _2904 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2906 = int(_2904);
    float _2908 = _2818 + (-1.0);
    float _2910 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2912 = _2874 + _2910;
    float _2914 = fma(_2816, _2656, _2868);
    int _2916 = abs(_2050);
    float _2918 = _1708 + 0.5;
    float _2920 = fma(_2908, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2922 = _2892 * as_type<int>(_2778);
    int _2924 = ~_2786;
    int _2926 = _2924 + 1;
    int _2928 = _2926 + 1;
    float _2930 = fma(_2912, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2894);
    bool _2932 = !_2902;
    int _2934 = _2932 ? 0 : (-1);
    float _2936 = fma(_2918, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2122);
    float _2938 = fma(_2854, _2676, _2914);
    int _2940 = _2928 * as_type<int>(_2770);
    int _2942 = _2940 + _2922;
    int _2944 = abs(_2934);
    float _2946 = fma(_2884, _2630, _2938);
    int _2948 = ~_2192;
    int _2950 = _2948 + 1;
    int _2952 = _2950 + 1;
    int _2954 = ~_2944;
    int _2956 = _2954 + 1;
    int _2958 = _2956 + 1;
    float _2960 = fma(_2546, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2946);
    float _2962 = float(uint(_2906));
    int _2964 = _2952 * as_type<int>(_2828);
    int _2966 = _2964 + _2942;
    int _2968 = ~_2916;
    int _2970 = _2968 + 1;
    int _2972 = _2970 + 1;
    float _2974 = _1894 + (-0.5);
    bool _2976 = _2930 >= 0.0;
    int _2978 = _2958 * as_type<int>(_2836);
    int _2980 = _2978 + _2966;
    float _2982 = 1.0 / _2962;
    float _2984 = -_2974;
    float _2986 = -_2406;
    float _2988 = fma(_2984, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2986);
    float _2990 = _2300 + 0.5;
    int _2992 = _2980 * _2972;
    float _2994 = -_2404;
    float _2996 = _2994 + 1.0;
    float _2998 = _1910 + (-0.5);
    float _3000 = fma(_2990, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2174);
    float _3002 = -_1218;
    float _3004 = fma(_3002, _1708, _2936);
    float _3006 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3008 = _2628 * _2916;
    int _3010 = _3008 + _2992;
    float _3012 = fma(_2996, _1894, _2988);
    if (_2976)
    {
        _1738 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3014 = _1738;
    float _3016 = _1684 + 0.5;
    float _3018 = -_2998;
    float _3020 = -_2288;
    float _3022 = fma(_3018, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3020);
    float _3024 = float(uint(_3010));
    float _3026 = _1442 + (-0.5);
    float _3028 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3030 = as_type<int>(_2982) + (-2);
    int _3032 = as_type<int>(_2982);
    if (_2976)
    {
        float _3034 = _3014 * 5.0;
        _3032 = as_type<int>(_3034);
    }
    int _3036 = _3032;
    out.m_70.x = _3004;
    out.m_70.y = _3012;
    bool _3038 = !_2646;
    int _3040 = _3038 ? 0 : 1;
    float _3042 = as_type<float>(_3030) * _3024;
    int _3044 = abs(_2898);
    float _3046 = _3006 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_2976)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9474 = as_type<float>(_3036);
        out.gl_Position.z = _9474;
    }
    float _3048 = trunc(_3042);
    float _3050 = precise::max(_3048, 0.0);
    uint _3052 = uint(_3050);
    int _3054 = abs(_3040);
    float _3056 = fma(_3046, _3016, _2412);
    int _3058 = ~_2906;
    int _3060 = _3058 + 1;
    out.m_72.x = _2960;
    int _3062 = abs(_1960);
    float _3064 = _3028 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3066 = abs(_2906);
    if (_2976)
    {
        out.m_55.x = 0.0;
    }
    float _3068 = -_3064;
    float _3070 = -_2414;
    float _3072 = fma(_3068, _3026, _3070);
    float _3074 = _2872 * _2872;
    int _3076 = _1712 >> 31;
    float _3078 = fma(_1442, _2480, _3072);
    float _3080 = float(uint(_3066));
    float _3082 = fma(_2878, _2878, _3074);
    int _3084 = _2056 >> 31;
    int _3086 = _3060 * int(_3052);
    int _3088 = _3086 + _3010;
    int _3090 = _3076 & 3;
    float _3092 = 1.0 / _3080;
    int _3094 = _3084 & 3;
    int _3096 = _1712 + _3090;
    float _3098 = fma(_2912, _2912, _3082);
    float _3100 = -_2396;
    float _3102 = _3100 + 1.0;
    int _3104 = _2056 + _3094;
    float _3106 = _553 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3108 = rsqrt(_3098);
    float _3110 = -_3102;
    float _3112 = fma(_2300, _3110, _3000);
    int _3114 = abs(_3010);
    float _3116 = _3106 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _3118 = _3096 >> 2;
    int _3120 = _3104 >> 2;
    float _3122 = -_2270;
    float _3124 = _3122 + 1.0;
    int _3126 = as_type<int>(_3092) + (-2);
    float _3128 = -_2398;
    float _3130 = _3128 + 1.0;
    float _3132 = float(uint(_3114));
    float _3134 = -_3124;
    float _3136 = fma(_1684, _3134, _3056);
    float _3138 = float(uint(_3088));
    float _3140 = fma(_1910, _3130, _3022);
    int _3142 = _3118 << 4;
    int _3144 = _3142 + 368;
    float _3146 = as_type<float>(_3126) * _3132;
    int _3148 = _3120 << 4;
    int _3150 = _3148 + 800;
    float _3152 = as_type<float>(_3030) * _3138;
    float _3154 = _3116 * _3108;
    uint _3156 = uint(int(uint(_3144) >> uint(2)));
    uint _3158 = uint(int(uint(int(_3156)) >> uint(2)));
    int _3160 = int(_3156) & 3;
    float _3162 = (*spvDescriptorSet0.vp_c9)._m0[int(_3158)][_3160];
    int _3164 = int(_3156) + 1;
    uint _3166 = uint(int(uint(_3164) >> uint(2)));
    int _3168 = _3164 & 3;
    float _3170 = (*spvDescriptorSet0.vp_c9)._m0[int(_3166)][_3168];
    int _3172 = ~_3066;
    int _3174 = _3172 + 1;
    float _3176 = trunc(_3146);
    float _3178 = precise::max(_3176, 0.0);
    uint _3180 = uint(_3178);
    float _3182 = _2872 * _3154;
    float _3184 = _2878 * _3154;
    out.m_74.x = _3112;
    out.m_74.y = _3140;
    out.m_74.z = _3136;
    out.m_74.w = _3078;
    float _3186 = -_3182;
    float _3188 = _2872 + _3186;
    uint _3190 = uint(int(uint(_3150) >> uint(2)));
    uint _3192 = uint(int(uint(int(_3190)) >> uint(2)));
    int _3194 = int(_3190) & 3;
    float _3196 = (*spvDescriptorSet0.vp_c9)._m0[int(_3192)][_3194];
    int _3198 = int(_3190) + 1;
    uint _3200 = uint(int(uint(_3198) >> uint(2)));
    int _3202 = _3198 & 3;
    float _3204 = (*spvDescriptorSet0.vp_c9)._m0[int(_3200)][_3202];
    float _3206 = -_3184;
    float _3208 = _2878 + _3206;
    float _3210 = float(_2864);
    float _3212 = _3188 * _3188;
    float _3214 = float(_3054);
    float _3216 = trunc(_3152);
    float _3218 = precise::max(_3216, 0.0);
    uint _3220 = uint(_3218);
    int _3222 = ~_2130;
    int _3224 = _3222 + _2160;
    int _3226 = _3224 + 1;
    float _3228 = fma(_3208, _3208, _3212);
    int _3230 = _3144 + 8;
    uint _3232 = uint(int(uint(_3230) >> uint(2)));
    uint _3234 = uint(int(uint(int(_3232)) >> uint(2)));
    int _3236 = int(_3232) & 3;
    float _3238 = (*spvDescriptorSet0.vp_c9)._m0[int(_3234)][_3236];
    int _3240 = int(_3232) + 1;
    uint _3242 = uint(int(uint(_3240) >> uint(2)));
    int _3244 = _3240 & 3;
    float _3246 = (*spvDescriptorSet0.vp_c9)._m0[int(_3242)][_3244];
    float _3248 = _3214 * _3210;
    int _3250 = _3174 * int(_3180);
    int _3252 = _3250 + _3114;
    bool _3254 = _731 == 0;
    int _3256 = _795 * _3226;
    int _3258 = _3256 + _1574;
    float _3260 = float(uint(_3252));
    int _3262 = _3150 + 8;
    uint _3264 = uint(int(uint(_3262) >> uint(2)));
    uint _3266 = uint(int(uint(int(_3264)) >> uint(2)));
    int _3268 = int(_3264) & 3;
    float _3270 = (*spvDescriptorSet0.vp_c9)._m0[int(_3266)][_3268];
    int _3272 = int(_3264) + 1;
    uint _3274 = uint(int(uint(_3272) >> uint(2)));
    int _3276 = _3272 & 3;
    float _3278 = (*spvDescriptorSet0.vp_c9)._m0[int(_3274)][_3276];
    int _3280 = ~_2906;
    int _3282 = _3280 + 1;
    int _3284 = ~_2202;
    int _3286 = _3284 + 1;
    int _3288 = _3286 + 1;
    float _3290 = as_type<float>(_3126) * _3260;
    int _3292 = int(_3052) + int(_3220);
    bool _3294 = !_2072;
    int _3296 = _3294 ? 0 : 1;
    float _3298 = trunc(_3290);
    float _3300 = precise::max(_3298, 0.0);
    uint _3302 = uint(_3300);
    bool _3304 = _1722 != 3;
    int _3306 = _3282 * _3292;
    int _3308 = _3306 + _3010;
    int _3310 = ~_3066;
    int _3312 = _3310 + 1;
    bool _3314 = !_3254;
    int _3316 = _3314 ? _2212 : (-1);
    bool _3318 = !_1506;
    int _3320 = _3318 ? _3258 : (-1);
    int _3322 = _3288 * as_type<int>(_3170);
    bool _3324 = !_3304;
    int _3326 = _3324 ? 0 : (-1);
    bool _3328 = uint(_3308) >= uint(_2906);
    int _3330 = int(_3180) + int(_3302);
    bool _3332 = !_3328;
    int _3334 = _3332 ? 0 : (-1);
    int _3336 = _2564 * as_type<int>(_3204);
    int _3338 = abs(_3296);
    int _3340 = _3312 * _3330;
    int _3342 = _3340 + _3114;
    int _3344 = ~_3338;
    int _3346 = _3344 + 1;
    int _3348 = _3346 + 1;
    bool _3350 = _2070 != 3;
    int _3352 = ~_3044;
    int _3354 = _3352 + 1;
    int _3356 = _3354 + 1;
    int _3358 = _3348 * as_type<int>(_3196);
    int _3360 = _3358 + _3336;
    int _3362 = ~_3292;
    int _3364 = _3362 + _3334;
    int _3366 = _3364 + 1;
    bool _3368 = !_3350;
    int _3370 = _3368 ? 0 : (-1);
    int _3372 = _3356 * as_type<int>(_3162);
    int _3374 = _3372 + _3322;
    bool _3376 = uint(_3342) >= uint(_3066);
    int _3378 = _2906 * _3366;
    int _3380 = _3378 + _3010;
    int _3382 = abs(_2150);
    bool _3384 = !_3376;
    int _3386 = _3384 ? 0 : (-1);
    int _3388 = abs(_1878);
    bool _3390 = _2906 == 0;
    int _3392 = ~_3382;
    int _3394 = _3392 + 1;
    int _3396 = _3394 + 1;
    int _3398 = abs(_3326);
    int _3400 = ~_3388;
    int _3402 = _3400 + 1;
    int _3404 = _3402 + 1;
    int _3406 = _3396 * as_type<int>(_3270);
    int _3408 = _3406 + _3360;
    bool _3410 = !_3390;
    int _3412 = _3410 ? _3380 : (-1);
    float _3414 = _1120 + 0.5;
    bool _3416 = _2906 == 0;
    int _3418 = _3404 * as_type<int>(_3238);
    int _3420 = _3418 + _3374;
    int _3422 = _3010 ^ _2906;
    int _3424 = abs(_3370);
    int _3426 = ~_3398;
    int _3428 = _3426 + 1;
    int _3430 = _3428 + 1;
    float _3432 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    uint _3434 = uint(int(uint(_3422) >> uint(31)));
    int _3436 = ~_3424;
    int _3438 = _3436 + 1;
    int _3440 = _3438 + 1;
    int _3442 = _3430 * as_type<int>(_3246);
    int _3444 = _3442 + _3420;
    int _3446 = ~_3386;
    int _3448 = _3330 + _3446;
    int _3450 = _3448 + 1;
    int _3452 = ~int(_3434);
    int _3454 = _3452 + 1;
    float _3456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3458 = abs(_2060);
    int _3460 = _3440 * as_type<int>(_3278);
    int _3462 = _3460 + _3408;
    int _3464 = _3450 ^ _3454;
    int _3466 = ~_3062;
    int _3468 = _3466 + 1;
    int _3470 = _3468 + 1;
    int _3472 = ~_3454;
    int _3474 = _3472 + _3464;
    int _3476 = _3474 + 1;
    float _3478 = _3432 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3480 = in.m_76.x;
    float _3482 = in.m_76.y;
    float _3484 = in.m_76.z;
    int _3486 = ~_3458;
    int _3488 = _3486 + 1;
    int _3490 = _3488 + 1;
    int _3492 = _3444 * _3470;
    bool _3494 = !_3416;
    int _3496 = _3494 ? _3476 : (-1);
    float _3498 = float(_3412);
    int _3500 = _3462 * _3490;
    float _3502 = float(_3496);
    float _3504 = _3456 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3506 = _3316 * _3062;
    int _3508 = _3506 + _3492;
    float _3510 = fma(_3478, _3498, _2418);
    int _3512 = _3320 * _3458;
    int _3514 = _3512 + _3500;
    float _3516 = -_2420;
    float _3518 = fma(_3504, _3502, _3516);
    float _3520 = _1086 + (-0.5);
    float _3522 = fma(_3478, _3414, _3510);
    float _3524 = _3248 * (-2.0);
    float _3526 = -_3504;
    float _3528 = fma(_3526, _3520, _3518);
    float _3530 = float(_3508);
    float _3532 = -_2496;
    float _3534 = fma(_1120, _3532, _3522);
    float _3536 = float(_3514);
    float _3538 = fma(_1086, _2524, _3528);
    float _3540 = fma(_2920, _3524, _2920);
    float _3542 = _2912 * _3154;
    float _3544 = fma(_3524, _3480, _3480);
    bool _3546 = !_2650;
    int _3548 = _3546 ? 0 : 1;
    out.m_78.x = _3530;
    float _3550 = -_3542;
    float _3552 = _2912 + _3550;
    bool _3554 = !_2654;
    int _3556 = _3554 ? 0 : 1;
    out.m_78.w = _3536;
    int _3558 = abs(_3548);
    out.m_80.x = _3534;
    out.m_80.y = _3538;
    float _3560 = _3484;
    if (_2976)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3562 = -_3182;
    float _3564 = _2856 + _3562;
    float _3566 = float(_2504);
    float _3568 = -_3184;
    float _3570 = _2784 + _3568;
    float _3572 = float(_3558);
    float _3574 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3576 = _3564 + _3574;
    float _3578 = fma(_2900, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3544);
    float _3580 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3582 = _3570 + _3580;
    float _3584 = _3572 * _3566;
    int _3586 = abs(_3556);
    float _3588 = _3576 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3590 = -_3542;
    float _3592 = _2874 + _3590;
    float _3594 = fma(_3540, _2424, _3578);
    float _3596 = _2866 + (-1.0);
    float _3598 = fma(_3582, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3588);
    float _3600 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3602 = _3592 + _3600;
    float _3604 = float(_2588);
    float _3606 = fma(_3596, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3608 = float(_3586);
    float _3610 = fma(_3602, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3598);
    float _3612 = _3584 * (-2.0);
    float _3614 = _2886 + (-1.0);
    float _3616 = _910 + (-0.5);
    float _3618 = _3608 * _3604;
    float _3620 = fma(_3612, _3482, _3482);
    float _3622 = fma(_3606, _3612, _3606);
    bool _3624 = _3610 >= 0.0;
    float _3626 = _3618 * (-2.0);
    float _3628 = fma(_2850, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3620);
    float _3630 = fma(_3552, _3552, _3228);
    float _3632 = _3594 * 0.15915493667125701904296875;
    float _3634 = fma(_3622, _2424, _3628);
    float _3636 = fma(_3626, _3484, _3484);
    float _3638 = fma(_3614, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3640 = _3632 * 6.283185482025146484375;
    float _3642 = sin(_3640);
    float _3644 = _3634 * 0.15915493667125701904296875;
    float _3646 = fma(_3616, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3636);
    float _3648 = fma(_3638, _3626, _3638);
    if (_3624)
    {
        _3560 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3650 = _3560;
    int _3652 = as_type<int>(_3650);
    if (_3624)
    {
        out.m_55.x = 0.0;
    }
    float _3654 = fma(_3648, _2424, _3646);
    float _3656 = sqrt(_3630);
    if (_3624)
    {
        float _3658 = _3650 * 5.0;
        _3652 = as_type<int>(_3658);
    }
    int _3660 = _3652;
    float _3662 = _3654 * 0.15915493667125701904296875;
    if (_3624)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10373 = as_type<float>(_3660);
        out.gl_Position.z = _10373;
    }
    float _3664 = _3632 * 6.283185482025146484375;
    float _3666 = cos(_3664);
    float _3668 = _3644 * 6.283185482025146484375;
    float _3670 = sin(_3668);
    float _3672 = _3644 * 6.283185482025146484375;
    float _3674 = cos(_3672);
    if (_3624)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3676 = _3662 * 6.283185482025146484375;
    float _3678 = cos(_3676);
    float _3680 = _3108 * _3656;
    float _3682 = _551 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3684 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _219);
    float _3686 = _3666 * _3674;
    float _3688 = _3106 * _3680;
    float _3690 = _3680 * _3682;
    float _3692 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _215);
    float _3694 = _3662 * 6.283185482025146484375;
    float _3696 = sin(_3694);
    float _3698 = _3642 * _3674;
    float _3700 = _3684 * _3690;
    float _3702 = _3642 * _3670;
    float _3704 = _3666 * _3670;
    float _3706 = _3692 * _3688;
    float _3708 = _219 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3710 = _3666 * _3678;
    float _3712 = _3674 * _3678;
    float _3714 = _3642 * _3678;
    float _3716 = _3670 * _3678;
    float _3718 = _3710 * _3700;
    float _3720 = _3680 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3722 = _3720 * 0.5;
    float _3724 = fma(_3696, _3686, _3702);
    float _3726 = -_3698;
    float _3728 = fma(_3696, _3704, _3726);
    float _3730 = -_3700;
    float _3732 = _3696 * _3730;
    float _3734 = -_3704;
    float _3736 = fma(_3696, _3698, _3734);
    float _3738 = fma(_3724, _3706, _3718);
    float _3740 = _3714 * _3700;
    float _3742 = fma(_3712, _3706, _3732);
    float _3744 = fma(_3696, _3702, _3686);
    float _3746 = fma(_3728, _3722, _3738);
    float _3748 = fma(_3736, _3706, _3740);
    float _3750 = fma(_3716, _3722, _3742);
    float _3752 = _3724 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3754 = _3746 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3756 = _3746 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3758 = fma(_3744, _3722, _3748);
    float _3760 = fma(_3712, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3752);
    float _3762 = fma(_3750, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3754);
    float _3764 = fma(_3750, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3756);
    float _3766 = _3728 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3768 = _3728 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3770 = fma(_3758, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3762);
    float _3772 = fma(_3758, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3764);
    float _3774 = fma(_3716, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3768);
    float _3776 = _3770 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3778 = _3772 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3780 = _3724 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3782 = _2784 + _3776;
    float _3784 = _2874 + _3778;
    float _3786 = _3724 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3788 = _3746 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3790 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3792 = _3782 + _3790;
    float _3794 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3796 = _3784 + _3794;
    float _3798 = fma(_3712, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3780);
    float _3800 = fma(_3750, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3788);
    float _3802 = _3792 * _3792;
    float _3804 = _3796 * _3796;
    float _3806 = fma(_3712, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3786);
    float _3808 = fma(_3758, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3800);
    float _3810 = _3710 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3812 = _3802 + _3804;
    float _3814 = _3710 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3816 = _3808 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3818 = _3710 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3820 = sqrt(_3812);
    float _3822 = fma(_3708, _3708, 1.0);
    float _3824 = _3728 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3826 = _2856 + _3816;
    float _3828 = -_3696;
    float _3830 = fma(_3828, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3810);
    float _3832 = -_3696;
    float _3834 = fma(_3832, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3814);
    float _3836 = -_3696;
    float _3838 = fma(_3836, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3818);
    float _3840 = fma(_3716, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3824);
    float _3842 = rsqrt(_3822);
    float _3844 = fma(_3716, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3766);
    bool _3846 = _3820 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3848 = _3716;
    float _3850 = _3810;
    float _3852 = _3808;
    float _3854 = _3822;
    float _3856 = _3824;
    if (!_3846)
    {
        _3848 = _3804;
    }
    float _3858 = _3848;
    float _3860 = _3858;
    if (!_3846)
    {
        _3850 = _3802;
    }
    float _3862 = _3850;
    float _3864 = _3862;
    if (!_3846)
    {
        _3852 = _3782;
    }
    float _3866 = _3852;
    float _3868 = _3866;
    if (!_3846)
    {
        _3854 = _3784;
    }
    float _3870 = _3854;
    float _3872 = _3870;
    if (!_3846)
    {
        _3856 = _3826;
    }
    float _3874 = _3856;
    bool _3876 = !_3846;
    float _3878 = _3874;
    if (!_3876)
    {
        float _3880 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3882 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3884 = _3820 + _3882;
        float _3886 = rsqrt(_3812);
        float _3888 = _3884 * _3880;
        float _3890 = _3826 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3892 = _3888 * 0.15915493667125701904296875;
        float _3894 = _3892 * 6.283185482025146484375;
        float _3896 = sin(_3894);
        float _3898 = _3892 * 6.283185482025146484375;
        float _3900 = cos(_3898);
        float _3902 = fma(_3896, _3890, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3904 = _3886 * _3902;
        float _3906 = _3900 + (-1.0);
        float _3908 = fma(_3792, _3904, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3910 = fma(_3796, _3904, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3912 = _3906 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3914 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3916 = _3908 + _3914;
        float _3918 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3920 = _3910 + _3918;
        float _3922 = fma(_3826, _3900, _3912);
        float _3924 = _3916 * _3916;
        float _3926 = _3920 * _3920;
        _3878 = _3922;
        _3864 = _3924;
        _3860 = _3926;
        _3868 = _3908;
        _3872 = _3910;
    }
    float _3928 = _3878;
    float _3930 = _3864;
    float _3932 = _3860;
    float _3934 = _3868;
    float _3936 = _3872;
    float _3938 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3940 = _3928 + _3938;
    float _3942 = fma(_3714, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3830);
    float _3944 = fma(_3714, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3834);
    float _3946 = fma(_3714, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3838);
    float _3948 = fma(_3940, _3940, _3930);
    float _3950 = fma(_3744, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3840);
    float _3952 = fma(_3744, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3844);
    float _3954 = fma(_3744, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3774);
    float _3956 = _3948 + _3932;
    float _3958 = _3708 * _3842;
    float _3960 = fma(_3736, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3806);
    float _3962 = fma(_3736, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3798);
    float _3964 = _215 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3966 = _3708 * _3942;
    float _3968 = _3708 * _3944;
    float _3970 = fma(_3736, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3760);
    float _3972 = _3708 * _3946;
    float _3974 = -_3950;
    float _3976 = _3958 * _3974;
    float _3978 = -_3952;
    float _3980 = _3958 * _3978;
    float _3982 = -_3954;
    float _3984 = _3958 * _3982;
    float _3986 = sqrt(_3956);
    float _3988 = fma(_3964, _3960, _3966);
    float _3990 = fma(_3964, _3962, _3968);
    float _3992 = fma(_3964, _3970, _3972);
    float _3994 = fma(_3842, _3942, _3976);
    float _3996 = fma(_3842, _3944, _3980);
    float _3998 = fma(_3842, _3946, _3984);
    float _4000 = _3950 + _3988;
    float _4002 = _3952 + _3990;
    float _4004 = _3954 + _3992;
    out.m_82.x = _3960;
    out.m_82.y = _3962;
    out.m_82.z = _3970;
    out.m_84.x = _3994;
    out.m_84.y = _3996;
    out.m_84.z = _3998;
    bool _4006 = _3986 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4008 = isnan(_3986);
    bool _4010 = _4006 || _4008;
    bool _4012 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4014 = _4010 || _4012;
    out.m_86.x = _4000;
    out.m_86.y = _4002;
    out.m_86.z = _4004;
    float _4016 = _3990;
    if (!_4014)
    {
        _4016 = 1.0;
    }
    float _4018 = _4016;
    bool _4020 = !_4014;
    float _4022 = _4018;
    if (!_4020)
    {
        bool _4024 = _3986 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4026 = isnan(_3986);
        bool _4028 = _4024 || _4026;
        bool _4030 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4032 = _4028 || _4030;
        if (!_4032)
        {
            float _4034 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4036 = _3986 + _4034;
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
            bool _4054 = _3986 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4056 = isnan(_3986);
            bool _4058 = _4054 || _4056;
            bool _4060 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4062 = _4058 || _4060;
            if (!_4062)
            {
                float _4064 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4066 = _3986 + _4064;
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
    float _4086 = _3928 + _4084;
    float _4088 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4090 = _3934 + _4088;
    float _4092 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4094 = _3936 + _4092;
    float _4096 = fma(_4086, _4082, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4098 = fma(_4090, _4082, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4100 = fma(_4094, _4082, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4102 = -_2856;
    float _4104 = _4102 + _4096;
    float _4106 = -_2784;
    float _4108 = _4106 + _4098;
    float _4110 = -_2874;
    float _4112 = _4110 + _4100;
    float _4114 = _4104 * _4104;
    float _4116 = fma(_4108, _4108, _4114);
    float _4118 = fma(_4112, _4112, _4116);
    float _4120 = sqrt(_4118);
    bool _4122 = _4120 > 0.0;
    float _4124 = _4090;
    float _4126 = _4120;
    float _4128 = _4094;
    if (!_4122)
    {
        _4124 = _4098;
    }
    float _4130 = _4124;
    float _4132 = _4130;
    float _4134 = _4130;
    if (!_4122)
    {
        _4126 = _4096;
    }
    float _4136 = _4126;
    float _4138 = _4136;
    if (!_4122)
    {
        _4128 = _4100;
    }
    float _4140 = _4128;
    bool _4142 = !_4122;
    float _4144 = _4140;
    if (!_4142)
    {
        float _4146 = _209 * _209;
        float _4148 = fma(_207, _207, _4146);
        float _4150 = rsqrt(_4118);
        float _4152 = fma(_211, _211, _4148);
        float _4154 = sqrt(_4152);
        float _4156 = _4108 * _4150;
        float _4158 = _4104 * _4150;
        float _4160 = _4112 * _4150;
        bool _4162 = _4154 > 0.0;
        float _4164 = _4150;
        float _4166 = _4154;
        if (!_4162)
        {
            _4132 = _4098;
        }
        float _4168 = _4132;
        _4134 = _4168;
        if (!_4162)
        {
            _4164 = _4096;
        }
        float _4170 = _4164;
        _4138 = _4170;
        if (!_4162)
        {
            _4166 = _4100;
        }
        float _4172 = _4166;
        bool _4174 = !_4162;
        _4144 = _4172;
        if (!_4174)
        {
            float _4176 = rsqrt(_4152);
            float _4178 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4180 = _209 * _4176;
            float _4182 = _207 * _4176;
            float _4184 = _4158 * _4180;
            float _4186 = _211 * _4176;
            float _4188 = fma(_4156, _4182, _4184);
            float _4190 = _4178 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4192 = fma(_4160, _4186, _4188);
            float _4194 = _4192 * _4190;
            float _4196 = fma(_207, _4194, _4098);
            float _4198 = fma(_209, _4194, _4096);
            float _4200 = fma(_211, _4194, _4100);
            _4138 = _4198;
            _4134 = _4196;
            _4144 = _4200;
        }
    }
    float _4202 = _4138;
    float _4204 = _4134;
    float _4206 = _4144;
    float _4208 = -_3182;
    float _4210 = _4208 + _4202;
    float _4212 = -_3184;
    float _4214 = _4212 + _4204;
    float _4216 = -_3542;
    float _4218 = _4216 + _4206;
    float _4220 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4222 = _4210 + _4220;
    float _4224 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4226 = _4214 + _4224;
    float _4228 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4230 = _4218 + _4228;
    float _4232 = _4222 * _4222;
    float _4234 = fma(_3570, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4236 = fma(_4226, _4226, _4232);
    float _4238 = floor(_4234);
    float _4240 = fma(_3592, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4242 = fma(_4230, _4230, _4236);
    float _4244 = rsqrt(_4242);
    float _4246 = sqrt(_4242);
    float _4248 = -_4238;
    float _4250 = _4234 + _4248;
    float _4252 = _4244 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4254 = floor(_4240);
    float _4256 = _4226 * _4252;
    float _4258 = _4230 * _4252;
    float _4260 = _4256 * _4256;
    float _4262 = _4258 * _4258;
    float _4264 = _4260 + _4262;
    float _4266 = sqrt(_4264);
    bool _4268 = _4266 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4270 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4272 = _4266 + _4270;
    float _4274 = _4230;
    float _4276 = _4264;
    float _4278 = _4272;
    float _4280 = _4222;
    float _4282 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_4268)
    {
        float _4284 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4274 = _4284;
    }
    float _4286 = _4274;
    if (_4268)
    {
        float _4288 = rsqrt(_4264);
        _4276 = _4288;
    }
    float _4290 = _4276;
    if (_4268)
    {
        float _4292 = _4272 * _4286;
        _4278 = _4292;
    }
    float _4294 = _4278;
    if (_4268)
    {
        float _4296 = _4294 * 0.15915493667125701904296875;
        _223 = _4296;
    }
    float _4298 = _223;
    float _4300 = _4236;
    float _4302 = _4298;
    if (_4268)
    {
        float _4304 = _4298 * 6.283185482025146484375;
        float _4306 = sin(_4304);
        _4300 = _4306;
    }
    float _4308 = _4300;
    float _4310 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4312 = precise::max(0.0, _4310);
    float _4314 = _4244;
    float _4316 = _4312;
    float _4318 = _4310;
    if (_4268)
    {
        float _4320 = _4298 * 6.283185482025146484375;
        float _4322 = cos(_4320);
        _4314 = _4322;
    }
    float _4324 = _4314;
    float _4326 = -_4252;
    float _4328 = -_4312;
    float _4330 = fma(_4222, _4326, _4328);
    if (!_4268)
    {
        _4280 = _4256;
    }
    float _4332 = _4280;
    float _4334 = _4332;
    if (_4268)
    {
        float _4336 = _4330 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4316 = _4336;
    }
    float _4338 = _4316;
    float _4340 = _4308;
    float _4342 = _4338;
    if (_4268)
    {
        float _4344 = fma(_4308, _4338, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4340 = _4344;
    }
    float _4346 = _4340;
    float _4348 = _4346;
    if (!_4268)
    {
        _4342 = _4330;
    }
    float _4350 = _4342;
    float _4352 = _4350;
    float _4354 = _4324;
    if (_4268)
    {
        float _4356 = _4324 + (-1.0);
        _4318 = _4356;
    }
    float _4358 = _4318;
    float _4360 = _4358;
    if (_4268)
    {
        float _4362 = _4290 * _4346;
        _4282 = _4362;
    }
    float _4364 = _4282;
    if (!_4268)
    {
        _4348 = _4260;
    }
    float _4366 = _4348;
    float _4368 = _4210 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4370 = _4366;
    if (_4268)
    {
        float _4372 = _4358 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4302 = _4372;
    }
    float _4374 = _4302;
    if (_4268)
    {
        float _4376 = _4256 * _4364;
        _4334 = _4376;
    }
    float _4378 = _4334;
    if (!_4268)
    {
        _4360 = _4258;
    }
    float _4380 = _4360;
    float _4382 = _4380;
    if (_4268)
    {
        float _4384 = _4258 * _4364;
        _4382 = _4384;
    }
    float _4386 = _4382;
    if (_4268)
    {
        float _4388 = fma(_4330, _4324, _4374);
        _4352 = _4388;
    }
    float _4390 = _4352;
    if (_4268)
    {
        float _4392 = _4378 * _4378;
        _4370 = _4392;
    }
    float _4394 = _4370;
    if (!_4268)
    {
        _4354 = _4262;
    }
    float _4396 = _4354;
    float _4398 = _4396;
    if (_4268)
    {
        float _4400 = _4386 * _4386;
        _4398 = _4400;
    }
    float _4402 = _4398;
    float _4404 = _4210 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4406 = fma(_4390, _4390, _4394);
    float _4408 = fma(_4214, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4368);
    float _4410 = _4210 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4412 = fma(_4214, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4404);
    float _4414 = _4406 + _4402;
    float _4416 = _4210 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4418 = fma(_4218, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4408);
    float _4420 = fma(_4218, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4412);
    float _4422 = rsqrt(_4414);
    float _4424 = fma(_4214, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4416);
    float _4426 = _4418 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4428 = _4420 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4430 = fma(_4218, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4424);
    float _4432 = fma(_4214, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4410);
    float _4434 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4436 = fma(_4246, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4434);
    float _4438 = precise::clamp(_4436, 0.0, 1.0);
    float _4440 = _4430 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4442 = _4426 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4444 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4446 = _4428 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4448 = fma(_4218, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4432);
    float _4450 = fma(_4440, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4442);
    float _4452 = -_4438;
    float _4454 = _4452 + 1.0;
    float _4456 = -_4446;
    float _4458 = fma(_4456, _4444, 1.0);
    float _4460 = _4448 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4462 = fma(_4428, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4450);
    float _4464 = _4422 * _4378;
    float _4466 = _4422 * _4386;
    float _4468 = abs(_4454);
    float _4470 = log2(_4468);
    float _4472 = fma(_4460, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4462);
    float _4474 = _4422 * _4390;
    float _4476 = _4464 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4478 = _4426 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4480 = -_4254;
    float _4482 = _4240 + _4480;
    float _4484 = _4474 + 1.0;
    float _4486 = -_4476;
    float _4488 = fma(_4474, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4486);
    float _4490 = log2(_4458);
    float _4492 = fma(_4440, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4478);
    float _4494 = -_4466;
    float _4496 = fma(_4494, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4488);
    float _4498 = _4426 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4500 = fma(_4496, -0.5, 0.5);
    float _4502 = _4470 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4504 = 1.0 / _4472;
    float _4506 = fma(_4496, 0.5, 0.5);
    float _4508 = fma(_4440, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4498);
    float _4510 = fma(_4506, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4512 = fma(_4428, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4492);
    float _4514 = exp2(_4502);
    float _4516 = fma(_4506, _4510, -0.212114393711090087890625);
    float _4518 = fma(_4460, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4512);
    float _4520 = _4490 * 0.693147182464599609375;
    float _4522 = fma(_4506, _4516, 1.570728778839111328125);
    float _4524 = _4520 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4526 = sqrt(_4500);
    float _4528 = fma(_4428, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4508);
    float _4530 = _4518 * _4504;
    float _4532 = fma(_4460, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4528);
    float _4534 = fma(_4530, -0.5, 0.5);
    float _4536 = -_4474;
    float _4538 = fma(_4514, _4484, _4536);
    float _4540 = _4532 * _4504;
    float _4542 = fma(_4538, 0.5, 0.5);
    float _4544 = fma(_4540, 0.5, 0.5);
    float _4546 = _4526 * 0.636619746685028076171875;
    float2 _11869 = float2(_4250, _4482);
    float _4548 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11869, float2(0.0), isnan(_11869)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11869, float2(0.0), isnan(_11869)), level(0.0)).x;
    float3 _11880 = float3(_4544, _4534, _4524);
    float _4550 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11880, float3(0.0), isnan(_11880)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11880, float3(0.0), isnan(_11880)), level(0.0)).x;
    float3 _11891 = float3(_4544, _4534, _4524);
    float4 _4553 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11891, float3(0.0), isnan(_11891)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11891, float3(0.0), isnan(_11891)), level(0.0)).xyzw;
    float _4555 = _4553.x;
    float _4557 = _4553.y;
    float _4559 = _4553.z;
    float _4561 = _4553.w;
    float _4563 = -_4522;
    float _4565 = fma(_4546, _4563, 1.0);
    float2 _11912 = float2(_4565, _4542);
    float3 _4569 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11912, float2(0.0), isnan(_11912)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11912, float2(0.0), isnan(_11912)), level(0.0)).xyz;
    float _4571 = _4569.x;
    float _4573 = _4569.y;
    float _4575 = _4569.z;
    float _4577 = _3564 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4579 = _3564 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4581 = _4426 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4583 = _4470 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4585 = fma(_3570, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4577);
    float _4587 = fma(_3570, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4579);
    float _4589 = in.m_88.x;
    float _4591 = fma(_3592, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4585);
    float _4593 = fma(_3592, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4587);
    float _4595 = fma(_4440, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4581);
    float _4597 = _4591 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4599 = _4593 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4601 = fma(_4428, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4595);
    float _4603 = 1.0 / _4597;
    float _4605 = _4599 + _4597;
    float _4607 = _4532 + _4472;
    float _4609 = fma(_4460, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4601);
    float _4611 = _4607 * 0.5;
    float _4613 = exp2(_4583);
    float _4615 = _4605 * _4603;
    float _4617 = _4615 * 0.5;
    float _4619 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4621 = fma(_4617, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4619);
    float _4623 = 1.0 / _4621;
    float _4625 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4627 = _4623 * _4625;
    float _4629 = abs(_4627);
    float _4631 = log2(_4629);
    bool _4633 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4635 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4637 = _4633 || _4635;
    bool _4639 = isnan(0.5);
    bool _4641 = _4637 || _4639;
    float _4643 = _4631 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4645 = exp2(_4643);
    float _4647 = fma(_4645, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4649 = precise::clamp(_4647, 0.0, 1.0);
    bool _4651 = _4627 <= 8000.0;
    bool _4653 = isnan(_4627);
    bool _4655 = _4651 || _4653;
    bool _4657 = isnan(8000.0);
    bool _4659 = _4655 || _4657;
    float _4661 = float(_4659);
    float _4663 = fma(_4649, -2.0, 3.0);
    float _4665 = _4649 * _4649;
    float _4667 = _4665 * _4663;
    float _4669 = _4609 + _4472;
    float _4671 = -_4667;
    float _4673 = _4671 + 1.0;
    float _4675 = _4669 * 0.5;
    float _4677 = fma(_4673, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4667);
    float _4679 = _4661 * _4677;
    float _4681 = _4472 * 0.5;
    float _4683 = _4661;
    float _4685 = _4518;
    float _4687 = _4532;
    if (_4641)
    {
        _4683 = 1.0;
    }
    float _4689 = _4683;
    float _4691 = fma(_4518, -0.5, _4681);
    float _4693 = _4689;
    float _4695 = _4557;
    float _4697 = _4555;
    if (!_4641)
    {
        float _4699 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4701 = _4699 * 0.15915493667125701904296875;
        float _4703 = _4701 * 6.283185482025146484375;
        float _4705 = cos(_4703);
        float _4707 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4709 = _4707 * 0.15915493667125701904296875;
        float _4711 = _4701 * 6.283185482025146484375;
        float _4713 = sin(_4711);
        float _4715 = 1.0 / _4705;
        float _4717 = _4709 * 6.283185482025146484375;
        float _4719 = cos(_4717);
        float _4721 = _4713 * _4715;
        float _4723 = _4709 * 6.283185482025146484375;
        float _4725 = sin(_4723);
        float _4727 = _4719 * _4721;
        float _4729 = 1.0 / _4727;
        float _4731 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4733 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4731;
        float _4735 = 1.0 / _4733;
        float _4737 = _4725 * _4729;
        float _4739 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4741 = fma(_4627, _4737, _4739);
        float _4743 = _4741 * _4735;
        float _4745 = precise::clamp(_4743, 0.0, 1.0);
        _4693 = _4745;
    }
    float _4747 = _4693;
    float _4749 = _4679 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4751 = -_4613;
    float _4753 = _4751 + 1.0;
    float _4755 = -_4548;
    float _4757 = _4755 + 1.0;
    out.m_90.x = _4611;
    out.m_90.y = _4691;
    out.m_90.z = _4675;
    out.m_90.w = _4472;
    float _4759 = _4753 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4761 = _4757 * _4749;
    float _4763 = precise::clamp(_4761, 0.0, 1.0);
    bool _4765 = _4246 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4767 = isnan(_4246);
    bool _4769 = _4765 || _4767;
    bool _4771 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4773 = _4769 || _4771;
    out.m_92.x = _4214;
    out.m_92.y = _4210;
    out.m_92.z = _4218;
    float _4775 = _4759 * _4550;
    float _4777 = -_4763;
    float _4779 = fma(_4777, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4781 = -_4759;
    float _4783 = _4781 + 1.0;
    float _4785 = _4561 * _4775;
    float _4787 = _4779 * _4589;
    float _4789 = _4575 * _4775;
    out.gl_Position.x = _4532;
    out.gl_Position.y = _4518;
    out.gl_Position.z = _4609;
    out.gl_Position.w = _4472;
    float _4791 = fma(_4571, _4785, _4555);
    float _4793 = fma(_4573, _4785, _4557);
    float _4795 = _4787 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4797 = _4561 * _4783;
    float _4799 = fma(_4561, _4789, _4559);
    float _4801 = _4747 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4803 = _4785;
    float _4805 = _4783;
    if (!_4773)
    {
        _4695 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4807 = _4695;
    out.m_94.x = _4795;
    float _4809 = _4807;
    float _4811 = _4807;
    if (!_4773)
    {
        _4697 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4813 = _4697;
    float _4815 = _4813;
    float _4817 = _4813;
    if (!_4773)
    {
        _4803 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4819 = _4803;
    out.m_96.x = _4791;
    out.m_96.y = _4793;
    out.m_96.z = _4799;
    out.m_96.w = _4797;
    float _4821 = _4819;
    float _4823 = _4819;
    if (!_4773)
    {
        _4685 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4825 = _4685;
    float _4827 = _4825;
    float _4829 = _4825;
    if (!_4773)
    {
        _4687 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4831 = _4687;
    float _4833 = _4831;
    float _4835 = _4831;
    if (!_4773)
    {
        _4805 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4837 = _4805;
    bool _4839 = !_4773;
    float _4841 = _4837;
    float _4843 = _4837;
    if (!_4839)
    {
        bool _4845 = _4246 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4847 = isnan(_4246);
        bool _4849 = _4845 || _4847;
        bool _4851 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4853 = _4849 || _4851;
        if (!_4853)
        {
            float _4855 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4857 = _4246 + _4855;
            float _4859 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4861 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4859;
            float _4863 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4865 = _4863 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4867 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4869 = _4867 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4871 = 1.0 / _4861;
            float _4873 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4875 = _4873 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4877 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4879 = _4877 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4881 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4883 = _4881 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4885 = _4857 * _4871;
            float _4887 = precise::clamp(_4885, 0.0, 1.0);
            float _4889 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4891 = _4889 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4893 = fma(_4887, _4865, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4895 = fma(_4887, _4869, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4897 = fma(_4887, _4891, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4899 = fma(_4887, _4875, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4901 = fma(_4887, _4879, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4903 = fma(_4887, _4883, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4823 = _4893;
            _4835 = _4901;
            _4817 = _4895;
            _4829 = _4899;
            _4843 = _4897;
            _4811 = _4903;
            _4905 = true;
        }
        else
        {
            bool _4907 = _4246 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4909 = isnan(_4246);
            bool _4911 = _4907 || _4909;
            bool _4913 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4915 = _4911 || _4913;
            if (!_4915)
            {
                _4827 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4917 = _4827;
            _4829 = _4917;
            if (!_4915)
            {
                _4833 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4919 = _4833;
            _4835 = _4919;
            if (!_4915)
            {
                _4809 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4921 = _4809;
            _4811 = _4921;
            if (!_4915)
            {
                _4815 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4923 = _4815;
            _4817 = _4923;
            if (!_4915)
            {
                _4821 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4925 = _4821;
            _4823 = _4925;
            if (!_4915)
            {
                _4841 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4927 = _4841;
            bool _4929 = !_4915;
            _4843 = _4927;
            if (!_4929)
            {
                bool _4931 = _4246 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4933 = isnan(_4246);
                bool _4935 = _4931 || _4933;
                bool _4937 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4939 = _4935 || _4937;
                if (!_4939)
                {
                    float _4941 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4943 = _4246 + _4941;
                    float _4945 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4947 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4945;
                    float _4949 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4951 = _4949 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4953 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4955 = _4953 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4957 = 1.0 / _4947;
                    float _4959 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4961 = _4959 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4963 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4965 = _4963 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4967 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4969 = _4967 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4971 = _4943 * _4957;
                    float _4973 = precise::clamp(_4971, 0.0, 1.0);
                    float _4975 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4977 = _4975 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4979 = fma(_4973, _4951, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4981 = fma(_4973, _4955, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4983 = fma(_4973, _4977, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4985 = fma(_4973, _4961, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4987 = fma(_4973, _4965, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4989 = fma(_4973, _4969, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4823 = _4979;
                    _4835 = _4987;
                    _4817 = _4981;
                    _4829 = _4985;
                    _4843 = _4983;
                    _4811 = _4989;
                    _4905 = true;
                }
                else
                {
                    _4823 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4835 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4817 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4829 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4843 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4811 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4905 = false;
    float _4991 = _4823;
    float _4993 = _4835;
    float _4995 = _4817;
    float _4997 = _4829;
    float _4999 = _4843;
    float _5001 = _4811;
    float _5003 = fma(_4002, -0.5, 0.5);
    float _5005 = precise::clamp(_5003, 0.0, 1.0);
    float _5007 = -_4991;
    float _5009 = _4993 + _5007;
    float _5011 = _4801 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5013 = -_4995;
    float _5015 = _4997 + _5013;
    float _5017 = fma(_5005, _5009, _4991);
    out.m_98.x = 0.0;
    float _5019 = -_4999;
    float _5021 = _5001 + _5019;
    float _5023 = fma(_5005, _5015, _4995);
    float _5025 = _5017 * 0.586610972881317138671875;
    out.m_55.x = _5011;
    bool _5027 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5029 = fma(_5005, _5021, _4999);
    float _5031 = fma(_5023, 0.298911988735198974609375, _5025);
    bool _5033 = _4747 > 0.0;
    bool _5035 = isnan(_4747);
    bool _5037 = _5033 || _5035;
    bool _5039 = isnan(0.0);
    bool _5041 = _5037 || _5039;
    float _5043 = fma(_5029, 0.114477999508380889892578125, _5031);
    float _5045 = -_5043;
    float _5047 = _5023 + _5045;
    float _5049 = -_5043;
    float _5051 = _5017 + _5049;
    float _5053 = -_5043;
    float _5055 = _5029 + _5053;
    float _5057 = fma(_5047, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5043);
    float _5059 = fma(_5051, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5043);
    float _5061 = fma(_5055, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5043);
    bool _5063 = !_5027;
    if (!_5063)
    {
        float _5065 = -_4210;
        float _5067 = _5065 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5069 = -_4214;
        float _5071 = _5069 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5073 = -_4218;
        float _5075 = _5073 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5077 = _5067 * _5067;
        float _5079 = fma(_5071, _5071, _5077);
        float _5081 = fma(_5075, _5075, _5079);
        float _5083 = sqrt(_5081);
        float _5085 = rsqrt(_5081);
        float _5087 = -_5083;
        float _5089 = _5087 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5091 = _5089 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5093 = precise::clamp(_5091, 0.0, 1.0);
        float _5095 = _5071 * _5085;
        float _5097 = _5067 * _5085;
        float _5099 = abs(_5093);
        float _5101 = log2(_5099);
        float _5103 = _5075 * _5085;
        float _5105 = _5095 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5107 = _4002 * _5097;
        float _5109 = -_5097;
        float _5111 = -_5105;
        float _5113 = fma(_5109, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5111);
        float _5115 = fma(_4000, _5095, _5107);
        float _5117 = -_5103;
        float _5119 = fma(_5117, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5113);
        float _5121 = fma(_4004, _5103, _5115);
        float _5123 = precise::clamp(_5121, 0.0, 1.0);
        float _5125 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5127 = _5119 + _5125;
        float _5129 = _5101 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5131 = _5127 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5133 = precise::clamp(_5131, 0.0, 1.0);
        float _5135 = exp2(_5129);
        float _5137 = _5135 * _5133;
        float _5139 = _5123 * _5137;
        float _5141 = _5139 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5143 = _5139 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5145 = _5139 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_98.x = _5141;
        out.m_98.y = _5143;
        out.m_98.z = _5145;
    }
    out.m_100.x = _5057;
    out.m_100.y = _5059;
    out.m_100.z = _5061;
    if (_5041)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_55.x = 0.0;
    float _5147 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5147;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

