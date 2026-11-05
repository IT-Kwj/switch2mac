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
    float4 m_102 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_78 [[user(locn5)]];
    float4 m_94 [[user(locn6)]];
    float4 m_76 [[user(locn7)]];
    float4 m_84 [[user(locn8)]];
    float4 m_74 [[user(locn9)]];
    float4 m_82 [[user(locn10)]];
    float4 m_88 [[user(locn11)]];
    float4 m_90 [[user(locn12)]];
    float4 m_86 [[user(locn13)]];
    float4 m_100 [[user(locn14)]];
    float4 m_96 [[user(locn15)]];
    float4 m_98 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_92 [[attribute(0)]];
    float4 m_72 [[attribute(1)]];
    float4 m_68 [[attribute(2)]];
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
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4837 = false;
    bool _4092 = false;
    bool _597 = false;
    bool _453 = false;
    bool _219 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_48.w;
    float _118 = in.m_50.w;
    float _120 = trunc(_116);
    int _123 = int(_120);
    float _125 = -_118;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _127;
    bool _131 = _123 >= 1;
    float _133 = 0.0;
    float _135 = _118;
    float _137 = _127;
    if (!_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _133;
    if (!_131)
    {
        out.m_55.x = 0.0;
    }
    int _141 = 0;
    if (!_131)
    {
        float _143 = _139 * 5.0;
        _141 = as_type<int>(_143);
    }
    int _145 = _141;
    if (!_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5146 = as_type<float>(_145);
        out.gl_Position.z = _5146;
    }
    if (!_131)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _147 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _149 = isnan(_118);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _155 = _151 || _153;
    float _157 = float(_123);
    bool _159 = _127 >= _157;
    bool _161 = !_155;
    bool _163 = _159 || _161;
    float _165 = 1.0 / _157;
    if (_163)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _135;
    if (_163)
    {
        out.m_55.x = 0.0;
    }
    float _169 = _127 * _165;
    int _171 = 0;
    float _173 = _169;
    if (_163)
    {
        float _175 = _167 * 5.0;
        _171 = as_type<int>(_175);
    }
    int _177 = _171;
    out.m_53.x = _169;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5209 = as_type<float>(_177);
        out.gl_Position.z = _5209;
    }
    if (_163)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _183 = as_type<int>(_179) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_179) & 2;
    bool _189 = _187 != 0;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_181;
    float _217;
    if (!_199)
    {
        float _201 = in.m_60.x;
        float _203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _205 = _201 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _207 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _209 = _207 * _203;
        float _211 = floor(_209);
        float _213 = -_211;
        float _215 = _209 + _213;
        _217 = _215;
        _219 = true;
    }
    else
    {
        _217 = _169;
    }
    _219 = false;
    float _221 = _217;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _225 = _221 + _223;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _229 = _221 + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _233 = _221 + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _241 = _239 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _243;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _249 = _247 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _251 = 1.0 / _237;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _255 = 1.0 / _245;
    float _257 = 1.0 / _249;
    float _259 = _225 * _251;
    bool _261 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _263 = isnan(_221);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    float _273 = -_271;
    float _275 = _273 + 1.0;
    float _277 = 1.0 / _241;
    float _279 = _229 * _255;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _283 = _221 + _281;
    bool _285 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _287 = isnan(_221);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _297;
    float _301 = _233 * _257;
    float _303 = fma(_299, _279, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _305 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _307 = isnan(_221);
    bool _309 = _305 || _307;
    bool _311 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _313 = _309 || _311;
    float _315 = float(_313);
    float _317 = _283 * _277;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _319;
    float _323 = _315 * _275;
    bool _325 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _327 = isnan(_221);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = -_315;
    float _339 = _337 + 1.0;
    float _341 = fma(_321, _279, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _343 = -_295;
    float _345 = _343 + 1.0;
    bool _347 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _349 = isnan(_221);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _361 = _359 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _363 = _295 * _339;
    float _365 = _335 * _345;
    float _367 = -_335;
    float _369 = _367 + 1.0;
    float _371 = -_357;
    float _373 = _371 + 1.0;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _377 = _375 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _379 = fma(_361, _301, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _381 = _357 * _369;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _383;
    float _387 = fma(_377, _301, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _389;
    float _393 = _341 * _381;
    float _395 = _303 * _381;
    float _397 = fma(_385, _259, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _399 = fma(_391, _259, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _401 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].x, _393);
    float _403 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].y, _395);
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _413 = fma(_379, _365, _401);
    float _415 = fma(_387, _365, _403);
    float _417 = fma(_407, _317, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _419 = fma(_411, _317, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _421 = fma(_397, _363, _413);
    float _423 = fma(_399, _363, _415);
    float _425 = fma(_417, _323, _421);
    float _427 = fma(_419, _323, _423);
    float _429 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[147].x, _425);
    float _431 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[147].y, _427);
    bool _433 = !_253;
    float _451;
    if (!_433)
    {
        float _435 = in.m_60.x;
        float _437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _439 = _435 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _441 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _443 = _441 * _437;
        float _445 = floor(_443);
        float _447 = -_445;
        float _449 = _443 + _447;
        _451 = _449;
        _453 = true;
    }
    else
    {
        _451 = _169;
    }
    _453 = false;
    float _455 = _451;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _459 = _455 + _457;
    float _461 = in.m_62.x;
    float _463 = in.m_62.y;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _469 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _471 = isnan(_455);
    bool _473 = _469 || _471;
    bool _475 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _477 = _473 || _475;
    float _479 = float(_477);
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _485 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _487 = isnan(_455);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _497;
    bool _501 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _503 = isnan(_455);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    float _513 = 1.0 / _467;
    float _515 = -_479;
    float _517 = _515 + 1.0;
    bool _519 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _521 = _495 * _517;
    float _523 = -_495;
    float _525 = _523 + 1.0;
    float _527 = 1.0 / _483;
    float _529 = _499 * _513;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _535 = _431 * _463;
    float _537 = _429 * _461;
    float _539 = fma(_529, _459, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _541 = -_511;
    float _543 = _541 + 1.0;
    float _545 = _539 * _521;
    float _547 = _533 * _527;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _551 = _455 + _549;
    float _553 = _479 * _543;
    float _555 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[115].x, _545);
    float _557 = fma(_547, _551, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _559 = fma(_557, _553, _555);
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _565 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[117].x, _559);
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _569 = _561 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _571 = _563 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _573 = _565 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _575 = _567 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_64.x = _569;
    out.m_64.y = _571;
    out.m_64.z = _575;
    out.m_64.w = _573;
    bool _577 = !_519;
    float _595;
    if (!_577)
    {
        float _579 = in.m_60.x;
        float _581 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _583 = _579 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _585 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[11].w, _127);
        float _587 = _585 * _581;
        float _589 = floor(_587);
        float _591 = -_589;
        float _593 = _587 + _591;
        _595 = _593;
        _597 = true;
    }
    else
    {
        _595 = _169;
    }
    _597 = false;
    float _599 = _595;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _603 = _599 + _601;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _609 = _599 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _611 = isnan(_599);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _625 = _599 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _627 = isnan(_599);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _637;
    bool _641 = _599 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _643 = isnan(_599);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = 1.0 / _607;
    float _655 = -_619;
    float _657 = _655 + 1.0;
    bool _659 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _661 = _635 * _657;
    float _663 = -_635;
    float _665 = _663 + 1.0;
    float _667 = 1.0 / _623;
    float _669 = _639 * _653;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _675 = fma(_669, _603, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _677 = -_651;
    float _679 = _677 + 1.0;
    float _681 = _675 * _661;
    float _683 = _673 * _667;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _687 = _599 + _685;
    float _689 = _619 * _679;
    float _691 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[131].x, _681);
    float _693 = fma(_683, _687, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _695 = fma(_693, _689, _691);
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _703 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[133].x, _695);
    float _705 = _697 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = _699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = _701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _703 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_66.x = _705;
    out.m_66.y = _707;
    out.m_66.z = _709;
    out.m_66.w = _711;
    bool _713 = !_659;
    if (!_713)
    {
        float _715 = in.m_60.x;
        float _717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _719 = _715 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _721 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[14].x, _127);
        float _723 = _721 * _717;
        float _725 = floor(_723);
        float _727 = -_725;
        float _729 = _723 + _727;
        _173 = _729;
    }
    float _731 = _173;
    float _733 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _735 = int(_733);
    int _737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _739 = _737 != 0;
    float _741 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _743 = int(_741);
    float _745 = float(_735);
    float _747 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _749 = int(_747);
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_739)
    {
        _751 = 1.0;
    }
    float _753 = _751;
    int _755 = 0;
    float _757 = _753;
    if (_739)
    {
        _755 = 0;
    }
    int _759 = _755;
    float _761 = float(_743);
    float _763 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _765 = int(_763);
    float _767 = 1.0 / _745;
    float _769 = float(uint(_749));
    int _771 = ~_749;
    int _773 = _771 + 1;
    float _775 = 1.0 / _761;
    float _777 = float(uint(_765));
    float _779 = _767 * _127;
    float _781 = 1.0 / _769;
    float _783 = _767;
    float _785 = _761;
    int _787 = _759;
    if (_739)
    {
        float _789 = in.m_60.x;
        float _791 = in.m_60.y;
        _783 = _789;
        _785 = _791;
    }
    float _793 = _783;
    float _795 = _785;
    float _797 = _775 * _127;
    float _799 = 1.0 / _777;
    float _801 = _775;
    if (_739)
    {
        _801 = 1.0;
    }
    float _803 = _801;
    float _805 = trunc(_779);
    int _807 = int(_805);
    int _809 = as_type<int>(_781) + (-2);
    float _811 = trunc(_797);
    int _813 = int(_811);
    int _815 = as_type<int>(_799) + (-2);
    float _817 = 0.0;
    float _819 = _803;
    float _821 = _793;
    float _823 = _795;
    if (_739)
    {
        _817 = _795;
    }
    float _825 = _817;
    float _827 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _829 = int(_827);
    float _831 = float(uint(_807));
    float _833 = as_type<float>(_809) * _831;
    float _835 = _831;
    float _837 = _825;
    if (_739)
    {
        _835 = _793;
    }
    float _839 = _835;
    float _841 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _843 = int(_841);
    float _845 = float(uint(_813));
    float _847 = 0.0;
    int _849 = as_type<int>(_845);
    float _851 = _839;
    if (_739)
    {
        _847 = _839;
    }
    float _853 = _847;
    float _855 = as_type<float>(_815) * _845;
    float _857 = _853;
    if (_739)
    {
        _849 = 0;
    }
    int _859 = _849;
    float _861 = trunc(_833);
    float _863 = precise::max(_861, 0.0);
    uint _866 = uint(_863);
    float _868 = float(uint(_829));
    float _870 = 1.0 / _868;
    float _872 = float(_843);
    float _874 = trunc(_855);
    float _876 = precise::max(_874, 0.0);
    uint _878 = uint(_876);
    float _880 = 1.0 / _872;
    float _882 = _872;
    int _884 = _859;
    if (_739)
    {
        _882 = _839;
    }
    float _886 = _882;
    float _888 = _886;
    if (!_739)
    {
        float _890 = in.m_60.x;
        float _892 = in.m_60.y;
        float _894 = in.m_60.z;
        float _896 = _890 * 3.1415927410125732421875;
        float _898 = _896 * 0.15915493667125701904296875;
        float _900 = _892 * 3.1415927410125732421875;
        float _902 = _900 * 0.15915493667125701904296875;
        float _904 = _898 * 6.283185482025146484375;
        float _906 = sin(_904);
        float _908 = _902 * 6.283185482025146484375;
        float _910 = sin(_908);
        _819 = 7.345489978790283203125;
        _821 = _890;
        _757 = 5.839270114898681640625;
        _888 = _894;
        _851 = _892;
        _823 = _892;
        _884 = 1;
        _787 = 2;
        _837 = _910;
        _857 = _906;
    }
    float _912 = _819;
    float _914 = _821;
    float _916 = _757;
    float _918 = _888;
    float _920 = _851;
    float _922 = _823;
    int _924 = _884;
    int _926 = _787;
    float _928 = _837;
    float _930 = _857;
    int _932 = _773 * int(_866);
    int _934 = _932 + _807;
    float _936 = _912 * _914;
    float _938 = _880 * _127;
    float _940 = _916 * _918;
    float _942 = in.m_60.z;
    float _944 = in.m_60.w;
    float _946 = float(uint(_934));
    float _948 = floor(_936);
    int _950 = ~_765;
    int _952 = _950 + 1;
    float _954 = _912 * _920;
    float _956 = float(_749);
    float _958 = as_type<float>(_809) * _946;
    float _960 = float(_807);
    int _962 = _952 * int(_878);
    int _964 = _962 + _813;
    int _966 = as_type<int>(_870) + (-2);
    float _968 = floor(_940);
    bool _970 = _960 >= _956;
    bool _972 = isnan(_960);
    bool _974 = _970 || _972;
    bool _976 = isnan(_956);
    bool _978 = _974 || _976;
    float _980 = float(_978);
    float _982 = _922 * 2.0;
    float _984 = float(uint(_964));
    bool _986 = _922 > 0.5;
    int _988 = ~_749;
    int _990 = _988 + 1;
    float _992 = trunc(_938);
    int _994 = int(_992);
    float _996 = -_948;
    float _998 = _936 + _996;
    float _1000 = as_type<float>(_815) * _984;
    float _1002 = -_193;
    int _1004 = _986 ? as_type<int>(_1002) : as_type<int>(_193);
    bool _1006 = _944 > 0.5;
    float _1008 = trunc(_958);
    float _1010 = precise::max(_1008, 0.0);
    uint _1012 = uint(_1010);
    float _1014 = -_968;
    float _1016 = _940 + _1014;
    bool _1018 = _942 > 0.5;
    int _1020 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1022 = _1020 != 0;
    float _1024 = float(_765);
    float _1026 = float(uint(_994));
    float _1028 = trunc(_1000);
    float _1030 = precise::max(_1028, 0.0);
    uint _1032 = uint(_1030);
    int _1034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1036 = _1034 != 0;
    int _1038 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1040 = _1038 != 0;
    int _1042 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1044 = _1042 != 0;
    int _1046 = ~_765;
    int _1048 = _1046 + 1;
    int _1050 = int(_866) + int(_1012);
    float _1052 = as_type<float>(_966) * _1026;
    float _1054 = -_197;
    int _1056 = _1018 ? as_type<int>(_1054) : as_type<int>(_197);
    float _1058 = floor(_954);
    float _1060 = float(_813);
    bool _1062 = !_1044;
    float _1064 = _1062 ? _197 : as_type<float>(_1056);
    bool _1066 = _1060 >= _1024;
    bool _1068 = isnan(_1060);
    bool _1070 = _1066 || _1068;
    bool _1072 = isnan(_1024);
    bool _1074 = _1070 || _1072;
    float _1076 = float(_1074);
    float _1078 = _998 * _956;
    int _1080 = int(_878) + int(_1032);
    float _1082 = trunc(_1052);
    float _1084 = precise::max(_1082, 0.0);
    uint _1086 = uint(_1084);
    int _1088 = ~_829;
    int _1090 = _1088 + 1;
    int _1092 = int(_1006);
    int _1094 = _1018 ? 2 : 0;
    int _1096 = _1092 | _1094;
    int _1098 = _1022 ? 4 : 0;
    int _1100 = _1096 | _1098;
    int _1102 = _1036 ? 8 : 0;
    int _1104 = _1100 | _1102;
    int _1106 = _1040 ? 16 : 0;
    int _1108 = _1104 | _1106;
    int _1110 = _1044 ? 32 : 0;
    int _1112 = _1108 | _1110;
    int _1114 = _986 ? 64 : 0;
    int _1116 = _1112 | _1114;
    int _1118 = _1116 & 64;
    int _1120 = _1048 * _1080;
    int _1122 = _1120 + _813;
    bool _1124 = !_1040;
    float _1126 = _1124 ? _193 : as_type<float>(_1004);
    int _1128 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1130 = _1128 != 0;
    int _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1134 = _1132 != 0;
    int _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1138 = _1136 != 0;
    float _1140 = trunc(_1078);
    int _1142 = int(_1140);
    int _1144 = _990 * _1050;
    int _1146 = _1144 + _807;
    bool _1148 = !_1022;
    int _1150 = _1148 ? 0 : 1;
    float _1152 = -_1058;
    float _1154 = _954 + _1152;
    bool _1156 = !_1134;
    int _1158 = _1156 ? 0 : 1;
    bool _1160 = uint(_1146) >= uint(_749);
    int _1162 = _1090 * int(_1086);
    int _1164 = _1162 + _994;
    bool _1166 = uint(_1122) >= uint(_765);
    float _1168 = trunc(_980);
    int _1170 = int(_1168);
    bool _1172 = !_1130;
    int _1174 = _1172 ? 0 : 1;
    float _1176 = float(uint(_1164));
    int _1178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1180 = _1178 != 0;
    bool _1182 = !_1160;
    int _1184 = _1182 ? 0 : (-1);
    float _1186 = trunc(_1076);
    int _1188 = int(_1186);
    float _1190 = as_type<float>(_966) * _1176;
    bool _1192 = !_1138;
    int _1194 = _1192 ? 0 : 1;
    bool _1196 = !_1180;
    int _1198 = _1196 ? 0 : 1;
    int _1200 = abs(_1150);
    int _1202 = ~_1050;
    int _1204 = _1202 + _1184;
    int _1206 = _1204 + 1;
    float _1208 = _1016 * _1024;
    bool _1210 = !_1166;
    int _1212 = _1210 ? 0 : (-1);
    float _1214 = trunc(_1190);
    float _1216 = precise::max(_1214, 0.0);
    uint _1218 = uint(_1216);
    int _1220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1222 = _1220 != 0;
    int _1224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1226 = _1224 != 0;
    int _1228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1230 = _1228 != 0;
    int _1232 = _1142 * _1200;
    int _1234 = _1232 + _807;
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1238 = _1236 != 0;
    int _1240 = _749 * _1206;
    int _1242 = _1240 + _807;
    int _1244 = ~_1080;
    int _1246 = _1244 + _1212;
    int _1248 = _1246 + 1;
    bool _1250 = !_1238;
    int _1252 = _1250 ? 0 : 1;
    float _1254 = trunc(_1208);
    int _1256 = int(_1254);
    float _1258 = _165 * _127;
    bool _1260 = _749 == 0;
    int _1262 = _765 * _1248;
    int _1264 = _1262 + _813;
    int _1266 = ~_1170;
    int _1268 = _1266 + 1;
    int _1270 = _1268 + 1;
    float _1272 = _956 * _1258;
    bool _1274 = !_1260;
    int _1276 = _1274 ? _1242 : (-1);
    float _1278 = _1024 * _1258;
    int _1280 = _749 + (-1);
    bool _1282 = !_1222;
    int _1284 = _1282 ? 0 : 1;
    float _1286 = trunc(_1272);
    int _1288 = int(_1286);
    int _1290 = _1276 * _1270;
    int _1292 = abs(_1158);
    bool _1294 = _765 == 0;
    int _1296 = _1170 * _1280;
    int _1298 = _1296 + _1290;
    int _1300 = ~_1188;
    int _1302 = _1300 + 1;
    int _1304 = _1302 + 1;
    bool _1306 = !_1294;
    int _1308 = _1306 ? _1264 : (-1);
    int _1310 = _1298 * _1292;
    int _1312 = abs(_1174);
    float _1314 = trunc(_1278);
    int _1316 = int(_1314);
    int _1318 = abs(_1194);
    int _1320 = _1308 * _1304;
    int _1322 = abs(_1252);
    int _1324 = abs(_1198);
    int _1326 = _1288 * _1312;
    int _1328 = _1326 + _1310;
    bool _1330 = !_1226;
    int _1332 = _1330 ? 0 : 1;
    int _1334 = _1256 * _1322;
    int _1336 = _1334 + _813;
    int _1338 = _765 + (-1);
    int _1340 = abs(_1332);
    int _1342 = _1188 * _1338;
    int _1344 = _1342 + _1320;
    int _1346 = abs(_1284);
    int _1348 = _1234 * _1318;
    int _1350 = _1348 + _1328;
    int _1352 = int(_1086) + int(_1218);
    int _1354 = _1344 * _1340;
    int _1356 = ~_829;
    int _1358 = _1356 + 1;
    int _1360 = _1142 * _1324;
    int _1362 = _1360 + _1350;
    bool _1364 = _1118 != 0;
    int _1366 = _1358 * _1352;
    int _1368 = _1366 + _994;
    float _1370 = -_197;
    int _1372 = _1006 ? as_type<int>(_1370) : as_type<int>(_197);
    int _1374 = _1316 * _1346;
    int _1376 = _1374 + _1354;
    float _1378 = float(_829);
    float _1380 = -_193;
    int _1382 = _1018 ? as_type<int>(_1380) : as_type<int>(_193);
    float _1384 = float(_994);
    float _1386 = _1378 * _1258;
    float _1388 = float(uint(_1362));
    bool _1390 = uint(_1368) >= uint(_829);
    int _1392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1394 = _1392 != 0;
    float _1396 = as_type<float>(_809) * _1388;
    bool _1398 = !_1230;
    int _1400 = _1398 ? 0 : 1;
    float _1402 = trunc(_1386);
    int _1404 = int(_1402);
    bool _1406 = _1384 >= _1378;
    bool _1408 = isnan(_1384);
    bool _1410 = _1406 || _1408;
    bool _1412 = isnan(_1378);
    bool _1414 = _1410 || _1412;
    float _1416 = float(_1414);
    float _1418 = _1154 * _1378;
    bool _1420 = !_1394;
    int _1422 = _1420 ? 0 : 1;
    int _1424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1426 = _1424 != 0;
    int _1428 = abs(_1400);
    float _1430 = trunc(_1396);
    float _1432 = precise::max(_1430, 0.0);
    uint _1434 = uint(_1432);
    bool _1436 = !_1036;
    float _1438 = _1436 ? _197 : as_type<float>(_1372);
    int _1440 = abs(_1422);
    bool _1442 = !_1390;
    int _1444 = _1442 ? 0 : (-1);
    bool _1446 = !_1426;
    int _1448 = _1446 ? 0 : 1;
    float _1450 = trunc(_1416);
    int _1452 = int(_1450);
    int _1454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1456 = _1454 != 0;
    int _1458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1460 = _1458 != 0;
    int _1462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1464 = _1462 != 0;
    int _1466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1468 = _1466 != 0;
    int _1470 = ~_1352;
    int _1472 = _1470 + _1444;
    int _1474 = _1472 + 1;
    int _1476 = _1336 * _1428;
    int _1478 = _1476 + _1376;
    float _1480 = trunc(_1418);
    int _1482 = int(_1480);
    bool _1484 = !_1460;
    int _1486 = _1484 ? 0 : 1;
    int _1488 = _829 * _1474;
    int _1490 = _1488 + _994;
    int _1492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1494 = _1492 != 0;
    int _1496 = _1256 * _1440;
    int _1498 = _1496 + _1478;
    int _1500 = ~_749;
    int _1502 = _1500 + 1;
    bool _1504 = !_1456;
    int _1506 = _1504 ? 0 : 1;
    float _1508 = float(uint(_1498));
    int _1510 = _1502 * int(_1434);
    int _1512 = _1510 + _1362;
    bool _1514 = _829 == 0;
    int _1516 = ~_1452;
    int _1518 = _1516 + 1;
    int _1520 = _1518 + 1;
    float _1522 = as_type<float>(_815) * _1508;
    bool _1524 = !_1514;
    int _1526 = _1524 ? _1490 : (-1);
    float _1528 = as_type<float>(_1256);
    float _1530 = as_type<float>(_1362);
    float _1532 = as_type<float>(_926);
    if (_1494)
    {
        float _1534 = in.m_60.w;
        _1528 = _1534;
    }
    float _1536 = _1528;
    float _1538 = float(uint(_1512));
    int _1540 = abs(_1486);
    int _1542 = _1526 * _1520;
    int _1544 = _829 + (-1);
    float _1546 = as_type<float>(_809) * _1538;
    float _1548 = trunc(_1522);
    float _1550 = precise::max(_1548, 0.0);
    uint _1552 = uint(_1550);
    int _1554 = abs(_1448);
    int _1556 = _1452 * _1544;
    int _1558 = _1556 + _1542;
    int _1560 = abs(_1506);
    int _1562 = _1558 * _1540;
    float _1564 = trunc(_1546);
    float _1566 = precise::max(_1564, 0.0);
    uint _1568 = uint(_1566);
    int _1570 = ~_765;
    int _1572 = _1570 + 1;
    int _1574 = _1404 * _1560;
    int _1576 = _1574 + _1562;
    int _1578 = ~_749;
    int _1580 = _1578 + 1;
    int _1582 = _1482 * _1554;
    int _1584 = _1582 + _994;
    bool _1586 = !_1464;
    int _1588 = _1586 ? 0 : 1;
    float _1590 = as_type<float>(_1554);
    float _1592 = as_type<float>(_1572);
    if (_1494)
    {
        float _1594 = _1536 * 3.1415927410125732421875;
        _1590 = _1594;
    }
    float _1596 = _1590;
    int _1598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1600 = _1598 != 0;
    int _1602 = _1572 * int(_1552);
    int _1604 = _1602 + _1498;
    bool _1606 = _749 == 0;
    if (_1494)
    {
        float _1608 = _1596 * 0.15915493667125701904296875;
        _1592 = _1608;
    }
    float _1610 = _1592;
    bool _1612 = !_1468;
    int _1614 = _1612 ? 0 : 1;
    int _1616 = int(_1434) + int(_1568);
    int _1618 = abs(_1588);
    float _1620 = float(uint(_1604));
    int _1622 = _1580 * _1616;
    int _1624 = _1622 + _1362;
    float _1626 = as_type<float>(_1588);
    if (_1494)
    {
        float _1628 = _1610 * 6.283185482025146484375;
        float _1630 = sin(_1628);
        _1626 = _1630;
    }
    float _1632 = _1626;
    int _1634 = abs(_1614);
    float _1636 = as_type<float>(_815) * _1620;
    bool _1638 = uint(_1624) >= uint(_749);
    int _1640 = _1584 * _1618;
    int _1642 = _1640 + _1576;
    float _1644 = float(uint(_1234));
    float _1646 = as_type<float>(_1618);
    if (_1600)
    {
        float _1648 = in.m_60.x;
        _1646 = _1648;
    }
    float _1650 = _1646;
    float _1652 = trunc(_1636);
    float _1654 = precise::max(_1652, 0.0);
    uint _1656 = uint(_1654);
    bool _1658 = !_1638;
    int _1660 = _1658 ? 0 : (-1);
    float _1662 = as_type<float>(_809) * _1644;
    int _1664 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1666 = _1664 != 0;
    int _1668 = _1482 * _1634;
    int _1670 = _1668 + _1642;
    int _1672 = ~_1616;
    int _1674 = _1672 + _1660;
    int _1676 = _1674 + 1;
    bool _1678 = !_1666;
    float _1680 = _1678 ? _193 : as_type<float>(_1382);
    float _1682 = trunc(_1662);
    float _1684 = precise::max(_1682, 0.0);
    uint _1686 = uint(_1684);
    bool _1688 = _1666;
    if (_1494)
    {
        bool _1690 = _1632 > 0.5;
        _1688 = _1690;
    }
    bool _1692 = _1688;
    int _1694 = _749 * _1676;
    int _1696 = _1694 + _1362;
    float _1698 = float(uint(_1670));
    float _1700 = 0.0;
    if (!_1494)
    {
        _1700 = _193;
    }
    float _1702 = _1700;
    bool _1704 = !_1606;
    int _1706 = _1704 ? _1696 : (-1);
    float _1708 = as_type<float>(_966) * _1698;
    float _1710 = _1702;
    if (_1494)
    {
        float _1712 = -_193;
        float _1714 = _1692 ? _1712 : _193;
        _1710 = _1714;
    }
    float _1716 = _1710;
    int _1718 = _1706 & 3;
    bool _1720 = _1718 != 0;
    float _1722 = trunc(_1708);
    float _1724 = precise::max(_1722, 0.0);
    uint _1726 = uint(_1724);
    int _1728 = ~_749;
    int _1730 = _1728 + 1;
    if (_1600)
    {
        float _1732 = _1650 * 3.1415927410125732421875;
        _1530 = _1732;
    }
    float _1734 = _1530;
    int _1736 = _1706 & 3;
    bool _1738 = _1736 != 0;
    int _1740 = int(_1552) + int(_1656);
    int _1742 = _1730 * int(_1686);
    int _1744 = _1742 + _1234;
    int _1746 = _1720 ? 0 : 1;
    float _1748 = _1734;
    if (_1600)
    {
        float _1750 = _1734 * 0.15915493667125701904296875;
        _1748 = _1750;
    }
    float _1752 = _1748;
    float _1754 = float(uint(_1336));
    bool _1756 = uint(_1736) > 1u;
    int _1758 = ~_829;
    int _1760 = _1758 + 1;
    float _1762 = as_type<float>(_815) * _1754;
    float _1764 = float(uint(_1744));
    float _1766 = _1752;
    if (_1600)
    {
        float _1768 = _1752 * 6.283185482025146484375;
        float _1770 = sin(_1768);
        _1766 = _1770;
    }
    float _1772 = _1766;
    int _1774 = ~_765;
    int _1776 = _1774 + 1;
    float _1778 = as_type<float>(_809) * _1764;
    int _1780 = ~_1746;
    int _1782 = _1780 + 1;
    int _1784 = _1782 + 1;
    int _1786 = _1776 * _1740;
    int _1788 = _1786 + _1498;
    float _1790 = -_197;
    int _1792 = _1364 ? as_type<int>(_1790) : as_type<int>(_197);
    int _1794 = _1760 * int(_1726);
    int _1796 = _1794 + _1670;
    float _1798 = trunc(_1762);
    float _1800 = precise::max(_1798, 0.0);
    uint _1802 = uint(_1800);
    int _1804 = _1784;
    if (!_1756)
    {
        int _1806 = ~_1746;
        int _1808 = _1806 + 1;
        _1804 = _1808;
    }
    int _1810 = _1804;
    int _1812 = ~_765;
    int _1814 = _1812 + 1;
    bool _1816 = uint(_1736) >= 2u;
    float _1818 = float(uint(_1796));
    float _1820 = trunc(_1778);
    float _1822 = precise::max(_1820, 0.0);
    uint _1824 = uint(_1822);
    bool _1826 = uint(_1788) >= uint(_765);
    float _1828 = as_type<float>(_966) * _1818;
    int _1830 = _1816 ? 0 : 1;
    bool _1832 = _1736 != 3;
    float _1834 = trunc(_1828);
    float _1836 = precise::max(_1834, 0.0);
    uint _1838 = uint(_1836);
    bool _1840 = !_1826;
    int _1842 = _1840 ? 0 : (-1);
    int _1844 = _1814 * int(_1802);
    int _1846 = _1844 + _1336;
    int _1848 = ~_1830;
    int _1850 = _1848 + 1;
    int _1852 = _1850 + 1;
    int _1854 = ~_1740;
    int _1856 = _1854 + _1842;
    int _1858 = _1856 + 1;
    float _1860 = float(uint(_1846));
    int _1862 = _765 * _1858;
    int _1864 = _1862 + _1498;
    float _1866 = 0.0;
    int _1868 = _1852;
    bool _1870 = _1832;
    if (!_1600)
    {
        _1866 = _197;
    }
    float _1872 = _1866;
    float _1874 = _1872;
    if (_1832)
    {
        int _1876 = ~_1830;
        int _1878 = _1876 + 1;
        _1868 = _1878;
    }
    int _1880 = _1868;
    float _1882 = as_type<float>(_815) * _1860;
    if (_1600)
    {
        bool _1884 = _1772 > 0.5;
        _1870 = _1884;
    }
    bool _1886 = _1870;
    bool _1888 = !_1294;
    int _1890 = _1888 ? _1864 : (-1);
    int _1892 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1894 = _1892 != 0;
    float _1896 = trunc(_1882);
    float _1898 = precise::max(_1896, 0.0);
    uint _1900 = uint(_1898);
    if (_1600)
    {
        float _1902 = -_197;
        float _1904 = _1886 ? _1902 : _197;
        _1874 = _1904;
    }
    float _1906 = _1874;
    int _1908 = _1890 & 3;
    bool _1910 = _1908 != 0;
    int _1912 = ~_829;
    int _1914 = _1912 + 1;
    bool _1916 = !_1894;
    float _1918 = _1916 ? _197 : as_type<float>(_1792);
    bool _1920 = uint(_1908) > 1u;
    int _1922 = int(_1726) + int(_1838);
    int _1924 = _1890 & 3;
    bool _1926 = _1924 != 0;
    int _1928 = int(_1686) + int(_1824);
    int _1930 = ~_749;
    int _1932 = _1930 + 1;
    int _1934 = _1914 * _1922;
    int _1936 = _1934 + _1670;
    int _1938 = _1926 ? 0 : 1;
    float _1940 = float(uint(_1584));
    int _1942 = _1932 * _1928;
    int _1944 = _1942 + _1234;
    int _1946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1948 = _1946 != 0;
    int _1950 = ~_1938;
    int _1952 = _1950 + 1;
    int _1954 = _1952 + 1;
    float _1956 = as_type<float>(_966) * _1940;
    bool _1958 = !_1948;
    int _1960 = _1958 ? 0 : 1;
    bool _1962 = uint(_1936) >= uint(_829);
    int _1964 = _1954;
    if (!_1920)
    {
        int _1966 = ~_1938;
        int _1968 = _1966 + 1;
        _1964 = _1968;
    }
    int _1970 = _1964;
    float _1972 = trunc(_1956);
    float _1974 = precise::max(_1972, 0.0);
    uint _1976 = uint(_1974);
    bool _1978 = uint(_1944) >= uint(_749);
    bool _1980 = !_1962;
    int _1982 = _1980 ? 0 : (-1);
    bool _1984 = _1908 != 3;
    bool _1986 = !_1978;
    int _1988 = _1986 ? 0 : (-1);
    bool _1990 = uint(_1908) >= 2u;
    int _1992 = ~_1922;
    int _1994 = _1992 + _1982;
    int _1996 = _1994 + 1;
    int _1998 = ~_765;
    int _2000 = _1998 + 1;
    int _2002 = int(_1802) + int(_1900);
    int _2004 = _829 * _1996;
    int _2006 = _2004 + _1670;
    int _2008 = ~_829;
    int _2010 = _2008 + 1;
    int _2012 = _1990 ? 0 : 1;
    int _2014 = _2000 * _2002;
    int _2016 = _2014 + _1336;
    int _2018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2020 = _2018 != 0;
    int _2022 = ~_2012;
    int _2024 = _2022 + 1;
    int _2026 = _2024 + 1;
    int _2028 = _2026;
    if (_1984)
    {
        int _2030 = ~_2012;
        int _2032 = _2030 + 1;
        _2028 = _2032;
    }
    int _2034 = _2028;
    int _2036 = _2010 * int(_1976);
    int _2038 = _2036 + _1584;
    int _2040 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2042 = _2040 != 0;
    bool _2044 = !_2020;
    int _2046 = _2044 ? 0 : 1;
    bool _2048 = uint(_2016) >= uint(_765);
    bool _2050 = !_1514;
    int _2052 = _2050 ? _2006 : (-1);
    float _2054 = in.m_68.x;
    float _2056 = in.m_68.y;
    float _2058 = in.m_68.z;
    bool _2060 = !_2042;
    int _2062 = _2060 ? 0 : 1;
    bool _2064 = !_2048;
    int _2066 = _2064 ? 0 : (-1);
    int _2068 = _2052 & 3;
    bool _2070 = _2068 != 0;
    int _2072 = _2052 & 3;
    bool _2074 = _2072 != 0;
    float _2076 = float(uint(_2038));
    int _2078 = _2070 ? 0 : 1;
    bool _2080 = uint(_2072) > 1u;
    float _2082 = as_type<float>(_966) * _2076;
    int _2084 = ~_2078;
    int _2086 = _2084 + 1;
    int _2088 = _2086 + 1;
    int _2090 = ~_829;
    int _2092 = _2090 + 1;
    float _2094 = trunc(_2082);
    float _2096 = precise::max(_2094, 0.0);
    uint _2098 = uint(_2096);
    float _2100 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2102 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _2104 = _2088;
    if (!_2080)
    {
        int _2106 = ~_2078;
        int _2108 = _2106 + 1;
        _2104 = _2108;
    }
    int _2110 = _2104;
    float _2112 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2114 = uint(_2072) >= 2u;
    int _2116 = _2114 ? 0 : 1;
    bool _2118 = _2072 != 3;
    float _2120 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2122 = int(_1976) + int(_2098);
    float _2124 = in.m_70.x;
    float _2126 = in.m_70.y;
    float _2128 = in.m_70.z;
    int _2130 = ~_2116;
    int _2132 = _2130 + 1;
    int _2134 = _2132 + 1;
    int _2136 = _2092 * _2122;
    int _2138 = _2136 + _1584;
    float _2140 = in.m_72.x;
    float _2142 = in.m_72.y;
    float _2144 = in.m_72.z;
    int _2146 = _2134;
    float _2148 = _2142;
    if (_2118)
    {
        int _2150 = ~_2116;
        int _2152 = _2150 + 1;
        _2146 = _2152;
    }
    int _2154 = _2146;
    float _2156 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _2158 = uint(_2138) >= uint(_829);
    float _2160 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _2162 = !_2158;
    int _2164 = _2162 ? 0 : (-1);
    bool _2166 = _914 > 0.5;
    float _2168 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2170 = -_193;
    int _2172 = _2166 ? as_type<int>(_2170) : as_type<int>(_193);
    bool _2174 = _924 != 1;
    float _2176 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2178 = in.m_48.x;
    float _2180 = in.m_48.y;
    float _2182 = in.m_48.z;
    float _2184 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2176);
    int _2186 = ~_2002;
    int _2188 = _2186 + _2066;
    int _2190 = _2188 + 1;
    float _2192 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2194 = _2192 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _2196 = abs(_1970);
    int _2198 = _765 * _2190;
    int _2200 = _2198 + _1336;
    bool _2202 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2204 = isnan(_731);
    bool _2206 = _2202 || _2204;
    bool _2208 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2210 = _2206 || _2208;
    float _2212 = float(_2210);
    float _2214 = 0.0;
    if (!_2174)
    {
        _2214 = _922;
    }
    float _2216 = _2214;
    float _2218 = 1.0 / _2194;
    float _2220 = 0.0;
    float _2222 = _2216;
    if (!_2174)
    {
        _2220 = _922;
    }
    float _2224 = _2220;
    float _2226 = 0.0;
    float _2228 = _2224;
    if (!_2174)
    {
        _2226 = _942;
    }
    float _2230 = _2226;
    float _2232 = 0.0;
    float _2234 = _2230;
    if (!_2174)
    {
        _2232 = _942;
    }
    float _2236 = _2232;
    float _2238 = _2236;
    if (_2174)
    {
        _2222 = _914;
    }
    float _2240 = _2222;
    if (_2174)
    {
        _2228 = _914;
    }
    float _2242 = _2228;
    if (_2174)
    {
        _2234 = _922;
    }
    float _2244 = _2234;
    float _2246 = _2180 * _2142;
    if (_2174)
    {
        _2238 = _922;
    }
    float _2248 = _2238;
    float _2250 = _2180 * _2056;
    bool _2252 = _926 != 2;
    float _2254 = _2180 * _2126;
    float _2256 = _2244 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2258 = !_1738;
    int _2260 = _2258 ? 0 : 1;
    float _2262 = fma(_2178, _2124, _2254);
    float _2264 = fma(_2256, -2.0, _2168);
    int _2266 = ~_2122;
    int _2268 = _2266 + _2164;
    int _2270 = _2268 + 1;
    float _2272 = fma(_2182, _2128, _2262);
    int _2274 = ~_1928;
    int _2276 = _2274 + _1988;
    int _2278 = _2276 + 1;
    int _2280 = abs(_1810);
    float _2282 = _2272 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    if (_2252)
    {
        _2148 = _914;
    }
    float _2284 = _2148;
    int _2286 = _829 * _2270;
    int _2288 = _2286 + _1584;
    float _2290 = _2284;
    if (_2252)
    {
        _1532 = _922;
    }
    float _2292 = _1532;
    int _2294 = _749 * _2278;
    int _2296 = _2294 + _1234;
    float _2298 = _2292;
    if (!_2252)
    {
        _2290 = _942;
    }
    float _2300 = _2290;
    if (!_2252)
    {
        _2298 = _914;
    }
    float _2302 = _2298;
    int _2304 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2306 = _2304 != 0;
    float _2308 = fma(_2178, _2140, _2246);
    float _2310 = fma(_2178, _2054, _2250);
    float _2312 = _914 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2314 = fma(_2182, _2144, _2308);
    float _2316 = fma(_2182, _2058, _2310);
    float _2318 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2320 = log2(_2318);
    float _2322 = -_2102;
    float _2324 = fma(_2312, 2.0, _2322);
    float _2326 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2328 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2330 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2332 = _922 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2334 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2326);
    float _2336 = _928 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2338 = fma(_2332, -2.0, _2328);
    float _2340 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2342 = fma(_2336, -2.0, _2100);
    float _2344 = _2240 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2346 = fma(_2248, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2330);
    float _2348 = _2320 * _127;
    float _2350 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2340);
    float _2352 = _930 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _2354 = !_2306;
    float _2356 = _2354 ? _193 : as_type<float>(_2172);
    float _2358 = exp2(_2348);
    bool _2360 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2362 = isnan(0.0);
    bool _2364 = _2360 || _2362;
    bool _2366 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2368 = _2364 || _2366;
    float _2370 = -_2112;
    float _2372 = fma(_2344, 2.0, _2370);
    float _2374 = _2300 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2376 = _2302 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2378 = _914 * 2.0;
    float _2380 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2382 = -_2120;
    float _2384 = fma(_2374, 2.0, _2382);
    float _2386 = fma(_2376, -2.0, _2156);
    float _2388 = floor(_2378);
    float _2390 = -_2380;
    float _2392 = fma(_2352, 2.0, _2390);
    float _2394 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2396 = -_2358;
    float _2398 = _2396 + 1.0;
    float _2400 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2402 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2404 = fma(_2242, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2160);
    float _2406 = _2368 ? _2398 : 0.0;
    float _2408 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2394);
    bool _2410 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2412 = isnan(1.0);
    bool _2414 = _2410 || _2412;
    bool _2416 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2418 = _2414 || _2416;
    float _2420 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2422 = 1.0 + _2420;
    float _2424 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2426 = _2424 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2428 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2400);
    float _2430 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2402);
    float _2432 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2434 = _2432 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2436 = 1.0 / _2422;
    float _2438 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2408);
    float _2440 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2350);
    float _2442 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2338);
    float _2444 = -_127;
    float _2446 = fma(_2444, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2392);
    float _2448 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2404);
    float _2450 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2428);
    float _2452 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2430);
    float _2454 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2184);
    float _2456 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2334);
    float _2458 = -_127;
    float _2460 = fma(_2458, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2324);
    float _2462 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2342);
    float _2464 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2346);
    float _2466 = -_127;
    float _2468 = fma(_2466, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2372);
    float _2470 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2264);
    float _2472 = -_127;
    float _2474 = fma(_2472, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2384);
    float _2476 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2386);
    if (_2418)
    {
        float _2478 = _2406 * _2436;
        _137 = _2478;
    }
    float _2480 = _137;
    float _2482 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2484 = _2482 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2486 = 1.0 / _2426;
    float _2488 = _2316 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _2490 = _2388 >= 0.0;
    bool _2492 = isnan(_2388);
    bool _2494 = _2490 || _2492;
    bool _2496 = isnan(0.0);
    bool _2498 = _2494 || _2496;
    float _2500 = _2314 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2502 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2504 = _2502 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _2506 = _2498 ? 0 : 1;
    float _2508 = 1.0 / _2434;
    bool _2510 = _2388 > 0.0;
    float _2512 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2514 = _2512 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2516 = -_2450;
    float _2518 = _2516 + 1.0;
    float _2520 = -_2452;
    float _2522 = _2520 + 1.0;
    float _2524 = floor(_982);
    float _2526 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2528 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2526;
    float _2530 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2532 = _2530 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2534 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2536 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2534;
    float _2538 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2540 = _2538 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _2542 = _1890 >> 31;
    float _2544 = _2532 * _2486;
    int _2546 = ~_2506;
    int _2548 = _2546 + 1;
    int _2550 = _2548 + 1;
    float _2552 = 1.0 / _2484;
    float _2554 = _2536 * _2508;
    int _2556 = _2550;
    if (!_2510)
    {
        int _2558 = ~_2506;
        int _2560 = _2558 + 1;
        _2556 = _2560;
    }
    int _2562 = _2556;
    float _2564 = -_2212;
    float _2566 = _2564 + 1.0;
    float _2568 = -_2454;
    float _2570 = _2568 + 1.0;
    int _2572 = abs(_2110);
    float _2574 = 1.0 / _2504;
    bool _2576 = _2524 >= 0.0;
    bool _2578 = isnan(_2524);
    bool _2580 = _2576 || _2578;
    bool _2582 = isnan(0.0);
    bool _2584 = _2580 || _2582;
    float _2586 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2588 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2586;
    float _2590 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2592 = _2590 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _2594 = ~_2572;
    int _2596 = _2594 + 1;
    int _2598 = _2596 + 1;
    int _2600 = _2584 ? 0 : 1;
    float _2602 = _2592 * _2218;
    float _2604 = 1.0 / _2514;
    float _2606 = _2528 * _2552;
    float _2608 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2610 = _2608 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _2612 = _2524 > 0.0;
    float _2614 = _942 * 2.0;
    bool _2616 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2618 = isnan(_731);
    bool _2620 = _2616 || _2618;
    bool _2622 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2624 = _2620 || _2622;
    float _2626 = float(_2624);
    int _2628 = abs(_2260);
    float _2630 = 1.0 / _2540;
    float _2632 = _2610 * _2574;
    int _2634 = abs(_2154);
    int _2636 = abs(_1960);
    float _2638 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2640 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2638;
    float _2642 = _2588 * _2604;
    bool _2644 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2646 = isnan(_731);
    bool _2648 = _2644 || _2646;
    bool _2650 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2652 = _2648 || _2650;
    float _2654 = float(_2652);
    float _2656 = floor(_2614);
    int _2658 = ~_2600;
    int _2660 = _2658 + 1;
    int _2662 = _2660 + 1;
    int _2664 = _2662;
    if (!_2612)
    {
        int _2666 = ~_2600;
        int _2668 = _2666 + 1;
        _2664 = _2668;
    }
    int _2670 = _2664;
    float _2672 = -_2654;
    float _2674 = _2672 + 1.0;
    bool _2676 = !_1514;
    int _2678 = _2676 ? _2288 : (-1);
    float _2680 = _2640 * _2630;
    float _2682 = _2626 * _2674;
    float _2684 = -_2626;
    float _2686 = _2684 + 1.0;
    bool _2688 = !_1294;
    int _2690 = _2688 ? _2200 : (-1);
    bool _2692 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2694 = isnan(_731);
    bool _2696 = _2692 || _2694;
    bool _2698 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2700 = _2696 || _2698;
    float _2702 = float(_2700);
    float _2704 = _2212 * _2686;
    int _2706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2708 = _2706 != 0;
    int _2710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2712 = _2710 != 0;
    int _2714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2716 = _2714 != 0;
    float _2718 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2720 = _731 + _2718;
    bool _2722 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2724 = isnan(_731);
    bool _2726 = _2722 || _2724;
    bool _2728 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2730 = _2726 || _2728;
    float _2732 = float(_2730);
    float _2734 = _2702 * _2566;
    bool _2736 = _2656 >= 0.0;
    bool _2738 = isnan(_2656);
    bool _2740 = _2736 || _2738;
    bool _2742 = isnan(0.0);
    bool _2744 = _2740 || _2742;
    float _2746 = -_2702;
    float _2748 = _2746 + 1.0;
    bool _2750 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2752 = isnan(_731);
    bool _2754 = _2750 || _2752;
    bool _2756 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2758 = _2754 || _2756;
    float _2760 = float(_2758);
    float _2762 = -_2732;
    float _2764 = _2762 + 1.0;
    int _2766 = _2744 ? 0 : 1;
    float _2768 = _2732 * _2748;
    bool _2770 = _2656 > 0.0;
    float _2772 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2774 = _731 + _2772;
    bool _2776 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2778 = isnan(_731);
    bool _2780 = _2776 || _2778;
    bool _2782 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2784 = _2780 || _2782;
    float _2786 = float(_2784);
    float _2788 = fma(_2606, _2720, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2790 = -_2760;
    float _2792 = _2790 + 1.0;
    float _2794 = _2760 * _2764;
    int _2796 = _2542 & 3;
    float _2798 = fma(_2544, _2774, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _2800 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2802 = isnan(_731);
    bool _2804 = _2800 || _2802;
    bool _2806 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2808 = _2804 || _2806;
    float _2810 = float(_2808);
    float _2812 = _2786 * _2792;
    float _2814 = -_2786;
    float _2816 = _2814 + 1.0;
    int _2818 = _1890 + _2796;
    float _2820 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2822 = _731 + _2820;
    float _2824 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2826 = _731 + _2824;
    float _2828 = _2810 * _2816;
    int _2830 = _2818 >> 2;
    float _2832 = -_2810;
    float _2834 = _2832 + 1.0;
    float _2836 = fma(_2554, _2822, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2838 = _2788 * _2828;
    int _2840 = _2830 << 4;
    int _2842 = _2840 + 656;
    float _2844 = fma(_2632, _2826, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2846 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2848 = _731 + _2846;
    float _2850 = fma(_2834, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2838);
    uint _2852 = uint(int(uint(_2842) >> uint(2)));
    uint _2854 = uint(int(uint(int(_2852)) >> uint(2)));
    int _2856 = int(_2852) & 3;
    float _2858 = (*spvDescriptorSet0.vp_c9)._m0[int(_2854)][_2856];
    int _2860 = int(_2852) + 1;
    uint _2862 = uint(int(uint(_2860) >> uint(2)));
    int _2864 = _2860 & 3;
    float _2866 = (*spvDescriptorSet0.vp_c9)._m0[int(_2862)][_2864];
    float _2868 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2870 = _731 + _2868;
    float _2872 = fma(_2602, _2848, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2874 = fma(_2798, _2812, _2850);
    int _2876 = ~_2766;
    int _2878 = _2876 + 1;
    int _2880 = _2878 + 1;
    float _2882 = fma(_2642, _2870, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _2884 = _2880;
    if (!_2770)
    {
        int _2886 = ~_2766;
        int _2888 = _2886 + 1;
        _2884 = _2888;
    }
    int _2890 = _2884;
    float _2892 = fma(_2836, _2794, _2874);
    float _2894 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2896 = _2488 + _2894;
    int _2898 = _2842 + 8;
    uint _2900 = uint(int(uint(_2898) >> uint(2)));
    uint _2902 = uint(int(uint(int(_2900)) >> uint(2)));
    int _2904 = int(_2900) & 3;
    float _2906 = (*spvDescriptorSet0.vp_c9)._m0[int(_2902)][_2904];
    int _2908 = int(_2900) + 1;
    uint _2910 = uint(int(uint(_2908) >> uint(2)));
    int _2912 = _2908 & 3;
    float _2914 = (*spvDescriptorSet0.vp_c9)._m0[int(_2910)][_2912];
    float _2916 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2918 = _2500 + _2916;
    float _2920 = fma(_2844, _2768, _2892);
    float _2922 = _2896 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2924 = _922 + _914;
    float _2926 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2928 = _731 + _2926;
    bool _2930 = !_1910;
    int _2932 = _2930 ? 0 : 1;
    float _2934 = fma(_2918, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2922);
    float _2936 = _914 + _942;
    float _2938 = _914 + (-0.5);
    float _2940 = fma(_2882, _2734, _2920);
    bool _2942 = _1908 != 3;
    float _2944 = _2924 + (-1.0);
    float _2946 = _922 + _942;
    float _2948 = _922 + (-0.5);
    float _2950 = _1906 + (-0.5);
    int _2952 = abs(_2932);
    float _2954 = fma(_2872, _2704, _2940);
    int _2956 = ~_2196;
    int _2958 = _2956 + 1;
    int _2960 = _2958 + 1;
    float _2962 = -_2950;
    float _2964 = -_2462;
    float _2966 = fma(_2962, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2964);
    float _2968 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2970 = int(_2968);
    float _2972 = fma(_2680, _2928, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2974 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2976 = _2282 + _2974;
    int _2978 = abs(_2034);
    float _2980 = fma(_2944, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2982 = ~_2952;
    int _2984 = _2982 + 1;
    int _2986 = _2984 + 1;
    float _2988 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2934);
    int _2990 = ~_2978;
    int _2992 = _2990 + 1;
    int _2994 = _2992 + 1;
    float _2996 = _2356 + 0.5;
    bool _2998 = !_2942;
    int _3000 = _2998 ? 0 : (-1);
    float _3002 = _1918 + (-0.5);
    bool _3004 = _2988 >= 0.0;
    float _3006 = _1716 + 0.5;
    int _3008 = abs(_3000);
    float _3010 = fma(_2972, _2682, _2954);
    bool _3012 = !_2708;
    int _3014 = _3012 ? 0 : 1;
    float _3016 = fma(_3006, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2446);
    int _3018 = ~_3008;
    int _3020 = _3018 + 1;
    int _3022 = _3020 + 1;
    int _3024 = _2960 * as_type<int>(_2866);
    float _3026 = fma(_2996, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2460);
    float _3028 = -_3002;
    float _3030 = -_2442;
    float _3032 = fma(_3028, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3030);
    int _3034 = abs(_2046);
    int _3036 = _2986 * as_type<int>(_2858);
    int _3038 = _3036 + _3024;
    float _3040 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3042 = _2858;
    if (_3004)
    {
        _3042 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3044 = _3042;
    int _3046 = ~_3034;
    int _3048 = _3046 + 1;
    int _3050 = _3048 + 1;
    int _3052 = _2994 * as_type<int>(_2906);
    int _3054 = _3052 + _3038;
    float _3056 = float(uint(_2970));
    float _3058 = _2896 * _2896;
    int _3060 = as_type<int>(_3044);
    if (_3004)
    {
        float _3062 = _3044 * 5.0;
        _3060 = as_type<int>(_3062);
    }
    int _3064 = _3060;
    int _3066 = _3022 * as_type<int>(_2914);
    int _3068 = _3066 + _3054;
    float _3070 = -_2440;
    float _3072 = _3070 + 1.0;
    float _3074 = -_2456;
    float _3076 = _3074 + 1.0;
    float _3078 = 1.0 / _3056;
    int _3080 = _3068 * _3050;
    float _3082 = fma(_2918, _2918, _3058);
    float _3084 = -_3072;
    float _3086 = fma(_3084, _1716, _3016);
    float _3088 = fma(_3076, _1906, _2966);
    int _3090 = _2690 * _3034;
    int _3092 = _3090 + _3080;
    float _3094 = fma(_2976, _2976, _3082);
    int _3096 = abs(_2970);
    if (_3004)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9441 = as_type<float>(_3064);
        out.gl_Position.z = _9441;
    }
    float _3098 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3100 = _2052 >> 31;
    float _3102 = _3040 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    out.m_74.x = _3086;
    out.m_74.y = _3088;
    float _3104 = float(uint(_3096));
    float _3106 = fma(_2654, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3010);
    int _3108 = _3100 & 3;
    if (_3004)
    {
        out.m_55.x = 0.0;
    }
    float _3110 = rsqrt(_3094);
    int _3112 = _1706 >> 31;
    int _3114 = as_type<int>(_3078) + (-2);
    float _3116 = _1680 + 0.5;
    float _3118 = float(uint(_3092));
    float _3120 = _1438 + (-0.5);
    int _3122 = _3112 & 3;
    float _3124 = 1.0 / _3104;
    float _3126 = _3098 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3128 = as_type<float>(_3114) * _3118;
    float _3130 = fma(_3102, _3116, _2468);
    int _3132 = _1706 + _3122;
    float _3134 = -_3126;
    float _3136 = -_2470;
    float _3138 = fma(_3134, _3120, _3136);
    int _3140 = ~_2970;
    int _3142 = _3140 + 1;
    out.m_76.x = _3106;
    float _3144 = trunc(_3128);
    float _3146 = precise::max(_3144, 0.0);
    uint _3148 = uint(_3146);
    int _3150 = _2052 + _3108;
    float _3152 = _2896 * _3110;
    float _3154 = _2918 * _3110;
    int _3156 = abs(_3092);
    int _3158 = _3150 >> 2;
    float _3160 = -_3152;
    float _3162 = fma(_3160, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2896);
    int _3164 = as_type<int>(_3124) + (-2);
    float _3166 = -_3154;
    float _3168 = fma(_3166, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2918);
    int _3170 = _3158 << 4;
    int _3172 = _3170 + 800;
    float _3174 = _3162 * _3162;
    int _3176 = _3132 >> 2;
    float _3178 = float(uint(_3156));
    uint _3180 = uint(int(uint(_3172) >> uint(2)));
    uint _3182 = uint(int(uint(int(_3180)) >> uint(2)));
    int _3184 = int(_3180) & 3;
    float _3186 = (*spvDescriptorSet0.vp_c9)._m0[int(_3182)][_3184];
    int _3188 = int(_3180) + 1;
    uint _3190 = uint(int(uint(_3188) >> uint(2)));
    int _3192 = _3188 & 3;
    float _3194 = (*spvDescriptorSet0.vp_c9)._m0[int(_3190)][_3192];
    int _3196 = _3142 * int(_3148);
    int _3198 = _3196 + _3092;
    int _3200 = _3176 << 4;
    int _3202 = _3200 + 368;
    float _3204 = fma(_3168, _3168, _3174);
    float _3206 = as_type<float>(_3164) * _3178;
    int _3208 = abs(_3014);
    float _3210 = -_2448;
    float _3212 = _3210 + 1.0;
    float _3214 = float(uint(_3198));
    uint _3216 = uint(int(uint(_3202) >> uint(2)));
    uint _3218 = uint(int(uint(int(_3216)) >> uint(2)));
    int _3220 = int(_3216) & 3;
    float _3222 = (*spvDescriptorSet0.vp_c9)._m0[int(_3218)][_3220];
    int _3224 = int(_3216) + 1;
    uint _3226 = uint(int(uint(_3224) >> uint(2)));
    int _3228 = _3224 & 3;
    float _3230 = (*spvDescriptorSet0.vp_c9)._m0[int(_3226)][_3228];
    float _3232 = -_2438;
    float _3234 = _3232 + 1.0;
    float _3236 = float(_2890);
    float _3238 = trunc(_3206);
    float _3240 = precise::max(_3238, 0.0);
    uint _3242 = uint(_3240);
    float _3244 = as_type<float>(_3114) * _3214;
    float _3246 = -_3234;
    float _3248 = fma(_2356, _3246, _3026);
    float _3250 = -_2464;
    float _3252 = _3250 + 1.0;
    float _3254 = fma(_1918, _2518, _3032);
    int _3256 = ~_3096;
    int _3258 = _3256 + 1;
    float _3260 = -_3212;
    float _3262 = fma(_1680, _3260, _3130);
    float _3264 = fma(_1438, _3252, _3138);
    float _3266 = trunc(_3244);
    float _3268 = precise::max(_3266, 0.0);
    uint _3270 = uint(_3268);
    int _3272 = ~_2970;
    int _3274 = _3272 + 1;
    float _3276 = float(_3208);
    out.m_78.x = _3248;
    out.m_78.y = _3254;
    out.m_78.z = _3262;
    out.m_78.w = _3264;
    bool _3278 = _749 == 0;
    int _3280 = _3258 * int(_3242);
    int _3282 = _3280 + _3156;
    float _3284 = _3276 * _3236;
    bool _3286 = !_3278;
    int _3288 = _3286 ? _2296 : (-1);
    int _3290 = _3202 + 8;
    uint _3292 = uint(int(uint(_3290) >> uint(2)));
    uint _3294 = uint(int(uint(int(_3292)) >> uint(2)));
    int _3296 = int(_3292) & 3;
    float _3298 = (*spvDescriptorSet0.vp_c9)._m0[int(_3294)][_3296];
    int _3300 = int(_3292) + 1;
    uint _3302 = uint(int(uint(_3300) >> uint(2)));
    int _3304 = _3300 & 3;
    float _3306 = (*spvDescriptorSet0.vp_c9)._m0[int(_3302)][_3304];
    float _3308 = float(uint(_3282));
    int _3310 = int(_3148) + int(_3270);
    float _3312 = as_type<float>(_3164) * _3308;
    int _3314 = _3172 + 8;
    uint _3316 = uint(int(uint(_3314) >> uint(2)));
    uint _3318 = uint(int(uint(int(_3316)) >> uint(2)));
    int _3320 = int(_3316) & 3;
    float _3322 = (*spvDescriptorSet0.vp_c9)._m0[int(_3318)][_3320];
    int _3324 = int(_3316) + 1;
    uint _3326 = uint(int(uint(_3324) >> uint(2)));
    int _3328 = _3324 & 3;
    float _3330 = (*spvDescriptorSet0.vp_c9)._m0[int(_3326)][_3328];
    bool _3332 = !_2074;
    int _3334 = _3332 ? 0 : 1;
    int _3336 = _3274 * _3310;
    int _3338 = _3336 + _3092;
    float _3340 = trunc(_3312);
    float _3342 = precise::max(_3340, 0.0);
    uint _3344 = uint(_3342);
    int _3346 = ~_2280;
    int _3348 = _3346 + 1;
    int _3350 = _3348 + 1;
    bool _3352 = _1736 != 3;
    int _3354 = _2598 * as_type<int>(_3194);
    int _3356 = abs(_3334);
    int _3358 = ~_3096;
    int _3360 = _3358 + 1;
    int _3362 = ~_2628;
    int _3364 = _3362 + 1;
    int _3366 = _3364 + 1;
    int _3368 = _3350 * as_type<int>(_3230);
    bool _3370 = !_3352;
    int _3372 = _3370 ? 0 : (-1);
    bool _3374 = uint(_3338) >= uint(_2970);
    int _3376 = _3366 * as_type<int>(_3222);
    int _3378 = _3376 + _3368;
    int _3380 = int(_3242) + int(_3344);
    int _3382 = ~_3356;
    int _3384 = _3382 + 1;
    int _3386 = _3384 + 1;
    bool _3388 = !_3374;
    int _3390 = _3388 ? 0 : (-1);
    int _3392 = _3360 * _3380;
    int _3394 = _3392 + _3156;
    bool _3396 = _2072 != 3;
    int _3398 = _3386 * as_type<int>(_3186);
    int _3400 = _3398 + _3354;
    int _3402 = abs(_1880);
    int _3404 = ~_3310;
    int _3406 = _3404 + _3390;
    int _3408 = _3406 + 1;
    bool _3410 = !_3396;
    int _3412 = _3410 ? 0 : (-1);
    bool _3414 = uint(_3394) >= uint(_3096);
    int _3416 = _2970 * _3408;
    int _3418 = _3416 + _3092;
    int _3420 = ~_3402;
    int _3422 = _3420 + 1;
    int _3424 = _3422 + 1;
    int _3426 = abs(_3372);
    int _3428 = _3424 * as_type<int>(_3298);
    int _3430 = _3428 + _3378;
    int _3432 = _3092 ^ _2970;
    float _3434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3436 = ~_2634;
    int _3438 = _3436 + 1;
    int _3440 = _3438 + 1;
    int _3442 = ~_3426;
    int _3444 = _3442 + 1;
    int _3446 = _3444 + 1;
    bool _3448 = !_3414;
    int _3450 = _3448 ? 0 : (-1);
    int _3452 = _3440 * as_type<int>(_3322);
    int _3454 = _3452 + _3400;
    uint _3456 = uint(int(uint(_3432) >> uint(31)));
    int _3458 = _3446 * as_type<int>(_3306);
    int _3460 = _3458 + _3430;
    int _3462 = abs(_3412);
    float _3464 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3466 = ~_3450;
    int _3468 = _3380 + _3466;
    int _3470 = _3468 + 1;
    int _3472 = ~int(_3456);
    int _3474 = _3472 + 1;
    int _3476 = abs(_2062);
    bool _3478 = _2970 == 0;
    int _3480 = ~_3462;
    int _3482 = _3480 + 1;
    int _3484 = _3482 + 1;
    int _3486 = _3470 ^ _3474;
    int _3488 = ~_2636;
    int _3490 = _3488 + 1;
    int _3492 = _3490 + 1;
    int _3494 = _3484 * as_type<int>(_3330);
    int _3496 = _3494 + _3454;
    bool _3498 = !_3478;
    int _3500 = _3498 ? _3418 : (-1);
    float _3502 = _3464 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3504 = _3460 * _3492;
    bool _3506 = _2970 == 0;
    float _3508 = in.m_80.x;
    float _3510 = in.m_80.y;
    float _3512 = in.m_80.z;
    int _3514 = ~_3474;
    int _3516 = _3514 + _3486;
    int _3518 = _3516 + 1;
    int _3520 = _3288 * _2636;
    int _3522 = _3520 + _3504;
    int _3524 = ~_3476;
    int _3526 = _3524 + 1;
    int _3528 = _3526 + 1;
    bool _3530 = !_3506;
    int _3532 = _3530 ? _3518 : (-1);
    float _3534 = float(_3500);
    int _3536 = _3496 * _3528;
    float _3538 = float(_3532);
    float _3540 = _3434 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3542 = float(_3522);
    float _3544 = fma(_3502, _3534, _2474);
    float _3546 = _1126 + 0.5;
    float _3548 = -_2476;
    float _3550 = fma(_3540, _3538, _3548);
    float _3552 = _1064 + (-0.5);
    int _3554 = _2678 * _3476;
    int _3556 = _3554 + _3536;
    float _3558 = fma(_3502, _3546, _3544);
    out.m_82.x = _3542;
    float _3560 = -_3540;
    float _3562 = fma(_3560, _3552, _3550);
    float _3564 = _3284 * (-2.0);
    float _3566 = -_2522;
    float _3568 = fma(_1126, _3566, _3558);
    float _3570 = float(_3556);
    float _3572 = fma(_1064, _2570, _3562);
    float _3574 = fma(_2980, _3564, _2980);
    float _3576 = fma(_3564, _3508, _3508);
    float _3578 = _2976 * _3110;
    bool _3580 = !_2712;
    int _3582 = _3580 ? 0 : 1;
    out.m_82.w = _3570;
    bool _3584 = !_2716;
    int _3586 = _3584 ? 0 : 1;
    float _3588 = -_3578;
    float _3590 = fma(_3588, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2976);
    int _3592 = abs(_3582);
    out.m_84.x = _3568;
    out.m_84.y = _3572;
    float _3594 = _3512;
    if (_3004)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3596 = -_3152;
    float _3598 = fma(_3596, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2488);
    float _3600 = -_3154;
    float _3602 = fma(_3600, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2500);
    float _3604 = float(_2562);
    float _3606 = _2946 + (-1.0);
    float _3608 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3610 = _3598 + _3608;
    float _3612 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3614 = _3602 + _3612;
    float _3616 = float(_3592);
    float _3618 = fma(_2938, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3576);
    float _3620 = _3610 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3622 = _2936 + (-1.0);
    float _3624 = _3616 * _3604;
    float _3626 = fma(_3614, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3620);
    float _3628 = -_3578;
    float _3630 = fma(_3628, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2282);
    int _3632 = abs(_3586);
    float _3634 = fma(_3606, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3636 = fma(_3574, _2480, _3618);
    float _3638 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3640 = _3630 + _3638;
    float _3642 = float(_2670);
    float _3644 = fma(_3590, _3590, _3204);
    float _3646 = float(_3632);
    float _3648 = fma(_3640, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3626);
    float _3650 = _3624 * (-2.0);
    float _3652 = _3636 * 0.15915493667125701904296875;
    float _3654 = sqrt(_3644);
    float _3656 = _3646 * _3642;
    float _3658 = fma(_3650, _3510, _3510);
    bool _3660 = _3648 >= 0.0;
    float _3662 = fma(_3634, _3650, _3634);
    float _3664 = _3656 * (-2.0);
    float _3666 = fma(_2948, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3658);
    float _3668 = _3652 * 6.283185482025146484375;
    float _3670 = sin(_3668);
    float _3672 = fma(_3664, _3512, _3512);
    float _3674 = fma(_3662, _2480, _3666);
    float _3676 = _942 + (-0.5);
    float _3678 = fma(_3622, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3680 = _3674 * 0.15915493667125701904296875;
    float _3682 = fma(_3676, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3672);
    if (_3660)
    {
        _3594 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3684 = _3594;
    float _3686 = _3652 * 6.283185482025146484375;
    float _3688 = cos(_3686);
    float _3690 = fma(_3678, _3664, _3678);
    int _3692 = as_type<int>(_3684);
    if (_3660)
    {
        out.m_55.x = 0.0;
    }
    if (_3660)
    {
        float _3694 = _3684 * 5.0;
        _3692 = as_type<int>(_3694);
    }
    int _3696 = _3692;
    float _3698 = fma(_3690, _2480, _3682);
    float _3700 = _3680 * 6.283185482025146484375;
    float _3702 = sin(_3700);
    if (_3660)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10342 = as_type<float>(_3696);
        out.gl_Position.z = _10342;
    }
    float _3704 = _3698 * 0.15915493667125701904296875;
    float _3706 = _3680 * 6.283185482025146484375;
    float _3708 = cos(_3706);
    if (_3660)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3710 = _3704 * 6.283185482025146484375;
    float _3712 = cos(_3710);
    float _3714 = _3110 * _3654;
    float _3716 = _535 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3718 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _3720 = _537 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3722 = _3670 * _3702;
    float _3724 = _3714 * _3716;
    float _3726 = _3688 * _3708;
    float _3728 = _3704 * 6.283185482025146484375;
    float _3730 = sin(_3728);
    float _3732 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _3734 = _3718 * _3724;
    float _3736 = _3714 * _3720;
    float _3738 = _3670 * _3708;
    float _3740 = _3688 * _3702;
    float _3742 = _3714 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3744 = _3742 * 0.5;
    float _3746 = _3732 * _3736;
    float _3748 = _3688 * _3712;
    float _3750 = _3670 * _3712;
    float _3752 = _3708 * _3712;
    float _3754 = _3702 * _3712;
    float _3756 = _3748 * _3734;
    float _3758 = _197 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3760 = fma(_3730, _3726, _3722);
    float _3762 = -_3738;
    float _3764 = fma(_3730, _3740, _3762);
    float _3766 = -_3734;
    float _3768 = _3730 * _3766;
    float _3770 = -_3740;
    float _3772 = fma(_3730, _3738, _3770);
    float _3774 = fma(_3760, _3746, _3756);
    float _3776 = _3750 * _3734;
    float _3778 = fma(_3752, _3746, _3768);
    float _3780 = fma(_3730, _3722, _3726);
    float _3782 = fma(_3764, _3744, _3774);
    float _3784 = fma(_3772, _3746, _3776);
    float _3786 = fma(_3754, _3744, _3778);
    float _3788 = _3782 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3790 = _3782 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3792 = fma(_3780, _3744, _3784);
    float _3794 = _3782 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3796 = fma(_3786, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3788);
    float _3798 = fma(_3786, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3790);
    float _3800 = _3760 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3802 = fma(_3786, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3794);
    float _3804 = fma(_3792, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3796);
    float _3806 = fma(_3792, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3798);
    float _3808 = fma(_3758, _3758, 1.0);
    float _3810 = fma(_3792, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3802);
    float _3812 = _3804 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3814 = _3806 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3816 = _3764 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3818 = _3810 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3820 = _2500 + _3812;
    float _3822 = _2282 + _3814;
    float _3824 = _3760 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3826 = _3760 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3828 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3830 = _3820 + _3828;
    float _3832 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3834 = _3822 + _3832;
    float _3836 = fma(_3752, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3824);
    float _3838 = fma(_3752, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3800);
    float _3840 = _3830 * _3830;
    float _3842 = _3834 * _3834;
    float _3844 = fma(_3752, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3826);
    float _3846 = _3748 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3848 = _3748 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3850 = _3840 + _3842;
    float _3852 = _3748 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3854 = -_3730;
    float _3856 = fma(_3854, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3846);
    float _3858 = _3764 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3860 = sqrt(_3850);
    float _3862 = _3764 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3864 = _2488 + _3818;
    float _3866 = -_3730;
    float _3868 = fma(_3866, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3848);
    float _3870 = -_3730;
    float _3872 = fma(_3870, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3852);
    float _3874 = fma(_3754, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3858);
    float _3876 = fma(_3754, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3816);
    float _3878 = fma(_3754, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3862);
    float _3880 = rsqrt(_3808);
    bool _3882 = _3860 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3884 = _3754;
    float _3886 = _3848;
    float _3888 = _3852;
    float _3890 = _3808;
    float _3892 = _3858;
    if (!_3882)
    {
        _3884 = _3842;
    }
    float _3894 = _3884;
    float _3896 = _3894;
    if (!_3882)
    {
        _3886 = _3840;
    }
    float _3898 = _3886;
    float _3900 = _3898;
    if (!_3882)
    {
        _3888 = _3820;
    }
    float _3902 = _3888;
    float _3904 = _3902;
    if (!_3882)
    {
        _3890 = _3822;
    }
    float _3906 = _3890;
    float _3908 = _3906;
    if (!_3882)
    {
        _3892 = _3864;
    }
    float _3910 = _3892;
    bool _3912 = !_3882;
    float _3914 = _3910;
    if (!_3912)
    {
        float _3916 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3918 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3920 = _3860 + _3918;
        float _3922 = rsqrt(_3850);
        float _3924 = _3920 * _3916;
        float _3926 = _3864 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3928 = _3924 * 0.15915493667125701904296875;
        float _3930 = _3928 * 6.283185482025146484375;
        float _3932 = sin(_3930);
        float _3934 = _3928 * 6.283185482025146484375;
        float _3936 = cos(_3934);
        float _3938 = fma(_3932, _3926, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3940 = _3922 * _3938;
        float _3942 = _3936 + (-1.0);
        float _3944 = fma(_3830, _3940, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3946 = fma(_3834, _3940, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3948 = _3942 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3950 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3952 = _3944 + _3950;
        float _3954 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3956 = _3946 + _3954;
        float _3958 = fma(_3864, _3936, _3948);
        float _3960 = _3952 * _3952;
        float _3962 = _3956 * _3956;
        _3914 = _3958;
        _3900 = _3960;
        _3896 = _3962;
        _3904 = _3944;
        _3908 = _3946;
    }
    float _3964 = _3914;
    float _3966 = _3900;
    float _3968 = _3896;
    float _3970 = _3904;
    float _3972 = _3908;
    float _3974 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3976 = _3964 + _3974;
    float _3978 = fma(_3750, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3868);
    float _3980 = fma(_3750, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3856);
    float _3982 = fma(_3750, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3872);
    float _3984 = fma(_3976, _3976, _3966);
    float _3986 = fma(_3780, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3874);
    float _3988 = fma(_3780, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3876);
    float _3990 = fma(_3780, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3878);
    float _3992 = _3984 + _3968;
    float _3994 = fma(_3772, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3836);
    float _3996 = _3758 * _3880;
    float _3998 = fma(_3772, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3838);
    float _4000 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4002 = _3758 * _3978;
    float _4004 = _3758 * _3980;
    float _4006 = fma(_3772, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3844);
    float _4008 = _3758 * _3982;
    float _4010 = -_3986;
    float _4012 = _3996 * _4010;
    float _4014 = -_3988;
    float _4016 = _3996 * _4014;
    float _4018 = -_3990;
    float _4020 = _3996 * _4018;
    float _4022 = sqrt(_3992);
    float _4024 = fma(_4000, _3994, _4002);
    float _4026 = fma(_4000, _3998, _4004);
    float _4028 = fma(_4000, _4006, _4008);
    float _4030 = fma(_3880, _3978, _4012);
    float _4032 = fma(_3880, _3980, _4016);
    float _4034 = fma(_3880, _3982, _4020);
    float _4036 = _3986 + _4024;
    float _4038 = _3988 + _4026;
    float _4040 = _3990 + _4028;
    out.m_86.x = _3994;
    out.m_86.y = _3998;
    out.m_86.z = _4006;
    out.m_88.x = _4030;
    out.m_88.y = _4032;
    out.m_88.z = _4034;
    bool _4042 = _4022 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4044 = isnan(_4022);
    bool _4046 = _4042 || _4044;
    bool _4048 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4050 = _4046 || _4048;
    out.m_90.x = _4036;
    out.m_90.y = _4038;
    out.m_90.z = _4040;
    float _4052 = _4026;
    float _4054 = _3994;
    float _4056 = _4034;
    if (!_4050)
    {
        _4052 = 1.0;
    }
    float _4058 = _4052;
    bool _4060 = !_4050;
    float _4062 = _4058;
    if (!_4060)
    {
        bool _4064 = _4022 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4066 = isnan(_4022);
        bool _4068 = _4064 || _4066;
        bool _4070 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4072 = _4068 || _4070;
        if (!_4072)
        {
            float _4074 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4076 = _4022 + _4074;
            float _4078 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4080 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4078;
            float _4082 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4084 = _4082 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4086 = 1.0 / _4080;
            float _4088 = _4076 * _4086;
            float _4090 = fma(_4088, _4084, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4062 = _4090;
            _4092 = true;
        }
        else
        {
            bool _4094 = _4022 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4096 = isnan(_4022);
            bool _4098 = _4094 || _4096;
            bool _4100 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4102 = _4098 || _4100;
            if (!_4102)
            {
                float _4104 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4106 = _4022 + _4104;
                float _4108 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4110 = _4108 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4112 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4114 = _4112 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4116 = 1.0 / _4110;
                float _4118 = _4106 * _4116;
                float _4120 = fma(_4118, _4114, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4062 = _4120;
                _4092 = true;
            }
            else
            {
                _4062 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4092 = false;
    float _4122 = _4062;
    float _4124 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4126 = _3964 + _4124;
    float _4128 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4130 = _3970 + _4128;
    float _4132 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4134 = _3972 + _4132;
    float _4136 = fma(_4126, _4122, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4138 = fma(_4130, _4122, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4140 = fma(_4134, _4122, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4142 = -_3152;
    float _4144 = fma(_4142, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4136);
    float _4146 = -_3154;
    float _4148 = fma(_4146, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4138);
    float _4150 = -_3578;
    float _4152 = fma(_4150, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4140);
    float _4154 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4156 = _4144 + _4154;
    float _4158 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4160 = _4148 + _4158;
    float _4162 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4164 = _4152 + _4162;
    float _4166 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4168 = _4156 * _4156;
    float _4170 = fma(_3602, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4172 = fma(_4160, _4160, _4168);
    float _4174 = floor(_4170);
    float _4176 = fma(_3630, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4178 = fma(_4164, _4164, _4172);
    float _4180 = rsqrt(_4178);
    float _4182 = sqrt(_4178);
    float _4184 = _4180 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4186 = floor(_4176);
    float _4188 = _4160 * _4184;
    float _4190 = _4164 * _4184;
    float _4192 = _4188 * _4188;
    float _4194 = _4190 * _4190;
    float _4196 = _4192 + _4194;
    float _4198 = sqrt(_4196);
    float _4200 = -_4186;
    float _4202 = _4176 + _4200;
    bool _4204 = _4198 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4206 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4208 = _4198 + _4206;
    float _4210 = _4164;
    float _4212 = _4196;
    float _4214 = _4208;
    float _4216 = _4156;
    if (_4204)
    {
        float _4218 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4210 = _4218;
    }
    float _4220 = _4210;
    if (_4204)
    {
        float _4222 = rsqrt(_4196);
        _4212 = _4222;
    }
    float _4224 = _4212;
    float _4226 = _4224;
    if (_4204)
    {
        float _4228 = _4208 * _4220;
        _4214 = _4228;
    }
    float _4230 = _4214;
    if (_4204)
    {
        float _4232 = _4230 * 0.15915493667125701904296875;
        _4054 = _4232;
    }
    float _4234 = _4054;
    float _4236 = _4220;
    float _4238 = _4234;
    if (_4204)
    {
        float _4240 = _4234 * 6.283185482025146484375;
        float _4242 = sin(_4240);
        _4236 = _4242;
    }
    float _4244 = _4236;
    float _4246 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4248 = precise::max(0.0, _4246);
    float _4250 = _4168;
    float _4252 = _4248;
    if (_4204)
    {
        float _4254 = _4234 * 6.283185482025146484375;
        float _4256 = cos(_4254);
        _4250 = _4256;
    }
    float _4258 = _4250;
    float _4260 = -_4184;
    float _4262 = -_4248;
    float _4264 = fma(_4156, _4260, _4262);
    if (!_4204)
    {
        _4216 = _4188;
    }
    float _4266 = _4216;
    float _4268 = _4266;
    if (_4204)
    {
        float _4270 = _4264 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4252 = _4270;
    }
    float _4272 = _4252;
    float _4274 = _4244;
    float _4276 = _4272;
    if (_4204)
    {
        float _4278 = fma(_4244, _4272, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4274 = _4278;
    }
    float _4280 = _4274;
    float _4282 = _4280;
    float _4284 = _4258;
    if (_4204)
    {
        float _4286 = _4258 + (-1.0);
        _4276 = _4286;
    }
    float _4288 = _4276;
    float _4290 = _4288;
    if (_4204)
    {
        float _4292 = _4224 * _4280;
        _4056 = _4292;
    }
    float _4294 = _4056;
    if (!_4204)
    {
        _4282 = _4264;
    }
    float _4296 = _4282;
    float _4298 = _4296;
    if (_4204)
    {
        float _4300 = _4288 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4238 = _4300;
    }
    float _4302 = _4238;
    if (_4204)
    {
        float _4304 = _4188 * _4294;
        _4268 = _4304;
    }
    float _4306 = _4268;
    if (!_4204)
    {
        _4290 = _4190;
    }
    float _4308 = _4290;
    float _4310 = _4308;
    if (_4204)
    {
        float _4312 = _4190 * _4294;
        _4310 = _4312;
    }
    float _4314 = _4310;
    if (!_4204)
    {
        _4226 = _4192;
    }
    float _4316 = _4226;
    float _4318 = _4316;
    if (_4204)
    {
        float _4320 = fma(_4264, _4258, _4302);
        _4298 = _4320;
    }
    float _4322 = _4298;
    if (_4204)
    {
        float _4324 = _4306 * _4306;
        _4318 = _4324;
    }
    float _4326 = _4318;
    if (!_4204)
    {
        _4284 = _4194;
    }
    float _4328 = _4284;
    float _4330 = _4328;
    if (_4204)
    {
        float _4332 = _4314 * _4314;
        _4330 = _4332;
    }
    float _4334 = _4330;
    float _4336 = _4144 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4338 = fma(_4322, _4322, _4326);
    float _4340 = _4144 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4342 = _4144 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4344 = fma(_4148, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4336);
    float _4346 = _4338 + _4334;
    float _4348 = _4144 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4350 = fma(_4148, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4340);
    float _4352 = fma(_4152, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4344);
    float _4354 = rsqrt(_4346);
    float _4356 = fma(_4148, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4348);
    float _4358 = fma(_4152, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4350);
    float _4360 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4362 = fma(_4182, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4360);
    float _4364 = precise::clamp(_4362, 0.0, 1.0);
    float _4366 = _4352 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4368 = fma(_4152, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4356);
    float _4370 = fma(_4148, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4342);
    float _4372 = _4358 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4374 = -_4364;
    float _4376 = _4374 + 1.0;
    float _4378 = _4368 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4380 = _4366 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4382 = _4372 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4384 = fma(_4152, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4370);
    float _4386 = -_4174;
    float _4388 = _4170 + _4386;
    float _4390 = fma(_4378, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4380);
    float _4392 = -_4382;
    float _4394 = fma(_4392, _4166, 1.0);
    float _4396 = abs(_4376);
    float _4398 = log2(_4396);
    float _4400 = _4354 * _4322;
    float _4402 = fma(_4372, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4390);
    float _4404 = _4354 * _4306;
    float _4406 = _4354 * _4314;
    float _4408 = _4384 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4410 = _4366 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4412 = _4404 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4414 = log2(_4394);
    float _4416 = fma(_4408, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4402);
    float _4418 = fma(_4378, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4410);
    float _4420 = -_4412;
    float _4422 = fma(_4400, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4420);
    float _4424 = -_4406;
    float _4426 = fma(_4424, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4422);
    float _4428 = _4398 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4430 = 1.0 / _4416;
    float _4432 = _4366 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4434 = fma(_4426, -0.5, 0.5);
    float _4436 = fma(_4426, 0.5, 0.5);
    float _4438 = fma(_4372, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4418);
    float _4440 = fma(_4378, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4432);
    float _4442 = _4400 + 1.0;
    float _4444 = fma(_4436, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4446 = exp2(_4428);
    float _4448 = fma(_4408, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4438);
    float _4450 = _4414 * 0.693147182464599609375;
    float _4452 = fma(_4436, _4444, -0.212114393711090087890625);
    float _4454 = _4450 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4456 = fma(_4436, _4452, 1.570728778839111328125);
    float _4458 = sqrt(_4434);
    float _4460 = fma(_4372, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4440);
    float _4462 = _4448 * _4430;
    float _4464 = fma(_4408, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4460);
    float _4466 = fma(_4462, 0.5, 0.5);
    float _4468 = -_4400;
    float _4470 = fma(_4446, _4442, _4468);
    float _4472 = _4464 * _4430;
    float _4474 = fma(_4470, 0.5, 0.5);
    float _4476 = fma(_4472, -0.5, 0.5);
    float _4478 = _4458 * 0.636619746685028076171875;
    float2 _11675 = float2(_4388, _4202);
    float _4480 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11675, float2(0.0), isnan(_11675)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11675, float2(0.0), isnan(_11675)), level(0.0)).x;
    float3 _11686 = float3(_4466, _4476, _4454);
    float _4482 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11686, float3(0.0), isnan(_11686)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11686, float3(0.0), isnan(_11686)), level(0.0)).x;
    float3 _11697 = float3(_4466, _4476, _4454);
    float4 _4485 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11697, float3(0.0), isnan(_11697)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11697, float3(0.0), isnan(_11697)), level(0.0)).xyzw;
    float _4487 = _4485.x;
    float _4489 = _4485.y;
    float _4491 = _4485.z;
    float _4493 = _4485.w;
    float _4495 = -_4456;
    float _4497 = fma(_4478, _4495, 1.0);
    float2 _11718 = float2(_4497, _4474);
    float3 _4501 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11718, float2(0.0), isnan(_11718)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11718, float2(0.0), isnan(_11718)), level(0.0)).xyz;
    float _4503 = _4501.x;
    float _4505 = _4501.y;
    float _4507 = _4501.z;
    float _4509 = _3598 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4511 = _3598 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4513 = _4366 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4515 = in.m_92.x;
    float _4517 = fma(_3602, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4509);
    float _4519 = fma(_3602, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4511);
    float _4521 = fma(_4378, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4513);
    float _4523 = fma(_3630, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4517);
    float _4525 = fma(_3630, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4519);
    float _4527 = _4523 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4529 = _4525 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4531 = 1.0 / _4527;
    float _4533 = _4529 + _4527;
    float _4535 = _4398 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4537 = _4533 * _4531;
    float _4539 = _4537 * 0.5;
    float _4541 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4543 = fma(_4539, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4541);
    float _4545 = 1.0 / _4543;
    float _4547 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4549 = _4545 * _4547;
    float _4551 = abs(_4549);
    float _4553 = log2(_4551);
    bool _4555 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4557 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4559 = _4555 || _4557;
    bool _4561 = isnan(0.5);
    bool _4563 = _4559 || _4561;
    float _4565 = _4553 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4567 = exp2(_4565);
    float _4569 = fma(_4567, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4571 = precise::clamp(_4569, 0.0, 1.0);
    float _4573 = fma(_4372, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4521);
    float _4575 = _4448 + _4416;
    float _4577 = fma(_4571, -2.0, 3.0);
    float _4579 = _4571 * _4571;
    float _4581 = exp2(_4535);
    float _4583 = fma(_4408, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4573);
    float _4585 = _4575 * 0.5;
    float _4587 = _4579 * _4577;
    bool _4589 = _4549 <= 8000.0;
    bool _4591 = isnan(_4549);
    bool _4593 = _4589 || _4591;
    bool _4595 = isnan(8000.0);
    bool _4597 = _4593 || _4595;
    float _4599 = float(_4597);
    float _4601 = _4583 + _4416;
    float _4603 = -_4587;
    float _4605 = _4603 + 1.0;
    float _4607 = _4601 * 0.5;
    float _4609 = fma(_4605, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4587);
    float _4611 = _4416 * 0.5;
    float _4613 = _4605;
    float _4615 = _4416;
    float _4617 = _4583;
    float _4619 = _4464;
    if (_4563)
    {
        _4613 = 1.0;
    }
    float _4621 = _4613;
    float _4623 = fma(_4464, -0.5, _4611);
    float _4625 = _4621;
    float _4627 = _4489;
    if (!_4563)
    {
        float _4629 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4631 = _4629 * 0.15915493667125701904296875;
        float _4633 = _4631 * 6.283185482025146484375;
        float _4635 = cos(_4633);
        float _4637 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4639 = _4637 * 0.15915493667125701904296875;
        float _4641 = _4631 * 6.283185482025146484375;
        float _4643 = sin(_4641);
        float _4645 = 1.0 / _4635;
        float _4647 = _4639 * 6.283185482025146484375;
        float _4649 = cos(_4647);
        float _4651 = _4643 * _4645;
        float _4653 = _4639 * 6.283185482025146484375;
        float _4655 = sin(_4653);
        float _4657 = _4649 * _4651;
        float _4659 = 1.0 / _4657;
        float _4661 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4663 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4661;
        float _4665 = 1.0 / _4663;
        float _4667 = _4655 * _4659;
        float _4669 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4671 = fma(_4549, _4667, _4669);
        float _4673 = _4671 * _4665;
        float _4675 = precise::clamp(_4673, 0.0, 1.0);
        _4625 = _4675;
    }
    float _4677 = _4625;
    float _4679 = _4599 * _4609;
    float _4681 = -_4581;
    float _4683 = _4681 + 1.0;
    float _4685 = -_4480;
    float _4687 = _4685 + 1.0;
    float _4689 = _4679 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4691 = _4683 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _4448;
    out.gl_Position.y = _4464;
    out.gl_Position.z = _4583;
    out.gl_Position.w = _4416;
    bool _4693 = _4182 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4695 = isnan(_4182);
    bool _4697 = _4693 || _4695;
    bool _4699 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4701 = _4697 || _4699;
    float _4703 = _4687 * _4689;
    float _4705 = precise::clamp(_4703, 0.0, 1.0);
    float _4707 = _4691 * _4482;
    out.m_94.x = _4585;
    out.m_94.y = _4623;
    out.m_94.z = _4607;
    out.m_94.w = _4416;
    float _4709 = -_4705;
    float _4711 = fma(_4709, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4713 = _4493 * _4707;
    float _4715 = _4507 * _4707;
    float _4717 = _4711 * _4515;
    float _4719 = -_4691;
    float _4721 = _4719 + 1.0;
    float _4723 = _4717;
    float _4725 = _4721;
    if (!_4701)
    {
        _4615 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4727 = _4615;
    float _4729 = _4727;
    float _4731 = _4727;
    if (!_4701)
    {
        _4617 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4733 = _4617;
    float _4735 = fma(_4503, _4713, _4487);
    float _4737 = fma(_4505, _4713, _4489);
    float _4739 = _4493 * _4721;
    float _4741 = _4717 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4743 = fma(_4493, _4715, _4491);
    float _4745 = _4733;
    float _4747 = _4733;
    if (!_4701)
    {
        _4627 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4749 = _4627;
    float _4751 = _4677 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4753 = _4749;
    float _4755 = _4749;
    if (!_4701)
    {
        _4723 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4757 = _4723;
    out.m_96.x = _4741;
    float _4759 = _4757;
    float _4761 = _4757;
    if (!_4701)
    {
        _4619 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4763 = _4619;
    float _4765 = _4763;
    float _4767 = _4763;
    if (!_4701)
    {
        _4725 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4769 = _4725;
    out.m_98.x = _4735;
    out.m_98.y = _4737;
    out.m_98.z = _4743;
    out.m_98.w = _4739;
    bool _4771 = !_4701;
    float _4773 = _4769;
    float _4775 = _4769;
    if (!_4771)
    {
        bool _4777 = _4182 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4779 = isnan(_4182);
        bool _4781 = _4777 || _4779;
        bool _4783 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4785 = _4781 || _4783;
        if (!_4785)
        {
            float _4787 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4789 = _4182 + _4787;
            float _4791 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4793 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4791;
            float _4795 = 1.0 / _4793;
            float _4797 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4799 = _4797 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4801 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4803 = _4801 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4805 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4807 = _4805 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4809 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4811 = _4809 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4813 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4815 = _4813 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4817 = _4789 * _4795;
            float _4819 = precise::clamp(_4817, 0.0, 1.0);
            float _4821 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4823 = _4821 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4825 = fma(_4819, _4799, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4827 = fma(_4819, _4823, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4829 = fma(_4819, _4803, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4831 = fma(_4819, _4807, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4833 = fma(_4819, _4811, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4835 = fma(_4819, _4815, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4761 = _4827;
            _4767 = _4833;
            _4755 = _4825;
            _4747 = _4831;
            _4731 = _4829;
            _4775 = _4835;
            _4837 = true;
        }
        else
        {
            bool _4839 = _4182 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4841 = isnan(_4182);
            bool _4843 = _4839 || _4841;
            bool _4845 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4847 = _4843 || _4845;
            if (!_4847)
            {
                _4753 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4849 = _4753;
            _4755 = _4849;
            if (!_4847)
            {
                _4759 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4851 = _4759;
            _4761 = _4851;
            if (!_4847)
            {
                _4729 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4853 = _4729;
            _4731 = _4853;
            if (!_4847)
            {
                _4745 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4855 = _4745;
            _4747 = _4855;
            if (!_4847)
            {
                _4765 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4857 = _4765;
            _4767 = _4857;
            if (!_4847)
            {
                _4773 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4859 = _4773;
            bool _4861 = !_4847;
            _4775 = _4859;
            if (!_4861)
            {
                bool _4863 = _4182 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4865 = isnan(_4182);
                bool _4867 = _4863 || _4865;
                bool _4869 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4871 = _4867 || _4869;
                if (!_4871)
                {
                    float _4873 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4875 = _4182 + _4873;
                    float _4877 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4879 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4877;
                    float _4881 = 1.0 / _4879;
                    float _4883 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4885 = _4883 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4887 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4889 = _4887 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4891 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4893 = _4891 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4895 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4897 = _4895 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4899 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4901 = _4899 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4903 = _4875 * _4881;
                    float _4905 = precise::clamp(_4903, 0.0, 1.0);
                    float _4907 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4909 = _4907 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4911 = fma(_4905, _4885, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4913 = fma(_4905, _4909, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4915 = fma(_4905, _4889, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4917 = fma(_4905, _4893, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4919 = fma(_4905, _4897, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4921 = fma(_4905, _4901, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4761 = _4913;
                    _4767 = _4919;
                    _4755 = _4911;
                    _4747 = _4917;
                    _4731 = _4915;
                    _4775 = _4921;
                    _4837 = true;
                }
                else
                {
                    _4761 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4767 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4755 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4747 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4731 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4775 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4837 = false;
    float _4923 = _4761;
    float _4925 = _4767;
    float _4927 = _4755;
    float _4929 = _4747;
    float _4931 = _4731;
    float _4933 = _4775;
    float _4935 = _4751 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4937 = fma(_4038, -0.5, 0.5);
    float _4939 = precise::clamp(_4937, 0.0, 1.0);
    float _4941 = -_4923;
    float _4943 = _4941 + _4925;
    float _4945 = -_4927;
    float _4947 = _4945 + _4929;
    out.m_100.x = 0.0;
    float _4949 = fma(_4939, _4943, _4923);
    float _4951 = -_4931;
    float _4953 = _4951 + _4933;
    float _4955 = fma(_4939, _4947, _4927);
    float _4957 = _4949 * 0.586610972881317138671875;
    bool _4959 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4961 = fma(_4939, _4953, _4931);
    out.m_55.x = _4935;
    float _4963 = fma(_4955, 0.298911988735198974609375, _4957);
    bool _4965 = _4677 > 0.0;
    bool _4967 = isnan(_4677);
    bool _4969 = _4965 || _4967;
    bool _4971 = isnan(0.0);
    bool _4973 = _4969 || _4971;
    float _4975 = fma(_4961, 0.114477999508380889892578125, _4963);
    float _4977 = -_4975;
    float _4979 = _4955 + _4977;
    float _4981 = -_4975;
    float _4983 = _4949 + _4981;
    float _4985 = -_4975;
    float _4987 = _4961 + _4985;
    float _4989 = fma(_4979, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4975);
    float _4991 = fma(_4983, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4975);
    float _4993 = fma(_4987, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4975);
    bool _4995 = !_4959;
    if (!_4995)
    {
        float _4997 = -_4144;
        float _4999 = _4997 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5001 = -_4148;
        float _5003 = _5001 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5005 = -_4152;
        float _5007 = _5005 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5009 = _4999 * _4999;
        float _5011 = fma(_5003, _5003, _5009);
        float _5013 = fma(_5007, _5007, _5011);
        float _5015 = sqrt(_5013);
        float _5017 = rsqrt(_5013);
        float _5019 = -_5015;
        float _5021 = _5019 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5023 = _5021 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5025 = precise::clamp(_5023, 0.0, 1.0);
        float _5027 = _5003 * _5017;
        float _5029 = _4999 * _5017;
        float _5031 = abs(_5025);
        float _5033 = log2(_5031);
        float _5035 = _5007 * _5017;
        float _5037 = _5027 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5039 = _4038 * _5029;
        float _5041 = -_5029;
        float _5043 = -_5037;
        float _5045 = fma(_5041, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5043);
        float _5047 = fma(_4036, _5027, _5039);
        float _5049 = -_5035;
        float _5051 = fma(_5049, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5045);
        float _5053 = fma(_4040, _5035, _5047);
        float _5055 = precise::clamp(_5053, 0.0, 1.0);
        float _5057 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5059 = _5051 + _5057;
        float _5061 = _5033 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5063 = _5059 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5065 = precise::clamp(_5063, 0.0, 1.0);
        float _5067 = exp2(_5061);
        float _5069 = _5067 * _5065;
        float _5071 = _5055 * _5069;
        float _5073 = _5071 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5075 = _5071 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5077 = _5071 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _5073;
        out.m_100.y = _5075;
        out.m_100.z = _5077;
    }
    out.m_102.x = _4989;
    out.m_102.y = _4991;
    out.m_102.z = _4993;
    if (_4973)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_55.x = 0.0;
    float _5079 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5079;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4837 = false;
    bool _4092 = false;
    bool _597 = false;
    bool _453 = false;
    bool _219 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_48.w;
    float _118 = in.m_50.w;
    float _120 = trunc(_116);
    int _123 = int(_120);
    float _125 = -_118;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _127;
    bool _131 = _123 >= 1;
    float _133 = 0.0;
    float _135 = _118;
    float _137 = _127;
    if (!_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _133;
    if (!_131)
    {
        out.m_55.x = 0.0;
    }
    int _141 = 0;
    if (!_131)
    {
        float _143 = _139 * 5.0;
        _141 = as_type<int>(_143);
    }
    int _145 = _141;
    if (!_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5146 = as_type<float>(_145);
        out.gl_Position.z = _5146;
    }
    if (!_131)
    {
        return out;
    }
    bool _147 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _149 = isnan(_118);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _155 = _151 || _153;
    float _157 = float(_123);
    bool _159 = _127 >= _157;
    bool _161 = !_155;
    bool _163 = _159 || _161;
    float _165 = 1.0 / _157;
    if (_163)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _135;
    if (_163)
    {
        out.m_55.x = 0.0;
    }
    float _169 = _127 * _165;
    int _171 = 0;
    float _173 = _169;
    if (_163)
    {
        float _175 = _167 * 5.0;
        _171 = as_type<int>(_175);
    }
    int _177 = _171;
    out.m_53.x = _169;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5209 = as_type<float>(_177);
        out.gl_Position.z = _5209;
    }
    if (_163)
    {
        return out;
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _183 = as_type<int>(_179) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_179) & 2;
    bool _189 = _187 != 0;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_181;
    float _217;
    if (!_199)
    {
        float _201 = in.m_60.x;
        float _203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _205 = _201 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _207 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _209 = _207 * _203;
        float _211 = floor(_209);
        float _213 = -_211;
        float _215 = _209 + _213;
        _217 = _215;
        _219 = true;
    }
    else
    {
        _217 = _169;
    }
    _219 = false;
    float _221 = _217;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _225 = _221 + _223;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _229 = _221 + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _233 = _221 + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _241 = _239 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _243;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _249 = _247 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _251 = 1.0 / _237;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _255 = 1.0 / _245;
    float _257 = 1.0 / _249;
    float _259 = _225 * _251;
    bool _261 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _263 = isnan(_221);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    float _273 = -_271;
    float _275 = _273 + 1.0;
    float _277 = 1.0 / _241;
    float _279 = _229 * _255;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _283 = _221 + _281;
    bool _285 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _287 = isnan(_221);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _297;
    float _301 = _233 * _257;
    float _303 = fma(_299, _279, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _305 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _307 = isnan(_221);
    bool _309 = _305 || _307;
    bool _311 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _313 = _309 || _311;
    float _315 = float(_313);
    float _317 = _283 * _277;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _319;
    float _323 = _315 * _275;
    bool _325 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _327 = isnan(_221);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = -_315;
    float _339 = _337 + 1.0;
    float _341 = fma(_321, _279, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _343 = -_295;
    float _345 = _343 + 1.0;
    bool _347 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _349 = isnan(_221);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _361 = _359 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _363 = _295 * _339;
    float _365 = _335 * _345;
    float _367 = -_335;
    float _369 = _367 + 1.0;
    float _371 = -_357;
    float _373 = _371 + 1.0;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _377 = _375 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _379 = fma(_361, _301, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _381 = _357 * _369;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _383;
    float _387 = fma(_377, _301, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _389;
    float _393 = _341 * _381;
    float _395 = _303 * _381;
    float _397 = fma(_385, _259, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _399 = fma(_391, _259, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _401 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].x, _393);
    float _403 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].y, _395);
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _413 = fma(_379, _365, _401);
    float _415 = fma(_387, _365, _403);
    float _417 = fma(_407, _317, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _419 = fma(_411, _317, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _421 = fma(_397, _363, _413);
    float _423 = fma(_399, _363, _415);
    float _425 = fma(_417, _323, _421);
    float _427 = fma(_419, _323, _423);
    float _429 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[147].x, _425);
    float _431 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[147].y, _427);
    bool _433 = !_253;
    float _451;
    if (!_433)
    {
        float _435 = in.m_60.x;
        float _437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _439 = _435 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _441 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _443 = _441 * _437;
        float _445 = floor(_443);
        float _447 = -_445;
        float _449 = _443 + _447;
        _451 = _449;
        _453 = true;
    }
    else
    {
        _451 = _169;
    }
    _453 = false;
    float _455 = _451;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _459 = _455 + _457;
    float _461 = in.m_62.x;
    float _463 = in.m_62.y;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _469 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _471 = isnan(_455);
    bool _473 = _469 || _471;
    bool _475 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _477 = _473 || _475;
    float _479 = float(_477);
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _485 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _487 = isnan(_455);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _497;
    bool _501 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _503 = isnan(_455);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    float _513 = 1.0 / _467;
    float _515 = -_479;
    float _517 = _515 + 1.0;
    bool _519 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _521 = _495 * _517;
    float _523 = -_495;
    float _525 = _523 + 1.0;
    float _527 = 1.0 / _483;
    float _529 = _499 * _513;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _535 = _431 * _463;
    float _537 = _429 * _461;
    float _539 = fma(_529, _459, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _541 = -_511;
    float _543 = _541 + 1.0;
    float _545 = _539 * _521;
    float _547 = _533 * _527;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _551 = _455 + _549;
    float _553 = _479 * _543;
    float _555 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[115].x, _545);
    float _557 = fma(_547, _551, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _559 = fma(_557, _553, _555);
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _565 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[117].x, _559);
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _569 = _561 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _571 = _563 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _573 = _565 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _575 = _567 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_64.x = _569;
    out.m_64.y = _571;
    out.m_64.z = _575;
    out.m_64.w = _573;
    bool _577 = !_519;
    float _595;
    if (!_577)
    {
        float _579 = in.m_60.x;
        float _581 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _583 = _579 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _585 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[11].w, _127);
        float _587 = _585 * _581;
        float _589 = floor(_587);
        float _591 = -_589;
        float _593 = _587 + _591;
        _595 = _593;
        _597 = true;
    }
    else
    {
        _595 = _169;
    }
    _597 = false;
    float _599 = _595;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _603 = _599 + _601;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _609 = _599 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _611 = isnan(_599);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _625 = _599 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _627 = isnan(_599);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _637;
    bool _641 = _599 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _643 = isnan(_599);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = 1.0 / _607;
    float _655 = -_619;
    float _657 = _655 + 1.0;
    bool _659 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _661 = _635 * _657;
    float _663 = -_635;
    float _665 = _663 + 1.0;
    float _667 = 1.0 / _623;
    float _669 = _639 * _653;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _675 = fma(_669, _603, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _677 = -_651;
    float _679 = _677 + 1.0;
    float _681 = _675 * _661;
    float _683 = _673 * _667;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _687 = _599 + _685;
    float _689 = _619 * _679;
    float _691 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[131].x, _681);
    float _693 = fma(_683, _687, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _695 = fma(_693, _689, _691);
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _703 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[133].x, _695);
    float _705 = _697 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = _699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = _701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _703 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_66.x = _705;
    out.m_66.y = _707;
    out.m_66.z = _709;
    out.m_66.w = _711;
    bool _713 = !_659;
    if (!_713)
    {
        float _715 = in.m_60.x;
        float _717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _719 = _715 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _721 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[14].x, _127);
        float _723 = _721 * _717;
        float _725 = floor(_723);
        float _727 = -_725;
        float _729 = _723 + _727;
        _173 = _729;
    }
    float _731 = _173;
    float _733 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _735 = int(_733);
    int _737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _739 = _737 != 0;
    float _741 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _743 = int(_741);
    float _745 = float(_735);
    float _747 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _749 = int(_747);
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_739)
    {
        _751 = 1.0;
    }
    float _753 = _751;
    int _755 = 0;
    float _757 = _753;
    if (_739)
    {
        _755 = 0;
    }
    int _759 = _755;
    float _761 = float(_743);
    float _763 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _765 = int(_763);
    float _767 = 1.0 / _745;
    float _769 = float(uint(_749));
    int _771 = ~_749;
    int _773 = _771 + 1;
    float _775 = 1.0 / _761;
    float _777 = float(uint(_765));
    float _779 = _767 * _127;
    float _781 = 1.0 / _769;
    float _783 = _767;
    float _785 = _761;
    int _787 = _759;
    if (_739)
    {
        float _789 = in.m_60.x;
        float _791 = in.m_60.y;
        _783 = _789;
        _785 = _791;
    }
    float _793 = _783;
    float _795 = _785;
    float _797 = _775 * _127;
    float _799 = 1.0 / _777;
    float _801 = _775;
    if (_739)
    {
        _801 = 1.0;
    }
    float _803 = _801;
    float _805 = trunc(_779);
    int _807 = int(_805);
    int _809 = as_type<int>(_781) + (-2);
    float _811 = trunc(_797);
    int _813 = int(_811);
    int _815 = as_type<int>(_799) + (-2);
    float _817 = 0.0;
    float _819 = _803;
    float _821 = _793;
    float _823 = _795;
    if (_739)
    {
        _817 = _795;
    }
    float _825 = _817;
    float _827 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _829 = int(_827);
    float _831 = float(uint(_807));
    float _833 = as_type<float>(_809) * _831;
    float _835 = _831;
    float _837 = _825;
    if (_739)
    {
        _835 = _793;
    }
    float _839 = _835;
    float _841 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _843 = int(_841);
    float _845 = float(uint(_813));
    float _847 = 0.0;
    int _849 = as_type<int>(_845);
    float _851 = _839;
    if (_739)
    {
        _847 = _839;
    }
    float _853 = _847;
    float _855 = as_type<float>(_815) * _845;
    float _857 = _853;
    if (_739)
    {
        _849 = 0;
    }
    int _859 = _849;
    float _861 = trunc(_833);
    float _863 = precise::max(_861, 0.0);
    uint _866 = uint(_863);
    float _868 = float(uint(_829));
    float _870 = 1.0 / _868;
    float _872 = float(_843);
    float _874 = trunc(_855);
    float _876 = precise::max(_874, 0.0);
    uint _878 = uint(_876);
    float _880 = 1.0 / _872;
    float _882 = _872;
    int _884 = _859;
    if (_739)
    {
        _882 = _839;
    }
    float _886 = _882;
    float _888 = _886;
    if (!_739)
    {
        float _890 = in.m_60.x;
        float _892 = in.m_60.y;
        float _894 = in.m_60.z;
        float _896 = _890 * 3.1415927410125732421875;
        float _898 = _896 * 0.15915493667125701904296875;
        float _900 = _892 * 3.1415927410125732421875;
        float _902 = _900 * 0.15915493667125701904296875;
        float _904 = _898 * 6.283185482025146484375;
        float _906 = sin(_904);
        float _908 = _902 * 6.283185482025146484375;
        float _910 = sin(_908);
        _819 = 7.345489978790283203125;
        _821 = _890;
        _757 = 5.839270114898681640625;
        _888 = _894;
        _851 = _892;
        _823 = _892;
        _884 = 1;
        _787 = 2;
        _837 = _910;
        _857 = _906;
    }
    float _912 = _819;
    float _914 = _821;
    float _916 = _757;
    float _918 = _888;
    float _920 = _851;
    float _922 = _823;
    int _924 = _884;
    int _926 = _787;
    float _928 = _837;
    float _930 = _857;
    int _932 = _773 * int(_866);
    int _934 = _932 + _807;
    float _936 = _912 * _914;
    float _938 = _880 * _127;
    float _940 = _916 * _918;
    float _942 = in.m_60.z;
    float _944 = in.m_60.w;
    float _946 = float(uint(_934));
    float _948 = floor(_936);
    int _950 = ~_765;
    int _952 = _950 + 1;
    float _954 = _912 * _920;
    float _956 = float(_749);
    float _958 = as_type<float>(_809) * _946;
    float _960 = float(_807);
    int _962 = _952 * int(_878);
    int _964 = _962 + _813;
    int _966 = as_type<int>(_870) + (-2);
    float _968 = floor(_940);
    bool _970 = _960 >= _956;
    bool _972 = isnan(_960);
    bool _974 = _970 || _972;
    bool _976 = isnan(_956);
    bool _978 = _974 || _976;
    float _980 = float(_978);
    float _982 = _922 * 2.0;
    float _984 = float(uint(_964));
    bool _986 = _922 > 0.5;
    int _988 = ~_749;
    int _990 = _988 + 1;
    float _992 = trunc(_938);
    int _994 = int(_992);
    float _996 = -_948;
    float _998 = _936 + _996;
    float _1000 = as_type<float>(_815) * _984;
    float _1002 = -_193;
    int _1004 = _986 ? as_type<int>(_1002) : as_type<int>(_193);
    bool _1006 = _944 > 0.5;
    float _1008 = trunc(_958);
    float _1010 = precise::max(_1008, 0.0);
    uint _1012 = uint(_1010);
    float _1014 = -_968;
    float _1016 = _940 + _1014;
    bool _1018 = _942 > 0.5;
    int _1020 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1022 = _1020 != 0;
    float _1024 = float(_765);
    float _1026 = float(uint(_994));
    float _1028 = trunc(_1000);
    float _1030 = precise::max(_1028, 0.0);
    uint _1032 = uint(_1030);
    int _1034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1036 = _1034 != 0;
    int _1038 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1040 = _1038 != 0;
    int _1042 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1044 = _1042 != 0;
    int _1046 = ~_765;
    int _1048 = _1046 + 1;
    int _1050 = int(_866) + int(_1012);
    float _1052 = as_type<float>(_966) * _1026;
    float _1054 = -_197;
    int _1056 = _1018 ? as_type<int>(_1054) : as_type<int>(_197);
    float _1058 = floor(_954);
    float _1060 = float(_813);
    bool _1062 = !_1044;
    float _1064 = _1062 ? _197 : as_type<float>(_1056);
    bool _1066 = _1060 >= _1024;
    bool _1068 = isnan(_1060);
    bool _1070 = _1066 || _1068;
    bool _1072 = isnan(_1024);
    bool _1074 = _1070 || _1072;
    float _1076 = float(_1074);
    float _1078 = _998 * _956;
    int _1080 = int(_878) + int(_1032);
    float _1082 = trunc(_1052);
    float _1084 = precise::max(_1082, 0.0);
    uint _1086 = uint(_1084);
    int _1088 = ~_829;
    int _1090 = _1088 + 1;
    int _1092 = int(_1006);
    int _1094 = _1018 ? 2 : 0;
    int _1096 = _1092 | _1094;
    int _1098 = _1022 ? 4 : 0;
    int _1100 = _1096 | _1098;
    int _1102 = _1036 ? 8 : 0;
    int _1104 = _1100 | _1102;
    int _1106 = _1040 ? 16 : 0;
    int _1108 = _1104 | _1106;
    int _1110 = _1044 ? 32 : 0;
    int _1112 = _1108 | _1110;
    int _1114 = _986 ? 64 : 0;
    int _1116 = _1112 | _1114;
    int _1118 = _1116 & 64;
    int _1120 = _1048 * _1080;
    int _1122 = _1120 + _813;
    bool _1124 = !_1040;
    float _1126 = _1124 ? _193 : as_type<float>(_1004);
    int _1128 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1130 = _1128 != 0;
    int _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1134 = _1132 != 0;
    int _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1138 = _1136 != 0;
    float _1140 = trunc(_1078);
    int _1142 = int(_1140);
    int _1144 = _990 * _1050;
    int _1146 = _1144 + _807;
    bool _1148 = !_1022;
    int _1150 = _1148 ? 0 : 1;
    float _1152 = -_1058;
    float _1154 = _954 + _1152;
    bool _1156 = !_1134;
    int _1158 = _1156 ? 0 : 1;
    bool _1160 = uint(_1146) >= uint(_749);
    int _1162 = _1090 * int(_1086);
    int _1164 = _1162 + _994;
    bool _1166 = uint(_1122) >= uint(_765);
    float _1168 = trunc(_980);
    int _1170 = int(_1168);
    bool _1172 = !_1130;
    int _1174 = _1172 ? 0 : 1;
    float _1176 = float(uint(_1164));
    int _1178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1180 = _1178 != 0;
    bool _1182 = !_1160;
    int _1184 = _1182 ? 0 : (-1);
    float _1186 = trunc(_1076);
    int _1188 = int(_1186);
    float _1190 = as_type<float>(_966) * _1176;
    bool _1192 = !_1138;
    int _1194 = _1192 ? 0 : 1;
    bool _1196 = !_1180;
    int _1198 = _1196 ? 0 : 1;
    int _1200 = abs(_1150);
    int _1202 = ~_1050;
    int _1204 = _1202 + _1184;
    int _1206 = _1204 + 1;
    float _1208 = _1016 * _1024;
    bool _1210 = !_1166;
    int _1212 = _1210 ? 0 : (-1);
    float _1214 = trunc(_1190);
    float _1216 = precise::max(_1214, 0.0);
    uint _1218 = uint(_1216);
    int _1220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1222 = _1220 != 0;
    int _1224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1226 = _1224 != 0;
    int _1228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1230 = _1228 != 0;
    int _1232 = _1142 * _1200;
    int _1234 = _1232 + _807;
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1238 = _1236 != 0;
    int _1240 = _749 * _1206;
    int _1242 = _1240 + _807;
    int _1244 = ~_1080;
    int _1246 = _1244 + _1212;
    int _1248 = _1246 + 1;
    bool _1250 = !_1238;
    int _1252 = _1250 ? 0 : 1;
    float _1254 = trunc(_1208);
    int _1256 = int(_1254);
    float _1258 = _165 * _127;
    bool _1260 = _749 == 0;
    int _1262 = _765 * _1248;
    int _1264 = _1262 + _813;
    int _1266 = ~_1170;
    int _1268 = _1266 + 1;
    int _1270 = _1268 + 1;
    float _1272 = _956 * _1258;
    bool _1274 = !_1260;
    int _1276 = _1274 ? _1242 : (-1);
    float _1278 = _1024 * _1258;
    int _1280 = _749 + (-1);
    bool _1282 = !_1222;
    int _1284 = _1282 ? 0 : 1;
    float _1286 = trunc(_1272);
    int _1288 = int(_1286);
    int _1290 = _1276 * _1270;
    int _1292 = abs(_1158);
    bool _1294 = _765 == 0;
    int _1296 = _1170 * _1280;
    int _1298 = _1296 + _1290;
    int _1300 = ~_1188;
    int _1302 = _1300 + 1;
    int _1304 = _1302 + 1;
    bool _1306 = !_1294;
    int _1308 = _1306 ? _1264 : (-1);
    int _1310 = _1298 * _1292;
    int _1312 = abs(_1174);
    float _1314 = trunc(_1278);
    int _1316 = int(_1314);
    int _1318 = abs(_1194);
    int _1320 = _1308 * _1304;
    int _1322 = abs(_1252);
    int _1324 = abs(_1198);
    int _1326 = _1288 * _1312;
    int _1328 = _1326 + _1310;
    bool _1330 = !_1226;
    int _1332 = _1330 ? 0 : 1;
    int _1334 = _1256 * _1322;
    int _1336 = _1334 + _813;
    int _1338 = _765 + (-1);
    int _1340 = abs(_1332);
    int _1342 = _1188 * _1338;
    int _1344 = _1342 + _1320;
    int _1346 = abs(_1284);
    int _1348 = _1234 * _1318;
    int _1350 = _1348 + _1328;
    int _1352 = int(_1086) + int(_1218);
    int _1354 = _1344 * _1340;
    int _1356 = ~_829;
    int _1358 = _1356 + 1;
    int _1360 = _1142 * _1324;
    int _1362 = _1360 + _1350;
    bool _1364 = _1118 != 0;
    int _1366 = _1358 * _1352;
    int _1368 = _1366 + _994;
    float _1370 = -_197;
    int _1372 = _1006 ? as_type<int>(_1370) : as_type<int>(_197);
    int _1374 = _1316 * _1346;
    int _1376 = _1374 + _1354;
    float _1378 = float(_829);
    float _1380 = -_193;
    int _1382 = _1018 ? as_type<int>(_1380) : as_type<int>(_193);
    float _1384 = float(_994);
    float _1386 = _1378 * _1258;
    float _1388 = float(uint(_1362));
    bool _1390 = uint(_1368) >= uint(_829);
    int _1392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1394 = _1392 != 0;
    float _1396 = as_type<float>(_809) * _1388;
    bool _1398 = !_1230;
    int _1400 = _1398 ? 0 : 1;
    float _1402 = trunc(_1386);
    int _1404 = int(_1402);
    bool _1406 = _1384 >= _1378;
    bool _1408 = isnan(_1384);
    bool _1410 = _1406 || _1408;
    bool _1412 = isnan(_1378);
    bool _1414 = _1410 || _1412;
    float _1416 = float(_1414);
    float _1418 = _1154 * _1378;
    bool _1420 = !_1394;
    int _1422 = _1420 ? 0 : 1;
    int _1424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1426 = _1424 != 0;
    int _1428 = abs(_1400);
    float _1430 = trunc(_1396);
    float _1432 = precise::max(_1430, 0.0);
    uint _1434 = uint(_1432);
    bool _1436 = !_1036;
    float _1438 = _1436 ? _197 : as_type<float>(_1372);
    int _1440 = abs(_1422);
    bool _1442 = !_1390;
    int _1444 = _1442 ? 0 : (-1);
    bool _1446 = !_1426;
    int _1448 = _1446 ? 0 : 1;
    float _1450 = trunc(_1416);
    int _1452 = int(_1450);
    int _1454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1456 = _1454 != 0;
    int _1458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1460 = _1458 != 0;
    int _1462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1464 = _1462 != 0;
    int _1466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1468 = _1466 != 0;
    int _1470 = ~_1352;
    int _1472 = _1470 + _1444;
    int _1474 = _1472 + 1;
    int _1476 = _1336 * _1428;
    int _1478 = _1476 + _1376;
    float _1480 = trunc(_1418);
    int _1482 = int(_1480);
    bool _1484 = !_1460;
    int _1486 = _1484 ? 0 : 1;
    int _1488 = _829 * _1474;
    int _1490 = _1488 + _994;
    int _1492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1494 = _1492 != 0;
    int _1496 = _1256 * _1440;
    int _1498 = _1496 + _1478;
    int _1500 = ~_749;
    int _1502 = _1500 + 1;
    bool _1504 = !_1456;
    int _1506 = _1504 ? 0 : 1;
    float _1508 = float(uint(_1498));
    int _1510 = _1502 * int(_1434);
    int _1512 = _1510 + _1362;
    bool _1514 = _829 == 0;
    int _1516 = ~_1452;
    int _1518 = _1516 + 1;
    int _1520 = _1518 + 1;
    float _1522 = as_type<float>(_815) * _1508;
    bool _1524 = !_1514;
    int _1526 = _1524 ? _1490 : (-1);
    float _1528 = as_type<float>(_1256);
    float _1530 = as_type<float>(_1362);
    float _1532 = as_type<float>(_926);
    if (_1494)
    {
        float _1534 = in.m_60.w;
        _1528 = _1534;
    }
    float _1536 = _1528;
    float _1538 = float(uint(_1512));
    int _1540 = abs(_1486);
    int _1542 = _1526 * _1520;
    int _1544 = _829 + (-1);
    float _1546 = as_type<float>(_809) * _1538;
    float _1548 = trunc(_1522);
    float _1550 = precise::max(_1548, 0.0);
    uint _1552 = uint(_1550);
    int _1554 = abs(_1448);
    int _1556 = _1452 * _1544;
    int _1558 = _1556 + _1542;
    int _1560 = abs(_1506);
    int _1562 = _1558 * _1540;
    float _1564 = trunc(_1546);
    float _1566 = precise::max(_1564, 0.0);
    uint _1568 = uint(_1566);
    int _1570 = ~_765;
    int _1572 = _1570 + 1;
    int _1574 = _1404 * _1560;
    int _1576 = _1574 + _1562;
    int _1578 = ~_749;
    int _1580 = _1578 + 1;
    int _1582 = _1482 * _1554;
    int _1584 = _1582 + _994;
    bool _1586 = !_1464;
    int _1588 = _1586 ? 0 : 1;
    float _1590 = as_type<float>(_1554);
    float _1592 = as_type<float>(_1572);
    if (_1494)
    {
        float _1594 = _1536 * 3.1415927410125732421875;
        _1590 = _1594;
    }
    float _1596 = _1590;
    int _1598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1600 = _1598 != 0;
    int _1602 = _1572 * int(_1552);
    int _1604 = _1602 + _1498;
    bool _1606 = _749 == 0;
    if (_1494)
    {
        float _1608 = _1596 * 0.15915493667125701904296875;
        _1592 = _1608;
    }
    float _1610 = _1592;
    bool _1612 = !_1468;
    int _1614 = _1612 ? 0 : 1;
    int _1616 = int(_1434) + int(_1568);
    int _1618 = abs(_1588);
    float _1620 = float(uint(_1604));
    int _1622 = _1580 * _1616;
    int _1624 = _1622 + _1362;
    float _1626 = as_type<float>(_1588);
    if (_1494)
    {
        float _1628 = _1610 * 6.283185482025146484375;
        float _1630 = sin(_1628);
        _1626 = _1630;
    }
    float _1632 = _1626;
    int _1634 = abs(_1614);
    float _1636 = as_type<float>(_815) * _1620;
    bool _1638 = uint(_1624) >= uint(_749);
    int _1640 = _1584 * _1618;
    int _1642 = _1640 + _1576;
    float _1644 = float(uint(_1234));
    float _1646 = as_type<float>(_1618);
    if (_1600)
    {
        float _1648 = in.m_60.x;
        _1646 = _1648;
    }
    float _1650 = _1646;
    float _1652 = trunc(_1636);
    float _1654 = precise::max(_1652, 0.0);
    uint _1656 = uint(_1654);
    bool _1658 = !_1638;
    int _1660 = _1658 ? 0 : (-1);
    float _1662 = as_type<float>(_809) * _1644;
    int _1664 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1666 = _1664 != 0;
    int _1668 = _1482 * _1634;
    int _1670 = _1668 + _1642;
    int _1672 = ~_1616;
    int _1674 = _1672 + _1660;
    int _1676 = _1674 + 1;
    bool _1678 = !_1666;
    float _1680 = _1678 ? _193 : as_type<float>(_1382);
    float _1682 = trunc(_1662);
    float _1684 = precise::max(_1682, 0.0);
    uint _1686 = uint(_1684);
    bool _1688 = _1666;
    if (_1494)
    {
        bool _1690 = _1632 > 0.5;
        _1688 = _1690;
    }
    bool _1692 = _1688;
    int _1694 = _749 * _1676;
    int _1696 = _1694 + _1362;
    float _1698 = float(uint(_1670));
    float _1700 = 0.0;
    if (!_1494)
    {
        _1700 = _193;
    }
    float _1702 = _1700;
    bool _1704 = !_1606;
    int _1706 = _1704 ? _1696 : (-1);
    float _1708 = as_type<float>(_966) * _1698;
    float _1710 = _1702;
    if (_1494)
    {
        float _1712 = -_193;
        float _1714 = _1692 ? _1712 : _193;
        _1710 = _1714;
    }
    float _1716 = _1710;
    int _1718 = _1706 & 3;
    bool _1720 = _1718 != 0;
    float _1722 = trunc(_1708);
    float _1724 = precise::max(_1722, 0.0);
    uint _1726 = uint(_1724);
    int _1728 = ~_749;
    int _1730 = _1728 + 1;
    if (_1600)
    {
        float _1732 = _1650 * 3.1415927410125732421875;
        _1530 = _1732;
    }
    float _1734 = _1530;
    int _1736 = _1706 & 3;
    bool _1738 = _1736 != 0;
    int _1740 = int(_1552) + int(_1656);
    int _1742 = _1730 * int(_1686);
    int _1744 = _1742 + _1234;
    int _1746 = _1720 ? 0 : 1;
    float _1748 = _1734;
    if (_1600)
    {
        float _1750 = _1734 * 0.15915493667125701904296875;
        _1748 = _1750;
    }
    float _1752 = _1748;
    float _1754 = float(uint(_1336));
    bool _1756 = uint(_1736) > 1u;
    int _1758 = ~_829;
    int _1760 = _1758 + 1;
    float _1762 = as_type<float>(_815) * _1754;
    float _1764 = float(uint(_1744));
    float _1766 = _1752;
    if (_1600)
    {
        float _1768 = _1752 * 6.283185482025146484375;
        float _1770 = sin(_1768);
        _1766 = _1770;
    }
    float _1772 = _1766;
    int _1774 = ~_765;
    int _1776 = _1774 + 1;
    float _1778 = as_type<float>(_809) * _1764;
    int _1780 = ~_1746;
    int _1782 = _1780 + 1;
    int _1784 = _1782 + 1;
    int _1786 = _1776 * _1740;
    int _1788 = _1786 + _1498;
    float _1790 = -_197;
    int _1792 = _1364 ? as_type<int>(_1790) : as_type<int>(_197);
    int _1794 = _1760 * int(_1726);
    int _1796 = _1794 + _1670;
    float _1798 = trunc(_1762);
    float _1800 = precise::max(_1798, 0.0);
    uint _1802 = uint(_1800);
    int _1804 = _1784;
    if (!_1756)
    {
        int _1806 = ~_1746;
        int _1808 = _1806 + 1;
        _1804 = _1808;
    }
    int _1810 = _1804;
    int _1812 = ~_765;
    int _1814 = _1812 + 1;
    bool _1816 = uint(_1736) >= 2u;
    float _1818 = float(uint(_1796));
    float _1820 = trunc(_1778);
    float _1822 = precise::max(_1820, 0.0);
    uint _1824 = uint(_1822);
    bool _1826 = uint(_1788) >= uint(_765);
    float _1828 = as_type<float>(_966) * _1818;
    int _1830 = _1816 ? 0 : 1;
    bool _1832 = _1736 != 3;
    float _1834 = trunc(_1828);
    float _1836 = precise::max(_1834, 0.0);
    uint _1838 = uint(_1836);
    bool _1840 = !_1826;
    int _1842 = _1840 ? 0 : (-1);
    int _1844 = _1814 * int(_1802);
    int _1846 = _1844 + _1336;
    int _1848 = ~_1830;
    int _1850 = _1848 + 1;
    int _1852 = _1850 + 1;
    int _1854 = ~_1740;
    int _1856 = _1854 + _1842;
    int _1858 = _1856 + 1;
    float _1860 = float(uint(_1846));
    int _1862 = _765 * _1858;
    int _1864 = _1862 + _1498;
    float _1866 = 0.0;
    int _1868 = _1852;
    bool _1870 = _1832;
    if (!_1600)
    {
        _1866 = _197;
    }
    float _1872 = _1866;
    float _1874 = _1872;
    if (_1832)
    {
        int _1876 = ~_1830;
        int _1878 = _1876 + 1;
        _1868 = _1878;
    }
    int _1880 = _1868;
    float _1882 = as_type<float>(_815) * _1860;
    if (_1600)
    {
        bool _1884 = _1772 > 0.5;
        _1870 = _1884;
    }
    bool _1886 = _1870;
    bool _1888 = !_1294;
    int _1890 = _1888 ? _1864 : (-1);
    int _1892 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1894 = _1892 != 0;
    float _1896 = trunc(_1882);
    float _1898 = precise::max(_1896, 0.0);
    uint _1900 = uint(_1898);
    if (_1600)
    {
        float _1902 = -_197;
        float _1904 = _1886 ? _1902 : _197;
        _1874 = _1904;
    }
    float _1906 = _1874;
    int _1908 = _1890 & 3;
    bool _1910 = _1908 != 0;
    int _1912 = ~_829;
    int _1914 = _1912 + 1;
    bool _1916 = !_1894;
    float _1918 = _1916 ? _197 : as_type<float>(_1792);
    bool _1920 = uint(_1908) > 1u;
    int _1922 = int(_1726) + int(_1838);
    int _1924 = _1890 & 3;
    bool _1926 = _1924 != 0;
    int _1928 = int(_1686) + int(_1824);
    int _1930 = ~_749;
    int _1932 = _1930 + 1;
    int _1934 = _1914 * _1922;
    int _1936 = _1934 + _1670;
    int _1938 = _1926 ? 0 : 1;
    float _1940 = float(uint(_1584));
    int _1942 = _1932 * _1928;
    int _1944 = _1942 + _1234;
    int _1946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1948 = _1946 != 0;
    int _1950 = ~_1938;
    int _1952 = _1950 + 1;
    int _1954 = _1952 + 1;
    float _1956 = as_type<float>(_966) * _1940;
    bool _1958 = !_1948;
    int _1960 = _1958 ? 0 : 1;
    bool _1962 = uint(_1936) >= uint(_829);
    int _1964 = _1954;
    if (!_1920)
    {
        int _1966 = ~_1938;
        int _1968 = _1966 + 1;
        _1964 = _1968;
    }
    int _1970 = _1964;
    float _1972 = trunc(_1956);
    float _1974 = precise::max(_1972, 0.0);
    uint _1976 = uint(_1974);
    bool _1978 = uint(_1944) >= uint(_749);
    bool _1980 = !_1962;
    int _1982 = _1980 ? 0 : (-1);
    bool _1984 = _1908 != 3;
    bool _1986 = !_1978;
    int _1988 = _1986 ? 0 : (-1);
    bool _1990 = uint(_1908) >= 2u;
    int _1992 = ~_1922;
    int _1994 = _1992 + _1982;
    int _1996 = _1994 + 1;
    int _1998 = ~_765;
    int _2000 = _1998 + 1;
    int _2002 = int(_1802) + int(_1900);
    int _2004 = _829 * _1996;
    int _2006 = _2004 + _1670;
    int _2008 = ~_829;
    int _2010 = _2008 + 1;
    int _2012 = _1990 ? 0 : 1;
    int _2014 = _2000 * _2002;
    int _2016 = _2014 + _1336;
    int _2018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2020 = _2018 != 0;
    int _2022 = ~_2012;
    int _2024 = _2022 + 1;
    int _2026 = _2024 + 1;
    int _2028 = _2026;
    if (_1984)
    {
        int _2030 = ~_2012;
        int _2032 = _2030 + 1;
        _2028 = _2032;
    }
    int _2034 = _2028;
    int _2036 = _2010 * int(_1976);
    int _2038 = _2036 + _1584;
    int _2040 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2042 = _2040 != 0;
    bool _2044 = !_2020;
    int _2046 = _2044 ? 0 : 1;
    bool _2048 = uint(_2016) >= uint(_765);
    bool _2050 = !_1514;
    int _2052 = _2050 ? _2006 : (-1);
    float _2054 = in.m_68.x;
    float _2056 = in.m_68.y;
    float _2058 = in.m_68.z;
    bool _2060 = !_2042;
    int _2062 = _2060 ? 0 : 1;
    bool _2064 = !_2048;
    int _2066 = _2064 ? 0 : (-1);
    int _2068 = _2052 & 3;
    bool _2070 = _2068 != 0;
    int _2072 = _2052 & 3;
    bool _2074 = _2072 != 0;
    float _2076 = float(uint(_2038));
    int _2078 = _2070 ? 0 : 1;
    bool _2080 = uint(_2072) > 1u;
    float _2082 = as_type<float>(_966) * _2076;
    int _2084 = ~_2078;
    int _2086 = _2084 + 1;
    int _2088 = _2086 + 1;
    int _2090 = ~_829;
    int _2092 = _2090 + 1;
    float _2094 = trunc(_2082);
    float _2096 = precise::max(_2094, 0.0);
    uint _2098 = uint(_2096);
    float _2100 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2102 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _2104 = _2088;
    if (!_2080)
    {
        int _2106 = ~_2078;
        int _2108 = _2106 + 1;
        _2104 = _2108;
    }
    int _2110 = _2104;
    float _2112 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2114 = uint(_2072) >= 2u;
    int _2116 = _2114 ? 0 : 1;
    bool _2118 = _2072 != 3;
    float _2120 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2122 = int(_1976) + int(_2098);
    float _2124 = in.m_70.x;
    float _2126 = in.m_70.y;
    float _2128 = in.m_70.z;
    int _2130 = ~_2116;
    int _2132 = _2130 + 1;
    int _2134 = _2132 + 1;
    int _2136 = _2092 * _2122;
    int _2138 = _2136 + _1584;
    float _2140 = in.m_72.x;
    float _2142 = in.m_72.y;
    float _2144 = in.m_72.z;
    int _2146 = _2134;
    float _2148 = _2142;
    if (_2118)
    {
        int _2150 = ~_2116;
        int _2152 = _2150 + 1;
        _2146 = _2152;
    }
    int _2154 = _2146;
    float _2156 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _2158 = uint(_2138) >= uint(_829);
    float _2160 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _2162 = !_2158;
    int _2164 = _2162 ? 0 : (-1);
    bool _2166 = _914 > 0.5;
    float _2168 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2170 = -_193;
    int _2172 = _2166 ? as_type<int>(_2170) : as_type<int>(_193);
    bool _2174 = _924 != 1;
    float _2176 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2178 = in.m_48.x;
    float _2180 = in.m_48.y;
    float _2182 = in.m_48.z;
    float _2184 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2176);
    int _2186 = ~_2002;
    int _2188 = _2186 + _2066;
    int _2190 = _2188 + 1;
    float _2192 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2194 = _2192 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _2196 = abs(_1970);
    int _2198 = _765 * _2190;
    int _2200 = _2198 + _1336;
    bool _2202 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2204 = isnan(_731);
    bool _2206 = _2202 || _2204;
    bool _2208 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2210 = _2206 || _2208;
    float _2212 = float(_2210);
    float _2214 = 0.0;
    if (!_2174)
    {
        _2214 = _922;
    }
    float _2216 = _2214;
    float _2218 = 1.0 / _2194;
    float _2220 = 0.0;
    float _2222 = _2216;
    if (!_2174)
    {
        _2220 = _922;
    }
    float _2224 = _2220;
    float _2226 = 0.0;
    float _2228 = _2224;
    if (!_2174)
    {
        _2226 = _942;
    }
    float _2230 = _2226;
    float _2232 = 0.0;
    float _2234 = _2230;
    if (!_2174)
    {
        _2232 = _942;
    }
    float _2236 = _2232;
    float _2238 = _2236;
    if (_2174)
    {
        _2222 = _914;
    }
    float _2240 = _2222;
    if (_2174)
    {
        _2228 = _914;
    }
    float _2242 = _2228;
    if (_2174)
    {
        _2234 = _922;
    }
    float _2244 = _2234;
    float _2246 = _2180 * _2142;
    if (_2174)
    {
        _2238 = _922;
    }
    float _2248 = _2238;
    float _2250 = _2180 * _2056;
    bool _2252 = _926 != 2;
    float _2254 = _2180 * _2126;
    float _2256 = _2244 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2258 = !_1738;
    int _2260 = _2258 ? 0 : 1;
    float _2262 = fma(_2178, _2124, _2254);
    float _2264 = fma(_2256, -2.0, _2168);
    int _2266 = ~_2122;
    int _2268 = _2266 + _2164;
    int _2270 = _2268 + 1;
    float _2272 = fma(_2182, _2128, _2262);
    int _2274 = ~_1928;
    int _2276 = _2274 + _1988;
    int _2278 = _2276 + 1;
    int _2280 = abs(_1810);
    float _2282 = _2272 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    if (_2252)
    {
        _2148 = _914;
    }
    float _2284 = _2148;
    int _2286 = _829 * _2270;
    int _2288 = _2286 + _1584;
    float _2290 = _2284;
    if (_2252)
    {
        _1532 = _922;
    }
    float _2292 = _1532;
    int _2294 = _749 * _2278;
    int _2296 = _2294 + _1234;
    float _2298 = _2292;
    if (!_2252)
    {
        _2290 = _942;
    }
    float _2300 = _2290;
    if (!_2252)
    {
        _2298 = _914;
    }
    float _2302 = _2298;
    int _2304 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2306 = _2304 != 0;
    float _2308 = fma(_2178, _2140, _2246);
    float _2310 = fma(_2178, _2054, _2250);
    float _2312 = _914 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2314 = fma(_2182, _2144, _2308);
    float _2316 = fma(_2182, _2058, _2310);
    float _2318 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2320 = log2(_2318);
    float _2322 = -_2102;
    float _2324 = fma(_2312, 2.0, _2322);
    float _2326 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2328 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2330 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2332 = _922 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2334 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2326);
    float _2336 = _928 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2338 = fma(_2332, -2.0, _2328);
    float _2340 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2342 = fma(_2336, -2.0, _2100);
    float _2344 = _2240 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2346 = fma(_2248, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2330);
    float _2348 = _2320 * _127;
    float _2350 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2340);
    float _2352 = _930 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _2354 = !_2306;
    float _2356 = _2354 ? _193 : as_type<float>(_2172);
    float _2358 = exp2(_2348);
    bool _2360 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2362 = isnan(0.0);
    bool _2364 = _2360 || _2362;
    bool _2366 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2368 = _2364 || _2366;
    float _2370 = -_2112;
    float _2372 = fma(_2344, 2.0, _2370);
    float _2374 = _2300 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2376 = _2302 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2378 = _914 * 2.0;
    float _2380 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2382 = -_2120;
    float _2384 = fma(_2374, 2.0, _2382);
    float _2386 = fma(_2376, -2.0, _2156);
    float _2388 = floor(_2378);
    float _2390 = -_2380;
    float _2392 = fma(_2352, 2.0, _2390);
    float _2394 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2396 = -_2358;
    float _2398 = _2396 + 1.0;
    float _2400 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2402 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2404 = fma(_2242, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2160);
    float _2406 = _2368 ? _2398 : 0.0;
    float _2408 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2394);
    bool _2410 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2412 = isnan(1.0);
    bool _2414 = _2410 || _2412;
    bool _2416 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2418 = _2414 || _2416;
    float _2420 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2422 = 1.0 + _2420;
    float _2424 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2426 = _2424 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2428 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2400);
    float _2430 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2402);
    float _2432 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2434 = _2432 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2436 = 1.0 / _2422;
    float _2438 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2408);
    float _2440 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2350);
    float _2442 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2338);
    float _2444 = -_127;
    float _2446 = fma(_2444, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2392);
    float _2448 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2404);
    float _2450 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2428);
    float _2452 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2430);
    float _2454 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2184);
    float _2456 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2334);
    float _2458 = -_127;
    float _2460 = fma(_2458, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2324);
    float _2462 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2342);
    float _2464 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2346);
    float _2466 = -_127;
    float _2468 = fma(_2466, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2372);
    float _2470 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2264);
    float _2472 = -_127;
    float _2474 = fma(_2472, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2384);
    float _2476 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2386);
    if (_2418)
    {
        float _2478 = _2406 * _2436;
        _137 = _2478;
    }
    float _2480 = _137;
    float _2482 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2484 = _2482 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2486 = 1.0 / _2426;
    float _2488 = _2316 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _2490 = _2388 >= 0.0;
    bool _2492 = isnan(_2388);
    bool _2494 = _2490 || _2492;
    bool _2496 = isnan(0.0);
    bool _2498 = _2494 || _2496;
    float _2500 = _2314 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2502 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2504 = _2502 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _2506 = _2498 ? 0 : 1;
    float _2508 = 1.0 / _2434;
    bool _2510 = _2388 > 0.0;
    float _2512 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2514 = _2512 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2516 = -_2450;
    float _2518 = _2516 + 1.0;
    float _2520 = -_2452;
    float _2522 = _2520 + 1.0;
    float _2524 = floor(_982);
    float _2526 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2528 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2526;
    float _2530 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2532 = _2530 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2534 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2536 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2534;
    float _2538 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2540 = _2538 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _2542 = _1890 >> 31;
    float _2544 = _2532 * _2486;
    int _2546 = ~_2506;
    int _2548 = _2546 + 1;
    int _2550 = _2548 + 1;
    float _2552 = 1.0 / _2484;
    float _2554 = _2536 * _2508;
    int _2556 = _2550;
    if (!_2510)
    {
        int _2558 = ~_2506;
        int _2560 = _2558 + 1;
        _2556 = _2560;
    }
    int _2562 = _2556;
    float _2564 = -_2212;
    float _2566 = _2564 + 1.0;
    float _2568 = -_2454;
    float _2570 = _2568 + 1.0;
    int _2572 = abs(_2110);
    float _2574 = 1.0 / _2504;
    bool _2576 = _2524 >= 0.0;
    bool _2578 = isnan(_2524);
    bool _2580 = _2576 || _2578;
    bool _2582 = isnan(0.0);
    bool _2584 = _2580 || _2582;
    float _2586 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2588 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2586;
    float _2590 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2592 = _2590 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _2594 = ~_2572;
    int _2596 = _2594 + 1;
    int _2598 = _2596 + 1;
    int _2600 = _2584 ? 0 : 1;
    float _2602 = _2592 * _2218;
    float _2604 = 1.0 / _2514;
    float _2606 = _2528 * _2552;
    float _2608 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2610 = _2608 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _2612 = _2524 > 0.0;
    float _2614 = _942 * 2.0;
    bool _2616 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2618 = isnan(_731);
    bool _2620 = _2616 || _2618;
    bool _2622 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2624 = _2620 || _2622;
    float _2626 = float(_2624);
    int _2628 = abs(_2260);
    float _2630 = 1.0 / _2540;
    float _2632 = _2610 * _2574;
    int _2634 = abs(_2154);
    int _2636 = abs(_1960);
    float _2638 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2640 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2638;
    float _2642 = _2588 * _2604;
    bool _2644 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2646 = isnan(_731);
    bool _2648 = _2644 || _2646;
    bool _2650 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2652 = _2648 || _2650;
    float _2654 = float(_2652);
    float _2656 = floor(_2614);
    int _2658 = ~_2600;
    int _2660 = _2658 + 1;
    int _2662 = _2660 + 1;
    int _2664 = _2662;
    if (!_2612)
    {
        int _2666 = ~_2600;
        int _2668 = _2666 + 1;
        _2664 = _2668;
    }
    int _2670 = _2664;
    float _2672 = -_2654;
    float _2674 = _2672 + 1.0;
    bool _2676 = !_1514;
    int _2678 = _2676 ? _2288 : (-1);
    float _2680 = _2640 * _2630;
    float _2682 = _2626 * _2674;
    float _2684 = -_2626;
    float _2686 = _2684 + 1.0;
    bool _2688 = !_1294;
    int _2690 = _2688 ? _2200 : (-1);
    bool _2692 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2694 = isnan(_731);
    bool _2696 = _2692 || _2694;
    bool _2698 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2700 = _2696 || _2698;
    float _2702 = float(_2700);
    float _2704 = _2212 * _2686;
    int _2706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2708 = _2706 != 0;
    int _2710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2712 = _2710 != 0;
    int _2714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2716 = _2714 != 0;
    float _2718 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2720 = _731 + _2718;
    bool _2722 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2724 = isnan(_731);
    bool _2726 = _2722 || _2724;
    bool _2728 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2730 = _2726 || _2728;
    float _2732 = float(_2730);
    float _2734 = _2702 * _2566;
    bool _2736 = _2656 >= 0.0;
    bool _2738 = isnan(_2656);
    bool _2740 = _2736 || _2738;
    bool _2742 = isnan(0.0);
    bool _2744 = _2740 || _2742;
    float _2746 = -_2702;
    float _2748 = _2746 + 1.0;
    bool _2750 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2752 = isnan(_731);
    bool _2754 = _2750 || _2752;
    bool _2756 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2758 = _2754 || _2756;
    float _2760 = float(_2758);
    float _2762 = -_2732;
    float _2764 = _2762 + 1.0;
    int _2766 = _2744 ? 0 : 1;
    float _2768 = _2732 * _2748;
    bool _2770 = _2656 > 0.0;
    float _2772 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2774 = _731 + _2772;
    bool _2776 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2778 = isnan(_731);
    bool _2780 = _2776 || _2778;
    bool _2782 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2784 = _2780 || _2782;
    float _2786 = float(_2784);
    float _2788 = fma(_2606, _2720, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2790 = -_2760;
    float _2792 = _2790 + 1.0;
    float _2794 = _2760 * _2764;
    int _2796 = _2542 & 3;
    float _2798 = fma(_2544, _2774, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _2800 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2802 = isnan(_731);
    bool _2804 = _2800 || _2802;
    bool _2806 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2808 = _2804 || _2806;
    float _2810 = float(_2808);
    float _2812 = _2786 * _2792;
    float _2814 = -_2786;
    float _2816 = _2814 + 1.0;
    int _2818 = _1890 + _2796;
    float _2820 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2822 = _731 + _2820;
    float _2824 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2826 = _731 + _2824;
    float _2828 = _2810 * _2816;
    int _2830 = _2818 >> 2;
    float _2832 = -_2810;
    float _2834 = _2832 + 1.0;
    float _2836 = fma(_2554, _2822, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2838 = _2788 * _2828;
    int _2840 = _2830 << 4;
    int _2842 = _2840 + 656;
    float _2844 = fma(_2632, _2826, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2846 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2848 = _731 + _2846;
    float _2850 = fma(_2834, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2838);
    uint _2852 = uint(int(uint(_2842) >> uint(2)));
    uint _2854 = uint(int(uint(int(_2852)) >> uint(2)));
    int _2856 = int(_2852) & 3;
    float _2858 = (*spvDescriptorSet0.vp_c9)._m0[int(_2854)][_2856];
    int _2860 = int(_2852) + 1;
    uint _2862 = uint(int(uint(_2860) >> uint(2)));
    int _2864 = _2860 & 3;
    float _2866 = (*spvDescriptorSet0.vp_c9)._m0[int(_2862)][_2864];
    float _2868 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2870 = _731 + _2868;
    float _2872 = fma(_2602, _2848, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2874 = fma(_2798, _2812, _2850);
    int _2876 = ~_2766;
    int _2878 = _2876 + 1;
    int _2880 = _2878 + 1;
    float _2882 = fma(_2642, _2870, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _2884 = _2880;
    if (!_2770)
    {
        int _2886 = ~_2766;
        int _2888 = _2886 + 1;
        _2884 = _2888;
    }
    int _2890 = _2884;
    float _2892 = fma(_2836, _2794, _2874);
    float _2894 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2896 = _2488 + _2894;
    int _2898 = _2842 + 8;
    uint _2900 = uint(int(uint(_2898) >> uint(2)));
    uint _2902 = uint(int(uint(int(_2900)) >> uint(2)));
    int _2904 = int(_2900) & 3;
    float _2906 = (*spvDescriptorSet0.vp_c9)._m0[int(_2902)][_2904];
    int _2908 = int(_2900) + 1;
    uint _2910 = uint(int(uint(_2908) >> uint(2)));
    int _2912 = _2908 & 3;
    float _2914 = (*spvDescriptorSet0.vp_c9)._m0[int(_2910)][_2912];
    float _2916 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2918 = _2500 + _2916;
    float _2920 = fma(_2844, _2768, _2892);
    float _2922 = _2896 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2924 = _922 + _914;
    float _2926 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2928 = _731 + _2926;
    bool _2930 = !_1910;
    int _2932 = _2930 ? 0 : 1;
    float _2934 = fma(_2918, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2922);
    float _2936 = _914 + _942;
    float _2938 = _914 + (-0.5);
    float _2940 = fma(_2882, _2734, _2920);
    bool _2942 = _1908 != 3;
    float _2944 = _2924 + (-1.0);
    float _2946 = _922 + _942;
    float _2948 = _922 + (-0.5);
    float _2950 = _1906 + (-0.5);
    int _2952 = abs(_2932);
    float _2954 = fma(_2872, _2704, _2940);
    int _2956 = ~_2196;
    int _2958 = _2956 + 1;
    int _2960 = _2958 + 1;
    float _2962 = -_2950;
    float _2964 = -_2462;
    float _2966 = fma(_2962, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2964);
    float _2968 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2970 = int(_2968);
    float _2972 = fma(_2680, _2928, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2974 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2976 = _2282 + _2974;
    int _2978 = abs(_2034);
    float _2980 = fma(_2944, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2982 = ~_2952;
    int _2984 = _2982 + 1;
    int _2986 = _2984 + 1;
    float _2988 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2934);
    int _2990 = ~_2978;
    int _2992 = _2990 + 1;
    int _2994 = _2992 + 1;
    float _2996 = _2356 + 0.5;
    bool _2998 = !_2942;
    int _3000 = _2998 ? 0 : (-1);
    float _3002 = _1918 + (-0.5);
    bool _3004 = _2988 >= 0.0;
    float _3006 = _1716 + 0.5;
    int _3008 = abs(_3000);
    float _3010 = fma(_2972, _2682, _2954);
    bool _3012 = !_2708;
    int _3014 = _3012 ? 0 : 1;
    float _3016 = fma(_3006, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2446);
    int _3018 = ~_3008;
    int _3020 = _3018 + 1;
    int _3022 = _3020 + 1;
    int _3024 = _2960 * as_type<int>(_2866);
    float _3026 = fma(_2996, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2460);
    float _3028 = -_3002;
    float _3030 = -_2442;
    float _3032 = fma(_3028, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3030);
    int _3034 = abs(_2046);
    int _3036 = _2986 * as_type<int>(_2858);
    int _3038 = _3036 + _3024;
    float _3040 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3042 = _2858;
    if (_3004)
    {
        _3042 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3044 = _3042;
    int _3046 = ~_3034;
    int _3048 = _3046 + 1;
    int _3050 = _3048 + 1;
    int _3052 = _2994 * as_type<int>(_2906);
    int _3054 = _3052 + _3038;
    float _3056 = float(uint(_2970));
    float _3058 = _2896 * _2896;
    int _3060 = as_type<int>(_3044);
    if (_3004)
    {
        float _3062 = _3044 * 5.0;
        _3060 = as_type<int>(_3062);
    }
    int _3064 = _3060;
    int _3066 = _3022 * as_type<int>(_2914);
    int _3068 = _3066 + _3054;
    float _3070 = -_2440;
    float _3072 = _3070 + 1.0;
    float _3074 = -_2456;
    float _3076 = _3074 + 1.0;
    float _3078 = 1.0 / _3056;
    int _3080 = _3068 * _3050;
    float _3082 = fma(_2918, _2918, _3058);
    float _3084 = -_3072;
    float _3086 = fma(_3084, _1716, _3016);
    float _3088 = fma(_3076, _1906, _2966);
    int _3090 = _2690 * _3034;
    int _3092 = _3090 + _3080;
    float _3094 = fma(_2976, _2976, _3082);
    int _3096 = abs(_2970);
    if (_3004)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9441 = as_type<float>(_3064);
        out.gl_Position.z = _9441;
    }
    float _3098 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3100 = _2052 >> 31;
    float _3102 = _3040 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    out.m_74.x = _3086;
    out.m_74.y = _3088;
    float _3104 = float(uint(_3096));
    float _3106 = fma(_2654, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3010);
    int _3108 = _3100 & 3;
    if (_3004)
    {
        out.m_55.x = 0.0;
    }
    float _3110 = rsqrt(_3094);
    int _3112 = _1706 >> 31;
    int _3114 = as_type<int>(_3078) + (-2);
    float _3116 = _1680 + 0.5;
    float _3118 = float(uint(_3092));
    float _3120 = _1438 + (-0.5);
    int _3122 = _3112 & 3;
    float _3124 = 1.0 / _3104;
    float _3126 = _3098 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3128 = as_type<float>(_3114) * _3118;
    float _3130 = fma(_3102, _3116, _2468);
    int _3132 = _1706 + _3122;
    float _3134 = -_3126;
    float _3136 = -_2470;
    float _3138 = fma(_3134, _3120, _3136);
    int _3140 = ~_2970;
    int _3142 = _3140 + 1;
    out.m_76.x = _3106;
    float _3144 = trunc(_3128);
    float _3146 = precise::max(_3144, 0.0);
    uint _3148 = uint(_3146);
    int _3150 = _2052 + _3108;
    float _3152 = _2896 * _3110;
    float _3154 = _2918 * _3110;
    int _3156 = abs(_3092);
    int _3158 = _3150 >> 2;
    float _3160 = -_3152;
    float _3162 = fma(_3160, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2896);
    int _3164 = as_type<int>(_3124) + (-2);
    float _3166 = -_3154;
    float _3168 = fma(_3166, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2918);
    int _3170 = _3158 << 4;
    int _3172 = _3170 + 800;
    float _3174 = _3162 * _3162;
    int _3176 = _3132 >> 2;
    float _3178 = float(uint(_3156));
    uint _3180 = uint(int(uint(_3172) >> uint(2)));
    uint _3182 = uint(int(uint(int(_3180)) >> uint(2)));
    int _3184 = int(_3180) & 3;
    float _3186 = (*spvDescriptorSet0.vp_c9)._m0[int(_3182)][_3184];
    int _3188 = int(_3180) + 1;
    uint _3190 = uint(int(uint(_3188) >> uint(2)));
    int _3192 = _3188 & 3;
    float _3194 = (*spvDescriptorSet0.vp_c9)._m0[int(_3190)][_3192];
    int _3196 = _3142 * int(_3148);
    int _3198 = _3196 + _3092;
    int _3200 = _3176 << 4;
    int _3202 = _3200 + 368;
    float _3204 = fma(_3168, _3168, _3174);
    float _3206 = as_type<float>(_3164) * _3178;
    int _3208 = abs(_3014);
    float _3210 = -_2448;
    float _3212 = _3210 + 1.0;
    float _3214 = float(uint(_3198));
    uint _3216 = uint(int(uint(_3202) >> uint(2)));
    uint _3218 = uint(int(uint(int(_3216)) >> uint(2)));
    int _3220 = int(_3216) & 3;
    float _3222 = (*spvDescriptorSet0.vp_c9)._m0[int(_3218)][_3220];
    int _3224 = int(_3216) + 1;
    uint _3226 = uint(int(uint(_3224) >> uint(2)));
    int _3228 = _3224 & 3;
    float _3230 = (*spvDescriptorSet0.vp_c9)._m0[int(_3226)][_3228];
    float _3232 = -_2438;
    float _3234 = _3232 + 1.0;
    float _3236 = float(_2890);
    float _3238 = trunc(_3206);
    float _3240 = precise::max(_3238, 0.0);
    uint _3242 = uint(_3240);
    float _3244 = as_type<float>(_3114) * _3214;
    float _3246 = -_3234;
    float _3248 = fma(_2356, _3246, _3026);
    float _3250 = -_2464;
    float _3252 = _3250 + 1.0;
    float _3254 = fma(_1918, _2518, _3032);
    int _3256 = ~_3096;
    int _3258 = _3256 + 1;
    float _3260 = -_3212;
    float _3262 = fma(_1680, _3260, _3130);
    float _3264 = fma(_1438, _3252, _3138);
    float _3266 = trunc(_3244);
    float _3268 = precise::max(_3266, 0.0);
    uint _3270 = uint(_3268);
    int _3272 = ~_2970;
    int _3274 = _3272 + 1;
    float _3276 = float(_3208);
    out.m_78.x = _3248;
    out.m_78.y = _3254;
    out.m_78.z = _3262;
    out.m_78.w = _3264;
    bool _3278 = _749 == 0;
    int _3280 = _3258 * int(_3242);
    int _3282 = _3280 + _3156;
    float _3284 = _3276 * _3236;
    bool _3286 = !_3278;
    int _3288 = _3286 ? _2296 : (-1);
    int _3290 = _3202 + 8;
    uint _3292 = uint(int(uint(_3290) >> uint(2)));
    uint _3294 = uint(int(uint(int(_3292)) >> uint(2)));
    int _3296 = int(_3292) & 3;
    float _3298 = (*spvDescriptorSet0.vp_c9)._m0[int(_3294)][_3296];
    int _3300 = int(_3292) + 1;
    uint _3302 = uint(int(uint(_3300) >> uint(2)));
    int _3304 = _3300 & 3;
    float _3306 = (*spvDescriptorSet0.vp_c9)._m0[int(_3302)][_3304];
    float _3308 = float(uint(_3282));
    int _3310 = int(_3148) + int(_3270);
    float _3312 = as_type<float>(_3164) * _3308;
    int _3314 = _3172 + 8;
    uint _3316 = uint(int(uint(_3314) >> uint(2)));
    uint _3318 = uint(int(uint(int(_3316)) >> uint(2)));
    int _3320 = int(_3316) & 3;
    float _3322 = (*spvDescriptorSet0.vp_c9)._m0[int(_3318)][_3320];
    int _3324 = int(_3316) + 1;
    uint _3326 = uint(int(uint(_3324) >> uint(2)));
    int _3328 = _3324 & 3;
    float _3330 = (*spvDescriptorSet0.vp_c9)._m0[int(_3326)][_3328];
    bool _3332 = !_2074;
    int _3334 = _3332 ? 0 : 1;
    int _3336 = _3274 * _3310;
    int _3338 = _3336 + _3092;
    float _3340 = trunc(_3312);
    float _3342 = precise::max(_3340, 0.0);
    uint _3344 = uint(_3342);
    int _3346 = ~_2280;
    int _3348 = _3346 + 1;
    int _3350 = _3348 + 1;
    bool _3352 = _1736 != 3;
    int _3354 = _2598 * as_type<int>(_3194);
    int _3356 = abs(_3334);
    int _3358 = ~_3096;
    int _3360 = _3358 + 1;
    int _3362 = ~_2628;
    int _3364 = _3362 + 1;
    int _3366 = _3364 + 1;
    int _3368 = _3350 * as_type<int>(_3230);
    bool _3370 = !_3352;
    int _3372 = _3370 ? 0 : (-1);
    bool _3374 = uint(_3338) >= uint(_2970);
    int _3376 = _3366 * as_type<int>(_3222);
    int _3378 = _3376 + _3368;
    int _3380 = int(_3242) + int(_3344);
    int _3382 = ~_3356;
    int _3384 = _3382 + 1;
    int _3386 = _3384 + 1;
    bool _3388 = !_3374;
    int _3390 = _3388 ? 0 : (-1);
    int _3392 = _3360 * _3380;
    int _3394 = _3392 + _3156;
    bool _3396 = _2072 != 3;
    int _3398 = _3386 * as_type<int>(_3186);
    int _3400 = _3398 + _3354;
    int _3402 = abs(_1880);
    int _3404 = ~_3310;
    int _3406 = _3404 + _3390;
    int _3408 = _3406 + 1;
    bool _3410 = !_3396;
    int _3412 = _3410 ? 0 : (-1);
    bool _3414 = uint(_3394) >= uint(_3096);
    int _3416 = _2970 * _3408;
    int _3418 = _3416 + _3092;
    int _3420 = ~_3402;
    int _3422 = _3420 + 1;
    int _3424 = _3422 + 1;
    int _3426 = abs(_3372);
    int _3428 = _3424 * as_type<int>(_3298);
    int _3430 = _3428 + _3378;
    int _3432 = _3092 ^ _2970;
    float _3434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3436 = ~_2634;
    int _3438 = _3436 + 1;
    int _3440 = _3438 + 1;
    int _3442 = ~_3426;
    int _3444 = _3442 + 1;
    int _3446 = _3444 + 1;
    bool _3448 = !_3414;
    int _3450 = _3448 ? 0 : (-1);
    int _3452 = _3440 * as_type<int>(_3322);
    int _3454 = _3452 + _3400;
    uint _3456 = uint(int(uint(_3432) >> uint(31)));
    int _3458 = _3446 * as_type<int>(_3306);
    int _3460 = _3458 + _3430;
    int _3462 = abs(_3412);
    float _3464 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3466 = ~_3450;
    int _3468 = _3380 + _3466;
    int _3470 = _3468 + 1;
    int _3472 = ~int(_3456);
    int _3474 = _3472 + 1;
    int _3476 = abs(_2062);
    bool _3478 = _2970 == 0;
    int _3480 = ~_3462;
    int _3482 = _3480 + 1;
    int _3484 = _3482 + 1;
    int _3486 = _3470 ^ _3474;
    int _3488 = ~_2636;
    int _3490 = _3488 + 1;
    int _3492 = _3490 + 1;
    int _3494 = _3484 * as_type<int>(_3330);
    int _3496 = _3494 + _3454;
    bool _3498 = !_3478;
    int _3500 = _3498 ? _3418 : (-1);
    float _3502 = _3464 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3504 = _3460 * _3492;
    bool _3506 = _2970 == 0;
    float _3508 = in.m_80.x;
    float _3510 = in.m_80.y;
    float _3512 = in.m_80.z;
    int _3514 = ~_3474;
    int _3516 = _3514 + _3486;
    int _3518 = _3516 + 1;
    int _3520 = _3288 * _2636;
    int _3522 = _3520 + _3504;
    int _3524 = ~_3476;
    int _3526 = _3524 + 1;
    int _3528 = _3526 + 1;
    bool _3530 = !_3506;
    int _3532 = _3530 ? _3518 : (-1);
    float _3534 = float(_3500);
    int _3536 = _3496 * _3528;
    float _3538 = float(_3532);
    float _3540 = _3434 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3542 = float(_3522);
    float _3544 = fma(_3502, _3534, _2474);
    float _3546 = _1126 + 0.5;
    float _3548 = -_2476;
    float _3550 = fma(_3540, _3538, _3548);
    float _3552 = _1064 + (-0.5);
    int _3554 = _2678 * _3476;
    int _3556 = _3554 + _3536;
    float _3558 = fma(_3502, _3546, _3544);
    out.m_82.x = _3542;
    float _3560 = -_3540;
    float _3562 = fma(_3560, _3552, _3550);
    float _3564 = _3284 * (-2.0);
    float _3566 = -_2522;
    float _3568 = fma(_1126, _3566, _3558);
    float _3570 = float(_3556);
    float _3572 = fma(_1064, _2570, _3562);
    float _3574 = fma(_2980, _3564, _2980);
    float _3576 = fma(_3564, _3508, _3508);
    float _3578 = _2976 * _3110;
    bool _3580 = !_2712;
    int _3582 = _3580 ? 0 : 1;
    out.m_82.w = _3570;
    bool _3584 = !_2716;
    int _3586 = _3584 ? 0 : 1;
    float _3588 = -_3578;
    float _3590 = fma(_3588, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2976);
    int _3592 = abs(_3582);
    out.m_84.x = _3568;
    out.m_84.y = _3572;
    float _3594 = _3512;
    if (_3004)
    {
        return out;
    }
    float _3596 = -_3152;
    float _3598 = fma(_3596, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2488);
    float _3600 = -_3154;
    float _3602 = fma(_3600, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2500);
    float _3604 = float(_2562);
    float _3606 = _2946 + (-1.0);
    float _3608 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3610 = _3598 + _3608;
    float _3612 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3614 = _3602 + _3612;
    float _3616 = float(_3592);
    float _3618 = fma(_2938, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3576);
    float _3620 = _3610 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3622 = _2936 + (-1.0);
    float _3624 = _3616 * _3604;
    float _3626 = fma(_3614, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3620);
    float _3628 = -_3578;
    float _3630 = fma(_3628, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2282);
    int _3632 = abs(_3586);
    float _3634 = fma(_3606, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3636 = fma(_3574, _2480, _3618);
    float _3638 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3640 = _3630 + _3638;
    float _3642 = float(_2670);
    float _3644 = fma(_3590, _3590, _3204);
    float _3646 = float(_3632);
    float _3648 = fma(_3640, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3626);
    float _3650 = _3624 * (-2.0);
    float _3652 = _3636 * 0.15915493667125701904296875;
    float _3654 = sqrt(_3644);
    float _3656 = _3646 * _3642;
    float _3658 = fma(_3650, _3510, _3510);
    bool _3660 = _3648 >= 0.0;
    float _3662 = fma(_3634, _3650, _3634);
    float _3664 = _3656 * (-2.0);
    float _3666 = fma(_2948, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3658);
    float _3668 = _3652 * 6.283185482025146484375;
    float _3670 = sin(_3668);
    float _3672 = fma(_3664, _3512, _3512);
    float _3674 = fma(_3662, _2480, _3666);
    float _3676 = _942 + (-0.5);
    float _3678 = fma(_3622, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3680 = _3674 * 0.15915493667125701904296875;
    float _3682 = fma(_3676, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3672);
    if (_3660)
    {
        _3594 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3684 = _3594;
    float _3686 = _3652 * 6.283185482025146484375;
    float _3688 = cos(_3686);
    float _3690 = fma(_3678, _3664, _3678);
    int _3692 = as_type<int>(_3684);
    if (_3660)
    {
        out.m_55.x = 0.0;
    }
    if (_3660)
    {
        float _3694 = _3684 * 5.0;
        _3692 = as_type<int>(_3694);
    }
    int _3696 = _3692;
    float _3698 = fma(_3690, _2480, _3682);
    float _3700 = _3680 * 6.283185482025146484375;
    float _3702 = sin(_3700);
    if (_3660)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10342 = as_type<float>(_3696);
        out.gl_Position.z = _10342;
    }
    float _3704 = _3698 * 0.15915493667125701904296875;
    float _3706 = _3680 * 6.283185482025146484375;
    float _3708 = cos(_3706);
    if (_3660)
    {
        return out;
    }
    float _3710 = _3704 * 6.283185482025146484375;
    float _3712 = cos(_3710);
    float _3714 = _3110 * _3654;
    float _3716 = _535 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3718 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _3720 = _537 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3722 = _3670 * _3702;
    float _3724 = _3714 * _3716;
    float _3726 = _3688 * _3708;
    float _3728 = _3704 * 6.283185482025146484375;
    float _3730 = sin(_3728);
    float _3732 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _3734 = _3718 * _3724;
    float _3736 = _3714 * _3720;
    float _3738 = _3670 * _3708;
    float _3740 = _3688 * _3702;
    float _3742 = _3714 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3744 = _3742 * 0.5;
    float _3746 = _3732 * _3736;
    float _3748 = _3688 * _3712;
    float _3750 = _3670 * _3712;
    float _3752 = _3708 * _3712;
    float _3754 = _3702 * _3712;
    float _3756 = _3748 * _3734;
    float _3758 = _197 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3760 = fma(_3730, _3726, _3722);
    float _3762 = -_3738;
    float _3764 = fma(_3730, _3740, _3762);
    float _3766 = -_3734;
    float _3768 = _3730 * _3766;
    float _3770 = -_3740;
    float _3772 = fma(_3730, _3738, _3770);
    float _3774 = fma(_3760, _3746, _3756);
    float _3776 = _3750 * _3734;
    float _3778 = fma(_3752, _3746, _3768);
    float _3780 = fma(_3730, _3722, _3726);
    float _3782 = fma(_3764, _3744, _3774);
    float _3784 = fma(_3772, _3746, _3776);
    float _3786 = fma(_3754, _3744, _3778);
    float _3788 = _3782 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3790 = _3782 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3792 = fma(_3780, _3744, _3784);
    float _3794 = _3782 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3796 = fma(_3786, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3788);
    float _3798 = fma(_3786, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3790);
    float _3800 = _3760 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3802 = fma(_3786, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3794);
    float _3804 = fma(_3792, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3796);
    float _3806 = fma(_3792, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3798);
    float _3808 = fma(_3758, _3758, 1.0);
    float _3810 = fma(_3792, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3802);
    float _3812 = _3804 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3814 = _3806 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3816 = _3764 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3818 = _3810 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3820 = _2500 + _3812;
    float _3822 = _2282 + _3814;
    float _3824 = _3760 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3826 = _3760 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3828 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3830 = _3820 + _3828;
    float _3832 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3834 = _3822 + _3832;
    float _3836 = fma(_3752, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3824);
    float _3838 = fma(_3752, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3800);
    float _3840 = _3830 * _3830;
    float _3842 = _3834 * _3834;
    float _3844 = fma(_3752, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3826);
    float _3846 = _3748 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3848 = _3748 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3850 = _3840 + _3842;
    float _3852 = _3748 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3854 = -_3730;
    float _3856 = fma(_3854, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3846);
    float _3858 = _3764 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3860 = sqrt(_3850);
    float _3862 = _3764 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3864 = _2488 + _3818;
    float _3866 = -_3730;
    float _3868 = fma(_3866, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3848);
    float _3870 = -_3730;
    float _3872 = fma(_3870, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3852);
    float _3874 = fma(_3754, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3858);
    float _3876 = fma(_3754, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3816);
    float _3878 = fma(_3754, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3862);
    float _3880 = rsqrt(_3808);
    bool _3882 = _3860 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3884 = _3754;
    float _3886 = _3848;
    float _3888 = _3852;
    float _3890 = _3808;
    float _3892 = _3858;
    if (!_3882)
    {
        _3884 = _3842;
    }
    float _3894 = _3884;
    float _3896 = _3894;
    if (!_3882)
    {
        _3886 = _3840;
    }
    float _3898 = _3886;
    float _3900 = _3898;
    if (!_3882)
    {
        _3888 = _3820;
    }
    float _3902 = _3888;
    float _3904 = _3902;
    if (!_3882)
    {
        _3890 = _3822;
    }
    float _3906 = _3890;
    float _3908 = _3906;
    if (!_3882)
    {
        _3892 = _3864;
    }
    float _3910 = _3892;
    bool _3912 = !_3882;
    float _3914 = _3910;
    if (!_3912)
    {
        float _3916 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3918 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3920 = _3860 + _3918;
        float _3922 = rsqrt(_3850);
        float _3924 = _3920 * _3916;
        float _3926 = _3864 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3928 = _3924 * 0.15915493667125701904296875;
        float _3930 = _3928 * 6.283185482025146484375;
        float _3932 = sin(_3930);
        float _3934 = _3928 * 6.283185482025146484375;
        float _3936 = cos(_3934);
        float _3938 = fma(_3932, _3926, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3940 = _3922 * _3938;
        float _3942 = _3936 + (-1.0);
        float _3944 = fma(_3830, _3940, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3946 = fma(_3834, _3940, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3948 = _3942 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3950 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3952 = _3944 + _3950;
        float _3954 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3956 = _3946 + _3954;
        float _3958 = fma(_3864, _3936, _3948);
        float _3960 = _3952 * _3952;
        float _3962 = _3956 * _3956;
        _3914 = _3958;
        _3900 = _3960;
        _3896 = _3962;
        _3904 = _3944;
        _3908 = _3946;
    }
    float _3964 = _3914;
    float _3966 = _3900;
    float _3968 = _3896;
    float _3970 = _3904;
    float _3972 = _3908;
    float _3974 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3976 = _3964 + _3974;
    float _3978 = fma(_3750, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3868);
    float _3980 = fma(_3750, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3856);
    float _3982 = fma(_3750, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3872);
    float _3984 = fma(_3976, _3976, _3966);
    float _3986 = fma(_3780, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3874);
    float _3988 = fma(_3780, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3876);
    float _3990 = fma(_3780, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3878);
    float _3992 = _3984 + _3968;
    float _3994 = fma(_3772, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3836);
    float _3996 = _3758 * _3880;
    float _3998 = fma(_3772, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3838);
    float _4000 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4002 = _3758 * _3978;
    float _4004 = _3758 * _3980;
    float _4006 = fma(_3772, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3844);
    float _4008 = _3758 * _3982;
    float _4010 = -_3986;
    float _4012 = _3996 * _4010;
    float _4014 = -_3988;
    float _4016 = _3996 * _4014;
    float _4018 = -_3990;
    float _4020 = _3996 * _4018;
    float _4022 = sqrt(_3992);
    float _4024 = fma(_4000, _3994, _4002);
    float _4026 = fma(_4000, _3998, _4004);
    float _4028 = fma(_4000, _4006, _4008);
    float _4030 = fma(_3880, _3978, _4012);
    float _4032 = fma(_3880, _3980, _4016);
    float _4034 = fma(_3880, _3982, _4020);
    float _4036 = _3986 + _4024;
    float _4038 = _3988 + _4026;
    float _4040 = _3990 + _4028;
    out.m_86.x = _3994;
    out.m_86.y = _3998;
    out.m_86.z = _4006;
    out.m_88.x = _4030;
    out.m_88.y = _4032;
    out.m_88.z = _4034;
    bool _4042 = _4022 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4044 = isnan(_4022);
    bool _4046 = _4042 || _4044;
    bool _4048 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4050 = _4046 || _4048;
    out.m_90.x = _4036;
    out.m_90.y = _4038;
    out.m_90.z = _4040;
    float _4052 = _4026;
    float _4054 = _3994;
    float _4056 = _4034;
    if (!_4050)
    {
        _4052 = 1.0;
    }
    float _4058 = _4052;
    bool _4060 = !_4050;
    float _4062 = _4058;
    if (!_4060)
    {
        bool _4064 = _4022 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4066 = isnan(_4022);
        bool _4068 = _4064 || _4066;
        bool _4070 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4072 = _4068 || _4070;
        if (!_4072)
        {
            float _4074 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4076 = _4022 + _4074;
            float _4078 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4080 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4078;
            float _4082 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4084 = _4082 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4086 = 1.0 / _4080;
            float _4088 = _4076 * _4086;
            float _4090 = fma(_4088, _4084, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4062 = _4090;
            _4092 = true;
        }
        else
        {
            bool _4094 = _4022 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4096 = isnan(_4022);
            bool _4098 = _4094 || _4096;
            bool _4100 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4102 = _4098 || _4100;
            if (!_4102)
            {
                float _4104 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4106 = _4022 + _4104;
                float _4108 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4110 = _4108 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4112 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4114 = _4112 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4116 = 1.0 / _4110;
                float _4118 = _4106 * _4116;
                float _4120 = fma(_4118, _4114, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4062 = _4120;
                _4092 = true;
            }
            else
            {
                _4062 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4092 = false;
    float _4122 = _4062;
    float _4124 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4126 = _3964 + _4124;
    float _4128 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4130 = _3970 + _4128;
    float _4132 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4134 = _3972 + _4132;
    float _4136 = fma(_4126, _4122, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4138 = fma(_4130, _4122, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4140 = fma(_4134, _4122, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4142 = -_3152;
    float _4144 = fma(_4142, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4136);
    float _4146 = -_3154;
    float _4148 = fma(_4146, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4138);
    float _4150 = -_3578;
    float _4152 = fma(_4150, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4140);
    float _4154 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4156 = _4144 + _4154;
    float _4158 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4160 = _4148 + _4158;
    float _4162 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4164 = _4152 + _4162;
    float _4166 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4168 = _4156 * _4156;
    float _4170 = fma(_3602, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4172 = fma(_4160, _4160, _4168);
    float _4174 = floor(_4170);
    float _4176 = fma(_3630, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4178 = fma(_4164, _4164, _4172);
    float _4180 = rsqrt(_4178);
    float _4182 = sqrt(_4178);
    float _4184 = _4180 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4186 = floor(_4176);
    float _4188 = _4160 * _4184;
    float _4190 = _4164 * _4184;
    float _4192 = _4188 * _4188;
    float _4194 = _4190 * _4190;
    float _4196 = _4192 + _4194;
    float _4198 = sqrt(_4196);
    float _4200 = -_4186;
    float _4202 = _4176 + _4200;
    bool _4204 = _4198 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4206 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4208 = _4198 + _4206;
    float _4210 = _4164;
    float _4212 = _4196;
    float _4214 = _4208;
    float _4216 = _4156;
    if (_4204)
    {
        float _4218 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4210 = _4218;
    }
    float _4220 = _4210;
    if (_4204)
    {
        float _4222 = rsqrt(_4196);
        _4212 = _4222;
    }
    float _4224 = _4212;
    float _4226 = _4224;
    if (_4204)
    {
        float _4228 = _4208 * _4220;
        _4214 = _4228;
    }
    float _4230 = _4214;
    if (_4204)
    {
        float _4232 = _4230 * 0.15915493667125701904296875;
        _4054 = _4232;
    }
    float _4234 = _4054;
    float _4236 = _4220;
    float _4238 = _4234;
    if (_4204)
    {
        float _4240 = _4234 * 6.283185482025146484375;
        float _4242 = sin(_4240);
        _4236 = _4242;
    }
    float _4244 = _4236;
    float _4246 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4248 = precise::max(0.0, _4246);
    float _4250 = _4168;
    float _4252 = _4248;
    if (_4204)
    {
        float _4254 = _4234 * 6.283185482025146484375;
        float _4256 = cos(_4254);
        _4250 = _4256;
    }
    float _4258 = _4250;
    float _4260 = -_4184;
    float _4262 = -_4248;
    float _4264 = fma(_4156, _4260, _4262);
    if (!_4204)
    {
        _4216 = _4188;
    }
    float _4266 = _4216;
    float _4268 = _4266;
    if (_4204)
    {
        float _4270 = _4264 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4252 = _4270;
    }
    float _4272 = _4252;
    float _4274 = _4244;
    float _4276 = _4272;
    if (_4204)
    {
        float _4278 = fma(_4244, _4272, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4274 = _4278;
    }
    float _4280 = _4274;
    float _4282 = _4280;
    float _4284 = _4258;
    if (_4204)
    {
        float _4286 = _4258 + (-1.0);
        _4276 = _4286;
    }
    float _4288 = _4276;
    float _4290 = _4288;
    if (_4204)
    {
        float _4292 = _4224 * _4280;
        _4056 = _4292;
    }
    float _4294 = _4056;
    if (!_4204)
    {
        _4282 = _4264;
    }
    float _4296 = _4282;
    float _4298 = _4296;
    if (_4204)
    {
        float _4300 = _4288 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4238 = _4300;
    }
    float _4302 = _4238;
    if (_4204)
    {
        float _4304 = _4188 * _4294;
        _4268 = _4304;
    }
    float _4306 = _4268;
    if (!_4204)
    {
        _4290 = _4190;
    }
    float _4308 = _4290;
    float _4310 = _4308;
    if (_4204)
    {
        float _4312 = _4190 * _4294;
        _4310 = _4312;
    }
    float _4314 = _4310;
    if (!_4204)
    {
        _4226 = _4192;
    }
    float _4316 = _4226;
    float _4318 = _4316;
    if (_4204)
    {
        float _4320 = fma(_4264, _4258, _4302);
        _4298 = _4320;
    }
    float _4322 = _4298;
    if (_4204)
    {
        float _4324 = _4306 * _4306;
        _4318 = _4324;
    }
    float _4326 = _4318;
    if (!_4204)
    {
        _4284 = _4194;
    }
    float _4328 = _4284;
    float _4330 = _4328;
    if (_4204)
    {
        float _4332 = _4314 * _4314;
        _4330 = _4332;
    }
    float _4334 = _4330;
    float _4336 = _4144 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4338 = fma(_4322, _4322, _4326);
    float _4340 = _4144 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4342 = _4144 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4344 = fma(_4148, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4336);
    float _4346 = _4338 + _4334;
    float _4348 = _4144 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4350 = fma(_4148, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4340);
    float _4352 = fma(_4152, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4344);
    float _4354 = rsqrt(_4346);
    float _4356 = fma(_4148, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4348);
    float _4358 = fma(_4152, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4350);
    float _4360 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4362 = fma(_4182, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4360);
    float _4364 = precise::clamp(_4362, 0.0, 1.0);
    float _4366 = _4352 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4368 = fma(_4152, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4356);
    float _4370 = fma(_4148, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4342);
    float _4372 = _4358 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4374 = -_4364;
    float _4376 = _4374 + 1.0;
    float _4378 = _4368 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4380 = _4366 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4382 = _4372 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4384 = fma(_4152, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4370);
    float _4386 = -_4174;
    float _4388 = _4170 + _4386;
    float _4390 = fma(_4378, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4380);
    float _4392 = -_4382;
    float _4394 = fma(_4392, _4166, 1.0);
    float _4396 = abs(_4376);
    float _4398 = log2(_4396);
    float _4400 = _4354 * _4322;
    float _4402 = fma(_4372, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4390);
    float _4404 = _4354 * _4306;
    float _4406 = _4354 * _4314;
    float _4408 = _4384 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4410 = _4366 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4412 = _4404 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4414 = log2(_4394);
    float _4416 = fma(_4408, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4402);
    float _4418 = fma(_4378, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4410);
    float _4420 = -_4412;
    float _4422 = fma(_4400, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4420);
    float _4424 = -_4406;
    float _4426 = fma(_4424, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4422);
    float _4428 = _4398 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4430 = 1.0 / _4416;
    float _4432 = _4366 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4434 = fma(_4426, -0.5, 0.5);
    float _4436 = fma(_4426, 0.5, 0.5);
    float _4438 = fma(_4372, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4418);
    float _4440 = fma(_4378, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4432);
    float _4442 = _4400 + 1.0;
    float _4444 = fma(_4436, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4446 = exp2(_4428);
    float _4448 = fma(_4408, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4438);
    float _4450 = _4414 * 0.693147182464599609375;
    float _4452 = fma(_4436, _4444, -0.212114393711090087890625);
    float _4454 = _4450 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4456 = fma(_4436, _4452, 1.570728778839111328125);
    float _4458 = sqrt(_4434);
    float _4460 = fma(_4372, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4440);
    float _4462 = _4448 * _4430;
    float _4464 = fma(_4408, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4460);
    float _4466 = fma(_4462, 0.5, 0.5);
    float _4468 = -_4400;
    float _4470 = fma(_4446, _4442, _4468);
    float _4472 = _4464 * _4430;
    float _4474 = fma(_4470, 0.5, 0.5);
    float _4476 = fma(_4472, -0.5, 0.5);
    float _4478 = _4458 * 0.636619746685028076171875;
    float2 _11675 = float2(_4388, _4202);
    float _4480 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11675, float2(0.0), isnan(_11675)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11675, float2(0.0), isnan(_11675)), level(0.0)).x;
    float3 _11686 = float3(_4466, _4476, _4454);
    float _4482 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11686, float3(0.0), isnan(_11686)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11686, float3(0.0), isnan(_11686)), level(0.0)).x;
    float3 _11697 = float3(_4466, _4476, _4454);
    float4 _4485 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11697, float3(0.0), isnan(_11697)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11697, float3(0.0), isnan(_11697)), level(0.0)).xyzw;
    float _4487 = _4485.x;
    float _4489 = _4485.y;
    float _4491 = _4485.z;
    float _4493 = _4485.w;
    float _4495 = -_4456;
    float _4497 = fma(_4478, _4495, 1.0);
    float2 _11718 = float2(_4497, _4474);
    float3 _4501 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11718, float2(0.0), isnan(_11718)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11718, float2(0.0), isnan(_11718)), level(0.0)).xyz;
    float _4503 = _4501.x;
    float _4505 = _4501.y;
    float _4507 = _4501.z;
    float _4509 = _3598 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4511 = _3598 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4513 = _4366 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4515 = in.m_92.x;
    float _4517 = fma(_3602, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4509);
    float _4519 = fma(_3602, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4511);
    float _4521 = fma(_4378, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4513);
    float _4523 = fma(_3630, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4517);
    float _4525 = fma(_3630, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4519);
    float _4527 = _4523 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4529 = _4525 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4531 = 1.0 / _4527;
    float _4533 = _4529 + _4527;
    float _4535 = _4398 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4537 = _4533 * _4531;
    float _4539 = _4537 * 0.5;
    float _4541 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4543 = fma(_4539, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4541);
    float _4545 = 1.0 / _4543;
    float _4547 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4549 = _4545 * _4547;
    float _4551 = abs(_4549);
    float _4553 = log2(_4551);
    bool _4555 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4557 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4559 = _4555 || _4557;
    bool _4561 = isnan(0.5);
    bool _4563 = _4559 || _4561;
    float _4565 = _4553 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4567 = exp2(_4565);
    float _4569 = fma(_4567, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4571 = precise::clamp(_4569, 0.0, 1.0);
    float _4573 = fma(_4372, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4521);
    float _4575 = _4448 + _4416;
    float _4577 = fma(_4571, -2.0, 3.0);
    float _4579 = _4571 * _4571;
    float _4581 = exp2(_4535);
    float _4583 = fma(_4408, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4573);
    float _4585 = _4575 * 0.5;
    float _4587 = _4579 * _4577;
    bool _4589 = _4549 <= 8000.0;
    bool _4591 = isnan(_4549);
    bool _4593 = _4589 || _4591;
    bool _4595 = isnan(8000.0);
    bool _4597 = _4593 || _4595;
    float _4599 = float(_4597);
    float _4601 = _4583 + _4416;
    float _4603 = -_4587;
    float _4605 = _4603 + 1.0;
    float _4607 = _4601 * 0.5;
    float _4609 = fma(_4605, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4587);
    float _4611 = _4416 * 0.5;
    float _4613 = _4605;
    float _4615 = _4416;
    float _4617 = _4583;
    float _4619 = _4464;
    if (_4563)
    {
        _4613 = 1.0;
    }
    float _4621 = _4613;
    float _4623 = fma(_4464, -0.5, _4611);
    float _4625 = _4621;
    float _4627 = _4489;
    if (!_4563)
    {
        float _4629 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4631 = _4629 * 0.15915493667125701904296875;
        float _4633 = _4631 * 6.283185482025146484375;
        float _4635 = cos(_4633);
        float _4637 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4639 = _4637 * 0.15915493667125701904296875;
        float _4641 = _4631 * 6.283185482025146484375;
        float _4643 = sin(_4641);
        float _4645 = 1.0 / _4635;
        float _4647 = _4639 * 6.283185482025146484375;
        float _4649 = cos(_4647);
        float _4651 = _4643 * _4645;
        float _4653 = _4639 * 6.283185482025146484375;
        float _4655 = sin(_4653);
        float _4657 = _4649 * _4651;
        float _4659 = 1.0 / _4657;
        float _4661 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4663 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4661;
        float _4665 = 1.0 / _4663;
        float _4667 = _4655 * _4659;
        float _4669 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4671 = fma(_4549, _4667, _4669);
        float _4673 = _4671 * _4665;
        float _4675 = precise::clamp(_4673, 0.0, 1.0);
        _4625 = _4675;
    }
    float _4677 = _4625;
    float _4679 = _4599 * _4609;
    float _4681 = -_4581;
    float _4683 = _4681 + 1.0;
    float _4685 = -_4480;
    float _4687 = _4685 + 1.0;
    float _4689 = _4679 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4691 = _4683 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _4448;
    out.gl_Position.y = _4464;
    out.gl_Position.z = _4583;
    out.gl_Position.w = _4416;
    bool _4693 = _4182 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4695 = isnan(_4182);
    bool _4697 = _4693 || _4695;
    bool _4699 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4701 = _4697 || _4699;
    float _4703 = _4687 * _4689;
    float _4705 = precise::clamp(_4703, 0.0, 1.0);
    float _4707 = _4691 * _4482;
    out.m_94.x = _4585;
    out.m_94.y = _4623;
    out.m_94.z = _4607;
    out.m_94.w = _4416;
    float _4709 = -_4705;
    float _4711 = fma(_4709, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4713 = _4493 * _4707;
    float _4715 = _4507 * _4707;
    float _4717 = _4711 * _4515;
    float _4719 = -_4691;
    float _4721 = _4719 + 1.0;
    float _4723 = _4717;
    float _4725 = _4721;
    if (!_4701)
    {
        _4615 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4727 = _4615;
    float _4729 = _4727;
    float _4731 = _4727;
    if (!_4701)
    {
        _4617 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4733 = _4617;
    float _4735 = fma(_4503, _4713, _4487);
    float _4737 = fma(_4505, _4713, _4489);
    float _4739 = _4493 * _4721;
    float _4741 = _4717 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4743 = fma(_4493, _4715, _4491);
    float _4745 = _4733;
    float _4747 = _4733;
    if (!_4701)
    {
        _4627 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4749 = _4627;
    float _4751 = _4677 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4753 = _4749;
    float _4755 = _4749;
    if (!_4701)
    {
        _4723 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4757 = _4723;
    out.m_96.x = _4741;
    float _4759 = _4757;
    float _4761 = _4757;
    if (!_4701)
    {
        _4619 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4763 = _4619;
    float _4765 = _4763;
    float _4767 = _4763;
    if (!_4701)
    {
        _4725 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4769 = _4725;
    out.m_98.x = _4735;
    out.m_98.y = _4737;
    out.m_98.z = _4743;
    out.m_98.w = _4739;
    bool _4771 = !_4701;
    float _4773 = _4769;
    float _4775 = _4769;
    if (!_4771)
    {
        bool _4777 = _4182 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4779 = isnan(_4182);
        bool _4781 = _4777 || _4779;
        bool _4783 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4785 = _4781 || _4783;
        if (!_4785)
        {
            float _4787 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4789 = _4182 + _4787;
            float _4791 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4793 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4791;
            float _4795 = 1.0 / _4793;
            float _4797 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4799 = _4797 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4801 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4803 = _4801 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4805 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4807 = _4805 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4809 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4811 = _4809 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4813 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4815 = _4813 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4817 = _4789 * _4795;
            float _4819 = precise::clamp(_4817, 0.0, 1.0);
            float _4821 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4823 = _4821 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4825 = fma(_4819, _4799, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4827 = fma(_4819, _4823, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4829 = fma(_4819, _4803, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4831 = fma(_4819, _4807, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4833 = fma(_4819, _4811, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4835 = fma(_4819, _4815, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4761 = _4827;
            _4767 = _4833;
            _4755 = _4825;
            _4747 = _4831;
            _4731 = _4829;
            _4775 = _4835;
            _4837 = true;
        }
        else
        {
            bool _4839 = _4182 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4841 = isnan(_4182);
            bool _4843 = _4839 || _4841;
            bool _4845 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4847 = _4843 || _4845;
            if (!_4847)
            {
                _4753 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4849 = _4753;
            _4755 = _4849;
            if (!_4847)
            {
                _4759 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4851 = _4759;
            _4761 = _4851;
            if (!_4847)
            {
                _4729 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4853 = _4729;
            _4731 = _4853;
            if (!_4847)
            {
                _4745 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4855 = _4745;
            _4747 = _4855;
            if (!_4847)
            {
                _4765 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4857 = _4765;
            _4767 = _4857;
            if (!_4847)
            {
                _4773 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4859 = _4773;
            bool _4861 = !_4847;
            _4775 = _4859;
            if (!_4861)
            {
                bool _4863 = _4182 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4865 = isnan(_4182);
                bool _4867 = _4863 || _4865;
                bool _4869 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4871 = _4867 || _4869;
                if (!_4871)
                {
                    float _4873 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4875 = _4182 + _4873;
                    float _4877 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4879 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4877;
                    float _4881 = 1.0 / _4879;
                    float _4883 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4885 = _4883 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4887 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4889 = _4887 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4891 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4893 = _4891 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4895 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4897 = _4895 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4899 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4901 = _4899 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4903 = _4875 * _4881;
                    float _4905 = precise::clamp(_4903, 0.0, 1.0);
                    float _4907 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4909 = _4907 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4911 = fma(_4905, _4885, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4913 = fma(_4905, _4909, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4915 = fma(_4905, _4889, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4917 = fma(_4905, _4893, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4919 = fma(_4905, _4897, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4921 = fma(_4905, _4901, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4761 = _4913;
                    _4767 = _4919;
                    _4755 = _4911;
                    _4747 = _4917;
                    _4731 = _4915;
                    _4775 = _4921;
                    _4837 = true;
                }
                else
                {
                    _4761 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4767 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4755 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4747 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4731 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4775 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4837 = false;
    float _4923 = _4761;
    float _4925 = _4767;
    float _4927 = _4755;
    float _4929 = _4747;
    float _4931 = _4731;
    float _4933 = _4775;
    float _4935 = _4751 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4937 = fma(_4038, -0.5, 0.5);
    float _4939 = precise::clamp(_4937, 0.0, 1.0);
    float _4941 = -_4923;
    float _4943 = _4941 + _4925;
    float _4945 = -_4927;
    float _4947 = _4945 + _4929;
    out.m_100.x = 0.0;
    float _4949 = fma(_4939, _4943, _4923);
    float _4951 = -_4931;
    float _4953 = _4951 + _4933;
    float _4955 = fma(_4939, _4947, _4927);
    float _4957 = _4949 * 0.586610972881317138671875;
    bool _4959 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4961 = fma(_4939, _4953, _4931);
    out.m_55.x = _4935;
    float _4963 = fma(_4955, 0.298911988735198974609375, _4957);
    bool _4965 = _4677 > 0.0;
    bool _4967 = isnan(_4677);
    bool _4969 = _4965 || _4967;
    bool _4971 = isnan(0.0);
    bool _4973 = _4969 || _4971;
    float _4975 = fma(_4961, 0.114477999508380889892578125, _4963);
    float _4977 = -_4975;
    float _4979 = _4955 + _4977;
    float _4981 = -_4975;
    float _4983 = _4949 + _4981;
    float _4985 = -_4975;
    float _4987 = _4961 + _4985;
    float _4989 = fma(_4979, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4975);
    float _4991 = fma(_4983, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4975);
    float _4993 = fma(_4987, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4975);
    bool _4995 = !_4959;
    if (!_4995)
    {
        float _4997 = -_4144;
        float _4999 = _4997 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5001 = -_4148;
        float _5003 = _5001 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5005 = -_4152;
        float _5007 = _5005 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5009 = _4999 * _4999;
        float _5011 = fma(_5003, _5003, _5009);
        float _5013 = fma(_5007, _5007, _5011);
        float _5015 = sqrt(_5013);
        float _5017 = rsqrt(_5013);
        float _5019 = -_5015;
        float _5021 = _5019 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5023 = _5021 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5025 = precise::clamp(_5023, 0.0, 1.0);
        float _5027 = _5003 * _5017;
        float _5029 = _4999 * _5017;
        float _5031 = abs(_5025);
        float _5033 = log2(_5031);
        float _5035 = _5007 * _5017;
        float _5037 = _5027 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5039 = _4038 * _5029;
        float _5041 = -_5029;
        float _5043 = -_5037;
        float _5045 = fma(_5041, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5043);
        float _5047 = fma(_4036, _5027, _5039);
        float _5049 = -_5035;
        float _5051 = fma(_5049, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5045);
        float _5053 = fma(_4040, _5035, _5047);
        float _5055 = precise::clamp(_5053, 0.0, 1.0);
        float _5057 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5059 = _5051 + _5057;
        float _5061 = _5033 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5063 = _5059 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5065 = precise::clamp(_5063, 0.0, 1.0);
        float _5067 = exp2(_5061);
        float _5069 = _5067 * _5065;
        float _5071 = _5055 * _5069;
        float _5073 = _5071 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5075 = _5071 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5077 = _5071 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _5073;
        out.m_100.y = _5075;
        out.m_100.z = _5077;
    }
    out.m_102.x = _4989;
    out.m_102.y = _4991;
    out.m_102.z = _4993;
    if (_4973)
    {
        return out;
    }
    out.m_55.x = 0.0;
    float _5079 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5079;
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
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4837 = false;
    bool _4092 = false;
    bool _597 = false;
    bool _453 = false;
    bool _219 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_48.w;
    float _118 = in.m_50.w;
    float _120 = trunc(_116);
    int _123 = int(_120);
    float _125 = -_118;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _127;
    bool _131 = _123 >= 1;
    float _133 = 0.0;
    float _135 = _118;
    float _137 = _127;
    if (!_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _133;
    if (!_131)
    {
        out.m_55.x = 0.0;
    }
    int _141 = 0;
    if (!_131)
    {
        float _143 = _139 * 5.0;
        _141 = as_type<int>(_143);
    }
    int _145 = _141;
    if (!_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5146 = as_type<float>(_145);
        out.gl_Position.z = _5146;
    }
    if (!_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _147 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _149 = isnan(_118);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _155 = _151 || _153;
    float _157 = float(_123);
    bool _159 = _127 >= _157;
    bool _161 = !_155;
    bool _163 = _159 || _161;
    float _165 = 1.0 / _157;
    if (_163)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _135;
    if (_163)
    {
        out.m_55.x = 0.0;
    }
    float _169 = _127 * _165;
    int _171 = 0;
    float _173 = _169;
    if (_163)
    {
        float _175 = _167 * 5.0;
        _171 = as_type<int>(_175);
    }
    int _177 = _171;
    out.m_53.x = _169;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5209 = as_type<float>(_177);
        out.gl_Position.z = _5209;
    }
    if (_163)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _183 = as_type<int>(_179) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_179) & 2;
    bool _189 = _187 != 0;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_181;
    float _217;
    if (!_199)
    {
        float _201 = in.m_60.x;
        float _203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _205 = _201 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _207 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _209 = _207 * _203;
        float _211 = floor(_209);
        float _213 = -_211;
        float _215 = _209 + _213;
        _217 = _215;
        _219 = true;
    }
    else
    {
        _217 = _169;
    }
    _219 = false;
    float _221 = _217;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _225 = _221 + _223;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _229 = _221 + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _233 = _221 + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _241 = _239 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _243;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _249 = _247 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _251 = 1.0 / _237;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _255 = 1.0 / _245;
    float _257 = 1.0 / _249;
    float _259 = _225 * _251;
    bool _261 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _263 = isnan(_221);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    float _273 = -_271;
    float _275 = _273 + 1.0;
    float _277 = 1.0 / _241;
    float _279 = _229 * _255;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _283 = _221 + _281;
    bool _285 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _287 = isnan(_221);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _297;
    float _301 = _233 * _257;
    float _303 = fma(_299, _279, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _305 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _307 = isnan(_221);
    bool _309 = _305 || _307;
    bool _311 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _313 = _309 || _311;
    float _315 = float(_313);
    float _317 = _283 * _277;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _319;
    float _323 = _315 * _275;
    bool _325 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _327 = isnan(_221);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = -_315;
    float _339 = _337 + 1.0;
    float _341 = fma(_321, _279, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _343 = -_295;
    float _345 = _343 + 1.0;
    bool _347 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _349 = isnan(_221);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _361 = _359 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _363 = _295 * _339;
    float _365 = _335 * _345;
    float _367 = -_335;
    float _369 = _367 + 1.0;
    float _371 = -_357;
    float _373 = _371 + 1.0;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _377 = _375 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _379 = fma(_361, _301, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _381 = _357 * _369;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _383;
    float _387 = fma(_377, _301, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _389;
    float _393 = _341 * _381;
    float _395 = _303 * _381;
    float _397 = fma(_385, _259, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _399 = fma(_391, _259, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _401 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].x, _393);
    float _403 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].y, _395);
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _413 = fma(_379, _365, _401);
    float _415 = fma(_387, _365, _403);
    float _417 = fma(_407, _317, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _419 = fma(_411, _317, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _421 = fma(_397, _363, _413);
    float _423 = fma(_399, _363, _415);
    float _425 = fma(_417, _323, _421);
    float _427 = fma(_419, _323, _423);
    float _429 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[147].x, _425);
    float _431 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[147].y, _427);
    bool _433 = !_253;
    float _451;
    if (!_433)
    {
        float _435 = in.m_60.x;
        float _437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _439 = _435 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _441 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _443 = _441 * _437;
        float _445 = floor(_443);
        float _447 = -_445;
        float _449 = _443 + _447;
        _451 = _449;
        _453 = true;
    }
    else
    {
        _451 = _169;
    }
    _453 = false;
    float _455 = _451;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _459 = _455 + _457;
    float _461 = in.m_62.x;
    float _463 = in.m_62.y;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _469 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _471 = isnan(_455);
    bool _473 = _469 || _471;
    bool _475 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _477 = _473 || _475;
    float _479 = float(_477);
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _485 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _487 = isnan(_455);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _497;
    bool _501 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _503 = isnan(_455);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    float _513 = 1.0 / _467;
    float _515 = -_479;
    float _517 = _515 + 1.0;
    bool _519 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _521 = _495 * _517;
    float _523 = -_495;
    float _525 = _523 + 1.0;
    float _527 = 1.0 / _483;
    float _529 = _499 * _513;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _535 = _431 * _463;
    float _537 = _429 * _461;
    float _539 = fma(_529, _459, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _541 = -_511;
    float _543 = _541 + 1.0;
    float _545 = _539 * _521;
    float _547 = _533 * _527;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _551 = _455 + _549;
    float _553 = _479 * _543;
    float _555 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[115].x, _545);
    float _557 = fma(_547, _551, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _559 = fma(_557, _553, _555);
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _565 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[117].x, _559);
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _569 = _561 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _571 = _563 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _573 = _565 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _575 = _567 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_64.x = _569;
    out.m_64.y = _571;
    out.m_64.z = _575;
    out.m_64.w = _573;
    bool _577 = !_519;
    float _595;
    if (!_577)
    {
        float _579 = in.m_60.x;
        float _581 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _583 = _579 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _585 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[11].w, _127);
        float _587 = _585 * _581;
        float _589 = floor(_587);
        float _591 = -_589;
        float _593 = _587 + _591;
        _595 = _593;
        _597 = true;
    }
    else
    {
        _595 = _169;
    }
    _597 = false;
    float _599 = _595;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _603 = _599 + _601;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _609 = _599 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _611 = isnan(_599);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _625 = _599 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _627 = isnan(_599);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _637;
    bool _641 = _599 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _643 = isnan(_599);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = 1.0 / _607;
    float _655 = -_619;
    float _657 = _655 + 1.0;
    bool _659 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _661 = _635 * _657;
    float _663 = -_635;
    float _665 = _663 + 1.0;
    float _667 = 1.0 / _623;
    float _669 = _639 * _653;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _675 = fma(_669, _603, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _677 = -_651;
    float _679 = _677 + 1.0;
    float _681 = _675 * _661;
    float _683 = _673 * _667;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _687 = _599 + _685;
    float _689 = _619 * _679;
    float _691 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[131].x, _681);
    float _693 = fma(_683, _687, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _695 = fma(_693, _689, _691);
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _703 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[133].x, _695);
    float _705 = _697 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = _699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = _701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _703 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_66.x = _705;
    out.m_66.y = _707;
    out.m_66.z = _709;
    out.m_66.w = _711;
    bool _713 = !_659;
    if (!_713)
    {
        float _715 = in.m_60.x;
        float _717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _719 = _715 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _721 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[14].x, _127);
        float _723 = _721 * _717;
        float _725 = floor(_723);
        float _727 = -_725;
        float _729 = _723 + _727;
        _173 = _729;
    }
    float _731 = _173;
    float _733 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _735 = int(_733);
    int _737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _739 = _737 != 0;
    float _741 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _743 = int(_741);
    float _745 = float(_735);
    float _747 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _749 = int(_747);
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_739)
    {
        _751 = 1.0;
    }
    float _753 = _751;
    int _755 = 0;
    float _757 = _753;
    if (_739)
    {
        _755 = 0;
    }
    int _759 = _755;
    float _761 = float(_743);
    float _763 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _765 = int(_763);
    float _767 = 1.0 / _745;
    float _769 = float(uint(_749));
    int _771 = ~_749;
    int _773 = _771 + 1;
    float _775 = 1.0 / _761;
    float _777 = float(uint(_765));
    float _779 = _767 * _127;
    float _781 = 1.0 / _769;
    float _783 = _767;
    float _785 = _761;
    int _787 = _759;
    if (_739)
    {
        float _789 = in.m_60.x;
        float _791 = in.m_60.y;
        _783 = _789;
        _785 = _791;
    }
    float _793 = _783;
    float _795 = _785;
    float _797 = _775 * _127;
    float _799 = 1.0 / _777;
    float _801 = _775;
    if (_739)
    {
        _801 = 1.0;
    }
    float _803 = _801;
    float _805 = trunc(_779);
    int _807 = int(_805);
    int _809 = as_type<int>(_781) + (-2);
    float _811 = trunc(_797);
    int _813 = int(_811);
    int _815 = as_type<int>(_799) + (-2);
    float _817 = 0.0;
    float _819 = _803;
    float _821 = _793;
    float _823 = _795;
    if (_739)
    {
        _817 = _795;
    }
    float _825 = _817;
    float _827 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _829 = int(_827);
    float _831 = float(uint(_807));
    float _833 = as_type<float>(_809) * _831;
    float _835 = _831;
    float _837 = _825;
    if (_739)
    {
        _835 = _793;
    }
    float _839 = _835;
    float _841 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _843 = int(_841);
    float _845 = float(uint(_813));
    float _847 = 0.0;
    int _849 = as_type<int>(_845);
    float _851 = _839;
    if (_739)
    {
        _847 = _839;
    }
    float _853 = _847;
    float _855 = as_type<float>(_815) * _845;
    float _857 = _853;
    if (_739)
    {
        _849 = 0;
    }
    int _859 = _849;
    float _861 = trunc(_833);
    float _863 = precise::max(_861, 0.0);
    uint _866 = uint(_863);
    float _868 = float(uint(_829));
    float _870 = 1.0 / _868;
    float _872 = float(_843);
    float _874 = trunc(_855);
    float _876 = precise::max(_874, 0.0);
    uint _878 = uint(_876);
    float _880 = 1.0 / _872;
    float _882 = _872;
    int _884 = _859;
    if (_739)
    {
        _882 = _839;
    }
    float _886 = _882;
    float _888 = _886;
    if (!_739)
    {
        float _890 = in.m_60.x;
        float _892 = in.m_60.y;
        float _894 = in.m_60.z;
        float _896 = _890 * 3.1415927410125732421875;
        float _898 = _896 * 0.15915493667125701904296875;
        float _900 = _892 * 3.1415927410125732421875;
        float _902 = _900 * 0.15915493667125701904296875;
        float _904 = _898 * 6.283185482025146484375;
        float _906 = sin(_904);
        float _908 = _902 * 6.283185482025146484375;
        float _910 = sin(_908);
        _819 = 7.345489978790283203125;
        _821 = _890;
        _757 = 5.839270114898681640625;
        _888 = _894;
        _851 = _892;
        _823 = _892;
        _884 = 1;
        _787 = 2;
        _837 = _910;
        _857 = _906;
    }
    float _912 = _819;
    float _914 = _821;
    float _916 = _757;
    float _918 = _888;
    float _920 = _851;
    float _922 = _823;
    int _924 = _884;
    int _926 = _787;
    float _928 = _837;
    float _930 = _857;
    int _932 = _773 * int(_866);
    int _934 = _932 + _807;
    float _936 = _912 * _914;
    float _938 = _880 * _127;
    float _940 = _916 * _918;
    float _942 = in.m_60.z;
    float _944 = in.m_60.w;
    float _946 = float(uint(_934));
    float _948 = floor(_936);
    int _950 = ~_765;
    int _952 = _950 + 1;
    float _954 = _912 * _920;
    float _956 = float(_749);
    float _958 = as_type<float>(_809) * _946;
    float _960 = float(_807);
    int _962 = _952 * int(_878);
    int _964 = _962 + _813;
    int _966 = as_type<int>(_870) + (-2);
    float _968 = floor(_940);
    bool _970 = _960 >= _956;
    bool _972 = isnan(_960);
    bool _974 = _970 || _972;
    bool _976 = isnan(_956);
    bool _978 = _974 || _976;
    float _980 = float(_978);
    float _982 = _922 * 2.0;
    float _984 = float(uint(_964));
    bool _986 = _922 > 0.5;
    int _988 = ~_749;
    int _990 = _988 + 1;
    float _992 = trunc(_938);
    int _994 = int(_992);
    float _996 = -_948;
    float _998 = _936 + _996;
    float _1000 = as_type<float>(_815) * _984;
    float _1002 = -_193;
    int _1004 = _986 ? as_type<int>(_1002) : as_type<int>(_193);
    bool _1006 = _944 > 0.5;
    float _1008 = trunc(_958);
    float _1010 = precise::max(_1008, 0.0);
    uint _1012 = uint(_1010);
    float _1014 = -_968;
    float _1016 = _940 + _1014;
    bool _1018 = _942 > 0.5;
    int _1020 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1022 = _1020 != 0;
    float _1024 = float(_765);
    float _1026 = float(uint(_994));
    float _1028 = trunc(_1000);
    float _1030 = precise::max(_1028, 0.0);
    uint _1032 = uint(_1030);
    int _1034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1036 = _1034 != 0;
    int _1038 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1040 = _1038 != 0;
    int _1042 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1044 = _1042 != 0;
    int _1046 = ~_765;
    int _1048 = _1046 + 1;
    int _1050 = int(_866) + int(_1012);
    float _1052 = as_type<float>(_966) * _1026;
    float _1054 = -_197;
    int _1056 = _1018 ? as_type<int>(_1054) : as_type<int>(_197);
    float _1058 = floor(_954);
    float _1060 = float(_813);
    bool _1062 = !_1044;
    float _1064 = _1062 ? _197 : as_type<float>(_1056);
    bool _1066 = _1060 >= _1024;
    bool _1068 = isnan(_1060);
    bool _1070 = _1066 || _1068;
    bool _1072 = isnan(_1024);
    bool _1074 = _1070 || _1072;
    float _1076 = float(_1074);
    float _1078 = _998 * _956;
    int _1080 = int(_878) + int(_1032);
    float _1082 = trunc(_1052);
    float _1084 = precise::max(_1082, 0.0);
    uint _1086 = uint(_1084);
    int _1088 = ~_829;
    int _1090 = _1088 + 1;
    int _1092 = int(_1006);
    int _1094 = _1018 ? 2 : 0;
    int _1096 = _1092 | _1094;
    int _1098 = _1022 ? 4 : 0;
    int _1100 = _1096 | _1098;
    int _1102 = _1036 ? 8 : 0;
    int _1104 = _1100 | _1102;
    int _1106 = _1040 ? 16 : 0;
    int _1108 = _1104 | _1106;
    int _1110 = _1044 ? 32 : 0;
    int _1112 = _1108 | _1110;
    int _1114 = _986 ? 64 : 0;
    int _1116 = _1112 | _1114;
    int _1118 = _1116 & 64;
    int _1120 = _1048 * _1080;
    int _1122 = _1120 + _813;
    bool _1124 = !_1040;
    float _1126 = _1124 ? _193 : as_type<float>(_1004);
    int _1128 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1130 = _1128 != 0;
    int _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1134 = _1132 != 0;
    int _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1138 = _1136 != 0;
    float _1140 = trunc(_1078);
    int _1142 = int(_1140);
    int _1144 = _990 * _1050;
    int _1146 = _1144 + _807;
    bool _1148 = !_1022;
    int _1150 = _1148 ? 0 : 1;
    float _1152 = -_1058;
    float _1154 = _954 + _1152;
    bool _1156 = !_1134;
    int _1158 = _1156 ? 0 : 1;
    bool _1160 = uint(_1146) >= uint(_749);
    int _1162 = _1090 * int(_1086);
    int _1164 = _1162 + _994;
    bool _1166 = uint(_1122) >= uint(_765);
    float _1168 = trunc(_980);
    int _1170 = int(_1168);
    bool _1172 = !_1130;
    int _1174 = _1172 ? 0 : 1;
    float _1176 = float(uint(_1164));
    int _1178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1180 = _1178 != 0;
    bool _1182 = !_1160;
    int _1184 = _1182 ? 0 : (-1);
    float _1186 = trunc(_1076);
    int _1188 = int(_1186);
    float _1190 = as_type<float>(_966) * _1176;
    bool _1192 = !_1138;
    int _1194 = _1192 ? 0 : 1;
    bool _1196 = !_1180;
    int _1198 = _1196 ? 0 : 1;
    int _1200 = abs(_1150);
    int _1202 = ~_1050;
    int _1204 = _1202 + _1184;
    int _1206 = _1204 + 1;
    float _1208 = _1016 * _1024;
    bool _1210 = !_1166;
    int _1212 = _1210 ? 0 : (-1);
    float _1214 = trunc(_1190);
    float _1216 = precise::max(_1214, 0.0);
    uint _1218 = uint(_1216);
    int _1220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1222 = _1220 != 0;
    int _1224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1226 = _1224 != 0;
    int _1228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1230 = _1228 != 0;
    int _1232 = _1142 * _1200;
    int _1234 = _1232 + _807;
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1238 = _1236 != 0;
    int _1240 = _749 * _1206;
    int _1242 = _1240 + _807;
    int _1244 = ~_1080;
    int _1246 = _1244 + _1212;
    int _1248 = _1246 + 1;
    bool _1250 = !_1238;
    int _1252 = _1250 ? 0 : 1;
    float _1254 = trunc(_1208);
    int _1256 = int(_1254);
    float _1258 = _165 * _127;
    bool _1260 = _749 == 0;
    int _1262 = _765 * _1248;
    int _1264 = _1262 + _813;
    int _1266 = ~_1170;
    int _1268 = _1266 + 1;
    int _1270 = _1268 + 1;
    float _1272 = _956 * _1258;
    bool _1274 = !_1260;
    int _1276 = _1274 ? _1242 : (-1);
    float _1278 = _1024 * _1258;
    int _1280 = _749 + (-1);
    bool _1282 = !_1222;
    int _1284 = _1282 ? 0 : 1;
    float _1286 = trunc(_1272);
    int _1288 = int(_1286);
    int _1290 = _1276 * _1270;
    int _1292 = abs(_1158);
    bool _1294 = _765 == 0;
    int _1296 = _1170 * _1280;
    int _1298 = _1296 + _1290;
    int _1300 = ~_1188;
    int _1302 = _1300 + 1;
    int _1304 = _1302 + 1;
    bool _1306 = !_1294;
    int _1308 = _1306 ? _1264 : (-1);
    int _1310 = _1298 * _1292;
    int _1312 = abs(_1174);
    float _1314 = trunc(_1278);
    int _1316 = int(_1314);
    int _1318 = abs(_1194);
    int _1320 = _1308 * _1304;
    int _1322 = abs(_1252);
    int _1324 = abs(_1198);
    int _1326 = _1288 * _1312;
    int _1328 = _1326 + _1310;
    bool _1330 = !_1226;
    int _1332 = _1330 ? 0 : 1;
    int _1334 = _1256 * _1322;
    int _1336 = _1334 + _813;
    int _1338 = _765 + (-1);
    int _1340 = abs(_1332);
    int _1342 = _1188 * _1338;
    int _1344 = _1342 + _1320;
    int _1346 = abs(_1284);
    int _1348 = _1234 * _1318;
    int _1350 = _1348 + _1328;
    int _1352 = int(_1086) + int(_1218);
    int _1354 = _1344 * _1340;
    int _1356 = ~_829;
    int _1358 = _1356 + 1;
    int _1360 = _1142 * _1324;
    int _1362 = _1360 + _1350;
    bool _1364 = _1118 != 0;
    int _1366 = _1358 * _1352;
    int _1368 = _1366 + _994;
    float _1370 = -_197;
    int _1372 = _1006 ? as_type<int>(_1370) : as_type<int>(_197);
    int _1374 = _1316 * _1346;
    int _1376 = _1374 + _1354;
    float _1378 = float(_829);
    float _1380 = -_193;
    int _1382 = _1018 ? as_type<int>(_1380) : as_type<int>(_193);
    float _1384 = float(_994);
    float _1386 = _1378 * _1258;
    float _1388 = float(uint(_1362));
    bool _1390 = uint(_1368) >= uint(_829);
    int _1392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1394 = _1392 != 0;
    float _1396 = as_type<float>(_809) * _1388;
    bool _1398 = !_1230;
    int _1400 = _1398 ? 0 : 1;
    float _1402 = trunc(_1386);
    int _1404 = int(_1402);
    bool _1406 = _1384 >= _1378;
    bool _1408 = isnan(_1384);
    bool _1410 = _1406 || _1408;
    bool _1412 = isnan(_1378);
    bool _1414 = _1410 || _1412;
    float _1416 = float(_1414);
    float _1418 = _1154 * _1378;
    bool _1420 = !_1394;
    int _1422 = _1420 ? 0 : 1;
    int _1424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1426 = _1424 != 0;
    int _1428 = abs(_1400);
    float _1430 = trunc(_1396);
    float _1432 = precise::max(_1430, 0.0);
    uint _1434 = uint(_1432);
    bool _1436 = !_1036;
    float _1438 = _1436 ? _197 : as_type<float>(_1372);
    int _1440 = abs(_1422);
    bool _1442 = !_1390;
    int _1444 = _1442 ? 0 : (-1);
    bool _1446 = !_1426;
    int _1448 = _1446 ? 0 : 1;
    float _1450 = trunc(_1416);
    int _1452 = int(_1450);
    int _1454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1456 = _1454 != 0;
    int _1458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1460 = _1458 != 0;
    int _1462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1464 = _1462 != 0;
    int _1466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1468 = _1466 != 0;
    int _1470 = ~_1352;
    int _1472 = _1470 + _1444;
    int _1474 = _1472 + 1;
    int _1476 = _1336 * _1428;
    int _1478 = _1476 + _1376;
    float _1480 = trunc(_1418);
    int _1482 = int(_1480);
    bool _1484 = !_1460;
    int _1486 = _1484 ? 0 : 1;
    int _1488 = _829 * _1474;
    int _1490 = _1488 + _994;
    int _1492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1494 = _1492 != 0;
    int _1496 = _1256 * _1440;
    int _1498 = _1496 + _1478;
    int _1500 = ~_749;
    int _1502 = _1500 + 1;
    bool _1504 = !_1456;
    int _1506 = _1504 ? 0 : 1;
    float _1508 = float(uint(_1498));
    int _1510 = _1502 * int(_1434);
    int _1512 = _1510 + _1362;
    bool _1514 = _829 == 0;
    int _1516 = ~_1452;
    int _1518 = _1516 + 1;
    int _1520 = _1518 + 1;
    float _1522 = as_type<float>(_815) * _1508;
    bool _1524 = !_1514;
    int _1526 = _1524 ? _1490 : (-1);
    float _1528 = as_type<float>(_1256);
    float _1530 = as_type<float>(_1362);
    float _1532 = as_type<float>(_926);
    if (_1494)
    {
        float _1534 = in.m_60.w;
        _1528 = _1534;
    }
    float _1536 = _1528;
    float _1538 = float(uint(_1512));
    int _1540 = abs(_1486);
    int _1542 = _1526 * _1520;
    int _1544 = _829 + (-1);
    float _1546 = as_type<float>(_809) * _1538;
    float _1548 = trunc(_1522);
    float _1550 = precise::max(_1548, 0.0);
    uint _1552 = uint(_1550);
    int _1554 = abs(_1448);
    int _1556 = _1452 * _1544;
    int _1558 = _1556 + _1542;
    int _1560 = abs(_1506);
    int _1562 = _1558 * _1540;
    float _1564 = trunc(_1546);
    float _1566 = precise::max(_1564, 0.0);
    uint _1568 = uint(_1566);
    int _1570 = ~_765;
    int _1572 = _1570 + 1;
    int _1574 = _1404 * _1560;
    int _1576 = _1574 + _1562;
    int _1578 = ~_749;
    int _1580 = _1578 + 1;
    int _1582 = _1482 * _1554;
    int _1584 = _1582 + _994;
    bool _1586 = !_1464;
    int _1588 = _1586 ? 0 : 1;
    float _1590 = as_type<float>(_1554);
    float _1592 = as_type<float>(_1572);
    if (_1494)
    {
        float _1594 = _1536 * 3.1415927410125732421875;
        _1590 = _1594;
    }
    float _1596 = _1590;
    int _1598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1600 = _1598 != 0;
    int _1602 = _1572 * int(_1552);
    int _1604 = _1602 + _1498;
    bool _1606 = _749 == 0;
    if (_1494)
    {
        float _1608 = _1596 * 0.15915493667125701904296875;
        _1592 = _1608;
    }
    float _1610 = _1592;
    bool _1612 = !_1468;
    int _1614 = _1612 ? 0 : 1;
    int _1616 = int(_1434) + int(_1568);
    int _1618 = abs(_1588);
    float _1620 = float(uint(_1604));
    int _1622 = _1580 * _1616;
    int _1624 = _1622 + _1362;
    float _1626 = as_type<float>(_1588);
    if (_1494)
    {
        float _1628 = _1610 * 6.283185482025146484375;
        float _1630 = sin(_1628);
        _1626 = _1630;
    }
    float _1632 = _1626;
    int _1634 = abs(_1614);
    float _1636 = as_type<float>(_815) * _1620;
    bool _1638 = uint(_1624) >= uint(_749);
    int _1640 = _1584 * _1618;
    int _1642 = _1640 + _1576;
    float _1644 = float(uint(_1234));
    float _1646 = as_type<float>(_1618);
    if (_1600)
    {
        float _1648 = in.m_60.x;
        _1646 = _1648;
    }
    float _1650 = _1646;
    float _1652 = trunc(_1636);
    float _1654 = precise::max(_1652, 0.0);
    uint _1656 = uint(_1654);
    bool _1658 = !_1638;
    int _1660 = _1658 ? 0 : (-1);
    float _1662 = as_type<float>(_809) * _1644;
    int _1664 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1666 = _1664 != 0;
    int _1668 = _1482 * _1634;
    int _1670 = _1668 + _1642;
    int _1672 = ~_1616;
    int _1674 = _1672 + _1660;
    int _1676 = _1674 + 1;
    bool _1678 = !_1666;
    float _1680 = _1678 ? _193 : as_type<float>(_1382);
    float _1682 = trunc(_1662);
    float _1684 = precise::max(_1682, 0.0);
    uint _1686 = uint(_1684);
    bool _1688 = _1666;
    if (_1494)
    {
        bool _1690 = _1632 > 0.5;
        _1688 = _1690;
    }
    bool _1692 = _1688;
    int _1694 = _749 * _1676;
    int _1696 = _1694 + _1362;
    float _1698 = float(uint(_1670));
    float _1700 = 0.0;
    if (!_1494)
    {
        _1700 = _193;
    }
    float _1702 = _1700;
    bool _1704 = !_1606;
    int _1706 = _1704 ? _1696 : (-1);
    float _1708 = as_type<float>(_966) * _1698;
    float _1710 = _1702;
    if (_1494)
    {
        float _1712 = -_193;
        float _1714 = _1692 ? _1712 : _193;
        _1710 = _1714;
    }
    float _1716 = _1710;
    int _1718 = _1706 & 3;
    bool _1720 = _1718 != 0;
    float _1722 = trunc(_1708);
    float _1724 = precise::max(_1722, 0.0);
    uint _1726 = uint(_1724);
    int _1728 = ~_749;
    int _1730 = _1728 + 1;
    if (_1600)
    {
        float _1732 = _1650 * 3.1415927410125732421875;
        _1530 = _1732;
    }
    float _1734 = _1530;
    int _1736 = _1706 & 3;
    bool _1738 = _1736 != 0;
    int _1740 = int(_1552) + int(_1656);
    int _1742 = _1730 * int(_1686);
    int _1744 = _1742 + _1234;
    int _1746 = _1720 ? 0 : 1;
    float _1748 = _1734;
    if (_1600)
    {
        float _1750 = _1734 * 0.15915493667125701904296875;
        _1748 = _1750;
    }
    float _1752 = _1748;
    float _1754 = float(uint(_1336));
    bool _1756 = uint(_1736) > 1u;
    int _1758 = ~_829;
    int _1760 = _1758 + 1;
    float _1762 = as_type<float>(_815) * _1754;
    float _1764 = float(uint(_1744));
    float _1766 = _1752;
    if (_1600)
    {
        float _1768 = _1752 * 6.283185482025146484375;
        float _1770 = sin(_1768);
        _1766 = _1770;
    }
    float _1772 = _1766;
    int _1774 = ~_765;
    int _1776 = _1774 + 1;
    float _1778 = as_type<float>(_809) * _1764;
    int _1780 = ~_1746;
    int _1782 = _1780 + 1;
    int _1784 = _1782 + 1;
    int _1786 = _1776 * _1740;
    int _1788 = _1786 + _1498;
    float _1790 = -_197;
    int _1792 = _1364 ? as_type<int>(_1790) : as_type<int>(_197);
    int _1794 = _1760 * int(_1726);
    int _1796 = _1794 + _1670;
    float _1798 = trunc(_1762);
    float _1800 = precise::max(_1798, 0.0);
    uint _1802 = uint(_1800);
    int _1804 = _1784;
    if (!_1756)
    {
        int _1806 = ~_1746;
        int _1808 = _1806 + 1;
        _1804 = _1808;
    }
    int _1810 = _1804;
    int _1812 = ~_765;
    int _1814 = _1812 + 1;
    bool _1816 = uint(_1736) >= 2u;
    float _1818 = float(uint(_1796));
    float _1820 = trunc(_1778);
    float _1822 = precise::max(_1820, 0.0);
    uint _1824 = uint(_1822);
    bool _1826 = uint(_1788) >= uint(_765);
    float _1828 = as_type<float>(_966) * _1818;
    int _1830 = _1816 ? 0 : 1;
    bool _1832 = _1736 != 3;
    float _1834 = trunc(_1828);
    float _1836 = precise::max(_1834, 0.0);
    uint _1838 = uint(_1836);
    bool _1840 = !_1826;
    int _1842 = _1840 ? 0 : (-1);
    int _1844 = _1814 * int(_1802);
    int _1846 = _1844 + _1336;
    int _1848 = ~_1830;
    int _1850 = _1848 + 1;
    int _1852 = _1850 + 1;
    int _1854 = ~_1740;
    int _1856 = _1854 + _1842;
    int _1858 = _1856 + 1;
    float _1860 = float(uint(_1846));
    int _1862 = _765 * _1858;
    int _1864 = _1862 + _1498;
    float _1866 = 0.0;
    int _1868 = _1852;
    bool _1870 = _1832;
    if (!_1600)
    {
        _1866 = _197;
    }
    float _1872 = _1866;
    float _1874 = _1872;
    if (_1832)
    {
        int _1876 = ~_1830;
        int _1878 = _1876 + 1;
        _1868 = _1878;
    }
    int _1880 = _1868;
    float _1882 = as_type<float>(_815) * _1860;
    if (_1600)
    {
        bool _1884 = _1772 > 0.5;
        _1870 = _1884;
    }
    bool _1886 = _1870;
    bool _1888 = !_1294;
    int _1890 = _1888 ? _1864 : (-1);
    int _1892 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1894 = _1892 != 0;
    float _1896 = trunc(_1882);
    float _1898 = precise::max(_1896, 0.0);
    uint _1900 = uint(_1898);
    if (_1600)
    {
        float _1902 = -_197;
        float _1904 = _1886 ? _1902 : _197;
        _1874 = _1904;
    }
    float _1906 = _1874;
    int _1908 = _1890 & 3;
    bool _1910 = _1908 != 0;
    int _1912 = ~_829;
    int _1914 = _1912 + 1;
    bool _1916 = !_1894;
    float _1918 = _1916 ? _197 : as_type<float>(_1792);
    bool _1920 = uint(_1908) > 1u;
    int _1922 = int(_1726) + int(_1838);
    int _1924 = _1890 & 3;
    bool _1926 = _1924 != 0;
    int _1928 = int(_1686) + int(_1824);
    int _1930 = ~_749;
    int _1932 = _1930 + 1;
    int _1934 = _1914 * _1922;
    int _1936 = _1934 + _1670;
    int _1938 = _1926 ? 0 : 1;
    float _1940 = float(uint(_1584));
    int _1942 = _1932 * _1928;
    int _1944 = _1942 + _1234;
    int _1946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1948 = _1946 != 0;
    int _1950 = ~_1938;
    int _1952 = _1950 + 1;
    int _1954 = _1952 + 1;
    float _1956 = as_type<float>(_966) * _1940;
    bool _1958 = !_1948;
    int _1960 = _1958 ? 0 : 1;
    bool _1962 = uint(_1936) >= uint(_829);
    int _1964 = _1954;
    if (!_1920)
    {
        int _1966 = ~_1938;
        int _1968 = _1966 + 1;
        _1964 = _1968;
    }
    int _1970 = _1964;
    float _1972 = trunc(_1956);
    float _1974 = precise::max(_1972, 0.0);
    uint _1976 = uint(_1974);
    bool _1978 = uint(_1944) >= uint(_749);
    bool _1980 = !_1962;
    int _1982 = _1980 ? 0 : (-1);
    bool _1984 = _1908 != 3;
    bool _1986 = !_1978;
    int _1988 = _1986 ? 0 : (-1);
    bool _1990 = uint(_1908) >= 2u;
    int _1992 = ~_1922;
    int _1994 = _1992 + _1982;
    int _1996 = _1994 + 1;
    int _1998 = ~_765;
    int _2000 = _1998 + 1;
    int _2002 = int(_1802) + int(_1900);
    int _2004 = _829 * _1996;
    int _2006 = _2004 + _1670;
    int _2008 = ~_829;
    int _2010 = _2008 + 1;
    int _2012 = _1990 ? 0 : 1;
    int _2014 = _2000 * _2002;
    int _2016 = _2014 + _1336;
    int _2018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2020 = _2018 != 0;
    int _2022 = ~_2012;
    int _2024 = _2022 + 1;
    int _2026 = _2024 + 1;
    int _2028 = _2026;
    if (_1984)
    {
        int _2030 = ~_2012;
        int _2032 = _2030 + 1;
        _2028 = _2032;
    }
    int _2034 = _2028;
    int _2036 = _2010 * int(_1976);
    int _2038 = _2036 + _1584;
    int _2040 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2042 = _2040 != 0;
    bool _2044 = !_2020;
    int _2046 = _2044 ? 0 : 1;
    bool _2048 = uint(_2016) >= uint(_765);
    bool _2050 = !_1514;
    int _2052 = _2050 ? _2006 : (-1);
    float _2054 = in.m_68.x;
    float _2056 = in.m_68.y;
    float _2058 = in.m_68.z;
    bool _2060 = !_2042;
    int _2062 = _2060 ? 0 : 1;
    bool _2064 = !_2048;
    int _2066 = _2064 ? 0 : (-1);
    int _2068 = _2052 & 3;
    bool _2070 = _2068 != 0;
    int _2072 = _2052 & 3;
    bool _2074 = _2072 != 0;
    float _2076 = float(uint(_2038));
    int _2078 = _2070 ? 0 : 1;
    bool _2080 = uint(_2072) > 1u;
    float _2082 = as_type<float>(_966) * _2076;
    int _2084 = ~_2078;
    int _2086 = _2084 + 1;
    int _2088 = _2086 + 1;
    int _2090 = ~_829;
    int _2092 = _2090 + 1;
    float _2094 = trunc(_2082);
    float _2096 = precise::max(_2094, 0.0);
    uint _2098 = uint(_2096);
    float _2100 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2102 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _2104 = _2088;
    if (!_2080)
    {
        int _2106 = ~_2078;
        int _2108 = _2106 + 1;
        _2104 = _2108;
    }
    int _2110 = _2104;
    float _2112 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2114 = uint(_2072) >= 2u;
    int _2116 = _2114 ? 0 : 1;
    bool _2118 = _2072 != 3;
    float _2120 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2122 = int(_1976) + int(_2098);
    float _2124 = in.m_70.x;
    float _2126 = in.m_70.y;
    float _2128 = in.m_70.z;
    int _2130 = ~_2116;
    int _2132 = _2130 + 1;
    int _2134 = _2132 + 1;
    int _2136 = _2092 * _2122;
    int _2138 = _2136 + _1584;
    float _2140 = in.m_72.x;
    float _2142 = in.m_72.y;
    float _2144 = in.m_72.z;
    int _2146 = _2134;
    float _2148 = _2142;
    if (_2118)
    {
        int _2150 = ~_2116;
        int _2152 = _2150 + 1;
        _2146 = _2152;
    }
    int _2154 = _2146;
    float _2156 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _2158 = uint(_2138) >= uint(_829);
    float _2160 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _2162 = !_2158;
    int _2164 = _2162 ? 0 : (-1);
    bool _2166 = _914 > 0.5;
    float _2168 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2170 = -_193;
    int _2172 = _2166 ? as_type<int>(_2170) : as_type<int>(_193);
    bool _2174 = _924 != 1;
    float _2176 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2178 = in.m_48.x;
    float _2180 = in.m_48.y;
    float _2182 = in.m_48.z;
    float _2184 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2176);
    int _2186 = ~_2002;
    int _2188 = _2186 + _2066;
    int _2190 = _2188 + 1;
    float _2192 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2194 = _2192 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _2196 = abs(_1970);
    int _2198 = _765 * _2190;
    int _2200 = _2198 + _1336;
    bool _2202 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2204 = isnan(_731);
    bool _2206 = _2202 || _2204;
    bool _2208 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2210 = _2206 || _2208;
    float _2212 = float(_2210);
    float _2214 = 0.0;
    if (!_2174)
    {
        _2214 = _922;
    }
    float _2216 = _2214;
    float _2218 = 1.0 / _2194;
    float _2220 = 0.0;
    float _2222 = _2216;
    if (!_2174)
    {
        _2220 = _922;
    }
    float _2224 = _2220;
    float _2226 = 0.0;
    float _2228 = _2224;
    if (!_2174)
    {
        _2226 = _942;
    }
    float _2230 = _2226;
    float _2232 = 0.0;
    float _2234 = _2230;
    if (!_2174)
    {
        _2232 = _942;
    }
    float _2236 = _2232;
    float _2238 = _2236;
    if (_2174)
    {
        _2222 = _914;
    }
    float _2240 = _2222;
    if (_2174)
    {
        _2228 = _914;
    }
    float _2242 = _2228;
    if (_2174)
    {
        _2234 = _922;
    }
    float _2244 = _2234;
    float _2246 = _2180 * _2142;
    if (_2174)
    {
        _2238 = _922;
    }
    float _2248 = _2238;
    float _2250 = _2180 * _2056;
    bool _2252 = _926 != 2;
    float _2254 = _2180 * _2126;
    float _2256 = _2244 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2258 = !_1738;
    int _2260 = _2258 ? 0 : 1;
    float _2262 = fma(_2178, _2124, _2254);
    float _2264 = fma(_2256, -2.0, _2168);
    int _2266 = ~_2122;
    int _2268 = _2266 + _2164;
    int _2270 = _2268 + 1;
    float _2272 = fma(_2182, _2128, _2262);
    int _2274 = ~_1928;
    int _2276 = _2274 + _1988;
    int _2278 = _2276 + 1;
    int _2280 = abs(_1810);
    float _2282 = _2272 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    if (_2252)
    {
        _2148 = _914;
    }
    float _2284 = _2148;
    int _2286 = _829 * _2270;
    int _2288 = _2286 + _1584;
    float _2290 = _2284;
    if (_2252)
    {
        _1532 = _922;
    }
    float _2292 = _1532;
    int _2294 = _749 * _2278;
    int _2296 = _2294 + _1234;
    float _2298 = _2292;
    if (!_2252)
    {
        _2290 = _942;
    }
    float _2300 = _2290;
    if (!_2252)
    {
        _2298 = _914;
    }
    float _2302 = _2298;
    int _2304 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2306 = _2304 != 0;
    float _2308 = fma(_2178, _2140, _2246);
    float _2310 = fma(_2178, _2054, _2250);
    float _2312 = _914 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2314 = fma(_2182, _2144, _2308);
    float _2316 = fma(_2182, _2058, _2310);
    float _2318 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2320 = log2(_2318);
    float _2322 = -_2102;
    float _2324 = fma(_2312, 2.0, _2322);
    float _2326 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2328 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2330 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2332 = _922 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2334 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2326);
    float _2336 = _928 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2338 = fma(_2332, -2.0, _2328);
    float _2340 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2342 = fma(_2336, -2.0, _2100);
    float _2344 = _2240 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2346 = fma(_2248, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2330);
    float _2348 = _2320 * _127;
    float _2350 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2340);
    float _2352 = _930 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _2354 = !_2306;
    float _2356 = _2354 ? _193 : as_type<float>(_2172);
    float _2358 = exp2(_2348);
    bool _2360 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2362 = isnan(0.0);
    bool _2364 = _2360 || _2362;
    bool _2366 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2368 = _2364 || _2366;
    float _2370 = -_2112;
    float _2372 = fma(_2344, 2.0, _2370);
    float _2374 = _2300 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2376 = _2302 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2378 = _914 * 2.0;
    float _2380 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2382 = -_2120;
    float _2384 = fma(_2374, 2.0, _2382);
    float _2386 = fma(_2376, -2.0, _2156);
    float _2388 = floor(_2378);
    float _2390 = -_2380;
    float _2392 = fma(_2352, 2.0, _2390);
    float _2394 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2396 = -_2358;
    float _2398 = _2396 + 1.0;
    float _2400 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2402 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2404 = fma(_2242, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2160);
    float _2406 = _2368 ? _2398 : 0.0;
    float _2408 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2394);
    bool _2410 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2412 = isnan(1.0);
    bool _2414 = _2410 || _2412;
    bool _2416 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2418 = _2414 || _2416;
    float _2420 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2422 = 1.0 + _2420;
    float _2424 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2426 = _2424 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2428 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2400);
    float _2430 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2402);
    float _2432 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2434 = _2432 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2436 = 1.0 / _2422;
    float _2438 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2408);
    float _2440 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2350);
    float _2442 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2338);
    float _2444 = -_127;
    float _2446 = fma(_2444, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2392);
    float _2448 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2404);
    float _2450 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2428);
    float _2452 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2430);
    float _2454 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2184);
    float _2456 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2334);
    float _2458 = -_127;
    float _2460 = fma(_2458, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2324);
    float _2462 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2342);
    float _2464 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2346);
    float _2466 = -_127;
    float _2468 = fma(_2466, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2372);
    float _2470 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2264);
    float _2472 = -_127;
    float _2474 = fma(_2472, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2384);
    float _2476 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2386);
    if (_2418)
    {
        float _2478 = _2406 * _2436;
        _137 = _2478;
    }
    float _2480 = _137;
    float _2482 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2484 = _2482 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2486 = 1.0 / _2426;
    float _2488 = _2316 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _2490 = _2388 >= 0.0;
    bool _2492 = isnan(_2388);
    bool _2494 = _2490 || _2492;
    bool _2496 = isnan(0.0);
    bool _2498 = _2494 || _2496;
    float _2500 = _2314 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2502 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2504 = _2502 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _2506 = _2498 ? 0 : 1;
    float _2508 = 1.0 / _2434;
    bool _2510 = _2388 > 0.0;
    float _2512 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2514 = _2512 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2516 = -_2450;
    float _2518 = _2516 + 1.0;
    float _2520 = -_2452;
    float _2522 = _2520 + 1.0;
    float _2524 = floor(_982);
    float _2526 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2528 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2526;
    float _2530 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2532 = _2530 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2534 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2536 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2534;
    float _2538 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2540 = _2538 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _2542 = _1890 >> 31;
    float _2544 = _2532 * _2486;
    int _2546 = ~_2506;
    int _2548 = _2546 + 1;
    int _2550 = _2548 + 1;
    float _2552 = 1.0 / _2484;
    float _2554 = _2536 * _2508;
    int _2556 = _2550;
    if (!_2510)
    {
        int _2558 = ~_2506;
        int _2560 = _2558 + 1;
        _2556 = _2560;
    }
    int _2562 = _2556;
    float _2564 = -_2212;
    float _2566 = _2564 + 1.0;
    float _2568 = -_2454;
    float _2570 = _2568 + 1.0;
    int _2572 = abs(_2110);
    float _2574 = 1.0 / _2504;
    bool _2576 = _2524 >= 0.0;
    bool _2578 = isnan(_2524);
    bool _2580 = _2576 || _2578;
    bool _2582 = isnan(0.0);
    bool _2584 = _2580 || _2582;
    float _2586 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2588 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2586;
    float _2590 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2592 = _2590 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _2594 = ~_2572;
    int _2596 = _2594 + 1;
    int _2598 = _2596 + 1;
    int _2600 = _2584 ? 0 : 1;
    float _2602 = _2592 * _2218;
    float _2604 = 1.0 / _2514;
    float _2606 = _2528 * _2552;
    float _2608 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2610 = _2608 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _2612 = _2524 > 0.0;
    float _2614 = _942 * 2.0;
    bool _2616 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2618 = isnan(_731);
    bool _2620 = _2616 || _2618;
    bool _2622 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2624 = _2620 || _2622;
    float _2626 = float(_2624);
    int _2628 = abs(_2260);
    float _2630 = 1.0 / _2540;
    float _2632 = _2610 * _2574;
    int _2634 = abs(_2154);
    int _2636 = abs(_1960);
    float _2638 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2640 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2638;
    float _2642 = _2588 * _2604;
    bool _2644 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2646 = isnan(_731);
    bool _2648 = _2644 || _2646;
    bool _2650 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2652 = _2648 || _2650;
    float _2654 = float(_2652);
    float _2656 = floor(_2614);
    int _2658 = ~_2600;
    int _2660 = _2658 + 1;
    int _2662 = _2660 + 1;
    int _2664 = _2662;
    if (!_2612)
    {
        int _2666 = ~_2600;
        int _2668 = _2666 + 1;
        _2664 = _2668;
    }
    int _2670 = _2664;
    float _2672 = -_2654;
    float _2674 = _2672 + 1.0;
    bool _2676 = !_1514;
    int _2678 = _2676 ? _2288 : (-1);
    float _2680 = _2640 * _2630;
    float _2682 = _2626 * _2674;
    float _2684 = -_2626;
    float _2686 = _2684 + 1.0;
    bool _2688 = !_1294;
    int _2690 = _2688 ? _2200 : (-1);
    bool _2692 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2694 = isnan(_731);
    bool _2696 = _2692 || _2694;
    bool _2698 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2700 = _2696 || _2698;
    float _2702 = float(_2700);
    float _2704 = _2212 * _2686;
    int _2706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2708 = _2706 != 0;
    int _2710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2712 = _2710 != 0;
    int _2714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2716 = _2714 != 0;
    float _2718 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2720 = _731 + _2718;
    bool _2722 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2724 = isnan(_731);
    bool _2726 = _2722 || _2724;
    bool _2728 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2730 = _2726 || _2728;
    float _2732 = float(_2730);
    float _2734 = _2702 * _2566;
    bool _2736 = _2656 >= 0.0;
    bool _2738 = isnan(_2656);
    bool _2740 = _2736 || _2738;
    bool _2742 = isnan(0.0);
    bool _2744 = _2740 || _2742;
    float _2746 = -_2702;
    float _2748 = _2746 + 1.0;
    bool _2750 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2752 = isnan(_731);
    bool _2754 = _2750 || _2752;
    bool _2756 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2758 = _2754 || _2756;
    float _2760 = float(_2758);
    float _2762 = -_2732;
    float _2764 = _2762 + 1.0;
    int _2766 = _2744 ? 0 : 1;
    float _2768 = _2732 * _2748;
    bool _2770 = _2656 > 0.0;
    float _2772 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2774 = _731 + _2772;
    bool _2776 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2778 = isnan(_731);
    bool _2780 = _2776 || _2778;
    bool _2782 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2784 = _2780 || _2782;
    float _2786 = float(_2784);
    float _2788 = fma(_2606, _2720, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2790 = -_2760;
    float _2792 = _2790 + 1.0;
    float _2794 = _2760 * _2764;
    int _2796 = _2542 & 3;
    float _2798 = fma(_2544, _2774, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _2800 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2802 = isnan(_731);
    bool _2804 = _2800 || _2802;
    bool _2806 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2808 = _2804 || _2806;
    float _2810 = float(_2808);
    float _2812 = _2786 * _2792;
    float _2814 = -_2786;
    float _2816 = _2814 + 1.0;
    int _2818 = _1890 + _2796;
    float _2820 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2822 = _731 + _2820;
    float _2824 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2826 = _731 + _2824;
    float _2828 = _2810 * _2816;
    int _2830 = _2818 >> 2;
    float _2832 = -_2810;
    float _2834 = _2832 + 1.0;
    float _2836 = fma(_2554, _2822, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2838 = _2788 * _2828;
    int _2840 = _2830 << 4;
    int _2842 = _2840 + 656;
    float _2844 = fma(_2632, _2826, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2846 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2848 = _731 + _2846;
    float _2850 = fma(_2834, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2838);
    uint _2852 = uint(int(uint(_2842) >> uint(2)));
    uint _2854 = uint(int(uint(int(_2852)) >> uint(2)));
    int _2856 = int(_2852) & 3;
    float _2858 = (*spvDescriptorSet0.vp_c9)._m0[int(_2854)][_2856];
    int _2860 = int(_2852) + 1;
    uint _2862 = uint(int(uint(_2860) >> uint(2)));
    int _2864 = _2860 & 3;
    float _2866 = (*spvDescriptorSet0.vp_c9)._m0[int(_2862)][_2864];
    float _2868 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2870 = _731 + _2868;
    float _2872 = fma(_2602, _2848, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2874 = fma(_2798, _2812, _2850);
    int _2876 = ~_2766;
    int _2878 = _2876 + 1;
    int _2880 = _2878 + 1;
    float _2882 = fma(_2642, _2870, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _2884 = _2880;
    if (!_2770)
    {
        int _2886 = ~_2766;
        int _2888 = _2886 + 1;
        _2884 = _2888;
    }
    int _2890 = _2884;
    float _2892 = fma(_2836, _2794, _2874);
    float _2894 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2896 = _2488 + _2894;
    int _2898 = _2842 + 8;
    uint _2900 = uint(int(uint(_2898) >> uint(2)));
    uint _2902 = uint(int(uint(int(_2900)) >> uint(2)));
    int _2904 = int(_2900) & 3;
    float _2906 = (*spvDescriptorSet0.vp_c9)._m0[int(_2902)][_2904];
    int _2908 = int(_2900) + 1;
    uint _2910 = uint(int(uint(_2908) >> uint(2)));
    int _2912 = _2908 & 3;
    float _2914 = (*spvDescriptorSet0.vp_c9)._m0[int(_2910)][_2912];
    float _2916 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2918 = _2500 + _2916;
    float _2920 = fma(_2844, _2768, _2892);
    float _2922 = _2896 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2924 = _922 + _914;
    float _2926 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2928 = _731 + _2926;
    bool _2930 = !_1910;
    int _2932 = _2930 ? 0 : 1;
    float _2934 = fma(_2918, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2922);
    float _2936 = _914 + _942;
    float _2938 = _914 + (-0.5);
    float _2940 = fma(_2882, _2734, _2920);
    bool _2942 = _1908 != 3;
    float _2944 = _2924 + (-1.0);
    float _2946 = _922 + _942;
    float _2948 = _922 + (-0.5);
    float _2950 = _1906 + (-0.5);
    int _2952 = abs(_2932);
    float _2954 = fma(_2872, _2704, _2940);
    int _2956 = ~_2196;
    int _2958 = _2956 + 1;
    int _2960 = _2958 + 1;
    float _2962 = -_2950;
    float _2964 = -_2462;
    float _2966 = fma(_2962, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2964);
    float _2968 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2970 = int(_2968);
    float _2972 = fma(_2680, _2928, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2974 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2976 = _2282 + _2974;
    int _2978 = abs(_2034);
    float _2980 = fma(_2944, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2982 = ~_2952;
    int _2984 = _2982 + 1;
    int _2986 = _2984 + 1;
    float _2988 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2934);
    int _2990 = ~_2978;
    int _2992 = _2990 + 1;
    int _2994 = _2992 + 1;
    float _2996 = _2356 + 0.5;
    bool _2998 = !_2942;
    int _3000 = _2998 ? 0 : (-1);
    float _3002 = _1918 + (-0.5);
    bool _3004 = _2988 >= 0.0;
    float _3006 = _1716 + 0.5;
    int _3008 = abs(_3000);
    float _3010 = fma(_2972, _2682, _2954);
    bool _3012 = !_2708;
    int _3014 = _3012 ? 0 : 1;
    float _3016 = fma(_3006, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2446);
    int _3018 = ~_3008;
    int _3020 = _3018 + 1;
    int _3022 = _3020 + 1;
    int _3024 = _2960 * as_type<int>(_2866);
    float _3026 = fma(_2996, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2460);
    float _3028 = -_3002;
    float _3030 = -_2442;
    float _3032 = fma(_3028, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3030);
    int _3034 = abs(_2046);
    int _3036 = _2986 * as_type<int>(_2858);
    int _3038 = _3036 + _3024;
    float _3040 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3042 = _2858;
    if (_3004)
    {
        _3042 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3044 = _3042;
    int _3046 = ~_3034;
    int _3048 = _3046 + 1;
    int _3050 = _3048 + 1;
    int _3052 = _2994 * as_type<int>(_2906);
    int _3054 = _3052 + _3038;
    float _3056 = float(uint(_2970));
    float _3058 = _2896 * _2896;
    int _3060 = as_type<int>(_3044);
    if (_3004)
    {
        float _3062 = _3044 * 5.0;
        _3060 = as_type<int>(_3062);
    }
    int _3064 = _3060;
    int _3066 = _3022 * as_type<int>(_2914);
    int _3068 = _3066 + _3054;
    float _3070 = -_2440;
    float _3072 = _3070 + 1.0;
    float _3074 = -_2456;
    float _3076 = _3074 + 1.0;
    float _3078 = 1.0 / _3056;
    int _3080 = _3068 * _3050;
    float _3082 = fma(_2918, _2918, _3058);
    float _3084 = -_3072;
    float _3086 = fma(_3084, _1716, _3016);
    float _3088 = fma(_3076, _1906, _2966);
    int _3090 = _2690 * _3034;
    int _3092 = _3090 + _3080;
    float _3094 = fma(_2976, _2976, _3082);
    int _3096 = abs(_2970);
    if (_3004)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9441 = as_type<float>(_3064);
        out.gl_Position.z = _9441;
    }
    float _3098 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3100 = _2052 >> 31;
    float _3102 = _3040 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    out.m_74.x = _3086;
    out.m_74.y = _3088;
    float _3104 = float(uint(_3096));
    float _3106 = fma(_2654, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3010);
    int _3108 = _3100 & 3;
    if (_3004)
    {
        out.m_55.x = 0.0;
    }
    float _3110 = rsqrt(_3094);
    int _3112 = _1706 >> 31;
    int _3114 = as_type<int>(_3078) + (-2);
    float _3116 = _1680 + 0.5;
    float _3118 = float(uint(_3092));
    float _3120 = _1438 + (-0.5);
    int _3122 = _3112 & 3;
    float _3124 = 1.0 / _3104;
    float _3126 = _3098 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3128 = as_type<float>(_3114) * _3118;
    float _3130 = fma(_3102, _3116, _2468);
    int _3132 = _1706 + _3122;
    float _3134 = -_3126;
    float _3136 = -_2470;
    float _3138 = fma(_3134, _3120, _3136);
    int _3140 = ~_2970;
    int _3142 = _3140 + 1;
    out.m_76.x = _3106;
    float _3144 = trunc(_3128);
    float _3146 = precise::max(_3144, 0.0);
    uint _3148 = uint(_3146);
    int _3150 = _2052 + _3108;
    float _3152 = _2896 * _3110;
    float _3154 = _2918 * _3110;
    int _3156 = abs(_3092);
    int _3158 = _3150 >> 2;
    float _3160 = -_3152;
    float _3162 = fma(_3160, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2896);
    int _3164 = as_type<int>(_3124) + (-2);
    float _3166 = -_3154;
    float _3168 = fma(_3166, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2918);
    int _3170 = _3158 << 4;
    int _3172 = _3170 + 800;
    float _3174 = _3162 * _3162;
    int _3176 = _3132 >> 2;
    float _3178 = float(uint(_3156));
    uint _3180 = uint(int(uint(_3172) >> uint(2)));
    uint _3182 = uint(int(uint(int(_3180)) >> uint(2)));
    int _3184 = int(_3180) & 3;
    float _3186 = (*spvDescriptorSet0.vp_c9)._m0[int(_3182)][_3184];
    int _3188 = int(_3180) + 1;
    uint _3190 = uint(int(uint(_3188) >> uint(2)));
    int _3192 = _3188 & 3;
    float _3194 = (*spvDescriptorSet0.vp_c9)._m0[int(_3190)][_3192];
    int _3196 = _3142 * int(_3148);
    int _3198 = _3196 + _3092;
    int _3200 = _3176 << 4;
    int _3202 = _3200 + 368;
    float _3204 = fma(_3168, _3168, _3174);
    float _3206 = as_type<float>(_3164) * _3178;
    int _3208 = abs(_3014);
    float _3210 = -_2448;
    float _3212 = _3210 + 1.0;
    float _3214 = float(uint(_3198));
    uint _3216 = uint(int(uint(_3202) >> uint(2)));
    uint _3218 = uint(int(uint(int(_3216)) >> uint(2)));
    int _3220 = int(_3216) & 3;
    float _3222 = (*spvDescriptorSet0.vp_c9)._m0[int(_3218)][_3220];
    int _3224 = int(_3216) + 1;
    uint _3226 = uint(int(uint(_3224) >> uint(2)));
    int _3228 = _3224 & 3;
    float _3230 = (*spvDescriptorSet0.vp_c9)._m0[int(_3226)][_3228];
    float _3232 = -_2438;
    float _3234 = _3232 + 1.0;
    float _3236 = float(_2890);
    float _3238 = trunc(_3206);
    float _3240 = precise::max(_3238, 0.0);
    uint _3242 = uint(_3240);
    float _3244 = as_type<float>(_3114) * _3214;
    float _3246 = -_3234;
    float _3248 = fma(_2356, _3246, _3026);
    float _3250 = -_2464;
    float _3252 = _3250 + 1.0;
    float _3254 = fma(_1918, _2518, _3032);
    int _3256 = ~_3096;
    int _3258 = _3256 + 1;
    float _3260 = -_3212;
    float _3262 = fma(_1680, _3260, _3130);
    float _3264 = fma(_1438, _3252, _3138);
    float _3266 = trunc(_3244);
    float _3268 = precise::max(_3266, 0.0);
    uint _3270 = uint(_3268);
    int _3272 = ~_2970;
    int _3274 = _3272 + 1;
    float _3276 = float(_3208);
    out.m_78.x = _3248;
    out.m_78.y = _3254;
    out.m_78.z = _3262;
    out.m_78.w = _3264;
    bool _3278 = _749 == 0;
    int _3280 = _3258 * int(_3242);
    int _3282 = _3280 + _3156;
    float _3284 = _3276 * _3236;
    bool _3286 = !_3278;
    int _3288 = _3286 ? _2296 : (-1);
    int _3290 = _3202 + 8;
    uint _3292 = uint(int(uint(_3290) >> uint(2)));
    uint _3294 = uint(int(uint(int(_3292)) >> uint(2)));
    int _3296 = int(_3292) & 3;
    float _3298 = (*spvDescriptorSet0.vp_c9)._m0[int(_3294)][_3296];
    int _3300 = int(_3292) + 1;
    uint _3302 = uint(int(uint(_3300) >> uint(2)));
    int _3304 = _3300 & 3;
    float _3306 = (*spvDescriptorSet0.vp_c9)._m0[int(_3302)][_3304];
    float _3308 = float(uint(_3282));
    int _3310 = int(_3148) + int(_3270);
    float _3312 = as_type<float>(_3164) * _3308;
    int _3314 = _3172 + 8;
    uint _3316 = uint(int(uint(_3314) >> uint(2)));
    uint _3318 = uint(int(uint(int(_3316)) >> uint(2)));
    int _3320 = int(_3316) & 3;
    float _3322 = (*spvDescriptorSet0.vp_c9)._m0[int(_3318)][_3320];
    int _3324 = int(_3316) + 1;
    uint _3326 = uint(int(uint(_3324) >> uint(2)));
    int _3328 = _3324 & 3;
    float _3330 = (*spvDescriptorSet0.vp_c9)._m0[int(_3326)][_3328];
    bool _3332 = !_2074;
    int _3334 = _3332 ? 0 : 1;
    int _3336 = _3274 * _3310;
    int _3338 = _3336 + _3092;
    float _3340 = trunc(_3312);
    float _3342 = precise::max(_3340, 0.0);
    uint _3344 = uint(_3342);
    int _3346 = ~_2280;
    int _3348 = _3346 + 1;
    int _3350 = _3348 + 1;
    bool _3352 = _1736 != 3;
    int _3354 = _2598 * as_type<int>(_3194);
    int _3356 = abs(_3334);
    int _3358 = ~_3096;
    int _3360 = _3358 + 1;
    int _3362 = ~_2628;
    int _3364 = _3362 + 1;
    int _3366 = _3364 + 1;
    int _3368 = _3350 * as_type<int>(_3230);
    bool _3370 = !_3352;
    int _3372 = _3370 ? 0 : (-1);
    bool _3374 = uint(_3338) >= uint(_2970);
    int _3376 = _3366 * as_type<int>(_3222);
    int _3378 = _3376 + _3368;
    int _3380 = int(_3242) + int(_3344);
    int _3382 = ~_3356;
    int _3384 = _3382 + 1;
    int _3386 = _3384 + 1;
    bool _3388 = !_3374;
    int _3390 = _3388 ? 0 : (-1);
    int _3392 = _3360 * _3380;
    int _3394 = _3392 + _3156;
    bool _3396 = _2072 != 3;
    int _3398 = _3386 * as_type<int>(_3186);
    int _3400 = _3398 + _3354;
    int _3402 = abs(_1880);
    int _3404 = ~_3310;
    int _3406 = _3404 + _3390;
    int _3408 = _3406 + 1;
    bool _3410 = !_3396;
    int _3412 = _3410 ? 0 : (-1);
    bool _3414 = uint(_3394) >= uint(_3096);
    int _3416 = _2970 * _3408;
    int _3418 = _3416 + _3092;
    int _3420 = ~_3402;
    int _3422 = _3420 + 1;
    int _3424 = _3422 + 1;
    int _3426 = abs(_3372);
    int _3428 = _3424 * as_type<int>(_3298);
    int _3430 = _3428 + _3378;
    int _3432 = _3092 ^ _2970;
    float _3434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3436 = ~_2634;
    int _3438 = _3436 + 1;
    int _3440 = _3438 + 1;
    int _3442 = ~_3426;
    int _3444 = _3442 + 1;
    int _3446 = _3444 + 1;
    bool _3448 = !_3414;
    int _3450 = _3448 ? 0 : (-1);
    int _3452 = _3440 * as_type<int>(_3322);
    int _3454 = _3452 + _3400;
    uint _3456 = uint(int(uint(_3432) >> uint(31)));
    int _3458 = _3446 * as_type<int>(_3306);
    int _3460 = _3458 + _3430;
    int _3462 = abs(_3412);
    float _3464 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3466 = ~_3450;
    int _3468 = _3380 + _3466;
    int _3470 = _3468 + 1;
    int _3472 = ~int(_3456);
    int _3474 = _3472 + 1;
    int _3476 = abs(_2062);
    bool _3478 = _2970 == 0;
    int _3480 = ~_3462;
    int _3482 = _3480 + 1;
    int _3484 = _3482 + 1;
    int _3486 = _3470 ^ _3474;
    int _3488 = ~_2636;
    int _3490 = _3488 + 1;
    int _3492 = _3490 + 1;
    int _3494 = _3484 * as_type<int>(_3330);
    int _3496 = _3494 + _3454;
    bool _3498 = !_3478;
    int _3500 = _3498 ? _3418 : (-1);
    float _3502 = _3464 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3504 = _3460 * _3492;
    bool _3506 = _2970 == 0;
    float _3508 = in.m_80.x;
    float _3510 = in.m_80.y;
    float _3512 = in.m_80.z;
    int _3514 = ~_3474;
    int _3516 = _3514 + _3486;
    int _3518 = _3516 + 1;
    int _3520 = _3288 * _2636;
    int _3522 = _3520 + _3504;
    int _3524 = ~_3476;
    int _3526 = _3524 + 1;
    int _3528 = _3526 + 1;
    bool _3530 = !_3506;
    int _3532 = _3530 ? _3518 : (-1);
    float _3534 = float(_3500);
    int _3536 = _3496 * _3528;
    float _3538 = float(_3532);
    float _3540 = _3434 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3542 = float(_3522);
    float _3544 = fma(_3502, _3534, _2474);
    float _3546 = _1126 + 0.5;
    float _3548 = -_2476;
    float _3550 = fma(_3540, _3538, _3548);
    float _3552 = _1064 + (-0.5);
    int _3554 = _2678 * _3476;
    int _3556 = _3554 + _3536;
    float _3558 = fma(_3502, _3546, _3544);
    out.m_82.x = _3542;
    float _3560 = -_3540;
    float _3562 = fma(_3560, _3552, _3550);
    float _3564 = _3284 * (-2.0);
    float _3566 = -_2522;
    float _3568 = fma(_1126, _3566, _3558);
    float _3570 = float(_3556);
    float _3572 = fma(_1064, _2570, _3562);
    float _3574 = fma(_2980, _3564, _2980);
    float _3576 = fma(_3564, _3508, _3508);
    float _3578 = _2976 * _3110;
    bool _3580 = !_2712;
    int _3582 = _3580 ? 0 : 1;
    out.m_82.w = _3570;
    bool _3584 = !_2716;
    int _3586 = _3584 ? 0 : 1;
    float _3588 = -_3578;
    float _3590 = fma(_3588, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2976);
    int _3592 = abs(_3582);
    out.m_84.x = _3568;
    out.m_84.y = _3572;
    float _3594 = _3512;
    if (_3004)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3596 = -_3152;
    float _3598 = fma(_3596, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2488);
    float _3600 = -_3154;
    float _3602 = fma(_3600, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2500);
    float _3604 = float(_2562);
    float _3606 = _2946 + (-1.0);
    float _3608 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3610 = _3598 + _3608;
    float _3612 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3614 = _3602 + _3612;
    float _3616 = float(_3592);
    float _3618 = fma(_2938, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3576);
    float _3620 = _3610 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3622 = _2936 + (-1.0);
    float _3624 = _3616 * _3604;
    float _3626 = fma(_3614, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3620);
    float _3628 = -_3578;
    float _3630 = fma(_3628, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2282);
    int _3632 = abs(_3586);
    float _3634 = fma(_3606, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3636 = fma(_3574, _2480, _3618);
    float _3638 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3640 = _3630 + _3638;
    float _3642 = float(_2670);
    float _3644 = fma(_3590, _3590, _3204);
    float _3646 = float(_3632);
    float _3648 = fma(_3640, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3626);
    float _3650 = _3624 * (-2.0);
    float _3652 = _3636 * 0.15915493667125701904296875;
    float _3654 = sqrt(_3644);
    float _3656 = _3646 * _3642;
    float _3658 = fma(_3650, _3510, _3510);
    bool _3660 = _3648 >= 0.0;
    float _3662 = fma(_3634, _3650, _3634);
    float _3664 = _3656 * (-2.0);
    float _3666 = fma(_2948, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3658);
    float _3668 = _3652 * 6.283185482025146484375;
    float _3670 = sin(_3668);
    float _3672 = fma(_3664, _3512, _3512);
    float _3674 = fma(_3662, _2480, _3666);
    float _3676 = _942 + (-0.5);
    float _3678 = fma(_3622, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3680 = _3674 * 0.15915493667125701904296875;
    float _3682 = fma(_3676, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3672);
    if (_3660)
    {
        _3594 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3684 = _3594;
    float _3686 = _3652 * 6.283185482025146484375;
    float _3688 = cos(_3686);
    float _3690 = fma(_3678, _3664, _3678);
    int _3692 = as_type<int>(_3684);
    if (_3660)
    {
        out.m_55.x = 0.0;
    }
    if (_3660)
    {
        float _3694 = _3684 * 5.0;
        _3692 = as_type<int>(_3694);
    }
    int _3696 = _3692;
    float _3698 = fma(_3690, _2480, _3682);
    float _3700 = _3680 * 6.283185482025146484375;
    float _3702 = sin(_3700);
    if (_3660)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10342 = as_type<float>(_3696);
        out.gl_Position.z = _10342;
    }
    float _3704 = _3698 * 0.15915493667125701904296875;
    float _3706 = _3680 * 6.283185482025146484375;
    float _3708 = cos(_3706);
    if (_3660)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3710 = _3704 * 6.283185482025146484375;
    float _3712 = cos(_3710);
    float _3714 = _3110 * _3654;
    float _3716 = _535 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3718 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _3720 = _537 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3722 = _3670 * _3702;
    float _3724 = _3714 * _3716;
    float _3726 = _3688 * _3708;
    float _3728 = _3704 * 6.283185482025146484375;
    float _3730 = sin(_3728);
    float _3732 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _3734 = _3718 * _3724;
    float _3736 = _3714 * _3720;
    float _3738 = _3670 * _3708;
    float _3740 = _3688 * _3702;
    float _3742 = _3714 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3744 = _3742 * 0.5;
    float _3746 = _3732 * _3736;
    float _3748 = _3688 * _3712;
    float _3750 = _3670 * _3712;
    float _3752 = _3708 * _3712;
    float _3754 = _3702 * _3712;
    float _3756 = _3748 * _3734;
    float _3758 = _197 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3760 = fma(_3730, _3726, _3722);
    float _3762 = -_3738;
    float _3764 = fma(_3730, _3740, _3762);
    float _3766 = -_3734;
    float _3768 = _3730 * _3766;
    float _3770 = -_3740;
    float _3772 = fma(_3730, _3738, _3770);
    float _3774 = fma(_3760, _3746, _3756);
    float _3776 = _3750 * _3734;
    float _3778 = fma(_3752, _3746, _3768);
    float _3780 = fma(_3730, _3722, _3726);
    float _3782 = fma(_3764, _3744, _3774);
    float _3784 = fma(_3772, _3746, _3776);
    float _3786 = fma(_3754, _3744, _3778);
    float _3788 = _3782 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3790 = _3782 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3792 = fma(_3780, _3744, _3784);
    float _3794 = _3782 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3796 = fma(_3786, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3788);
    float _3798 = fma(_3786, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3790);
    float _3800 = _3760 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3802 = fma(_3786, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3794);
    float _3804 = fma(_3792, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3796);
    float _3806 = fma(_3792, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3798);
    float _3808 = fma(_3758, _3758, 1.0);
    float _3810 = fma(_3792, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3802);
    float _3812 = _3804 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3814 = _3806 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3816 = _3764 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3818 = _3810 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3820 = _2500 + _3812;
    float _3822 = _2282 + _3814;
    float _3824 = _3760 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3826 = _3760 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3828 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3830 = _3820 + _3828;
    float _3832 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3834 = _3822 + _3832;
    float _3836 = fma(_3752, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3824);
    float _3838 = fma(_3752, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3800);
    float _3840 = _3830 * _3830;
    float _3842 = _3834 * _3834;
    float _3844 = fma(_3752, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3826);
    float _3846 = _3748 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3848 = _3748 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3850 = _3840 + _3842;
    float _3852 = _3748 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3854 = -_3730;
    float _3856 = fma(_3854, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3846);
    float _3858 = _3764 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3860 = sqrt(_3850);
    float _3862 = _3764 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3864 = _2488 + _3818;
    float _3866 = -_3730;
    float _3868 = fma(_3866, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3848);
    float _3870 = -_3730;
    float _3872 = fma(_3870, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3852);
    float _3874 = fma(_3754, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3858);
    float _3876 = fma(_3754, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3816);
    float _3878 = fma(_3754, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3862);
    float _3880 = rsqrt(_3808);
    bool _3882 = _3860 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3884 = _3754;
    float _3886 = _3848;
    float _3888 = _3852;
    float _3890 = _3808;
    float _3892 = _3858;
    if (!_3882)
    {
        _3884 = _3842;
    }
    float _3894 = _3884;
    float _3896 = _3894;
    if (!_3882)
    {
        _3886 = _3840;
    }
    float _3898 = _3886;
    float _3900 = _3898;
    if (!_3882)
    {
        _3888 = _3820;
    }
    float _3902 = _3888;
    float _3904 = _3902;
    if (!_3882)
    {
        _3890 = _3822;
    }
    float _3906 = _3890;
    float _3908 = _3906;
    if (!_3882)
    {
        _3892 = _3864;
    }
    float _3910 = _3892;
    bool _3912 = !_3882;
    float _3914 = _3910;
    if (!_3912)
    {
        float _3916 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3918 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3920 = _3860 + _3918;
        float _3922 = rsqrt(_3850);
        float _3924 = _3920 * _3916;
        float _3926 = _3864 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3928 = _3924 * 0.15915493667125701904296875;
        float _3930 = _3928 * 6.283185482025146484375;
        float _3932 = sin(_3930);
        float _3934 = _3928 * 6.283185482025146484375;
        float _3936 = cos(_3934);
        float _3938 = fma(_3932, _3926, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3940 = _3922 * _3938;
        float _3942 = _3936 + (-1.0);
        float _3944 = fma(_3830, _3940, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3946 = fma(_3834, _3940, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3948 = _3942 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3950 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3952 = _3944 + _3950;
        float _3954 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3956 = _3946 + _3954;
        float _3958 = fma(_3864, _3936, _3948);
        float _3960 = _3952 * _3952;
        float _3962 = _3956 * _3956;
        _3914 = _3958;
        _3900 = _3960;
        _3896 = _3962;
        _3904 = _3944;
        _3908 = _3946;
    }
    float _3964 = _3914;
    float _3966 = _3900;
    float _3968 = _3896;
    float _3970 = _3904;
    float _3972 = _3908;
    float _3974 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3976 = _3964 + _3974;
    float _3978 = fma(_3750, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3868);
    float _3980 = fma(_3750, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3856);
    float _3982 = fma(_3750, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3872);
    float _3984 = fma(_3976, _3976, _3966);
    float _3986 = fma(_3780, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3874);
    float _3988 = fma(_3780, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3876);
    float _3990 = fma(_3780, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3878);
    float _3992 = _3984 + _3968;
    float _3994 = fma(_3772, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3836);
    float _3996 = _3758 * _3880;
    float _3998 = fma(_3772, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3838);
    float _4000 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4002 = _3758 * _3978;
    float _4004 = _3758 * _3980;
    float _4006 = fma(_3772, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3844);
    float _4008 = _3758 * _3982;
    float _4010 = -_3986;
    float _4012 = _3996 * _4010;
    float _4014 = -_3988;
    float _4016 = _3996 * _4014;
    float _4018 = -_3990;
    float _4020 = _3996 * _4018;
    float _4022 = sqrt(_3992);
    float _4024 = fma(_4000, _3994, _4002);
    float _4026 = fma(_4000, _3998, _4004);
    float _4028 = fma(_4000, _4006, _4008);
    float _4030 = fma(_3880, _3978, _4012);
    float _4032 = fma(_3880, _3980, _4016);
    float _4034 = fma(_3880, _3982, _4020);
    float _4036 = _3986 + _4024;
    float _4038 = _3988 + _4026;
    float _4040 = _3990 + _4028;
    out.m_86.x = _3994;
    out.m_86.y = _3998;
    out.m_86.z = _4006;
    out.m_88.x = _4030;
    out.m_88.y = _4032;
    out.m_88.z = _4034;
    bool _4042 = _4022 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4044 = isnan(_4022);
    bool _4046 = _4042 || _4044;
    bool _4048 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4050 = _4046 || _4048;
    out.m_90.x = _4036;
    out.m_90.y = _4038;
    out.m_90.z = _4040;
    float _4052 = _4026;
    float _4054 = _3994;
    float _4056 = _4034;
    if (!_4050)
    {
        _4052 = 1.0;
    }
    float _4058 = _4052;
    bool _4060 = !_4050;
    float _4062 = _4058;
    if (!_4060)
    {
        bool _4064 = _4022 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4066 = isnan(_4022);
        bool _4068 = _4064 || _4066;
        bool _4070 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4072 = _4068 || _4070;
        if (!_4072)
        {
            float _4074 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4076 = _4022 + _4074;
            float _4078 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4080 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4078;
            float _4082 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4084 = _4082 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4086 = 1.0 / _4080;
            float _4088 = _4076 * _4086;
            float _4090 = fma(_4088, _4084, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4062 = _4090;
            _4092 = true;
        }
        else
        {
            bool _4094 = _4022 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4096 = isnan(_4022);
            bool _4098 = _4094 || _4096;
            bool _4100 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4102 = _4098 || _4100;
            if (!_4102)
            {
                float _4104 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4106 = _4022 + _4104;
                float _4108 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4110 = _4108 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4112 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4114 = _4112 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4116 = 1.0 / _4110;
                float _4118 = _4106 * _4116;
                float _4120 = fma(_4118, _4114, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4062 = _4120;
                _4092 = true;
            }
            else
            {
                _4062 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4092 = false;
    float _4122 = _4062;
    float _4124 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4126 = _3964 + _4124;
    float _4128 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4130 = _3970 + _4128;
    float _4132 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4134 = _3972 + _4132;
    float _4136 = fma(_4126, _4122, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4138 = fma(_4130, _4122, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4140 = fma(_4134, _4122, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4142 = -_3152;
    float _4144 = fma(_4142, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4136);
    float _4146 = -_3154;
    float _4148 = fma(_4146, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4138);
    float _4150 = -_3578;
    float _4152 = fma(_4150, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4140);
    float _4154 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4156 = _4144 + _4154;
    float _4158 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4160 = _4148 + _4158;
    float _4162 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4164 = _4152 + _4162;
    float _4166 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4168 = _4156 * _4156;
    float _4170 = fma(_3602, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4172 = fma(_4160, _4160, _4168);
    float _4174 = floor(_4170);
    float _4176 = fma(_3630, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4178 = fma(_4164, _4164, _4172);
    float _4180 = rsqrt(_4178);
    float _4182 = sqrt(_4178);
    float _4184 = _4180 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4186 = floor(_4176);
    float _4188 = _4160 * _4184;
    float _4190 = _4164 * _4184;
    float _4192 = _4188 * _4188;
    float _4194 = _4190 * _4190;
    float _4196 = _4192 + _4194;
    float _4198 = sqrt(_4196);
    float _4200 = -_4186;
    float _4202 = _4176 + _4200;
    bool _4204 = _4198 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4206 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4208 = _4198 + _4206;
    float _4210 = _4164;
    float _4212 = _4196;
    float _4214 = _4208;
    float _4216 = _4156;
    if (_4204)
    {
        float _4218 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4210 = _4218;
    }
    float _4220 = _4210;
    if (_4204)
    {
        float _4222 = rsqrt(_4196);
        _4212 = _4222;
    }
    float _4224 = _4212;
    float _4226 = _4224;
    if (_4204)
    {
        float _4228 = _4208 * _4220;
        _4214 = _4228;
    }
    float _4230 = _4214;
    if (_4204)
    {
        float _4232 = _4230 * 0.15915493667125701904296875;
        _4054 = _4232;
    }
    float _4234 = _4054;
    float _4236 = _4220;
    float _4238 = _4234;
    if (_4204)
    {
        float _4240 = _4234 * 6.283185482025146484375;
        float _4242 = sin(_4240);
        _4236 = _4242;
    }
    float _4244 = _4236;
    float _4246 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4248 = precise::max(0.0, _4246);
    float _4250 = _4168;
    float _4252 = _4248;
    if (_4204)
    {
        float _4254 = _4234 * 6.283185482025146484375;
        float _4256 = cos(_4254);
        _4250 = _4256;
    }
    float _4258 = _4250;
    float _4260 = -_4184;
    float _4262 = -_4248;
    float _4264 = fma(_4156, _4260, _4262);
    if (!_4204)
    {
        _4216 = _4188;
    }
    float _4266 = _4216;
    float _4268 = _4266;
    if (_4204)
    {
        float _4270 = _4264 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4252 = _4270;
    }
    float _4272 = _4252;
    float _4274 = _4244;
    float _4276 = _4272;
    if (_4204)
    {
        float _4278 = fma(_4244, _4272, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4274 = _4278;
    }
    float _4280 = _4274;
    float _4282 = _4280;
    float _4284 = _4258;
    if (_4204)
    {
        float _4286 = _4258 + (-1.0);
        _4276 = _4286;
    }
    float _4288 = _4276;
    float _4290 = _4288;
    if (_4204)
    {
        float _4292 = _4224 * _4280;
        _4056 = _4292;
    }
    float _4294 = _4056;
    if (!_4204)
    {
        _4282 = _4264;
    }
    float _4296 = _4282;
    float _4298 = _4296;
    if (_4204)
    {
        float _4300 = _4288 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4238 = _4300;
    }
    float _4302 = _4238;
    if (_4204)
    {
        float _4304 = _4188 * _4294;
        _4268 = _4304;
    }
    float _4306 = _4268;
    if (!_4204)
    {
        _4290 = _4190;
    }
    float _4308 = _4290;
    float _4310 = _4308;
    if (_4204)
    {
        float _4312 = _4190 * _4294;
        _4310 = _4312;
    }
    float _4314 = _4310;
    if (!_4204)
    {
        _4226 = _4192;
    }
    float _4316 = _4226;
    float _4318 = _4316;
    if (_4204)
    {
        float _4320 = fma(_4264, _4258, _4302);
        _4298 = _4320;
    }
    float _4322 = _4298;
    if (_4204)
    {
        float _4324 = _4306 * _4306;
        _4318 = _4324;
    }
    float _4326 = _4318;
    if (!_4204)
    {
        _4284 = _4194;
    }
    float _4328 = _4284;
    float _4330 = _4328;
    if (_4204)
    {
        float _4332 = _4314 * _4314;
        _4330 = _4332;
    }
    float _4334 = _4330;
    float _4336 = _4144 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4338 = fma(_4322, _4322, _4326);
    float _4340 = _4144 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4342 = _4144 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4344 = fma(_4148, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4336);
    float _4346 = _4338 + _4334;
    float _4348 = _4144 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4350 = fma(_4148, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4340);
    float _4352 = fma(_4152, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4344);
    float _4354 = rsqrt(_4346);
    float _4356 = fma(_4148, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4348);
    float _4358 = fma(_4152, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4350);
    float _4360 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4362 = fma(_4182, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4360);
    float _4364 = precise::clamp(_4362, 0.0, 1.0);
    float _4366 = _4352 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4368 = fma(_4152, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4356);
    float _4370 = fma(_4148, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4342);
    float _4372 = _4358 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4374 = -_4364;
    float _4376 = _4374 + 1.0;
    float _4378 = _4368 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4380 = _4366 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4382 = _4372 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4384 = fma(_4152, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4370);
    float _4386 = -_4174;
    float _4388 = _4170 + _4386;
    float _4390 = fma(_4378, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4380);
    float _4392 = -_4382;
    float _4394 = fma(_4392, _4166, 1.0);
    float _4396 = abs(_4376);
    float _4398 = log2(_4396);
    float _4400 = _4354 * _4322;
    float _4402 = fma(_4372, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4390);
    float _4404 = _4354 * _4306;
    float _4406 = _4354 * _4314;
    float _4408 = _4384 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4410 = _4366 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4412 = _4404 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4414 = log2(_4394);
    float _4416 = fma(_4408, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4402);
    float _4418 = fma(_4378, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4410);
    float _4420 = -_4412;
    float _4422 = fma(_4400, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4420);
    float _4424 = -_4406;
    float _4426 = fma(_4424, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4422);
    float _4428 = _4398 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4430 = 1.0 / _4416;
    float _4432 = _4366 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4434 = fma(_4426, -0.5, 0.5);
    float _4436 = fma(_4426, 0.5, 0.5);
    float _4438 = fma(_4372, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4418);
    float _4440 = fma(_4378, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4432);
    float _4442 = _4400 + 1.0;
    float _4444 = fma(_4436, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4446 = exp2(_4428);
    float _4448 = fma(_4408, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4438);
    float _4450 = _4414 * 0.693147182464599609375;
    float _4452 = fma(_4436, _4444, -0.212114393711090087890625);
    float _4454 = _4450 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4456 = fma(_4436, _4452, 1.570728778839111328125);
    float _4458 = sqrt(_4434);
    float _4460 = fma(_4372, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4440);
    float _4462 = _4448 * _4430;
    float _4464 = fma(_4408, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4460);
    float _4466 = fma(_4462, 0.5, 0.5);
    float _4468 = -_4400;
    float _4470 = fma(_4446, _4442, _4468);
    float _4472 = _4464 * _4430;
    float _4474 = fma(_4470, 0.5, 0.5);
    float _4476 = fma(_4472, -0.5, 0.5);
    float _4478 = _4458 * 0.636619746685028076171875;
    float2 _11675 = float2(_4388, _4202);
    float _4480 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11675, float2(0.0), isnan(_11675)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11675, float2(0.0), isnan(_11675)), level(0.0)).x;
    float3 _11686 = float3(_4466, _4476, _4454);
    float _4482 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11686, float3(0.0), isnan(_11686)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11686, float3(0.0), isnan(_11686)), level(0.0)).x;
    float3 _11697 = float3(_4466, _4476, _4454);
    float4 _4485 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11697, float3(0.0), isnan(_11697)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11697, float3(0.0), isnan(_11697)), level(0.0)).xyzw;
    float _4487 = _4485.x;
    float _4489 = _4485.y;
    float _4491 = _4485.z;
    float _4493 = _4485.w;
    float _4495 = -_4456;
    float _4497 = fma(_4478, _4495, 1.0);
    float2 _11718 = float2(_4497, _4474);
    float3 _4501 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11718, float2(0.0), isnan(_11718)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11718, float2(0.0), isnan(_11718)), level(0.0)).xyz;
    float _4503 = _4501.x;
    float _4505 = _4501.y;
    float _4507 = _4501.z;
    float _4509 = _3598 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4511 = _3598 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4513 = _4366 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4515 = in.m_92.x;
    float _4517 = fma(_3602, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4509);
    float _4519 = fma(_3602, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4511);
    float _4521 = fma(_4378, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4513);
    float _4523 = fma(_3630, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4517);
    float _4525 = fma(_3630, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4519);
    float _4527 = _4523 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4529 = _4525 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4531 = 1.0 / _4527;
    float _4533 = _4529 + _4527;
    float _4535 = _4398 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4537 = _4533 * _4531;
    float _4539 = _4537 * 0.5;
    float _4541 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4543 = fma(_4539, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4541);
    float _4545 = 1.0 / _4543;
    float _4547 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4549 = _4545 * _4547;
    float _4551 = abs(_4549);
    float _4553 = log2(_4551);
    bool _4555 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4557 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4559 = _4555 || _4557;
    bool _4561 = isnan(0.5);
    bool _4563 = _4559 || _4561;
    float _4565 = _4553 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4567 = exp2(_4565);
    float _4569 = fma(_4567, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4571 = precise::clamp(_4569, 0.0, 1.0);
    float _4573 = fma(_4372, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4521);
    float _4575 = _4448 + _4416;
    float _4577 = fma(_4571, -2.0, 3.0);
    float _4579 = _4571 * _4571;
    float _4581 = exp2(_4535);
    float _4583 = fma(_4408, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4573);
    float _4585 = _4575 * 0.5;
    float _4587 = _4579 * _4577;
    bool _4589 = _4549 <= 8000.0;
    bool _4591 = isnan(_4549);
    bool _4593 = _4589 || _4591;
    bool _4595 = isnan(8000.0);
    bool _4597 = _4593 || _4595;
    float _4599 = float(_4597);
    float _4601 = _4583 + _4416;
    float _4603 = -_4587;
    float _4605 = _4603 + 1.0;
    float _4607 = _4601 * 0.5;
    float _4609 = fma(_4605, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4587);
    float _4611 = _4416 * 0.5;
    float _4613 = _4605;
    float _4615 = _4416;
    float _4617 = _4583;
    float _4619 = _4464;
    if (_4563)
    {
        _4613 = 1.0;
    }
    float _4621 = _4613;
    float _4623 = fma(_4464, -0.5, _4611);
    float _4625 = _4621;
    float _4627 = _4489;
    if (!_4563)
    {
        float _4629 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4631 = _4629 * 0.15915493667125701904296875;
        float _4633 = _4631 * 6.283185482025146484375;
        float _4635 = cos(_4633);
        float _4637 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4639 = _4637 * 0.15915493667125701904296875;
        float _4641 = _4631 * 6.283185482025146484375;
        float _4643 = sin(_4641);
        float _4645 = 1.0 / _4635;
        float _4647 = _4639 * 6.283185482025146484375;
        float _4649 = cos(_4647);
        float _4651 = _4643 * _4645;
        float _4653 = _4639 * 6.283185482025146484375;
        float _4655 = sin(_4653);
        float _4657 = _4649 * _4651;
        float _4659 = 1.0 / _4657;
        float _4661 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4663 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4661;
        float _4665 = 1.0 / _4663;
        float _4667 = _4655 * _4659;
        float _4669 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4671 = fma(_4549, _4667, _4669);
        float _4673 = _4671 * _4665;
        float _4675 = precise::clamp(_4673, 0.0, 1.0);
        _4625 = _4675;
    }
    float _4677 = _4625;
    float _4679 = _4599 * _4609;
    float _4681 = -_4581;
    float _4683 = _4681 + 1.0;
    float _4685 = -_4480;
    float _4687 = _4685 + 1.0;
    float _4689 = _4679 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4691 = _4683 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _4448;
    out.gl_Position.y = _4464;
    out.gl_Position.z = _4583;
    out.gl_Position.w = _4416;
    bool _4693 = _4182 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4695 = isnan(_4182);
    bool _4697 = _4693 || _4695;
    bool _4699 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4701 = _4697 || _4699;
    float _4703 = _4687 * _4689;
    float _4705 = precise::clamp(_4703, 0.0, 1.0);
    float _4707 = _4691 * _4482;
    out.m_94.x = _4585;
    out.m_94.y = _4623;
    out.m_94.z = _4607;
    out.m_94.w = _4416;
    float _4709 = -_4705;
    float _4711 = fma(_4709, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4713 = _4493 * _4707;
    float _4715 = _4507 * _4707;
    float _4717 = _4711 * _4515;
    float _4719 = -_4691;
    float _4721 = _4719 + 1.0;
    float _4723 = _4717;
    float _4725 = _4721;
    if (!_4701)
    {
        _4615 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4727 = _4615;
    float _4729 = _4727;
    float _4731 = _4727;
    if (!_4701)
    {
        _4617 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4733 = _4617;
    float _4735 = fma(_4503, _4713, _4487);
    float _4737 = fma(_4505, _4713, _4489);
    float _4739 = _4493 * _4721;
    float _4741 = _4717 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4743 = fma(_4493, _4715, _4491);
    float _4745 = _4733;
    float _4747 = _4733;
    if (!_4701)
    {
        _4627 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4749 = _4627;
    float _4751 = _4677 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4753 = _4749;
    float _4755 = _4749;
    if (!_4701)
    {
        _4723 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4757 = _4723;
    out.m_96.x = _4741;
    float _4759 = _4757;
    float _4761 = _4757;
    if (!_4701)
    {
        _4619 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4763 = _4619;
    float _4765 = _4763;
    float _4767 = _4763;
    if (!_4701)
    {
        _4725 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4769 = _4725;
    out.m_98.x = _4735;
    out.m_98.y = _4737;
    out.m_98.z = _4743;
    out.m_98.w = _4739;
    bool _4771 = !_4701;
    float _4773 = _4769;
    float _4775 = _4769;
    if (!_4771)
    {
        bool _4777 = _4182 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4779 = isnan(_4182);
        bool _4781 = _4777 || _4779;
        bool _4783 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4785 = _4781 || _4783;
        if (!_4785)
        {
            float _4787 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4789 = _4182 + _4787;
            float _4791 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4793 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4791;
            float _4795 = 1.0 / _4793;
            float _4797 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4799 = _4797 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4801 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4803 = _4801 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4805 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4807 = _4805 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4809 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4811 = _4809 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4813 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4815 = _4813 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4817 = _4789 * _4795;
            float _4819 = precise::clamp(_4817, 0.0, 1.0);
            float _4821 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4823 = _4821 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4825 = fma(_4819, _4799, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4827 = fma(_4819, _4823, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4829 = fma(_4819, _4803, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4831 = fma(_4819, _4807, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4833 = fma(_4819, _4811, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4835 = fma(_4819, _4815, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4761 = _4827;
            _4767 = _4833;
            _4755 = _4825;
            _4747 = _4831;
            _4731 = _4829;
            _4775 = _4835;
            _4837 = true;
        }
        else
        {
            bool _4839 = _4182 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4841 = isnan(_4182);
            bool _4843 = _4839 || _4841;
            bool _4845 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4847 = _4843 || _4845;
            if (!_4847)
            {
                _4753 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4849 = _4753;
            _4755 = _4849;
            if (!_4847)
            {
                _4759 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4851 = _4759;
            _4761 = _4851;
            if (!_4847)
            {
                _4729 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4853 = _4729;
            _4731 = _4853;
            if (!_4847)
            {
                _4745 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4855 = _4745;
            _4747 = _4855;
            if (!_4847)
            {
                _4765 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4857 = _4765;
            _4767 = _4857;
            if (!_4847)
            {
                _4773 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4859 = _4773;
            bool _4861 = !_4847;
            _4775 = _4859;
            if (!_4861)
            {
                bool _4863 = _4182 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4865 = isnan(_4182);
                bool _4867 = _4863 || _4865;
                bool _4869 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4871 = _4867 || _4869;
                if (!_4871)
                {
                    float _4873 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4875 = _4182 + _4873;
                    float _4877 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4879 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4877;
                    float _4881 = 1.0 / _4879;
                    float _4883 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4885 = _4883 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4887 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4889 = _4887 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4891 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4893 = _4891 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4895 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4897 = _4895 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4899 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4901 = _4899 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4903 = _4875 * _4881;
                    float _4905 = precise::clamp(_4903, 0.0, 1.0);
                    float _4907 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4909 = _4907 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4911 = fma(_4905, _4885, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4913 = fma(_4905, _4909, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4915 = fma(_4905, _4889, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4917 = fma(_4905, _4893, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4919 = fma(_4905, _4897, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4921 = fma(_4905, _4901, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4761 = _4913;
                    _4767 = _4919;
                    _4755 = _4911;
                    _4747 = _4917;
                    _4731 = _4915;
                    _4775 = _4921;
                    _4837 = true;
                }
                else
                {
                    _4761 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4767 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4755 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4747 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4731 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4775 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4837 = false;
    float _4923 = _4761;
    float _4925 = _4767;
    float _4927 = _4755;
    float _4929 = _4747;
    float _4931 = _4731;
    float _4933 = _4775;
    float _4935 = _4751 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4937 = fma(_4038, -0.5, 0.5);
    float _4939 = precise::clamp(_4937, 0.0, 1.0);
    float _4941 = -_4923;
    float _4943 = _4941 + _4925;
    float _4945 = -_4927;
    float _4947 = _4945 + _4929;
    out.m_100.x = 0.0;
    float _4949 = fma(_4939, _4943, _4923);
    float _4951 = -_4931;
    float _4953 = _4951 + _4933;
    float _4955 = fma(_4939, _4947, _4927);
    float _4957 = _4949 * 0.586610972881317138671875;
    bool _4959 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4961 = fma(_4939, _4953, _4931);
    out.m_55.x = _4935;
    float _4963 = fma(_4955, 0.298911988735198974609375, _4957);
    bool _4965 = _4677 > 0.0;
    bool _4967 = isnan(_4677);
    bool _4969 = _4965 || _4967;
    bool _4971 = isnan(0.0);
    bool _4973 = _4969 || _4971;
    float _4975 = fma(_4961, 0.114477999508380889892578125, _4963);
    float _4977 = -_4975;
    float _4979 = _4955 + _4977;
    float _4981 = -_4975;
    float _4983 = _4949 + _4981;
    float _4985 = -_4975;
    float _4987 = _4961 + _4985;
    float _4989 = fma(_4979, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4975);
    float _4991 = fma(_4983, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4975);
    float _4993 = fma(_4987, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4975);
    bool _4995 = !_4959;
    if (!_4995)
    {
        float _4997 = -_4144;
        float _4999 = _4997 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5001 = -_4148;
        float _5003 = _5001 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5005 = -_4152;
        float _5007 = _5005 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5009 = _4999 * _4999;
        float _5011 = fma(_5003, _5003, _5009);
        float _5013 = fma(_5007, _5007, _5011);
        float _5015 = sqrt(_5013);
        float _5017 = rsqrt(_5013);
        float _5019 = -_5015;
        float _5021 = _5019 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5023 = _5021 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5025 = precise::clamp(_5023, 0.0, 1.0);
        float _5027 = _5003 * _5017;
        float _5029 = _4999 * _5017;
        float _5031 = abs(_5025);
        float _5033 = log2(_5031);
        float _5035 = _5007 * _5017;
        float _5037 = _5027 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5039 = _4038 * _5029;
        float _5041 = -_5029;
        float _5043 = -_5037;
        float _5045 = fma(_5041, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5043);
        float _5047 = fma(_4036, _5027, _5039);
        float _5049 = -_5035;
        float _5051 = fma(_5049, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5045);
        float _5053 = fma(_4040, _5035, _5047);
        float _5055 = precise::clamp(_5053, 0.0, 1.0);
        float _5057 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5059 = _5051 + _5057;
        float _5061 = _5033 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5063 = _5059 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5065 = precise::clamp(_5063, 0.0, 1.0);
        float _5067 = exp2(_5061);
        float _5069 = _5067 * _5065;
        float _5071 = _5055 * _5069;
        float _5073 = _5071 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5075 = _5071 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5077 = _5071 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _5073;
        out.m_100.y = _5075;
        out.m_100.z = _5077;
    }
    out.m_102.x = _4989;
    out.m_102.y = _4991;
    out.m_102.z = _4993;
    if (_4973)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_55.x = 0.0;
    float _5079 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5079;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

